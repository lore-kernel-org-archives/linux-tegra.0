From: Rhyland Klein <rklein@nvidia.com>
Subject: Re: [PATCH v4 08/20] clk: tegra: pll: Add logic for handling SDM
 data
Date: Wed, 6 May 2015 12:16:33 -0400
Message-ID: <554A3E61.5040105@nvidia.com>
References: <1430757460-9478-1-git-send-email-rklein@nvidia.com> <1430757460-9478-9-git-send-email-rklein@nvidia.com> <CANLzEksFVpYOtcG5QHHfQa6bGXJ6nMYrsP4yG=5wszxCHrWqug@mail.gmail.com> <554916F8.2060908@nvidia.com> <20150506135719.GB22098@ulmo.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20150506135719.GB22098@ulmo.nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Benson Leung <bleung@chromium.org>, Peter De Schrijver <pdeschrijver@nvidia.com>, Mike Turquette <mturquette@linaro.org>, Stephen Warren <swarren@wwwdotorg.org>, Stephen Boyd <sboyd@codeaurora.org>, Alexandre Courbot <gnurou@gmail.com>, linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

On 5/6/2015 9:57 AM, Thierry Reding wrote:
> * PGP Signed by an unknown key
> 
> On Tue, May 05, 2015 at 03:16:08PM -0400, Rhyland Klein wrote:
>> On 5/4/2015 7:01 PM, Benson Leung wrote:
>>> On Mon, May 4, 2015 at 9:37 AM, Rhyland Klein <rklein@nvidia.com> wrote:
>>>> @@ -495,6 +505,28 @@ static int _calc_rate(struct clk_hw *hw, struct tegra_clk_pll_freq_table *cfg,
>>>>         return 0;
>>>>  }
>>>>
>>>> +static void clk_pll_set_sdm_data(struct clk_hw *hw,
>>>> +                                struct tegra_clk_pll_freq_table *cfg)
>>>> +{
>>>> +       struct tegra_clk_pll *pll = to_clk_pll(hw);
>>>> +       u32 val;
>>>> +
>>>> +       if (!pll->params->sdm_din_reg)
>>>> +               return;
>>>> +
>>>> +       if (cfg->sdm_data) {
>>>> +               val = pll_readl_sdm_din(pll) & (~sdm_din_mask(pll));
>>>> +               val |= sdin_data_to_din(cfg->sdm_data) & sdm_din_mask(pll);
>>>> +               pll_writel_sdm_din(val, pll);
>>>> +       }
>>>> +
>>>> +       val = pll_readl_sdm_ctrl(pll);
>>>> +       if (!cfg->sdm_data != !(val & pll->params->sdm_ctrl_en_mask)) {
>>>
>>> You can use sdm_en_mask(pll) here.
>>>
>>> I'm not super clear about what you're trying to accomplish here with
>>> !cfg->sdm_data != !(val & mask).
>>> Are you just checking if the masked value is different from sdm_data,
>>> but accounting for the integer widths being different (u16 vs u32)?
>>
>> So I got clarification from the downstream author to be sure, and this
>> is the answer to what this is checking:
>>
>> (<Configuration has non zero  SDM_DATA>  AND <sdm control is disabled>)
>> OR
>> (<Configuration has zero  SDM_DATA>  AND <sdm control is enabled>)
>>
>> So the check is correct, just a complicated way of expressing it.
> 
> Can it be rewritten to be less complicated? I hate it when I have to
> look at code for several seconds and still not understand what it's
> doing. Why not something that is closer to the pseudo code you gave:
> 
> 	bool enabled = (val & pll->params->sdm_ctrl_en_mask) != 0;
> 
> 	if ((enabled && cfg->sdm_data == 0) || (!enabled && cfg->sdm_data != 0))
> 
> ? Also I think this could use some could comments explaining what's
> going on. Perhaps this could be simplified even further:
> 
> 	if (cfg->sdm_data == 0 && enabled)
> 		val &= ~pll->params->sdm_ctrl_en_mask;
> 
> 	if (cfg->sdm_data != 0 && !enabled)
> 		val |= pll->params->sdm_ctrl_en_mask;
> 
> 	pll_writel_sdm_ctrl(val, pll);
> 
> Now that I have a /much/ easier time reading and understanding. That may
> not even require comments because it's pretty plain what's going on. But
> there may be some advantage in adding comments about SDM in general. The
> comment could be something like what you have in the commit message, so
> that people don't have to go find the commit that added the code to find
> out what this is doing.
> 
> Thierry

I agree that the original statement was confusing. I'll replace it with
a simpler version, and comments never hurt :)

-rhyland

> 
> * Unknown Key
> * 0x7F3EB3A1
> 


-- 
nvpublic
