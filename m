From: Sameer Pujar <spujar@nvidia.com>
Subject: [PATCH 2/6] Documentation: DT: Add compatibility binding for Tegra186
Date: Thu, 2 May 2019 18:25:13 +0530
Message-ID: <1556801717-31507-3-git-send-email-spujar@nvidia.com>
References: <1556801717-31507-1-git-send-email-spujar@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1556801717-31507-1-git-send-email-spujar@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: vkoul@kernel.org, dan.j.williams@intel.com, robh+dt@kernel.org, mark.rutland@arm.com
Cc: thierry.reding@gmail.com, jonathanh@nvidia.com, ldewangan@nvidia.com, dmaengine@vger.kernel.org, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, Sameer Pujar <spujar@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

Tegra186 Audio DMA controller has new updates from Tegra210 version.
Thus add new compatibility binding string and the same can be used
by Tegra194 as well.

Signed-off-by: Sameer Pujar <spujar@nvidia.com>
---
 Documentation/devicetree/bindings/dma/nvidia,tegra210-adma.txt | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/dma/nvidia,tegra210-adma.txt b/Documentation/devicetree/bindings/dma/nvidia,tegra210-adma.txt
index 2f35b04..245d306 100644
--- a/Documentation/devicetree/bindings/dma/nvidia,tegra210-adma.txt
+++ b/Documentation/devicetree/bindings/dma/nvidia,tegra210-adma.txt
@@ -4,7 +4,9 @@ The Tegra Audio DMA controller that is used for transferring data
 between system memory and the Audio Processing Engine (APE).
 
 Required properties:
-- compatible: Must be "nvidia,tegra210-adma".
+- compatible: Should contain one of the following:
+  - "nvidia,tegra210-adma": for Tegra210
+  - "nvidia,tegra186-adma": for Tegra186 and Tegra194
 - reg: Should contain DMA registers location and length. This should be
   a single entry that includes all of the per-channel registers in one
   contiguous bank.
-- 
2.7.4
