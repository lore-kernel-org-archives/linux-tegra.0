From: Laxman Dewangan <ldewangan@nvidia.com>
Subject: Re: [PATCH V4 3/4] gpio: tegra: Get rid of all file scoped global
 variables
Date: Mon, 25 Apr 2016 15:23:22 +0530
Message-ID: <571DE912.3060602@nvidia.com>
References: <1461319754-12040-1-git-send-email-ldewangan@nvidia.com> <1461319754-12040-3-git-send-email-ldewangan@nvidia.com> <20160425100055.GA20630@ulmo.ba.sec>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <20160425100055.GA20630@ulmo.ba.sec>
Sender: linux-gpio-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: swarren@wwwdotorg.org, linus.walleij@linaro.org, gnurou@gmail.com, linux-gpio@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


On Monday 25 April 2016 03:30 PM, Thierry Reding wrote:
> * PGP Signed by an unknown key
>
> On Fri, Apr 22, 2016 at 03:39:13PM +0530, Laxman Dewangan wrote:
> [...]
>> diff --git a/drivers/gpio/gpio-tegra.c b/drivers/gpio/gpio-tegra.c
> [...]
>>   static struct gpio_chip tegra_gpio_chip = {
> This variable is still file-scoped. Why not get rid of it at the same
> time? It's rather pointless to remove all file-scoped variables except a
> single one, because now the driver still isn't properly equipped to deal
> with multiple instances (however theoretical that may be).
>

Yaah, Alex also pointed that to have the instance of gpio_chip in 
tegra_gpio_info and then do as
tgi->gc = tegra_gpio_chip.


same for irq_chip also.


I hope this will resolve the concern.

