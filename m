From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 3/9] ASoC: tegra: add Tegra210 based DMIC driver
Date: Thu, 6 Feb 2020 19:53:57 +0300
Message-ID: <9ada4090-169e-0767-db5d-739f6e621812@gmail.com>
References: <1580380422-3431-1-git-send-email-spujar@nvidia.com>
 <1580380422-3431-4-git-send-email-spujar@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1580380422-3431-4-git-send-email-spujar-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sameer Pujar <spujar-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: perex-/Fr2/VpizcU@public.gmane.org, tiwai-IBi9RG/b67k@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, sharadg-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, mkumard-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, viswanathl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, rlokhande-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, dramesh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, atalambedu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

30.01.2020 13:33, Sameer Pujar пишет:
...
> +static const struct reg_default tegra210_dmic_reg_defaults[] = {
> +	{ TEGRA210_DMIC_TX_INT_MASK, 0x00000001},
> +	{ TEGRA210_DMIC_TX_CIF_CTRL, 0x00007700},
> +	{ TEGRA210_DMIC_CG, 0x1},
> +	{ TEGRA210_DMIC_CTRL, 0x00000301},
> +	/* Below enables all filters - DCR, LP and SC */
> +	{ TEGRA210_DMIC_DBG_CTRL, 0xe },
> +	/* Below as per latest POR value */
> +	{ TEGRA210_DMIC_DCR_BIQUAD_0_COEF_4, 0x0},
> +	/* LP filter is configured for pass through and used to apply gain */
> +	{ TEGRA210_DMIC_LP_BIQUAD_0_COEF_0, 0x00800000},
> +	{ TEGRA210_DMIC_LP_BIQUAD_0_COEF_1, 0x0},
> +	{ TEGRA210_DMIC_LP_BIQUAD_0_COEF_2, 0x0},
> +	{ TEGRA210_DMIC_LP_BIQUAD_0_COEF_3, 0x0},
> +	{ TEGRA210_DMIC_LP_BIQUAD_0_COEF_4, 0x0},
> +	{ TEGRA210_DMIC_LP_BIQUAD_1_COEF_0, 0x00800000},
> +	{ TEGRA210_DMIC_LP_BIQUAD_1_COEF_1, 0x0},
> +	{ TEGRA210_DMIC_LP_BIQUAD_1_COEF_2, 0x0},
> +	{ TEGRA210_DMIC_LP_BIQUAD_1_COEF_3, 0x0},
> +	{ TEGRA210_DMIC_LP_BIQUAD_1_COEF_4, 0x0},
> +};

I'd add a space on the right side of `}`, for consistency with the left.
