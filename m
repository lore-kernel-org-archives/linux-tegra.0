From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH V3 4/4] gpio: tegra: Add support for gpio debounce
Date: Thu, 21 Apr 2016 12:35:54 -0600
Message-ID: <57191D8A.9040704@wwwdotorg.org>
References: <1461159058-1439-1-git-send-email-ldewangan@nvidia.com>
 <1461159058-1439-5-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1461159058-1439-5-git-send-email-ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 04/20/2016 07:30 AM, Laxman Dewangan wrote:
> NVIDIA's Tegra210 support the HW debounce in the GPIO
> controller for all its GPIO pins.
>
> Add support for setting debounce timing by implementing the
> set_debounce callback of gpiochip.

> diff --git a/drivers/gpio/gpio-tegra.c b/drivers/gpio/gpio-tegra.c

> +static int tegra_gpio_set_debounce(struct gpio_chip *chip, unsigned int offset,

> +	/* There is only one debounce count register per port and hence
> +	 * set the maximum of current and requested debounce time.
> +	 */
> +	if (tgi->bank_info[bank].dbc_cnt[port] < debounce_ms) {
> +		tegra_gpio_writel(tgi, debounce_ms, GPIO_DBC_CNT(tgi, offset));
> +		tgi->bank_info[bank].dbc_cnt[port] = debounce_ms;
> +	}

Do we need any locking there? I imagine the GPIO core doesn't prevent 
different threads/drivers from manipulating different GPIOs in parallel 
on different cores.
