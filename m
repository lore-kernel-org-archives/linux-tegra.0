From: Marcus Folkesson <marcus.folkesson-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2] watchdog: add SPDX identifiers for watchdog subsystem
Date: Tue, 20 Feb 2018 19:45:22 +0100
Message-ID: <20180220184522.GF24311@gmail.com>
References: <20180220104542.32286-1-marcus.folkesson@gmail.com>
 <20180220124955.GA17814@sophia> <20180220132103.GD24311@gmail.com>
 <48db897e-8a61-a5bc-5a61-56349cafaa10@roeck-us.net>
 <20180220153326.GE24311@gmail.com> <20180220181427.GA25467@sophia>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============5431834804691408854=="
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <20180220181427.GA25467@sophia>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: William Breathitt Gray <vilhelm.gray-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org, Baruch Siach <baruch-NswTu9S1W3P6gbPvEgmw2w@public.gmane.org>, Mans Rullgard <mans-2StjZFpD7GcAvxtiuMwx3w@public.gmane.org>, Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>, Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Patrice Chotard <patrice.chotard-qxv4g6HH51o@public.gmane.org>, Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Michael Ellerman <mpe-Gsx/Oe8HsFggBc27wqDAHg@public.gmane.org>, Baoyou Xie <baoyou.xie-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Kevin Hilman <khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Michal Simek <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, Krzysztof Kozlowski <krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Kukjin Kim <kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, Joel Stanley <joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org>, Sylvain Lemieux <slemieux.tyco@gmail.>
List-Id: linux-tegra@vger.kernel.org


--===============5431834804691408854==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="OgApRN/oydYDdnYz"
Content-Disposition: inline


--OgApRN/oydYDdnYz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 20, 2018 at 01:14:27PM -0500, William Breathitt Gray wrote:
> On Tue, Feb 20, 2018 at 04:33:26PM +0100, Marcus Folkesson wrote:
> >On Tue, Feb 20, 2018 at 07:13:43AM -0800, Guenter Roeck wrote:
> >> On 02/20/2018 05:21 AM, Marcus Folkesson wrote:
> >> > Hello William,
> >> >=20
> >> > On Tue, Feb 20, 2018 at 07:49:55AM -0500, William Breathitt Gray wro=
te:
> >> > > On Tue, Feb 20, 2018 at 11:45:31AM +0100, Marcus Folkesson wrote:
> >> > > > - Add SPDX identifier
> >> > > > - Remove boiler plate license text
> >> > > > - If MODULE_LICENSE and boiler plate does not match, go for boil=
er plate
> >> > > >   license
> >> > > >=20
> >> > > > Signed-off-by: Marcus Folkesson <marcus.folkesson-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> >> > > > Acked-by: Adam Thomson <Adam.Thomson.Opensource-WBD+wuPFNBhBDgjK7y7TUQ@public.gmane.org>
> >> > > > Acked-by: Charles Keepax <ckeepax-yzvPICuk2AA4QjBA90+/kJqQE7yCjDx5@public.gmane.org>
> >> > > > Acked-by: Nicolas Ferre <nicolas.ferre-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org>
> >> > > > Acked-by: Michal Simek <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
> >> > > > ---
> >> > > >=20
> >> > > > Notes:
> >> > > >     v2:
> >> > > >     	- Put back removed copyright texts for meson_gxbb_wdt and c=
oh901327_wdt
> >> > > >     	- Change to BSD-3-Clause for meson_gxbb_wdt
> >> > > >     v1: Please have an extra look at meson_gxbb_wdt.c
> >> > >=20
> >> > > [...]
> >> > >=20
> >> > > > diff --git a/drivers/watchdog/ebc-c384_wdt.c b/drivers/watchdog/=
ebc-c384_wdt.c
> >> > > > index 2170b275ea01..c173b6f5c866 100644
> >> > > > --- a/drivers/watchdog/ebc-c384_wdt.c
> >> > > > +++ b/drivers/watchdog/ebc-c384_wdt.c
> >> > > > @@ -1,15 +1,8 @@
> >> > > > +// SPDX-License-Identifier: GPL-2.0
> >> > > > /*
> >> > > >   * Watchdog timer driver for the WinSystems EBC-C384
> >> > > >   * Copyright (C) 2016 William Breathitt Gray
> >> > > >   *
> >
> >The copyright is untouched?
> >
> >> > > > - * This program is free software; you can redistribute it and/o=
r modify
> >> > > > - * it under the terms of the GNU General Public License, versio=
n 2, as
> >> > > > - * published by the Free Software Foundation.
> >> > > > - *
> >> > > > - * This program is distributed in the hope that it will be usef=
ul, but
> >> > > > - * WITHOUT ANY WARRANTY; without even the implied warranty of
> >> > > > - * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See th=
e GNU
> >> > > > - * General Public License for more details.
> >> > > >   */
> >> > > > #include <linux/device.h>
> >> > > > #include <linux/dmi.h>
> >> >=20
> >> > Thank you for your feedback!
> >> > >=20
> >> > > I have no problem with adding a SPDX line to the top of this file,=
 but
