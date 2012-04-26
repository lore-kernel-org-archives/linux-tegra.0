From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCHv3 2/4] ARM: tegra: Add SMMU enabler in AHB
Date: Thu, 26 Apr 2012 13:55:13 -0600
Message-ID: <4F99A821.2040406@wwwdotorg.org>
References: <1335352072-4001-1-git-send-email-hdoyu@nvidia.com> <1335352072-4001-2-git-send-email-hdoyu@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1335352072-4001-2-git-send-email-hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Hiroshi DOYU <hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Tony Lindgren <tony-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org>, H Hartley Sweeten <hsweeten-3FF4nKcrg1dE2c76skzGb0EOCMrvLtNR@public.gmane.org>, Jamie Iles <jamie-wmLquQDDieKakBO8gow8eQ@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 04/25/2012 05:07 AM, Hiroshi DOYU wrote:
> Add extern func, "tegra_ahb_enable_smmu()" to inform AHB that SMMU is
> ready.

> +#ifdef CONFIG_ARCH_TEGRA_3x_SOC
> +static int __tegra_ahb_enable_smmu(struct device *dev, void *data)
...
> +int tegra_ahb_enable_smmu(void)
> +{
> +	return driver_for_each_device(&tegra_ahb_driver.driver, NULL, NULL,
> +				      __tegra_ahb_enable_smmu);
> +}
> +EXPORT_SYMBOL(tegra_ahb_enable_smmu);
> +#endif

That looks like a neat solution to avoid having a global device object.

However, if that driver_for_each_device finds no devices, the function
still succeeds. That doesn't seem right, and doesn't allow e.g. the SMMU
to defer its probe until the AHB driver has completed.

Perhaps add a local int variable to tegra_ahb_enable_smmu(), pass the
address to __tegra_ahb_enable_smmu, and have it increment the int. Then,
after calling driver_for_each_device,:

if (!ahb_device_count)
    return -EPROBE_DEFER
if (WARN_ON(ahb_device_count != 1))
    return -EINVAL;
return 0;
