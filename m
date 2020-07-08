From: Andy Shevchenko <andy.shevchenko-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v1 4/5] gpio: max77620: Don't handle disabled interrupts
Date: Wed, 8 Jul 2020 18:31:21 +0300
Message-ID: <CAHp75VcsvvsmcW_hSRv-mg3v5Z_7c0S-r7WNVOVi-70dE_LvmQ@mail.gmail.com>
References: <20200708082634.30191-1-digetx@gmail.com> <20200708082634.30191-5-digetx@gmail.com>
 <CAHp75VcqkmywShtOVQhEw3qwbDCHjPKeQDYWxZiq+Cvx2_QCwA@mail.gmail.com>
 <68df4805-daf9-91c5-d755-53abc8823654@gmail.com> <CAHp75VcEqTJxPj1pETC9eUsZCLwpv8tyZ7EjKvzzJTQ4wfKJyg@mail.gmail.com>
 <d39caa8f-816c-5d4d-6f54-99baea3e0d5a@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <d39caa8f-816c-5d4d-6f54-99baea3e0d5a-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Bartosz Golaszewski <bgolaszewski-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "open list:GPIO SUBSYSTEM" <linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Wed, Jul 8, 2020 at 1:54 PM Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> 08.07.2020 13:11, Andy Shevchenko =D0=BF=D0=B8=D1=88=D0=B5=D1=82:

...

> It should be unnecessary since we now see that the handle_nested_irq()
> checks whether interrupt was requested and if it wasn't, then particular
> GPIO interrupt will be treated as spurious [1]. The pending =3D=3D 0
> condition is an extreme case, I don't think that there is a need to
> optimize it without any good reason.
>
> [1] https://elixir.bootlin.com/linux/v5.8-rc3/source/kernel/irq/chip.c#L4=
85
>
> Hence it should be better to drop this patch.

Fine with me, thanks!

--=20
With Best Regards,
Andy Shevchenko
