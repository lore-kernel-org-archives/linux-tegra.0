From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH v4 06/10] pwm: Add NVIDIA Tegra SoC support
Date: Mon, 19 Mar 2012 20:35:20 -0600
Message-ID: <4F67ECE8.8030307@wwwdotorg.org>
References: <1331740593-10807-1-git-send-email-thierry.reding@avionic-design.de> <1331740593-10807-7-git-send-email-thierry.reding@avionic-design.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1331740593-10807-7-git-send-email-thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Matthias Kaehlcke <matthias-RprLehDfhQ3k1uMJSBkQmQ@public.gmane.org>, Kurt Van Dijck <kurt.van.dijck-/BeEPy95v10@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Richard Purdie <rpurdie-Fm38FmjxZ/leoWH0uzbU5w@public.gmane.org>, Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>, Mitch Bradley <wmb-D5eQfiDGL7eakBO8gow8eQ@public.gmane.org>, Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>, Eric Miao <eric.y.miao-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, Ryan Mallon <rmallon-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 03/14/2012 09:56 AM, Thierry Reding wrote:
> This commit adds a generic PWM framework driver for the PWFM controller
> found on NVIDIA Tegra SoCs. The driver is based on code from the
> Chromium kernel tree and was originally written by Gary King (NVIDIA)
...
> diff --git a/drivers/pwm/pwm-tegra.c b/drivers/pwm/pwm-tegra.c
...
> +static int tegra_pwm_enable(struct pwm_chip *chip, struct pwm_device *pwm)
> +{
> +	struct tegra_pwm_chip *pc = to_tegra_pwm_chip(chip);
> +	int rc = 0;
> +
> +	if (!pc->enable[pwm->hwpwm]) {

IIRC, the new PWM core only calls the enable() op for a disabled ->
enabled transition, so this driver probably doesn't need to check the
same thing, and you can get rid of tegra_pwm_chip.enable[] and have
tegra_pwm_config() read the enable flag from the core pwm device instead.

> +		rc = clk_enable(pc->clk);
> +		if (!rc) {
> +			unsigned long offset = pwm->hwpwm << 4;
> +			u32 val;
> +
> +			val = readl(pc->mmio_base + offset);
> +			val |= PWM_ENABLE;
> +			writel(val, pc->mmio_base + offset);

It seems a little of for the driver to define a pwm_writel() function
but only use it in some places but not others. I guess it's because in
some places the code knows the clock is on, so doesn't need the
clk_enable()/disable() helper in pwm_writel(), but I'd tend towards
always using pwm_readl()/pwm_writel() throughout the driver, and lifting
the clock management out of those low-level functions myself.

> +static int __devexit tegra_pwm_remove(struct platform_device *pdev)
> +{
> +	struct tegra_pwm_chip *pwm = platform_get_drvdata(pdev);
> +	int i;
> +
> +	if (WARN_ON(!pwm))
> +		return -ENODEV;
> +
> +	pwmchip_remove(&pwm->chip);
> +
> +	for (i = 0; i < NUM_PWM; i++) {
> +		pwm_writel(pwm, i, 0);
> +
> +		if (pwm->enable[i])
> +			clk_disable(pwm->clk);

Should the core call the disable() op before the remove() op so drivers
don't need to check this? I'm a little in two minds about this; if this
decision is deferred to drivers (as the code above assumes), then I
suppose the whole remove() path might be marginally more efficient.
