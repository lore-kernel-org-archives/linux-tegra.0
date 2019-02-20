From: Marek Vasut <marek.vasut@gmail.com>
Subject: Re: [PATCH] gpio: of: Restrict enable-gpio quirk to regulator-gpio
Date: Wed, 20 Feb 2019 12:15:54 +0100
Message-ID: <9f6eed1d-0c7f-f3e6-f091-3faf8fcc966a@gmail.com>
References: <20190220105214.26618-1-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190220105214.26618-1-thierry.reding@gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc: linux-gpio@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, Linux-Renesas <linux-renesas-soc@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

On 2/20/19 11:52 AM, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> Commit 0e7d6f940164 ("gpio: of: Apply regulator-gpio quirk only to
> enable-gpios") breaks the device tree ABI specified in the device tree
> bindings for fixed regulators (compatible "regulator-fixed"). According
> to these bindings the polarity of the GPIO is exclusively controlled by
> the presence or absence of the enable-active-high property. As such the
> polarity quirk implemented in of_gpio_flags_quirks() must be applied to
> the GPIO specified for fixed regulators.
> 
> However, commit 0e7d6f940164 ("gpio: of: Apply regulator-gpio quirk only
> to enable-gpios") restricted the quirk to the enable-gpios property for
> fixed regulators as well, whereas according to the commit message itself
> it should only apply to "regulator-gpio" compatible device tree nodes.
> 
> Fix this by actually implementing what the offending commit intended,
> which is to ensure that the quirk is applied to the GPIO specified by
> the "enable-gpio" property for the "regulator-gpio" bindings only.
> 
> This fixes a regression on Jetson TX1 where the fixed regulator for the
> HDMI +5V pin relies on the flags quirk for the proper polarity.
> 
> Fixes: 0e7d6f940164 ("gpio: of: Apply regulator-gpio quirk only to enable-gpios")
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  drivers/gpio/gpiolib-of.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpio/gpiolib-of.c b/drivers/gpio/gpiolib-of.c
> index 1b4c741e0635..bddfc6102a50 100644
> --- a/drivers/gpio/gpiolib-of.c
> +++ b/drivers/gpio/gpiolib-of.c
> @@ -84,10 +84,10 @@ static void of_gpio_flags_quirks(struct device_node *np,
>  	 * Note that active low is the default.
>  	 */
>  	if (IS_ENABLED(CONFIG_REGULATOR) &&
> -	    !strcmp(propname, "enable-gpio") &&
>  	    (of_device_is_compatible(np, "regulator-fixed") ||
>  	     of_device_is_compatible(np, "reg-fixed-voltage") ||
> -	     of_device_is_compatible(np, "regulator-gpio"))) {
> +	     (of_device_is_compatible(np, "regulator-gpio") &&
> +	      strcmp(propname, "enable-gpio") == 0))) {
>  		/*
>  		 * The regulator GPIO handles are specified such that the
>  		 * presence or absence of "enable-active-high" solely controls

On R8A7795 Salvator-XS
Tested-by: Marek Vasut <marek.vasut@gmail.com>

-- 
Best regards,
Marek Vasut
