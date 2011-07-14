From: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Subject: Re: [PATCH 1/2] ARM: Tegra: Harmony: Register and configure WM8903
	IRQ GPIO
Date: Thu, 14 Jul 2011 13:25:20 +0100
Message-ID: <20110714122520.GB14249@sirena.org.uk>
References: <1310589618-16080-1-git-send-email-swarren@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1310589618-16080-1-git-send-email-swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Erik Gilling <konkers-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Wed, Jul 13, 2011 at 02:40:17PM -0600, Stephen Warren wrote:

> +	gpio_request(TEGRA_GPIO_CDC_IRQ, "wm8903");
> +	gpio_direction_input(TEGRA_GPIO_CDC_IRQ);
> +
>  	i2c_register_board_info(0, &wm8903_board_info, 1);

This seems silly - we should fix this in the core code rather than have
every single board that ahppens to use an interrupt which is also
available as a GPIO manually faff around with gpiolib.
