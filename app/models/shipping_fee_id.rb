class ShippingFeeId < ActiveHash::Base
  self.data = [
               {id: 0, name: '--'},
               {id: 1, name: '新品、未使用'},
               {id: 2, name: '未使用に近い'},
               {id: 3, name: '目立った傷や汚れなし'}
              ]
end
