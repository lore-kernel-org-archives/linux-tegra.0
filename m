From: Dmitry Osipenko <digetx@gmail.com>
Subject: [PATCH v3 01/16] dt-binding: usb: ci-hdrc-usb2: Document NVIDIA Tegra support
Date: Sat, 28 Dec 2019 23:33:43 +0300
Message-ID: <20191228203358.23490-2-digetx@gmail.com>
References: <20191228203358.23490-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191228203358.23490-1-digetx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Peter Chen <Peter.Chen@nxp.com>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Felipe Balbi <balbi@kernel.org>
Cc: devicetree@vger.kernel.org, linux-usb@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

NVIDIA Tegra SoCs use ChipIdea silicon IP for the USB controllers.

Acked-by: Peter Chen <peter.chen@nxp.com>
Acked-by: Thierry Reding <treding@nvidia.com>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 Documentation/devicetree/bindings/usb/ci-hdrc-usb2.txt | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.txt b/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.txt
index cfc9f40ab641..51376cbe5f3d 100644
--- a/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.txt
+++ b/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.txt
@@ -15,6 +15,10 @@ Required properties:
 	"qcom,ci-hdrc"
 	"chipidea,usb2"
 	"xlnx,zynq-usb-2.20a"
+	"nvidia,tegra20-udc"
+	"nvidia,tegra30-udc"
+	"nvidia,tegra114-udc"
+	"nvidia,tegra124-udc"
 - reg: base address and length of the registers
 - interrupts: interrupt for the USB controller
 
-- 
2.24.0
