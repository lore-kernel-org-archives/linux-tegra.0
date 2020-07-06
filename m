From: Naresh Kamboju <naresh.kamboju-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [qemu] boot failed: Unable to handle kernel NULL pointer dereference
 at virtual address 0000000000000000
Date: Mon, 6 Jul 2020 16:33:16 +0530
Message-ID: <CA+G9fYvqW-RQxt3kSoNkh5Y2REoe0QQB_dTz_KPzhJzcwiM5OA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-serial-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, open list <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Cc: vkoul-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, jslaby-IBi9RG/b67k@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, jirislaby-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, agross-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, Bjorn Andersson <bjorn.andersson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Qian Cai <cai-J5quhbR+WMc@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, lkft-triage-cunTk1MwBs8s++Sfvej+rw@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

While booting qemu_arm64 and qemu_arm with Linux version 5.8.0-rc3-next-20200706
the kernel panic noticed due to kernel NULL pointer dereference.

metadata:
  git branch: master
  git repo: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
  git commit: 5680d14d59bddc8bcbc5badf00dbbd4374858497
  git describe: next-20200706
  make_kernelversion: 5.8.0-rc3
  kernel-config:
https://builds.tuxbuild.com/Glr-Ql1wbp3qN3cnHogyNA/kernel.config

qemu arm64 boot crash log,

[    0.972053] Unable to handle kernel NULL pointer dereference at
virtual address 0000000000000000
[    0.975301] Mem abort info:
[    0.976316]   ESR = 0x96000004
[    0.977378]   EC = 0x25: DABT (current EL), IL = 32 bits
[    0.979363]   SET = 0, FnV = 0
[    0.980458]   EA = 0, S1PTW = 0
[    0.981583] Data abort info:
[    0.982634]   ISV = 0, ISS = 0x00000004
[    0.984213]   CM = 0, WnR = 0
[    0.985260] [0000000000000000] user address but active_mm is swapper
[    0.987600] Internal error: Oops: 96000004 [#1] PREEMPT SMP
[    0.989557] Modules linked in:
[    0.990671] CPU: 2 PID: 1 Comm: swapper/0 Not tainted
5.8.0-rc3-next-20200706 #1
[    0.993711] Hardware name: linux,dummy-virt (DT)
[    0.995708] pstate: 00000005 (nzcv daif -PAN -UAO BTYPE=--)
[    0.998168] pc : pl011_dma_probe+0x90/0x360
[    1.000015] lr : pl011_dma_probe+0x84/0x360
[    1.001827] sp : ffff800011f4b880
[    1.003294] x29: ffff800011f4b880 x28: ffff0000fada5800
[    1.005562] x27: ffff800011e057d8 x26: 0000000000020002
[    1.007884] x25: ffff8000110c0ed0 x24: ffff8000110c0b70
[    1.010164] x23: 0000000000000000 x22: ffff0000faca8000
[    1.012438] x21: ffff0000faee6000 x20: 0000000000000000
[    1.014724] x19: ffff0000faee7480 x18: 0000000000000002
[    1.016977] x17: 0000000000001400 x16: 0000000000001c00
[    1.019270] x15: 0000000000000001 x14: 000000000003a051
[    1.021544] x13: ffff000000000000 x12: 0000000000000010
[    1.023805] x11: 0000000000000004 x10: 0101010101010101
[    1.026091] x9 : fffffffffffffffc x8 : 7f7f7f7f7f7f7f7f
[    1.028354] x7 : fefefeff646c606d x6 : 0a0c0c1680808080
[    1.030645] x5 : 00000000160c0c0a x4 : 0000000000000000
[    1.032887] x3 : ffff800011de1878 x2 : 0000000000000000
[    1.035179] x1 : 5d22d5f0b315de00 x0 : 0000000000000000
[    1.037439] Call trace:
[    1.038640]  pl011_dma_probe+0x90/0x360
[    1.040281]  pl011_startup+0x268/0x2f0
[    1.041935]  uart_startup.part.0+0x124/0x2d8
[    1.043777]  uart_port_activate+0x60/0x98
[    1.045483]  tty_port_open+0x90/0x248
[    1.047163]  uart_open+0x1c/0x30
[    1.048568]  tty_open+0xf4/0x478
[    1.049973]  chrdev_open+0xa4/0x1a0
[    1.051491]  do_dentry_open+0x12c/0x398
[    1.053156]  vfs_open+0x2c/0x38
[    1.054551]  path_openat+0x86c/0xdf0
[    1.056103]  do_filp_open+0x78/0x100
[    1.057651]  do_sys_openat2+0x1e4/0x2a0
[    1.059410]  do_sys_open+0x58/0xa0
[    1.060866]  console_on_rootfs+0x24/0x68
[    1.062577]  kernel_init_freeable+0x1f4/0x254
[    1.064450]  kernel_init+0x14/0x110
[    1.065972]  ret_from_fork+0x10/0x34
[    1.067504] Code: 97fcf14c aa0003f4 b140041f 54000488 (f9400280)
[    1.070107] ---[ end trace 8001204d6659f3e5 ]---
[    1.072104] Kernel panic - not syncing: Attempted to kill init!
exitcode=0x0000000b
[    1.074875] SMP: stopping secondary CPUs
[    1.076613] Kernel Offset: disabled
[    1.078123] CPU features: 0x240002,20002004
[    1.079916] Memory Limit: none
[    1.081255] ---[ end Kernel panic - not syncing: Attempted to kill
init! exitcode=0x0000000b ]---

Full test log,
https://lkft.validation.linaro.org/scheduler/job/1542193#L510

qemu command,
/usr/bin/qemu-system-aarch64 -cpu host -machine virt-2.10,accel=kvm
-nographic -net nic,model=virtio,macaddr=BA:DD:AD:CC:09:05 -net tap -m
2048 -monitor none -kernel /kernel/Image --append "console=ttyAMA0
root=/dev/vda rw" -hda
/rootfs/rpb-console-image-lkft-juno-20200521172852-2689.rootfs.ext4 -m
4096 -smp 4 -nographic -drive
format=qcow2,file=lava-guest.qcow2,media=disk,if=virtio,id=lavatest

-- 
Linaro LKFT
https://lkft.linaro.org
