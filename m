From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v1 1/4] clk: tegra20: Add DEV1/DEV2 OSC dividers
Date: Fri, 27 Apr 2018 15:54:44 +0300
Message-ID: <a8fc30b9-42ce-b29a-abc6-2867ebf4a9ac@gmail.com>
References: <20180426235818.10018-1-digetx@gmail.com>
 <20180426235818.10018-2-digetx@gmail.com>
 <1524832404.6979.9.camel@ziswiler.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1524832404.6979.9.camel@ziswiler.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Marcel Ziswiler <marcel@ziswiler.com>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Peter De Schrijver <pdeschrijver@nvidia.com>, Prashant Gaikwad <pgaikwad@nvidia.com>, Stephen Boyd <sboyd@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Linus Walleij <linus.walleij@linaro.org>, Marc Dietrich <marvin24@gmx.de>
Cc: linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Hi Marcel,

On 27.04.2018 15:33,  Ziswiler wrote:
> Hi Dmitry
> 
> Isn't the CLK_RST_CONTROLLER_MISC_CLK_ENB_0 the other way around e.g.
> DEV1_OSC_DIV_SEL at bit 23:22 and DEV2_OSC_DIV_SEL at 21:20?
> 
> On Fri, 2018-04-27 at 02:58 +0300, Dmitry Osipenko wrote:
>> CDEV1/CDEV2 clocks could have corresponding oscillator clock divider
>> as
>> a parent. Add these dividers in order to be able to provide that
>> parent
>> option.
>>
>> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
>> ---
>>  drivers/clk/tegra/clk-tegra20.c | 12 ++++++++++++
>>  1 file changed, 12 insertions(+)
>>
>> diff --git a/drivers/clk/tegra/clk-tegra20.c b/drivers/clk/tegra/clk-
>> tegra20.c
>> index 0ee56dd04cec..16cf4108f2ff 100644
>> --- a/drivers/clk/tegra/clk-tegra20.c
>> +++ b/drivers/clk/tegra/clk-tegra20.c
>> @@ -26,6 +26,8 @@
>>  #include "clk.h"
>>  #include "clk-id.h"
>>  
>> +#define MISC_CLK_ENB 0x48
>> +
>>  #define OSC_CTRL 0x50
>>  #define OSC_CTRL_OSC_FREQ_MASK (3<<30)
>>  #define OSC_CTRL_OSC_FREQ_13MHZ (0<<30)
>> @@ -831,6 +833,16 @@ static void __init tegra20_periph_clk_init(void)
>>  				    periph_clk_enb_refcnt);
>>  	clks[TEGRA20_CLK_PEX] = clk;
>>  
>> +	/* cdev1 OSC divider */
>> +	clk_register_divider(NULL, "cdev1_osc_div", "clk_m",
>> +			     0, clk_base + MISC_CLK_ENB, 20, 2,
> 
> So it would be:
> 
> +			     0, clk_base + MISC_CLK_ENB, 22, 2,
> 
>> +			     CLK_DIVIDER_POWER_OF_TWO, NULL);
>> +
>> +	/* cdev2 OSC divider */
>> +	clk_register_divider(NULL, "cdev2_osc_div", "clk_m",
>> +			     0, clk_base + MISC_CLK_ENB, 22, 2,
> 
> And:
> 
> +			     0, clk_base + MISC_CLK_ENB, 20, 2,
> 
>> +			     CLK_DIVIDER_POWER_OF_TWO, NULL);
>> +
>>  	/* cdev1 */
>>  	clk = clk_register_fixed_rate(NULL, "cdev1_fixed", NULL, 0,
>> 26000000);
>>  	clk = tegra_clk_register_periph_gate("cdev1", "cdev1_fixed",
>> 0,
Indeed, good catch! I'll wait for more comments and then re-spin patchset with
the fix. Thank you.
