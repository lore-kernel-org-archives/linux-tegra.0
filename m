From: Sameer Pujar <spujar@nvidia.com>
Subject: Re: [PATCH v4 10/23] ASoC: simple-card: Wrong daifmt for CPU end of
 DPCM DAI link
Date: Mon, 29 Jun 2020 21:36:49 +0530
Message-ID: <6e27daa5-331e-968b-4027-2e30aeb7d382@nvidia.com>
References: <1593233625-14961-1-git-send-email-spujar@nvidia.com>
 <1593233625-14961-11-git-send-email-spujar@nvidia.com>
 <877dvq1yhy.wl-kuninori.morimoto.gx@renesas.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <alsa-devel-bounces@alsa-project.org>
In-Reply-To: <877dvq1yhy.wl-kuninori.morimoto.gx@renesas.com>
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



On 6/29/2020 6:26 AM, Kuninori Morimoto wrote:
> External email: Use caution opening links or attachments
>
>
> Hi Sameer
>
>>   simple-audio-card,dai-link@xxx {
>>       format = "i2s";
>>       bitclock-master=<&cpu1>;
>>       frame-master=<&cpu1>;
>>
>>       cpu1: cpu@0 {
>>           ...
>>       };
>>
>>       codec@0 {
>>           ...
>>       };
>>
>>       ...
>>   };
>>
>> In above case CPU is expected to be configured as a master and Codec as
>> a slave device. But both CPU/Codec are being configured as slave devices.
>> This happens because asoc_simple_parse_daifmt() uses Codec reference and
>> sets up the 'dai_link->dai_fmt' accordingly while parsing both CPU and
>> Codec.
> I'm sorry but I don't 100% understand about this case...
> asoc_simple_parse_daifmt() should work in this case
>
> The reason why it needs codec node is that
> SND_SOC_DAIFMT_CBx_CFx are "Codec" base Master/Slave.

Currently soc-core has following code snippet,

/snd_soc_runtime_set_dai_fmt() {//
//     ...//
//
//     if (cpu_dai->component->driver->non_legacy_dai_naming)//
//         fmt = inv_dai_fmt;//
//
//     ...//
// }/

Above flips polarity for 'cpu_dai' if 'non_legacy_dai_naming' flag is set.

1. Hence example mentioned in the commit message does not work if my 
'cpu_dai' driver does not have this flag set.

2. While it is true that we consider reference of 'Codec' mode for 
simple CPU<->Codec DAI links, for DPCM this does not seem flexible. For 
DPCM links CPU and Codec are not directly connected (CPU<->Dummy or 
Dummy<->Codec). Please consider, for example, if the DAI link has 
multiple CPU/Codecs. Which 'Codec' reference needs to be considered? 
Isn't it better if we explicitly mention which DAI we want to operate as 
'Master'?

>
> Thank you for your help !!
>
> Best regards
> ---
> Kuninori Morimoto
