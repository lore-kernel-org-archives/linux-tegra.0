From: Sameer Pujar <spujar-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 03/10] ASoC: audio-graph: Support Codec with multiple
 endpoints
Date: Mon, 20 Jul 2020 09:44:02 +0530
Message-ID: <870feaf2-3aa2-dbb8-f883-9b6cfcb36d82@nvidia.com>
References: <1595135417-16589-1-git-send-email-spujar@nvidia.com>
 <1595135417-16589-4-git-send-email-spujar@nvidia.com>
 <87365n2i2z.wl-kuninori.morimoto.gx@renesas.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <87365n2i2z.wl-kuninori.morimoto.gx-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>
Content-Language: en-GB
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Kuninori Morimoto <kuninori.morimoto.gx-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>
Cc: spujar-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, perex-/Fr2/VpizcU@public.gmane.org, tiwai-IBi9RG/b67k@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, sharadg-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, mkumard-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, viswanathl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, rlokhande-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, dramesh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, atalambedu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, nwartikar-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, nicoleotsuka-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: linux-tegra@vger.kernel.org



On 7/20/2020 5:07 AM, Kuninori Morimoto wrote:
> External email: Use caution opening links or attachments
>
>
> Hi Sameer
>
>> If a Codec port has multiple endpoints, only first endpoint gets parsed
>> and remaining are ignored. This can be fixed by removing 'dup_codec' flag
>> passed to graph_dai_link_of_dpcm() and thus it loops over all endpoints
>> of Codec. Similarly graph_count_dpcm() is updated as well.
>>
>> Signed-off-by: Sameer Pujar <spujar-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>> ---
>>   sound/soc/generic/audio-graph-card.c | 28 +++++++++-------------------
>>   1 file changed, 9 insertions(+), 19 deletions(-)
>>
>> diff --git a/sound/soc/generic/audio-graph-card.c b/sound/soc/generic/audio-graph-card.c
>> index 1e20562..b1903f9 100644
>> --- a/sound/soc/generic/audio-graph-card.c
>> +++ b/sound/soc/generic/audio-graph-card.c
>> @@ -201,8 +201,7 @@ static void graph_parse_mclk_fs(struct device_node *top,
>>   static int graph_dai_link_of_dpcm(struct asoc_simple_priv *priv,
>>                                  struct device_node *cpu_ep,
>>                                  struct device_node *codec_ep,
>> -                               struct link_info *li,
>> -                               int dup_codec)
>> +                               struct link_info *li)
> This patch breaks DPCM connection which is used for MIXer

Could you please elaborate a bit more as to what is broken with this? 
The problem I am trying to solve here is to have multiple endpoints for 
Codec port.

>
> Thank you for your help !!
>
> Best regards
> ---
> Kuninori Morimoto
