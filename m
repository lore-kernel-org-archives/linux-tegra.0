From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v1 04/17] soc: tegra: Add Tegra PMC clock registrations
 into PMC driver
Date: Wed, 20 Nov 2019 20:46:02 +0300
Message-ID: <a87a08c1-5104-a534-89c4-73463c08abba@gmail.com>
References: <1574146234-3871-1-git-send-email-skomatineni@nvidia.com>
 <1574146234-3871-5-git-send-email-skomatineni@nvidia.com>
 <d072bd37-9628-4eb2-1706-a1f640606b8d@gmail.com>
 <d76f4689-5986-9239-9c67-9dd125f6547e@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <d76f4689-5986-9239-9c67-9dd125f6547e@nvidia.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Sowjanya Komatineni <skomatineni@nvidia.com>, thierry.reding@gmail.com, jonathanh@nvidia.com, mperttunen@nvidia.com, gregkh@linuxfoundation.org, sboyd@kernel.org, tglx@linutronix.de, robh+dt@kernel.org, mark.rutland@arm.com
Cc: allison@lohutok.net, pdeschrijver@nvidia.com, pgaikwad@nvidia.com, mturquette@baylibre.com, horms+renesas@verge.net.au, Jisheng.Zhang@synaptics.com, krzk@kernel.org, arnd@arndb.de, spujar@nvidia.com, josephl@nvidia.com, vidyas@nvidia.com, daniel.lezcano@linaro.org, mmaddireddy@nvidia.com, markz@nvidia.com, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

