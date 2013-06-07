From: Paul Walmsley <pwalmsley-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH] regulator: core: add regulator_get_linear_step()
Date: Fri, 7 Jun 2013 10:11:51 +0000 (UTC)
Message-ID: <alpine.DEB.2.02.1306071010380.32163@utopia.booyaka.com>
References: <alpine.DEB.2.02.1306070753420.32163@utopia.booyaka.com> <20130607090923.GH31367@sirena.org.uk> <alpine.DEB.2.02.1306070920010.32163@utopia.booyaka.com> <20130607095936.GK31367@sirena.org.uk>
 <alpine.DEB.2.02.1306071000330.32163@utopia.booyaka.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <alpine.DEB.2.02.1306071000330.32163-rwI8Ez+7Ko+d5PgPZx9QOdBPR1lH4CV8@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Andrew Chew <achew-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Matthew Longnecker <mlongnecker-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Fri, 7 Jun 2013, Paul Walmsley wrote:

> The IP block has an I2C controller embedded in it that autonomously sends 
> set-voltage commands (across a range of voltages) to the PMIC.  To enable 
> that, the driver must first initialize the IP block with a 
> voltage-to-selector table.

Here's the table loading code -

+/**
+ * _load_lut - load voltage lookup table into DFLL RAM
+ * @pdev: DFLL instance
+ *
+ * Load the voltage-to-PMIC register value lookup table into the DFLL
+ * IP block LUT memory.  td->lut_min and td->lut_max are used to cap
+ * the minimum and maximum voltage requested.  This function shouldn't
+ * be called directly by code other than dfll_load_lut(), since this
+ * function doesn't handle the necessary pre- and post-requisites.  No
+ * return value.
+ */
+static void _load_lut(struct platform_device *pdev)
+{
+	struct tegra_dfll *td = dev_get_drvdata(&pdev->dev);
+	int i;
+	u32 val;
+
+	val = td->out_map[td->lut_min]->reg_value;
+	for (i = 0; i <= td->lut_min; i++)
+		dfll_writel(td, val, DFLL_OUTPUT_LUT + i * 4);
+
+	for (; i < td->lut_max; i++) {
+		val = td->out_map[i]->reg_value;
+		dfll_writel(td, val, DFLL_OUTPUT_LUT + i * 4);
+	}
+
+	val = td->out_map[td->lut_max]->reg_value;
+	for (; i < td->num_voltages; i++)
+		dfll_writel(td, val, DFLL_OUTPUT_LUT + i * 4);
+
+	dfll_wmb(td);
+}



- Paul
