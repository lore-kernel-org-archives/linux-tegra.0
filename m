From: Javier Martinez Canillas <javier@dowhile0.org>
Subject: Re: [PATCH 6/6] pinctrl: tegra: Add driver to configure voltage and
 power state of io pads
Date: Thu, 12 May 2016 15:02:49 -0400
Message-ID: <CABxcv=mFRGWQXTxRYEKMbY3=XvrGL2713kUu9o2M4zgRVCje0Q@mail.gmail.com>
References: <1462191434-28933-1-git-send-email-ldewangan@nvidia.com>
	<1462191434-28933-7-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <1462191434-28933-7-git-send-email-ldewangan@nvidia.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Laxman Dewangan <ldewangan@nvidia.com>
Cc: Stephen Warren <swarren@wwwdotorg.org>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Jon Hunter <jonathanh@nvidia.com>, Thierry Reding <thierry.reding@gmail.com>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Linux Kernel <linux-kernel@vger.kernel.org>, Linux GPIO List <linux-gpio@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

Hello Laxman,

On Mon, May 2, 2016 at 8:17 AM, Laxman Dewangan <ldewangan@nvidia.com> wrote:

[snip]

> diff --git a/drivers/pinctrl/tegra/pinctrl-tegra210-io-pad.c b/drivers/pinctrl/tegra/pinctrl-tegra210-io-pad.c
> new file mode 100644
> index 0000000..ab06c71
> --- /dev/null
> +++ b/drivers/pinctrl/tegra/pinctrl-tegra210-io-pad.c
> @@ -0,0 +1,301 @@
> +/*
> + * Generic ADC thermal driver
> + *

This seems to be a copy and paste error from
drivers/thermal/thermal-generic-adc.c since this is a pinctrl driver.

Best regards,
Javier
