--- STEAMODDED HEADER
--- MOD_NAME: fem's cardz
--- MOD_ID: FCARDZ
--- MOD_AUTHOR: [fem]
--- MOD_DESCRIPTION: adds silly cardz
--- BADGE_COLOR: c7638f
--- PREFIX: fcardz

----------------------------------------------
------------MOD CODE -------------------------

SMODS.Atlas ({
    key = "Cardz",
    path = "cardz.png",
    px = 71,
    py = 95
}):register()
  
SMODS.Atlas ({
  key = "modicon",
  path = "icon.png",
  px = 34,
  py = 34
}):register()
  
SMODS.Joker {
  key = 'polished',
  loc_txt = {
    name = 'Polished Joker',
    text = {
      "Gives {C:chips}+#1#{} Chips",
      "Card gains {C:chips}+#2#{} Chips",
      "per {C:attention}Stone{} card played"
    }
  },
  config = {extra = {chips = 25, plusstone = 50}},
  loc_vars = function(self, info_queue, card)
    return {vars = {card.ability.extra.chips, card.ability.extra.plusstone}}
  end,
  rarity = 2,
  unlocked = true,
  discovered = true,
  atlas = 'Cardz',
  pos = {x = 0, y = 0},
  cost = 5,
  calculate = function(self, card, context)
    if context.joker_main then
      return {
        chip_mod = card.ability.extra.chips,
        message = localize {type = 'variable', key = 'a_chips', vars = {card.ability.extra.chips}}
      }
    end
    if context.individual and context.cardarea == G.play then
      if context.other_card.ability.name == "Stone Card" then
        card.ability.extra.chips = card.ability.extra.chips + card.ability.extra.plusstone
        return {
          extra = { focus = card, message = localize ('k_upgrade_ex') },
          card = card,
          colour = G.C.CHIPS,
        }
      end
    end
  end
}