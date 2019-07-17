From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v4 02/24] PM / devfreq: tegra30: Keep interrupt disabled
 while governor is stopped
Date: Wed, 17 Jul 2019 19:44:11 +0300
Message-ID: <00dfcd92-a41a-11c0-b8b2-1cdc68048aa9@gmail.com>
References: <20190707223303.6755-1-digetx@gmail.com>
 <CGME20190707223724epcas4p2d82cecc2969fecddca67192417843418@epcas4p2.samsung.com>
 <20190707223303.6755-3-digetx@gmail.com>
 <f691a845-18f3-a6fb-302c-a8a3fc13e5bf@samsung.com>
 <6c517d04-cf99-f907-e74d-9fba99405a53@gmail.com>
 <ca339b7f-1141-4c68-1c07-2ac818422bbc@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <ca339b7f-1141-4c68-1c07-2ac818422bbc@samsung.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Chanwoo Choi <cw00.choi@samsung.com>, Thierry Reding <thierry.reding@gmail.com>, MyungJoo Ham <myungjoo.ham@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Jonathan Hunter <jonathanh@nvidia.com>, Tomeu Vizoso <tomeu.vizoso@collabora.com>
Cc: linux-pm@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

17.07.2019 9:37, Chanwoo Choi пишет:
> On 19. 7. 16. 오후 10:03, Dmitry Osipenko wrote:
>> 16.07.2019 14:47, Chanwoo Choi пишет:
>>> On 19. 7. 8. 오전 7:32, Dmitry Osipenko wrote:
>>>> There is no real need to keep interrupt always-enabled, will be nicer
>>>> to keep it disabled while governor is inactive.
>>>>
>>>> Suggested-by: Thierry Reding <thierry.reding@gmail.com>
>>>> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
>>>> ---
>>>>  drivers/devfreq/tegra30-devfreq.c | 43 ++++++++++++++++---------------
>>>>  1 file changed, 22 insertions(+), 21 deletions(-)
>>>>
>>>> diff --git a/drivers/devfreq/tegra30-devfreq.c b/drivers/devfreq/tegra30-devfreq.c
>>>> index a27300f40b0b..5e2b133babdd 100644
>>>> --- a/drivers/devfreq/tegra30-devfreq.c
>>>> +++ b/drivers/devfreq/tegra30-devfreq.c
>>>> @@ -11,6 +11,7 @@
>>>>  #include <linux/devfreq.h>
>>>>  #include <linux/interrupt.h>
>>>>  #include <linux/io.h>
>>>> +#include <linux/irq.h>
>>>>  #include <linux/module.h>
>>>>  #include <linux/mod_devicetable.h>
>>>>  #include <linux/platform_device.h>
>>>> @@ -416,8 +417,6 @@ static void tegra_actmon_start(struct tegra_devfreq *tegra)
>>>>  {
>>>>  	unsigned int i;
>>>>  
>>>> -	disable_irq(tegra->irq);
>>>> -
>>>>  	actmon_writel(tegra, ACTMON_SAMPLING_PERIOD - 1,
>>>>  		      ACTMON_GLB_PERIOD_CTRL);
>>>>  
>>>> @@ -442,8 +441,6 @@ static void tegra_actmon_stop(struct tegra_devfreq *tegra)
>>>>  	}
>>>>  
>>>>  	actmon_write_barrier(tegra);
>>>> -
>>>> -	enable_irq(tegra->irq);
>>>>  }
>>>>  
>>>>  static int tegra_devfreq_target(struct device *dev, unsigned long *freq,
>>>> @@ -552,6 +549,12 @@ static int tegra_governor_event_handler(struct devfreq *devfreq,
>>>>  {
>>>>  	struct tegra_devfreq *tegra = dev_get_drvdata(devfreq->dev.parent);
>>>>  
>>>> +	/*
>>>> +	 * Couple device with the governor early as it is needed at
>>>> +	 * the moment of governor's start (used by ISR).
>>>> +	 */
>>>> +	tegra->devfreq = devfreq;
>>>
>>> I'm not sure it is necessary. Almost devfreq device get
>>> the devfreq instance on probe timing through devfreq_add_device directly.
>>
>> This is necessary because this assignment is for the "governor" and not
>> the "device". Governor is started during of devfreq_add_device(), hence
>> there is no better way to assign device to the driver's governor.
> 
> OK. I understand.
> 
> But, I have a question. Is it working before this patch?
> How can you test it on that tegra->devfreq is NULL?

It was working before this patch because previously interrupt was
requested *after* devfreq_add_device(), now the IRQ requesting happens
*before* devfreq_add_device() and enabling *during of*. If interrupt
fires before the assignment happened, then ISR gets a NULL deference and
this is easily reproducible.

Please note that 'tegra->devfreq' is used only by the ISR and onward, in
the further patches of this series the usage is extended by the cpufreq
notifier.

>>
>>>> +
>>>>  	switch (event) {
>>>>  	case DEVFREQ_GOV_START:
>>>>  		devfreq_monitor_start(devfreq);
>>>> @@ -586,10 +589,11 @@ static struct devfreq_governor tegra_devfreq_governor = {
>>>>  
>>>>  static int tegra_devfreq_probe(struct platform_device *pdev)
>>>>  {
>>>> -	struct tegra_devfreq *tegra;
>>>>  	struct tegra_devfreq_device *dev;
>>>> -	unsigned int i;
>>>> +	struct tegra_devfreq *tegra;
>>>> +	struct devfreq *devfreq;
>>>>  	unsigned long rate;
>>>> +	unsigned int i;
>>>>  	int err;
>>>>  
>>>>  	tegra = devm_kzalloc(&pdev->dev, sizeof(*tegra), GFP_KERNEL);
>>>> @@ -625,6 +629,16 @@ static int tegra_devfreq_probe(struct platform_device *pdev)
>>>>  	}
>>>>  	tegra->irq = err;
>>>>  
>>>> +	irq_set_status_flags(tegra->irq, IRQ_NOAUTOEN);
>>>> +
>>>> +	err = devm_request_threaded_irq(&pdev->dev, tegra->irq, NULL,
>>>> +					actmon_thread_isr, IRQF_ONESHOT,
>>>> +					"tegra-devfreq", tegra);
>>>> +	if (err) {
>>>> +		dev_err(&pdev->dev, "Interrupt request failed: %d\n", err);
>>>> +		return err;
>>>> +	}
>>>> +
>>>>  	reset_control_assert(tegra->reset);
>>>>  
>>>>  	err = clk_prepare_enable(tegra->clock);
>>>> @@ -672,28 +686,15 @@ static int tegra_devfreq_probe(struct platform_device *pdev)
>>>>  	}
>>>>  
>>>>  	tegra_devfreq_profile.initial_freq = clk_get_rate(tegra->emc_clock);
>>>> -	tegra->devfreq = devfreq_add_device(&pdev->dev,
>>>> -					    &tegra_devfreq_profile,
>>>> -					    "tegra_actmon",
>>>> -					    NULL);
>>>> +	devfreq = devfreq_add_device(&pdev->dev, &tegra_devfreq_profile,
>>>> +				     "tegra_actmon", NULL);
>>>>  	if (IS_ERR(tegra->devfreq)) {
>>>
>>> Have to check 'devfreq' instead of 'tegra->devfreq'.
>>> Did you test it? It might be failed because 'tegra->devfreq is NULL.
>>
>> That's a good catch! Thank you very much.
>>
>>>>  		err = PTR_ERR(tegra->devfreq);
>>>
>>> ditto.
>>
>> Ok
