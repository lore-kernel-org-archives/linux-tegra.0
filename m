From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [RFC 0/2] Enable USB support for Venice2
Date: Tue, 25 Feb 2014 22:35:58 +0100
Message-ID: <1393364160-28253-1-git-send-email-thierry.reding@gmail.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Hi,

These two patches add the USB controllers to Tegra124 and enable them on
Venice2, wiring them up with the corresponding regulators.

Unfortunately the USB1 VBUS regulator seems to be causing problems once
enabled, causing none of the USB ports to work properly. Commenting out
the gpio property for that regulator fixes things for me and I can use
the webcam connected to USB2 as well as any of the peripherals on USB3.

Since GPIO N.04 isn't connected to anything else, I don't understand how
it could possibly influence any of the other USB busses. I wonder if
perhaps this is caused by defect hardware, so it would be good if
somebody could test this on a different Venice2.

Thierry

Thierry Reding (2):
  ARM: tegra: Add Tegra124 USB support
  ARM: tegra: Enable USB on Venice2

 arch/arm/boot/dts/tegra124-venice2.dts | 29 +++++++++-
 arch/arm/boot/dts/tegra124.dtsi        | 99 ++++++++++++++++++++++++++++++++++
 2 files changed, 127 insertions(+), 1 deletion(-)

-- 
1.8.4.2
