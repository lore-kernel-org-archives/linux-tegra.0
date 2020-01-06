From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v1] gpio: max77620: Add missing dependency on GPIOLIB_IRQCHIP
Date: Tue, 7 Jan 2020 00:02:45 +0100
Message-ID: <CACRpkdZK7hvqri9NwvWfiittb2+JKJCyutP6MfBZpThJD13CWw@mail.gmail.com>
References: <20200106015154.12040-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20200106015154.12040-1-digetx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>
Cc: Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Bartosz Golaszewski <bgolaszewski@baylibre.com>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, linux-tegra@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

On Mon, Jan 6, 2020 at 2:52 AM Dmitry Osipenko <digetx@gmail.com> wrote:

> Driver fails to compile in a minimized kernel's configuration because of
> the missing dependency on GPIOLIB_IRQCHIP.
>
>  error: =E2=80=98struct gpio_chip=E2=80=99 has no member named =E2=80=98i=
rq=E2=80=99
>    44 |   virq =3D irq_find_mapping(gpio->gpio_chip.irq.domain, offset);
>
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>

Patch applied for fixes, thanks!

Yours,
Linus Walleij
