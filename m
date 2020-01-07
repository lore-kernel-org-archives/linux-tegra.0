From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: Re: [PATCH v1 0/3] Tegra GPIO: Minor code clean up
Date: Tue, 7 Jan 2020 09:25:47 +0100
Message-ID: <CAMpxmJVi1hy6a72M7rAHP0AXW1Z4cGp8H0O6ayLMwFm9UL3WPQ@mail.gmail.com>
References: <20191215183047.9414-1-digetx@gmail.com> <CACRpkdYAKS50-CNmE0nRNQanFxKejoHrwxho3fZXROoLZUb4+Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CACRpkdYAKS50-CNmE0nRNQanFxKejoHrwxho3fZXROoLZUb4+Q@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Dmitry Osipenko <digetx@gmail.com>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, linux-tegra@vger.kernel.org, devel@driverdev.osuosl.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

pon., 6 sty 2020 o 23:59 Linus Walleij <linus.walleij@linaro.org> napisa=C5=
=82(a):
>
> On Sun, Dec 15, 2019 at 7:31 PM Dmitry Osipenko <digetx@gmail.com> wrote:
>
> > I was investigating why CPU hangs during of GPIO driver suspend and in
> > the end it turned out that it is a Broadcom WiFi driver problem because
> > it keeps OOB wake-interrupt enabled while WLAN interface is DOWN and th=
is
> > may cause a bit weird CPU hang on writing to INT_ENB register during of
> > GPIO driver suspend. Meanwhile I also noticed that a few things could b=
e
> > improved in the driver, that's what this small series addresses.
> >
> > Dmitry Osipenko (3):
> >   gpio: tegra: Use generic readl_relaxed/writel_relaxed accessors
> >   gpio: tegra: Properly handle irq_set_irq_wake() error
> >   gpio: tegra: Use NOIRQ phase for suspend/resume
>
> All three patches applied with Thierry's review/test tag.
>
> Yours,
> Linus Walleij

Ugh, I now noticed I responded to Thierry only after applying this to my tr=
ee.

Anyway, it shouldn't be a problem. I'll take more care next time.

Bart
