From: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: Re: [PATCH v2 4/5] drm/tegra: Implement VBLANK support
Date: Mon, 11 Feb 2013 10:08:40 +0100
Message-ID: <20130211090840.GB3423@avionic-0098.mockup.avionic-design.de>
References: <1358179560-26799-1-git-send-email-thierry.reding@avionic-design.de>
 <1358179560-26799-5-git-send-email-thierry.reding@avionic-design.de>
 <50FECE63.7090009@tuebingen.mpg.de>
 <1358879999.1540.22.camel@tellur>
 <CADWT_cOjVg9-hB+jWuEUr+Ou-YECBN73WQXNy17qXf3TO1ZjpQ@mail.gmail.com>
 <50FEEF92.9060009@tuebingen.mpg.de>
 <50FF990C.3040902@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="BwCQnh7xodEAoBMC"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <50FF990C.3040902-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Terje =?utf-8?Q?Bergstr=C3=B6m?= <tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Mario Kleiner <mario.kleiner-TdbV1Z3I5XE0NhjG498hmQ@public.gmane.org>, Jon Mayo <jon-MQ+mZzckBGs@public.gmane.org>, Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--BwCQnh7xodEAoBMC
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 23, 2013 at 10:02:20AM +0200, Terje Bergstr=C3=B6m wrote:
> On 22.01.2013 21:59, Mario Kleiner wrote:
> > The current swap scheduling is based on having an accurate software=20
> > vblank counter. Atm. that counter is maintained in software, incremente=
d=20
> > during vblank irq. At irq off -> on transition we need a hw counter to=
=20
> > reinitialize. And there is a timeout between dropping the last referenc=
e=20
> > to a counter via drm_vblank_put() and actually disabling the vblank irq=
=2E=20
> > If the timeout is long enough and a timing sensitive app is aware that=
=20
> > vblank counters may be inaccurate/unreliable over long time periods, it=
=20
> > can work around the problem.
>=20
> We have a hardware counter that can be used as VBLANK counter - host1x
> sync point register numbers 26 and 27. tegradrm already sets them up in
> dc init (DC_CMD_CONT_SYNCPT_VSYNC). Basic syncpt support (read, wait) is
> part of my patch set to implement 2D acceleration.

Are the syncpoints incremented even if the VBLANK interrupts are turned
off? If that's the case they could indeed be used as a hardware counter
rather than the fake approach used right now.

Maybe we should leave the code as it is right now and fix that up once
the syncpoint support has been merged.

Thierry

--BwCQnh7xodEAoBMC
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iQIcBAEBAgAGBQJRGLUYAAoJEN0jrNd/PrOhF4EP+wf103itUvBGfDW0lOPBZYTQ
ohWrpUQwW6MLvO1UOzdT4NBNM0k3TjuGh29aHQU0iVdbzcXzFHLrRW1p6vqtXA5B
kQygcso6dlUWG/CQifToG3a4oOrtKBWgSYJQSp8JjqOY/fwTp1dRHUAdRbo+rtpW
/silQnlHydVsPby9bPZ+49bHBBJEELfY3pSJS5pQTnbgeVgbC8ACOhEdYOjFYkTu
Dn2dMsJUvLvz1LwF7R9gxbISaLagQOc/B+fmRDCWpksWoxOGj/S0of9lPSW6ySQ1
NbzCZ747BUkWUbRrCXS1F9AWoMacG7aLx563MjrhWGC/CFri6JVyLlJ8x+X1LHsl
18vuqztijkIVeGR5ukmC6bTApPk4A1h/bqaBe/28/vQ1tAf12jvQDInoZ0l1i9SX
f8Km6OLNZxO7uviTiC7ofcN9C/ye7W5coRalrzorKIr6TRE+CnyZbuZ26L3ImxGZ
QFJqg5Va3yf5NysKMMVGzcjmU30zlpBAwLjetR3cgF36ILQg2DQR/fvZmr1A+N+z
Ongh9wyzlXwmXQ1Zw5NtJhW0P189b5BSsk2bB2d5Vr3eUAmJclxosvkE+zUkp+JH
avhAo8H/prv6F3MOzDIrUdprFuPiWknYnDy8V8Rey4mVqpuC0p44mivo5HhdI8YJ
uE2Naha8nO7uiNhyjCO6
=Aelp
-----END PGP SIGNATURE-----

--BwCQnh7xodEAoBMC--
