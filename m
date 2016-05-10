From: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH V2 0/4] Add support for Tegra210 ACONNECT bus
Date: Tue, 10 May 2016 12:35:36 +0100
Message-ID: <1462880140-5938-1-git-send-email-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Add support for the ACONNECT bus which is part of the audio sub-system
on Tegra210.

Changes from V1:
- Updated ACONNECT DT binding documentation and DT binding per feedback
  from Rob H.
- Added patch to populate the audio power-domain which is needed to
  successfully build the DT blob (this was missed as it was part of
  my local testing tree).

Jon Hunter (4):
  dt-bindings: bus: Add documentation for Tegra210 ACONNECT
  bus: Add support for Tegra ACONNECT
  ARM64: tegra: Add audio PM domain device node for Tegra210
  arm64: tegra: Add ACONNECT bus node for Tegra210

 .../bindings/bus/nvidia,tegra210-aconnect.txt      |  45 ++++++++
 arch/arm64/boot/dts/nvidia/tegra210.dtsi           |  21 ++++
 drivers/bus/Kconfig                                |   9 ++
 drivers/bus/Makefile                               |   1 +
 drivers/bus/tegra-aconnect.c                       | 113 +++++++++++++++++++++
 5 files changed, 189 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/bus/nvidia,tegra210-aconnect.txt
 create mode 100644 drivers/bus/tegra-aconnect.c

-- 
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
