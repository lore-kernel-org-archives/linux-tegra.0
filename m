From: Marcel Ziswiler <marcel.ziswiler@toradex.com>
Subject: [PATCH v4 3/3] arm: tegra: add apalis tk1 device tree binding documentation
Date: Thu, 30 Jun 2016 00:23:19 +0200
Message-ID: <1467238999-10252-3-git-send-email-marcel.ziswiler@toradex.com>
References: <1467238999-10252-1-git-send-email-marcel.ziswiler@toradex.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1467238999-10252-1-git-send-email-marcel.ziswiler@toradex.com>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org
Cc: Marcel Ziswiler <marcel.ziswiler@toradex.com>, Thierry Reding <thierry.reding@gmail.com>, linux-kernel@vger.kernel.org, Stephen Warren <swarren@wwwdotorg.org>, Rob Herring <robh+dt@kernel.org>, linux-tegra@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>, Alexandre Courbot <gnurou@gmail.com>
List-Id: linux-tegra@vger.kernel.org

Add the device tree binding documentation for Apalis TK1.

Note that this is using dashes aka '-' in compatible strings as
previously suggested by Rob.

Signed-off-by: Marcel Ziswiler <marcel.ziswiler@toradex.com>
Acked-by: Rob Herring <robh@kernel.org>
---

Changes in v4: None
Changes in v3: None
Changes in v2: None

 Documentation/devicetree/bindings/arm/tegra.txt | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/tegra.txt b/Documentation/devicetree/bindings/arm/tegra.txt
index 428e098..b5a4342 100644
--- a/Documentation/devicetree/bindings/arm/tegra.txt
+++ b/Documentation/devicetree/bindings/arm/tegra.txt
@@ -32,6 +32,8 @@ board-specific compatible values:
   nvidia,whistler
   toradex,apalis_t30
   toradex,apalis_t30-eval
+  toradex,apalis-tk1
+  toradex,apalis-tk1-eval
   toradex,colibri_t20-512
   toradex,colibri_t30
   toradex,colibri_t30-eval-v3
-- 
2.5.5
