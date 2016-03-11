From: Alexandre Courbot <acourbot@nvidia.com>
Subject: [PATCH 2/5] dt-bindings: gk20a: Document iommus property
Date: Fri, 11 Mar 2016 12:51:55 +0900
Message-ID: <1457668318-2821-3-git-send-email-acourbot@nvidia.com>
References: <1457668318-2821-1-git-send-email-acourbot@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1457668318-2821-1-git-send-email-acourbot@nvidia.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Stephen Warren <swarren@wwwdotorg.org>, Thierry Reding <thierry.reding@gmail.com>
Cc: devicetree@vger.kernel.org, gnurou@gmail.com, linux-kernel@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>, linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org
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
