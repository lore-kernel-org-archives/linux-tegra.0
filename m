From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [RFC PATCH v2 04/18] i2c: tegra: Fix the error path in
 tegra_i2c_runtime_resume
Date: Wed, 17 Jun 2020 07:52:17 +0300
Message-ID: <f7997a48-eaec-839e-e0cd-cde718bd2e72@gmail.com>
References: <1592358094-23459-1-git-send-email-skomatineni@nvidia.com>
 <1592358094-23459-5-git-send-email-skomatineni@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1592358094-23459-5-git-send-email-skomatineni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sowjanya Komatineni <skomatineni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, frankc-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org, sakari.ailus-X3B1VOXEql0@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, helen.koike-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org
Cc: sboyd-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

17.06.2020 04:41, Sowjanya Komatineni пишет:
> tegra_i2c_runtime_resume does not disable prior enabled clocks
> properly.
> 
> This patch fixes it.
> 
> Signed-off-by: Sowjanya Komatineni <skomatineni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>  drivers/i2c/busses/i2c-tegra.c | 11 ++++++++---
>  1 file changed, 8 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
> index 3be1018..1b459ca 100644
> --- a/drivers/i2c/busses/i2c-tegra.c
> +++ b/drivers/i2c/busses/i2c-tegra.c
> @@ -668,7 +668,7 @@ static int __maybe_unused tegra_i2c_runtime_resume(struct device *dev)
>  		ret = clk_enable(i2c_dev->slow_clk);
>  		if (ret < 0) {
>  			dev_err(dev, "failed to enable slow clock: %d\n", ret);
> -			return ret;
> +			goto disable_fast_clk;
>  		}
>  	}
>  
> @@ -676,11 +676,16 @@ static int __maybe_unused tegra_i2c_runtime_resume(struct device *dev)
>  	if (ret < 0) {
>  		dev_err(i2c_dev->dev,
>  			"Enabling div clk failed, err %d\n", ret);
> -		clk_disable(i2c_dev->fast_clk);
> -		return ret;
> +		goto disable_slow_clk;
>  	}
>  
>  	return 0;
> +
> +disable_slow_clk:
> +	clk_disable(i2c_dev->slow_clk);
> +disable_fast_clk:
> +	clk_disable(i2c_dev->fast_clk);
> +	return ret;
>  }
>  
>  static int __maybe_unused tegra_i2c_runtime_suspend(struct device *dev)
> 

This looks good to me. Could you please add an additional patch to
remove all the other conditions of the clk enable/disable? The current
code was already inconsistent because in most cases there are
conditions, but not in all cases.
