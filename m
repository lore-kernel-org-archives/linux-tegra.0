From: Paul Walmsley <paul@pwsan.com>
Subject: [PATCH 22/24] Documentation: DT bindings: add more chip compatible
 strings for Tegra EHCI
Date: Wed, 28 Jan 2015 16:49:38 -0700
Message-ID: <20150128234938.20644.87931.stgit@dusk.lan>
References: <20150128234935.20644.89300.stgit@dusk.lan>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20150128234935.20644.89300.stgit@dusk.lan>
Sender: linux-kernel-owner@vger.kernel.org
Cc: Mark Rutland <mark.rutland@arm.com>, Alexandre Courbot <gnurou@gmail.com>, Pawel Moll <pawel.moll@arm.com>, Stephen Warren <swarren@wwwdotorg.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, Paul Walmsley <pwalmsley@nvidia.com>, Kumar Gala <galak@codeaurora.org>, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


Add compatible strings for the EHCI IP blocks present on several Tegra
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
 .../bindings/usb/nvidia,tegra20-ehci.txt           |    7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/usb/nvidia,tegra20-ehci.txt b/Documentation/devicetree/bindings/usb/nvidia,tegra20-ehci.txt
index 3dc9140e3dfb..5c95962d350a 100644
--- a/Documentation/devicetree/bindings/usb/nvidia,tegra20-ehci.txt
+++ b/Documentation/devicetree/bindings/usb/nvidia,tegra20-ehci.txt
@@ -6,7 +6,12 @@ Practice : Universal Serial Bus" with the following modifications
 and additions :
 
 Required properties :
- - compatible : Should be "nvidia,tegra20-ehci".
+ - compatible : "nvidia,tegra20-ehci"
+   "nvidia,tegra30-ehci"
+   "nvidia,tegra114-ehci" (not yet matched by the driver)
+   "nvidia,tegra124-ehci" (not yet matched by the driver)
+   "nvidia,tegra132-ehci" (not yet matched by the driver)
+   "nvidia,tegra210-ehci" (not yet matched by the driver)
  - nvidia,phy : phandle of the PHY that the controller is connected to.
  - clocks : Must contain one entry, for the module clock.
    See ../clocks/clock-bindings.txt for details.
