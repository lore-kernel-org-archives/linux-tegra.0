From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v5 1/8] i2c: tegra: Fix suspending in active runtime PM state
Date: Tue, 14 Jan 2020 04:34:35 +0300
Message-ID: <20200114013442.28448-2-digetx@gmail.com>
References: <20200114013442.28448-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200114013442.28448-1-digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Mikko Perttunen <cyndis-/1wQRMveznE@public.gmane.org>, Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>
Cc: linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

I noticed that sometime I2C clock is kept enabled during suspend-resume.
This happens because runtime PM defers dynamic suspension and thus it may
happen that runtime PM is in active state when system enters into suspend.
In particular I2C controller that is used for CPU's DVFS is often kept ON
during suspend because CPU's voltage scaling happens quite often.

Fixes: 8ebf15e9c869 ("i2c: tegra: Move suspend handling to NOIRQ phase")
Cc: <stable-u79uwXL29TY76Z2rM5mHXA@public.gmane.org> # v5.4+
Tested-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Signed-off-by: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 drivers/i2c/busses/i2c-tegra.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index a98bf31d0e5c..79d19f6ce94e 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -1710,9 +1710,14 @@ static int tegra_i2c_remove(struct platform_device *pdev)
 static int __maybe_unused tegra_i2c_suspend(struct device *dev)
 {
 	struct tegra_i2c_dev *i2c_dev = dev_get_drvdata(dev);
+	int err;
 
 	i2c_mark_adapter_suspended(&i2c_dev->adapter);
 
+	err = pm_runtime_force_suspend(dev);
+	if (err < 0)
+		return err;
+
 	return 0;
 }
 
@@ -1733,6 +1738,10 @@ static int __maybe_unused tegra_i2c_resume(struct device *dev)
 	if (err)
 		return err;
 
+	err = pm_runtime_force_resume(dev);
+	if (err < 0)
+		return err;
+
 	i2c_mark_adapter_resumed(&i2c_dev->adapter);
 
 	return 0;
-- 
2.24.0
