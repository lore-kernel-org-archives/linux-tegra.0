From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: [PATCH V2 3/3] gpio: tegra: Add support for gpio debounce
Date: Tue, 19 Apr 2016 10:36:58 -0600
Message-ID: <57165EAA.7080304@wwwdotorg.org>
References: <1461059020-25373-1-git-send-email-ldewangan@nvidia.com>
 <1461059020-25373-3-git-send-email-ldewangan@nvidia.com>
 <571658CE.1040306@wwwdotorg.org> <57165AAE.8050108@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <57165AAE.8050108@nvidia.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Laxman Dewangan <ldewangan@nvidia.com>
Cc: linus.walleij@linaro.org, gnurou@gmail.com, thierry.reding@gmail.com, linux-gpio@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On 04/19/2016 10:19 AM, Laxman Dewangan wrote:
>
> On Tuesday 19 April 2016 09:41 PM, Stephen Warren wrote:
>> On 04/19/2016 03:43 AM, Laxman Dewangan wrote:
>>> NVIDIA's Tegra210 support the HW debounce in the GPIO
>>> controller for all its GPIO pins.
>>>
>>> Add support for setting debounce timing by implementing the
>>> set_debounce callback of gpiochip.
>>
>>> diff --git a/drivers/gpio/gpio-tegra.c b/drivers/gpio/gpio-tegra.c
>>
>>> @@ -327,6 +360,9 @@ static int tegra_gpio_resume(struct device *dev)
>>>               tegra_gpio_writel(bank->oe[p], GPIO_OE(gpio));
>>>               tegra_gpio_writel(bank->int_lvl[p], GPIO_INT_LVL(gpio));
>>>               tegra_gpio_writel(bank->int_enb[p], GPIO_INT_ENB(gpio));
>>> +            tegra_gpio_writel(bank->dbc_cnt[p], GPIO_DBC_CNT(gpio));
>>> +            tegra_gpio_writel(bank->dbc_enb[p],
>>> +                      GPIO_MSK_DBC_EN(gpio));
>>
>> Why not just write to the "regular" register rather than the mask
>> register here...
>
> There is no regular register for enabling debounce. Only masked register
> exist.

Sigh. Ignore that comment then:-)
