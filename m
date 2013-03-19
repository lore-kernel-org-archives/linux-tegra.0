From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH 0/7] USB: PHY: Tegra: registering TEGRA USB PHY as platform
 driver
Date: Tue, 19 Mar 2013 13:51:56 -0600
Message-ID: <5148C1DC.1020903@wwwdotorg.org>
References: <1363609781-4045-1-git-send-email-vbyravarasu@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1363609781-4045-1-git-send-email-vbyravarasu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Venu Byravarasu <vbyravarasu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org, balbi-l0cyMroinI0@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 03/18/2013 06:29 AM, Venu Byravarasu wrote:
> As part of this series, apart from patch containing changes to register TEGRA
> USB PHY driver as platform driver, prepared below patches:
> 1. Re-arranging & adding new DT properties.
> 2. Getting various params from DT properties added.
> 3. code clean up.

Venu, I'm curious whether these patches were tested at all. I have found
at least two significant problems with trivial testing:

1)

"reboot" or "shutdown -h now" both cause the following crash, with or
without any USB devices plugged in (or ever having been plugged in):

> [  355.836288] Unable to handle kernel NULL pointer dereference at virtual address 00000028
> [  355.847961] pgd = ed620000
> [  355.854093] [00000028] *pgd=00000000
...
> [  356.146728] [<c02e5978>] (tegra_ehci_hcd_shutdown+0x18/0x2c) from [<c0279edc>] (platform_drv_shutdown+0x18/0x1c)
> [  356.160379] [<c0279edc>] (platform_drv_shutdown+0x18/0x1c) from [<c027703c>] (device_shutdown+0x34/0x188)
> [  356.173464] [<c027703c>] (device_shutdown+0x34/0x188) from [<c0034650>] (kernel_restart_prepare+0x34/0x3c)
> [  356.186668] [<c0034650>] (kernel_restart_prepare+0x34/0x3c) from [<c0034664>] (kernel_restart+0xc/0x4c)
> [  356.199637] [<c0034664>] (kernel_restart+0xc/0x4c) from [<c0034858>] (sys_reboot+0x1ac/0x1d8)
> [  356.211704] [<c0034858>] (sys_reboot+0x1ac/0x1d8) from [<c000e2c0>] (ret_fast_syscall+0x0/0x30)
> [  356.223965] Code: ebfe4b27 e5903000 e24300e8 e5133044 (e5933028) 
> [  356.233896] ---[ end trace 088d89482b4af176 ]---

2)

The first time enumeration USB devices is attempted on a port fails. For
devices that are plugged in at boot, this means that to get them
working, they must be unplugged and re-plugged after boot. For devices
that are not plugged in at boot, this means they must be plugged,
unplugged, and then plugged in again.

This is obviously problematic in and of itself. This is especially true
for boards like Harmony that have a built-in USB hub and network chip. I
didn't actually test this, but I assume that they cannot be made to work
at all with this patch series, since they cannot be unplugged.

The failed enumeration is accompanied by the following message:

[    2.451530] hub 3-0:1.0: unable to enumerate USB device on port 1

Both of these problems reproduce on at least boards Ventana and
Seaboard(Springbank), although I assume that all boards are affected.
