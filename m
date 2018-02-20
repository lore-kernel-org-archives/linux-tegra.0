From: Marcus Folkesson <marcus.folkesson-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2] watchdog: add SPDX identifiers for watchdog subsystem
Date: Tue, 20 Feb 2018 16:33:26 +0100
Message-ID: <20180220153326.GE24311@gmail.com>
References: <20180220104542.32286-1-marcus.folkesson@gmail.com>
 <20180220124955.GA17814@sophia> <20180220132103.GD24311@gmail.com>
 <48db897e-8a61-a5bc-5a61-56349cafaa10@roeck-us.net>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2678663302164243516=="
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <48db897e-8a61-a5bc-5a61-56349cafaa10-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
Cc: linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org, Baruch Siach <baruch-NswTu9S1W3P6gbPvEgmw2w@public.gmane.org>, Mans Rullgard <mans-2StjZFpD7GcAvxtiuMwx3w@public.gmane.org>, Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>, Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, adi-buildroot-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org, Patrice Chotard <patrice.chotard-qxv4g6HH51o@public.gmane.org>, Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Michael Ellerman <mpe-Gsx/Oe8HsFggBc27wqDAHg@public.gmane.org>, Baoyou Xie <baoyou.xie-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Kevin Hilman <khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Michal Simek <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, Krzysztof Kozlowski <krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Kukjin Kim <kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, Joel Stanley <joel@jms.i>
List-Id: linux-tegra@vger.kernel.org


--===============2678663302164243516==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="MiFvc8Vo6wRSORdP"
Content-Disposition: inline


--MiFvc8Vo6wRSORdP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 20, 2018 at 07:13:43AM -0800, Guenter Roeck wrote:
> On 02/20/2018 05:21 AM, Marcus Folkesson wrote:
> > Hello William,
> >=20
> > On Tue, Feb 20, 2018 at 07:49:55AM -0500, William Breathitt Gray wrote:
> > > On Tue, Feb 20, 2018 at 11:45:31AM +0100, Marcus Folkesson wrote:
> > > > - Add SPDX identifier
> > > > - Remove boiler plate license text
> > > > - If MODULE_LICENSE and boiler plate does not match, go for boiler =
plate
> > > >   license
> > > >=20
> > > > Signed-off-by: Marcus Folkesson <marcus.folkesson-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> > > > Acked-by: Adam Thomson <Adam.Thomson.Opensource-WBD+wuPFNBhBDgjK7y7TUQ@public.gmane.org>
> > > > Acked-by: Charles Keepax <ckeepax-yzvPICuk2AA4QjBA90+/kJqQE7yCjDx5@public.gmane.org>
> > > > Acked-by: Nicolas Ferre <nicolas.ferre-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org>
> > > > Acked-by: Michal Simek <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
> > > > ---
> > > >=20
> > > > Notes:
> > > >     v2:
> > > >     	- Put back removed copyright texts for meson_gxbb_wdt and coh9=
01327_wdt
> > > >     	- Change to BSD-3-Clause for meson_gxbb_wdt
> > > >     v1: Please have an extra look at meson_gxbb_wdt.c
> > >=20
> > > [...]
> > >=20
> > > > diff --git a/drivers/watchdog/ebc-c384_wdt.c b/drivers/watchdog/ebc=
-c384_wdt.c
> > > > index 2170b275ea01..c173b6f5c866 100644
> > > > --- a/drivers/watchdog/ebc-c384_wdt.c
> > > > +++ b/drivers/watchdog/ebc-c384_wdt.c
> > > > @@ -1,15 +1,8 @@
> > > > +// SPDX-License-Identifier: GPL-2.0
> > > > /*
> > > >   * Watchdog timer driver for the WinSystems EBC-C384
> > > >   * Copyright (C) 2016 William Breathitt Gray
> > > >   *

The copyright is untouched?

> > > > - * This program is free software; you can redistribute it and/or m=
odify
> > > > - * it under the terms of the GNU General Public License, version 2=
, as
> > > > - * published by the Free Software Foundation.
> > > > - *
> > > > - * This program is distributed in the hope that it will be useful,=
 but
> > > > - * WITHOUT ANY WARRANTY; without even the implied warranty of
> > > > - * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the G=
NU
> > > > - * General Public License for more details.
> > > >   */
> > > > #include <linux/device.h>
> > > > #include <linux/dmi.h>
> >=20
> > Thank you for your feedback!
> > >=20
> > > I have no problem with adding a SPDX line to the top of this file, but
> > > use "SPDX-License-Identifier: GPL-2.0-only" as I was very intentional
> > > with the selection of GPL version 2 only when I published this code.
> >=20
> > SPDX-License-Identifier: GPL-2.0
> > Is GPL-2.0 only [1], so it respects your choice of license.
> >=20
> > >=20
> > > Furthermore, please do not remove the existing copyright text; althou=
gh
> >=20
>=20
> It is not a matter if you CAN keep a copyright. You MUST NOT remove a cop=
yright.
> As long as you do, the series is
>=20
> Nacked-by: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
>=20
> Guenter

