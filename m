From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v3 07/10] ASoC: tegra: add Tegra210 based ADMAIF driver
Date: Fri, 21 Feb 2020 09:08:44 +0300
Message-ID: <e6114203-57d1-bc74-f786-c2246ccb4341@gmail.com>
References: <1582180492-25297-1-git-send-email-spujar@nvidia.com>
 <1582180492-25297-8-git-send-email-spujar@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1582180492-25297-8-git-send-email-spujar-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sameer Pujar <spujar-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, perex-/Fr2/VpizcU@public.gmane.org, tiwai-IBi9RG/b67k@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, sharadg-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, mkumard-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, viswanathl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, rlokhande-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, dramesh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, atalambedu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

20.02.2020 09:34, Sameer Pujar пишет:
> ADMAIF is the interface between ADMA and AHUB. Each ADMA channel that
> sends/receives data to/from AHUB must intreface through an ADMAIF channel.
> ADMA channel sending data to AHUB pairs with an ADMAIF Tx channel and
> similarly ADMA channel receiving data from AHUB pairs with an ADMAIF Rx
> channel. Buffer size is configuranle for each ADMAIF channel, but currently
> SW uses default values.
> 
> This patch registers ADMAIF driver with ASoC framework. The component
> driver exposes DAPM widgets, routes and kcontrols for the device. The DAI
> driver exposes ADMAIF interfaces, which can be used to connect different
> components in the ASoC layer. Makefile and Kconfig support is added to
> allow to build the driver. The ADMAIF device can be enabled in the DT via
> "nvidia,tegra210-admaif" compatible binding.
> 
> Tegra PCM driver is updated to expose required PCM interfaces and
> snd_pcm_ops callbacks.
> 
> Signed-off-by: Sameer Pujar <spujar-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
...
> +int tegra_pcm_construct(struct snd_soc_component *component,
> +			struct snd_soc_pcm_runtime *rtd);
> +void tegra_pcm_destruct(struct snd_soc_component *component,
> +			struct snd_pcm *pcm);
> +int tegra_pcm_open(struct snd_soc_component *component,
> +		   struct snd_pcm_substream *substream);
> +int tegra_pcm_close(struct snd_soc_component *component,
> +		    struct snd_pcm_substream *substream);
> +int tegra_pcm_hw_params(struct snd_soc_component *component,
> +			struct snd_pcm_substream *substream,
> +			struct snd_pcm_hw_params *params);
> +int tegra_pcm_hw_free(struct snd_soc_component *component,
> +		      struct snd_pcm_substream *substream);
> +int tegra_pcm_mmap(struct snd_soc_component *component,
> +		   struct snd_pcm_substream *substream,
> +		   struct vm_area_struct *vma);

> +int tegra_pcm_trigger(struct snd_soc_component *component,
> +		      struct snd_pcm_substream *substream, int cmd);

Looks like this function doesn't exist.
