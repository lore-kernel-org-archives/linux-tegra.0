From: Michael Hennerich <michael.hennerich@analog.com>
Subject: Re: [PATCH 06/61] gpio: adp5520: Use devm_gpiochip_add_data() for
 gpio registration
Date: Tue, 23 Feb 2016 08:49:47 +0100
Message-ID: <56CC0F1B.9040003@analog.com>
References: <1456150130-2668-1-git-send-email-ldewangan@nvidia.com>
 <1456150130-2668-7-git-send-email-ldewangan@nvidia.com>
Reply-To: <michael.hennerich@analog.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1456150130-2668-7-git-send-email-ldewangan@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Laxman Dewangan <ldewangan@nvidia.com>, linus.walleij@linaro.org, gnurou@gmail.com, corbet@lwn.net, albeu@free.fr, rjui@broadcom.com, shc_work@mail.ru, support.opensource@diasemi.com, swarren@wwwdotorg.org, thierry.reding@gmail.com
Cc: bjorn.andersson@sonymobile.com, a.kesavan@samsung.com, gregkh@linuxfoundation.org, catalin.marinas@arm.com, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, patches@opensource.wolfsonmicro.com, bcm-kernel-feedback-list@broadcom.com, linux-arm-kernel@lists.infradead.org, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On 02/22/2016 03:07 PM, Laxman Dewangan wrote:
> Use devm_gpiochip_add_data() for GPIO registration and remove the
> call for gpiochip_remove() from error path.
>
> Also remove the need of driver callback .remove.
>
> Signed-off-by: Laxman Dewangan <ldewangan@nvidia.com>

Acked-by: Michael Hennerich <michael.hennerich@analog.com>

> Cc: Michael Hennerich <michael.hennerich@analog.com>
> ---
>   drivers/gpio/gpio-adp5520.c | 13 +------------
>   1 file changed, 1 insertion(+), 12 deletions(-)
>
> diff --git a/drivers/gpio/gpio-adp5520.c b/drivers/gpio/gpio-adp5520.c
> index 4fa7ff1..abf1996 100644
> --- a/drivers/gpio/gpio-adp5520.c
> +++ b/drivers/gpio/gpio-adp5520.c
> @@ -153,7 +153,7 @@ static int adp5520_gpio_probe(struct platform_device *pdev)
>   		goto err;
>   	}
>
> -	ret = gpiochip_add_data(&dev->gpio_chip, dev);
> +	ret = devm_gpiochip_add_data(&pdev->dev, &dev->gpio_chip, dev);
>   	if (ret)
>   		goto err;
>
> @@ -164,22 +164,11 @@ err:
>   	return ret;
>   }
>
> -static int adp5520_gpio_remove(struct platform_device *pdev)
> -{
> -	struct adp5520_gpio *dev;
> -
> -	dev = platform_get_drvdata(pdev);
> -	gpiochip_remove(&dev->gpio_chip);
> -
> -	return 0;
> -}
> -
>   static struct platform_driver adp5520_gpio_driver = {
>   	.driver	= {
>   		.name	= "adp5520-gpio",
>   	},
>   	.probe		= adp5520_gpio_probe,
> -	.remove		= adp5520_gpio_remove,
>   };
>
>   module_platform_driver(adp5520_gpio_driver);
>


-- 
Greetings,
Michael
