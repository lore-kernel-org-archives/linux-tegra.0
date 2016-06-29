From: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 0/3] Fixes for Tegra XUSB
Date: Wed, 29 Jun 2016 12:07:30 +0100
Message-ID: <1467198453-23406-1-git-send-email-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Fixes for Tegra XUSB dt-binding documentation and the XUSB mailbox
interrupt.

When testing XUSB on the Tegra210 Smaug, I found that USB connect and
disconnect events were not being seen. I have debug this and found that
the XUSB mailbox is incorrect and I was never receiving any interrupts
from the XUSB mailbox. Interestingly, this behaviour is not seen on the
Tegra210 Jetson TX1 despite the fact that there were no mailbox
interrupts. The two boards have different USB connectors and so may be
the connection is slightly different. After fixing the mailbox interrupt
both boards now receive interrupts from the XUSB mailbox as expected.

Jon Hunter (3):
  dt-bindings: phy: Fix description of Tegra210 PHY nodes
  dt-bindings: usb: Fix Tegra XUSB example
  arm64: tegra: Correct Tegra210 XUSB mailbox interrupt

 .../devicetree/bindings/phy/nvidia,tegra124-xusb-padctl.txt       | 2 +-
 Documentation/devicetree/bindings/usb/nvidia,tegra124-xusb.txt    | 8 ++++----
 arch/arm64/boot/dts/nvidia/tegra210.dtsi                          | 2 +-
 3 files changed, 6 insertions(+), 6 deletions(-)

-- 
2.1.4
