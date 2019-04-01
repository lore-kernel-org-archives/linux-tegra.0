From: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH v2 1/6] dt-bindings: usb: xhci-tegra: Add Tegra186 support
Date: Mon,  1 Apr 2019 12:40:45 +0200
Message-ID: <20190401104050.31355-2-thierry.reding@gmail.com>
References: <20190401104050.31355-1-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190401104050.31355-1-thierry.reding@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Thierry Reding <thierry.reding@gmail.com>
Cc: Jon Hunter <jonathanh@nvidia.com>, linux-usb@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, Rob Herring <robh@kernel.org>, JC Kuo <jckuo@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

Extend the bindings to cover the set of features found in Tegra186.

Reviewed-by: Rob Herring <robh@kernel.org>
Reviewed-by: JC Kuo <jckuo@nvidia.com>
Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 .../devicetree/bindings/usb/nvidia,tegra124-xusb.txt          | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/nvidia,tegra124-xusb.txt b/Documentation/devicetree/bindings/usb/nvidia,tegra124-xusb.txt
index 4156c3e181c5..5bfcc0b4d6b9 100644
--- a/Documentation/devicetree/bindings/usb/nvidia,tegra124-xusb.txt
+++ b/Documentation/devicetree/bindings/usb/nvidia,tegra124-xusb.txt
@@ -10,6 +10,7 @@ Required properties:
   - Tegra124: "nvidia,tegra124-xusb"
   - Tegra132: "nvidia,tegra132-xusb", "nvidia,tegra124-xusb"
   - Tegra210: "nvidia,tegra210-xusb"
+  - Tegra186: "nvidia,tegra186-xusb"
 - reg: Must contain the base and length of the xHCI host registers, XUSB FPCI
   registers and XUSB IPFS registers.
 - reg-names: Must contain the following entries:
@@ -59,6 +60,8 @@ For Tegra210:
 - avdd-pll-uerefe-supply: PLLE reference PLL power supply. Must supply 1.05 V.
 - dvdd-pex-pll-supply: PCIe/USB3 PLL power supply. Must supply 1.05 V.
 - hvdd-pex-pll-e-supply: High-voltage PLLE power supply. Must supply 1.8 V.
+
+For Tegra210 and Tegra186:
 - power-domains: A list of PM domain specifiers that reference each power-domain
   used by the xHCI controller. This list must comprise of a specifier for the
   XUSBA and XUSBC power-domains. See ../power/power_domain.txt and
@@ -78,6 +81,7 @@ Optional properties:
   - Tegra132: usb2-0, usb2-1, usb2-2, hsic-0, hsic-1, usb3-0, usb3-1
   - Tegra210: usb2-0, usb2-1, usb2-2, usb2-3, hsic-0, usb3-0, usb3-1, usb3-2,
               usb3-3
+  - Tegra186: usb2-0, usb2-1, usb2-2, hsic-0, usb3-0, usb3-1, usb3-2
 
 Example:
 --------
-- 
2.21.0
