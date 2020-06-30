From: Sameer Pujar <spujar-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v4 15/23] ASoC: soc-core: Identify 'no_pcm' DAI links for
 DPCM
Date: Tue, 30 Jun 2020 13:33:27 +0530
Message-ID: <9c7871ae-6649-7b0d-4780-c8389c299b04@nvidia.com>
References: <1593233625-14961-1-git-send-email-spujar@nvidia.com>
 <1593233625-14961-16-git-send-email-spujar@nvidia.com>
 <87h7utytlx.wl-kuninori.morimoto.gx@renesas.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <87h7utytlx.wl-kuninori.morimoto.gx-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>
Content-Language: en-GB
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Kuninori Morimoto <kuninori.morimoto.gx-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>
Cc: spujar-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, perex-/Fr2/VpizcU@public.gmane.org, tiwai-IBi9RG/b67k@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, sharadg-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, mkumard-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, viswanathl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, rlokhande-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, dramesh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, atalambedu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, nwartikar-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, nicoleotsuka-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: linux-tegra@vger.kernel.org



On 6/30/2020 11:37 AM, Kuninori Morimoto wrote:
> External email: Use caution opening links or attachments
>
>
> Hi Sameer
>
>> PCM devices are created for dai links with 'no-pcm' flag as '0'.
>> Such DAI links have CPU component which implement pcm_construct()
>> and pcm_destruct() callbacks. Based on this, current patch exposes
>> a helper function to identify such components and populate 'no_pcm'
>> flag for DPCM DAI link.
>>
>> This helps to have BE<->BE component links where PCM devices need
>> not be created for CPU components involved in the links.
>>
>> Signed-off-by: Sameer Pujar <spujar-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>> ---
> (snip)
>> +bool soc_component_is_pcm(struct snd_soc_dai_link_component *dlc)
>> +{
>> +     struct snd_soc_component *component;
>> +     struct snd_soc_dai *dai;
>> +
>> +     for_each_component(component) {
>> +             if (!component->driver)
>> +                     continue;
>> +
>> +             for_each_component_dais(component, dai) {
>> +                     if (!dai->name || !dlc->dai_name)
>> +                             continue;
>> +
>> +                     if (strcmp(dai->name, dlc->dai_name))
>> +                             continue;
>> +
>> +                     if (component->driver->pcm_construct)
>> +                             return true;
>> +             }
>> +     }
>> +
>> +     return false;
>> +}
> At least my CPU driver doesn't use component:pcm_construct
> but is using DAI:pcm_new for some reasons.
> I'm not sure checking DAI:pcm here is enough, or not...

OK. If adding DAI:pcm_new above here is not sufficient, then a flag can 
be used to describe FE component? or is there a better alternative?
>
> Thank you for your help !!
>
> Best regards
> ---
> Kuninori Morimoto
