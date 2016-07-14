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

cd "/home/odroid/git_laser_scanner/src/laser_scanner/uts_sensor_box/sensor_drivers/rosserial/rosserial_python"

# Note that PYTHONPATH is pulled from the environment to support installing
# into one location when some dependencies were installed in another
# location, #123.
/usr/bin/env \
    PYTHONPATH="/home/odroid/git_laser_scanner/install/lib/python2.7/dist-packages:/home/odroid/git_laser_scanner/build/lib/python2.7/dist-packages:$PYTHONPATH" \
    CATKIN_BINARY_DIR="/home/odroid/git_laser_scanner/build" \
    "/usr/bin/python" \
    "/home/odroid/git_laser_scanner/src/laser_scanner/uts_sensor_box/sensor_drivers/rosserial/rosserial_python/setup.py" \
    build --build-base "/home/odroid/git_laser_scanner/build/laser_scanner/uts_sensor_box/sensor_drivers/rosserial/rosserial_python" \
    install \
    $DESTDIR_ARG \
    --install-layout=deb --prefix="/home/odroid/git_laser_scanner/install" --install-scripts="/home/odroid/git_laser_scanner/install/bin"
