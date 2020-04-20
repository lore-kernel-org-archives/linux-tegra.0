From: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH] mfd: max77620: Use single-byte writes on MAX77620
Date: Mon, 20 Apr 2020 15:43:23 +0100
Message-ID: <b884da97-5927-5742-b059-be27d43b27ea@nvidia.com>
References: <20200417170913.2552327-1-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200417170913.2552327-1-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


On 17/04/2020 18:09, Thierry Reding wrote:
> From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> 
> The MAX77620 doesn't support bulk writes, so make sure the regmap code
> breaks bulk writes into multiple single-byte writes.
> 
> Note that this is mostly cosmetic because currently only the RTC sub-
> driver uses bulk writes and the RTC driver ends up using a different
> regmap on the MAX77620 anyway. However, it seems like a good idea to
> make this change now in order to avoid running into issues if bulk
> writes are ever used by other sub-drivers sometime down the road.
> 
> Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>  drivers/mfd/max77620.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/mfd/max77620.c b/drivers/mfd/max77620.c
> index c7ed5c353553..fec2096474ad 100644
> --- a/drivers/mfd/max77620.c
> +++ b/drivers/mfd/max77620.c
> @@ -177,6 +177,7 @@ static const struct regmap_config max77620_regmap_config = {
>  	.rd_table = &max77620_readable_table,
>  	.wr_table = &max77620_writable_table,
>  	.volatile_table = &max77620_volatile_table,
> +	.use_single_write = true,
>  };
>  
>  static const struct regmap_config max20024_regmap_config = {
> 


Acked-by: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Tested-by: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Cheers
Jon

-- 
nvpublic
