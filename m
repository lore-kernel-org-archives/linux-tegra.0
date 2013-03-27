From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: palmas: add dt support
Date: Wed, 27 Mar 2013 14:00:01 +0100
Message-ID: <CACRpkdY_9pEkNfp7L82nGjsjFOi-VXwPHo7_3XwjCz8XcN8osg@mail.gmail.com>
References: <1363876214-25933-1-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1363876214-25933-1-git-send-email-ldewangan@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Laxman Dewangan <ldewangan@nvidia.com>
Cc: grant.likely@secretlab.ca, rob.herring@calxeda.com, linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, swarren@nvidia.com
List-Id: linux-tegra@vger.kernel.org

On Thu, Mar 21, 2013 at 3:30 PM, Laxman Dewangan <ldewangan@nvidia.com> wrote:

>  #ifdef CONFIG_OF_GPIO
> -       palmas_gpio->gpio_chip.of_node = palmas->dev->of_node;
> +       palmas_gpio->gpio_chip.of_node = pdev->dev.of_node;
>  #endif

OK I think that #ifdef is necessary...

> +#ifdef CONFIG_OF
> +static struct of_device_id of_palmas_gpio_match[] = {
> +       { .compatible = "ti,palmas-gpio"},
> +       { },
> +};
> +MODULE_DEVICE_TABLE(of, of_palmas_gpio_match);
> +#endif

But please drop the #ifdef here unless it causes compile errors
(I don't think it will.)

Yours,
Linus Walleij
