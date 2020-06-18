From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [RFC PATCH v2 14/18] gpu: host1x: mipi: Split
 tegra_mipi_calibrate and tegra_mipi_wait
Date: Thu, 18 Jun 2020 03:35:20 +0300
Message-ID: <457e3754-c783-0ec4-068c-8b5f5ff8de0a@gmail.com>
References: <1592358094-23459-1-git-send-email-skomatineni@nvidia.com>
 <1592358094-23459-15-git-send-email-skomatineni@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1592358094-23459-15-git-send-email-skomatineni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sowjanya Komatineni <skomatineni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, frankc-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org, sakari.ailus-X3B1VOXEql0@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, helen.koike-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org
Cc: sboyd-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

17.06.2020 04:41, Sowjanya Komatineni пишет:
...
> -static int tegra_mipi_wait(struct tegra_mipi *mipi)
> +int tegra_mipi_wait(struct tegra_mipi_device *device)
>  {
> +	struct tegra_mipi *mipi = device->mipi;
>  	unsigned long timeout = jiffies + msecs_to_jiffies(250);
>  	u32 value;
> +	int err;
> +
> +	err = clk_enable(device->mipi->clk);
> +	if (err < 0)
> +		return err;
> +
> +	mutex_lock(&device->mipi->lock);

The timeout variable should be assigned *after* taking the lock.

It will be better if you could use the read_poll_timeout() or
readl_relaxed_poll_timeout() here.

>  	while (time_before(jiffies, timeout)) {
>  		value = tegra_mipi_readl(mipi, MIPI_CAL_STATUS);
>  		if ((value & MIPI_CAL_STATUS_ACTIVE) == 0 &&
>  		    (value & MIPI_CAL_STATUS_DONE) != 0)
> -			return 0;
> +			goto done;
>  
>  		usleep_range(10, 50);
>  	}
>  
> -	return -ETIMEDOUT;
> +	err = -ETIMEDOUT;
> +done:
> +	mutex_unlock(&device->mipi->lock);
> +	clk_disable(device->mipi->clk);
> +	return err;
>  }
> +EXPORT_SYMBOL(tegra_mipi_wait);
