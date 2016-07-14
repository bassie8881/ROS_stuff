#!/bin/sh -x

if [ -n "$DESTDIR" ] ; then
    case $DESTDIR in
        /*) # ok
            ;;
        *)
            /bin/echo "DESTDIR argument must be absolute... "
            /bin/echo "otherwise python's distutils will bork things."
            exit 1
    esac
    DESTDIR_ARG="--root=$DESTDIR"
fi

cd "/home/odroid/laser_scanner_copy/src/laser_scanner/uts_sensor_box/sensor_drivers/rosserial/rosserial_client"

# Note that PYTHONPATH is pulled from the environment to support installing
# into one location when some dependencies were installed in another
# location, #123.
/usr/bin/env \
    PYTHONPATH="/home/odroid/laser_scanner_copy/install/lib/python2.7/dist-packages:/home/odroid/laser_scanner_copy/build/lib/python2.7/dist-packages:$PYTHONPATH" \
    CATKIN_BINARY_DIR="/home/odroid/laser_scanner_copy/build" \
    "/usr/bin/python" \
    "/home/odroid/laser_scanner_copy/src/laser_scanner/uts_sensor_box/sensor_drivers/rosserial/rosserial_client/setup.py" \
    build --build-base "/home/odroid/laser_scanner_copy/build/laser_scanner/uts_sensor_box/sensor_drivers/rosserial/rosserial_client" \
    install \
    $DESTDIR_ARG \
    --install-layout=deb --prefix="/home/odroid/laser_scanner_copy/install" --install-scripts="/home/odroid/laser_scanner_copy/install/bin"
