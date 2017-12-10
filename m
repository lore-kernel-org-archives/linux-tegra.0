From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v1 2/2] drm/tegra: Support disabled CONFIG_PM
Date: Mon, 11 Dec 2017 02:19:44 +0300
Message-ID: <02bccd8c39c0e7e9d3c6733e238e291e8297c830.1512947732.git.digetx@gmail.com>
References: <85902b42264b094cbf7cf30930f8c0bbccdca1b7.1512947732.git.digetx@gmail.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <85902b42264b094cbf7cf30930f8c0bbccdca1b7.1512947732.git.digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
In-Reply-To: <85902b42264b094cbf7cf30930f8c0bbccdca1b7.1512947732.git.digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
References: <85902b42264b094cbf7cf30930f8c0bbccdca1b7.1512947732.git.digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Add manual HW power management to drivers probe/remove in order to
not fail in a case of runtime power management being disabled in kernel
config.

Signed-off-by: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 drivers/gpu/drm/tegra/dc.c   | 164 +++++++++++++++++++++++++++----------------
 drivers/gpu/drm/tegra/dsi.c  | 138 +++++++++++++++++++++---------------
 drivers/gpu/drm/tegra/hdmi.c |  90 ++++++++++++++++--------
 drivers/gpu/drm/tegra/sor.c  | 103 +++++++++++++++++----------
 4 files changed, 310 insertions(+), 185 deletions(-)

diff --git a/drivers/gpu/drm/tegra/dc.c b/drivers/gpu/drm/tegra/dc.c
index 6139d3e9cedf..9d442be081c5 100644
--- a/drivers/gpu/drm/tegra/dc.c
+++ b/drivers/gpu/drm/tegra/dc.c
@@ -1967,6 +1967,88 @@ static int tegra_dc_parse_dt(struct tegra_dc *dc)
 	return 0;
 }
 
+static int tegra_dc_power_off(struct tegra_dc *dc)
+{
+	int err;
+
+	err = reset_control_assert(dc->rst);
+	if (err) {
+		dev_err(dc->dev, "failed to assert reset: %d\n", err);
+		return err;
+	}
+
+	usleep_range(2000, 4000);
+
+	if (dc->soc->has_powergate)
+		tegra_powergate_power_off(dc->powergate);
+
+	clk_disable_unprepare(dc->clk);
+
+	return 0;
+}
+
+static int tegra_dc_power_on(struct tegra_dc *dc)
+{
+	int err;
+
+	if (dc->soc->has_powergate) {
+		err = tegra_powergate_sequence_power_up(dc->powergate, dc->clk,
+							dc->rst);
+		if (err) {
+			dev_err(dc->dev, "failed to power partition: %d\n",
+				err);
+			return err;
+		}
+	} else {
+		err = clk_prepare_enable(dc->clk);
+		if (err) {
+			dev_err(dc->dev, "failed to enable clock: %d\n", err);
+			return err;
+		}
+
+		err = reset_control_deassert(dc->rst);
+		if (err) {
+			dev_err(dc->dev, "failed to deassert reset: %d\n", err);
+			return err;
+		}
+	}
+
+	return err;
+}
+
+static int tegra_dc_hw_init(struct tegra_dc *dc)
+{
+	int err;
+
+	err = clk_prepare_enable(dc->clk);
+	if (err) {
+		dev_err(dc->dev, "failed to enable clock: %d\n", err);
+		return err;
+	}
+
+	usleep_range(2000, 4000);
+	err = reset_control_assert(dc->rst);
+	usleep_range(2000, 4000);
+
+	clk_disable_unprepare(dc->clk);
+
+	if (err) {
+		dev_err(dc->dev, "failed to assert reset: %d\n", err);
+		return err;
+	}
+
+	if (dc->soc->has_powergate) {
+		if (dc->pipe == 0)
+			dc->powergate = TEGRA_POWERGATE_DIS;
+		else
+			dc->powergate = TEGRA_POWERGATE_DISB;
+
+		tegra_powergate_power_off(dc->powergate);
+	}
+
+	return 0;
+}
+
 static int tegra_dc_probe(struct platform_device *pdev)
 {
 	struct resource *regs;
@@ -2017,30 +2099,10 @@ static int tegra_dc_probe(struct platform_device *pdev)
 		return PTR_ERR(dc->rst);
 	}
 
