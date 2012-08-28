From: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 2/2] ARM: dt: tegra: harmony: add regulators
Date: Tue, 28 Aug 2012 20:34:11 +0530
Message-ID: <503CDDEB.1050201@nvidia.com>
References: <1346137800-7448-1-git-send-email-swarren@wwwdotorg.org> <1346137800-7448-2-git-send-email-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1346137800-7448-2-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Tuesday 28 August 2012 12:40 PM, Stephen Warren wrote:
>   #include "board.h"
> -#include "board-harmony.h"
>
>   #ifdef CONFIG_TEGRA_PCI
>
>   int __init harmony_pcie_init(void)
>   {
> -       struct regulator *regulator = NULL;
> +       struct regulator *regulator_1v5, *regulator_pex;
>          int err;
>
> -       err = gpio_request(TEGRA_GPIO_EN_VDD_1V05_GPIO, "EN_VDD_1V05");
> -       if (err)
> -               return err;
> +       regulator_1v5 = regulator_get(NULL, "vdd_1v5");
> +       if (IS_ERR_OR_NULL(regulator_1v5)) {
> +               err = PTR_ERR(regulator_1v5);
> +               goto err_reg;
> +       }

You need to return in case of err otherwise it will cause the crash in 
regulator_disable() with NULL argument.
