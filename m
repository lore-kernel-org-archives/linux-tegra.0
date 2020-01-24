From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [alsa-devel] [PATCH 5/9] ASoC: tegra: add Tegra210 based AHUB
 driver
Date: Fri, 24 Jan 2020 07:28:52 +0300
Message-ID: <37669247-daaf-c6cb-0ef2-464e61db9838@gmail.com>
References: <1579530198-13431-1-git-send-email-spujar@nvidia.com>
 <1579530198-13431-6-git-send-email-spujar@nvidia.com>
 <5ed7482e-e874-9e11-c84e-7418e4b5162e@gmail.com>
 <d160fa01-27d0-6290-cb16-07d159d6fbb2@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <d160fa01-27d0-6290-cb16-07d159d6fbb2-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sameer Pujar <spujar-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, perex-/Fr2/VpizcU@public.gmane.org, tiwai-IBi9RG/b67k@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, atalambedu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, viswanathl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, sharadg-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, rlokhande-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, mkumard-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, dramesh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

24.01.2020 06:39, Sameer Pujar пишет:
>>> +static int tegra_ahub_put_value_enum(struct snd_kcontrol *kctl,
>>> +                                  struct snd_ctl_elem_value *uctl)
>>> +{
>>> +     struct snd_soc_component *cmpnt =
>>> snd_soc_dapm_kcontrol_component(kctl);
>>> +     struct tegra_ahub *ahub = snd_soc_component_get_drvdata(cmpnt);
>>> +     struct snd_soc_dapm_context *dapm =
>>> snd_soc_dapm_kcontrol_dapm(kctl);
>>> +     struct soc_enum *e = (struct soc_enum *)kctl->private_value;
>>> +     struct snd_soc_dapm_update update[TEGRA_XBAR_UPDATE_MAX_REG] =
>>> { };
>> Shouldn't this be {0} to make array zero'ed?
> 
> Isn't it the same with empty braces?

Looks like is should be the same because turns out GCC has an extension
for that.
