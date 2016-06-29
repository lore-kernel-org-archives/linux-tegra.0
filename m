From: Jon Hunter <jonathanh@nvidia.com>
Subject: [PATCH V2 06/11] dt-bindings: i2c: Add support for 'i2c-bus' subnode
Date: Wed, 29 Jun 2016 10:17:52 +0100
Message-ID: <1467191877-26017-7-git-send-email-jonathanh@nvidia.com>
References: <1467191877-26017-1-git-send-email-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <1467191877-26017-1-git-send-email-jonathanh@nvidia.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>, David Airlie <airlied@linux.ie>, Stephen Warren <swarren@wwwdotorg.org>, Alexandre Courbot <gnurou@gmail.com>, Wolfram Sang <wsa@the-dreams.de>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org, linux-i2c@vger.kernel.org, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, Jon Hunter <jonathanh@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

The I2C driver core for boards using device-tree assumes any subnode of
an I2C adapter in the device-tree blob is an I2C slave device. Although
this makes complete sense, some I2C adapters may have subnodes which
are not I2C slaves but subnodes presenting other features. For example
some Tegra devices have an I2C interface which may share its pins with
other devices. In order to share these pins using the pinctrl framework,
it is necessary to add subnodes to the I2C device node that represent
these pins.

To allow I2C adapters to have non-I2C specific subnodes in device-tree
that are not parsed by the I2C driver core, add support for an optional
'i2c-bus' subnode where I2C slaves can be placed. If the 'i2c-bus'
subnode is present then all I2C slaves must be placed under this
subnode.

Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
Acked-by: Thierry Reding <treding@nvidia.com>
Acked-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/i2c/i2c.txt | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/i2c/i2c.txt b/Documentation/devicetree/bindings/i2c/i2c.txt
index f31b2ad1552b..5fa691e6f638 100644
--- a/Documentation/devicetree/bindings/i2c/i2c.txt
+++ b/Documentation/devicetree/bindings/i2c/i2c.txt
@@ -32,6 +32,14 @@ wants to support one of the below features, it should adapt the bindings below.
 - clock-frequency
 	frequency of bus clock in Hz.
 
+- i2c-bus
+	For I2C adapters that have child nodes that are a mixture of both I2C
+	devices and non-I2C devices, the 'i2c-bus' subnode can be used for
+	populating I2C devices. If the 'i2c-bus' subnode is present, only
+	subnodes of this will be considered as I2C slaves. The properties,
+	'#address-cells' and '#size-cells' must be defined under this subnode
+	if present.
+
 - i2c-scl-falling-time-ns
 	Number of nanoseconds the SCL signal takes to fall; t(f) in the I2C
 	specification.
-- 
2.1.4

