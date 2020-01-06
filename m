From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v1 0/3] Tegra GPIO: Minor code clean up
Date: Mon, 6 Jan 2020 23:59:01 +0100
Message-ID: <CACRpkdYAKS50-CNmE0nRNQanFxKejoHrwxho3fZXROoLZUb4+Q@mail.gmail.com>
References: <20191215183047.9414-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191215183047.9414-1-digetx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>
Cc: Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Bartosz Golaszewski <bgolaszewski@baylibre.com>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, linux-tegra@vger.kernel.org, devel@driverdev.osuosl.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

On Sun, Dec 15, 2019 at 7:31 PM Dmitry Osipenko <digetx@gmail.com> wrote:

> I was investigating why CPU hangs during of GPIO driver suspend and in
> the end it turned out that it is a Broadcom WiFi driver problem because
> it keeps OOB wake-interrupt enabled while WLAN interface is DOWN and this
> may cause a bit weird CPU hang on writing to INT_ENB register during of
> GPIO driver suspend. Meanwhile I also noticed that a few things could be
> improved in the driver, that's what this small series addresses.
>
> Dmitry Osipenko (3):
>   gpio: tegra: Use generic readl_relaxed/writel_relaxed accessors
>   gpio: tegra: Properly handle irq_set_irq_wake() error
>   gpio: tegra: Use NOIRQ phase for suspend/resume

All three patches applied with Thierry's review/test tag.

Yours,
Linus Walleij
