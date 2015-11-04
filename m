From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 0/2] Add NVIDIA Tegra XUSB pad controller bindings
Date: Wed,  4 Nov 2015 18:11:47 +0100
Message-ID: <1446657109-15568-1-git-send-email-thierry.reding@gmail.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Martyn Welch <martyn.welch-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

This is the result of my attempt to come up with a correct binding for
the XUSB pad controller found on NVIDIA Tegra SoCs. Note how this is a
completely new binding document. The old binding, which we should mark
deprecated if we settle on this new one, modelled the device as a
pinctrl/PHY hybrid, but it turns out that it's really not much of a
pin controller after all.

I have a driver, which is pretty much Andrew's work, heavily reworked
and put into drivers/phy. I've tested this on Jetson TK1 (for Tegra124)
and P2371-2180 (for Tegra210) and I successfully see PCIe, SATA and
super-speed USB working on Jetson TK1 as well as super-speed USB on the
P2371-2180 (root on NFS and USB 3.0 and USB 2.0 pen drives work fine).

Moving the driver into drivers/phy also gives us a trivial way to keep
backwards-compatibility by simply keeping the old driver in place and
calling into it from the new driver if a legacy DTB is detected.

I still need to do a bit of squashing and sorting of the driver patches
but I wanted to get this out now because I know Stephen is working on a
set of patches to support the XUSB pad controller on Tegra210 in U-Boot
and the discussion can hence continue irrespective of the driver code.

Note also that this isn't quite complete yet. I've left out most of the
HSIC-specific properties for now because there is no user for those in
the upstream kernel, so I didn't have an example nor test-case.

Thierry

Thierry Reding (2):
  dt-bindings: phy: Add NVIDIA Tegra XUSB pad controller binding
  dt-bindings: phy: tegra-xusb-padctl: Add Tegra210 support

 .../bindings/phy/nvidia,tegra-xusb-padctl.txt      | 689 +++++++++++++++++++++
 1 file changed, 689 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/nvidia,tegra-xusb-padctl.txt

-- 
2.5.0
