From: mirq-test-CoA6ZxLDdyEEUmgCuDUIdw@public.gmane.org
Subject: Re: [PATCH 2/5] i2c: tegra: Restore pinmux on system resume
Date: Thu, 7 May 2020 00:43:36 +0200
Message-ID: <20200506224336.GA23423@qmqm.qmqm.pl>
References: <20200506193358.2807244-1-thierry.reding@gmail.com>
 <20200506193358.2807244-3-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-2
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20200506193358.2807244-3-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>, Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Wed, May 06, 2020 at 09:33:55PM +0200, Thierry Reding wrote:
[...]
> --- a/drivers/i2c/busses/i2c-tegra.c
> +++ b/drivers/i2c/busses/i2c-tegra.c
> @@ -1769,10 +1769,14 @@ static int tegra_i2c_remove(struct platform_device *pdev)
>  static int __maybe_unused tegra_i2c_suspend(struct device *dev)
>  {
>  	struct tegra_i2c_dev *i2c_dev = dev_get_drvdata(dev);
> +	int err = 0;
>  
>  	i2c_mark_adapter_suspended(&i2c_dev->adapter);
>  
> -	return 0;
> +	if (!pm_runtime_status_suspended(dev))
> +		err = tegra_i2c_runtime_suspend(dev);
> +
> +	return err;
>  }
>  
>  static int __maybe_unused tegra_i2c_resume(struct device *dev)
> @@ -1788,9 +1792,11 @@ static int __maybe_unused tegra_i2c_resume(struct device *dev)
>  	if (err)
>  		return err;
>  
> -	err = tegra_i2c_runtime_suspend(dev);
> -	if (err)
> -		return err;
> +	if (pm_runtime_status_suspended(dev)) {
[...]
Shouldn't this be negated as in suspend? I would assume that inbetween
suspend and resume nothing changes the stored state.

Best Regards,
Micha³ Miros³aw
