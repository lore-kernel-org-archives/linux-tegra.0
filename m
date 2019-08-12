From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v8 14/21] clk: tegra210: Add suspend and resume support
Date: Mon, 12 Aug 2019 23:28:15 +0300
Message-ID: <232688c1-d47b-771d-a768-07e722488fa8@gmail.com>
References: <1565308020-31952-1-git-send-email-skomatineni@nvidia.com>
 <1565308020-31952-15-git-send-email-skomatineni@nvidia.com>
 <a21b7464-62c3-8461-04c2-a0e863bdde85@gmail.com>
 <7d101ec9-c559-8b40-1764-6bf67a9c7a7a@nvidia.com>
 <aa823801-00c7-df88-0f63-45338bffa854@gmail.com>
 <cbe94f84-a17b-7e1a-811d-89db571784e1@nvidia.com>
 <4397de5d-772d-2b04-5f87-b2988f6c96c8@gmail.com>
 <805a825e-f19d-d056-83eb-8ed1cb1c089c@nvidia.com>
 <ca90bd2b-8088-8b46-2816-95e58a4811b8@gmail.com>
 <931b027d-fdf3-220b-167a-4177fa917781@nvidia.com>
 <1779e92b-fa4d-68ab-9218-51970eee1ec5@gmail.com>
 <cd685e84-c0de-6142-597e-f7c77604350e@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cd685e84-c0de-6142-597e-f7c77604350e@nvidia.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Sowjanya Komatineni <skomatineni@nvidia.com>
Cc: thierry.reding@gmail.com, jonathanh@nvidia.com, tglx@linutronix.de, jason@lakedaemon.net, marc.zyngier@arm.com, linus.walleij@linaro.org, stefan@agner.ch, mark.rutland@arm.com, pdeschrijver@nvidia.com, pgaikwad@nvidia.com, sboyd@kernel.org, linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, jckuo@nvidia.com, josephl@nvidia.com, talho@nvidia.com, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, mperttunen@nvidia.com, spatra@nvidia.com, robh+dt@kernel.org, devicetree@vger.kernel.org, rjw@rjwysocki.net, viresh.kumar@linaro.org, linux-pm@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

