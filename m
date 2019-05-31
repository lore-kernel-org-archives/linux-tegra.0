From: Sowjanya Komatineni <skomatineni@nvidia.com>
Subject: Re: [PATCH V2 04/12] clk: tegra: add support for peripheral clock
 suspend and resume
Date: Fri, 31 May 2019 12:55:56 -0700
Message-ID: <abd481db-9387-8e7f-e68e-9f1a3e217b51@nvidia.com>
References: <1559084936-4610-1-git-send-email-skomatineni@nvidia.com>
 <1559084936-4610-5-git-send-email-skomatineni@nvidia.com>
 <20190529233049.A7E5924371@mail.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190529233049.A7E5924371@mail.kernel.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Boyd <sboyd@kernel.org>, jason@lakedaemon.net, jonathanh@nvidia.com, linus.walleij@linaro.org, marc.zyngier@arm.com, mark.rutland@arm.com, stefan@agner.ch, tglx@linutronix.de, thierry.reding@gmail.com
Cc: pdeschrijver@nvidia.com, pgaikwad@nvidia.com, linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, jckuo@nvidia.com, josephl@nvidia.com, talho@nvidia.com, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, mperttunen@nvidia.com, spatra@nvidia.com, robh+dt@kernel.org, devicetree@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
	t=1559332560; bh=fyUgksf15TgB7D/+ZMOAO7M7CVG31MW/WSQCDBy4pVQ=;
	h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
	 User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
	 X-ClientProxiedBy:Content-Type:Content-Transfer-Encoding:
	 Content-Language;
	b=iqAjo2NdebEX6IQgtE+dZ1EoyeCEIZAqRf22p21EapkVX0OBJC3q4Gq7gRPrH2fJC
	 uhLbg6vyTpA7tw+SL/Q6OC76foZllVOZDlC8m02oSU3qttQyJX5rCD59shHR+I4y1U
	 EO5f5ynsViWBR2kJNtgRO2yTrKQCYOWgX2VSfb1c3OX347L/TSCQDDFU/bocKSDD6L
	 cjVCbddyiIHj6HtpiRzWKIezGprf40oa5Lsd7heEqGTFe2IPIuIAcrtSjmg455iUvU
	 qyKwofgEpOyXkvlW1Jy4Xm+1v3hRH1W5bgxWWMWL7BWkGQQDwHLZXwNVTA0iT/JH6L
	 nz/b3Hyar6Dwg==

On 5/29/19 4:30 PM, Stephen Boyd wrote:
> Quoting Sowjanya Komatineni (2019-05-28 16:08:48)
>> This patch implements peripheral clock context save and restore
>> to support system suspend and resume operation.
> Again, why?
Will add more in commit in next version of this series.
>> diff --git a/drivers/clk/tegra/clk.c b/drivers/clk/tegra/clk.c
>> index 6f2862eddad7..08b788766564 100644
>> --- a/drivers/clk/tegra/clk.c
>> +++ b/drivers/clk/tegra/clk.c
>> @@ -81,6 +81,10 @@ static struct clk **clks;
>>   static int clk_num;
>>   static struct clk_onecell_data clk_data;
>>   
>> +#ifdef CONFIG_PM_SLEEP
>> +static u32 *periph_ctx;
>> +#endif
> Please move this into the ifdef below.
>
WIll fix in V3
>> +
>>   /* Handlers for SoC-specific reset lines */
>>   static int (*special_reset_assert)(unsigned long);
>>   static int (*special_reset_deassert)(unsigned long);
>> @@ -210,6 +214,65 @@ const struct tegra_clk_periph_regs *get_reg_bank(int clkid)
>>          }
>>   }
>>   
>> +#ifdef CONFIG_PM_SLEEP
>> +void tegra_clk_periph_suspend(void __iomem *clk_base)
>> +{
>> +       int i, idx;
>> +
>> +       idx = 0;
>> +       for (i = 0; i < periph_banks; i++, idx++)
>> +               periph_ctx[idx] =
>> +                       readl_relaxed(clk_base + periph_regs[i].rst_reg);
>> +
>> +       for (i = 0; i < periph_banks; i++, idx++)
>> +               periph_ctx[idx] =
>> +                       readl_relaxed(clk_base + periph_regs[i].enb_reg);
>> +}
>> +
>> +void tegra_clk_periph_force_on(u32 *clks_on, int count, void __iomem *clk_base)
>> +{
>> +       int i;
>> +
>> +       WARN_ON(count != periph_banks);
>> +
>> +       for (i = 0; i < count; i++)
>> +               writel_relaxed(clks_on[i], clk_base + periph_regs[i].enb_reg);
>> +}
>> +
>> +void tegra_clk_periph_resume(void __iomem *clk_base)
>> +{
>> +       int i, idx;
>> +
>> +       idx = 0;
>> +       for (i = 0; i < periph_banks; i++, idx++)
>> +               writel_relaxed(periph_ctx[idx],
>> +                              clk_base + periph_regs[i].rst_reg);
>> +
>> +       /* ensure all resets have propagated */
>> +       fence_udelay(2, clk_base);
>> +       tegra_read_chipid();
>> +
>> +       for (i = 0; i < periph_banks; i++, idx++)
>> +               writel_relaxed(periph_ctx[idx],
>> +                              clk_base + periph_regs[i].enb_reg);
>> +
>> +       /* ensure all enables have propagated */
>> +       fence_udelay(2, clk_base);
>> +       tegra_read_chipid();
>> +}
>> +
>> +static int tegra_clk_suspend_ctx_init(int banks)
>> +{
>> +       int err = 0;
>> +
>> +       periph_ctx = kzalloc(2 * banks * sizeof(*periph_ctx), GFP_KERNEL);
> Is this kcalloc(2 * banks, sizeof(*periph_ctx)... ?
Will fix in V3
>> +       if (!periph_ctx)
>> +               err = -ENOMEM;
>> +
>> +       return err;
>> +}
>> +#endif
>> +
>>   struct clk ** __init tegra_clk_init(void __iomem *regs, int num, int banks)
>>   {
>>          clk_base = regs;
>> @@ -226,11 +289,20 @@ struct clk ** __init tegra_clk_init(void __iomem *regs, int num, int banks)
>>          periph_banks = banks;
>>   
>>          clks = kcalloc(num, sizeof(struct clk *), GFP_KERNEL);
>> -       if (!clks)
>> +       if (!clks) {
>>                  kfree(periph_clk_enb_refcnt);
>> +               return NULL;
>> +       }
>>   
>>          clk_num = num;
>>   
>> +#ifdef CONFIG_PM_SLEEP
> Can you use if (IS_ENABLED(CONFIG_PM_SLEEP)) here?
Will fix in V3
>
>> +       if (tegra_clk_suspend_ctx_init(banks)) {
>> +               kfree(periph_clk_enb_refcnt);
>> +               kfree(clks);
>> +               return NULL;
>> +       }
>> +#endif
>>          return clks;
>>   }
>>   
