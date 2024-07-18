@echo off
chcp 65001>nul

set totalAmount=0

echo Chọn sản phẩm
echo 1: Bia (15.000đ)
echo 2: Rượu (20.000đ)
echo 3: Thuốc lá (8.000đ)
echo 4: Thanh toán

REM Chọn sản phẩm
:selectItem
set /p "itemType=Lựa chọn: "

if %itemType% EQU 4 (
	goto :checkout
)

set unitPrice=0
set taxRate=0

REM Chọn số lượng
set /p "itemQuantity=Nhập số lượng: "
if %itemType% EQU 1 (
	set unitPrice=15000
	set taxRate=8
) else if %itemType% EQU 2 (
	set unitPrice=20000
	set taxRate=10
) else if %itemType% EQU 3 (
	set unitPrice=8000
)
set /a "totalAmount=totalAmount + (itemQuantity * unitPrice) * (100 + taxRate) / 100"

goto :selectItem

REM Tính tổng tiền
:checkout
if %totalAmount% GEQ 400 (
	set /a "totalAmount=totalAmount * 80 / 100"
) else if %totalAmount% GEQ 200 (
	set /a "totalAmount=totalAmount * 85 / 100"
)
echo Tổng tiền: %totalAmount%đ

pause
