From: Sameer Pujar <spujar-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v2 2/9] ASoC: tegra: add support for CIF programming
Date: Thu, 6 Feb 2020 17:26:47 +0530
Message-ID: <1305a6db-a492-eec2-111e-ddc801d58d86@nvidia.com>
References: <1580380422-3431-1-git-send-email-spujar@nvidia.com>
 <1580380422-3431-3-git-send-email-spujar@nvidia.com>
 <7239e858-16b7-609f-c4e3-8135bee8450b@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <7239e858-16b7-609f-c4e3-8135bee8450b-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Content-Language: en-GB
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, perex-/Fr2/VpizcU@public.gmane.org, tiwai-IBi9RG/b67k@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: spujar-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, sharadg-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, mkumard-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, viswanathl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, rlokhande-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, dramesh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, atalambedu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org



On 2/5/2020 10:32 PM, Dmitry Osipenko wrote:
> External email: Use caution opening links or attachments
>
>
> 30.01.2020 13:33, Sameer Pujar =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> ...
>> +#include <linux/module.h>
>> +#include <linux/regmap.h>
>> +#include "tegra_cif.h"
>> +
>> +void tegra_set_cif(struct regmap *regmap, unsigned int reg,
>> +                struct tegra_cif_conf *conf)
>> +{
>> +     unsigned int value;
>> +
>> +     value =3D (conf->threshold << TEGRA_ACIF_CTRL_FIFO_TH_SHIFT) |
>> +             ((conf->audio_ch - 1) << TEGRA_ACIF_CTRL_AUDIO_CH_SHIFT) |
>> +             ((conf->client_ch - 1) << TEGRA_ACIF_CTRL_CLIENT_CH_SHIFT)=
 |
>> +             (conf->audio_bits << TEGRA_ACIF_CTRL_AUDIO_BITS_SHIFT) |
>> +             (conf->client_bits << TEGRA_ACIF_CTRL_CLIENT_BITS_SHIFT) |
>> +             (conf->expand << TEGRA_ACIF_CTRL_EXPAND_SHIFT) |
>> +             (conf->stereo_conv << TEGRA_ACIF_CTRL_STEREO_CONV_SHIFT) |
>> +             (conf->replicate << TEGRA_ACIF_CTRL_REPLICATE_SHIFT) |
>> +             (conf->truncate << TEGRA_ACIF_CTRL_TRUNCATE_SHIFT) |
>> +             (conf->mono_conv << TEGRA_ACIF_CTRL_MONO_CONV_SHIFT);
>> +
>> +     regmap_update_bits(regmap, reg, TEGRA_ACIF_UPDATE_MASK, value);
>> +}
>> +EXPORT_SYMBOL_GPL(tegra_set_cif);
> Are you going to add more stuff into this source file later on?

Yes I plan to add Tegra30 and Tegra124 CIF functions in this. Anything=20
related to CIF can be moved here.
>
> If not, then it's too much to have a separate driver module just for a
> single tiny function, you should move it into the header file (make it
> inline).
