From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [RFC/RFT PATCH 1/3] gpio: tegra: remove gpio_to_irq() from hw irq handlers
Date: Tue, 1 Aug 2017 09:49:14 +0200
Message-ID: <CACRpkdYoTZHsGbnpoam59XBhD-_AmCP8p96AzQbp-KDoKOdaQA@mail.gmail.com>
References: <20170708224413.18281-1-grygorii.strashko@ti.com> <20170708224413.18281-2-grygorii.strashko@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170708224413.18281-2-grygorii.strashko@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Grygorii Strashko <grygorii.strashko@ti.com>
Cc: Robert Jarzmik <robert.jarzmik@free.fr>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, Jerome Brunet <jbrunet@baylibre.com>
List-Id: linux-tegra@vger.kernel.org

On Sun, Jul 9, 2017 at 12:44 AM, Grygorii Strashko
<grygorii.strashko@ti.com> wrote:

> gpio_to_irq() API expected to be used by GPIO consumers and
> not drivers and there are no guarantee that its gpiolib implementation
> is irq safe.
>
> Signed-off-by: Grygorii Strashko <grygorii.strashko@ti.com>

Patch applied.

This is obviously the right way to do it.

Tegra people: please test.

Yours,
Linus Walleij
