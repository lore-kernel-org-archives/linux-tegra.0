From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v6 11/14] memory: tegra: Support derated timings on
 Tegra210
Date: Fri, 10 Apr 2020 17:28:22 +0300
Message-ID: <937a1aa6-473a-f6c5-729a-4f34e4ee3abb@gmail.com>
References: <20200409175238.3586487-1-thierry.reding@gmail.com>
 <20200409175238.3586487-12-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200409175238.3586487-12-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

09.04.2020 20:52, Thierry Reding пишет:
> -enum tegra210_emc_dram_over_temp_state {
> -	TEGRA210_EMC_DRAM_OVER_TEMP_NONE = 0,
> -	TEGRA210_EMC_DRAM_OVER_TEMP_REFRESH_X2,
> -	TEGRA210_EMC_DRAM_OVER_TEMP_REFRESH_X4,
> -	TEGRA210_EMC_DRAM_OVER_TEMP_THROTTLE, /* 4x Refresh + derating. */
> +enum tegra210_emc_refresh {
> +	TEGRA210_EMC_REFRESH_NOMINAL = 0,
> +	TEGRA210_EMC_REFRESH_2X,
> +	TEGRA210_EMC_REFRESH_4X,
> +	TEGRA210_EMC_REFRESH_THROTTLE, /* 4x Refresh + derating. */
>  };

What about to avoid all the unnecessary renamings?
