From: Paul Walmsley <pwalmsley-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH] regulator: core: add regulator_get_linear_step()
Date: Fri, 7 Jun 2013 09:38:10 +0000 (UTC)
Message-ID: <alpine.DEB.2.02.1306070920010.32163@utopia.booyaka.com>
References: <alpine.DEB.2.02.1306070753420.32163@utopia.booyaka.com> <20130607090923.GH31367@sirena.org.uk>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20130607090923.GH31367-GFdadSzt00ze9xe1eoZjHA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Andrew Chew <achew-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Matthew Longnecker <mlongnecker-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Hi Mark,

On Fri, 7 Jun 2013, Mark Brown wrote:

> On Fri, Jun 07, 2013 at 08:06:56AM +0000, Paul Walmsley wrote:
> 
> > Applies on v3.10-rc4.  Will be used by the upcoming Tegra DFLL clocksource 
> > driver, which will build its own table of voltage-to-VSEL values by 
> > querying the regulator framework.
> 
> Can you show the code please?

The driver isn't 100% ready to post yet. Still wrapping up a few last 
tweaks (in an unrelated part of the driver).  But here are the parts of 
the code that use that regulator function.

This is the immediate caller:

+/**
+ * tegra_dfll_init_pmic_data - initialize PMIC regulator data
+ * @pdev: DFLL instance
+ *
+ * Read the PMIC integration data, including regulator data, from DT
+ * and the the regulator framework.  Build the voltage map from
+ * regulator data.  Returns 0 upon success or -EINVAL upon error.
+ */
+static int __must_check tegra_dfll_init_pmic_data(struct platform_device *pdev)
+{
+	struct tegra_dfll *td = dev_get_drvdata(&pdev->dev);
+	int r;
+
+	td->vdd = regulator_get(&pdev->dev, "vdd");
+	if (IS_ERR(td->vdd)) {
+		dev_err(&pdev->dev, "couldn't locate regulator\n");
+		return -EINVAL;
+	}
+
+	td->vdd_step = regulator_get_linear_step(td->vdd);
+	if (!td->vdd_step) {
+		dev_err(&pdev->dev, "only linear map regulators supported\n");
+		goto tdipd_err;
+	}
+
+	r = parse_of_dfll_pmic_integration(pdev, pdev->dev.of_node);
+	if (r) {
+		dev_err(&pdev->dev, "DFLL PMIC integration parse error\n");
+		goto tdipd_err;
+	}
+
+	r = tegra_dfll_regulator_probe_voltages(pdev);
+	if (r) {
+		dev_err(&pdev->dev, "couldn't probe regulator voltages\n");
+		goto tdipd_err;
+	}
+
+	return 0;
+
+tdipd_err:
+	regulator_put(td->vdd);
+	return -EINVAL;
+}


... and here's the code that uses td->vdd_step:

+static int get_cvb_voltage(struct platform_device *pdev, int c0, int c1,
+			   int c2)
+{
+	struct tegra_dfll *td = dev_get_drvdata(&pdev->dev);
+	/* apply only speedo scale: output mv = cvb_mv * v_scale */
+	int mv;
+
+	/* combined: apply voltage scale and round to cvb alignment step */
+	mv = DIV_ROUND_CLOSEST(c2 * td->speedo_value, td->cvb_speedo_scale);
+	mv = DIV_ROUND_CLOSEST((mv + c1) * td->speedo_value,
+			       td->cvb_speedo_scale) + c0;
+
+	/* XXX Bring back cvb_alignment_uv; put it in the board dfll DT */
+	return DIV_ROUND_UP(mv * 1000,
+			    td->cvb_voltage_scale * td->vdd_step) *
+		td->vdd_step / 1000;
+}


But, maybe you're more interested in the voltage probing code:


+/**
+ * tegra_dfll_regulator_probe_voltages - build vdd_map[] from the regulator
+ * @pdev: DFLL instance
+ *
+ * Build the vdd_map from regulator framework and DFLL DT data.
+ * Returns 0 upon success, or -ENOSPC on a memory allocation failure.
+ */
+static int tegra_dfll_regulator_probe_voltages(struct platform_device *pdev)
+{
+	struct tegra_dfll *td = dev_get_drvdata(&pdev->dev);
+	int c, i, j, vdd_uv, vdd_mv;
+	struct tegra_dfll_voltage_reg_map *vdd_map;
+
+	c = regulator_count_voltages(td->vdd);
+	if (c < 0)
+		return c;
+
+	vdd_map = kzalloc(sizeof(struct tegra_dfll_voltage_reg_map) * c,
+			  GFP_KERNEL);
+	if (!vdd_map)
+		return -ENOMEM;
+
+	j = 0;
+	for (i = 0; i < c; i++) {
+		vdd_uv = regulator_list_voltage(td->vdd, i);
+		if (vdd_uv <= 0)
+			continue;
+
+		if (vdd_uv < td->dfll_min_microvolt)
+			continue;
+
+		if (vdd_uv > td->dfll_max_microvolt)
+			break;
+
+		vdd_mv = vdd_uv / 1000;
+
+		vdd_map[j].reg_value = i;
+		vdd_map[j].reg_uv = vdd_uv;
+		vdd_map[j].reg_mv = vdd_mv;
+		j++;
+	}
+
+	td->vdd_map_size = j;
+	td->vdd_map = vdd_map;
+
+	return 0;
+}


If you've got a different approach in mind, I'm happy to switch to it.


- Paul
