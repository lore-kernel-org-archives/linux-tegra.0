From: Tomeu Vizoso <tomeu.vizoso@collabora.com>
Subject: [PATCH v8 07/18] of: document external-memory-controller property in tegra124-car
Date: Thu, 12 Mar 2015 15:47:59 +0100
Message-ID: <1426171746-26864-8-git-send-email-tomeu.vizoso@collabora.com>
References: <1426171746-26864-1-git-send-email-tomeu.vizoso@collabora.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1426171746-26864-1-git-send-email-tomeu.vizoso@collabora.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-tegra@vger.kernel.org
Cc: Mikko Perttunen <mikko.perttunen@kapsi.fi>, Tomeu Vizoso <tomeu.vizoso@collabora.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Stephen Warren <swarren@wwwdotorg.org>, Thierry Reding <thierry.reding@gmail.com>, Alexandre Courbot <gnurou@gmail.com>, Paul Walmsley <paul@pwsan.com>, Peter De Schrijver <pdeschrijver@nvidia.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

This property contains a phandle to the EMC driver that is needed by the
EMC clock to request the EMC driver to do its part of the clock change
sequence.

Signed-off-by: Tomeu Vizoso <tomeu.vizoso@collabora.com>
---
 Documentation/devicetree/bindings/clock/nvidia,tegra124-car.txt | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/nvidia,tegra124-car.txt b/Documentation/devicetree/bindings/clock/nvidia,tegra124-car.txt
index c3891ce..7f02fb4 100644
--- a/Documentation/devicetree/bindings/clock/nvidia,tegra124-car.txt
+++ b/Documentation/devicetree/bindings/clock/nvidia,tegra124-car.txt
@@ -20,6 +20,7 @@ Required properties :
 - #reset-cells : Should be 1.
   In clock consumers, this cell represents the bit number in the CAR's
   array of CLK_RST_CONTROLLER_RST_DEVICES_* registers.
+- nvidia,external-memory-controller : phandle of the EMC driver.
 
 The node should contain a "emc-timings" subnode for each supported RAM type (see
 field RAM_CODE in register PMC_STRAPPING_OPT_A).
@@ -50,6 +51,7 @@ Example SoC include file:
 		reg = <0x60006000 0x1000>;
 		#clock-cells = <1>;
 		#reset-cells = <1>;
+		nvidia,external-memory-controller = <&emc>;
 	};
 
 	usb@c5004000 {
-- 
2.1.0
