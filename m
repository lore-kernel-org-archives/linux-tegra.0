From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [RFC PATCH v1 05/18] i2c: tegra: Fix runtime resume to re-init VI
 I2C
Date: Wed, 10 Jun 2020 16:14:49 +0300
Message-ID: <fcced8cd-d80d-b09c-b657-cb413ec418f9@gmail.com>
References: <1591768960-31648-1-git-send-email-skomatineni@nvidia.com>
 <1591768960-31648-6-git-send-email-skomatineni@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1591768960-31648-6-git-send-email-skomatineni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sowjanya Komatineni <skomatineni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, frankc-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org, sakari.ailus-X3B1VOXEql0@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, helen.koike-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org
Cc: sboyd-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

10.06.2020 09:02, Sowjanya Komatineni пишет:
> VI I2C is on host1x bus and is part of VE power domain.
> 
> During suspend/resume VE power domain goes through power off/on.
> 
> So, controller reset followed by i2c re-initialization is required
> after the domain power up.
> 
> This patch fixes it.
> 
> Signed-off-by: Sowjanya Komatineni <skomatineni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>  drivers/i2c/busses/i2c-tegra.c | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 
> diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
> index dba38a5..650240d 100644
> --- a/drivers/i2c/busses/i2c-tegra.c
> +++ b/drivers/i2c/busses/i2c-tegra.c
> @@ -293,6 +293,8 @@ struct tegra_i2c_dev {
>  	bool is_curr_atomic_xfer;
>  };
>  
> +static int tegra_i2c_init(struct tegra_i2c_dev *i2c_dev, bool clk_reinit);
> +
>  static void dvc_writel(struct tegra_i2c_dev *i2c_dev, u32 val,
>  		       unsigned long reg)
>  {
> @@ -679,8 +681,22 @@ static int __maybe_unused tegra_i2c_runtime_resume(struct device *dev)
>  		goto disable_slow_clk;
>  	}
>  
> +	/*
> +	 * VI I2C device is attached to VE power domain which goes through
> +	 * power ON/OFF during PM runtime resume/suspend. So, controller
> +	 * should go through reset and need to re-initialize after power
> +	 * domain ON.
> +	 */
> +	if (i2c_dev->is_vi) {
> +		ret = tegra_i2c_init(i2c_dev, true);
> +		if (ret)
> +			goto disable_div_clk;
> +	}
> +
>  	return 0;
>  
> +disable_div_clk:
> +	clk_disable(i2c_dev->div_clk);
>  disable_slow_clk:
>  	if (i2c_dev->slow_clk)
>  		clk_disable(i2c_dev->slow_clk);
> 

The clk_disable() can cope with a NULL argument. Won't it be cleaner to
remove the conditions?
