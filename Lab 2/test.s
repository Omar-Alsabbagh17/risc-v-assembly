main:
    lui x6, 0
    addi x6, x6, -0x704
    sb x6, 4(sp)
    jal x0, main
#     sw t1, 0(t0)
#     lr.w t2, (t0)
#     sc.w x11, x12, (t0)
#     #lw t2, 0(t0)
#     jal x0, main

# addi x12, x0, 1 # copy locked value
# again: lr.w x10, (x20) # load-reserved to read lock
# bne x10, x0, again # check if it is 0 yet
# sc.w x11, x12, (x20) # attempt to store new value
# bne x11, x0, again # branch if store fails


# cas:
# lr.w t0, (a0) # Load original value.
# #bne t0, a1, fail # Doesn’t match, so fail.
# sc.w t0, a2, (a0) # Try to update.
# bnez t0, cas # Retry if store-conditional failed.
# li a0, 0 # Set return to success.
# jr ra # Return.
# fail:
# li a0, 1 # Set return to failure.
# jr ra # Return.