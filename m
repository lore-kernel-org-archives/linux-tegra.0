From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v6 12/19] ASoC: tegra: Add audio mclk configuration
Date: Wed, 8 Jan 2020 01:56:31 +0300
Message-ID: <adb4c9dd-043a-ffca-7a1d-c6b30055b7a0@gmail.com>
References: <1578370458-3686-1-git-send-email-skomatineni@nvidia.com>
 <1578370458-3686-13-git-send-email-skomatineni@nvidia.com>
 <c23bf3f5-55d6-ab93-fd7b-13f9f2155dcc@nvidia.com>
 <d85c8529-9970-c79c-9430-ed80c47eaf36@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <d85c8529-9970-c79c-9430-ed80c47eaf36@nvidia.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Sowjanya Komatineni <skomatineni@nvidia.com>, Sameer Pujar <spujar@nvidia.com>, thierry.reding@gmail.com, jonathanh@nvidia.com, broonie@kernel.org, lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, mperttunen@nvidia.com, gregkh@linuxfoundation.org, sboyd@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com
Cc: pdeschrijver@nvidia.com, pgaikwad@nvidia.com, josephl@nvidia.com, daniel.lezcano@linaro.org, mmaddireddy@nvidia.com, markz@nvidia.com, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

07.01.2020 19:56, Sowjanya Komatineni пишет:
> 
> On 1/7/20 3:14 AM, Sameer Pujar wrote:
>>
>> On 1/7/2020 9:44 AM, Sowjanya Komatineni wrote:
>>> Tegra PMC clock clk_out_1 is dedicated for audio mclk from Tegra30
>>> through Tegra210 and currently Tegra clock driver does the initial
>>> parent
>>> configuration for audio mclk and keeps it enabled by default.
>>>
>>> With the move of PMC clocks from clock driver into pmc driver,
>>> audio clocks parent configuration can be specified through the device
>>> tree
>>> using assigned-clock-parents property and audio mclk control should be
>>> taken care by the audio driver.
>>>
>>> This patch has implementation for parent configuration when default
>>> parent
>>> configuration is not specified in the device tree and controls audio
>>> mclk
>>> enable and disable during machine startup and shutdown.
>>>
>>> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
>>
>> Minor comments, otherwise LGTM.
>>
> Thanks Sameer. Will fix.
>>> ---
>>>   sound/soc/tegra/tegra_alc5632.c    | 21 ++++++++++
>>>   sound/soc/tegra/tegra_asoc_utils.c | 84
>>> ++++++++++++++++++++++++--------------
>>>   sound/soc/tegra/tegra_asoc_utils.h |  2 +
>>>   sound/soc/tegra/tegra_max98090.c   | 21 ++++++++++
>>>   sound/soc/tegra/tegra_rt5640.c     | 21 ++++++++++
>>>   sound/soc/tegra/tegra_rt5677.c     | 21 ++++++++++
>>>   sound/soc/tegra/tegra_sgtl5000.c   | 21 ++++++++++
>>>   sound/soc/tegra/tegra_wm8753.c     | 21 ++++++++++
>>>   sound/soc/tegra/tegra_wm8903.c     | 21 ++++++++++
>>>   sound/soc/tegra/trimslice.c        | 21 ++++++++++
>>>   10 files changed, 224 insertions(+), 30 deletions(-)
>>>
>>> diff --git a/sound/soc/tegra/tegra_alc5632.c
>>> b/sound/soc/tegra/tegra_alc5632.c
>>> index 50a6d2ff4442..0fd10023f7a6 100644
>>> --- a/sound/soc/tegra/tegra_alc5632.c
>>> +++ b/sound/soc/tegra/tegra_alc5632.c
>>> @@ -62,8 +62,29 @@ static int tegra_alc5632_asoc_hw_params(struct
>>> snd_pcm_substream *substream,
>>>       return 0;
>>>   }
>>>   +static int tegra_alc5632_asoc_startup(struct snd_pcm_substream
>>> *substream)
>>> +{
>>> +    struct snd_soc_pcm_runtime *rtd = substream->private_data;
>>> +    struct tegra_alc5632 *machine =
>>> snd_soc_card_get_drvdata(rtd->card);
>>> +    int ret;
>>> +
>>> +    ret = tegra_asoc_utils_clk_enable(&machine->util_data);
>>> +
>>> +    return ret;
>>> +}
>>> +
>>> +static void tegra_alc5632_asoc_shutdown(struct snd_pcm_substream
>>> *substream)
>>> +{
>>> +    struct snd_soc_pcm_runtime *rtd = substream->private_data;
>>> +    struct tegra_alc5632 *machine =
>>> snd_soc_card_get_drvdata(rtd->card);
>>> +
>>> +    tegra_asoc_utils_clk_disable(&machine->util_data);
>>> +}
>>> +
>>>   static const struct snd_soc_ops tegra_alc5632_asoc_ops = {
>>> +    .startup = tegra_alc5632_asoc_startup,
>>>       .hw_params = tegra_alc5632_asoc_hw_params,
>>> +    .shutdown = tegra_alc5632_asoc_shutdown,
>>>   };
>>>     static struct snd_soc_jack tegra_alc5632_hs_jack;
>>> diff --git a/sound/soc/tegra/tegra_asoc_utils.c
>>> b/sound/soc/tegra/tegra_asoc_utils.c
>>> index 0d2271952555..2886ae9f5a16 100644
>>> --- a/sound/soc/tegra/tegra_asoc_utils.c
>>> +++ b/sound/soc/tegra/tegra_asoc_utils.c
>>> @@ -60,8 +60,6 @@ int tegra_asoc_utils_set_rate(struct
>>> tegra_asoc_utils_data *data, int srate,
>>>       data->set_mclk = 0;
>>>         clk_disable_unprepare(data->clk_cdev1);
>>> -    clk_disable_unprepare(data->clk_pll_a_out0);
>>> -    clk_disable_unprepare(data->clk_pll_a);
>>>         err = clk_set_rate(data->clk_pll_a, new_baseclock);
>>>       if (err) {
>>> @@ -77,18 +75,6 @@ int tegra_asoc_utils_set_rate(struct
>>> tegra_asoc_utils_data *data, int srate,
>>>         /* Don't set cdev1/extern1 rate; it's locked to pll_a_out0 */
>>>   -    err = clk_prepare_enable(data->clk_pll_a);
>>> -    if (err) {
>>> -        dev_err(data->dev, "Can't enable pll_a: %d\n", err);
>>> -        return err;
>>> -    }
>>> -
>>> -    err = clk_prepare_enable(data->clk_pll_a_out0);
>>> -    if (err) {
>>> -        dev_err(data->dev, "Can't enable pll_a_out0: %d\n", err);
>>> -        return err;
>>> -    }
>>> -
>>>       err = clk_prepare_enable(data->clk_cdev1);
>>>       if (err) {
>>>           dev_err(data->dev, "Can't enable cdev1: %d\n", err);
>>> @@ -109,8 +95,6 @@ int tegra_asoc_utils_set_ac97_rate(struct
>>> tegra_asoc_utils_data *data)
>>>       int err;
>>>         clk_disable_unprepare(data->clk_cdev1);
>>> -    clk_disable_unprepare(data->clk_pll_a_out0);
>>> -    clk_disable_unprepare(data->clk_pll_a);
>>>         /*
>>>        * AC97 rate is fixed at 24.576MHz and is used for both the host
>>> @@ -130,17 +114,27 @@ int tegra_asoc_utils_set_ac97_rate(struct
>>> tegra_asoc_utils_data *data)
>>>         /* Don't set cdev1/extern1 rate; it's locked to pll_a_out0 */
>>>   -    err = clk_prepare_enable(data->clk_pll_a);
>>> +    err = clk_prepare_enable(data->clk_cdev1);
>>>       if (err) {
>>> -        dev_err(data->dev, "Can't enable pll_a: %d\n", err);
>>> +        dev_err(data->dev, "Can't enable cdev1: %d\n", err);
>>>           return err;
>>>       }
>>>   -    err = clk_prepare_enable(data->clk_pll_a_out0);
>>> -    if (err) {
>>> -        dev_err(data->dev, "Can't enable pll_a_out0: %d\n", err);
>>> -        return err;
>>> -    }
>>> +    data->set_baseclock = pll_rate;
>>> +    data->set_mclk = ac97_rate;
>>> +
>>> +    return 0;
>>> +}
>>> +EXPORT_SYMBOL_GPL(tegra_asoc_utils_set_ac97_rate);
>>> +
>>> +void tegra_asoc_utils_clk_disable(struct tegra_asoc_utils_data *data)
>>> +{
>>> +    clk_disable_unprepare(data->clk_cdev1);
>>> +}
>>> +
>>> +int tegra_asoc_utils_clk_enable(struct tegra_asoc_utils_data *data)
>>> +{
>>> +    int err;
>>>         err = clk_prepare_enable(data->clk_cdev1);
>>>       if (err) {
>>> @@ -148,16 +142,13 @@ int tegra_asoc_utils_set_ac97_rate(struct
>>> tegra_asoc_utils_data *data)
>>>           return err;
>>>       }
>>>   -    data->set_baseclock = pll_rate;
>>> -    data->set_mclk = ac97_rate;
>>> -
>>>       return 0;
>>>   }
>>> -EXPORT_SYMBOL_GPL(tegra_asoc_utils_set_ac97_rate);
>>>     int tegra_asoc_utils_init(struct tegra_asoc_utils_data *data,
>>>                 struct device *dev)
>>>   {
>>> +    struct clk *clk_out_1, *clk_extern1;
>>>       int ret;
>>>         data->dev = dev;
>>> @@ -193,9 +184,42 @@ int tegra_asoc_utils_init(struct
>>> tegra_asoc_utils_data *data,
>>>           return PTR_ERR(data->clk_cdev1);
>>>       }
>>>   -    ret = tegra_asoc_utils_set_rate(data, 44100, 256 * 44100);
>>> -    if (ret)
>>> -        return ret;
>>> +    /*
>>> +     * If clock parents are not set in DT, configure here to use
>>> clk_out_1
>>> +     * as mclk and extern1 as parent for Tegra30 and higher.
>>> +     */
>>> +    if (!of_find_property(dev->of_node, "assigned-clock-parents",
>>> NULL) &&
>>> +        data->soc > TEGRA_ASOC_UTILS_SOC_TEGRA20) {
>>> +        dev_err(data->dev,
>>
>> As this is a fallback mechanism, use dev_info or dev_dbg instead?

dev_warn

>>> +            "Configuring clocks for a legacy device-tree\n");

I'd also add another message here saying "Please update your DT", for
clarity.
