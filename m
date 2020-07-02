From: Sameer Pujar <spujar-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v4 15/23] ASoC: soc-core: Identify 'no_pcm' DAI links for
 DPCM
Date: Thu, 2 Jul 2020 15:26:21 +0530
Message-ID: <c23f962a-7192-8187-39d8-18eff26e06be@nvidia.com>
References: <1593233625-14961-1-git-send-email-spujar@nvidia.com>
 <1593233625-14961-16-git-send-email-spujar@nvidia.com>
 <87h7utytlx.wl-kuninori.morimoto.gx@renesas.com>
 <9c7871ae-6649-7b0d-4780-c8389c299b04@nvidia.com>
 <87d05ezqlc.wl-kuninori.morimoto.gx@renesas.com>
 <49bac9c1-093c-d353-cef3-c9c3391cc00d@nvidia.com>
 <875zb6z4fq.wl-kuninori.morimoto.gx@renesas.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <875zb6z4fq.wl-kuninori.morimoto.gx-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>
Content-Language: en-GB
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Kuninori Morimoto <kuninori.morimoto.gx-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>
Cc: spujar-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, perex-/Fr2/VpizcU@public.gmane.org, tiwai-IBi9RG/b67k@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, sharadg-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, mkumard-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, viswanathl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, rlokhande-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, dramesh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, atalambedu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, nwartikar-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, nicoleotsuka-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: linux-tegra@vger.kernel.org



On 7/2/2020 2:20 PM, Kuninori Morimoto wrote:
> External email: Use caution opening links or attachments
>
>
> Hi Sameer
>
>>> I wonder component->driver->non_legacy_dai_naming can't work for you ?
>> I see currently in simple-card driver that, BE<->BE link would be
>> treated as CODEC<->CODEC link if 'non_legacy_dai_naming' flag is set
>> at both ends of BE. Do we need to set this flag for all BE?
>> However I am not sure how this will work out for a BE<->BE DPCM DAI
>> link considering the fact that I want to use chain of components and I
>> guess routing map would get complicated. Also going by the flag name
>> it was not meant to differentiate between a FE and BE?
> OK, non_legacy_dai_naming was just my quick idea.

>
> Maybe your soc_component_is_pcm() idea can work,
> but it seems a littl bit hackish for me.
> So, can you please
>
> 1) Add soc_component_is_pcm() on simple-card, not soc-core ?
>     Maybe we can move it to soc-core later,
>     but want to keep it under simple-card, so far.
>
> 2) Use it with data->component_chaining, and some comment ?
>     non component_chaining user doesn't get damage in worst case,
>     and easy to understand.
>
>          /*
>           * This is for BE<->BE connection.
>           * It needs to ...
>           * It is assumng ...
>           * Note is ...
>           */
>          if (data->component_chaining &&
>              !soc_component_is_pcm(cpus))
>                  dai_link->no_pcm = 1;
>
> 3) maybe you can reuse snd_soc_find_dai() for soc_component_is_pcm() ?
>
>          dai = snd_soc_find_dai(dlc);
>          if (dai &&
>              (dai->pcm_new || dai->component->driver->pcm_construct))
>                  return xxx

Sounds fine, I can make changes as per above points. Thanks.

>
> Thank you for your help !!
>
> Best regards
> ---
> Kuninori Morimoto
