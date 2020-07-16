From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v4 0/6] Improvements for MAX77620 GPIO driver
Date: Thu, 16 Jul 2020 10:52:26 +0200
Message-ID: <CACRpkdZNLDgsrPRenyvPZD6A+Wvj-P3AJBf5Ke-uY9=R9DyjxQ@mail.gmail.com>
References: <20200709171203.12950-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <20200709171203.12950-1-digetx@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>
Cc: Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Laxman Dewangan <ldewangan@nvidia.com>, Bartosz Golaszewski <bgolaszewski@baylibre.com>, Andy Shevchenko <andy.shevchenko@gmail.com>, linux-tegra@vger.kernel.org, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

On Thu, Jul 9, 2020 at 7:12 PM Dmitry Osipenko <digetx@gmail.com> wrote:

> This series addresses a problem that I discovered on Nexus 7 device where
> GPIO interrupts may be left enabled after bootloader and the driver isn't
> prepared to this. It also makes a small improvements to the code, fixes the
> non-released interrupt bug and converts driver to use irqchip template.
>
> Changelog:
>
> v4: - Added stable-tag to the patch "Fix missing release of interrupt".

This v4 series applied, thanks a *LOT* for your patient work on this!

I need to fix the USB port on my Nexus 7 so I can test how the
mainline support is working these days!

Yours,
Linus Walleij
