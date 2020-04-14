From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v6 09/14] memory: tegra: Add EMC scaling support code for
 Tegra210
Date: Tue, 14 Apr 2020 23:46:18 +0300
Message-ID: <5616bbe7-d185-1a6a-1fc5-e4ee5d2f65e6@gmail.com>
References: <20200409175238.3586487-1-thierry.reding@gmail.com>
 <20200409175238.3586487-10-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200409175238.3586487-10-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

09.04.2020 20:52, Thierry Reding пишет:
...
> +static void tegra210_change_dll_src(struct tegra210_emc *emc,
> +				    u32 clksrc)
> +{
> +	u32 dll_setting = emc->next->dll_clk_src;
> +	u32 emc_clk_src;
> +	u32 emc_clk_div;
> +
> +	emc_clk_src = (clksrc & EMC_CLK_EMC_2X_CLK_SRC_MASK) >>
> +		       EMC_CLK_EMC_2X_CLK_SRC_SHIFT;
> +	emc_clk_div = (clksrc & EMC_CLK_EMC_2X_CLK_DIVISOR_MASK) >>
> +		       EMC_CLK_EMC_2X_CLK_DIVISOR_SHIFT;
> +
> +	dll_setting &= ~(DLL_CLK_EMC_DLL_CLK_SRC_MASK |
> +			 DLL_CLK_EMC_DLL_CLK_DIVISOR_MASK);
> +	dll_setting |= emc_clk_src << DLL_CLK_EMC_DLL_CLK_SRC_SHIFT;
> +	dll_setting |= emc_clk_div << DLL_CLK_EMC_DLL_CLK_DIVISOR_SHIFT;
> +
> +	dll_setting &= ~DLL_CLK_EMC_DLL_DDLL_CLK_SEL_MASK;
> +	if (emc_clk_src == EMC_CLK_SOURCE_PLLMB_LJ)
> +		dll_setting |= (PLLM_VCOB <<
> +				DLL_CLK_EMC_DLL_DDLL_CLK_SEL_SHIFT);
> +	else if (emc_clk_src == EMC_CLK_SOURCE_PLLM_LJ)
> +		dll_setting |= (PLLM_VCOA <<
> +				DLL_CLK_EMC_DLL_DDLL_CLK_SEL_SHIFT);
> +	else
> +		dll_setting |= (EMC_DLL_SWITCH_OUT <<
> +				DLL_CLK_EMC_DLL_DDLL_CLK_SEL_SHIFT);
> +
> +	tegra210_clk_emc_dll_update_setting(dll_setting);
> +
> +	if (emc->next->clk_out_enb_x_0_clk_enb_emc_dll)
> +		tegra210_clk_emc_dll_enable(true);
> +	else
> +		tegra210_clk_emc_dll_enable(false);

Isn't something like fence_udelay(1) needed after touching clk registers?
