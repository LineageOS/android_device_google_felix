# sepolicy that are shared among devices using whitechapel
BOARD_SEPOLICY_DIRS += device/google/felix/sepolicy/vendor
BOARD_SEPOLICY_DIRS += device/google/felix/sepolicy/tracking_denials

# Fingerprint
BOARD_SEPOLICY_DIRS += device/google/felix/sepolicy/fingerprint_capacitance

BOARD_VENDOR_SEPOLICY_DIRS += hardware/google/pixel-sepolicy/vibrator/common
BOARD_VENDOR_SEPOLICY_DIRS += hardware/google/pixel-sepolicy/vibrator/cs40l26
