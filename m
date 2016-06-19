From: Marcel Ziswiler <marcel.ziswiler@toradex.com>
Subject: [PATCH v3 2/3] arm: tegra: add colibri t30 device tree binding documentation
Date: Sun, 19 Jun 2016 03:08:03 +0200
Message-ID: <1466298484-1098-2-git-send-email-marcel.ziswiler@toradex.com>
References: <1466298484-1098-1-git-send-email-marcel.ziswiler@toradex.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1466298484-1098-1-git-send-email-marcel.ziswiler@toradex.com>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org
Cc: Marcel Ziswiler <marcel.ziswiler@toradex.com>, Thierry Reding <thierry.reding@gmail.com>, linux-kernel@vger.kernel.org, Stephen Warren <swarren@wwwdotorg.org>, Rob Herring <robh+dt@kernel.org>, linux-tegra@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>, Alexandre Courbot <gnurou@gmail.com>
List-Id: linux-tegra@vger.kernel.org

Add the device tree binding documentation for Colibri T30 which was
missing so far.

Signed-off-by: Marcel Ziswiler <marcel.ziswiler@toradex.com>
Acked-by: Rob Herring <robh@kernel.org>
---

Changes in v3: None
Changes in v2: None

 Documentation/devicetree/bindings/arm/tegra.txt | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/tegra.txt b/Documentation/devicetree/bindings/arm/tegra.txt
index 73278c6..428e098 100644
--- a/Documentation/devicetree/bindings/arm/tegra.txt
+++ b/Documentation/devicetree/bindings/arm/tegra.txt
@@ -33,6 +33,8 @@ board-specific compatible values:
   toradex,apalis_t30
   toradex,apalis_t30-eval
   toradex,colibri_t20-512
+  toradex,colibri_t30
+  toradex,colibri_t30-eval-v3
   toradex,iris
 
 Trusted Foundations
-- 
2.5.5
