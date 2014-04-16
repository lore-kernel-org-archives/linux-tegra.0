From: Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: [PATCH v2] pinctrl: as3722: fix handling of GPIO invert bit
Date: Wed, 16 Apr 2014 13:40:17 -0700
Message-ID: <1397680817-28470-1-git-send-email-abrestic@chromium.org>
References: <1397611505-17917-1-git-send-email-abrestic@chromium.org>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1397611505-17917-1-git-send-email-abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, stable-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

The AS3722_GPIO_INV bit will always be blindly overwritten by
as3722_pinctrl_gpio_set_direction() and will be ignored when
setting the value of the GPIO in as3722_gpio_set() since the
enable_gpio_invert flag is never set.  This will cause an
initially inverted GPIO to toggle when requested as an output,
which could be problematic if, for example, the GPIO controls
a critical regulator.

Instead of setting up the enable_gpio_invert flag, just leave
the invert bit alone and check it before setting the GPIO value.

Cc: <stable-u79uwXL29TY76Z2rM5mHXA@public.gmane.org> # v3.14+
Signed-off-by: Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Reviewed-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Tested-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
Changes from v1:
 - fixed typo
---
 drivers/pinctrl/pinctrl-as3722.c | 17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-as3722.c b/drivers/pinctrl/pinctrl-as3722.c
index 92ed4b2..c862f9c0 100644
--- a/drivers/pinctrl/pinctrl-as3722.c
+++ b/drivers/pinctrl/pinctrl-as3722.c
@@ -64,7 +64,6 @@ struct as3722_pin_function {
 };
 
 struct as3722_gpio_pin_control {
-	bool enable_gpio_invert;
 	unsigned mode_prop;
 	int io_function;
 };
@@ -320,10 +319,8 @@ static int as3722_pinctrl_gpio_set_direction(struct pinctrl_dev *pctldev,
 		return mode;
 	}
 
-	if (as_pci->gpio_control[offset].enable_gpio_invert)
-		mode |= AS3722_GPIO_INV;
-
-	return as3722_write(as3722, AS3722_GPIOn_CONTROL_REG(offset), mode);
+	return as3722_update_bits(as3722, AS3722_GPIOn_CONTROL_REG(offset),
+				AS3722_GPIO_MODE_MASK, mode);
 }
 
 static const struct pinmux_ops as3722_pinmux_ops = {
@@ -496,10 +493,18 @@ static void as3722_gpio_set(struct gpio_chip *chip, unsigned offset,
 {
 	struct as3722_pctrl_info *as_pci = to_as_pci(chip);
 	struct as3722 *as3722 = as_pci->as3722;
-	int en_invert = as_pci->gpio_control[offset].enable_gpio_invert;
+	int en_invert;
 	u32 val;
 	int ret;
 
+	ret = as3722_read(as3722, AS3722_GPIOn_CONTROL_REG(offset), &val);
+	if (ret < 0) {
+		dev_err(as_pci->dev,
+			"GPIO_CONTROL%d_REG read failed: %d\n", offset, ret);
+		return;
+	}
+	en_invert = !!(val & AS3722_GPIO_INV);
+
 	if (value)
 		val = (en_invert) ? 0 : AS3722_GPIOn_SIGNAL(offset);
 	else
-- 
1.9.1.423.g4596e3a