12.08.2019 22:03, Sowjanya Komatineni пишет:
> 
> On 8/12/19 11:19 AM, Dmitry Osipenko wrote:
>> 12.08.2019 20:28, Sowjanya Komatineni пишет:
>>> On 8/12/19 9:25 AM, Dmitry Osipenko wrote:
>>>> 11.08.2019 22:15, Sowjanya Komatineni пишет:
>>>>> On 8/11/19 10:39 AM, Dmitry Osipenko wrote:
>>>>>> 09.08.2019 21:40, Sowjanya Komatineni пишет:
>>>>>>> On 8/9/19 11:18 AM, Dmitry Osipenko wrote:
>>>>>>>> 09.08.2019 19:19, Sowjanya Komatineni пишет:
>>>>>>>>> On 8/9/19 6:56 AM, Dmitry Osipenko wrote:
>>>>>>>>>> 09.08.2019 2:46, Sowjanya Komatineni пишет:
>>>>>>>>>>> This patch adds support for clk: tegra210: suspend-resume.
>>>>>>>>>>>
>>>>>>>>>>> All the CAR controller settings are lost on suspend when core
>>>>>>>>>>> power goes off.
>>>>>>>>>>>
>>>>>>>>>>> This patch has implementation for saving and restoring all PLLs
>>>>>>>>>>> and clocks context during system suspend and resume to have the
>>>>>>>>>>> clocks back to same state for normal operation.
>>>>>>>>>>>
>>>>>>>>>>> Clock driver suspend and resume are registered as syscore_ops as clocks
>>>>>>>>>>> restore need to happen before the other drivers resume to have all their
>>>>>>>>>>> clocks back to the same state as before suspend.
>>>>>>>>>>>
>>>>>>>>>>> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
>>>>>>>>>>> ---
>>>>>>>>>>>      drivers/clk/tegra/clk-tegra210.c | 103 +++++++++++++++++++++++++++++++++++++--
>>>>>>>>>>>      drivers/clk/tegra/clk.c          |  64 ++++++++++++++++++++++++
>>>>>>>>>>>      drivers/clk/tegra/clk.h          |   3 ++
>>>>>>>>>>>      3 files changed, 166 insertions(+), 4 deletions(-)
>>>>>>>>>>>
>>>>>>>>>>> diff --git a/drivers/clk/tegra/clk-tegra210.c b/drivers/clk/tegra/clk-tegra210.c
>>>>>>>>>>> index 998bf60b219a..8dd6f4f4debb 100644
>>>>>>>>>>> --- a/drivers/clk/tegra/clk-tegra210.c
>>>>>>>>>>> +++ b/drivers/clk/tegra/clk-tegra210.c
>>>>>>>>>>> @@ -9,13 +9,13 @@
>>>>>>>>>>>      #include <linux/clkdev.h>
>>>>>>>>>>>      #include <linux/of.h>
>>>>>>>>>>>      #include <linux/of_address.h>
>>>>>>>>>>> +#include <linux/syscore_ops.h>
>>>>>>>>>>>      #include <linux/delay.h>
>>>>>>>>>>>      #include <linux/export.h>
>>>>>>>>>>>      #include <linux/mutex.h>
>>>>>>>>>>>      #include <linux/clk/tegra.h>
>>>>>>>>>>>      #include <dt-bindings/clock/tegra210-car.h>
>>>>>>>>>>>      #include <dt-bindings/reset/tegra210-car.h>
>>>>>>>>>>> -#include <linux/iopoll.h>
>>>>>>>>>>>      #include <linux/sizes.h>
>>>>>>>>>>>      #include <soc/tegra/pmc.h>
>>>>>>>>>>>      @@ -220,11 +220,15 @@
>>>>>>>>>>>      #define CLK_M_DIVISOR_SHIFT 2
>>>>>>>>>>>      #define CLK_M_DIVISOR_MASK 0x3
>>>>>>>>>>>      +#define CLK_MASK_ARM    0x44
>>>>>>>>>>> +#define MISC_CLK_ENB    0x48
>>>>>>>>>>> +
>>>>>>>>>>>      #define RST_DFLL_DVCO 0x2f4
>>>>>>>>>>>      #define DVFS_DFLL_RESET_SHIFT 0
>>>>>>>>>>>        #define CLK_RST_CONTROLLER_RST_DEV_Y_SET 0x2a8
>>>>>>>>>>>      #define CLK_RST_CONTROLLER_RST_DEV_Y_CLR 0x2ac
>>>>>>>>>>> +#define CPU_SOFTRST_CTRL 0x380
>>>>>>>>>>>        #define LVL2_CLK_GATE_OVRA 0xf8
>>>>>>>>>>>      #define LVL2_CLK_GATE_OVRC 0x3a0
>>>>>>>>>>> @@ -2825,6 +2829,7 @@ static int tegra210_enable_pllu(void)
>>>>>>>>>>>          struct tegra_clk_pll_freq_table *fentry;
>>>>>>>>>>>          struct tegra_clk_pll pllu;
>>>>>>>>>>>          u32 reg;
>>>>>>>>>>> +    int ret;
>>>>>>>>>>>            for (fentry = pll_u_freq_table; fentry->input_rate; fentry++) {
>>>>>>>>>>>              if (fentry->input_rate == pll_ref_freq)
>>>>>>>>>>> @@ -2853,9 +2858,14 @@ static int tegra210_enable_pllu(void)
>>>>>>>>>>>          reg |= PLL_ENABLE;
>>>>>>>>>>>          writel(reg, clk_base + PLLU_BASE);
>>>>>>>>>>>      -    readl_relaxed_poll_timeout_atomic(clk_base + PLLU_BASE, reg,
>>>>>>>>>>> -                      reg & PLL_BASE_LOCK, 2, 1000);
>>>>>>>>>>> -    if (!(reg & PLL_BASE_LOCK)) {
>>>>>>>>>>> +    /*
>>>>>>>>>>> +     * During clocks resume, same PLLU init and enable sequence get
>>>>>>>>>>> +     * executed. So, readx_poll_timeout_atomic can't be used here as it
>>>>>>>>>>> +     * uses ktime_get() and timekeeping resume doesn't happen by that
>>>>>>>>>>> +     * time. So, using tegra210_wait_for_mask for PLL LOCK.
>>>>>>>>>>> +     */
>>>>>>>>>>> +    ret = tegra210_wait_for_mask(&pllu, PLLU_BASE, PLL_BASE_LOCK);
>>>>>>>>>>> +    if (ret) {
>>>>>>>>>>>              pr_err("Timed out waiting for PLL_U to lock\n");
>>>>>>>>>>>              return -ETIMEDOUT;
>>>>>>>>>>>          }
>>>>>>>>>>> @@ -3288,6 +3298,84 @@ static void tegra210_disable_cpu_clock(u32 cpu)
>>>>>>>>>>>      }
>>>>>>>>>>>        #ifdef CONFIG_PM_SLEEP
>>>>>>>>>>> +/*
>>>>>>>>>>> + * This array lists mask values for each peripheral clk bank
>>>>>>>>>>> + * to mask out reserved bits during the clocks state restore
>>>>>>>>>>> + * on SC7 resume to prevent accidental writes to these reserved
>>>>>>>>>>> + * bits.
>>>>>>>>>>> + */
>>>>>>>>>>> +static u32 periph_clk_rsvd_mask[TEGRA210_CAR_BANK_COUNT] = {
>>>>>>>>>> Should be more natural to have a "valid_mask" instead of "rsvd_mask".
>>>>>>>>>>
>>>>>>>>>> What's actually wrong with touching of the reserved bits? They must be NO-OP.. or the
>>>>>>>>>> reserved bits are actually some kind of "secret" bits? If those bits have some
>>>>>>>>>> use-case
>>>>>>>>>> outside of Silicon HW (like FPGA simulation), then this doesn't matter for upstream
>>>>>>>>>> and you
>>>>>>>>>> have to keep the workaround locally in the downstream kernel or whatever.
>>>>>>>>> Will rename as valid_mask.
>>>>>>>>>
>>>>>>>>> some bits in these registers are undefined and is not good to write to these bits as
>>>>>>>>> they
>>>>>>>>> can cause pslverr.
>>>>>>>> Okay, it should be explained in the comment.
>>>>>>>>
>>>>>>>> Is it possible to disable trapping of changing the undefined bits?
>>>>>>> No its internal to design
>>>>>> Okay.
>>>>>>
>>>>>> Also, what about to move the valid_mask into struct tegra_clk_periph_regs?
>>>>> No, we cannot move to tegra_clk_periph_regs as its in tegra/clk.c and is common for all
>>>>> tegra.
>>>>>
>>>>> Reserved bits are different on tegra chips so should come from Tegra chip specific clock
>>>>> driver like
>>>>>
>>>>> clk-tegra210 for Tegra210.
>>>> Could you please check whether the reserved bits are RAZ (read as zero)?
>>>>
>>>> [snip]
>>> yes all reserved bits of clk_enb register is 0. This should not be set to 1.
>>>
>>> As I will be changing to variable name to valid_mask instead of reserved mask, will also
>>> change values to valid mask so it can be used directly to write to clk_enb for enabling all
>>> peripherals clks.
>>>
>> It looks to me that the tegra_clk_periph_force_on() could be made local to the
>> clk-tegra210.c and then the raw clk_enb values could be written directly instead of having
>> the clk_enb[] array, probably that will be a bit cleaner
> 
> All CLK_OUT_ENB* registers are already defined in clk driver and also periph_regs includes
> all of these to use.
> 
> To write value to enable all clocks directly without array, it need total 7 individual
> register writes for Tegra210. Also when suspend/resume is implemented for other prior
> tegras, they need to do same in tegra clock driver.
> 
> Reason I had this in clock driver is, this can be used by all tegra clock drivers and just
> can pass valid clocks values.
> 
> But doing individual register write with direct hard code values in corresponding tegra
> clock driver is preferred still, will update so in next revision and will move all the
> CLK_OUT_ENB* register defines to tegra/clk.h
> 
> Currently RST_DEVICES & CLK_OUT_ENB are all in tegra/clk.c

Yes, it should be a bit more clear to share these defines. Also, please define the "valid"
bitmasks with something like TEGRA210_DEVICES_MASK_L.
