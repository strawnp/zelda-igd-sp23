GAME_OBJECT_DEFS = {
    ['switch'] = {
        type = 'switch',
        texture = 'switches',
        frame = 2,
        width = 16,
        height = 16,
        solid = false,
        defaultState = 'unpressed',
        states = {
            ['unpressed'] = {
                frame = 2
            },
            ['pressed'] = {
                frame = 1
            }
        }
    },
    ['water'] = {
        type = 'water',
        texture = 'water-tiles',
        width = 16,
        frame = 661,
        height = 16,
        solid = true,
        defaultState = 'water1',
        states = {
            ['water1'] = {
                frame = 661
            }
        }

    },

    ['pot'] = {
        type = 'pot',
        texture = 'pots',
        frame = 14,
        width = 16,
        height = 16,
        solid = true,
        defaultState = 'pot1',
        states = {
            ['pot1'] = {
                frame = 14
            }
        }
    },
    ['heart'] = {
        type = 'heart',
        texture = 'hearts',
        frame = 5,
        width = 16,
        height = 16,
        solid = false,
        defaultState = 'heartGround',
        states = {
          ['heartGround'] = {
            frame = 5
          }
        }
    }
}
