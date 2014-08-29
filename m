From: Varka Bhadram <varkabhadram-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v4 3/5] ARM: tegra: Initialize interrupt controller from
 DT
Date: Fri, 29 Aug 2014 08:57:49 +0530
Message-ID: <53FFF335.1020402@gmail.com>
References: <1409239879-12376-1-git-send-email-thierry.reding@gmail.com> <1409239879-12376-3-git-send-email-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1409239879-12376-3-git-send-email-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 08/28/2014 09:01 PM, Thierry Reding wrote:
> From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>
> Obtains the register ranges for the legacy interrupt controller from DT
> and provide hard-coded values as fallback.
>
(...)

> +static const struct tegra_ictlr_soc tegra30_ictlr_soc = {
> +	.num_ictlrs = 5,
> +};
> +
> +static const struct of_device_id ictlr_matches[] = {
> +	{ .compatible = "nvidia,tegra30-ictlr", .data = &tegra30_ictlr_soc },
> +	{ .compatible = "nvidia,tegra20-ictlr", .data = &tegra20_ictlr_soc },
> +	{ }
> +};
> +
> +static const struct of_device_id gic_matches[] = {
> +	{ .compatible = "arm,cortex-a15-gic", },
> +	{ .compatible = "arm,cortex-a9-gic", },
> +	{ }
> +};
> +
>
Missed MODULE_DEVICE_TABLE(of, ...)....?

-- 
Regards,
Varka Bhadram.
