From: Sameer Pujar <spujar-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v4 10/23] ASoC: simple-card: Wrong daifmt for CPU end of
 DPCM DAI link
Date: Tue, 30 Jun 2020 09:17:59 +0530
Message-ID: <841ac69f-1c3f-2b13-17f9-6f196811ce52@nvidia.com>
References: <1593233625-14961-1-git-send-email-spujar@nvidia.com>
 <1593233625-14961-11-git-send-email-spujar@nvidia.com>
 <877dvq1yhy.wl-kuninori.morimoto.gx@renesas.com>
 <6e27daa5-331e-968b-4027-2e30aeb7d382@nvidia.com>
 <87o8p1z81b.wl-kuninori.morimoto.gx@renesas.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <87o8p1z81b.wl-kuninori.morimoto.gx-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>
Content-Language: en-GB
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Kuninori Morimoto <kuninori.morimoto.gx-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>
Cc: spujar-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, perex-/Fr2/VpizcU@public.gmane.org, tiwai-IBi9RG/b67k@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, sharadg-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, mkumard-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, viswanathl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, rlokhande-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, dramesh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, atalambedu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, nwartikar-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, nicoleotsuka-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: linux-tegra@vger.kernel.org



On 6/30/2020 6:26 AM, Kuninori Morimoto wrote:
> External email: Use caution opening links or attachments
>
>
> Hi Sameer
>
>>   snd_soc_runtime_set_dai_fmt() {
>>       ...
>>
>>       if (cpu_dai->component->driver->non_legacy_dai_naming)
>>           fmt = inv_dai_fmt;
>>
>>       ...
>>   }
>>
>> Above flips polarity for 'cpu_dai' if 'non_legacy_dai_naming' flag is set.
>>
>> 1. Hence example mentioned in the commit message does not work if my 'cpu_dai'
>> driver does not have this flag set.
> ?
> Do you want fo flip it ? or don't flip?
> It is for Codec <-> Codec connection.

For DPCM links I don't want to flip based on one Codec reference. My 
goal was to make the binding work for multiple CPU/Codec link. Hence I 
thought it would be better to explicitly describe the 'Master' DAI. We 
can eventually get rid of 'codec' argument from simple_dai_link_of_dpcm().
>> 2. While it is true that we consider reference of 'Codec' mode for simple CPU<->
>> Codec DAI links, for DPCM this does not seem flexible. For DPCM links CPU and
>> Codec are not directly connected (CPU<->Dummy or Dummy<->Codec). Please
>> consider, for example, if the DAI link has multiple CPU/Codecs. Which 'Codec'
>> reference needs to be considered? Isn't it better if we explicitly mention which
>> DAI we want to operate as 'Master'?
> I think Lars-Peter has (had ?) plan for this SND_SOC_DAIFMT_CBx_CFx
> flag flexibility ? Yes maybe it is needed for multi CPU/Codec system.
>
> Thank you for your help !!
>
> Best regards
> ---
> Kuninori Morimoto
