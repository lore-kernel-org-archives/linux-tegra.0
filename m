From: Sameer Pujar <spujar-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [alsa-devel] [PATCH 7/9] ASoC: tegra: add Tegra210 based ADMAIF
 driver
Date: Fri, 24 Jan 2020 08:57:40 +0530
Message-ID: <3759aa0b-9e56-0fb4-27b7-4f98898d4e22@nvidia.com>
References: <1579530198-13431-1-git-send-email-spujar@nvidia.com>
 <1579530198-13431-8-git-send-email-spujar@nvidia.com>
 <743d6d7d-f29c-191a-853b-414250ca38df@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <743d6d7d-f29c-191a-853b-414250ca38df-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Content-Language: en-GB
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, perex-/Fr2/VpizcU@public.gmane.org, tiwai-IBi9RG/b67k@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: spujar-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, atalambedu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, viswanathl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, sharadg-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, rlokhande-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, mkumard-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, dramesh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org



On 1/24/2020 6:58 AM, Dmitry Osipenko wrote:
> External email: Use caution opening links or attachments
>
>
> 20.01.2020 17:23, Sameer Pujar =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> [snip]
>> +static bool tegra_admaif_wr_reg(struct device *dev, unsigned int reg)
>> +{
>> +     struct tegra_admaif *admaif =3D dev_get_drvdata(dev);
>> +     unsigned int ch_stride =3D TEGRA_ADMAIF_CHANNEL_REG_STRIDE;
>> +     unsigned int num_ch =3D admaif->soc_data->num_ch;
>> +     unsigned int rx_base =3D admaif->soc_data->rx_base;
>> +     unsigned int tx_base =3D admaif->soc_data->tx_base;
>> +     unsigned int global_base =3D admaif->soc_data->global_base;
>> +     unsigned int reg_max =3D admaif->soc_data->regmap_conf->max_regist=
er;
>> +     unsigned int rx_max =3D rx_base + (num_ch * ch_stride);
>> +     unsigned int tx_max =3D tx_base + (num_ch * ch_stride);
>> +
>> +     if ((reg >=3D rx_base) && (reg < rx_max)) {
> The braces are not needed around the comparisons because they precede
> the AND. Same for all other similar occurrences in the code.

While that is true, some prefer to use explicit braces to make it more=20
readable.
In the past I was told to use explicitly in such cases.
