From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v1] clk: tegra20/30: Add custom EMC clock implementation
Date: Fri, 12 Apr 2019 13:25:15 +0300
Message-ID: <783553d2-15d0-5c59-3fef-59e2a8aba4ed@gmail.com>
References: <20190411224708.29103-1-digetx@gmail.com>
 <20190412074658.GF12975@pdeschrijver-desktop.Nvidia.com>
 <683b978a-8c7c-0593-755b-90975907e7ff@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <683b978a-8c7c-0593-755b-90975907e7ff@gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Peter De Schrijver <pdeschrijver@nvidia.com>
Cc: Prashant Gaikwad <pgaikwad@nvidia.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Joseph Lo <josephl@nvidia.com>, linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

12.04.2019 13:09, Dmitry Osipenko пишет:
> 12.04.2019 10:46, Peter De Schrijver пишет:
>> On Fri, Apr 12, 2019 at 01:47:08AM +0300, Dmitry Osipenko wrote:
>>> A proper External Memory Controller clock rounding and parent selection
>>> functionality is required by the EMC drivers. It is not available using
>>> the generic clock implementation, hence add a custom one. The clock rate
>>> rounding shall be done by the EMC drivers because they have information
>>> about available memory timings, so the drivers will have to register a
>>> callback that will round the requested rate. EMC clock users won't be able
>>> to request EMC clock by getting -EPROBE_DEFER until EMC driver is probed
>>> and the callback is set up. The functionality is somewhat similar to the
>>> clk-emc.c which serves Tegra124+ SoC's, the later HW generations support
>>> more parent clock sources and the HW configuration and integration with
>>> the EMC drivers differs a tad from the older gens, hence it's not really
>>> worth to try to squash everything into a single source file.
>>>
>> ..
>>
>>> +	val = readl_relaxed(emc->ioaddr);
>>> +	val &= ~CLK_SOURCE_EMC_2X_CLK_DIVISOR_MASK;
>>> +	val |= div;
>>> +
>>> +	parent = val >> CLK_SOURCE_EMC_2X_CLK_SRC_SHIFT;
>>> +
>>> +	if (parent == EMC_SRC_PLL_M && div == 0 && emc->want_low_jitter)
>>> +		val |= USE_PLLM_UD;
>>> +	else
>>> +		val &= ~USE_PLLM_UD;
>>> +
>>
>> Note that low jitter means the divider is bypassed, so you can only use
>> this when div == 1.
>>
>>> +	writel_relaxed(val, emc->ioaddr);
>>> +
>>> +	return 0;
>>> +}
>>> +
>>> +static int emc_set_rate_and_parent(struct clk_hw *hw,
>>> +				   unsigned long rate,
>>> +				   unsigned long parent_rate,
>>> +				   u8 index)
>>> +{
>>> +	struct tegra_clk_emc *emc = to_tegra_clk_emc(hw);
>>> +	u32 val, div;
>>> +
>>> +	div = div_frac_get(rate, parent_rate, 8, 1, 0);
>>> +
>>> +	val = readl_relaxed(emc->ioaddr);
>>> +
>>> +	val &= ~CLK_SOURCE_EMC_2X_CLK_SRC_MASK;
>>> +	val |= index << CLK_SOURCE_EMC_2X_CLK_SRC_SHIFT;
>>> +
>>> +	val &= ~CLK_SOURCE_EMC_2X_CLK_DIVISOR_MASK;
>>> +	val |= div;
>>> +
>>> +	if (index == EMC_SRC_PLL_M && div == 0 && emc->want_low_jitter)
>>> +		val |= USE_PLLM_UD;
>>> +	else
>>> +		val &= ~USE_PLLM_UD;
>>> +
>>
>> Same here ofcourse.
> 
> Please note that hw_div = div + 1.0, hence writing div=0 means that HW divider is disabled and thus can be bypassed to get a low jitter clock. Also please note that div_frac_get() returns the "hw_div" value. Tegra30 doesn't work well if low jitter isn't enabled for the high clock rate (hangs after couple seconds) and Tegra20 is the opposite. Everything should be fine and it is working well, I don't see any problem.
> 

Oh, div_frac_get() returns the "div" value of course.
