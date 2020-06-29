From: Sameer Pujar <spujar@nvidia.com>
Subject: Re: [PATCH v4 15/23] ASoC: soc-core: Identify 'no_pcm' DAI links for
 DPCM
Date: Mon, 29 Jun 2020 22:49:16 +0530
Message-ID: <83b6cee2-8254-477c-cb65-7e05a9fdbacf@nvidia.com>
References: <1593233625-14961-1-git-send-email-spujar@nvidia.com>
 <1593233625-14961-16-git-send-email-spujar@nvidia.com>
 <87366e1wkb.wl-kuninori.morimoto.gx@renesas.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <alsa-devel-bounces@alsa-project.org>
In-Reply-To: <87366e1wkb.wl-kuninori.morimoto.gx@renesas.com>
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



On 6/29/2020 7:08 AM, Kuninori Morimoto wrote:
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
>
> We can/should NULL poinster check for "dlc->dai_name" on top of
> this function instead of inside loop ?
> And then, we can remove "dai->name" check because next strcmp()
> automatically fail if dai->name was NULL.

Sounds good, will update.
>
> Thank you for your help !!
>
> Best regards
> ---
> Kuninori Morimoto
