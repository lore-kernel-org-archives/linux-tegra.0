From: Sowjanya Komatineni <skomatineni@nvidia.com>
Subject: Re: [PATCH V2 03/12] clk: tegra: save and restore PLLs state for
 system
Date: Fri, 31 May 2019 12:52:44 -0700
Message-ID: <f5fd9068-134a-3343-9cca-94db67cd748f@nvidia.com>
References: <1559084936-4610-1-git-send-email-skomatineni@nvidia.com>
 <1559084936-4610-4-git-send-email-skomatineni@nvidia.com>
 <20190529232810.14A5224366@mail.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190529232810.14A5224366@mail.kernel.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Boyd <sboyd@kernel.org>, jason@lakedaemon.net, jonathanh@nvidia.com, linus.walleij@linaro.org, marc.zyngier@arm.com, mark.rutland@arm.com, stefan@agner.ch, tglx@linutronix.de, thierry.reding@gmail.com
Cc: pdeschrijver@nvidia.com, pgaikwad@nvidia.com, linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, jckuo@nvidia.com, josephl@nvidia.com, talho@nvidia.com, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, mperttunen@nvidia.com, spatra@nvidia.com, robh+dt@kernel.org, devicetree@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


On 5/29/19 4:28 PM, Stephen Boyd wrote:
> Quoting Sowjanya Komatineni (2019-05-28 16:08:47)
>> This patch has implementation of saving and restoring PLL's state to
>> support system suspend and resume operations.
> Can you provide some more background on _why_ this patch should exist?
> That's typically what gets written in the commit text.
Will add more in next version of this series.
>> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
>> ---
>>   drivers/clk/tegra/clk-divider.c | 19 ++++++++
>>   drivers/clk/tegra/clk-pll-out.c | 25 +++++++++++
>>   drivers/clk/tegra/clk-pll.c     | 99 ++++++++++++++++++++++++++++++++---------
>>   drivers/clk/tegra/clk.h         |  9 ++++
>>   4 files changed, 132 insertions(+), 20 deletions(-)
>>
>> diff --git a/drivers/clk/tegra/clk-divider.c b/drivers/clk/tegra/clk-divider.c
>> index 2a1822a22740..718694727042 100644
>> --- a/drivers/clk/tegra/clk-divider.c
>> +++ b/drivers/clk/tegra/clk-divider.c
>> @@ -14,6 +14,7 @@
>>    * along with this program.  If not, see <http://www.gnu.org/licenses/>.
>>    */
>>   
>> +#include <linux/clk.h>
>>   #include <linux/kernel.h>
>>   #include <linux/io.h>
>>   #include <linux/err.h>
>> @@ -179,3 +180,21 @@ struct clk *tegra_clk_register_mc(const char *name, const char *parent_name,
>>                                            reg, 16, 1, CLK_DIVIDER_READ_ONLY,
>>                                            mc_div_table, lock);
>>   }
>> +
>> +#if defined(CONFIG_PM_SLEEP)
>> +void tegra_clk_divider_resume(struct clk_hw *hw, unsigned long rate)
>> +{
>> +       struct clk_hw *parent = clk_hw_get_parent(hw);
>> +       unsigned long parent_rate;
>> +
>> +       if (IS_ERR(parent)) {
> Will this ever happen? Collapse the WARN_ON into the if please:
>
> 	if (WARN_ON(IS_ERR(parent)))
>
Will fix in next version of this series.
>> +               WARN_ON(1);
>> +               return;
>> +       }
>> +
>> +       parent_rate = clk_hw_get_rate(parent);
>> +
>> +       if (clk_frac_div_set_rate(hw, rate, parent_rate) < 0)
>> +               WARN_ON(1);
>> +}
>> +#endif
>> diff --git a/drivers/clk/tegra/clk.h b/drivers/clk/tegra/clk.h
>> index 09bccbb9640c..e4d124cc5657 100644
>> --- a/drivers/clk/tegra/clk.h
>> +++ b/drivers/clk/tegra/clk.h
>> @@ -841,6 +841,15 @@ int tegra_pll_p_div_to_hw(struct tegra_clk_pll *pll, u8 p_div);
>>   int div_frac_get(unsigned long rate, unsigned parent_rate, u8 width,
>>                   u8 frac_width, u8 flags);
>>   
>> +#ifdef CONFIG_PM_SLEEP
> Can you remove this ifdef? It just complicates compilation testing.
OK, Will fix in next version
>> +void tegra_clk_pll_resume(struct clk *c, unsigned long rate);
>> +void tegra_clk_divider_resume(struct clk_hw *hw, unsigned long rate);
>> +void tegra_clk_pll_out_resume(struct clk *clk, unsigned long rate);
>> +void tegra_clk_plle_tegra210_resume(struct clk *c);
>> +void tegra_clk_sync_state_pll(struct clk *c);
>> +void tegra_clk_sync_state_pll_out(struct clk *clk);
> Do these APIs need to operate on struct clk? Why can't they operate on
> clk_hw or why can't we drive the suspend/resume sequence from the clk
> provider driver itself?
>
Yes can change to use clk_hw.

By clk provider driver, are you referring to clk-tegra210?

clk-terga210 driver has suspend/resume implementation. These API's are 
for corresponding clock specific implementations (clk-pll, clk-pll-out, 
clk-divider) for enabling and restoring to proper rate and are invoked 
during clk-tegra210 driver resume.

thanks

Sowjanya
