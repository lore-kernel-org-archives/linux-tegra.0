From: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Subject: Re: [PATCH V1] regulator: tps65910: Sleep control through external
 inputs
Date: Tue, 24 Jan 2012 12:24:11 +0000
Message-ID: <20120124122411.GB31839@opensource.wolfsonmicro.com>
References: <1327395919-32378-1-git-send-email-ldewangan@nvidia.com>
 <20120124115855.GC14888@opensource.wolfsonmicro.com>
 <4F1EA1E8.90104@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <4F1EA1E8.90104-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: "lrg-l0cyMroinI0@public.gmane.org" <lrg-l0cyMroinI0@public.gmane.org>, "jedu-kDsPt+C1G03kYMGBc/C6ZA@public.gmane.org" <jedu-kDsPt+C1G03kYMGBc/C6ZA@public.gmane.org>, "sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org" <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, "gg-kDsPt+C1G03kYMGBc/C6ZA@public.gmane.org" <gg-kDsPt+C1G03kYMGBc/C6ZA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Tue, Jan 24, 2012 at 05:49:52PM +0530, Laxman Dewangan wrote:
> On Tuesday 24 January 2012 05:28 PM, Mark Brown wrote:
> >On Tue, Jan 24, 2012 at 02:35:19PM +0530, Laxman Dewangan wrote:

> >>+		err = tps65910_set_ext_sleep_config(pmic, i, 0);
> >>+		if (err<  0)
> >>+			dev_err(&pdev->dev, "Error in clearing external "
> >>+				"control\n");
> >>+	}

> >Why?

> The external controls for different rails are managed by power
> manament driver of soc in kernel to toggel them. The bootloader make
> sure that all external control signals are active just before
> jumping into kernel so that there is no issue during regulator init.
> When system reboots in kernel by kernel command, the configuration
> of the pmu still maintain as what it was in kernel before reboot and
> issue  system reboots. There is possibility that the default (POR)
> of these control signals are not active on soc reset or initial
> stage of the bootloader and hence it can turn off the rails which
> can avoid system booting.
> So kernel need to remove all external controls before reboot system.

The code needs to explain this stuff so readers will know.

> >>+ * Regulator mode when rail is in sleep state which controlled by external
> >>+ * input. The regultor will be OFF if it is in sleep state by default but
> >>+ * can be set in LOW power mode by ORing following macro with any of
> >>+ * above exterenl input option.
> >>+ */
> >>+#define TPS65910_SLEEP_CONTROL_REG_LOW_POWER		0x10
> >There's the suspend mode API for configuring suspend modes.

> Hmm.., I thought that  suspend mode apis manages the low/full-on
> power mode when the controls are not through external inputs. There
> is different register for configuring the power mode by i2c- write.
> This macro help in configuration of mode when enabled with external
> controls which configures in different sets of register.

No, usually it's used for configuring suspend mode when the PMIC knows
about system suspend.

> >>+	unsigned long regulator_ext_sleep_control[TPS65910_NUM_REGS];

> >I can't see anything in this code which will manage the enable signals?

> I used this  member in the probe as for configuring the rails..
> +        err = tps65910_set_ext_sleep_config(pmic, i,
> +                pmic_plat_data->regulator_ext_sleep_control[i]);

Right, but I can't see any code which manages the signals at runtime.
You tell the device to use the signals but the signals aren't (as far as
I can see) controlled by software.
