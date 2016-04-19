From: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH V2 3/3] gpio: tegra: Add support for gpio debounce
Date: Tue, 19 Apr 2016 21:49:58 +0530
Message-ID: <57165AAE.8050108@nvidia.com>
References: <1461059020-25373-1-git-send-email-ldewangan@nvidia.com> <1461059020-25373-3-git-send-email-ldewangan@nvidia.com> <571658CE.1040306@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <571658CE.1040306-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


On Tuesday 19 April 2016 09:41 PM, Stephen Warren wrote:
> On 04/19/2016 03:43 AM, Laxman Dewangan wrote:
>> NVIDIA's Tegra210 support the HW debounce in the GPIO
>> controller for all its GPIO pins.
>>
>> Add support for setting debounce timing by implementing the
>> set_debounce callback of gpiochip.
>
>> diff --git a/drivers/gpio/gpio-tegra.c b/drivers/gpio/gpio-tegra.c
>
>> @@ -327,6 +360,9 @@ static int tegra_gpio_resume(struct device *dev)
>>               tegra_gpio_writel(bank->oe[p], GPIO_OE(gpio));
>>               tegra_gpio_writel(bank->int_lvl[p], GPIO_INT_LVL(gpio));
>>               tegra_gpio_writel(bank->int_enb[p], GPIO_INT_ENB(gpio));
>> +            tegra_gpio_writel(bank->dbc_cnt[p], GPIO_DBC_CNT(gpio));
>> +            tegra_gpio_writel(bank->dbc_enb[p],
>> +                      GPIO_MSK_DBC_EN(gpio));
>
> Why not just write to the "regular" register rather than the mask 
> register here...

There is no regular register for enabling debounce. Only masked register 
exist.
