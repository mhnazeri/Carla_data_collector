#!/bin/bash                                                                                                
export CARLA_ROOT=/home/nazeri/carla_sim          # change to where you installed CARLA                    
export PYTHONPATH=$PYTHONPATH:$CARLA_ROOT/PythonAPI/carla                                                  
export PYTHONPATH=$PYTHONPATH:$CARLA_ROOT/PythonAPI/carla/dist/carla-0.9.10-py3.7-linux-x86_64.egg         
export PYTHONPATH=$PYTHONPATH:$CARLA_ROOT/PythonAPI/carla/agents                                           
export PYTHONPATH=$PYTHONPATH:leaderboard                                                                  
export PYTHONPATH=$PYTHONPATH:leaderboard/team_code                                                        
export PYTHONPATH=$PYTHONPATH:scenario_runner                                                              
                                                                                                           
                                                                                                           
export PORT=2000                                                    # change to port that CARLA is running                                                                                                     
export ROUTES=leaderboard/data/routes_training/route_00.xml         # change to desired route              
export TEAM_AGENT=auto_pilot.py                                     # no need to change                    
export TEAM_CONFIG=data                                             # change path to save data             
                                                                                                           
                                                                                                           
if [ -d "$TEAM_CONFIG" ]; then                                                                             
        CHECKPOINT_ENDPOINT="$TEAM_CONFIG/$(basename $ROUTES .xml).txt"                                    
    else                                                                                                   
            CHECKPOINT_ENDPOINT="$(dirname $TEAM_CONFIG)/$(basename $ROUTES .xml).txt"                     
fi                                                                                                         
                                                                                                           
python3 leaderboard/leaderboard/leaderboard_evaluator.py \
--track=SENSORS \
--scenarios=leaderboard/data/all_towns_traffic_scenarios_public.json  \
--agent=${TEAM_AGENT} \
--agent-config=${TEAM_CONFIG} \
--routes=${ROUTES} \
--checkpoint=${CHECKPOINT_ENDPOINT} \
--port=${PORT}

echo "Done."
