From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v7 06/20] clk: tegra: Support for OSC context save and
 restore
Date: Thu, 1 Aug 2019 13:53:53 +0300
Message-ID: <3b55a112-42a6-212b-beea-10b64d5341d9@gmail.com>
References: <1564532424-10449-1-git-send-email-skomatineni@nvidia.com>
 <1564532424-10449-7-git-send-email-skomatineni@nvidia.com>
 <16cca6aa-1034-f38a-49d1-d87b37fb6bbb@gmail.com>
 <b5a58bfc-c777-886f-d902-f499ec38e2ae@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <b5a58bfc-c777-886f-d902-f499ec38e2ae@nvidia.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Sowjanya Komatineni <skomatineni@nvidia.com>, thierry.reding@gmail.com, jonathanh@nvidia.com, tglx@linutronix.de, jason@lakedaemon.net, marc.zyngier@arm.com, linus.walleij@linaro.org, stefan@agner.ch, mark.rutland@arm.com
Cc: pdeschrijver@nvidia.com, pgaikwad@nvidia.com, sboyd@kernel.org, linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, jckuo@nvidia.com, josephl@nvidia.com, talho@nvidia.com, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, mperttunen@nvidia.com, spatra@nvidia.com, robh+dt@kernel.org, devicetree@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

01.08.2019 0:04, Sowjanya Komatineni пишет:
> 
> On 7/31/19 4:11 AM, Dmitry Osipenko wrote:
>> 31.07.2019 3:20, Sowjanya Komatineni пишет:
>>> This patch adds support for saving OSC clock frequency and the
>>> drive-strength during OSC clock init and creates an API to restore
>>> OSC control register value from the saved context.
>>>
>>> This API is invoked by Tegra210 clock driver during system resume
>>> to restore the  OSC clock settings.
>>>
>>> Acked-by: Thierry Reding <treding@nvidia.com>
>>> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
>>> ---
>>>   drivers/clk/tegra/clk-tegra-fixed.c | 15 +++++++++++++++
>>>   drivers/clk/tegra/clk.h             |  1 +
>>>   2 files changed, 16 insertions(+)
>>>
>>> diff --git a/drivers/clk/tegra/clk-tegra-fixed.c
>>> b/drivers/clk/tegra/clk-tegra-fixed.c
>>> index 8d91b2b191cf..7c6c8abfcde6 100644
>>> --- a/drivers/clk/tegra/clk-tegra-fixed.c
>>> +++ b/drivers/clk/tegra/clk-tegra-fixed.c
>>> @@ -17,6 +17,10 @@
>>>   #define OSC_CTRL            0x50
>>>   #define OSC_CTRL_OSC_FREQ_SHIFT        28
>>>   #define OSC_CTRL_PLL_REF_DIV_SHIFT    26
>>> +#define OSC_CTRL_MASK            (0x3f2 |    \
>>> +                    (0xf << OSC_CTRL_OSC_FREQ_SHIFT))
>>> +
>>> +static u32 osc_ctrl_ctx;
>>>     int __init tegra_osc_clk_init(void __iomem *clk_base, struct
>>> tegra_clk *clks,
>>>                     unsigned long *input_freqs, unsigned int num,
>>> @@ -29,6 +33,7 @@ int __init tegra_osc_clk_init(void __iomem
>>> *clk_base, struct tegra_clk *clks,
>>>       unsigned osc_idx;
>>>         val = readl_relaxed(clk_base + OSC_CTRL);
>>> +    osc_ctrl_ctx = val & OSC_CTRL_MASK;
>>>       osc_idx = val >> OSC_CTRL_OSC_FREQ_SHIFT;
>>>         if (osc_idx < num)
>>> @@ -96,3 +101,13 @@ void __init tegra_fixed_clk_init(struct tegra_clk
>>> *tegra_clks)
>>>           *dt_clk = clk;
>>>       }
>>>   }
>>> +
>>> +void tegra_clk_osc_resume(void __iomem *clk_base)
>>> +{
>>> +    u32 val;
>>> +
>>> +    val = readl_relaxed(clk_base + OSC_CTRL) & ~OSC_CTRL_MASK;
>>> +    val |= osc_ctrl_ctx;
>>> +    writel_relaxed(val, clk_base + OSC_CTRL);
>> Why a full raw u32 OSC_CTRL value couldn't be simply saved and restored?
> 
> Storing and restoring only required fields to avoid accidental
> misconfiguration.
> 
> OSC_CTRL register has other bits (PLL_REF_DIV) which are configured by
> BR depending on OSC_FREQ and also setting PLL_REF_DIV while PLLS are in
> use is not safe.

I'm looking at the clk-driver sources and see that none of the Tegra
drivers ever change the OSC_CTRL configuration, T30/114 even have
#defines for the OSC_CTRL that are unused.

So, this leads to a question.. does any bootloader really ever change
the OSC_CTRL such that it differs after resume from suspend in
comparison to the value at the time of kernel's booting up?
