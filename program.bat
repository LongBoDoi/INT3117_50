@echo off
chcp 65001>nul

set totalAmount=0

echo Chọn sản phẩm
echo 1: Bia (15.000đ)
echo 2: Rượu (20.000đ)
echo 3: Thuốc lá (8.000đ)
echo 4: Thanh toán

:selectItem
set /p "itemType=Lựa chọn: "

if %itemType% EQU 4 (
	goto :checkout
)

set /p "itemQuantity=Nhập số lượng: "

if %itemType% EQU 1 (
	set /a "totalAmount=totalAmount + (itemQuantity * 15000) * 108 / 100"
) else if %itemType% EQU 2 (
	set /a "totalAmount=totalAmount + (itemQuantity * 20000) * 110 / 100"
) else if %itemType% EQU 3 (
	set /a "totalAmount=totalAmount + (itemQuantity * 8000)"
)

goto :selectItem

:checkout
if %totalAmount% GEQ 200 (
	set /a "totalAmount=totalAmount * 80 / 100"
) else if %totalAmount% GEQ 100 (
	set /a "totalAmount=totalAmount * 85 / 100"
)
echo Tổng tiền: %totalAmount%đ

pause