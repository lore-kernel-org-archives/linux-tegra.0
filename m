From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: RE: [RFC 6/7] pwm: Add Tegra2 SoC support
Date: Tue, 20 Dec 2011 15:23:53 -0800
Message-ID: <74CDBE0F657A3D45AFBB94109FB122FF176BE92EA7@HQMAIL01.nvidia.com>
References: <1324377138-32129-1-git-send-email-thierry.reding@avionic-design.de>
 <1324377138-32129-7-git-send-email-thierry.reding@avionic-design.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1324377138-32129-7-git-send-email-thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Content-Language: en-US
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Cc: Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Richard Purdie <rpurdie-Fm38FmjxZ/leoWH0uzbU5w@public.gmane.org>, Matthias Kaehlcke <matthias-RprLehDfhQ3k1uMJSBkQmQ@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Kurt Van Dijck <kurt.van.dijck-/BeEPy95v10@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Thierry Reding wrote at Tuesday, December 20, 2011 3:32 AM:
> Signed-off-by: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>

This seems reasonable, besides Olof's comments. I made a few comments
below, although I understand most were present in the original patch
you're upstreaming.

> diff --git a/drivers/pwm/Kconfig b/drivers/pwm/Kconfig

> +config PWM_TEGRA
> +	tristate "NVIDIA Tegra PWM support"
> +	depends on ARCH_TEGRA
> +	default n

I think you need some help text there.

> diff --git a/drivers/pwm/pwm-tegra.c b/drivers/pwm/pwm-tegra.c

> +struct tegra_pwm_chip {
> +	struct pwm_chip		chip;
> +	struct device		*dev;
> +
> +	struct clk		*clk;
> +
> +	int			clk_enb[4];

s/clk_enb/enable/? This is really more about whether the PWM channel is
enabled than the clock; the fact the clock has to be enabled for the PWM
to run is an implementation detail.

> +static int tegra_pwm_config(struct pwm_chip *chip, unsigned int pwm,
> +		int duty_ns, int period_ns)
...
> +	/* the struct clk may be shared across multiple PWM devices, so
> +	 * only enable the PWM if this device has been enabled
> +	 */
> +	if (pc->clk_enb[num])
> +		val |= PWM_ENABLE;

That comment doesn't describe what the code is doing. Perhaps if a comment
is needed at all:

/* If the PWM channel is enabled, keep it enabled */

> +static int tegra_pwm_probe(struct platform_device *pdev)
...
> +	pwm->chip.label = "tegra-pwm";
> +	pwm->chip.ops = &tegra_pwm_ops;
> +	pwm->chip.base = -1;
> +	pwm->chip.npwm = 4;

I mentioned in an earlier patch it'd be a good idea to store a struct
device * in pcm_chip. That'd also avoid allow the label field to be
removed, since you can just use dev_name(pwm_chip->dev) then.

> +static int __init tegra_pwm_init(void)
> +{
> +	return platform_driver_register(&tegra_pwm_driver);
> +}
> +subsys_initcall(tegra_pwm_init);
> +
> +static void __exit tegra_pwm_exit(void)
> +{
> +	platform_driver_unregister(&tegra_pwm_driver);
> +}
> +module_exit(tegra_pwm_exit);

Can you use module_init() for tegra_pwm_init() instead. That had better
be possible, since the Kconfig allows building this as a module. If so,
you can replace that quoted block with:

module_platform_driver(tegra_pwm_driver);

> +MODULE_LICENSE("GPL v2");

The license header says GPLv2+, so this should just be "GPL" according
to the meanings in include/linux/module.h.

-- 
nvpublic
