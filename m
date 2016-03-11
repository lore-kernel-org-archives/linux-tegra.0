From: Alexandre Courbot <acourbot@nvidia.com>
Subject: [PATCH 1/5] dt-bindings: gk20a: Fix typo in compatible name
Date: Fri, 11 Mar 2016 12:51:54 +0900
Message-ID: <1457668318-2821-2-git-send-email-acourbot@nvidia.com>
References: <1457668318-2821-1-git-send-email-acourbot@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1457668318-2821-1-git-send-email-acourbot@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Stephen Warren <swarren@wwwdotorg.org>, Thierry Reding <thierry.reding@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-tegra@vger.kernel.org, gnurou@gmail.com, Alexandre Courbot <acourbot@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

The correct compatible name is "nvidia,gk20a".

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 Documentation/devicetree/bindings/gpu/nvidia,gk20a.txt | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/gpu/nvidia,gk20a.txt b/Documentation/devicetree/bindings/gpu/nvidia,gk20a.txt
index 23bfe8e1f7cc..914f0ff4020e 100644
--- a/Documentation/devicetree/bindings/gpu/nvidia,gk20a.txt
+++ b/Documentation/devicetree/bindings/gpu/nvidia,gk20a.txt
@@ -1,9 +1,9 @@
 NVIDIA GK20A Graphics Processing Unit
 
 Required properties:
-- compatible: "nvidia,<chip>-<gpu>"
+- compatible: "nvidia,<gpu>"
   Currently recognized values:
-  - nvidia,tegra124-gk20a
+  - nvidia,gk20a
 - reg: Physical base address and length of the controller's registers.
   Must contain two entries:
   - first entry for bar0
-- 
2.7.2
