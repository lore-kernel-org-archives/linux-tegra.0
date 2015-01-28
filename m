From: Paul Walmsley <paul@pwsan.com>
Subject: [PATCH 13/24] Documentation: DT bindings: add more chip compatible
 strings for Tegra PMC
Date: Wed, 28 Jan 2015 16:49:38 -0700
Message-ID: <20150128234938.20644.51314.stgit@dusk.lan>
References: <20150128234935.20644.89300.stgit@dusk.lan>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20150128234935.20644.89300.stgit@dusk.lan>
Sender: linux-kernel-owner@vger.kernel.org
Cc: Mark Rutland <mark.rutland@arm.com>, Alexandre Courbot <gnurou@gmail.com>, Pawel Moll <pawel.moll@arm.com>, Stephen Warren <swarren@wwwdotorg.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, Paul Walmsley <pwalmsley@nvidia.com>, Kumar Gala <galak@codeaurora.org>, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


Add compatible strings for the PMC IP block present on several Tegra
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
 .../bindings/arm/tegra/nvidia,tegra20-pmc.txt      |    6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/arm/tegra/nvidia,tegra20-pmc.txt b/Documentation/devicetree/bindings/arm/tegra/nvidia,tegra20-pmc.txt
index 68ac65f82a1c..84bb31e7b778 100644
--- a/Documentation/devicetree/bindings/arm/tegra/nvidia,tegra20-pmc.txt
+++ b/Documentation/devicetree/bindings/arm/tegra/nvidia,tegra20-pmc.txt
@@ -6,7 +6,11 @@ modes. It provides power-gating controllers for SoC and CPU power-islands.
 
 Required properties:
 - name : Should be pmc
-- compatible : Should contain "nvidia,tegra<chip>-pmc".
+- compatible : "nvidia,tegra20-pmc"
+  "nvidia,tegra30-pmc"
+  "nvidia,tegra114-pmc"
+  "nvidia,tegra124-pmc"
+  "nvidia,tegra132-pmc" (not yet matched by the driver)
 - reg : Offset and length of the register set for the device
 - clocks : Must contain an entry for each entry in clock-names.
   See ../clocks/clock-bindings.txt for details.
