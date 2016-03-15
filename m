From: Alexandre Courbot <acourbot@nvidia.com>
Subject: [PATCH v2 2/5] dt-bindings: gk20a: Document iommus property
Date: Tue, 15 Mar 2016 11:58:41 +0900
Message-ID: <1458010724-10945-3-git-send-email-acourbot@nvidia.com>
References: <1458010724-10945-1-git-send-email-acourbot@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1458010724-10945-1-git-send-email-acourbot@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Warren <swarren@wwwdotorg.org>, Thierry Reding <thierry.reding@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-tegra@vger.kernel.org, gnurou@gmail.com, Alexandre Courbot <acourbot@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

GK20A can optionally make use of an IOMMU.

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 Documentation/devicetree/bindings/gpu/nvidia,gk20a.txt | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/gpu/nvidia,gk20a.txt b/Documentation/devicetree/bindings/gpu/nvidia,gk20a.txt
index 914f0ff4020e..1e3748337319 100644
--- a/Documentation/devicetree/bindings/gpu/nvidia,gk20a.txt
+++ b/Documentation/devicetree/bindings/gpu/nvidia,gk20a.txt
@@ -24,6 +24,9 @@ Required properties:
 - reset-names: Must include the following entries:
   - gpu
 
+Optional properties:
+- iommus: A reference to the IOMMU. See ../iommu/iommu.txt for details.
+
 Example:
 
 	gpu@0,57000000 {
@@ -39,5 +42,6 @@ Example:
 		clock-names = "gpu", "pwr";
 		resets = <&tegra_car 184>;
 		reset-names = "gpu";
+		iommus = <&mc TEGRA_SWGROUP_GPU>;
 		status = "disabled";
 	};
-- 
2.7.2
