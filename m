From: Rhyland Klein <rklein@nvidia.com>
Subject: Re: [PATCH v4 09/20] clk: tegra: pll: Add logic for SS
Date: Tue, 5 May 2015 16:15:59 -0400
Message-ID: <554924FF.5040608@nvidia.com>
References: <1430757460-9478-1-git-send-email-rklein@nvidia.com>	<1430757460-9478-10-git-send-email-rklein@nvidia.com> <CANLzEkvqniogx9AUzK-Vx0TYg-=qQB_JwPEU+DbHDcNRx3c4xA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CANLzEkvqniogx9AUzK-Vx0TYg-=qQB_JwPEU+DbHDcNRx3c4xA@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Benson Leung <bleung@chromium.org>
Cc: Peter De Schrijver <pdeschrijver@nvidia.com>, Mike Turquette <mturquette@linaro.org>, Stephen Warren <swarren@wwwdotorg.org>, Stephen Boyd <sboyd@codeaurora.org>, Thierry Reding <thierry.reding@gmail.com>, Alexandre Courbot <gnurou@gmail.com>, linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Bill Huang <bilhuang@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

On 5/4/2015 7:11 PM, Benson Leung wrote:
> On Mon, May 4, 2015 at 9:37 AM, Rhyland Klein <rklein@nvidia.com> wrote:
>> From: Bill Huang <bilhuang@nvidia.com>
>>
>> Add some logic for Spread Spectrum control. It is used in conjuncture
>> with SDM fractional dividers. SSC has to be disabled when we configure
>> the divider settings.
>>
>> Signed-off-by: Bill Huang <bilhuang@nvidia.com>
>> ---
>>  drivers/clk/tegra/clk-pll.c |   25 ++++++++++++++++++++++++-
>>  drivers/clk/tegra/clk.h     |    2 ++
>>  2 files changed, 26 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/clk/tegra/clk-pll.c b/drivers/clk/tegra/clk-pll.c
>> index c64b75185d6b..2a559408cee1 100644
>> --- a/drivers/clk/tegra/clk-pll.c
>> +++ b/drivers/clk/tegra/clk-pll.c
>> @@ -621,6 +621,26 @@ static void _update_pll_cpcon(struct tegra_clk_pll *pll,
>>         pll_writel_misc(val, pll);
>>  }
>>
>> +static void pll_clk_start_ss(struct tegra_clk_pll *pll)
>> +{
>> +       if (pll->params->defaults_set && pll->params->ssc_ctrl_en_mask) {
> 
> defaults_set looks like it's introduced later (patch 16/20). Can you
> remove references to that, or reorder the patches if that makes more
> sense?
> 

I'll reorder this after set_defaults is added.

-rhyland

-- 
nvpublic
