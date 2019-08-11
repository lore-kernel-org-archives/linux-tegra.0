From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v8 10/21] clk: tegra: clk-super: Add restore-context
 support
Date: Sun, 11 Aug 2019 20:29:32 +0300
Message-ID: <0872c194-152e-da0f-31b5-8b0b2e8999d8@gmail.com>
References: <1565308020-31952-1-git-send-email-skomatineni@nvidia.com>
 <1565308020-31952-11-git-send-email-skomatineni@nvidia.com>
 <4e33bad9-8d5a-dcd7-c75e-db5843c9be4a@gmail.com>
 <12250cae-8850-ff1d-91b1-0a50cdab6fa1@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <12250cae-8850-ff1d-91b1-0a50cdab6fa1@nvidia.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Sowjanya Komatineni <skomatineni@nvidia.com>, thierry.reding@gmail.com, jonathanh@nvidia.com, tglx@linutronix.de, jason@lakedaemon.net, marc.zyngier@arm.com, linus.walleij@linaro.org, stefan@agner.ch, mark.rutland@arm.com
Cc: pdeschrijver@nvidia.com, pgaikwad@nvidia.com, sboyd@kernel.org, linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, jckuo@nvidia.com, josephl@nvidia.com, talho@nvidia.com, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, mperttunen@nvidia.com, spatra@nvidia.com, robh+dt@kernel.org, devicetree@vger.kernel.org, rjw@rjwysocki.net, viresh.kumar@linaro.org, linux-pm@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

09.08.2019 20:08, Sowjanya Komatineni пишет:
> 
> On 8/9/19 5:17 AM, Dmitry Osipenko wrote:
>> 09.08.2019 2:46, Sowjanya Komatineni пишет:
>>> This patch implements restore_context for clk_super_mux and clk_super.
>>>
>>> During system supend, core power goes off the and context of Tegra
>>> CAR registers is lost.
>>>
>>> So on system resume, context of super clock registers are restored
>>> to have them in same state as before suspend.
>>>
>>> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
>>> ---
>>>   drivers/clk/tegra/clk-super.c | 21 +++++++++++++++++++++
>>>   1 file changed, 21 insertions(+)
>>>
>>> diff --git a/drivers/clk/tegra/clk-super.c b/drivers/clk/tegra/clk-super.c
>>> index e2a1e95a8db7..74c9e913e41c 100644
>>> --- a/drivers/clk/tegra/clk-super.c
>>> +++ b/drivers/clk/tegra/clk-super.c
>>> @@ -124,9 +124,18 @@ static int clk_super_set_parent(struct clk_hw *hw, u8 index)
>>>       return err;
>>>   }
>>>   +static void clk_super_mux_restore_context(struct clk_hw *hw)
>>> +{
>>> +    struct clk_hw *parent = clk_hw_get_parent(hw);
>>> +    int parent_id = clk_hw_get_parent_index(hw, parent);
>>> +
>>> +    clk_super_set_parent(hw, parent_id);
>> All Super clocks have a divider, including the "MUX". Thus I'm wondering
>> if there is a chance that divider's configuration may differ on resume
>> from what it was on suspend.
> 
> tegra_clk_register_super_mux which uses tegra_clk_super_mux_ops doesn't do divider rate
> programming.
> 
> I believe you are referring to sclk_divider, cclklp_divider, cclkg_divider...
> 
> these are registered as clk_divider and are restored during clk_divider resume.

Indeed, thanks for the clarification.
