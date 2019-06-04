From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v4 07/16] PM / devfreq: tegra: Properly disable interrupts
Date: Tue, 4 Jun 2019 16:40:18 +0300
Message-ID: <c2f2a8c8-1f30-34aa-9b95-a7a44e0ec96f@gmail.com>
References: <20190501233815.32643-1-digetx@gmail.com>
 <20190501233815.32643-8-digetx@gmail.com> <20190604110744.GG16519@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190604110744.GG16519@ulmo>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Jonathan Hunter <jonathanh@nvidia.com>, MyungJoo Ham <myungjoo.ham@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Tomeu Vizoso <tomeu.vizoso@collabora.com>, linux-pm@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

04.06.2019 14:07, Thierry Reding пишет:
> On Thu, May 02, 2019 at 02:38:06AM +0300, Dmitry Osipenko wrote:
>> There is no guarantee that interrupt handling isn't running in parallel
>> with tegra_actmon_disable_interrupts(), hence it is necessary to protect
>> DEV_CTRL register accesses and clear IRQ status with ACTMON's IRQ being
>> disabled in the Interrupt Controller in order to ensure that device
>> interrupt is indeed being disabled.
>>
>> Reviewed-by: Chanwoo Choi <cw00.choi@samsung.com>
>> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
>> ---
>>  drivers/devfreq/tegra-devfreq.c | 21 +++++++++++++++------
>>  1 file changed, 15 insertions(+), 6 deletions(-)
>>
>> diff --git a/drivers/devfreq/tegra-devfreq.c b/drivers/devfreq/tegra-devfreq.c
>> index b65313fe3c2e..ce1eb97a2090 100644
>> --- a/drivers/devfreq/tegra-devfreq.c
>> +++ b/drivers/devfreq/tegra-devfreq.c
>> @@ -171,6 +171,8 @@ struct tegra_devfreq {
>>  	struct notifier_block	rate_change_nb;
>>  
>>  	struct tegra_devfreq_device devices[ARRAY_SIZE(actmon_device_configs)];
>> +
>> +	int irq;
> 
> Interrupts are typically unsigned int.
> 
>>  };
>>  
>>  struct tegra_actmon_emc_ratio {
>> @@ -417,6 +419,8 @@ static void tegra_actmon_disable_interrupts(struct tegra_devfreq *tegra)
>>  	u32 val;
>>  	unsigned int i;
>>  
>> +	disable_irq(tegra->irq);
>> +
>>  	for (i = 0; i < ARRAY_SIZE(tegra->devices); i++) {
>>  		dev = &tegra->devices[i];
>>  
>> @@ -427,9 +431,14 @@ static void tegra_actmon_disable_interrupts(struct tegra_devfreq *tegra)
>>  		val &= ~ACTMON_DEV_CTRL_CONSECUTIVE_ABOVE_WMARK_EN;
>>  
>>  		device_writel(dev, val, ACTMON_DEV_CTRL);
>> +
>> +		device_writel(dev, ACTMON_INTR_STATUS_CLEAR,
>> +			      ACTMON_DEV_INTR_STATUS);
>>  	}
>>  
>>  	actmon_write_barrier(tegra);
>> +
>> +	enable_irq(tegra->irq);
> 
> Why do we enable interrupts after this? Is there any use in having the
> top-level interrupt enabled if nothing's going to generate an interrupt
> anyway?

There is no real point in having the interrupt enabled other than to
keep the enable count balanced.

IIUC, we will need to disable IRQ at the driver's probe time (after
requesting the IRQ) if we want to avoid that (not really necessary)
balancing. This is probably something that could be improved in a
follow-up patches, if desired.

>>  }
>>  
>>  static void tegra_actmon_configure_device(struct tegra_devfreq *tegra,
>> @@ -604,7 +613,6 @@ static int tegra_devfreq_probe(struct platform_device *pdev)
>>  	struct resource *res;
>>  	unsigned int i;
>>  	unsigned long rate;
>> -	int irq;
>>  	int err;
>>  
>>  	tegra = devm_kzalloc(&pdev->dev, sizeof(*tegra), GFP_KERNEL);
>> @@ -673,15 +681,16 @@ static int tegra_devfreq_probe(struct platform_device *pdev)
>>  		dev_pm_opp_add(&pdev->dev, rate, 0);
>>  	}
>>  
>> -	irq = platform_get_irq(pdev, 0);
>> -	if (irq < 0) {
>> -		dev_err(&pdev->dev, "Failed to get IRQ: %d\n", irq);
>> -		return irq;
>> +	tegra->irq = platform_get_irq(pdev, 0);
>> +	if (tegra->irq < 0) {
>> +		err = tegra->irq;
>> +		dev_err(&pdev->dev, "Failed to get IRQ: %d\n", err);
>> +		return err;
>>  	}
> 
> This is very oddly written. tegra->irq should really be an unsigned int
> since that's the standard type for interrupt numbers. But since you need
> to be able to detect errors from platform_get_irq() it now becomes
> natural to write this as:
> 
> 	err = platform_get_irq(pdev, 0);
> 	if (err < 0) {
> 		dev_err(...);
> 		return err;
> 	}
> 
> 	tegra->irq = err;
> 
> Two birds with one stone. I suppose this could be done in a follow-up
> patch since it isn't practically wrong in your version, so either way:
> 
> Acked-by: Thierry Reding <treding@nvidia.com>
> 

Thank you for the ACK! Although, I disagree with yours suggestion, to me
that makes code a bit less straightforward and it's not really
worthwhile to bloat the code just because technically IRQ's are unsigned
numbers (we don't care about that). It also makes me a bit uncomfortable
to see "err" assigned to a variable, I don't think it's a good practice.
