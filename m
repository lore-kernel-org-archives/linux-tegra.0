From: Laxman Dewangan <ldewangan@nvidia.com>
Subject: Re: [PATCH V3 4/4] gpio: tegra: Add support for gpio debounce
Date: Mon, 25 Apr 2016 13:59:31 +0530
Message-ID: <571DD56B.9030506@nvidia.com>
References: <1461159058-1439-1-git-send-email-ldewangan@nvidia.com> <1461159058-1439-5-git-send-email-ldewangan@nvidia.com> <CAAVeFuK2pQpy9Srg7PJNCMTKkXeLoqGjzVDmuWHox71tHV3-jQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <CAAVeFuK2pQpy9Srg7PJNCMTKkXeLoqGjzVDmuWHox71tHV3-jQ@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Alexandre Courbot <gnurou@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Stephen Warren <swarren@wwwdotorg.org>, Thierry Reding <thierry.reding@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org


On Monday 25 April 2016 10:25 AM, Alexandre Courbot wrote:
> On Wed, Apr 20, 2016 at 10:30 PM, Laxman Dewangan <ldewangan@nvidia.com> wrote:
>>                       bank->int_lvl[p] = tegra_gpio_readl(tgi,
>> @@ -550,6 +598,9 @@ static int tegra_gpio_probe(struct platform_device *pdev)
>>
>>          platform_set_drvdata(pdev, tgi);
>>
>> +       if (!config->debounce_supported)
>> +               tgi->gc->set_debounce = NULL;
> This last line is equivalent to doing
>
>       tegra_gpio_chip.set_debounce = NULL
>
> Which means that after that no one can reinstanciate this driver and
> use debounce. Granted, this does not happen in real life, but the
> purpose of the previous patch that removes all static variables is
> supposedly to make this scenario possible. I think you can easily fix
> this though: make tgi->gc a non-pointer member, do tgi->gc =
> tegra_gpio_chip to copy the initial data, and then set
> tgi->gc.set_debounce to NULL if needed.

As there is only single instance of the tegra gpio driver, I avoided the 
copy of the tegra_gpio_chip.
I am not expecting multiple instance of this driver and hence should be 
fine. When multiple instances are needed, it can be just use as:

But let me make this as you suggested.


> tegra_gpio_chip can then be made constant, and maybe even __initdata?
I have not seen the usage of __initdata now a days. I think it is 
removed from most of places.
Will use the const.

