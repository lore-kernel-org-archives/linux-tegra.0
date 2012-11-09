From: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH] gpio: tegra: read output value when gpio is set in direction_out
Date: Fri, 9 Nov 2012 11:17:57 +0530
Message-ID: <509C990D.50008@nvidia.com>
References: <1352356047-24817-1-git-send-email-ldewangan@nvidia.com> <509BE4AD.30701@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <509BE4AD.30701-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: "linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org" <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Thursday 08 November 2012 10:28 PM, Stephen Warren wrote:
> On 11/07/2012 11:27 PM, Laxman Dewangan wrote:
>> Read the output value when gpio is set for the output mode for
>> gpio_get_value(). Reading input value in direction out does not
>> give correct value.
> That's an unfortunate HW design, but oh well. Do you have any idea why
> reading the input register doesn't work? If you look at the Tegra20 TRM,
> page 666 figure 32 "SFIO/GPIO Pin Multiplexing Architecture", there's
> not indication that the input path wouldn't work if the output path is
> active. Perhaps the issue is in the GPIO module not the pinmux module?
>

I think this is in the gpio controller design. I again check this in 
cardhu wih dumping gpio registers
Bank:Port CNF OE OUT IN INT_STA INT_ENB INT_LVL
2:2       1c  18 08 04 00 00 000000

GPIO pin2,pin3 and pin4 are in gpio mode.
GPIO pin 3 and pin4 are in output mode and pin2 is in input mode.
Set the output to 1 for pin3 and reading back through gpio_in register 
for this pin, it is showing as 0, not 1.


>> diff --git a/drivers/gpio/gpio-tegra.c b/drivers/gpio/gpio-tegra.c
>>   static int tegra_gpio_get(struct gpio_chip *chip, unsigned offset)
>>   {
>> +	int bit_val = BIT(GPIO_BIT(offset));
>> +
>> +	/* If gpio is in output mode then read from the out value */
>> +	if (tegra_gpio_readl(GPIO_OE(offset))&  bit_val)
>> +		return !!(tegra_gpio_readl(GPIO_OUT(offset))&  bit_val);
>> +
>>   	return (tegra_gpio_readl(GPIO_IN(offset))>>  GPIO_BIT(offset))&  0x1;
>>   }
> Any chance of using the same kind of logic to isolate the bit value? One
> branch above does !!(val&  mask) and the other (val>>  shift)&  1.

It was going to more than 80 column and hence I did like this.  Let me 
respin this patch to have same kind of.
