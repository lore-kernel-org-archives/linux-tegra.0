From: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 0/7] Tegra210 Smaug DT Updates
Date: Tue, 9 Aug 2016 16:21:15 +0100
Message-ID: <1470756082-19099-1-git-send-email-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Populate AGIC and ADMA devices and SOR power-domain for Tegra210.

Enable ACONNECT, AGIC, ADMA, DPAUX (for I2C6), XUSB and audio devices
for Tegra210 Smaug.

Jon Hunter (7):
  arm64: tegra: Add AGIC node for Tegra210
  arm64: tegra: Add ADMA node for Tegra210
  arm64: tegra: Add SOR power-domain for Tegra210
  arm64: tegra: Add ACONNECT, ADMA and AGIC nodes Tegra210 Smaug
  arm64: tegra: Enable DPAUX for Tegra210 Smaug
  arm64: tegra: Add the various audio devices for Tegra210 Smaug
  arm64: tegra: Enable XUSB controller on Tegra210 Smaug

 arch/arm64/boot/dts/nvidia/tegra210-smaug.dts | 119 ++++++++++++++++++++++++++
 arch/arm64/boot/dts/nvidia/tegra210.dtsi      |  71 +++++++++++++++
 2 files changed, 190 insertions(+)

-- 
2.1.4
