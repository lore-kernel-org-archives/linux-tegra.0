From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [alsa-devel] [PATCH 7/9] ASoC: tegra: add Tegra210 based ADMAIF
 driver
Date: Fri, 24 Jan 2020 07:25:08 +0300
Message-ID: <8a3259b7-6875-236a-b16c-cd8e023cc8b2@gmail.com>
References: <1579530198-13431-1-git-send-email-spujar@nvidia.com>
 <1579530198-13431-8-git-send-email-spujar@nvidia.com>
 <743d6d7d-f29c-191a-853b-414250ca38df@gmail.com>
 <3759aa0b-9e56-0fb4-27b7-4f98898d4e22@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <3759aa0b-9e56-0fb4-27b7-4f98898d4e22@nvidia.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Sameer Pujar <spujar@nvidia.com>, perex@perex.cz, tiwai@suse.com, robh+dt@kernel.org
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org, atalambedu@nvidia.com, linux-kernel@vger.kernel.org, lgirdwood@gmail.com, jonathanh@nvidia.com, viswanathl@nvidia.com, sharadg@nvidia.com, broonie@kernel.org, thierry.reding@gmail.com, linux-tegra@vger.kernel.org, rlokhande@nvidia.com, mkumard@nvidia.com, dramesh@nvidia.com
List-Id: linux-tegra@vger.kernel.org

24.01.2020 06:27, Sameer Pujar пишет:
> 
> 
> On 1/24/2020 6:58 AM, Dmitry Osipenko wrote:
>> External email: Use caution opening links or attachments
>>
>>
>> 20.01.2020 17:23, Sameer Pujar пишет:
>> [snip]
>>> +static bool tegra_admaif_wr_reg(struct device *dev, unsigned int reg)
>>> +{
>>> +     struct tegra_admaif *admaif = dev_get_drvdata(dev);
>>> +     unsigned int ch_stride = TEGRA_ADMAIF_CHANNEL_REG_STRIDE;
>>> +     unsigned int num_ch = admaif->soc_data->num_ch;
>>> +     unsigned int rx_base = admaif->soc_data->rx_base;
>>> +     unsigned int tx_base = admaif->soc_data->tx_base;
>>> +     unsigned int global_base = admaif->soc_data->global_base;
>>> +     unsigned int reg_max =
>>> admaif->soc_data->regmap_conf->max_register;
>>> +     unsigned int rx_max = rx_base + (num_ch * ch_stride);
>>> +     unsigned int tx_max = tx_base + (num_ch * ch_stride);
>>> +
>>> +     if ((reg >= rx_base) && (reg < rx_max)) {
>> The braces are not needed around the comparisons because they precede
>> the AND. Same for all other similar occurrences in the code.
> 
> While that is true, some prefer to use explicit braces to make it more
> readable.
> In the past I was told to use explicitly in such cases.

At least most of code in kernel (I've seen) doesn't have superfluous
parens (the curvy thingies actually should be the braces). Readability
is arguable in this case, I'm finding such code a bit more difficult to
read, although in some cases parens and spacing may help to read more
complex constructions.
