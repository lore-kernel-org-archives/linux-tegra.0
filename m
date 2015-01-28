From: Paul Walmsley <paul@pwsan.com>
Subject: [PATCH 11/24] Documentation: DT bindings: add more chip compatible
 strings for Tegra SPI
Date: Wed, 28 Jan 2015 16:49:37 -0700
Message-ID: <20150128234937.20644.70546.stgit@dusk.lan>
References: <20150128234935.20644.89300.stgit@dusk.lan>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20150128234935.20644.89300.stgit@dusk.lan>
Sender: linux-kernel-owner@vger.kernel.org
Cc: Mark Rutland <mark.rutland@arm.com>, Alexandre Courbot <gnurou@gmail.com>, Pawel Moll <pawel.moll@arm.com>, Stephen Warren <swarren@wwwdotorg.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, Paul Walmsley <pwalmsley@nvidia.com>, Kumar Gala <galak@codeaurora.org>, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


Add compatible strings for the SPI IP blocks present on several Tegra
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
 .../bindings/spi/nvidia,tegra114-spi.txt           |    5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/spi/nvidia,tegra114-spi.txt b/Documentation/devicetree/bindings/spi/nvidia,tegra114-spi.txt
index 7ea701e07dc2..63b6d748f1cb 100644
--- a/Documentation/devicetree/bindings/spi/nvidia,tegra114-spi.txt
+++ b/Documentation/devicetree/bindings/spi/nvidia,tegra114-spi.txt
@@ -1,7 +1,10 @@
 NVIDIA Tegra114 SPI controller.
 
 Required properties:
-- compatible : should be "nvidia,tegra114-spi".
+- compatible : "nvidia,tegra114-spi"
+  "nvidia,tegra124-spi" (not yet matched by the driver)
+  "nvidia,tegra132-spi" (not yet matched by the driver)
+  "nvidia,tegra210-spi" (not yet matched by the driver)
 - reg: Should contain SPI registers location and length.
 - interrupts: Should contain SPI interrupts.
 - clock-names : Must include the following entries:
