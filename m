From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2] gpio: Add Tegra186 support
Date: Tue, 14 Mar 2017 16:20:31 +0100
Message-ID: <CACRpkdZ_OZFeHNqr6bWL6H7tAtn2CAMCQ0+7SiwjRSeKFwzYQQ@mail.gmail.com>
References: <20170310162629.31455-1-thierry.reding@gmail.com> <20170313070623.GA15513@ulmo.ba.sec>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170313070623.GA15513-EkSeR96xj6Pcmrwk2tT4+A@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Suresh Mangipudi <smangipudi-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Bartosz Golaszewski <bgolaszewski-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Mon, Mar 13, 2017 at 8:06 AM, Thierry Reding
<thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:

> By the way, I tested this using Bartosz Go=C5=82aszewski's excellent libg=
piod
> that provides a really nice set of userspace utilities to detect and
> manipulate GPIO chips:
>
>         https://github.com/brgl/libgpiod
>
> So for userspace access to the Tegra GPIOs we can now run something like
> this in a shell script:
>
>         #!/bin/sh
>         gpio=3D$(gpiofind PCC.00)
>         gpioget $gpio
>
> There's a bunch of other features that the library supports. I'm glad we
> finally have a standard set of tools to deal with GPIOs in userspace.

I share your high appraisal of this library, Bartosz work is really importa=
nt
for consolidating this mess to something we can contain.

> It
> seems the internet is full of libraries that deal with the GPIO sysfs
> interface,

I do not advocate Internet censorship, but ... ;)

The world should be purged from them all.

Yours,
Linus Walleij
