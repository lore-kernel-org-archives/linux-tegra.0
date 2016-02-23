From: Michael Hennerich <michael.hennerich@analog.com>
Subject: Re: [PATCH 07/61] gpio: adp5588: Use devm_gpiochip_add_data() for
 gpio registration
Date: Tue, 23 Feb 2016 08:49:21 +0100
Message-ID: <56CC0F01.1000006@analog.com>
References: <1456150130-2668-1-git-send-email-ldewangan@nvidia.com>
 <1456150130-2668-8-git-send-email-ldewangan@nvidia.com>
Reply-To: <michael.hennerich@analog.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1456150130-2668-8-git-send-email-ldewangan@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Laxman Dewangan <ldewangan@nvidia.com>, linus.walleij@linaro.org, gnurou@gmail.com, corbet@lwn.net, albeu@free.fr, rjui@broadcom.com, shc_work@mail.ru, support.opensource@diasemi.com, swarren@wwwdotorg.org, thierry.reding@gmail.com
Cc: bjorn.andersson@sonymobile.com, a.kesavan@samsung.com, gregkh@linuxfoundation.org, catalin.marinas@arm.com, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, patches@opensource.wolfsonmicro.com, bcm-kernel-feedback-list@broadcom.com, linux-arm-kernel@lists.infradead.org, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On 02/22/2016 03:07 PM, Laxman Dewangan wrote:
> Use devm_gpiochip_add_data() for GPIO registration and remove the
> call for gpiochip_remove() from remove callback.
>
> Signed-off-by: Laxman Dewangan <ldewangan@nvidia.com>

Acked-by: Michael Hennerich <michael.hennerich@analog.com>

> Cc: Michael Hennerich <michael.hennerich@analog.com>
> ---
>   drivers/gpio/gpio-adp5588.c | 4 +---
>   1 file changed, 1 insertion(+), 3 deletions(-)
>
> diff --git a/drivers/gpio/gpio-adp5588.c b/drivers/gpio/gpio-adp5588.c
> index 19a0eba..c0f718b 100644
> --- a/drivers/gpio/gpio-adp5588.c
> +++ b/drivers/gpio/gpio-adp5588.c
> @@ -414,7 +414,7 @@ static int adp5588_gpio_probe(struct i2c_client *client,
>   		}
>   	}
>
> -	ret = gpiochip_add_data(&dev->gpio_chip, dev);
> +	ret = devm_gpiochip_add_data(&client->dev, &dev->gpio_chip, dev);
>   	if (ret)
>   		goto err_irq;
>
> @@ -457,8 +457,6 @@ static int adp5588_gpio_remove(struct i2c_client *client)
>   	if (dev->irq_base)
>   		free_irq(dev->client->irq, dev);
>
> -	gpiochip_remove(&dev->gpio_chip);
> -
>   	return 0;
>   }
>
>


-- 
Greetings,
Michael
