From: Rhyland Klein <rklein@nvidia.com>
Subject: Re: [PATCH v5 20/21] clk: tegra210: add support for Tegra210 clocks
Date: Wed, 20 May 2015 13:17:22 -0400
Message-ID: <555CC1A2.9070605@nvidia.com>
References: <1431451444-23155-1-git-send-email-rklein@nvidia.com>	<1431451444-23155-22-git-send-email-rklein@nvidia.com> <CANLzEkumVdds8AkDRNGdp_b20Eq1vmf1gzuqJuYnLsRYgVHCFw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CANLzEkumVdds8AkDRNGdp_b20Eq1vmf1gzuqJuYnLsRYgVHCFw@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Benson Leung <bleung@chromium.org>
Cc: Peter De Schrijver <pdeschrijver@nvidia.com>, Mike Turquette <mturquette@linaro.org>, Stephen Warren <swarren@wwwdotorg.org>, Stephen Boyd <sboyd@codeaurora.org>, Thierry Reding <thierry.reding@gmail.com>, Alexandre Courbot <gnurou@gmail.com>, Bill Huang <bilhuang@nvidia.com>, Paul Walmsley <pwalmsley@nvidia.com>, Jim Lin <jilin@nvidia.com>, linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

On 5/14/2015 4:23 PM, Benson Leung wrote:
> On Tue, May 12, 2015 at 10:24 AM, Rhyland Klein <rklein@nvidia.com> wrote:
>> +static int _p_div_to_hw(struct clk_hw *hw, u8 p_div)
>> +{
>> +       struct tegra_clk_pll *pll = to_clk_pll(hw);
>> +       struct pdiv_map *p_tohw = pll->params->pdiv_tohw;
>> +
>> +       if (p_tohw) {
>> +               while (p_tohw->pdiv) {
>> +                       if (p_div <= p_tohw->pdiv)
>> +                               return p_tohw->hw_val;
>> +                       p_tohw++;
>> +               }
>> +               return -EINVAL;
>> +       }
>> +       return -EINVAL;
>> +}
> 
> This is the same function as the one that lives in clk-pll.c. Can you
> make these common?
> 
Sure, I'll add that for v6.

-rhyland


-- 
nvpublic
