From: Tony Lindgren <tony-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [RFC 1/3] pinctrl: add a driver for NVIDIA Tegra
Date: Sun, 11 Dec 2011 11:36:25 -0800
Message-ID: <20111211193625.GE31337@atomide.com>
References: <1323382390-14892-1-git-send-email-swarren@nvidia.com>
 <1323382390-14892-2-git-send-email-swarren@nvidia.com>
 <CACRpkdYDn0V7SeQuFiFDMxGkybvg6PGf7jxid8ECGB7Azkj3zw@mail.gmail.com>
 <20111209170722.GO31337@atomide.com>
 <CACRpkdaco=967cKHUcj9VNKc_HyT7Mw30Z9HVdfgsUsHbps8bQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CACRpkdaco=967cKHUcj9VNKc_HyT7Mw30Z9HVdfgsUsHbps8bQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

* Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> [111209 15:17]:
> On Fri, Dec 9, 2011 at 6:07 PM, Tony Lindgren <tony-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org> wrot=
e:
>=20
> > - We currently have hard time supporting pin groups with pins
> > =C2=A0coming from multiple pinmux driver instances
>=20
> Pin groups are per definiton per-controller inctance. That is a
> given side effect of not having a global pin space.
>=20
> But you can create two groups of the same name on two
> pin controllers so that e.g. pinctrl.0 and pinctrl.1 have
> a group named "foo", then map both to a certain device
> in the board pinmux map.
>=20
> You will have to request them individually however, like
> with two hogs or two pinmux_get() calls specifying the
> name of each map, else you will just get the first one.
>=20
> Not that I've tried it, but that's how it's supposed to work...

Yes a little bit of trickery is needed there, I'll look into
it more as we already have two controller instances on omap4.

Regards,

Tony
