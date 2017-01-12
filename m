From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Applied "regulator: core: Don't use regulators as supplies until the parent is bound" to the regulator tree
Date: Thu, 12 Jan 2017 17:46:14 +0000
Message-ID: <E1cRjS2-000078-4G@debutante>
References: <1484156665-20666-1-git-send-email-jonathanh@nvidia.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1484156665-20666-1-git-send-email-jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.orglinux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

The patch

   regulator: core: Don't use regulators as supplies until the parent is bound

has been applied to the regulator tree at

   git://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git 

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.  

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

From 66d228a2bf03b163ddaeca5f24f1ff89a84ad668 Mon Sep 17 00:00:00 2001
From: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Date: Wed, 11 Jan 2017 17:44:25 +0000
Subject: [PATCH] regulator: core: Don't use regulators as supplies until the
 parent is bound

When regulators are successfully registered, we check to see if the
regulator is a supply for any other registered regulator and if so
add the new regulator as the supply for the existing regulator(s).

Some devices, such as Power Management ICs, may register a series of
regulators when probed and there are cases where one of the regulators
may fail to register and defer the probing of the parent device. In this
case any successfully registered regulators would be unregistered so
that they can be re-registered at some time later when the probe is
attempted again. However, if one of the regulators that was registered
was added as a supply to another registered regulator (that did not
belong to the same parent device), then this supply regulator was
unregister again because the parent device is probe deferred, then a
regulator could be holding an invalid reference to a supply regulator
that has been unregistered. This will lead to a system crash if that
regulator is then used.

Although it would be possible to check when unregistering a regulator
if any other regulator in the system is using it as a supply, it still
may not be possible to remove it as a supply if this other regulator is
in use. Therefore, fix this by preventing any regulator from adding
another regulator as a supply if the parent device for the supply
regulator has not been bound and if the parent device for the supply
and the regulator are different. This will allow a parent device that is
registering regulators to be probe deferred and ensure that none of the
regulators it has registered are used as supplies for any other
regulator from another device.

Signed-off-by: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Signed-off-by: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
---
 drivers/regulator/core.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/regulator/core.c b/drivers/regulator/core.c
index 04baac9a165b..bcf67abd1cd2 100644
--- a/drivers/regulator/core.c
+++ b/drivers/regulator/core.c
@@ -1553,6 +1553,19 @@ static int regulator_resolve_supply(struct regulator_dev *rdev)
 		}
 	}
 
+	/*
+	 * If the supply's parent device is not the same as the
+	 * regulator's parent device, then ensure the parent device
+	 * is bound before we resolve the supply, in case the parent
+	 * device get probe deferred and unregisters the supply.
+	 */
+	if (r->dev.parent && r->dev.parent != rdev->dev.parent) {
+		if (!device_is_bound(r->dev.parent)) {
+			put_device(&r->dev);
+			return -EPROBE_DEFER;
+		}
+	}
+
 	/* Recursively resolve the supply of the supply */
 	ret = regulator_resolve_supply(r);
 	if (ret < 0) {
-- 
2.11.0
