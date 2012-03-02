From: Grant Likely <grant.likely@secretlab.ca>
Subject: Re: [PATCH 1/8] ARM: tegra: export tegra_gpio_{en,dis}able
Date: Fri, 02 Mar 2012 01:24:05 -0600
Message-ID: <20120302072405.C11743E2D96@localhost>
References: <1330630010-11241-1-git-send-email-alan@signal11.us> <1330630010-11241-2-git-send-email-alan@signal11.us>
Mime-Version: 1.0
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1330630010-11241-2-git-send-email-alan@signal11.us>
Sender: linux-kernel-owner@vger.kernel.org
To: Alan Ott <alan@signal11.us>, Russell King <linux@arm.linux.org.uk>, Colin Cross <ccross@android.com>, Olof Johansson <olof@lixom.net>, Stephen Warren <swarren@nvidia.com>, Linus Walleij <linus.walleij@stericsson.com>, Alan Stern <stern@rowland.harvard.edu>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Lucas De Marchi <lucas.demarchi@profusion.mobi>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, linux-usb@vger.kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>
List-Id: linux-tegra@vger.kernel.org

On Thu,  1 Mar 2012 14:26:43 -0500, Alan Ott <alan@signal11.us> wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> These two functions are used in drivers that can be
> modules, so they need to be exported.
> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Acked-by: Grant Likely <grant.likely@secretlab.ca>

> ---
>  drivers/gpio/gpio-tegra.c |    2 ++
>  1 files changed, 2 insertions(+), 0 deletions(-)
> 
> diff --git a/drivers/gpio/gpio-tegra.c b/drivers/gpio/gpio-tegra.c
> index bdc2937..96662cc 100644
> --- a/drivers/gpio/gpio-tegra.c
> +++ b/drivers/gpio/gpio-tegra.c
> @@ -107,11 +107,13 @@ void tegra_gpio_enable(int gpio)
>  {
>  	tegra_gpio_mask_write(GPIO_MSK_CNF(gpio), gpio, 1);
>  }
> +EXPORT_SYMBOL_GPL(tegra_gpio_enable);
>  
>  void tegra_gpio_disable(int gpio)
>  {
>  	tegra_gpio_mask_write(GPIO_MSK_CNF(gpio), gpio, 0);
>  }
> +EXPORT_SYMBOL_GPL(tegra_gpio_disable);
>  
>  static void tegra_gpio_set(struct gpio_chip *chip, unsigned offset, int value)
>  {
> -- 
> 1.7.0.4
> 

-- 
email sent from notmuch.vim plugin
