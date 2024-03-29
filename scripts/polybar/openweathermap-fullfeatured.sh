#!/bin/sh

icon_color="#98c379"
get_icon() {
    case $1 in
        # # Icons for nerd fonts (nf-fae) (I manually added this)
        # 01d) icon="";; # clear sky
        # 01n) icon="";;
        # 02d) icon="";; # few clouds
        # 02n) icon="";;
        # 03*) icon="";; # scattered clouds
        # 04*) icon="";; # broken clouds
        # # 09*) icon="";; # shower rain
        # 09d) icon="";;
        # 09n) icon="";;
        # # 10*) icon="";; # rain
        # 10d) icon="";;
        # 10n) icon="";;
        # # 11*) icon="";; # thunderstorm
        # 11d) icon="";;
        # 11n) icon="";;
        # # 13n) icon="";; # snow 
        # 13d) icon="";;
        # 13n) icon="";;
        # # 50*) icon="";; # mist / fog
        # 50d) icon="";;
        # 50n) icon="";;
        # *) icon="";

        # Icons for emojis
        01d) icon="☀️";; # clear sky
        01n) icon="🌙";;
        02d) icon="⛅";; # few clouds
        02n) icon="☁️";;
        03*) icon="☁️";; # scattered clouds
        04*) icon="☁️";; # broken clouds
        09*) icon="🌧️";; # shower rain
        10*) icon="🌧️";; # rain
        11*) icon="⛈️";; # thunderstorm
        13n) icon="🌨️";; # snow ❄️
        50*) icon="🌫️";; # mist / fog
        *) icon="";

    esac
    # echo $icon
    echo "%{F$icon_color}$icon%{F-}"
}

get_duration() {

    osname=$(uname -s)

    case $osname in
        *BSD) date -r "$1" -u +%H:%M;;
        *) date --date="@$1" -u +%H:%M;;
    esac

}

# Import $KEY and $CITY
. "polyweather-var.sh"
UNITS="metric"
SYMBOL="°C"

API="https://api.openweathermap.org/data/2.5"

if [ -n "$CITY" ]; then
    if [ "$CITY" -eq "$CITY" ] 2>/dev/null; then
        CITY_PARAM="id=$CITY"
    else
        CITY_PARAM="q=$CITY"
    fi

    current=$(curl -sf "$API/weather?appid=$KEY&$CITY_PARAM&units=$UNITS")
    forecast=$(curl -sf "$API/forecast?appid=$KEY&$CITY_PARAM&units=$UNITS&cnt=1")
else
    location=$(curl -sf "https://location.services.mozilla.com/v1/geolocate?key=geoclue")

    if [ -n "$location" ]; then
        location_lat="$(echo "$location" | jq '.location.lat')"
        location_lon="$(echo "$location" | jq '.location.lng')"

        current=$(curl -sf "$API/weather?appid=$KEY&lat=$location_lat&lon=$location_lon&units=$UNITS")
        forecast=$(curl -sf "$API/forecast?appid=$KEY&lat=$location_lat&lon=$location_lon&units=$UNITS&cnt=1")
    fi
fi

if [ -n "$current" ] && [ -n "$forecast" ]; then
    current_temp=$(echo "$current" | jq ".main.temp" | cut -d "." -f 1)
    current_icon=$(echo "$current" | jq -r ".weather[0].icon")

    forecast_temp=$(echo "$forecast" | jq ".list[].main.temp" | cut -d "." -f 1)
    forecast_icon=$(echo "$forecast" | jq -r ".list[].weather[0].icon")

    if [ "$current_temp" -gt "$forecast_temp" ]; then
        trend="%{F$icon_color}󰜮%{F-}"
    elif [ "$current_temp" -lt "$forecast_temp" ]; then
        trend="%{F$icon_color}󰜷%{F-}"
    else
        trend="%{F$icon_color}%{F-}"
    fi

    pop=$(echo "$forecast" | jq ".list[].pop")
    pop=$(echo "$pop * 100" | bc | cut -d "." -f 1)
    pop_display="🌧️ $pop%"

    sun_rise=$(echo "$current" | jq ".sys.sunrise")
    sun_set=$(echo "$current" | jq ".sys.sunset")
    now=$(date +%s)

    # # Nerd font icons sunrise and sunset
    # if [ "$sun_rise" -gt "$now" ]; then
    #     daytime="  $(get_duration "$((sun_rise-now))")"
    # elif [ "$sun_set" -gt "$now" ]; then
    #     daytime="滋 $(get_duration "$((sun_set-now))")"
    # else
    #     daytime="  $(get_duration "$((sun_rise-now))")"
    # fi

    # Emoji sunrise and sunset
    if [ "$sun_rise" -gt "$now" ]; then
        daytime="🌅 $(get_duration "$((sun_rise-now))")"
    elif [ "$sun_set" -gt "$now" ]; then
        daytime="🌇 $(get_duration "$((sun_set-now))")"
    else
        daytime="🌅 $(get_duration "$((sun_rise-now))")"
    fi

    # # Full
    # echo "$(get_icon "$current_icon") $current_temp$SYMBOL $trend $(get_icon "$forecast_icon") $forecast_temp$SYMBOL $pop $daytime"
    # No weather temp forecast
    if [ "$pop" -lt 10 ] || [ "$pop" -gt 90 ]; then
        echo "$(get_icon "\
$current_icon") $current_temp$SYMBOL \
$trend \
$(get_icon "$forecast_icon") $forecast_temp$SYMBOL $daytime"
    else
        echo "\
$(get_icon "$current_icon") $current_temp$SYMBOL \
$trend \
$pop_display $daytime"
    fi
fi
