From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v4 07/16] PM / devfreq: tegra: Properly disable interrupts
Date: Wed, 5 Jun 2019 01:55:05 +0300
Message-ID: <2b09a162-a090-901b-01cf-46b116a87a7a@gmail.com>
References: <20190501233815.32643-1-digetx@gmail.com>
 <20190501233815.32643-8-digetx@gmail.com> <20190604110744.GG16519@ulmo>
 <c2f2a8c8-1f30-34aa-9b95-a7a44e0ec96f@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <c2f2a8c8-1f30-34aa-9b95-a7a44e0ec96f@gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Jonathan Hunter <jonathanh@nvidia.com>, MyungJoo Ham <myungjoo.ham@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Tomeu Vizoso <tomeu.vizoso@collabora.com>, linux-pm@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

04.06.2019 16:40, Dmitry Osipenko пишет:
> 04.06.2019 14:07, Thierry Reding пишет:
>> On Thu, May 02, 2019 at 02:38:06AM +0300, Dmitry Osipenko wrote:
>>> There is no guarantee that interrupt handling isn't running in parallel
>>> with tegra_actmon_disable_interrupts(), hence it is necessary to protect
>>> DEV_CTRL register accesses and clear IRQ status with ACTMON's IRQ being
>>> disabled in the Interrupt Controller in order to ensure that device
>>> interrupt is indeed being disabled.
>>>
>>> Reviewed-by: Chanwoo Choi <cw00.choi@samsung.com>
>>> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
>>> ---
>>>  drivers/devfreq/tegra-devfreq.c | 21 +++++++++++++++------
>>>  1 file changed, 15 insertions(+), 6 deletions(-)
>>>
>>> diff --git a/drivers/devfreq/tegra-devfreq.c b/drivers/devfreq/tegra-devfreq.c
>>> index b65313fe3c2e..ce1eb97a2090 100644
>>> --- a/drivers/devfreq/tegra-devfreq.c
>>> +++ b/drivers/devfreq/tegra-devfreq.c
>>> @@ -171,6 +171,8 @@ struct tegra_devfreq {
>>>  	struct notifier_block	rate_change_nb;
>>>  
>>>  	struct tegra_devfreq_device devices[ARRAY_SIZE(actmon_device_configs)];
>>> +
>>> +	int irq;
>>
>> Interrupts are typically unsigned int.
>>
>>>  };
>>>  
>>>  struct tegra_actmon_emc_ratio {
>>> @@ -417,6 +419,8 @@ static void tegra_actmon_disable_interrupts(struct tegra_devfreq *tegra)
>>>  	u32 val;
>>>  	unsigned int i;
>>>  
>>> +	disable_irq(tegra->irq);
>>> +
>>>  	for (i = 0; i < ARRAY_SIZE(tegra->devices); i++) {
>>>  		dev = &tegra->devices[i];
>>>  
>>> @@ -427,9 +431,14 @@ static void tegra_actmon_disable_interrupts(struct tegra_devfreq *tegra)
>>>  		val &= ~ACTMON_DEV_CTRL_CONSECUTIVE_ABOVE_WMARK_EN;
>>>  
>>>  		device_writel(dev, val, ACTMON_DEV_CTRL);
>>> +
>>> +		device_writel(dev, ACTMON_INTR_STATUS_CLEAR,
>>> +			      ACTMON_DEV_INTR_STATUS);
>>>  	}
>>>  
>>>  	actmon_write_barrier(tegra);
>>> +
>>> +	enable_irq(tegra->irq);
>>
>> Why do we enable interrupts after this? Is there any use in having the
>> top-level interrupt enabled if nothing's going to generate an interrupt
>> anyway?
> 
> There is no real point in having the interrupt enabled other than to
> keep the enable count balanced.
> 
> IIUC, we will need to disable IRQ at the driver's probe time (after
> requesting the IRQ) if we want to avoid that (not really necessary)
> balancing. This is probably something that could be improved in a
> follow-up patches, if desired.

Nah, it's not worth the effort. It is quite problematic that we can't
keep interrupt disabled during of devfreq_add_device() execution because
it asks governor to enable the interrupt and the interrupt shall be
disabled because we're using device's lock in the governor interrupt
handler.. device is getting assigned only after completion of the
devfreq_add_device() and hence ISR gets a NULL deref if it is fired
before device is assigned. So I'll leave this part as-is.

Thierry, please answer to all of the remaining patches where you had
some concerns. I'll send out another series on top of this, addressing
yours comments and fixing another bug that I spotted today.
