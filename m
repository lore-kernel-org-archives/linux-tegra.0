From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v3 03/10] ASoC: tegra: add Tegra210 based DMIC driver
Date: Fri, 21 Feb 2020 08:53:43 +0300
Message-ID: <d618182c-14a8-9143-376c-568dd7cf3bb3@gmail.com>
References: <1582180492-25297-1-git-send-email-spujar@nvidia.com>
 <1582180492-25297-4-git-send-email-spujar@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1582180492-25297-4-git-send-email-spujar-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sameer Pujar <spujar-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, perex-/Fr2/VpizcU@public.gmane.org, tiwai-IBi9RG/b67k@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, sharadg-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, mkumard-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, viswanathl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, rlokhande-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, dramesh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, atalambedu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

20.02.2020 09:34, Sameer Pujar пишет:
> The Digital MIC (DMIC) Controller is used to interface with Pulse Density
> Modulation (PDM) input devices. The DMIC controller implements a converter
> to convert PDM signals to Pulse Code Modulation (PCM) signals. From signal
> flow perspective, the DMIC can be viewed as a PDM receiver.
> 
> This patch registers DMIC component with ASoC framework. The component
> driver exposes DAPM widgets, routes and kcontrols for the device. The DAI
> driver exposes DMIC interfaces, which can be used to connect different
> components in the ASoC layer. Makefile and Kconfig support is added to
> allow to build the driver. The DMIC devices can be enabled in the DT via
> "nvidia,tegra210-dmic" compatible string. This driver can be used for
> Tegra186 and Tegra194 chips as well.
> 
> Signed-off-by: Sameer Pujar <spujar-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---

...

> +static const struct of_device_id tegra210_dmic_of_match[] = {
> +	{ .compatible = "nvidia,tegra210-dmic" },
> +	{},
> +};
> +MODULE_DEVICE_TABLE(of, tegra210_dmic_of_match);

I'd move the tegra210_dmic_of_match close to tegra210_dmic_driver's
definition, like most of the other drivers do it.

...

> +static struct platform_driver tegra210_dmic_driver = {
> +	.driver = {
> +		.name = "tegra210-dmic",
> +		.of_match_table = tegra210_dmic_of_match,
> +		.pm = &tegra210_dmic_pm_ops,
> +	},
> +	.probe = tegra210_dmic_probe,
> +	.remove = tegra210_dmic_remove,
> +};
> +module_platform_driver(tegra210_dmic_driver)

Otherwise:

Reviewed-by: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
