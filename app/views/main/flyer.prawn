config = {
  page_size: "A4",
  margin: [20, 35, 20, 35],
  info: {
    :Title => "Teamnavalny",
    :Author => @person[:name],
    :Producer => "Teamnavalny",
    :CreationDate => Time.now,
  },
  force_download: @if_download
}

prawn_document config do |pdf|
  
  pdf.font_families.update(
    "Candara" => { normal: "#{Rails.root}/public/fonts/Candara.ttf" },
    "Georgia" => { normal: "#{Rails.root}/public/fonts/Georgia.ttf" }
  )
  
  pdf.image "#{Rails.root}/public/images/logo_hd.jpg", position: :right, scale: 0.3
  pdf.move_down 10
  pdf.image "#{Rails.root}/public/images/splash_hd.jpg", position: :center, scale: 0.297
  pdf.move_down 20
  pdf.font("Candara") do
    pdf.fill_color "097383"
    pdf.text "Уважаемые соседи!", align: :center, size: 20
  end
  pdf.move_down 10
  
  strings = [
    "Обсуждать с соседями политическую ситуацию — это традиция нашей страны и старинный московский обычай. В этом смысле, выборы мэра Москвы — хороший повод познакомиться и пообщаться.",
    "Мне с этими выборами все понятно: или опять поверить чиновникам и оставить все как есть, или выбрать Навального.",
    "Я, #{ @person[:name] }, за Навального.",
    "Я знаю все о нем, о его команде, о его борьбе. Даже знаю где он живет (кстати, кто знает, где живет Собянин?)",
    "Хотите поспорить? Давайте поспорим.",
    "Хотите обсудить? Давайте обсудим.",
    "Даже если вы не хотите спорить и вам все понятно без меня, просто знайте: нас, сторонников Алексея Навального, гораздо больше, чем говорят по телевизору и пишут в газетах. И мы — такие же москвичи, как и вы.",
  ]
  
  pdf.font("Georgia") do
    pdf.fill_color "000000"
    strings.each do |s|
      pdf.text s, size: 13
      pdf.move_down 10
    end
  end
  pdf.move_down 5
  
  strings2 = [
    "Мы верим, что произвол и коррупцию можно и нужно победить — и в Москве, и в России.",
    "8 сентября голосуйте за Алексея Навального!"
  ]
  pdf.font("Candara") do
    pdf.fill_color "097383"
    strings2.each do |s|
      pdf.text s, align: :center, size: 20, leading: -5
      pdf.move_down 5
    end
  end
  pdf.move_down 20
   
  pdf.float do
    pdf.move_down 3
    pdf.bounding_box [0, pdf.cursor], width: 310, height: 164 do
      pdf.stroke_color "097383"
      pdf.line_width 3
      pdf.stroke_bounds
      
      pdf.bounding_box [10, 154], width: 290, height: 144 do        
        pdf.move_down 5
        pdf.font("Georgia") do
          pdf.fill_color "000000"
          pdf.text "Если все-таки захотите пообщаться лично:", size: 14
          pdf.move_down 10
          @person.take(6).each do |key, value|
            next if value.nil? || value.empty?
            pdf.formatted_text [
              { text: "#{@fields[key.to_sym]}:   " },
              { text: "#{value}", color: "097383" }
            ], size: 13
            pdf.move_down 5
          end
        end
      end
    end
  end
  
  pdf.image "#{Rails.root}/public/images/circle_hd.jpg", position: :right, scale: 0.3
  
  
end