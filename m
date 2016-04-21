From: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH V3 3/4] gpio: tegra: Get rid of all file scoped global
 variables
Date: Fri, 22 Apr 2016 00:05:08 +0530
Message-ID: <57191D5C.1020401@nvidia.com>
References: <1461159058-1439-1-git-send-email-ldewangan@nvidia.com> <1461159058-1439-4-git-send-email-ldewangan@nvidia.com> <57191D0A.8010005@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <57191D0A.8010005-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


On Friday 22 April 2016 12:03 AM, Stephen Warren wrote:
> On 04/20/2016 07:30 AM, Laxman Dewangan wrote:
>> Move the file scoped multiple global variable from Tegra GPIO
>> driver to the structure and make this as gpiochip data which
>> can be referred from GPIO chip callbacks.
>
>> diff --git a/drivers/gpio/gpio-tegra.c b/drivers/gpio/gpio-tegra.c
>
>> +#define GPIO_MSK_CNF(t, x) (GPIO_REG(t, x) + t->soc->upper_offset + 
>> 0x00)
>> +#define GPIO_MSK_OE(t, x)    (GPIO_REG(t, x) + t->soc->upper_offset 
>> + 0x10)
>> +#define GPIO_MSK_OUT(t, x)    (GPIO_REG(t, x) + t->soc->upper_offset 
>> + 0X20)
>> +#define GPIO_MSK_INT_STA(t, x)    (GPIO_REG(t, x) + 
>> t->soc->upper_offset + 0x40)
>> +#define GPIO_MSK_INT_ENB(t, x)    (GPIO_REG(t, x) + 
>> t->soc->upper_offset + 0x50)
>> +#define GPIO_MSK_INT_LVL(t, x)    (GPIO_REG(t, x) + 
>> t->soc->upper_offset + 0x60)
>> +#define GPIO_MSK_DBC_EN(t, x)    (GPIO_REG(t, x) + 
>> t->soc->upper_offset + 0x30)
>
> DBC_EN/0x30 should be sorted correctly with the rest, and likely added 
> in patch 4 instead.
>
>> @@ -276,19 +307,25 @@ static void tegra_gpio_irq_handler(struct 
>> irq_desc *desc)
>
>> +    struct tegra_gpio_info *tgi = bank->tgi;
>> +
>>
>>       chained_irq_enter(chip, desc);
>
> No need for 2 blank lines there.
>
>> @@ -410,7 +462,7 @@ static int dbg_gpio_show(struct seq_file *s, void 
>> *unused)
>>
>>   static int dbg_gpio_open(struct inode *inode, struct file *file)
>>   {
>> -    return single_open(file, dbg_gpio_show, &inode->i_private);
>> +    return single_open(file, dbg_gpio_show, inode->i_private);
>
> Can you explain that change? I'm not sure it's correct, but don't know 
> why it was made.
>
we have sysfs interface to dump register as /sys/kernel/debug/tega_gpio
On this patch, I moved the tegra_gpio_info pointer as data for 
s->private so that we will not need the global variable.
inode->i_private contains the pointer of the passed data. Hence we do 
not need to pass the pointe ro pointer of data. If we dont do then we 
will get wrong data pointer for tegra_gpio_info.



> Once those are fixed,
> Reviewed-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Thanks for RB.
