From: Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>
Subject: unhandled interrupt from otg port
Date: Sun, 17 Feb 2013 12:48:57 +0100
Message-ID: <1978166.seipGZS4QH@ax5200p>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Hi,

I sometimes see unhandled irq from the otg port on my AC100 (kernel 3.8.0-rc7).
This happens randomly when the a cable is pluged into the mini usb port. Seems
the port generates an interrupt on probe which isn't handled.

Any ideas?

Marc

[    1.983545] ehci_hcd: USB 2.0 'Enhanced' Host Controller (EHCI) Driver
[    1.996613] unable to find transceiver of type USB2 PHY
[    2.004693] tegra-ehci tegra-ehci.0: Tegra EHCI Host Controller
[    2.013466] tegra-ehci tegra-ehci.0: new USB bus registered, assigned bus number 1
[    2.167205] irq 52: nobody cared (try booting with the "irqpoll" option)
[    2.176740] [<c001b46c>] (unwind_backtrace+0x0/0xf8) from [<c00ad640>] (__report_bad_irq+0x28/0xc4)
[    2.188686] [<c00ad640>] (__report_bad_irq+0x28/0xc4) from [<c00ad904>] (note_interrupt+0x13c/0x190)
[    2.200753] [<c00ad904>] (note_interrupt+0x13c/0x190) from [<c00ab6fc>] (handle_irq_event_percpu+0xcc/0x258)
[    2.213559] [<c00ab6fc>] (handle_irq_event_percpu+0xcc/0x258) from [<c00ab8d8>] (handle_irq_event+0x50/0x70)
[    2.226425] [<c00ab8d8>] (handle_irq_event+0x50/0x70) from [<c00ae554>] (handle_fasteoi_irq+0x7c/0x154)
[    2.238865] [<c00ae554>] (handle_fasteoi_irq+0x7c/0x154) from [<c00ab060>] (generic_handle_irq+0x20/0x30)
[    2.251521] [<c00ab060>] (generic_handle_irq+0x20/0x30) from [<c0013f24>] (handle_IRQ+0x38/0x90)
[    2.263442] [<c0013f24>] (handle_IRQ+0x38/0x90) from [<c0008508>] (gic_handle_irq+0x28/0x5c)
[    2.275071] [<c0008508>] (gic_handle_irq+0x28/0x5c) from [<c05d8c80>] (__irq_svc+0x40/0x50)
[    2.286650] Exception stack(0xdf865cb0 to 0xdf865cf8)
[    2.294904] 5ca0:                                     c09391c0 3f75ff7c 00000000 00000000
[    2.306340] 5cc0: 00000002 0000001d df864000 fe000100 00000034 df8077b0 60000113 c08ae6a0
[    2.317817] 5ce0: 002617f4 df865cf8 c00393cc c0038ef8 20000113 ffffffff
[    2.327777] [<c05d8c80>] (__irq_svc+0x40/0x50) from [<c0038ef8>] (__do_softirq+0x80/0x254)
[    2.339470] [<c0038ef8>] (__do_softirq+0x80/0x254) from [<c00393cc>] (irq_exit+0x80/0x88)
[    2.351074] [<c00393cc>] (irq_exit+0x80/0x88) from [<c0013f28>] (handle_IRQ+0x3c/0x90)
[    2.362403] [<c0013f28>] (handle_IRQ+0x3c/0x90) from [<c0008508>] (gic_handle_irq+0x28/0x5c)
[    2.374270] [<c0008508>] (gic_handle_irq+0x28/0x5c) from [<c05d8c80>] (__irq_svc+0x40/0x50)
[    2.386056] Exception stack(0xdf865d70 to 0xdf865db8)
[    2.394520] 5d60:                                     df8077d0 60000113 00000000 00070007
[    2.406178] 5d80: df807780 dd676d40 df8077d0 c040d27c 00000034 df8077b0 60000113 c08ae6a0
[    2.417840] 5da0: 00000000 df865db8 c00acc38 c05d8718 60000113 ffffffff
[    2.427932] [<c05d8c80>] (__irq_svc+0x40/0x50) from [<c05d8718>] (_raw_spin_unlock_irqrestore+0x28/0x2c)
[    2.440981] [<c05d8718>] (_raw_spin_unlock_irqrestore+0x28/0x2c) from [<c00acc38>] (__setup_irq+0x1c4/0x40c)
[    2.454462] [<c00acc38>] (__setup_irq+0x1c4/0x40c) from [<c00acf34>] (request_threaded_irq+0xb4/0x144)
[    2.467460] [<c00acf34>] (request_threaded_irq+0xb4/0x144) from [<c040d1bc>] (usb_hcd_request_irqs+0x68/0x128)
[    2.481219] [<c040d1bc>] (usb_hcd_request_irqs+0x68/0x128) from [<c040ec60>] (usb_add_hcd.part.15+0x2c0/0x310)
[    2.495034] [<c040ec60>] (usb_add_hcd.part.15+0x2c0/0x310) from [<c0420698>] (tegra_ehci_probe+0x340/0x4fc)
[    2.508638] [<c0420698>] (tegra_ehci_probe+0x340/0x4fc) from [<c0373bd4>] (platform_drv_probe+0x18/0x1c)
[    2.522034] [<c0373bd4>] (platform_drv_probe+0x18/0x1c) from [<c0372838>] (really_probe+0x60/0x1e0)
[    2.535012] [<c0372838>] (really_probe+0x60/0x1e0) from [<c0372ab4>] (driver_probe_device+0x30/0x48)
[    2.548106] [<c0372ab4>] (driver_probe_device+0x30/0x48) from [<c0372b58>] (__driver_attach+0x8c/0x90)
[    2.561401] [<c0372b58>] (__driver_attach+0x8c/0x90) from [<c037121c>] (bus_for_each_dev+0x50/0x7c)
[    2.574458] [<c037121c>] (bus_for_each_dev+0x50/0x7c) from [<c0372158>] (bus_add_driver+0x174/0x240)
[    2.587638] [<c0372158>] (bus_add_driver+0x174/0x240) from [<c0373058>] (driver_register+0x78/0x144)
[    2.600825] [<c0373058>] (driver_register+0x78/0x144) from [<c087d600>] (ehci_hcd_init+0x58/0x88)
[    2.613735] [<c087d600>] (ehci_hcd_init+0x58/0x88) from [<c00085fc>] (do_one_initcall+0x34/0x174)
[    2.626634] [<c00085fc>] (do_one_initcall+0x34/0x174) from [<c085a90c>] (do_basic_setup+0x94/0xc8)
[    2.639624] [<c085a90c>] (do_basic_setup+0x94/0xc8) from [<c085aa30>] (kernel_init_freeable+0xf0/0x18c)
[    2.653064] [<c085aa30>] (kernel_init_freeable+0xf0/0x18c) from [<c05c01f4>] (kernel_init+0x8/0xe4)
[    2.666146] [<c05c01f4>] (kernel_init+0x8/0xe4) from [<c0012fd8>] (ret_from_fork+0x14/0x3c)
[    2.678515] handlers:
[    2.684728] [<c040d27c>] usb_hcd_irq
[    2.692204] Disabling IRQ #52
