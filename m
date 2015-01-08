From: Vince Hsu <vinceh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 3/3] soc/tegra: fuse: Add Tegra132 support
Date: Thu, 8 Jan 2015 15:42:14 +0800
Message-ID: <54AE34D6.5090507@nvidia.com>
References: <1420701887-1465-1-git-send-email-thierry.reding@gmail.com> <1420701887-1465-3-git-send-email-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1420701887-1465-3-git-send-email-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Paul Walmsley <paul-DWxLp4Yu+b8AvxtiuMwx3w@public.gmane.org>, linux-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


On 01/08/2015 03:24 PM, Thierry Reding wrote:
> From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>
> Tegra132 is very similar to Tegra124 from a peripheral point of view and
> uses the same fuse controller.
>
> Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>   drivers/soc/tegra/fuse/fuse-tegra.c   | 1 +
>   drivers/soc/tegra/fuse/fuse-tegra30.c | 2 ++
>   2 files changed, 3 insertions(+)
>
> diff --git a/drivers/soc/tegra/fuse/fuse-tegra.c b/drivers/soc/tegra/fuse/fuse-tegra.c
> index 011a3363c265..c0d660f1aaac 100644
> --- a/drivers/soc/tegra/fuse/fuse-tegra.c
> +++ b/drivers/soc/tegra/fuse/fuse-tegra.c
> @@ -81,6 +81,7 @@ static const struct of_device_id car_match[] __initconst = {
>   	{ .compatible = "nvidia,tegra30-car", },
>   	{ .compatible = "nvidia,tegra114-car", },
>   	{ .compatible = "nvidia,tegra124-car", },
> +	{ .compatible = "nvidia,tegra132-car", },
>   	{},
>   };
>   
> diff --git a/drivers/soc/tegra/fuse/fuse-tegra30.c b/drivers/soc/tegra/fuse/fuse-tegra30.c
> index d1a4290cda5c..11fe22e0de73 100644
> --- a/drivers/soc/tegra/fuse/fuse-tegra30.c
> +++ b/drivers/soc/tegra/fuse/fuse-tegra30.c
> @@ -184,6 +184,8 @@ static void __init legacy_fuse_init(void)
>   	case TEGRA124:
>   		fuse_info = &tegra124_info;
>   		break;
> +	case TEGRA132:
> +		fuse_info = &tegra124_info;
Fall through intentionally?


>   	default:
>   		return;
>   	}
