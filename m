From: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH v4 2/2] usb: host: ehci-tegra: Avoid getting the same reset twice
Date: Thu, 26 May 2016 17:23:30 +0200
Message-ID: <20160526152330.10929-2-thierry.reding@gmail.com>
References: <20160526152330.10929-1-thierry.reding@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20160526152330.10929-1-thierry.reding@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Alan Stern <stern@rowland.harvard.edu>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Stephen Warren <swarren@wwwdotorg.org>, Thierry Reding <thierry.reding@gmail.com>, Alexandre Courbot <gnurou@gmail.com>, Jon Hunter <jonathanh@nvidia.com>, linux-usb@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, Philipp Zabel <p.zabel@pengutronix.de>, Hans de Goede <hdegoede@redhat.com>
List-Id: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

Starting with commit 0b52297f2288 ("reset: Add support for shared reset
controls") there is a reference count for reset control assertions. The
goal is to allow resets to be shared by multiple devices and an assert
will take effect only when all instances have asserted the reset.

In order to preserve backwards-compatibility, all reset controls become
exclusive by default. This is to ensure that reset_control_assert() can
immediately assert in hardware.

However, this new behaviour triggers the following warning in the EHCI
driver for Tegra:

[    3.365019] ------------[ cut here ]------------
[    3.369639] WARNING: CPU: 0 PID: 1 at drivers/reset/core.c:187 __of_reset_control_get+0x16c/0x23c
[    3.382151] Modules linked in:
[    3.385214] CPU: 0 PID: 1 Comm: swapper/0 Not tainted 4.6.0-rc6-next-20160503 #140
[    3.392769] Hardware name: NVIDIA Tegra SoC (Flattened Device Tree)
[    3.399046] [<c010fa50>] (unwind_backtrace) from [<c010b120>] (show_stack+0x10/0x14)
[    3.406787] [<c010b120>] (show_stack) from [<c0347dcc>] (dump_stack+0x90/0xa4)
[    3.414007] [<c0347dcc>] (dump_stack) from [<c011f4fc>] (__warn+0xe8/0x100)
[    3.420964] [<c011f4fc>] (__warn) from [<c011f5c4>] (warn_slowpath_null+0x20/0x28)
[    3.428525] [<c011f5c4>] (warn_slowpath_null) from [<c03cc8cc>] (__of_reset_control_get+0x16c/0x23c)
[    3.437648] [<c03cc8cc>] (__of_reset_control_get) from [<c0526858>] (tegra_ehci_probe+0x394/0x518)
[    3.446600] [<c0526858>] (tegra_ehci_probe) from [<c04516d8>] (platform_drv_probe+0x4c/0xb0)
[    3.455029] [<c04516d8>] (platform_drv_probe) from [<c044fe78>] (driver_probe_device+0x1ec/0x330)
[    3.463892] [<c044fe78>] (driver_probe_device) from [<c0450074>] (__driver_attach+0xb8/0xbc)
[    3.472320] [<c0450074>] (__driver_attach) from [<c044e1ec>] (bus_for_each_dev+0x68/0x9c)
[    3.480489] [<c044e1ec>] (bus_for_each_dev) from [<c044f338>] (bus_add_driver+0x1a0/0x218)
[    3.488743] [<c044f338>] (bus_add_driver) from [<c0450768>] (driver_register+0x78/0xf8)
[    3.496738] [<c0450768>] (driver_register) from [<c010178c>] (do_one_initcall+0x40/0x170)
[    3.504909] [<c010178c>] (do_one_initcall) from [<c0c00ddc>] (kernel_init_freeable+0x158/0x1f8)
[    3.513600] [<c0c00ddc>] (kernel_init_freeable) from [<c0810784>] (kernel_init+0x8/0x114)
[    3.521770] [<c0810784>] (kernel_init) from [<c0107778>] (ret_from_fork+0x14/0x3c)
[    3.529361] ---[ end trace 4bda87dbe4ecef8a ]---

The reason is that Tegra SoCs have three EHCI controllers, each with a
separate reset line. However the first controller contains UTMI pads
configuration registers that are shared with its siblings and that are
reset as part of the first controller's reset. There is special code in
the driver to assert and deassert this shared reset at probe time, and
it does so irrespective of which controller is probed first to ensure
that these shared registers are reset before any of the controllers are
initialized. Unfortunately this means that if the first controller gets
probed first, it will request its own reset line and will subsequently
request the same reset line again (temporarily) to perform the reset.
This used to work fine before the above-mentioned commit, but now
triggers the new WARN.

Work around this by making sure we reuse the controller's reset if the
controller happens to be the first controller.

Cc: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Hans de Goede <hdegoede@redhat.com>
Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>
Signed-off-by: Thierry Reding <treding@nvidia.com>
---
Changes in v4:
- avoid calling reset_control_put() on ERR_PTR()-encoded error codes

Changes in v3:
- reword commit message to more accurately describe the hardware design

Changes in v2:
- restore has_utmi_pad_registers condition (Alan Stern)

 drivers/usb/host/ehci-tegra.c | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/host/ehci-tegra.c b/drivers/usb/host/ehci-tegra.c
index c1c1024a054c..9a3d7db5be57 100644
--- a/drivers/usb/host/ehci-tegra.c
+++ b/drivers/usb/host/ehci-tegra.c
@@ -81,15 +81,23 @@ static int tegra_reset_usb_controller(struct platform_device *pdev)
 	struct usb_hcd *hcd = platform_get_drvdata(pdev);
 	struct tegra_ehci_hcd *tegra =
 		(struct tegra_ehci_hcd *)hcd_to_ehci(hcd)->priv;
+	bool has_utmi_pad_registers = false;
 
 	phy_np = of_parse_phandle(pdev->dev.of_node, "nvidia,phy", 0);
 	if (!phy_np)
 		return -ENOENT;
 
+	if (of_property_read_bool(phy_np, "nvidia,has-utmi-pad-registers"))
+		has_utmi_pad_registers = true;
+
 	if (!usb1_reset_attempted) {
 		struct reset_control *usb1_reset;
 
-		usb1_reset = of_reset_control_get(phy_np, "utmi-pads");
+		if (!has_utmi_pad_registers)
+			usb1_reset = of_reset_control_get(phy_np, "utmi-pads");
+		else
+			usb1_reset = tegra->rst;
+
 		if (IS_ERR(usb1_reset)) {
 			dev_warn(&pdev->dev,
 				 "can't get utmi-pads reset from the PHY\n");
@@ -99,13 +107,15 @@ static int tegra_reset_usb_controller(struct platform_device *pdev)
 			reset_control_assert(usb1_reset);
 			udelay(1);
 			reset_control_deassert(usb1_reset);
+
+			if (!has_utmi_pad_registers)
+				reset_control_put(usb1_reset);
 		}
 
-		reset_control_put(usb1_reset);
 		usb1_reset_attempted = true;
 	}
 
-	if (!of_property_read_bool(phy_np, "nvidia,has-utmi-pad-registers")) {
+	if (!has_utmi_pad_registers) {
 		reset_control_assert(tegra->rst);
 		udelay(1);
 		reset_control_deassert(tegra->rst);
-- 
2.8.3
