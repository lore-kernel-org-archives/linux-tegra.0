From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH v1 4/5] gpio: max77620: Don't handle disabled interrupts
Date: Wed, 8 Jul 2020 13:11:02 +0300
Message-ID: <CAHp75VcEqTJxPj1pETC9eUsZCLwpv8tyZ7EjKvzzJTQ4wfKJyg@mail.gmail.com>
References: <20200708082634.30191-1-digetx@gmail.com> <20200708082634.30191-5-digetx@gmail.com>
 <CAHp75VcqkmywShtOVQhEw3qwbDCHjPKeQDYWxZiq+Cvx2_QCwA@mail.gmail.com> <68df4805-daf9-91c5-d755-53abc8823654@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <68df4805-daf9-91c5-d755-53abc8823654@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>
Cc: Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Laxman Dewangan <ldewangan@nvidia.com>, Bartosz Golaszewski <bgolaszewski@baylibre.com>, Linus Walleij <linus.walleij@linaro.org>, linux-tegra@vger.kernel.org, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

On Wed, Jul 8, 2020 at 12:19 PM Dmitry Osipenko <digetx@gmail.com> wrote:
> 08.07.2020 11:46, Andy Shevchenko =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> > On Wed, Jul 8, 2020 at 11:29 AM Dmitry Osipenko <digetx@gmail.com> wrot=
e:
> >>
> >> Check whether GPIO IRQ is enabled before proceeding with handling the
> >> interrupt request. The interrupt handler now returns IRQ_NONE if none
> >> of interrupts were handled, which is usually a sign of a problem.
> >
> > ...
> >
> >> -       pending =3D value;
> >> +       pending =3D value & gpio->irq_enb_mask;
> >
> >> +       if (!pending)
> >> +               return IRQ_NONE;
> >
> > for_each_set_bit() should take care of it, no?
>
> Do you mean that the handle_nested_irq() takes care of handling
> unrequested interrupts? Actually, looks like it cares. Alright, I'll
> drop this patch since it should be unnecessary. Thank you for the comment=
!

I think it's still good to have reduced IRQs to handle by dropping not
enabled ones, my comment was about the case when pending =3D=3D 0. Sorry
if it was unclear.

> > (and probably return with IRQ_RETVAL() macro)
> >
> >>         for_each_set_bit(offset, &pending, MAX77620_GPIO_NR) {
> >>                 unsigned int virq;

--=20
With Best Regards,
Andy Shevchenko
