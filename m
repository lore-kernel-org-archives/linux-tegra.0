From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v5 12/19] ASoC: tegra: Add initial parent configuration
 for audio mclk
Date: Fri, 27 Dec 2019 17:56:06 +0300
Message-ID: <856d8a92-0c24-6722-952c-06b86c706e97@gmail.com>
References: <1576880825-15010-1-git-send-email-skomatineni@nvidia.com>
 <1576880825-15010-13-git-send-email-skomatineni@nvidia.com>
 <a6567ff1-7bc2-3ca5-1200-92a63eb44ddb@gmail.com>
 <20191225175736.GC27497@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191225175736.GC27497@sirena.org.uk>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: Sowjanya Komatineni <skomatineni@nvidia.com>, thierry.reding@gmail.com, jonathanh@nvidia.com, lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, mperttunen@nvidia.com, gregkh@linuxfoundation.org, sboyd@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, pdeschrijver@nvidia.com, pgaikwad@nvidia.com, spujar@nvidia.com, josephl@nvidia.com, daniel.lezcano@linaro.org, mmaddireddy@nvidia.com, markz@nvidia.com, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

25.12.2019 20:57, Mark Brown пишет:
> On Mon, Dec 23, 2019 at 12:14:34AM +0300, Dmitry Osipenko wrote:
>> 21.12.2019 01:26, Sowjanya Komatineni пишет:
>>> Tegra PMC clock clk_out_1 is dedicated for audio mclk from Tegra30
>>> through Tegra210 and currently Tegra clock driver does initial parent
>>> configuration for audio mclk "clk_out_1" and enables them by default.
> 
> Please delete unneeded context from mails when replying.  Doing this
> makes it much easier to find your reply in the message, helping ensure
> it won't be missed by people scrolling through the irrelevant quoted
> material.

Ok

>>> -	clk_disable_unprepare(data->clk_cdev1);
>>> -	clk_disable_unprepare(data->clk_pll_a_out0);
>>> -	clk_disable_unprepare(data->clk_pll_a);
>>> +	if (__clk_is_enabled(data->clk_cdev1))
>>> +		clk_disable_unprepare(data->clk_cdev1);
> 
>> The root of the problem is that you removed clocks enabling from
>> tegra_asoc_utils_init().
> 
>> I'm not sure why clocks should be disabled during the rate-changing,
>> probably this action is not really needed.
> 
> I know nothing about this particular device but this is not that
> unusual a restriction for audio hardware, you often can't
> robustly reconfigure the clocking for a device while it's active
> due to issues in the hardware.  You often see issues with FIFOs
> glitching or state machines getting stuck.  This may not be an
> issue here but if it's something that's documented as a
> requirement it's probably good to pay attention.

I don't know details about that hardware either, maybe it is simply not
safe to change PLL_A rate dynamically and then CLK_SET_RATE_GATE could
be used.

If nobody knows for sure, then will be better to keep
tegra_asoc_utils_set_rate() unchanged.
