From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpiolib: probe deferral error reporting
Date: Sun, 29 Jul 2018 22:49:12 +0200
Message-ID: <CACRpkdZSb--nGAR2DVfBgqmQTv=S_sBjLTfJiKHzG2GyfJ6jEw@mail.gmail.com>
References: <20180720075449.26711-1-marcel@ziswiler.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180720075449.26711-1-marcel@ziswiler.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Marcel Ziswiler <marcel@ziswiler.com>
Cc: "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, linux-tegra@vger.kernel.org, Marcel Ziswiler <marcel.ziswiler@toradex.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

On Fri, Jul 20, 2018 at 9:54 AM Marcel Ziswiler <marcel@ziswiler.com> wrote:

> From: Marcel Ziswiler <marcel.ziswiler@toradex.com>
>
> Actually report the error code from devm_regulator_get() which may as
> well just be a probe deferral.
>
> This is e.g. what one gets upon booting a Colibri T20:
>
> gpiochip_add_data_with_key: GPIOs 0..223 (tegra-gpio) failed to register
>
> Signed-off-by: Marcel Ziswiler <marcel.ziswiler@toradex.com>

Makes perfect sense.
Patch applied.

Yours,
Linus Walleij
