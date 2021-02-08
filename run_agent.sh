#!/bin/bash
export CARLA_ROOT=/home/nazeri/carla_sim          # change to where you installed CARLA
export PYTHONPATH=$PYTHONPATH:$CARLA_ROOT/PythonAPI/carla
export PYTHONPATH=$PYTHONPATH:$CARLA_ROOT/PythonAPI/carla/dist/carla-0.9.10-py3.7-linux-x86_64.egg
export PYTHONPATH=$PYTHONPATH:leaderboard
export PYTHONPATH=$PYTHONPATH:leaderboard/team_code
export PYTHONPATH=$PYTHONPATH:scenario_runner


export PORT=2000                                                    # change to port that CARLA is running on
export ROUTES=leaderboard/data/routes_training/route_00.xml         # change to desired route
export TEAM_AGENT=auto_pilot.py                                     # no need to change
export TEAM_CONFIG=data                                             # change path to save data



echo "Done."
