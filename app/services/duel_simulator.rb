class DuelSimulator
  BOARD_MIN = 4.0
  BOARD_MAX = 96.0
  MAX_ROUNDS = 220
  STARTING_POSITIONS = [
    { x: 24.0, y: 30.0, vx: -5.2, vy: -4.1 },
    { x: 76.0, y: 68.0, vx: 5.4, vy: 4.0 }
  ].freeze

  ROSTER = [
    {
      key: "kolyan",
      name: "Kolyan",
      aka: "Создатель",
      role: "Стратег темпу",
      style: "розумний темповий контроль",
      basic_attack: "В Мету",
      basic_text: "Точний базовий постріл. Якщо ціль має Marked або Read, удар стає сильнішим.",
      basic_effect: "kolyan-basic",
      skill_name: "Правка Реальності",
      skill_text: "Сильний темповий удар за 15 MP. Б'є на 14-20, інколи ще +5 і накладає Marked на ціль.",
      skill_effect: "kolyan-skill",
      perk: "Я Казав",
      perk_effect: "kolyan-perk",
      perk_text: "Коли суперник тисне скіл, Колян накладає Read. Удар по Read дає +4 шкоди і +3 MP, по Marked дає ще +5.",
      flavor: "Створює хід гри ще до того, як інші зрозуміли патч.",
      theme_key: "kolyan",
      theme_label: "Macro / Tempo",
      hp: 100,
      mp: 55,
      speed: 9.5,
      attack_cooldown: 4,
      skill_cooldown: 9,
      skill_chance: 0.27,
      skill_cost: 15,
      skill_min: 14,
      skill_max: 20,
      skill_bonus_chance: 0.28,
      skill_bonus_damage: 5,
      basic_min: 5,
      basic_max: 10,
      perk_type: "called_it"
    },
    {
      key: "yura",
      name: "Юра",
      aka: "скілл",
      role: "Руйнівний пік",
      style: "вибуховий тиск",
      basic_attack: "Розйоб",
      basic_text: "Важкий базовий удар. Має шанс на крит, а кріт розігріває наступний хід.",
      basic_effect: "yura-basic",
      skill_name: "Поза Межами Всесвіту",
      skill_text: "Потужний burst-скіл за 15 MP. Завдає 15-21 шкоди, інколи ще +8 і вмикає Жор на наступні 2 атаки.",
      skill_effect: "yura-skill",
      perk: "Сміття Йобане",
      perk_effect: "yura-perk",
      perk_text: "Після скіла входить у Жор: наступні 2 атаки відхілюють 50% від завданої шкоди.",
      flavor: "Коли заходить у файт, тонкість виходить із чату.",
      theme_key: "yura",
      theme_label: "Burst / Pressure",
      hp: 106,
      mp: 45,
      speed: 9.8,
      attack_cooldown: 4,
      skill_cooldown: 8,
      skill_chance: 0.31,
      skill_cost: 15,
      skill_min: 15,
      skill_max: 21,
      skill_bonus_chance: 0.28,
      skill_bonus_damage: 8,
      basic_min: 5,
      basic_max: 10,
      critical_chance: 0.24,
      critical_bonus: 5,
      perk_type: "vamp"
    },
    {
      key: "yaroslav",
      name: "Yaroslav",
      aka: "Ярік Глімеркейп",
      role: "Майстер таймінгу",
      style: "швидкий, чистий, таймінговий",
      basic_attack: "Гоу",
      basic_text: "Швидка легка атака. Після виходу з Глімера перший удар стає сильнішим.",
      basic_effect: "yaroslav-basic",
      skill_name: "Підловив",
      skill_text: "Точний таймінговий скіл за 15 MP. Б'є на 12-18, інколи добирає ще +5 і переводить Яріка в Глімер на 2 раунди.",
      skill_effect: "yaroslav-skill",
      perk: "Я Реді",
      perk_effect: "yaroslav-perk",
      perk_text: "У Глімері Ярік зникає з арени, хілиться на 6 HP за раунд, а після повернення отримує +4 до наступної атаки.",
      flavor: "Появляється в таймінг, натискає чисто, зникає красиво.",
      theme_key: "yaroslav",
      theme_label: "Timing / Utility",
      hp: 96,
      mp: 60,
      speed: 12.0,
      attack_cooldown: 3,
      skill_cooldown: 7,
      skill_chance: 0.31,
      skill_cost: 15,
      skill_min: 12,
      skill_max: 18,
      skill_bonus_chance: 0.26,
      skill_bonus_damage: 5,
      basic_min: 4,
      basic_max: 9,
      perk_type: "ready"
    },
    {
      key: "denchik",
      name: "Denchik",
      aka: "Попуск",
      role: "хаотичний пресинг",
      style: "рваний, різкий, непередбачуваний",
      basic_attack: "А Бля",
      basic_text: "Нервовий базовий удар. Кожен Розгін робить його сильнішим.",
      basic_effect: "denchik-basic",
      skill_name: "На Нервах",
      skill_text: "Рваний агресивний скіл за 15 MP. Б'є на 13-18 і масштабиться від накопиченого Розгону.",
      skill_effect: "denchik-skill",
      perk: "Дайте Пошпілить",
      perk_effect: "denchik-perk",
      perk_text: "Кожен обмін, де Денчик б'є або отримує удар, дає Розгін: +0.35 speed і +1 шкоди за стак, до 6.",
      flavor: "Коли вмикається, зупинити темп уже важко.",
      theme_key: "denchik",
      theme_label: "Chaos / Pressure",
      hp: 98,
      mp: 50,
      speed: 11.1,
      attack_cooldown: 4,
      skill_cooldown: 8,
      skill_chance: 0.3,
      skill_cost: 15,
      skill_min: 13,
      skill_max: 18,
      skill_bonus_chance: 0.32,
      skill_bonus_damage: 5,
      basic_min: 5,
      basic_max: 10,
      perk_type: "ramp"
    },
    {
      key: "fredy",
      name: "Фреди",
      aka: "Рандом",
      role: "неочікуваний кут",
      style: "спокійний, гнучкий, незручний для суперника",
      basic_attack: "Ну Шо",
      basic_text: "Рівний базовий poke. Поки Шлейф активний, суперник ще й ризикує врізатись у пастку.",
      basic_effect: "fredy-basic",
      skill_name: "Окрема Позиція",
      skill_text: "Кутовий скіл за 15 MP. Дає 12-17 шкоди і вмикає Шлейф на 2 раунди.",
      skill_effect: "fredy-skill",
      perk: "Не Чекав?",
      perk_effect: "fredy-perk",
      perk_text: "Після скіла залишає за собою Шлейф. Якщо суперник перетинає його, отримує 5 шкоди.",
      flavor: "Поки всі думають, що він просто тут, він уже зайшов під правильним кутом.",
      theme_key: "fredy",
      theme_label: "Adaptive / Angle",
      hp: 100,
      mp: 55,
      speed: 10.2,
      attack_cooldown: 4,
      skill_cooldown: 8,
      skill_chance: 0.42,
      skill_cost: 15,
      skill_min: 12,
      skill_max: 17,
      skill_bonus_chance: 0.25,
      skill_bonus_damage: 5,
      basic_min: 5,
      basic_max: 9,
      perk_type: "trail"
    }
  ].freeze

  def self.roster
    ROSTER.map(&:dup)
  end

  def self.initial_fighters(selected_keys = default_selected_keys)
    keys = normalize_selected_keys(selected_keys)

    keys.each_with_index.map do |key, index|
      profile = roster.find { |fighter| fighter[:key] == key }
      setup = STARTING_POSITIONS[index]

      profile.merge(
        x: setup[:x],
        y: setup[:y],
        vx: setup[:vx],
        vy: setup[:vy],
        attack_cd: profile[:attack_cooldown],
        skill_cd: 0,
        last_action: nil,
        glimmer_rounds: 0,
        glimmer_return_ready: false,
        vamp_attacks: 0,
        ramp_stacks: 0,
        base_speed: profile[:speed],
        trail_rounds: 0,
        trail_segments: [],
        marked_by_kolyan: false,
        read_by_kolyan: false
      )
    end
  end

  def self.default_selected_keys
    %w[kolyan yura]
  end

  def self.normalize_selected_keys(selected_keys)
    keys = Array(selected_keys).map(&:to_s).uniq.select { |key| ROSTER.any? { |fighter| fighter[:key] == key } }
    keys = default_selected_keys if keys.length < 2
    keys.first(2)
  end

  def initialize(selected_keys: nil)
    @selected_keys = self.class.normalize_selected_keys(selected_keys || self.class.default_selected_keys)
  end

  def simulate
    @state = self.class.initial_fighters(@selected_keys)
    @events = []
    @round = 0

    while duel_active? && @round < MAX_ROUNDS
      @round += 1
      play_round
    end

    {
      rounds: @round,
      winner: winner&.slice(:key, :name, :aka),
      events: @events,
      final_state: snapshot_state
    }
  end

  private

  def play_round
    left = @state[0]
    right = @state[1]
    return unless left && right
    return if left[:hp] <= 0 || right[:hp] <= 0

    drift_fighter(left)
    drift_fighter(right)
    cooldown_step(left)
    cooldown_step(right)
    resolve_status_upkeep(left)
    resolve_status_upkeep(right)
    resolve_trail_collisions(left, right)

    add_event(kind: "drift", accent: nil, animate: nil, message: nil)
    return unless duel_active?

    resolve_attack(left, right)
    return unless duel_active?

    resolve_attack(right, left)
  end

  def resolve_attack(attacker, defender)
    return if attacker[:hp] <= 0 || defender[:hp] <= 0
    return if attacker[:attack_cd] > 0
    return if attacker[:glimmer_rounds].to_i.positive?

    animate = { kind: "attack", actor: attacker[:key], target: defender[:key], effects: [] }

    if defender[:glimmer_rounds].to_i.positive?
      add_event(
        kind: "perk",
        accent: defender[:key],
        animate: animate.merge(
          result: "block",
          effects: [
            effect_payload(attacker, defender, attacker[:basic_effect], role: "basic"),
            effect_payload(defender, attacker, "yaroslav-glimmer-tick", role: "buff")
          ]
        ),
        message: "#{attacker[:aka]} влітає в порожнечу, але «#{defender[:perk]}» не дає зачепити ціль."
      )
      return
    end
    use_skill = attacker[:skill_cd] <= 0 && attacker[:mp] >= attacker[:skill_cost] && rand < attacker[:skill_chance]

    if use_skill
      resolve_skill(attacker, defender, animate)
    else
      resolve_basic_attack(attacker, defender, animate)
    end
  end

  def resolve_skill(attacker, defender, animate)
    attacker[:mp] -= attacker[:skill_cost]
    attacker[:attack_cd] = attacker[:attack_cooldown] + 1
    attacker[:skill_cd] = attacker[:skill_cooldown]

    total = attacker[:skill_min] + rand(attacker[:skill_max] - attacker[:skill_min] + 1)
    perk_notes = []
    perk_triggered = false

    if rand < attacker[:skill_bonus_chance]
      total += attacker[:skill_bonus_damage]
      perk_notes << skill_bonus_note(attacker)
    end

    total, perk_notes, perk_triggered = apply_attacker_perk(attacker, defender, total, perk_notes, :skill)
    total, blocked = apply_defender_perk(attacker, defender, total, animate)
    perk_notes, perk_triggered = apply_post_action_perk(attacker, :skill, perk_notes, perk_triggered)

    defender[:hp] -= total
    attacker[:mp] = clamp(attacker[:mp] + skill_refund(attacker), 0, 100)
    clamp_fighters
    perk_notes, perk_triggered = apply_on_hit_perks(attacker, defender, total, animate, perk_notes, perk_triggered)
    apply_skill_follow_up(attacker, defender)

    animate[:effects] << effect_payload(attacker, defender, attacker[:skill_effect], role: "skill")
    animate[:effects] << effect_payload(attacker, defender, attacker[:perk_effect], role: "perk") if perk_triggered

    message = if blocked
      "#{defender[:aka]} пом'якшує частину вхідного скіла, але «#{attacker[:skill_name]}» все одно проходить на #{total}."
    else
      "#{attacker[:aka]} використовує «#{attacker[:skill_name]}» на #{total} шкоди."
    end

    add_event(
      kind: "attack",
      accent: attacker[:key],
      animate: animate.merge(result: blocked ? "block" : "hit", attack_type: "skill"),
      message: "#{message}#{join_notes(perk_notes)}"
    )

    attacker[:last_action] = "skill"
    defender[:last_action] ||= "drift"
  end

  def resolve_basic_attack(attacker, defender, animate)
    attacker[:attack_cd] = attacker[:attack_cooldown]
    total = attacker[:basic_min] + rand(attacker[:basic_max] - attacker[:basic_min] + 1)
    perk_notes = []
    blocked = false
    perk_triggered = false
    critical_triggered = false

    if attacker[:critical_chance].to_f.positive? && rand < attacker[:critical_chance]
      total += attacker[:critical_bonus]
      perk_notes << "«#{attacker[:perk]}» додає ще #{attacker[:critical_bonus]}."
      critical_triggered = true
    end

    total, perk_notes, perk_triggered = apply_attacker_perk(attacker, defender, total, perk_notes, :basic, perk_triggered)
    total, blocked = apply_defender_perk(attacker, defender, total, animate)
    perk_notes, perk_triggered = apply_post_action_perk(attacker, :basic, perk_notes, perk_triggered, critical: critical_triggered)

    defender[:hp] -= total
    attacker[:mp] = clamp(attacker[:mp] + 4, 0, 100)
    clamp_fighters
    perk_notes, perk_triggered = apply_on_hit_perks(attacker, defender, total, animate, perk_notes, perk_triggered)

    animate[:effects] << effect_payload(attacker, defender, attacker[:basic_effect], role: "basic")
    animate[:effects] << effect_payload(attacker, defender, attacker[:perk_effect], role: "perk") if perk_triggered

    message = if blocked
      "#{defender[:aka]} блокує частину удару, але «#{attacker[:basic_attack]}» все одно проходить на #{total}."
    else
      "#{attacker[:aka]} б'є «#{attacker[:basic_attack]}» на #{total} шкоди."
    end

    add_event(
      kind: "attack",
      accent: attacker[:key],
      animate: animate.merge(result: blocked ? "block" : "hit", attack_type: "basic"),
      message: "#{message}#{join_notes(perk_notes)}"
    )

    attacker[:last_action] = "basic"
    defender[:last_action] ||= "drift"
  end

  def apply_attacker_perk(attacker, defender, damage, notes, attack_type, triggered = false)
    case attacker[:perk_type]
    when "called_it"
      if defender[:read_by_kolyan]
        damage += 4
        defender[:read_by_kolyan] = false
        attacker[:mp] = clamp(attacker[:mp] + 3, 0, 100)
        notes << "«#{attacker[:perk]}» читає момент і додає 4 шкоди та 3 MP."
        triggered = true
      end

      if defender[:marked_by_kolyan]
        damage += 5
        defender[:marked_by_kolyan] = false
        notes << "Marked спрацьовує і додає ще 5 шкоди."
        triggered = true
      end
    when "ready"
      if attacker[:glimmer_return_ready]
        damage += 4
        attacker[:glimmer_return_ready] = false
        notes << "Повернення з «#{attacker[:perk]}» дає +4 шкоди."
        triggered = true
      end
    when "ramp"
      if attacker[:ramp_stacks].positive?
        damage += attacker[:ramp_stacks]
        notes << "«#{attacker[:perk]}» дає +#{attacker[:ramp_stacks]} шкоди від Розгону."
      end
    end

    [damage, notes, triggered]
  end

  def apply_defender_perk(attacker, defender, damage, animate)
    blocked = false

    if defender[:block_chance].to_f.positive? && rand < defender[:block_chance]
      damage = [4, damage - defender.fetch(:block_reduction, 5)].max
      defender[:mp] = clamp(defender[:mp] + defender[:bonus_mana_on_block], 0, 100)
      blocked = true
      add_event(
        kind: "perk",
        accent: defender[:key],
        animate: animate.merge(
          result: "block",
          effects: [effect_payload(defender, attacker, defender[:perk_effect], role: "perk")]
        ),
        message: "«#{defender[:perk]}» пом'якшує удар і повертає #{defender[:bonus_mana_on_block]} MP."
      )
    end

    [damage, blocked]
  end

  def apply_post_action_perk(attacker, attack_type, notes, triggered, critical: false)
    case attacker[:perk_type]
    when "ready"
      if attack_type == :skill
        attacker[:glimmer_rounds] = 2
        attacker[:glimmer_return_ready] = false
        notes << "«#{attacker[:perk]}» переводить Яріка в Глімер на 2 раунди."
        triggered = true
        add_event(
          kind: "perk",
          accent: attacker[:key],
          animate: {
            kind: "status",
            actor: attacker[:key],
            target: attacker[:key],
            result: "hit",
            effects: [effect_payload(attacker, attacker, "yaroslav-glimmer-on", role: "buff")]
          },
          message: "#{attacker[:aka]} зникає в «#{attacker[:perk]}»."
        )
      end
    when "vamp"
      if attack_type == :skill
        attacker[:vamp_attacks] = 2
        notes << "«#{attacker[:perk]}» вмикає Жор на 2 атаки."
        triggered = true
        add_event(
          kind: "perk",
          accent: attacker[:key],
          animate: {
            kind: "status",
            actor: attacker[:key],
            target: attacker[:key],
            result: "hit",
            effects: [effect_payload(attacker, attacker, "yura-vamp-on", role: "buff")]
          },
          message: "#{attacker[:aka]} входить у Жор."
        )
      end
    when "trail"
      if attack_type == :skill
        attacker[:trail_rounds] = 3
        notes << "«#{attacker[:perk]}» вмикає Шлейф на 3 раунди."
        triggered = true
        add_event(
          kind: "perk",
          accent: attacker[:key],
          animate: {
            kind: "status",
            actor: attacker[:key],
            target: attacker[:key],
            result: "hit",
            effects: [effect_payload(attacker, attacker, "fredy-trail-on", role: "buff")]
          },
          message: "#{attacker[:aka]} залишає за собою Шлейф."
        )
      end
    end

    [notes, triggered]
  end

  def apply_skill_follow_up(attacker, defender)
    if attacker[:key] == "kolyan"
      defender[:marked_by_kolyan] = true
      add_event(
        kind: "perk",
        accent: attacker[:key],
        animate: {
          kind: "status",
          actor: attacker[:key],
          target: defender[:key],
          result: "hit",
          effects: [effect_payload(attacker, defender, "kolyan-mark", role: "debuff")]
        },
        message: "«#{attacker[:skill_name]}» накладає Marked на #{defender[:aka]}."
      )
    end

    if defender[:perk_type] == "called_it"
      attacker[:read_by_kolyan] = true
      add_event(
        kind: "perk",
        accent: defender[:key],
        animate: {
          kind: "status",
          actor: defender[:key],
          target: attacker[:key],
          result: "hit",
          effects: [effect_payload(defender, attacker, "kolyan-read", role: "debuff")]
        },
        message: "«#{defender[:perk]}» читає скіл і накладає Read на #{attacker[:aka]}."
      )
    end
  end

  def resolve_status_upkeep(fighter)
    return unless fighter[:glimmer_rounds].to_i.positive?

    fighter[:hp] = clamp(fighter[:hp] + 6, 0, 100)
    fighter[:glimmer_rounds] -= 1

    add_event(
      kind: "perk",
      accent: fighter[:key],
      animate: {
        kind: "status",
        actor: fighter[:key],
        target: fighter[:key],
        result: "hit",
        effects: [effect_payload(fighter, fighter, "yaroslav-glimmer-tick", role: "buff")]
      },
      message: "«#{fighter[:perk]}» хілить #{fighter[:aka]} на 6 HP."
    )

    if fighter[:glimmer_rounds].zero?
      fighter[:glimmer_return_ready] = true
      add_event(
        kind: "perk",
        accent: fighter[:key],
        animate: {
          kind: "status",
          actor: fighter[:key],
          target: fighter[:key],
          result: "hit",
          effects: [effect_payload(fighter, fighter, "yaroslav-glimmer-return", role: "buff")]
        },
        message: "#{fighter[:aka]} повертається з «#{fighter[:perk]}» і готує сильніший удар."
      )
    end
  end

  def gain_ramp(fighter, other, animate, source:)
    fighter[:ramp_stacks] = [fighter[:ramp_stacks] + 1, 6].min
    fighter[:speed] = fighter[:base_speed] + (fighter[:ramp_stacks] * 0.35)
    add_event(
      kind: "perk",
      accent: fighter[:key],
      animate: animate.merge(
        result: "hit",
        effects: [effect_payload(fighter, other, "denchik-ramp", role: "perk")]
      ),
      message: "«#{fighter[:perk]}» дає Розгін #{fighter[:ramp_stacks]}/6 після #{source}."
    )
  end

  def resolve_trail_collisions(left, right)
    [left, right].each do |fighter|
      next unless fighter[:perk_type] == "trail"

      enemy = fighter == left ? right : left
      next if enemy[:glimmer_rounds].to_i.positive?

      enemy_path = [enemy[:prev_x], enemy[:prev_y], enemy[:x], enemy[:y]]
      hit_index = fighter[:trail_segments].index do |segment|
        segments_intersect?(
          enemy_path[0], enemy_path[1], enemy_path[2], enemy_path[3],
          segment[:x1], segment[:y1], segment[:x2], segment[:y2]
        )
      end

      next unless hit_index

      fighter[:trail_segments].delete_at(hit_index)
      enemy[:hp] = clamp(enemy[:hp] - 5, 0, 100)
      clamp_fighters

      add_event(
        kind: "perk",
        accent: fighter[:key],
        animate: {
          kind: "trap",
          actor: fighter[:key],
          target: enemy[:key],
          result: "hit",
          effects: [effect_payload(fighter, enemy, "fredy-trail-hit", role: "perk")]
        },
        message: "#{enemy[:aka]} врізається в «#{fighter[:perk]}» і отримує 5 шкоди."
      )
    end

    [left, right].each do |fighter|
      next unless fighter[:trail_segments]

      fighter[:trail_segments].each { |segment| segment[:ttl] -= 1 }
      fighter[:trail_segments].reject! { |segment| segment[:ttl] <= 0 }
    end
  end

  def segments_intersect?(ax1, ay1, ax2, ay2, bx1, by1, bx2, by2)
    o1 = orientation(ax1, ay1, ax2, ay2, bx1, by1)
    o2 = orientation(ax1, ay1, ax2, ay2, bx2, by2)
    o3 = orientation(bx1, by1, bx2, by2, ax1, ay1)
    o4 = orientation(bx1, by1, bx2, by2, ax2, ay2)

    (o1 * o2 < 0) && (o3 * o4 < 0)
  end

  def orientation(x1, y1, x2, y2, x3, y3)
    ((x2 - x1) * (y3 - y1)) - ((y2 - y1) * (x3 - x1))
  end

  def apply_on_hit_perks(attacker, defender, damage, animate, notes, triggered)
    if attacker[:perk_type] == "vamp" && attacker[:vamp_attacks].positive?
      heal = [1, (damage * 0.5).floor].max
      attacker[:hp] = clamp(attacker[:hp] + heal, 0, 100)
      attacker[:vamp_attacks] -= 1
      notes << "«#{attacker[:perk]}» відхілює #{heal} HP."
      triggered = true
      add_event(
        kind: "perk",
        accent: attacker[:key],
        animate: animate.merge(
          result: "hit",
          effects: [effect_payload(attacker, defender, "yura-vamp-drain", role: "perk")]
        ),
        message: "#{attacker[:aka]} висмоктує #{heal} HP через «#{attacker[:perk]}»."
      )
    end

    if attacker[:perk_type] == "ramp"
      gain_ramp(attacker, defender, animate, source: "влучання")
      notes << "Розгін #{attacker[:ramp_stacks]}/6 підсилює Денчика."
      triggered = true
    end

    if defender[:perk_type] == "ramp" && defender[:hp] > 0
      gain_ramp(defender, attacker, animate, source: "отриманий удар")
      triggered = true
    end

    [notes, triggered]
  end

  def effect_payload(actor, target, effect_id, role:)
    {
      effect: effect_id,
      role: role,
      actor: actor[:key],
      target: target[:key]
    }
  end

  def skill_bonus_note(attacker)
    case attacker[:key]
    when "kolyan" then "«#{attacker[:skill_name]}» лягає прямо в темп."
    when "yaroslav" then "«#{attacker[:skill_name]}» спрацьовує ідеально в таймінг."
    when "yura" then "«#{attacker[:perk]}» підпалює ціль ще сильніше."
    when "denchik" then "«#{attacker[:skill_name]}» летить ще нервовіше."
    when "fredy" then "«#{attacker[:skill_name]}» заходить під дивним кутом."
    else ""
    end
  end

  def skill_refund(attacker)
    case attacker[:key]
    when "kolyan" then 4
    when "yaroslav" then 3
    when "yura" then rand < 0.2 ? 4 : 0
    when "denchik" then rand < 0.18 ? 3 : 0
    when "fredy" then 2
    else 0
    end
  end

  def drift_fighter(fighter)
    previous_x = fighter[:x]
    previous_y = fighter[:y]
    fighter[:x] += fighter[:vx]
    fighter[:y] += fighter[:vy]

    bounced = false
    if fighter[:x] < BOARD_MIN || fighter[:x] > BOARD_MAX
      fighter[:x] = clamp(fighter[:x], BOARD_MIN, BOARD_MAX)
      fighter[:vx] *= -1
      bounced = true
    end

    if fighter[:y] < BOARD_MIN || fighter[:y] > BOARD_MAX
      fighter[:y] = clamp(fighter[:y], BOARD_MIN, BOARD_MAX)
      fighter[:vy] *= -1
      bounced = true
    end

    normalize_velocity!(fighter)
    fighter[:bounced] = bounced
    fighter[:prev_x] = previous_x
    fighter[:prev_y] = previous_y
    if fighter[:perk_type] == "trail" && fighter[:trail_rounds].to_i.positive?
      fighter[:trail_segments] << { x1: previous_x, y1: previous_y, x2: fighter[:x], y2: fighter[:y], ttl: 28 }
      fighter[:trail_segments] = fighter[:trail_segments].last(5)
      fighter[:trail_rounds] -= 1
      add_event(
        kind: "perk",
        accent: fighter[:key],
        animate: {
          kind: "status",
          actor: fighter[:key],
          target: fighter[:key],
          result: "hit",
          effects: [effect_payload(fighter, fighter, "fredy-trail-arm", role: "buff")]
        },
        message: "#{fighter[:aka]} прокладає новий сегмент «#{fighter[:perk]}»."
      )
    end
    fighter[:last_action] ||= "drift"
  end

  def normalize_velocity!(fighter)
    speed = Math.sqrt((fighter[:vx]**2) + (fighter[:vy]**2))
    speed = 1.0 if speed.zero?

    fighter[:vx] = (fighter[:vx] / speed) * fighter[:speed]
    fighter[:vy] = (fighter[:vy] / speed) * fighter[:speed]
  end

  def cooldown_step(fighter)
    fighter[:attack_cd] = [fighter[:attack_cd] - 1, 0].max
    fighter[:skill_cd] = [fighter[:skill_cd] - 1, 0].max
  end

  def add_event(kind:, message:, accent:, animate:)
    bounce_message = bounce_summary
    message = [message, bounce_message].compact.join(" ").presence

    @events << {
      round: @round,
      kind: kind,
      message: message,
      accent: accent,
      animate: animate,
      state: snapshot_state
    }
  end

  def snapshot_state
    @state.map do |fighter|
      snapshot = fighter.slice(
        :key, :name, :aka, :hp, :mp, :x, :y,
        :glimmer_rounds, :glimmer_return_ready, :vamp_attacks, :ramp_stacks, :trail_rounds
      )
      snapshot[:trail_segments] = fighter[:trail_segments].map(&:dup)
      snapshot
    end
  end

  def bounce_summary
    bounced = @state.select { |fighter| fighter.delete(:bounced) }
    return nil if bounced.empty?

    names = bounced.map { |fighter| fighter[:aka] }
    names.length == 2 ? "#{names.join(' і ')} відбиваються від краю арени." : "#{names.first} відбивається від краю арени."
  end

  def clamp_fighters
    @state.each do |fighter|
      fighter[:hp] = clamp(fighter[:hp], 0, 100)
      fighter[:mp] = clamp(fighter[:mp], 0, 100)
    end
  end

  def duel_active?
    @state.count { |fighter| fighter[:hp] > 0 } > 1
  end

  def winner
    @state.find { |fighter| fighter[:hp] > 0 }
  end

  def join_notes(notes)
    return "" if notes.empty?

    " " + notes.join(" ")
  end

  def clamp(value, min, max)
    [[value, min].max, max].min
  end
end
