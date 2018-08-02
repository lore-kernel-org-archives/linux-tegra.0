From: Stefan Agner <stefan@agner.ch>
Subject: Re: [PATCH v1 1/2] pinctrl: tegra: Move drivers registration to
 arch_init level
Date: Thu, 02 Aug 2018 13:31:32 +0200
Message-ID: <20a52a0461e32e776e526171c250551a@agner.ch>
References: <20180802111144.12512-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180802111144.12512-1-digetx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Marcel Ziswiler <marcel@ziswiler.com>, linux-tegra@vger.kernel.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On 02.08.2018 13:11, Dmitry Osipenko wrote:
> There is a bug in regards to deferred probing within the drivers core
> that causes GPIO-driver to suspend after its users. The bug appears if
> GPIO-driver probe is getting deferred, which happens after introducing
> dependency on PINCTRL-driver for the GPIO-driver by defining "gpio-ranges"
> property in device-tree. The bug in the drivers core is old (more than 4
> years now) and is well known, unfortunately there is no easy fix for it.
> The good news is that we can workaround the deferred probe issue by
> changing GPIO / PINCTRL drivers registration order and hence by moving
> PINCTRL driver registration to the arch_init level and GPIO to the
> subsys_init.

A while back at least using those init lists were not well received even
for GPIO/pinctrl drivers:

https://lore.kernel.org/lkml/CACRpkdYk0zW12qNXgOstTLmdVDYacu0Un+8quTN+J_azOic7AA@mail.gmail.com/T/#mf0596982324a6489b5537b0531ac5aed60a316ba

I still think we should make an exception for GPIO/pinctrl and use
earlier initcalls. Platform GPIO/pinctrl drivers provide basic
infrastructure often used by many other drivers, we want to have them
loaded early. It avoids unnecessary EPROBE_DEFER and hence probably even
boots faster.

And in this case it even resolves real world issues.

This should definitely go in, at least as a stop gap solution.

Acked-by: Stefan Agner <stefan@agner.ch>

--
Stefan


> 
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/pinctrl/tegra/pinctrl-tegra114.c | 7 ++++++-
>  drivers/pinctrl/tegra/pinctrl-tegra124.c | 7 ++++++-
>  drivers/pinctrl/tegra/pinctrl-tegra20.c  | 7 ++++++-
>  drivers/pinctrl/tegra/pinctrl-tegra210.c | 7 ++++++-
>  drivers/pinctrl/tegra/pinctrl-tegra30.c  | 7 ++++++-
>  5 files changed, 30 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/pinctrl/tegra/pinctrl-tegra114.c
> b/drivers/pinctrl/tegra/pinctrl-tegra114.c
> index 511a8774fd8d..d43c209e9c30 100644
> --- a/drivers/pinctrl/tegra/pinctrl-tegra114.c
> +++ b/drivers/pinctrl/tegra/pinctrl-tegra114.c
> @@ -1868,4 +1868,9 @@ static struct platform_driver tegra114_pinctrl_driver = {
>  	},
>  	.probe = tegra114_pinctrl_probe,
>  };
> -builtin_platform_driver(tegra114_pinctrl_driver);
> +
> +static int __init tegra114_pinctrl_init(void)
> +{
> +	return platform_driver_register(&tegra114_pinctrl_driver);
> +}
> +arch_initcall(tegra114_pinctrl_init);
> diff --git a/drivers/pinctrl/tegra/pinctrl-tegra124.c
> b/drivers/pinctrl/tegra/pinctrl-tegra124.c
> index 57e3cdcf4503..5b07a5834d15 100644
> --- a/drivers/pinctrl/tegra/pinctrl-tegra124.c
> +++ b/drivers/pinctrl/tegra/pinctrl-tegra124.c
> @@ -2080,4 +2080,9 @@ static struct platform_driver tegra124_pinctrl_driver = {
>  	},
>  	.probe = tegra124_pinctrl_probe,
>  };
> -builtin_platform_driver(tegra124_pinctrl_driver);
> +
> +static int __init tegra124_pinctrl_init(void)
> +{
> +	return platform_driver_register(&tegra124_pinctrl_driver);
> +}
> +arch_initcall(tegra124_pinctrl_init);
> diff --git a/drivers/pinctrl/tegra/pinctrl-tegra20.c
> b/drivers/pinctrl/tegra/pinctrl-tegra20.c
> index 624889ed3a9d..1fc82a9576e0 100644
> --- a/drivers/pinctrl/tegra/pinctrl-tegra20.c
> +++ b/drivers/pinctrl/tegra/pinctrl-tegra20.c
> @@ -2277,4 +2277,9 @@ static struct platform_driver tegra20_pinctrl_driver = {
>  	},
>  	.probe = tegra20_pinctrl_probe,
>  };
> -builtin_platform_driver(tegra20_pinctrl_driver);
> +
> +static int __init tegra20_pinctrl_init(void)
> +{
> +	return platform_driver_register(&tegra20_pinctrl_driver);
> +}
> +arch_initcall(tegra20_pinctrl_init);
> diff --git a/drivers/pinctrl/tegra/pinctrl-tegra210.c
> b/drivers/pinctrl/tegra/pinctrl-tegra210.c
> index 0956a1c73391..3e77f5474dd8 100644
> --- a/drivers/pinctrl/tegra/pinctrl-tegra210.c
> +++ b/drivers/pinctrl/tegra/pinctrl-tegra210.c
> @@ -1582,4 +1582,9 @@ static struct platform_driver tegra210_pinctrl_driver = {
>  	},
>  	.probe = tegra210_pinctrl_probe,
>  };
> -builtin_platform_driver(tegra210_pinctrl_driver);
> +
> +static int __init tegra210_pinctrl_init(void)
> +{
> +	return platform_driver_register(&tegra210_pinctrl_driver);
> +}
> +arch_initcall(tegra210_pinctrl_init);
> diff --git a/drivers/pinctrl/tegra/pinctrl-tegra30.c
> b/drivers/pinctrl/tegra/pinctrl-tegra30.c
> index c923ad58af84..10e617003e9c 100644
> --- a/drivers/pinctrl/tegra/pinctrl-tegra30.c
> +++ b/drivers/pinctrl/tegra/pinctrl-tegra30.c
> @@ -2503,4 +2503,9 @@ static struct platform_driver tegra30_pinctrl_driver = {
>  	},
>  	.probe = tegra30_pinctrl_probe,
>  };
> -builtin_platform_driver(tegra30_pinctrl_driver);
> +
> +static int __init tegra30_pinctrl_init(void)
> +{
> +	return platform_driver_register(&tegra30_pinctrl_driver);
> +}
> +arch_initcall(tegra30_pinctrl_init);
