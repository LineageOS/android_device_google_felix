# sepolicy that are shared among devices using whitechapel
BOARD_SEPOLICY_DIRS += device/google/felix/sepolicy/vendor
BOARD_SEPOLICY_DIRS += device/google/felix/sepolicy/tracking_denials

# Fingerprint
BOARD_SEPOLICY_DIRS += device/google/felix/sepolicy/fingerprint_capacitance

BOARD_VENDOR_SEPOLICY_DIRS += device/google/gs-common/bcmbt/sepolicy
BOARD_VENDOR_SEPOLICY_DIRS += device/google/gs-common/display/sepolicy_second_display/exynos
BOARD_VENDOR_SEPOLICY_DIRS += device/google/gs-common/modem/modem_svc_sit/sepolicy
BOARD_VENDOR_SEPOLICY_DIRS += device/google/gs-common/touch/gti/ical/sepolicy
BOARD_VENDOR_SEPOLICY_DIRS += device/google/gs-common/touch/gti/ical/sepolicy_gti_dual
BOARD_VENDOR_SEPOLICY_DIRS += device/google/gs-common/touch/gti/predump_sepolicy
BOARD_VENDOR_SEPOLICY_DIRS += device/google/gs-common/touch/gti/predump_sepolicy_gti_dual
BOARD_VENDOR_SEPOLICY_DIRS += device/google/gs-common/touch/predump/sepolicy
BOARD_VENDOR_SEPOLICY_DIRS += device/google/gs-common/touch/stm/predump_sepolicy
BOARD_VENDOR_SEPOLICY_DIRS += device/google/gs-common/wireless_charger/sepolicy

BOARD_VENDOR_SEPOLICY_DIRS += hardware/google/pixel-sepolicy/powerstats
BOARD_VENDOR_SEPOLICY_DIRS += hardware/google/pixel-sepolicy/vibrator/common
BOARD_VENDOR_SEPOLICY_DIRS += hardware/google/pixel-sepolicy/vibrator/cs40l26
