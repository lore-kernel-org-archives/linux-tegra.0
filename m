From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v6 07/14] clk: tegra: Implement Tegra210 EMC clock
Date: Fri, 10 Apr 2020 23:49:18 +0300
Message-ID: <0e040cf9-56cf-dd44-3523-ff4c82fb1f2c@gmail.com>
References: <20200409175238.3586487-1-thierry.reding@gmail.com>
 <20200409175238.3586487-8-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200409175238.3586487-8-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

09.04.2020 20:52, Thierry Reding пишет:
...
> +int tegra210_clk_emc_attach(struct clk *clk,
> +			    struct tegra210_clk_emc_provider *provider)
> +{
> +	struct clk_hw *hw = __clk_get_hw(clk);
> +	struct tegra210_clk_emc *emc = to_tegra210_clk_emc(hw);
> +	struct device *dev = provider->dev;
> +	unsigned int i;
> +	int err;
> +
> +	if (!try_module_get(provider->owner))
> +		return -ENODEV;

Is the EMC driver module bumping its own refcount by itself?

In the other patch I already suggested that the EMC module should be
disallowed to be unloaded once it has been loaded, seems you're already
doing it. Correct?
