From: Paul Walmsley <paul@pwsan.com>
Subject: [PATCH 18/24] Documentation: DT bindings: add more chip compatible
 strings for Tegra SDHCI
Date: Wed, 28 Jan 2015 16:49:38 -0700
Message-ID: <20150128234938.20644.44329.stgit@dusk.lan>
References: <20150128234935.20644.89300.stgit@dusk.lan>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20150128234935.20644.89300.stgit@dusk.lan>
Sender: linux-kernel-owner@vger.kernel.org
Cc: Mark Rutland <mark.rutland@arm.com>, Alexandre Courbot <gnurou@gmail.com>, Pawel Moll <pawel.moll@arm.com>, Stephen Warren <swarren@wwwdotorg.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, Paul Walmsley <pwalmsley@nvidia.com>, Kumar Gala <galak@codeaurora.org>, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


Add compatible strings for the SDHCI IP blocks present on several Tegra
chips.  The primary objective here is to avoid checkpatch warnings,
per:

http://marc.info/?l=linux-tegra&m=142201349727836&w=2

Signed-off-by: Paul Walmsley <paul@pwsan.com>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Pawel Moll <pawel.moll@arm.com>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Ian Campbell <ijc+devicetree@hellion.org.uk>
Cc: Kumar Gala <galak@codeaurora.org>
Cc: Stephen Warren <swarren@wwwdotorg.org>
Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: Alexandre Courbot <gnurou@gmail.com>
Cc: Paul Walmsley <pwalmsley@nvidia.com>
Cc: devicetree@vger.kernel.org
Cc: linux-tegra@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
---
 .../bindings/mmc/nvidia,tegra20-sdhci.txt          |    7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/mmc/nvidia,tegra20-sdhci.txt b/Documentation/devicetree/bindings/mmc/nvidia,tegra20-sdhci.txt
index f357c16ea815..877e5883ff14 100644
--- a/Documentation/devicetree/bindings/mmc/nvidia,tegra20-sdhci.txt
+++ b/Documentation/devicetree/bindings/mmc/nvidia,tegra20-sdhci.txt
@@ -7,7 +7,12 @@ This file documents differences between the core properties described
 by mmc.txt and the properties used by the sdhci-tegra driver.
 
 Required properties:
-- compatible : Should be "nvidia,<chip>-sdhci"
+- compatible : "nvidia,tegra20-sdhci"
+  "nvidia,tegra30-sdhci"
+  "nvidia,tegra114-sdhci"
+  "nvidia,tegra124-sdhci"
+  "nvidia,tegra132-sdhci" (not yet matched by the driver)
+  "nvidia,tegra210-sdhci" (not yet matched by the driver)
 - clocks : Must contain one entry, for the module clock.
   See ../clocks/clock-bindings.txt for details.
 - resets : Must contain an entry for each entry in reset-names.
