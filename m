From: Sameer Pujar <spujar-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v4 11/23] ASoC: simple-card: Loop over all children for
 'mclk-fs'
Date: Tue, 30 Jun 2020 09:53:13 +0530
Message-ID: <b33d5a1b-ecd5-3618-4894-c3ab0f4b077d@nvidia.com>
References: <1593233625-14961-1-git-send-email-spujar@nvidia.com>
 <1593233625-14961-12-git-send-email-spujar@nvidia.com>
 <875zba1y28.wl-kuninori.morimoto.gx@renesas.com>
 <58000bd3-861c-bbc2-75e1-128cf0199a76@nvidia.com>
 <87lfk5z4ov.wl-kuninori.morimoto.gx@renesas.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <87lfk5z4ov.wl-kuninori.morimoto.gx-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>
Content-Language: en-GB
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Kuninori Morimoto <kuninori.morimoto.gx-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>
Cc: spujar-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, perex-/Fr2/VpizcU@public.gmane.org, tiwai-IBi9RG/b67k@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, sharadg-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, mkumard-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, viswanathl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, rlokhande-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, dramesh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, atalambedu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, nwartikar-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, nicoleotsuka-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: linux-tegra@vger.kernel.org



On 6/30/2020 7:38 AM, Kuninori Morimoto wrote:
> External email: Use caution opening links or attachments
>
>
> Hi Sameer
>
>>>>         snprintf(prop, sizeof(prop), "%smclk-fs", prefix);
>>>>         of_property_read_u32(node,      prop, &props->mclk_fs);
>>>>         of_property_read_u32(cpu,       prop, &props->mclk_fs);
>>>> -     of_property_read_u32(codec,     prop, &props->mclk_fs);
>>>> +
>>>> +     if (cpu != codec)
>>>> +             of_property_read_u32(codec, prop, &props->mclk_fs);
>>> Maybe we want to have "cpu" in simple_dai_link_of_dpcm() side
>>> without using magical code in simple_parse_mclk_fs() side ?
>> Are you suggesting if we should simplify simple_parse_mclk_fs() by
>> either passing 'cpu' or 'codec'?
> Oops, sorry I was misunderstand.
>
> But I still not 100% understand what do you want to do here.
> Maybe 50% is my English skill, but in your code
>
> (C)             of_property_read_u32(cpu,       prop, &props->mclk_fs);
>          -       of_property_read_u32(codec,     prop, &props->mclk_fs);
>          +
>          +       if (cpu != codec)
> (B)     +               of_property_read_u32(codec, prop, &props->mclk_fs);
>
> and
>
>          -       simple_parse_mclk_fs(top, np, codec, dai_props, prefix);
> (A)     +       simple_parse_mclk_fs(top, np, np, dai_props, prefix);
>
> Because of (A), cpu = codec = np in simple_parse_mclk_fs().
> Do we have chance to call (B) ?
> And it still have read_u32(cpu, ...) at (C),
> this means all np will read mclk_fs anyway ?
> For me, if you don't want/need mclk_fs, don't set it on DT
> is the best answer, but am I misunderstanding ?
Sorry if I was not clear before.

My goal was to get rid of 'codec' argument from DPCM function 
simple_dai_link_of_dpcm(). Patches 10/23, 11/23 are preparations for 
12/23 to have multiple Codec support.

simple_parse_mclk_fs() is used by both simple_dai_link_of_dpcm() and 
simple_dai_link_of(). To make the same API work for both the cases, I 
had to use (A) in DPCM function. Now (B) does not get used for 
simple_dai_link_of_dpcm(), but will get used by simple_dai_link_of().

If it is simpler I will just avoid 'cpu != codec' check and keep the 
function simple_parse_mclk_fs() as it is.

>
> Thank you for your help !!
>
> Best regards
> ---
> Kuninori Morimoto
