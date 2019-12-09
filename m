From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v3 08/15] ASoC: tegra: Add audio mclk control through
 clk_out_1 and extern1
Date: Tue, 10 Dec 2019 02:12:17 +0300
Message-ID: <664a0b15-7136-2a11-f0a0-06f32cca1a9c@gmail.com>
References: <1575600535-26877-1-git-send-email-skomatineni@nvidia.com>
 <1575600535-26877-9-git-send-email-skomatineni@nvidia.com>
 <0ce2e83b-800c-da1e-7a3c-3cf1427cfe20@gmail.com>
 <2eeceabe-b5f0-6f9e-ff8c-4ac6167b7cc3@nvidia.com>
 <5d26e32c-a346-4d42-9872-840964512144@gmail.com>
 <79661e2f-dcd4-6dd5-9b4d-9dcc40de478a@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <79661e2f-dcd4-6dd5-9b4d-9dcc40de478a@nvidia.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Sowjanya Komatineni <skomatineni@nvidia.com>, thierry.reding@gmail.com, jonathanh@nvidia.com, mperttunen@nvidia.com, gregkh@linuxfoundation.org, sboyd@kernel.org, tglx@linutronix.de, robh+dt@kernel.org, mark.rutland@arm.com
Cc: allison@lohutok.net, pdeschrijver@nvidia.com, pgaikwad@nvidia.com, mturquette@baylibre.com, horms+renesas@verge.net.au, Jisheng.Zhang@synaptics.com, krzk@kernel.org, arnd@arndb.de, spujar@nvidia.com, josephl@nvidia.com, vidyas@nvidia.com, daniel.lezcano@linaro.org, mmaddireddy@nvidia.com, markz@nvidia.com, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.com, alexios.zavras@intel.com, alsa-devel@alsa-project.org
List-Id: linux-tegra@vger.kernel.org

10.12.2019 02:05, Sowjanya Komatineni пишет:
> 
> On 12/9/19 12:06 PM, Dmitry Osipenko wrote:
>> 07.12.2019 22:20, Sowjanya Komatineni пишет:
>>> On 12/7/19 6:58 AM, Dmitry Osipenko wrote:
>>>> 06.12.2019 05:48, Sowjanya Komatineni пишет:
>>>>> Current ASoC driver uses extern1 as cdev1 clock from Tegra30 onwards
>>>>> through device tree.
>>>>>
>>>>> Actual audio mclk is clk_out_1 and to use PLLA for mclk rate control,
>>>>> need to clk_out_1_mux parent to extern1 and extern1 parent to
>>>>> PLLA_OUT0.
>>>>>
>>>>> Currently Tegra clock driver init sets the parents and enables both
>>>>> clk_out_1 and extern1 clocks. But these clocks parent and enables
>>>>> should
>>>>> be controlled by ASoC driver.
>>>>>
>>>>> Clock parents can be specified in device tree using assigned-clocks
>>>>> and assigned-clock-parents.
>>>>>
>>>>> To enable audio mclk, both clk_out_1 and extern1 clocks need to be
>>>>> enabled.
>>>>>
>>>>> This patch configures parents for clk_out_1 and extern1 clocks if
>>>>> device
>>>>> tree does not specify clock parents inorder to support old device tree
>>>>> and controls mclk using both clk_out_1 and extern1 clocks.
>>>>>
>>>>> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
>>>>> ---
>>>>>    sound/soc/tegra/tegra_asoc_utils.c | 66
>>>>> ++++++++++++++++++++++++++++++++++++++
>>>>>    sound/soc/tegra/tegra_asoc_utils.h |  1 +
>>>>>    2 files changed, 67 insertions(+)
>>>>>
>>>>> diff --git a/sound/soc/tegra/tegra_asoc_utils.c
>>>>> b/sound/soc/tegra/tegra_asoc_utils.c
>>>>> index 536a578e9512..8e3a3740df7c 100644
>>>>> --- a/sound/soc/tegra/tegra_asoc_utils.c
>>>>> +++ b/sound/soc/tegra/tegra_asoc_utils.c
>>>>> @@ -60,6 +60,7 @@ int tegra_asoc_utils_set_rate(struct
>>>>> tegra_asoc_utils_data *data, int srate,
>>>>>        data->set_mclk = 0;
>>>>>          clk_disable_unprepare(data->clk_cdev1);
>>>>> +    clk_disable_unprepare(data->clk_extern1);
>>>>>        clk_disable_unprepare(data->clk_pll_a_out0);
>>>>>        clk_disable_unprepare(data->clk_pll_a);
>>>>>    @@ -89,6 +90,14 @@ int tegra_asoc_utils_set_rate(struct
>>>>> tegra_asoc_utils_data *data, int srate,
>>>>>            return err;
>>>>>        }
>>>>>    +    if (!IS_ERR_OR_NULL(data->clk_extern1)) {
>>>>> +        err = clk_prepare_enable(data->clk_extern1);
>>>>> +        if (err) {
>>>>> +            dev_err(data->dev, "Can't enable extern1: %d\n", err);
>>>>> +            return err;
>>>>> +        }
>>>>> +    }
>>>>> +
>>>>>        err = clk_prepare_enable(data->clk_cdev1);
>>>>>        if (err) {
>>>>>            dev_err(data->dev, "Can't enable cdev1: %d\n", err);
>>>>> @@ -109,6 +118,7 @@ int tegra_asoc_utils_set_ac97_rate(struct
>>>>> tegra_asoc_utils_data *data)
>>>>>        int err;
>>>>>          clk_disable_unprepare(data->clk_cdev1);
>>>>> +    clk_disable_unprepare(data->clk_extern1);
>>>>>        clk_disable_unprepare(data->clk_pll_a_out0);
>>>>>        clk_disable_unprepare(data->clk_pll_a);
>>>>>    @@ -142,6 +152,14 @@ int tegra_asoc_utils_set_ac97_rate(struct
>>>>> tegra_asoc_utils_data *data)
>>>>>            return err;
>>>>>        }
>>>>>    +    if (!IS_ERR_OR_NULL(data->clk_extern1)) {
>>>>> +        err = clk_prepare_enable(data->clk_extern1);
>>>>> +        if (err) {
>>>>> +            dev_err(data->dev, "Can't enable extern1: %d\n", err);
>>>>> +            return err;
>>>>> +        }
>>>>> +    }
>>>> Why this is needed given that clk_extern1 is either a child of MCLK or
>>>> MCLK itself (on T20)? The child clocks are enabled when the parent is
>>>> enabled.
>>> For T30 and later, clk_extern1 is one of the source for clk_out_1_mux.
>>> clk_extern1 is in CAR and it has its own gate and mux.
>>>
>>> As audio mclk related clocks (clk_out_1, clk_out_1_mux, and extern1) are
>>> moved into ASoC driver from clock driver
>>>
>>> need to enable extern1 gate as well along with clk_out1 for T30 through
>>> T210.
>>>
>>> Just FYI, extern1 enable here happens only when data->clk_extern1 is
>>> available which is for T30 onwards.
>> clk_out_1 is the parent of extern1, thus extern1 is enabled by the clk
>> core whenever clk_out_1 is enabled because data->clk_cdev1=clk_out_1. An
>> I missing something?
>>
>> [snip]
> extern1 is the parent for clk_out_1. explained extern1 clock path to
> clk_out in reply to your comment in other patch of this series.

Right, I meant extern1 the parent of clk_out_1, sorry for the confusion.
So when clk_out_1 (child) is enabled, extern1 (parent) is enabled as well.

I'll take a closer look at the other email tomorrow.
