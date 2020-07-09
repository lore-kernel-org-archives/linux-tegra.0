From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v3] clk: tegra: pll: Improve PLLM enable-state detection
Date: Thu, 9 Jul 2020 13:14:54 +0300
Message-ID: <54a4cc53-9afe-60a3-d353-2d019a6c08a0@gmail.com>
References: <20200708075418.25295-1-digetx@gmail.com>
 <3755bfe4-c7db-f9ac-0a02-b59b5dee401d@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <3755bfe4-c7db-f9ac-0a02-b59b5dee401d@nvidia.com>
Content-Language: en-US
Sender: linux-clk-owner@vger.kernel.org
To: Jon Hunter <jonathanh@nvidia.com>, Thierry Reding <thierry.reding@gmail.com>, Peter De Schrijver <pdeschrijver@nvidia.com>, Prashant Gaikwad <pgaikwad@nvidia.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>
Cc: linux-tegra@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

09.07.2020 12:49, Jon Hunter пишет:
> 
> On 08/07/2020 08:54, Dmitry Osipenko wrote:
>> Power Management Controller (PMC) can override the PLLM clock settings,
>> including the enable-state. Although PMC could only act as a second level
>> gate, meaning that PLLM needs to be enabled by the Clock and Reset
>> Controller (CaR) anyways if we want it to be enabled. Hence, when PLLM is
>> overridden by PMC, it needs to be enabled by CaR and ungated by PMC in
>> order to be functional. Please note that this patch doesn't fix any known
>> problem, and thus, it's merely a minor improvement.
>>
>> Link: https://lore.kernel.org/linux-arm-kernel/20191210120909.GA2703785@ulmo/T/
>> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
>> ---
>>
>> Changelog:
>>
>> v3: - Dropped unintended code change that was accidentally added to v2.
>>
>> v2: - Added clarifying comment to the code.
>>
>>     - Prettified the code.
>>
>>  drivers/clk/tegra/clk-pll.c | 20 +++++++++++++++-----
>>  1 file changed, 15 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/clk/tegra/clk-pll.c b/drivers/clk/tegra/clk-pll.c
>> index b2d39a66f0fa..37cfcd6836c9 100644
>> --- a/drivers/clk/tegra/clk-pll.c
>> +++ b/drivers/clk/tegra/clk-pll.c
>> @@ -327,16 +327,26 @@ int tegra_pll_wait_for_lock(struct tegra_clk_pll *pll)
>>  	return clk_pll_wait_for_lock(pll);
>>  }
>>  
>> +static bool pllm_pmc_clk_enabled(struct tegra_clk_pll *pll)
>> +{
>> +	u32 val = readl_relaxed(pll->pmc + PMC_PLLP_WB0_OVERRIDE);
>> +
>> +	return !(val & PMC_PLLP_WB0_OVERRIDE_PLLM_OVERRIDE) ||
>> +		(val & PMC_PLLP_WB0_OVERRIDE_PLLM_ENABLE);
>> +}
>> +
> 
> 
> I am not sure that the name of the above function really reflects what
> it is doing. If it was enabled, isn't it the AND of these bits?
> 
> Futhermore, what we really want to know is if the override is enabled,
> but the PMC PLLM enable is not set. In other words, the PMC is gating
> the clock. So maybe we should have a function that is called something
> like pllm_clk_is_gated_by_pmc().

Yeah, the name indeed could be improved + the logic could be inverted in
order to make it all more clear. Thank you for the suggestion! I'll
prepare the v4.
