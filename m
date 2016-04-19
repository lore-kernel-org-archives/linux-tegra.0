From: Laxman Dewangan <ldewangan@nvidia.com>
Subject: Re: [PATCH V2 2/3] gpio: tegra: Remove the need of keeping device
 handle for gpio driver
Date: Tue, 19 Apr 2016 18:13:33 +0530
Message-ID: <571627F5.7000307@nvidia.com>
References: <1461059020-25373-1-git-send-email-ldewangan@nvidia.com> <1461059020-25373-2-git-send-email-ldewangan@nvidia.com> <20160419123323.GC8284@ulmo.ba.sec>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20160419123323.GC8284@ulmo.ba.sec>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: linus.walleij@linaro.org, gnurou@gmail.com, swarren@wwwdotorg.org, linux-gpio@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


On Tuesday 19 April 2016 06:03 PM, Thierry Reding wrote:
> * PGP Signed by an unknown key
>
> On Tue, Apr 19, 2016 at 03:13:39PM +0530, Laxman Dewangan wrote:
>> Remove the file static device handle variable for keeping device handle
>> of driver as this is just required for error prints. The required device
>> handle are available from gpiochip structure.
>>
>> Signed-off-by: Laxman Dewangan <ldewangan@nvidia.com>
>> ---
>>   drivers/gpio/gpio-tegra.c | 8 ++++----
>>   1 file changed, 4 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/gpio/gpio-tegra.c b/drivers/gpio/gpio-tegra.c
>> index 1b0c497..de022a9 100644
>> --- a/drivers/gpio/gpio-tegra.c
>> +++ b/drivers/gpio/gpio-tegra.c
>> @@ -80,7 +80,6 @@ struct tegra_gpio_soc_config {
>>   	u32 upper_offset;
>>   };
>>   
>> -static struct device *dev;
>>   static struct irq_domain *irq_domain;
>>   static void __iomem *regs;
>>   static u32 tegra_gpio_bank_count;
>> @@ -240,7 +239,8 @@ static int tegra_gpio_irq_set_type(struct irq_data *d, unsigned int type)
>>   
>>   	ret = gpiochip_lock_as_irq(&tegra_gpio_chip, gpio);
>>   	if (ret) {
>> -		dev_err(dev, "unable to lock Tegra GPIO %d as IRQ\n", gpio);
>> +		dev_err(tegra_gpio_chip.parent,
>> +			"unable to lock Tegra GPIO %d as IRQ\n", gpio);
> Can't we get rid of the tegra_gpio_chip global variable altogether? We
> set a struct tegra_gpio_bank * as the chip data for each of the
> interrupts, so if we added a back link to the GPIO chip to each bank
> we could easily get at the GPIO chip (and its parent device) from the
> IRQ chip implementation.
>

We can get rid of all the global variables and can have only one (this 
is because our REGS macros uses the stride and changing then part of 
argument is too much change for single patch) as suggested by Stephen.

I am planning to have rid of all global variables to on  follow on 
patches once this series is fine.
