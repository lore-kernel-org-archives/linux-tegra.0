From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/3] dt-bindings: mfd: Document the RTC present on
 MAX77620
Date: Fri, 8 May 2020 13:02:26 +0200
Message-ID: <20200508110226.GA3034719@ulmo>
References: <20200417170825.2551367-1-thierry.reding@gmail.com>
 <20200430140701.GA21776@bogus>
 <20200430141520.GA101194@piout.net>
 <CAL_Jsq+HzG8QT+kHUjqC8joDxfm1WM+N_F1ZwYXg7cL5faGxVA@mail.gmail.com>
 <20200501135309.GC51277@piout.net>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="sm4nu43k4a2Rpi4c"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20200501135309.GC51277-m++hUPXGwpdeoWH0uzbU5w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alexandre Belloni <alexandre.belloni-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>
Cc: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Alessandro Zummo <a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org>, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "open list:REAL TIME CLOCK (RTC) SUBSYSTEM" <linux-rtc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-tegra <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--sm4nu43k4a2Rpi4c
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 01, 2020 at 03:53:09PM +0200, Alexandre Belloni wrote:
> On 01/05/2020 08:00:11-0500, Rob Herring wrote:
> > > I don't think this is true because in the case of a discrete RTC, its
> > > interrupt pin can be connected directly to a PMIC to power up a board
> > > instead of being connected to the SoC. In that case we don't have an
> > > interrupt property but the RTC is still a wakeup source. This is the
> > > usual use case for wakeup-source in the RTC subsystem. Else, if there=
 is
> > > an interrupt, then we assume the RTC is a wakeup source and there is =
no
> > > need to have the wakeup-source property.
> >=20
> > Yes, that would be an example of "unless the wakeup mechanism is
> > somehow not an interrupt". I guess I should add not an interrupt from
> > the perspective of the OS.
> >=20
> > So if the wakeup is self contained within the PMIC, why do we need a
> > DT property? The capability is always there and enabling/disabling
> > wakeup from it is userspace policy.
> >=20
>=20
> Yes, for this particular case, I'm not sure wakeup-source is actually
> necessary. If the interrupt line is used to wakeup the SoC, then the
> presence of the interrupts property is enough to enable wakeup.

So yes, the wakeup-source property isn't necessary. The goal of patches
1 and 2 was to allow the RTC to be actually disabled as a wakeup-source
in case it didn't work as intended. But since the RTC is enabled as a
wakeup source on these PMICs by default, the idea was to add a new sub-
node for the RTC and required the wakeup-source in that subnode if that
subnode was present.

That said, patch 3 actually does make the RTC work as a wakeup source
on the particular board that I tested this, so patches 1 and 2 are no
longer really required from my point of view.

Do you want me to send patch 3/3 again separately or can you pick it up
=66rom this series?

Thanks,
Thierry

--sm4nu43k4a2Rpi4c
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl61PD8ACgkQ3SOs138+
s6GV8BAAgLR4lg0g62qMQgR8ZL2stOQFzJoRTr3EOif7vMW34wGNJxEkGewzJGN0
eEuXOqMN5x0bVIqbb1/xETy7P6/38SOUx6PwaaxuFCVCi+XjCdg5lqoYSliMaUcC
LWZnojhwjBiEb5MyesMgZPtAq9zoimroASiCC2MMgadKefm3qhO6dF5l3L46Mscl
63NpGDbQVhmXCzASor/+yzV+x6SjpzFSL61J2bUuaovMcWSBljsiLtMu5z3m39f8
UeQ3brtGLDlXRHMNfPNt9+F7Wtd7oUyfhAhu5lSS2ukSVSZgoID1fX3ctBlunGn/
U/Ou0jaefIItGRTsENY+7sebpZoQeeo6x0/BYE2rPFPw5Nle4u7QYw5WIIFG2U1p
+Ijti2WHSAt3jgWc0pw1LiCMPpmJ+BGQ//ceT3X1Fca4z4tNERcRbR4eJqjPuRV8
GQKsjPYP1kmaxDPtZpPoq9LCizS1dkITkFCl3PlFbEIJt1tF6nOn0XaYSd43LCBZ
zP82oKrtnWFH0+mob1WgZ5zIs5Z5Azhua4Ad7+SVl0m0tGQEncH2u0xV3yGd2yJl
KUiJZY0CWad3b32pKSPhZY7hHzXN26XsnCQH7YqhWoKdR5b6d4Z9zcBTUpK1uezY
0PCUNKzTTvMJHsJR2lMeoNNSNu6sCCEz8CPj+2FPHZXvALC/354=
=L+Q9
-----END PGP SIGNATURE-----

--sm4nu43k4a2Rpi4c--