19.11.2019 23:08, Sowjanya Komatineni пишет:
> 
> On 11/19/19 11:33 AM, Dmitry Osipenko wrote:
>> 19.11.2019 09:50, Sowjanya Komatineni пишет:
>>> Tegra PMC has clk_out_1, clk_out_2, clk_out_3 with mux and gate for
>>> each of these clocks.
>>>
>>> Currently these PMC clocks are registered by Tegra clock driver using
>>> clk_register_mux and clk_register_gate by passing PMC base address
>>> and register offsets and PMC programming for these clocks happens
>>> through direct PMC access by the clock driver.
>>>
>>> With this, when PMC is in secure mode any direct PMC access from the
>>> non-secure world does not go through and these clocks will not be
>>> functional.
>>>
>>> This patch adds these clocks registration with PMC as a clock provider
>>> for these clocks. clk_ops callback implementations for these clocks
>>> uses tegra_pmc_readl and tegra_pmc_writel which supports PMC programming
>>> in secure mode and non-secure mode.
>>>
>>> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
>>> ---
>>>   drivers/soc/tegra/pmc.c | 330
>>> ++++++++++++++++++++++++++++++++++++++++++++++++
>>>   1 file changed, 330 insertions(+)
>>>
>>> diff --git a/drivers/soc/tegra/pmc.c b/drivers/soc/tegra/pmc.c
>>> index 7a5aab0b993b..790a6619ba32 100644
>>> --- a/drivers/soc/tegra/pmc.c
>>> +++ b/drivers/soc/tegra/pmc.c
>>> @@ -13,6 +13,9 @@
>>>     #include <linux/arm-smccc.h>
>>>   #include <linux/clk.h>
>>> +#include <linux/clk-provider.h>
>>> +#include <linux/clkdev.h>
>>> +#include <linux/clk/clk-conf.h>
>>>   #include <linux/clk/tegra.h>
>>>   #include <linux/debugfs.h>
>>>   #include <linux/delay.h>
>>> @@ -48,6 +51,7 @@
>>>   #include <dt-bindings/pinctrl/pinctrl-tegra-io-pad.h>
>>>   #include <dt-bindings/gpio/tegra186-gpio.h>
>>>   #include <dt-bindings/gpio/tegra194-gpio.h>
>>> +#include <dt-bindings/soc/tegra-pmc.h>
>>>     #define PMC_CNTRL            0x0
>>>   #define  PMC_CNTRL_INTR_POLARITY    BIT(17) /* inverts INTR
>>> polarity */
>>> @@ -108,6 +112,7 @@
>>>   #define PMC_WAKE2_STATUS        0x168
>>>   #define PMC_SW_WAKE2_STATUS        0x16c
>>>   +#define PMC_CLK_OUT_CNTRL        0x1a8
>>>   #define PMC_SATA_PWRGT            0x1ac
>>>   #define PMC_SATA_PWRGT_PLLE_IDDQ_VALUE BIT(5)
>>>   #define PMC_SATA_PWRGT_PLLE_IDDQ_SWCTL BIT(4)
>>> @@ -170,6 +175,78 @@
>>>   #define  TEGRA_SMC_PMC_READ    0xaa
>>>   #define  TEGRA_SMC_PMC_WRITE    0xbb
>>>   +struct pmc_clk_mux {
>>> +    struct clk_hw    hw;
>>> +    unsigned long    offs;
>>> +    u32        mask;
>>> +    u32        shift;
>>> +    /* register lock */
>>> +    spinlock_t    *lock;
>>> +};
>>> +
>>> +#define to_pmc_clk_mux(_hw) container_of(_hw, struct pmc_clk_mux, hw)
>>> +
>>> +struct pmc_clk_gate {
>>> +    struct clk_hw    hw;
>>> +    unsigned long    offs;
>>> +    u32        shift;
>>> +    /* register lock */
>>> +    spinlock_t    *lock;

Why clk_out_lock is needed at all? CCLK framework already takes care of
the clock's locking and then nothing else in PMC code uses that lock to
avoid races, thus that spinlock doesn't do anything useful and should be
removed from both mux and gate.

>>> +};
>>> +
>>> +#define to_pmc_clk_gate(_hw) container_of(_hw, struct pmc_clk_gate, hw)
>>> +
>>> +struct pmc_clk_init_data {
>>> +    char *mux_name;
>>> +    char *gate_name;
>>> +    const char **parents;
>>> +    int num_parents;
>>> +    int mux_id;
>>> +    int gate_id;
>>> +    char *dev_name;
>>> +    u8 mux_shift;
>>> +    u8 gate_shift;
>>> +    u8 init_parent;
>>> +    int init_state;
>>> +    struct pmc_clk_mux mux;
>>> +    struct pmc_clk_gate gate;
>>> +};
>>> +
>>> +#define PMC_CLK(_num, _mux_shift, _gate_shift, _init_parent,
>>> _init_state)\
>>> +    {\
>>> +        .mux_name = "clk_out_" #_num "_mux",\
>>> +        .gate_name = "clk_out_" #_num,\
>>> +        .parents = clk_out ##_num ##_parents,\
>>> +        .num_parents = ARRAY_SIZE(clk_out ##_num ##_parents),\
>>> +        .mux_id = TEGRA_PMC_CLK_OUT_ ##_num ##_MUX,\
>>> +        .gate_id = TEGRA_PMC_CLK_OUT_ ##_num,\
>>> +        .dev_name = "extern" #_num,\
>>> +        .mux_shift = _mux_shift,\
>>> +        .gate_shift = _gate_shift,\
>>> +        .init_parent = _init_parent,\
>>> +        .init_state = _init_state,\
>>> +    }
>>> +
>>> +static DEFINE_SPINLOCK(clk_out_lock);
>>> +
>>> +static const char *clk_out1_parents[] = { "clk_m", "clk_m_div2",
>>> +    "clk_m_div4", "extern1",
>>> +};
>>> +
>>> +static const char *clk_out2_parents[] = { "clk_m", "clk_m_div2",
>>> +    "clk_m_div4", "extern2",
>>> +};
>>> +
>>> +static const char *clk_out3_parents[] = { "clk_m", "clk_m_div2",
>>> +    "clk_m_div4", "extern3",
>>> +};
>> Why these are unused?
> They are used in PMC_CLK macro

Looks like it will better to define those three structs directly,
without the PMC_CLK macro.

[snip]
