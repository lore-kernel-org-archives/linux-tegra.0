From: Sameer Pujar <spujar@nvidia.com>
Subject: Re: [PATCH v4 08/23] ASoC: soc-core: Fix component name_prefix parsing
Date: Mon, 29 Jun 2020 21:16:26 +0530
Message-ID: <5ad958bb-a736-2391-31fa-c32e13750322@nvidia.com>
References: <1593233625-14961-1-git-send-email-spujar@nvidia.com>
 <1593233625-14961-9-git-send-email-spujar@nvidia.com>
 <878sg61zcf.wl-kuninori.morimoto.gx@renesas.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <alsa-devel-bounces@alsa-project.org>
In-Reply-To: <878sg61zcf.wl-kuninori.morimoto.gx@renesas.com>
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



On 6/29/2020 6:08 AM, Kuninori Morimoto wrote:
> External email: Use caution opening links or attachments
>
>
> Hi Sameer
>
> Thank you for your patch
>
> # I guess there was ML registering magic until v3 ?
> # This is 1st time for me to get this patch series...

Until v3 the series was mostly about registering ASoC components. Based 
on the discussions in the previous series and threads, I have updated 
drivers to work with DPCM and added patches for simple-card driver to 
test complete audio path. Yes, simple-card driver patches are new and 
were not part of earlier series. Sorry if I was not clear in the cover 
letter.

Thank you for the review.
>
>> The "prefix" can be defined in DAI link node or it can be specified as
>> part of the component node itself. Currently "sound-name-prefix" defined
>> in a component is not taking effect. Actually the property is not getting
>> parsed. It can be fixed by parsing "sound-name-prefix" property whenever
>> "prefix" is missing in DAI link Codec node.
>>
>> Signed-off-by: Sameer Pujar <spujar@nvidia.com>
> (snip)
>> @@ -1111,8 +1111,10 @@ static void soc_set_name_prefix(struct snd_soc_card *card,
>>                struct snd_soc_codec_conf *map = &card->codec_conf[i];
>>
>>                if (snd_soc_is_matching_component(&map->dlc, component)) {
>> -                     component->name_prefix = map->name_prefix;
>> -                     return;
>> +                     if (map->name_prefix) {
>> +                             component->name_prefix = map->name_prefix;
>> +                             return;
>> +                     }
>>                }
>>        }
> This is nit-pick but it can be like this ?
>
>                  if (snd_soc_is_matching_component(&map->dlc, component) &&
>                      map->name_prefix) {
>                          ...
>                  }

Sounds fine. Will update.
>
> Thank you for your help !!
>
> Best regards
> ---
> Kuninori Morimoto
