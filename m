From: Alexandre Courbot <acourbot@nvidia.com>
Subject: [PATCH 0/5] arm64: tegra: fix DT definitions for GM20B GPU
Date: Fri, 11 Mar 2016 12:51:53 +0900
Message-ID: <1457668318-2821-1-git-send-email-acourbot@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Stephen Warren <swarren@wwwdotorg.org>, Thierry Reding <thierry.reding@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-tegra@vger.kernel.org, gnurou@gmail.com, Alexandre Courbot <acourbot@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

Small series that fixes/completes DT bindings for Tegra GPUs and add two
missing entries required for the Tegra210 GPU to operate properly.

Alexandre Courbot (5):
  dt-bindings: gk20a: Fix typo in compatible name
  dt-bindings: gk20a: Document iommus property
  dt-bindings: Add documentation for GM20B GPU
  arm64: tegra210: Add pllg_ref clock to GM20B
  arm64: tegra210: Add IOMMU node to GM20B

 .../devicetree/bindings/gpu/nvidia,gk20a.txt       | 35 +++++++++++++++++++---
 arch/arm64/boot/dts/nvidia/tegra210.dtsi           |  8 +++--
 2 files changed, 37 insertions(+), 6 deletions(-)

-- 
2.7.2
