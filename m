From: Sameer Pujar <spujar@nvidia.com>
Subject: Re: [PATCH v4 12/23] ASoC: simple-card: Support DPCM DAI link with
 multiple Codecs
Date: Mon, 29 Jun 2020 22:46:39 +0530
Message-ID: <1e0cf6d1-bf4e-8808-5390-c8a3b7c7fe7e@nvidia.com>
References: <1593233625-14961-1-git-send-email-spujar@nvidia.com>
 <1593233625-14961-13-git-send-email-spujar@nvidia.com>
 <874kqu1x70.wl-kuninori.morimoto.gx@renesas.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <alsa-devel-bounces@alsa-project.org>
In-Reply-To: <874kqu1x70.wl-kuninori.morimoto.gx@renesas.com>
Content-Language: en-GB
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: jonathanh@nvidia.com, nicoleotsuka@gmail.com, alsa-devel@alsa-project.org, atalambedu@nvidia.com, swarren@nvidia.com, linux-kernel@vger.kernel.org, spujar@nvidia.com, nwartikar@nvidia.com, lgirdwood@gmail.com, robh+dt@kernel.org, tiwai@suse.com, viswanathl@nvidia.com, sharadg@nvidia.com, broonie@kernel.org, thierry.reding@gmail.com, linux-tegra@vger.kernel.org, digetx@gmail.com, rlokhande@nvidia.com, mkumard@nvidia.com, dramesh@nvidia.com
List-Id: linux-tegra@vger.kernel.org



On 6/29/2020 6:54 AM, Kuninori Morimoto wrote:
> External email: Use caution opening links or attachments
>
>
> Hi Sameer
>
>> The simple-card driver supports multiple CPU and single Codec entries
>> for DPCM DAI links. In some cases it is required to have multiple
>> CPU/Codecs. Currently parsing logic for DPCM link loops over all
>> children of DAI link but assumes that there is a single Codec entry.
>> When DAI link has multiple Codecs it considers only the first Codec
>> entry and remaining Codecs are wrongly treated as CPU. This happens
>> because first Codec is used as reference for parsing all other child
>> nodes.
> (snip)
>> @@ -137,8 +136,13 @@ static int simple_dai_link_of_dpcm(struct asoc_simple_priv *priv,
>>         * Codec |return|Pass
>>         * np
>>         */
>> -     if (li->cpu == (np == codec))
>> -             return 0;
>> +     if (li->cpu) {
>> +             if (!strcmp(np->name, "codec"))
>> +                     return 0;
>> +     } else {
>> +             if (!strcmp(np->name, "cpu"))
>> +                     return 0;
>> +     }
> Checking node name is maybe nice idea,
> but please consider "prefix" here.

Sorry I missed that example where DAI is defined at sound level. I will 
update.
>
> Maybe base issue for multiple codec support
> is that simple_for_each_link() is caring first codec only ?

Yes that is true.
>
>          simple_for_each_link(...)
>          {
>                  ...
>                  do {
> =>                      /* get codec */
> =>                      codec = of_get_child_by_name(...);
>                          ...
>                  }
>          }
>
> Remove above and having simple_node_is_codec(np, xxx) function
> or something can help it ?

Ideally I wanted to remove above two lines and allow empty codec list. 
But some users may expect the parsing to fail if no 'Codec' is found in 
the DAI link, hence did not remove above. If it is fine to remove above 
two lines it would be simpler. The loop inside simple_for_each_link() 
would anyway loop for each child node of DAI link and 
simple_dai_link_of_dpcm() can parse each 'np'.
>
>
> Thank you for your help !!
>
> Best regards
> ---
> Kuninori Morimoto
