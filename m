From: Sameer Pujar <spujar-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v4 15/23] ASoC: soc-core: Identify 'no_pcm' DAI links for
 DPCM
Date: Thu, 2 Jul 2020 09:18:02 +0530
Message-ID: <49bac9c1-093c-d353-cef3-c9c3391cc00d@nvidia.com>
References: <1593233625-14961-1-git-send-email-spujar@nvidia.com>
 <1593233625-14961-16-git-send-email-spujar@nvidia.com>
 <87h7utytlx.wl-kuninori.morimoto.gx@renesas.com>
 <9c7871ae-6649-7b0d-4780-c8389c299b04@nvidia.com>
 <87d05ezqlc.wl-kuninori.morimoto.gx@renesas.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <87d05ezqlc.wl-kuninori.morimoto.gx-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>
Content-Language: en-GB
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Kuninori Morimoto <kuninori.morimoto.gx-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>
Cc: spujar-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, perex-/Fr2/VpizcU@public.gmane.org, tiwai-IBi9RG/b67k@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, sharadg-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, mkumard-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, viswanathl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, rlokhande-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, dramesh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, atalambedu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, nwartikar-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, nicoleotsuka-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: linux-tegra@vger.kernel.org



On 7/2/2020 6:22 AM, Kuninori Morimoto wrote:
> External email: Use caution opening links or attachments
>
>
> Hi Sameer
>
>>> At least my CPU driver doesn't use component:pcm_construct
>>> but is using DAI:pcm_new for some reasons.
>>> I'm not sure checking DAI:pcm here is enough, or not...
>> OK. If adding DAI:pcm_new above here is not sufficient, then a flag
>> can be used to describe FE component? or is there a better
>> alternative?

> soc_component_is_pcm() is called from simple_dai_link_of_dpcm :: "FE" side.

Yes I had to use this on "FE" side only because I wanted to find a real 
"FE" in FE<->BE and BE<->BE links. Please have a look at patch [23/23] 
for the sound DT binding I am using. Basically I want to connect 
multiple components in a chained fashion (FE <-> BE1 <-> BE2 ... <BEx>). 
Some of these BEs can be SoC components like resampler/mixer/mux/de-mux 
etc., the HW I am using has a cross bar which allows me to 
select/connect BEs in any order and I am trying to have the same 
flexibility here. Hence I only want to create PCM devices for real "FE" 
and trying to use simple-card as much as possible. More details about 
the HW and problems were discussed in [0].

[0] https://lkml.org/lkml/2020/4/30/519

> I wonder component->driver->non_legacy_dai_naming can't work for you ?

I see currently in simple-card driver that, BE<->BE link would be 
treated as CODEC<->CODEC link if 'non_legacy_dai_naming' flag is set at 
both ends of BE. Do we need to set this flag for all BE?
However I am not sure how this will work out for a BE<->BE DPCM DAI link 
considering the fact that I want to use chain of components and I guess 
routing map would get complicated. Also going by the flag name it was 
not meant to differentiate between a FE and BE?
> Thank you for your help !!
>
> Best regards
> ---
> Kuninori Morimoto
