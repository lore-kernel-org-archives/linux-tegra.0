From: Sameer Pujar <spujar@nvidia.com>
Subject: Re: [PATCH v4 11/23] ASoC: simple-card: Loop over all children for
 'mclk-fs'
Date: Mon, 29 Jun 2020 22:02:24 +0530
Message-ID: <58000bd3-861c-bbc2-75e1-128cf0199a76@nvidia.com>
References: <1593233625-14961-1-git-send-email-spujar@nvidia.com>
 <1593233625-14961-12-git-send-email-spujar@nvidia.com>
 <875zba1y28.wl-kuninori.morimoto.gx@renesas.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <alsa-devel-bounces@alsa-project.org>
In-Reply-To: <875zba1y28.wl-kuninori.morimoto.gx@renesas.com>
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



On 6/29/2020 6:35 AM, Kuninori Morimoto wrote:
> External email: Use caution opening links or attachments
>
>
> Hi Sameer
>
>> CPU/Codec in DPCM DAI links are connected as CPU<->Dummy and Dummy<->Codec.
>> Though mostly CPU won't use/require 'mclk-fs' property, looping over
>> 'np' (current child node in a DAI link) can help in cases where multiple
>> Codecs are defined. This further helps to get rid of 'codec' argument
>> from simple_dai_link_of_dpcm() function, which gets called for DPCM links.
>>
>> Signed-off-by: Sameer Pujar <spujar@nvidia.com>
>> ---
> (snip)
>> diff --git a/sound/soc/generic/simple-card.c b/sound/soc/generic/simple-card.c
>> index 39cdc71..02d6295 100644
>> --- a/sound/soc/generic/simple-card.c
>> +++ b/sound/soc/generic/simple-card.c
>> @@ -107,7 +107,9 @@ static void simple_parse_mclk_fs(struct device_node *top,
>>        snprintf(prop, sizeof(prop), "%smclk-fs", prefix);
>>        of_property_read_u32(node,      prop, &props->mclk_fs);
>>        of_property_read_u32(cpu,       prop, &props->mclk_fs);
>> -     of_property_read_u32(codec,     prop, &props->mclk_fs);
>> +
>> +     if (cpu != codec)
>> +             of_property_read_u32(codec, prop, &props->mclk_fs);
> Maybe we want to have "cpu" in simple_dai_link_of_dpcm() side
> without using magical code in simple_parse_mclk_fs() side ?

Are you suggesting if we should simplify simple_parse_mclk_fs() by 
either passing 'cpu' or 'codec'?
>
> Thank you for your help !!
>
> Best regards
> ---
> Kuninori Morimoto
