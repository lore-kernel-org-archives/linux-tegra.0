From: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 0/3] bus: Add support for Tegra210 ACONNECT
Date: Fri, 29 Apr 2016 14:46:38 +0100
Message-ID: <1461937604-18481-1-git-send-email-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Add support for the ACONNECT bus which is part of the audio sub-system
on Tegra210.

I did look to see if we could use the simple-pm-bus infrastructure for
this, however, in the end I found that it did was not a good fit because
of the way clocks for the bus are handled. The simple-pm-bus is tightly
coupled to the genpd subsystem and is reliant on the power-domain
associated with the bus to have the flag GENPD_FLAG_PM_CLK set and uses
the genpd function pointer, attach_dev(), as a hook to populate the
clocks. For Tegra this does not work because the power-domains are
instantiated from device-tree rather than platform code. In this case
for Tegra it is simpler to keep the clock management of devices within
the power-domain separated from the power-domain itself.

Jon Hunter (2):
  dt-bindings: bus: Add documentation for Tegra210 ACONNECT
  bus: Add support for Tegra ACONNECT

Shardar Shariff Md (1):
  dmaengine: tegra-apb: proper default init of channel slave_id

 .../bindings/bus/nvidia,tegra210-aconnect.txt      |  45 ++++++++
 drivers/bus/Kconfig                                |   9 ++
 drivers/bus/Makefile                               |   1 +
 drivers/bus/tegra-aconnect.c                       | 113 +++++++++++++++++++++
 drivers/dma/tegra20-apb-dma.c                      |  16 ++-
 5 files changed, 182 insertions(+), 2 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/bus/nvidia,tegra210-aconnect.txt
 create mode 100644 drivers/bus/tegra-aconnect.c

-- 
2.1.4
