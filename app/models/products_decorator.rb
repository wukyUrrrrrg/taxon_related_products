# -*- coding: utf-8 -*-
Product.class_eval do

  def related_products(product_count = 3)
    tematiki = self.taxons.select {|t| t.taxonomy.name.include? 'Тема'}
    related_products = Product.joins(:taxons).where('taxons.id IN (?)', tematiki).joins(:master).where('price > 0').not_deleted.on_hand.order('RAND()').limit(product_count) 
  end

end
