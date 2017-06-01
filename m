From: Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH v2 0/2] Device tree changes for Tegra186 cpufreq
Date: Thu, 1 Jun 2017 11:04:03 +0300
Message-ID: <1496304245-24024-1-git-send-email-mperttunen@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Hi,

these are the device tree and bindings changes for the Tegra186 cpufreq
driver that was recently merged. The patches are the same as those that
were originally posted with the driver.

Mikko Perttunen (2):
  dt-bindings: Add bindings for nvidia,tegra186-ccplex-cluster
  arm64: tegra: Add CCPLEX_CLUSTER area in Tegra186

 .../arm/tegra/nvidia,tegra186-ccplex-cluster.txt        | 17 +++++++++++++++++
 arch/arm64/boot/dts/nvidia/tegra186.dtsi                |  7 +++++++
 2 files changed, 24 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/arm/tegra/nvidia,tegra186-ccplex-cluster.txt

-- 
2.1.4
