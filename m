From: Viswanath L <viswanathl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: Re: [PATCH v3 03/10] ASoC: tegra: add Tegra210 based DMIC driver
Date: Fri, 28 Feb 2020 13:00:23 +0530
Message-ID: <1e450c5c-ea8a-1310-38d6-7f8f26c4cab0@nvidia.com>
References: <1582180492-25297-1-git-send-email-spujar@nvidia.com>
 <1582180492-25297-4-git-send-email-spujar@nvidia.com>
 <20200221130005.GD5546@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200221130005.GD5546-GFdadSzt00ze9xe1eoZjHA@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Sameer Pujar <spujar-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: perex-/Fr2/VpizcU@public.gmane.org, tiwai-IBi9RG/b67k@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, sharadg-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, mkumard-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, rlokhande-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, dramesh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, atalambedu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


On 2/21/2020 6:30 PM, Mark Brown wrote:
> On Thu, Feb 20, 2020 at 12:04:45PM +0530, Sameer Pujar wrote:
>
>> +++ b/sound/soc/tegra/tegra210_dmic.c
>> @@ -0,0 +1,515 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +/*
>> + * tegra210_dmic.c - Tegra210 DMIC driver
>> + *
>> + * Copyright (c) 2020 NVIDIA CORPORATION.  All rights reserved.
> Please make the entire comment a C++ one so things look more
> intentional.
>
>> +	/* Below enables all filters - DCR, LP and SC */
>> +	{ TEGRA210_DMIC_DBG_CTRL, 0xe },
> So this isn't the hardware default?
No, the HW default is 0x2. Also, we are repurposing the LP filter for 
applying gain.
>
>> +	srate = params_rate(params);
>> +	if (dmic->srate_override)
>> +		srate = dmic->srate_override;
> How does this work for userspace?  If we just ignore the sample rate we
> were asked for I'd expect that the application would get upset.
>
>> +	if (strstr(kcontrol->id.name, "Boost Gain"))
>> +		dmic->boost_gain = value;
> Volume controls should end in "Volume".
>
>> +	else if (strstr(kcontrol->id.name, "Audio Channels"))
>> +		dmic->audio_ch_override = value;
> This is something that would usually come from hw_params?
Yes, hw_params is where it is taken from. The additional override is 
optional and would not usually need to be set by user. However, we have 
certain other modules, like multiplexer and demultiplexer (proposed to 
be upstreamed in the near future), where no. of channels get changed at 
the output. When one or more such modules are connected in the path, 
hw_params does not reflect the channels post multiplex/demultiplex, 
hence this override would be needed.
>
>> +	else if (strstr(kcontrol->id.name, "LR Polarity Select"))
>> +		dmic->lrsel = value;
> This and some of the others look like they're describing details of how
> the board is wired up so I'd not expect them to be runtime selectable?
No, these are not board wiring. OSR, polarity, etc. are configurable 
within the DMIC (within Tegra). Of course, these controls are optional 
and the default works just fine. Also, to clarify here, 'runtime 
selectable' does not mean these parameters can be modified while a 
recording session is in progress. These parameters (optional) need to 
set up before a session is started. User can close the recording, 
reconfigure the parameters, then start a new session, without needing 
reboot.
>
>> +	SND_SOC_DAPM_MIC("Dummy Input", NULL),
> This is just the microphone that happens to be attached, isn't it?  If
> so that's a weird name.
It is not necessary for an actual mic to be connected to the pin. 
Recording will work even when the pin is left open, capture being 
silence. All the drivers, whether for playback or for capture, work OK 
even without any physical end-point, hence the "dummy" I/O.
>
>> +static const char * const tegra210_dmic_mono_conv_text[] = {
>> +	"ZERO", "COPY",
>> +};
> It'd be more idiomatic for ALSA to write these as Zero and Copy.
>
>> +	SOC_ENUM_EXT("Channel Select", tegra210_dmic_ch_enum,
>> +		     tegra210_dmic_get_control, tegra210_dmic_put_control),
>> +	SOC_ENUM_EXT("Mono To Stereo",
>> +		     tegra210_dmic_mono_conv_enum, tegra210_dmic_get_control,
>> +		     tegra210_dmic_put_control),
>> +	SOC_ENUM_EXT("Stereo To Mono",
>> +		     tegra210_dmic_stereo_conv_enum, tegra210_dmic_get_control,
>> +		     tegra210_dmic_put_control),
> I'd expect these to be in DAPM.
These are finer controls and I would guess are outside what can be 
described by DAPM. E.g. - say the user wants mono capture, but the board 
has stereo mics connected. Default configuration is that the Left 
channel would be propagated. The stereo_to_mono option offers additional 
control - to select the Right channel, or mix L and R into one. As 
mentioned earlier, much of the controls here are not necessary to be set 
for a basic use case to work. These are advanced settings.