-	/* assert reset and disable clock */
-	err = clk_prepare_enable(dc->clk);
-	if (err < 0)
+	err = tegra_dc_hw_init(dc);
+	if (err)
 		return err;
 
-	usleep_range(2000, 4000);
-
-	err = reset_control_assert(dc->rst);
-	if (err < 0)
-		return err;
-
-	usleep_range(2000, 4000);
-
-	clk_disable_unprepare(dc->clk);
-
-	if (dc->soc->has_powergate) {
-		if (dc->pipe == 0)
-			dc->powergate = TEGRA_POWERGATE_DIS;
-		else
-			dc->powergate = TEGRA_POWERGATE_DISB;
-
-		tegra_powergate_power_off(dc->powergate);
-	}
-
 	regs = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	dc->regs = devm_ioremap_resource(&pdev->dev, regs);
 	if (IS_ERR(dc->regs))
@@ -2061,6 +2123,12 @@ static int tegra_dc_probe(struct platform_device *pdev)
 	platform_set_drvdata(pdev, dc);
 	pm_runtime_enable(&pdev->dev);
 
+	if (!pm_runtime_enabled(&pdev->dev)) {
+		err = tegra_dc_power_on(dc);
+		if (err)
+			return err;
+	}
+
 	INIT_LIST_HEAD(&dc->client.list);
 	dc->client.ops = &dc_client_ops;
 	dc->client.dev = &pdev->dev;
@@ -2069,13 +2137,19 @@ static int tegra_dc_probe(struct platform_device *pdev)
 	if (err < 0) {
 		dev_err(&pdev->dev, "failed to register host1x client: %d\n",
 			err);
-		return err;
+		goto power_off;
 	}
 
 	if (dc->pipe == 0)
 		dc0 = dc;
 
 	return 0;
+
+power_off:
+	if (!pm_runtime_enabled(&pdev->dev))
+		tegra_dc_power_off(dc);
+
+	return err;
 }
 
 static int tegra_dc_remove(struct platform_device *pdev)
@@ -2096,6 +2170,12 @@ static int tegra_dc_remove(struct platform_device *pdev)
 		return err;
 	}
 
+	if (!pm_runtime_enabled(&pdev->dev)) {
+		err = tegra_dc_power_off(dc);
+		if (err)
+			return err;
+	}
+
 	pm_runtime_disable(&pdev->dev);
 
 	if (dc == dc0)
@@ -2108,49 +2188,15 @@ static int tegra_dc_remove(struct platform_device *pdev)
 static int tegra_dc_suspend(struct device *dev)
 {
 	struct tegra_dc *dc = dev_get_drvdata(dev);
-	int err;
 
-	err = reset_control_assert(dc->rst);
-	if (err < 0) {
-		dev_err(dev, "failed to assert reset: %d\n", err);
-		return err;
-	}
-
-	if (dc->soc->has_powergate)
-		tegra_powergate_power_off(dc->powergate);
-
-	clk_disable_unprepare(dc->clk);
-
-	return 0;
+	return tegra_dc_power_off(dc);
 }
 
 static int tegra_dc_resume(struct device *dev)
 {
 	struct tegra_dc *dc = dev_get_drvdata(dev);
-	int err;
 
-	if (dc->soc->has_powergate) {
-		err = tegra_powergate_sequence_power_up(dc->powergate, dc->clk,
-							dc->rst);
-		if (err < 0) {
-			dev_err(dev, "failed to power partition: %d\n", err);
-			return err;
-		}
-	} else {
-		err = clk_prepare_enable(dc->clk);
-		if (err < 0) {
-			dev_err(dev, "failed to enable clock: %d\n", err);
-			return err;
-		}
-
-		err = reset_control_deassert(dc->rst);
-		if (err < 0) {
-			dev_err(dev, "failed to deassert reset: %d\n", err);
-			return err;
-		}
-	}
-
-	return 0;
+	return tegra_dc_power_on(dc);
 }
 #endif
 
