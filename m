From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: of: Restrict enable-gpio quirk to regulator-gpio
Date: Thu, 21 Feb 2019 13:09:57 +0100
Message-ID: <CACRpkdbf4d3MMfZZh39ka9JVX57zNuVoX9xAqE7SKJ-u27QYqA@mail.gmail.com>
References: <20190220105214.26618-1-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190220105214.26618-1-thierry.reding@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>, Marek Vasut <marek.vasut@gmail.com>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, linux-tegra@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

On Wed, Feb 20, 2019 at 11:52 AM Thierry Reding
<thierry.reding@gmail.com> wrote:

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

Patch applied with Marek's tested-by, thanks for thorough commit
message and helping out in sorting out this mess we've built
up over the years.

Yours,
Linus Walleij
