From: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH] soc/tegra: pmc: Fix incorrect DPD request
Date: Wed, 10 Aug 2016 11:34:51 +0100
Message-ID: <8126479a-e954-c258-ebfb-32bc2d111c5f@nvidia.com>
References: <1470806608-23231-1-git-send-email-vinceh@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1470806608-23231-1-git-send-email-vinceh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Vince Hsu <vinceh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Hi Vince,

On 10/08/16 06:23, Vince Hsu wrote:
> Reading the DPD_REQ & DPD2_REQ registers returns the previous requests.
> If we sets the current request bit with the returned value, then other
> pads will be turned on or off unexpectedly.

It was not 100% clear to me at first, but now I do see what you mean.
The IO_DPD_REQ_CODE_OFF/ON indicates whether the rails are being turned
off or on and then this action is applied for all rails whose bit is set.

I have also taken a look at the Tegra TRMs for Tegra30, Tegra124 and
Tegra210 and this behaviour appears consistent across all devices.

> Signed-off-by: Vince Hsu <vinceh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
> Hi,
> 
> I found this issue when debugging one HDMI issue which only happened
> after LP0 on Tegra124 chromebook. I did not test this patch on any
> upstream platforms due to lack of setup, but it did pass Nvidia
> internal EMIT verification.
> 
> Thanks,
> Vince
> 
> 
>  drivers/soc/tegra/pmc.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/soc/tegra/pmc.c b/drivers/soc/tegra/pmc.c
> index 71c834f3847e..43c01a85334c 100644
> --- a/drivers/soc/tegra/pmc.c
> +++ b/drivers/soc/tegra/pmc.c
> @@ -979,8 +979,7 @@ int tegra_io_rail_power_on(unsigned int id)
>  
>  	mask = 1 << bit;
>  
> -	value = tegra_pmc_readl(request);
> -	value |= mask;
> +	value = mask;
>  	value &= ~IO_DPD_REQ_CODE_MASK;
>  	value |= IO_DPD_REQ_CODE_OFF;

Nit ... can we simply this further to be just ...

	value = IO_DPD_REQ_CODE_OFF | BIT(bit);

>  	tegra_pmc_writel(value, request);
> @@ -1016,8 +1015,7 @@ int tegra_io_rail_power_off(unsigned int id)
>  
>  	mask = 1 << bit;
>  
> -	value = tegra_pmc_readl(request);
> -	value |= mask;
> +	value = mask;
>  	value &= ~IO_DPD_REQ_CODE_MASK;
>  	value |= IO_DPD_REQ_CODE_ON;

Same here?

>  	tegra_pmc_writel(value, request);
> 

Otherwise ...

Reviewed-by: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Cheers
Jon

-- 
nvpublic