> >> > > use "SPDX-License-Identifier: GPL-2.0-only" as I was very intentio=
nal
> >> > > with the selection of GPL version 2 only when I published this cod=
e.
> >> >=20
> >> > SPDX-License-Identifier: GPL-2.0
> >> > Is GPL-2.0 only [1], so it respects your choice of license.
>=20
> Ah, this should be fine then. :)
>=20

Good!

> >> >=20
> >> > >=20
> >> > > Furthermore, please do not remove the existing copyright text; alt=
hough
> >> >=20
> >>=20
> >> It is not a matter if you CAN keep a copyright. You MUST NOT remove a =
copyright.
> >> As long as you do, the series is
> >>=20
> >> Nacked-by: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
> >>=20
> >> Guenter
> >
> >I'm sorry, I do not see where the copyright is removed unless you count
> >the license text as part of the copyright.
> >
> >Can you please point it out?
> >
> >>=20
> >> > The copyright text:
> >> >=20
> >> >   Copyright (C) 2016 William Breathitt Gray
> >> >=20
> >> > Is still in the file.
> >
> >^^^
> >
> >> >=20
> >> >=20
> >> > > it's just boilerplate for some, I was careful with the selection of
> >> > > these words, and I worry the SPDX line only -- despite its useful
> >> > > conciseness -- may lead to misunderstandings about my intentioned
> >> > > license for this code.
> >> >=20
> >> > I'm not sure I understand your concerns here, the SPDX identifier is
> >> > a shorthand for the GPL 2.0 only license. See [1] - Linux kernel lic=
ensing rules.
> >> >=20
> >> > One of the biggest benefits with SPDX identifier is that it is hard =
to verify
> >> > boiler plate licenses due to formatting, types, different formulatio=
ns and so on.
> >> >=20
> >> > If still worrying, I think we could keep the license text as
> >> > well.
>=20
> I'm sorry for the confusion, I should have wrote "license text" rather
> than "copyright text" in my previous message. I agree with the benefits

No problem at all.

> of utilizing the SPDX identifier, and I see the addition of the SPDX
> line as useful, but I would prefer the original license text remain as
> well.

Of course, I will keep the the original license intact for v3.
>=20
> William Breathitt Gray
>=20

Best regards
Marcus Folkesson

--OgApRN/oydYDdnYz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEBVGi6LZstU1kwSxliIBOb1ldUjIFAlqMbL0ACgkQiIBOb1ld
UjJFERAAhuwiBVxCWQs5NKL67h+hidriNHH3ALoXrhBhYQiVIzKyIiNPCHkpf/4C
DmquQEuSbAWQoLN73scR5mBRF74ZTu2Oj+BFvu1KS/oj3xdMm0fWBSBkIhyPIFXp
9pjItNmj3OBhODRP472IRlUxDh9LRnNYL20cpwYpUAVQIrM8HHWDl6W6RH5SKXIf
CcU1L4Y1i7M5Ir+wuc9bhGPBcHtZopQT7MQh2I/gImWdLVfrPObTsk8KpByaZoCe
oWAeZSxJRldTPjL+2X8N7lyabRV/Xvrvg4mJUUFXUfjUY1guIae3xbEMI2Ko/Avu
W0zsXNuBy+37KmW4PTZpIEoK0aaN8vipUBcGmwHYXtTDFHATKxjTugw6+VK2Wpj7
vjnLUXOVTcZFdt+wWJd7rpHaRfUGhG3aBu+fi73AoAzQSSQM8X9blHgk4yJ4VDiv
dzS60EDoWoew3PprwJIo8ytO4SnMBIglBeuiaa+V9NORc5tczwkwUiH6aStr/KEa
+L5OiKgiIVIUU1hAlClazpwF/O6I7KH2RHqIM8oSr7SXas0viPy4IXnwDmwr3wBD
DPeBD79K+Txb+EnKC5D/Z9Wu769rwAZ2TYgMjTQWN8W5hgaXwkB6MJVcJKNmlaxQ
8TRf6C+lhOCazPIbV18ltcQFWBT35DnO2mGWa6lnArJrfBN2zVg=
=N61S
-----END PGP SIGNATURE-----

--OgApRN/oydYDdnYz--


--===============5431834804691408854==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============5431834804691408854==--
