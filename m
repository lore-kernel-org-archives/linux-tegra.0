From: Jim Lin <jilin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v5 20/21] clk: tegra210: add support for Tegra210 clocks
Date: Wed, 20 May 2015 17:47:22 +0800
Message-ID: <555C582A.7050508@nvidia.com>
References: <1431451444-23155-1-git-send-email-rklein@nvidia.com> <1431451444-23155-22-git-send-email-rklein@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1431451444-23155-22-git-send-email-rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rhyland Klein <rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Bill Huang <bilhuang-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Paul Walmsley <pwalmsley-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Benson Leung <bleung-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 05/13/2015 01:24 AM, Rhyland Klein wrote:
> diff --git a/drivers/clk/tegra/clk-tegra210.c b/drivers/clk/tegra/clk-tegra210.c
> new file mode 100644
> index 000000000000..7f25e60e4d48
> --- /dev/null
> +++ b/drivers/clk/tegra/clk-tegra210.c
>
> +
> +static struct tegra_clk_init_table common_init_table[] __initdata = {
> +	{TEGRA210_CLK_UARTA, TEGRA210_CLK_PLL_P, 408000000, 0},
> +	{TEGRA210_CLK_UARTB, TEGRA210_CLK_PLL_P, 408000000, 0},
> +	{TEGRA210_CLK_UARTC, TEGRA210_CLK_PLL_P, 408000000, 0},
> +	{TEGRA210_CLK_UARTD, TEGRA210_CLK_PLL_P, 408000000, 0},
> +	{TEGRA210_CLK_PLL_A, TEGRA210_CLK_CLK_MAX, 564480000, 1},
> +	{TEGRA210_CLK_PLL_A_OUT0, TEGRA210_CLK_CLK_MAX, 11289600, 1},
> +	{TEGRA210_CLK_EXTERN1, TEGRA210_CLK_PLL_A_OUT0, 0, 1},
> +	{TEGRA210_CLK_CLK_OUT_1_MUX, TEGRA210_CLK_EXTERN1, 0, 1},
> +	{TEGRA210_CLK_CLK_OUT_1, TEGRA210_CLK_CLK_MAX, 0, 1},
> +	{TEGRA210_CLK_I2S0, TEGRA210_CLK_PLL_A_OUT0, 11289600, 0},
> +	{TEGRA210_CLK_I2S1, TEGRA210_CLK_PLL_A_OUT0, 11289600, 0},
> +	{TEGRA210_CLK_I2S2, TEGRA210_CLK_PLL_A_OUT0, 11289600, 0},
> +	{TEGRA210_CLK_I2S3, TEGRA210_CLK_PLL_A_OUT0, 11289600, 0},
> +	{TEGRA210_CLK_I2S4, TEGRA210_CLK_PLL_A_OUT0, 11289600, 0},
> +	{TEGRA210_CLK_HOST1X, TEGRA210_CLK_PLL_P, 136000000, 1},
> +	{TEGRA210_CLK_SCLK_MUX, TEGRA210_CLK_PLL_P, 0, 1},
> +	{TEGRA210_CLK_SCLK, TEGRA210_CLK_CLK_MAX, 102000000, 1},
> +	{TEGRA210_CLK_DFLL_SOC, TEGRA210_CLK_PLL_P, 51000000, 1},
> +	{TEGRA210_CLK_DFLL_REF, TEGRA210_CLK_PLL_P, 51000000, 1},
> +	{TEGRA210_CLK_SBC4, TEGRA210_CLK_PLL_P, 12000000, 1},
> +	{TEGRA210_CLK_PLL_RE_VCO, TEGRA210_CLK_CLK_MAX, 624000000, 0},
> +	{TEGRA210_CLK_PLL_U_OUT1, TEGRA210_CLK_CLK_MAX, 48000000, 0},
> +	{TEGRA210_CLK_PLL_U_OUT2, TEGRA210_CLK_CLK_MAX, 60000000, 0},
Could you help to modify this as the following?
Clocks have to be enabled only once.

+	{TEGRA210_CLK_PLL_RE_VCO, TEGRA210_CLK_CLK_MAX, 624000000, 1},
+	{TEGRA210_CLK_PLL_U_OUT1, TEGRA210_CLK_CLK_MAX, 48000000, 1},
+	{TEGRA210_CLK_PLL_U_OUT2, TEGRA210_CLK_CLK_MAX, 60000000, 1},


> +	{TEGRA210_CLK_XUSB_SS_SRC, TEGRA210_CLK_PLL_U_480M, 120000000, 0},
> +	{TEGRA210_CLK_XUSB_FS_SRC, TEGRA210_CLK_PLL_U_48M, 48000000, 0},
> +	{TEGRA210_CLK_XUSB_HS_SRC, TEGRA210_CLK_PLL_U_60M, 60000000, 0},
> +	{TEGRA210_CLK_XUSB_FALCON_SRC, TEGRA210_CLK_PLL_RE_OUT, 224000000, 0},
> +	{TEGRA210_CLK_XUSB_HOST_SRC, TEGRA210_CLK_PLL_RE_OUT, 112000000, 0},
> +	{TEGRA210_CLK_SATA, TEGRA210_CLK_PLL_P, 104000000, 0},
> +	{TEGRA210_CLK_SATA_OOB, TEGRA210_CLK_PLL_P, 204000000, 0},
> +	{TEGRA210_CLK_EMC, TEGRA210_CLK_CLK_MAX, 0, 1},
> +	{TEGRA210_CLK_MSELECT, TEGRA210_CLK_CLK_MAX, 0, 1},
> +	{TEGRA210_CLK_CSITE, TEGRA210_CLK_CLK_MAX, 0, 1},
> +	{TEGRA210_CLK_TSENSOR, TEGRA210_CLK_CLK_M, 400000, 0},
> +	{TEGRA210_CLK_I2C1, TEGRA210_CLK_PLL_P, 0, 0},
> +	{TEGRA210_CLK_I2C2, TEGRA210_CLK_PLL_P, 0, 0},
> +	{TEGRA210_CLK_I2C3, TEGRA210_CLK_PLL_P, 0, 0},
> +	{TEGRA210_CLK_I2C4, TEGRA210_CLK_PLL_P, 0, 0},
> +	{TEGRA210_CLK_I2C5, TEGRA210_CLK_PLL_P, 0, 0},
> +	{TEGRA210_CLK_I2C6, TEGRA210_CLK_PLL_P, 0, 0},
> +	{TEGRA210_CLK_PLL_DP, TEGRA210_CLK_CLK_MAX, 270000000, 0},
> +	/* This MUST be the last entry. */
> +	{TEGRA210_CLK_CLK_MAX, TEGRA210_CLK_CLK_MAX, 0, 0},
> +};
> +
--nvpublic
