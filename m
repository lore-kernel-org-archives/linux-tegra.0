From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [alsa-devel] [PATCH 7/9] ASoC: tegra: add Tegra210 based ADMAIF
 driver
Date: Fri, 24 Jan 2020 04:28:26 +0300
Message-ID: <743d6d7d-f29c-191a-853b-414250ca38df@gmail.com>
References: <1579530198-13431-1-git-send-email-spujar@nvidia.com>
 <1579530198-13431-8-git-send-email-spujar@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1579530198-13431-8-git-send-email-spujar-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sameer Pujar <spujar-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, perex-/Fr2/VpizcU@public.gmane.org, tiwai-IBi9RG/b67k@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, atalambedu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, viswanathl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, sharadg-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, rlokhande-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, mkumard-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, dramesh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

20.01.2020 17:23, Sameer Pujar пишет:
[snip]
> +static bool tegra_admaif_wr_reg(struct device *dev, unsigned int reg)
> +{
> +	struct tegra_admaif *admaif = dev_get_drvdata(dev);
> +	unsigned int ch_stride = TEGRA_ADMAIF_CHANNEL_REG_STRIDE;
> +	unsigned int num_ch = admaif->soc_data->num_ch;
> +	unsigned int rx_base = admaif->soc_data->rx_base;
> +	unsigned int tx_base = admaif->soc_data->tx_base;
> +	unsigned int global_base = admaif->soc_data->global_base;
> +	unsigned int reg_max = admaif->soc_data->regmap_conf->max_register;
> +	unsigned int rx_max = rx_base + (num_ch * ch_stride);
> +	unsigned int tx_max = tx_base + (num_ch * ch_stride);
> +
> +	if ((reg >= rx_base) && (reg < rx_max)) {

The braces are not needed around the comparisons because they precede
the AND. Same for all other similar occurrences in the code.
