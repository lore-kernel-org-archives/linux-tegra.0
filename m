From: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v3 03/10] ASoC: tegra: add Tegra210 based DMIC driver
Date: Fri, 21 Feb 2020 14:31:05 +0000
Message-ID: <316ce0d5-318d-0533-ef06-bd7e8672f893@nvidia.com>
References: <1582180492-25297-1-git-send-email-spujar@nvidia.com>
 <1582180492-25297-4-git-send-email-spujar@nvidia.com>
 <20200221130005.GD5546@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200221130005.GD5546-GFdadSzt00ze9xe1eoZjHA@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Sameer Pujar <spujar-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: perex-/Fr2/VpizcU@public.gmane.org, tiwai-IBi9RG/b67k@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, sharadg-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, mkumard-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, viswanathl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, rlokhande-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, dramesh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, atalambedu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


On 21/02/2020 13:00, Mark Brown wrote:
> On Thu, Feb 20, 2020 at 12:04:45PM +0530, Sameer Pujar wrote:
> 
>> +++ b/sound/soc/tegra/tegra210_dmic.c
>> @@ -0,0 +1,515 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +/*
>> + * tegra210_dmic.c - Tegra210 DMIC driver
>> + *
>> + * Copyright (c) 2020 NVIDIA CORPORATION.  All rights reserved.
> 
> Please make the entire comment a C++ one so things look more
> intentional.
> 
>> +	/* Below enables all filters - DCR, LP and SC */
>> +	{ TEGRA210_DMIC_DBG_CTRL, 0xe },
> 
> So this isn't the hardware default?
> 
>> +	srate = params_rate(params);
>> +	if (dmic->srate_override)
>> +		srate = dmic->srate_override;
> 
> How does this work for userspace?  If we just ignore the sample rate we
> were asked for I'd expect that the application would get upset.

Tegra has a hardware sample rate converter (though driver not yet
upstream or part of this initial series) and if using the sample-rate
converter, then the actual rate captured by the DMIC interface could be
different from the resulting sample-rate.

So we want a way to indicate to the DMIC it is capturing at rate X,
while the resulting sample-rate is Y.

I am not sure if there is a better way to do this? Ideally, the DMIC
would query the rate from the upstream MUX it is connected to, but I am
not sure if there is a way to do that. So right now it is a manual
process and the user has to configure these which are not ideal.

Cheers
Jon

-- 
nvpublic