diff --git a/drivers/gpu/drm/tegra/dsi.c b/drivers/gpu/drm/tegra/dsi.c
index 046649ec9441..540101a84311 100644
--- a/drivers/gpu/drm/tegra/dsi.c
+++ b/drivers/gpu/drm/tegra/dsi.c
@@ -1489,6 +1489,71 @@ static int tegra_dsi_ganged_probe(struct tegra_dsi *dsi)
 	return 0;
 }
 
+static int tegra_dsi_power_off(struct tegra_dsi *dsi)
+{
+	int err;
+
+	if (dsi->rst) {
+		err = reset_control_assert(dsi->rst);
+		if (err < 0) {
+			dev_err(dsi->dev, "failed to assert reset: %d\n", err);
+			return err;
+		}
+	}
+
+	usleep_range(1000, 2000);
+
+	clk_disable_unprepare(dsi->clk_lp);
+	clk_disable_unprepare(dsi->clk);
+
+	regulator_disable(dsi->vdd);
+
+	return 0;
+}
+
+static int tegra_dsi_power_on(struct tegra_dsi *dsi)
+{
+	int err;
+
+	err = regulator_enable(dsi->vdd);
+	if (err < 0) {
+		dev_err(dsi->dev, "failed to enable VDD supply: %d\n", err);
+		return err;
+	}
+
+	err = clk_prepare_enable(dsi->clk);
+	if (err < 0) {
+		dev_err(dsi->dev, "cannot enable DSI clock: %d\n", err);
+		goto disable_vdd;
+	}
+
+	err = clk_prepare_enable(dsi->clk_lp);
+	if (err < 0) {
+		dev_err(dsi->dev, "cannot enable low-power clock: %d\n", err);
+		goto disable_clk;
+	}
+
+	usleep_range(1000, 2000);
+
+	if (dsi->rst) {
+		err = reset_control_deassert(dsi->rst);
+		if (err < 0) {
+			dev_err(dsi->dev, "cannot assert reset: %d\n", err);
+			goto disable_clk_lp;
+		}
+	}
+
+	return 0;
+
+disable_clk_lp:
+	clk_disable_unprepare(dsi->clk_lp);
+disable_clk:
+	clk_disable_unprepare(dsi->clk);
+disable_vdd:
+	regulator_disable(dsi->vdd);
+	return err;
+}
+
 static int tegra_dsi_probe(struct platform_device *pdev)
 {
 	struct tegra_dsi *dsi;
@@ -1579,6 +1644,12 @@ static int tegra_dsi_probe(struct platform_device *pdev)
 	platform_set_drvdata(pdev, dsi);
 	pm_runtime_enable(&pdev->dev);
 
+	if (!pm_runtime_enabled(&pdev->dev)) {
+		err = tegra_dsi_power_on(dsi);
+		if (err)
+			goto unregister;
+	}
+
 	INIT_LIST_HEAD(&dsi->client.list);
 	dsi->client.ops = &dsi_client_ops;
 	dsi->client.dev = &pdev->dev;
@@ -1604,8 +1675,6 @@ static int tegra_dsi_remove(struct platform_device *pdev)
 	struct tegra_dsi *dsi = platform_get_drvdata(pdev);
 	int err;
 
-	pm_runtime_disable(&pdev->dev);
-
 	err = host1x_client_unregister(&dsi->client);
 	if (err < 0) {
 		dev_err(&pdev->dev, "failed to unregister host1x client: %d\n",
@@ -1618,6 +1687,14 @@ static int tegra_dsi_remove(struct platform_device *pdev)
 	mipi_dsi_host_unregister(&dsi->host);
 	tegra_mipi_free(dsi->mipi);
 
+	if (!pm_runtime_enabled(&pdev->dev)) {
+		err = tegra_dsi_power_off(dsi);
+		if (err)
+			return err;
+	}
+
+	pm_runtime_disable(&pdev->dev);
+
 	return 0;
 }
 
@@ -1625,68 +1702,15 @@ static int tegra_dsi_remove(struct platform_device *pdev)
 static int tegra_dsi_suspend(struct device *dev)
 {
 	struct tegra_dsi *dsi = dev_get_drvdata(dev);
-	int err;
-
-	if (dsi->rst) {
-		err = reset_control_assert(dsi->rst);
-		if (err < 0) {
-			dev_err(dev, "failed to assert reset: %d\n", err);
-			return err;
-		}
-	}
-
-	usleep_range(1000, 2000);
-
-	clk_disable_unprepare(dsi->clk_lp);
-	clk_disable_unprepare(dsi->clk);
-
-	regulator_disable(dsi->vdd);
 
-	return 0;
+	return tegra_dsi_power_off(dsi);
 }
 
 static int tegra_dsi_resume(struct device *dev)
 {
 	struct tegra_dsi *dsi = dev_get_drvdata(dev);
-	int err;
 
-	err = regulator_enable(dsi->vdd);
-	if (err < 0) {
-		dev_err(dsi->dev, "failed to enable VDD supply: %d\n", err);
-		return err;
-	}
-
-	err = clk_prepare_enable(dsi->clk);
-	if (err < 0) {
-		dev_err(dev, "cannot enable DSI clock: %d\n", err);
-		goto disable_vdd;
-	}
-
-	err = clk_prepare_enable(dsi->clk_lp);
-	if (err < 0) {
-		dev_err(dev, "cannot enable low-power clock: %d\n", err);
-		goto disable_clk;
-	}
-
-	usleep_range(1000, 2000);
-
-	if (dsi->rst) {
-		err = reset_control_deassert(dsi->rst);
-		if (err < 0) {
-			dev_err(dev, "cannot assert reset: %d\n", err);
-			goto disable_clk_lp;
-		}
-	}
-
-	return 0;
-
-disable_clk_lp:
-	clk_disable_unprepare(dsi->clk_lp);
-disable_clk:
-	clk_disable_unprepare(dsi->clk);
-disable_vdd:
-	regulator_disable(dsi->vdd);
-	return err;
+	return tegra_dsi_power_on(dsi);
 }
 #endif
 
diff --git a/drivers/gpu/drm/tegra/hdmi.c b/drivers/gpu/drm/tegra/hdmi.c
index 6434b3d3d1ba..c8c668b44a4b 100644
--- a/drivers/gpu/drm/tegra/hdmi.c
+++ b/drivers/gpu/drm/tegra/hdmi.c
@@ -1664,6 +1664,45 @@ static irqreturn_t tegra_hdmi_irq(int irq, void *data)
 	return IRQ_HANDLED;
 }
 
+static int tegra_hdmi_power_off(struct tegra_hdmi *hdmi)
+{
+	int err;
+
+	err = reset_control_assert(hdmi->rst);
+	if (err < 0) {
+		dev_err(hdmi->dev, "failed to assert reset: %d\n", err);
+		return err;
+	}
+
+	usleep_range(1000, 2000);
+
+	clk_disable_unprepare(hdmi->clk);
+
+	return 0;
+}
+
+static int tegra_hdmi_power_on(struct tegra_hdmi *hdmi)
+{
+	int err;
+
+	err = clk_prepare_enable(hdmi->clk);
+	if (err < 0) {
+		dev_err(hdmi->dev, "failed to enable clock: %d\n", err);
+		return err;
+	}
+
+	usleep_range(1000, 2000);
+
+	err = reset_control_deassert(hdmi->rst);
+	if (err < 0) {
+		dev_err(hdmi->dev, "failed to deassert reset: %d\n", err);
+		clk_disable_unprepare(hdmi->clk);
+		return err;
+	}
+
+	return 0;
+}
+
 static int tegra_hdmi_probe(struct platform_device *pdev)
 {
 	struct tegra_hdmi *hdmi;
@@ -1755,6 +1794,12 @@ static int tegra_hdmi_probe(struct platform_device *pdev)
 	platform_set_drvdata(pdev, hdmi);
 	pm_runtime_enable(&pdev->dev);
 
+	if (!pm_runtime_enabled(&pdev->dev)) {
+		err = tegra_hdmi_power_on(hdmi);
+		if (err)
+			return err;
+	}
+
 	INIT_LIST_HEAD(&hdmi->client.list);
 	hdmi->client.ops = &hdmi_client_ops;
 	hdmi->client.dev = &pdev->dev;
@@ -1763,6 +1808,10 @@ static int tegra_hdmi_probe(struct platform_device *pdev)
 	if (err < 0) {
 		dev_err(&pdev->dev, "failed to register host1x client: %d\n",
 			err);
+
+		if (!pm_runtime_enabled(&pdev->dev))
+			tegra_hdmi_power_off(hdmi);
+
 		return err;
 	}
 
@@ -1774,8 +1823,6 @@ static int tegra_hdmi_remove(struct platform_device *pdev)
 	struct tegra_hdmi *hdmi = platform_get_drvdata(pdev);
 	int err;
 
-	pm_runtime_disable(&pdev->dev);
-
 	err = host1x_client_unregister(&hdmi->client);
 	if (err < 0) {
 		dev_err(&pdev->dev, "failed to unregister host1x client: %d\n",
@@ -1788,6 +1835,14 @@ static int tegra_hdmi_remove(struct platform_device *pdev)
 	if (hdmi->output.notifier)
 		cec_notifier_put(hdmi->output.notifier);
 
+	if (!pm_runtime_enabled(&pdev->dev)) {
+		err = tegra_hdmi_power_off(hdmi);
+		if (err)
+			return err;
+	}
+
+	pm_runtime_disable(&pdev->dev);
+
 	return 0;
 }
 
@@ -1795,42 +1850,15 @@ static int tegra_hdmi_remove(struct platform_device *pdev)
 static int tegra_hdmi_suspend(struct device *dev)
 {
 	struct tegra_hdmi *hdmi = dev_get_drvdata(dev);
-	int err;
 
-	err = reset_control_assert(hdmi->rst);
-	if (err < 0) {
-		dev_err(dev, "failed to assert reset: %d\n", err);
-		return err;
-	}
-
-	usleep_range(1000, 2000);
-
-	clk_disable_unprepare(hdmi->clk);
-
-	return 0;
+	return tegra_hdmi_power_off(hdmi);
 }
 
 static int tegra_hdmi_resume(struct device *dev)
 {
 	struct tegra_hdmi *hdmi = dev_get_drvdata(dev);
-	int err;
 
-	err = clk_prepare_enable(hdmi->clk);
-	if (err < 0) {
-		dev_err(dev, "failed to enable clock: %d\n", err);
-		return err;
-	}
-
-	usleep_range(1000, 2000);
-
-	err = reset_control_deassert(hdmi->rst);
-	if (err < 0) {
-		dev_err(dev, "failed to deassert reset: %d\n", err);
-		clk_disable_unprepare(hdmi->clk);
-		return err;
-	}
-
-	return 0;
+	return tegra_hdmi_power_on(hdmi);
 }
 #endif
 
diff --git a/drivers/gpu/drm/tegra/sor.c b/drivers/gpu/drm/tegra/sor.c
index b0a1dedac802..a98b2b0bd679 100644
--- a/drivers/gpu/drm/tegra/sor.c
+++ b/drivers/gpu/drm/tegra/sor.c
@@ -2542,6 +2542,50 @@ static const struct of_device_id tegra_sor_of_match[] = {
 };
 MODULE_DEVICE_TABLE(of, tegra_sor_of_match);
 
+static int tegra_sor_power_off(struct tegra_sor *sor)
+{
+	int err;
+
+	if (sor->rst) {
+		err = reset_control_assert(sor->rst);
+		if (err < 0) {
+			dev_err(sor->dev, "failed to assert reset: %d\n", err);
+			return err;
+		}
+	}
+
+	usleep_range(1000, 2000);
+
+	clk_disable_unprepare(sor->clk);
+
+	return 0;
+}
+
+static int tegra_sor_power_on(struct tegra_sor *sor)
+{
+	int err;
+
+	err = clk_prepare_enable(sor->clk);
+	if (err < 0) {
+		dev_err(sor->dev, "failed to enable clock: %d\n", err);
+		return err;
+	}
+
+	usleep_range(1000, 2000);
+
+	if (sor->rst) {
+		err = reset_control_deassert(sor->rst);
+		if (err < 0) {
+			dev_err(sor->dev, "failed to deassert reset: %d\n",
+				err);
+			clk_disable_unprepare(sor->clk);
+			return err;
+		}
+	}
+
+	return 0;
+}
+
 static int tegra_sor_probe(struct platform_device *pdev)
 {
 	struct device_node *np;
@@ -2712,6 +2756,12 @@ static int tegra_sor_probe(struct platform_device *pdev)
 	platform_set_drvdata(pdev, sor);
 	pm_runtime_enable(&pdev->dev);
 
+	if (!pm_runtime_enabled(&pdev->dev)) {
+		err = tegra_sor_power_on(sor);
+		if (err)
+			goto remove;
+	}
+
 	/*
 	 * On Tegra210 and earlier, provide our own implementation for the
 	 * pad output clock.
@@ -2721,7 +2771,7 @@ static int tegra_sor_probe(struct platform_device *pdev)
 		if (err < 0) {
 			dev_err(&pdev->dev, "failed to get runtime PM: %d\n",
 				err);
-			goto remove;
+			goto poweroff;
 		}
 
 		sor->clk_pad = tegra_clk_sor_pad_register(sor,
@@ -2733,7 +2783,7 @@ static int tegra_sor_probe(struct platform_device *pdev)
 		err = PTR_ERR(sor->clk_pad);
 		dev_err(&pdev->dev, "failed to register SOR pad clock: %d\n",
 			err);
-		goto remove;
+		goto poweroff;
 	}
 
 	INIT_LIST_HEAD(&sor->client.list);
@@ -2744,11 +2794,14 @@ static int tegra_sor_probe(struct platform_device *pdev)
 	if (err < 0) {
 		dev_err(&pdev->dev, "failed to register host1x client: %d\n",
 			err);
-		goto remove;
+		goto poweroff;
 	}
 
 	return 0;
 
+poweroff:
+	if (!pm_runtime_enabled(&pdev->dev))
+		tegra_sor_power_off(sor);
 remove:
 	if (sor->ops && sor->ops->remove)
 		sor->ops->remove(sor);
@@ -2762,8 +2815,6 @@ static int tegra_sor_remove(struct platform_device *pdev)
 	struct tegra_sor *sor = platform_get_drvdata(pdev);
 	int err;
 
-	pm_runtime_disable(&pdev->dev);
-
 	err = host1x_client_unregister(&sor->client);
 	if (err < 0) {
 		dev_err(&pdev->dev, "failed to unregister host1x client: %d\n",
@@ -2779,6 +2830,13 @@ static int tegra_sor_remove(struct platform_device *pdev)
 
 	tegra_output_remove(&sor->output);
 
+	if (!pm_runtime_enabled(&pdev->dev)) {
+		err = tegra_sor_power_off(sor);
+		if (err)
+			return err;
+	}
+	pm_runtime_disable(&pdev->dev);
+
 	return 0;
 }
 
@@ -2786,46 +2844,15 @@ static int tegra_sor_remove(struct platform_device *pdev)
 static int tegra_sor_suspend(struct device *dev)
 {
 	struct tegra_sor *sor = dev_get_drvdata(dev);
-	int err;
-
-	if (sor->rst) {
-		err = reset_control_assert(sor->rst);
-		if (err < 0) {
-			dev_err(dev, "failed to assert reset: %d\n", err);
-			return err;
-		}
-	}
-
-	usleep_range(1000, 2000);
 
-	clk_disable_unprepare(sor->clk);
-
-	return 0;
+	return tegra_sor_power_off(sor);
 }
 
 static int tegra_sor_resume(struct device *dev)
 {
 	struct tegra_sor *sor = dev_get_drvdata(dev);
-	int err;
-
-	err = clk_prepare_enable(sor->clk);
-	if (err < 0) {
-		dev_err(dev, "failed to enable clock: %d\n", err);
-		return err;
-	}
-
-	usleep_range(1000, 2000);
-
-	if (sor->rst) {
-		err = reset_control_deassert(sor->rst);
-		if (err < 0) {
-			dev_err(dev, "failed to deassert reset: %d\n", err);
-			clk_disable_unprepare(sor->clk);
-			return err;
-		}
-	}
 
-	return 0;
+	return tegra_sor_power_on(sor);
 }
 #endif
 
-- 
2.15.1
