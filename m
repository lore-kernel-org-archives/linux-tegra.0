From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH 5/7] i2c: tegra: enable second level clock gating
Date: Thu, 23 Jul 2020 17:01:43 +0300
Message-ID: <1f51823f-09ea-80d5-69dd-7772474a3fb1@gmail.com>
References: <1595506733-10307-1-git-send-email-kyarlagadda@nvidia.com>
 <1595506733-10307-5-git-send-email-kyarlagadda@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-i2c-owner@vger.kernel.org>
In-Reply-To: <1595506733-10307-5-git-send-email-kyarlagadda@nvidia.com>
Content-Language: en-US
Sender: linux-i2c-owner@vger.kernel.org
To: Krishna Yarlagadda <kyarlagadda@nvidia.com>, linux-i2c@vger.kernel.org, thierry.reding@gmail.com
Cc: jonathanh@nvidia.com, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, ldewangan@nvidia.com, smohammed@nvidia.com, rgumasta@nvidia.com
List-Id: linux-tegra@vger.kernel.org

23.07.2020 15:18, Krishna Yarlagadda пишет:
> Enable Second Level Clock Gating feature for supported chips.
> With SLCG enabled, software need not control clocks anymore
> and leave clocks enabled always on.

What problem is solved by this patch? If there is no real problem, then
I'm not sure that this is a worthwhile patch. Please explain.

...
> @@ -1932,7 +1946,8 @@ static int __maybe_unused tegra_i2c_suspend(struct device *dev)
>  	struct tegra_i2c_dev *i2c_dev = dev_get_drvdata(dev);
>  	int err = 0;
>  
> -	i2c_mark_adapter_suspended(&i2c_dev->adapter);

Why i2c_mark_adapter_suspended() is removed?

> +	if (i2c_dev->is_clkon_always)
> +		clk_disable(i2c_dev->div_clk);

Why clk needs to be disabled on suspend?

>  	if (!pm_runtime_status_suspended(dev))
>  		err = tegra_i2c_runtime_suspend(dev);
> @@ -1968,6 +1983,15 @@ static int __maybe_unused tegra_i2c_resume(struct device *dev)
>  			return err;
>  	}
>  
> +	if (i2c_dev->is_clkon_always) {
> +		err = clk_enable(i2c_dev->div_clk);
> +		if (err < 0) {
> +			dev_err(i2c_dev->dev, "clock enable failed %d\n",
> +				err);
> +			return err;
> +		}
> +	}

Would be nice if it all could be wrapped into
tegra_i2c_div_clk_enable/disable() helpers.

>  	i2c_mark_adapter_resumed(&i2c_dev->adapter);
>  
>  	return 0;
> 
