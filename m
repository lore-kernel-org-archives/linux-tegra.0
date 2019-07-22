From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH V6 14/21] clk: tegra210: Add suspend and resume support
Date: Mon, 22 Jul 2019 10:09:08 +0300
Message-ID: <5054f178-db27-9286-d123-3e2b2a885717@gmail.com>
References: <1563738060-30213-1-git-send-email-skomatineni@nvidia.com>
 <1563738060-30213-15-git-send-email-skomatineni@nvidia.com>
 <e683b417-66fb-38dc-c16b-dab616583a88@gmail.com>
 <88da46d2-b90d-f57e-7611-b8653b56bdf6@nvidia.com>
 <ceedb802-7561-488f-3a89-67bee19f2fea@gmail.com>
 <e2d0e8cc-b4ea-1148-4af1-fee6bb266cca@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <e2d0e8cc-b4ea-1148-4af1-fee6bb266cca@nvidia.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Sowjanya Komatineni <skomatineni@nvidia.com>, thierry.reding@gmail.com, jonathanh@nvidia.com, tglx@linutronix.de, jason@lakedaemon.net, marc.zyngier@arm.com, linus.walleij@linaro.org, stefan@agner.ch, mark.rutland@arm.com
Cc: pdeschrijver@nvidia.com, pgaikwad@nvidia.com, sboyd@kernel.org, linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, jckuo@nvidia.com, josephl@nvidia.com, talho@nvidia.com, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, mperttunen@nvidia.com, spatra@nvidia.com, robh+dt@kernel.org, devicetree@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

22.07.2019 9:52, Sowjanya Komatineni пишет:
> 
> On 7/21/19 11:10 PM, Dmitry Osipenko wrote:
>> 22.07.2019 1:45, Sowjanya Komatineni пишет:
>>> On 7/21/19 2:38 PM, Dmitry Osipenko wrote:
>>>> 21.07.2019 22:40, Sowjanya Komatineni пишет:
>>>>> This patch adds support for clk: tegra210: suspend-resume.
>>>>>
>>>>> All the CAR controller settings are lost on suspend when core
>>>>> power goes off.
>>>>>
>>>>> This patch has implementation for saving and restoring all PLLs
>>>>> and clocks context during system suspend and resume to have the
>>>>> clocks back to same state for normal operation.
>>>>>
>>>>> Acked-by: Thierry Reding <treding@nvidia.com>
>>>>> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
>>>>> ---
>>>>>    drivers/clk/tegra/clk-tegra210.c | 68
>>>>> ++++++++++++++++++++++++++++++++++++++--
>>>>>    drivers/clk/tegra/clk.c          | 14 +++++++++
>>>>>    drivers/clk/tegra/clk.h          |  1 +
>>>>>    3 files changed, 80 insertions(+), 3 deletions(-)
>>>>>
>>>>> diff --git a/drivers/clk/tegra/clk-tegra210.c
>>>>> b/drivers/clk/tegra/clk-tegra210.c
>>>>> index 55a88c0824a5..68271873acc1 100644
>>>>> --- a/drivers/clk/tegra/clk-tegra210.c
>>>>> +++ b/drivers/clk/tegra/clk-tegra210.c
>>>>> @@ -9,6 +9,7 @@
>>>>>    #include <linux/clkdev.h>
>>>>>    #include <linux/of.h>
>>>>>    #include <linux/of_address.h>
>>>>> +#include <linux/syscore_ops.h>
>>>>>    #include <linux/delay.h>
>>>>>    #include <linux/export.h>
>>>>>    #include <linux/mutex.h>
>>>>> @@ -220,11 +221,15 @@
>>>>>    #define CLK_M_DIVISOR_SHIFT 2
>>>>>    #define CLK_M_DIVISOR_MASK 0x3
>>>>>    +#define CLK_MASK_ARM    0x44
>>>>> +#define MISC_CLK_ENB    0x48
>>>>> +
>>>>>    #define RST_DFLL_DVCO 0x2f4
>>>>>    #define DVFS_DFLL_RESET_SHIFT 0
>>>>>      #define CLK_RST_CONTROLLER_RST_DEV_Y_SET 0x2a8
>>>>>    #define CLK_RST_CONTROLLER_RST_DEV_Y_CLR 0x2ac
>>>>> +#define CPU_SOFTRST_CTRL 0x380
>>>>>      #define LVL2_CLK_GATE_OVRA 0xf8
>>>>>    #define LVL2_CLK_GATE_OVRC 0x3a0
>>>>> @@ -2825,6 +2830,7 @@ static int tegra210_enable_pllu(void)
>>>>>        struct tegra_clk_pll_freq_table *fentry;
>>>>>        struct tegra_clk_pll pllu;
>>>>>        u32 reg;
>>>>> +    int ret;
>>>>>          for (fentry = pll_u_freq_table; fentry->input_rate;
>>>>> fentry++) {
>>>>>            if (fentry->input_rate == pll_ref_freq)
>>>>> @@ -2853,9 +2859,8 @@ static int tegra210_enable_pllu(void)
>>>>>        reg |= PLL_ENABLE;
>>>>>        writel(reg, clk_base + PLLU_BASE);
>>>>>    -    readl_relaxed_poll_timeout_atomic(clk_base + PLLU_BASE, reg,
>>>>> -                      reg & PLL_BASE_LOCK, 2, 1000);
>>>>> -    if (!(reg & PLL_BASE_LOCK)) {
>>>>> +    ret = tegra210_wait_for_mask(&pllu, PLLU_BASE, PLL_BASE_LOCK);
>>>>> +    if (ret) {
>>>> Why this is needed? Was there a bug?
>>>>
>>> during resume pllu init is needed and to use same terga210_init_pllu,
>>> poll_timeout_atomic can't be used as its ony for atomic context.
>>>
>>> So changed to use wait_for_mask which should work in both cases.
>> Atomic variant could be used from any context, not sure what do you
>> mean. The 'atomic' part only means that function won't cause scheduling
>> and that's it.
> 
> Sorry, replied incorrect. readx_poll_timeout_atomic uses ktime_get() and
> during resume timekeeping suspend/resume happens later than clock
> suspend/resume. So using tegra210_wait_for_mask.
> 
> both timekeeping and clk-tegra210 drivers are registered as syscore but
> not ordered.

Okay, thank you for the clarification.

[snip]