I'm sorry, I do not see where the copyright is removed unless you count
the license text as part of the copyright.

Can you please point it out?

>=20
> > The copyright text:
> >=20
> >   Copyright (C) 2016 William Breathitt Gray
> >=20
> > Is still in the file.

^^^

> >=20
> >=20
> > > it's just boilerplate for some, I was careful with the selection of
> > > these words, and I worry the SPDX line only -- despite its useful
> > > conciseness -- may lead to misunderstandings about my intentioned
> > > license for this code.
> >=20
> > I'm not sure I understand your concerns here, the SPDX identifier is
> > a shorthand for the GPL 2.0 only license. See [1] - Linux kernel licens=
ing rules.
> >=20
> > One of the biggest benefits with SPDX identifier is that it is hard to =
verify
> > boiler plate licenses due to formatting, types, different formulations =
and so on.
> >=20
> > If still worrying, I think we could keep the license text as
> > well.
> >=20
> > >=20
> > > For the time being, I can't Ack this patch with the changes it makes
> > > currently:
> > >=20
> > >          Nacked-by: William Breathitt Gray <vilhelm.gray-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> > >=20
> > > William Breathitt Gray
> >=20
> > Please let me know if I got you wrong at some point.
> >=20
> > [1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/=
tree/Documentation/process/license-rules.rst
> >=20
> > Best regards
> > Marcus Folkesson
> >=20
>=20

Best regards
Marcus Folkesson

--MiFvc8Vo6wRSORdP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEBVGi6LZstU1kwSxliIBOb1ldUjIFAlqMP8EACgkQiIBOb1ld
UjI5xBAAzZs/kuzKKdrL/lfJRg3GsiskH1mmB2h/dn54xHjx/uXLIKIbEhqa0tDH
q333ZEflilx0oqgyOn3z05inWR/NJ7PRrMF5sCW0hYJ0iPh/m12ui66fgx12mN0j
f3i1jdH9uKU/HWs5RBo1qNgzzOqHOXQuoq0L7LCHOfNYAUaB0FZfZ5YF/IFdGGYS
ogpeA3pM/vSfLKPiEUw0nIWK/J98BFfj4NaT1rpdPsgmYzMYTrrzDrvGLKWIKGSf
udGGlYJ/k6R8clDmj33mPa5YoBE9iiiGrhZo0tcs/93s44cIFhOGJxkhzAUJAZVl
puwzu7aa5flIGG3MEKk2JCsvkeCYYWgTtYuWUgBN/a/DM92fjRjerCwL4sTz/z4W
AAWzvzwhHkGCpJm6QHX3iALoE2JYNlbcPNGL5pRqwRjyXFQ0k3u/Dv3xdOovy395
79Szv+1fEsQYZGFDgXaOVTJ6WEwLvOVyYTKr9V/tH4QgylQrALR6c4YYmA1q4jZc
rvqEiTIDNYT/uY613ytReA64mkzaqurXOj9A+RndEB/2mZQmU1rONIJzMA5MoD+0
omoJW9Y5mX0KhALPgxfWtC/7mUmp/K9Ocq4BC8EKzHRzoBHpjIaM9Y8fU6jk2aHf
wk6yY29IKXjM/YpcqiXPoqcfHt7KdMRZwSyPiHsljr7xcv6p0so=
=FnNU
-----END PGP SIGNATURE-----

--MiFvc8Vo6wRSORdP--


--===============2678663302164243516==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============2678663302164243516==--
