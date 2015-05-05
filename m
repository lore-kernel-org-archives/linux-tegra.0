From: Rhyland Klein <rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v4 08/20] clk: tegra: pll: Add logic for handling SDM
 data
Date: Tue, 5 May 2015 15:16:08 -0400
Message-ID: <554916F8.2060908@nvidia.com>
References: <1430757460-9478-1-git-send-email-rklein@nvidia.com>	<1430757460-9478-9-git-send-email-rklein@nvidia.com> <CANLzEksFVpYOtcG5QHHfQa6bGXJ6nMYrsP4yG=5wszxCHrWqug@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CANLzEksFVpYOtcG5QHHfQa6bGXJ6nMYrsP4yG=5wszxCHrWqug-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Benson Leung <bleung-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 5/4/2015 7:01 PM, Benson Leung wrote:
> On Mon, May 4, 2015 at 9:37 AM, Rhyland Klein <rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wrote:
>> @@ -495,6 +505,28 @@ static int _calc_rate(struct clk_hw *hw, struct tegra_clk_pll_freq_table *cfg,
>>         return 0;
>>  }
>>
>> +static void clk_pll_set_sdm_data(struct clk_hw *hw,
>> +                                struct tegra_clk_pll_freq_table *cfg)
>> +{
>> +       struct tegra_clk_pll *pll = to_clk_pll(hw);
>> +       u32 val;
>> +
>> +       if (!pll->params->sdm_din_reg)
>> +               return;
>> +
>> +       if (cfg->sdm_data) {
>> +               val = pll_readl_sdm_din(pll) & (~sdm_din_mask(pll));
>> +               val |= sdin_data_to_din(cfg->sdm_data) & sdm_din_mask(pll);
>> +               pll_writel_sdm_din(val, pll);
>> +       }
>> +
>> +       val = pll_readl_sdm_ctrl(pll);
>> +       if (!cfg->sdm_data != !(val & pll->params->sdm_ctrl_en_mask)) {
> 
> You can use sdm_en_mask(pll) here.
> 
> I'm not super clear about what you're trying to accomplish here with
> !cfg->sdm_data != !(val & mask).
> Are you just checking if the masked value is different from sdm_data,
> but accounting for the integer widths being different (u16 vs u32)?

So I got clarification from the downstream author to be sure, and this
is the answer to what this is checking:

(<Configuration has non zero  SDM_DATA>  AND <sdm control is disabled>)
OR
(<Configuration has zero  SDM_DATA>  AND <sdm control is enabled>)

So the check is correct, just a complicated way of expressing it.

-rhyland


-- 
nvpublic
