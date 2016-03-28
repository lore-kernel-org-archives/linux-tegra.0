From: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH v3 0/5] arm64: tegra: fix DT definitions for GM20B GPU
Date: Mon, 28 Mar 2016 18:22:59 +0900
Message-ID: <1459156984-32644-1-git-send-email-acourbot@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Small series that fixes/completes DT bindings for Tegra GPUs and add two
missing entries required for the Tegra210 GPU to operate properly.

Without these fixes, GM20B will crash during probe on 4.6 because a
required clock is not activated.

Changes since v2:
- Fixed device address in DT examples
- Carried Acked-bys

Changes since v1:
- Renamed "pllg_ref" clock to "ref" in DT bindings

Alexandre Courbot (5):
  dt-bindings: gk20a: Fix typo in compatible name
  dt-bindings: gk20a: Document iommus property
  dt-bindings: Add documentation for GM20B GPU
  arm64: tegra210: Add reference clock to GM20B
  arm64: tegra210: Add IOMMU node to GM20B

 .../devicetree/bindings/gpu/nvidia,gk20a.txt       | 37 +++++++++++++++++++---
 arch/arm64/boot/dts/nvidia/tegra210.dtsi           |  8 +++--
 2 files changed, 38 insertions(+), 7 deletions(-)

-- 
2.7.3
