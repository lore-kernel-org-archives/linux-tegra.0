From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v2 3/5] gpio: tegra186: Rename flow variable to type
Date: Fri, 14 Dec 2018 14:36:36 +0100
Message-ID: <20181214133636.GA23379@ulmo>
References: <20181129170312.23625-1-thierry.reding@gmail.com>
 <20181129170312.23625-4-thierry.reding@gmail.com>
 <CACRpkdbuRJ+UAoZkZNtWNzrF2+_0h-ibkTaDXWcPe70yJCx+5w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="Q68bSM7Ycu6FN28Q"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CACRpkdbuRJ+UAoZkZNtWNzrF2+_0h-ibkTaDXWcPe70yJCx+5w@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Thomas Gleixner <tglx@linutronix.de>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, linux-tegra@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org


--Q68bSM7Ycu6FN28Q
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 14, 2018 at 02:34:43PM +0100, Linus Walleij wrote:
> On Thu, Nov 29, 2018 at 6:03 PM Thierry Reding <thierry.reding@gmail.com>=
 wrote:
>=20
> > From: Thierry Reding <treding@nvidia.com>
> >
> > The IRQ core code refers to the interrupt type by that name, whereas the
> > term flow is almost never used. Some GPIO controllers use the term
> > flow_type, but it is most consistent to just go with the IRQ core
> > terminology.
> >
> > Signed-off-by: Thierry Reding <treding@nvidia.com>
>=20
> Patch applied.
>=20
> No need to wait for genirq or other changes to apply this.

The genirq patch was acked by both Thomas and Marc. Were you waiting for
anything else on the rest of this series?

Thierry

--Q68bSM7Ycu6FN28Q
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlwTseEACgkQ3SOs138+
s6F0RRAAkBNay38yWFL3Omkl0uK0DU9odZW3Zn2R+bLQd3M1aAl891/gRC9SUOeR
UGaPR/4s/vmsTj+wQRZbCI/h+Q9B3MWND73H7Myz7Eoa5MbByge0jt8xfTD+7Eii
8ZzbS3vMq7WvDW4fXr4Zoo27p+Ll5fr3QDpCiT+3A6+XhAbnTws1/+eu8Y4WUSJl
bD7w2jZ3BZe+ATLeDsz5RowBIYACxms92jrNke2VF2/nnUx270ezYojje1BnDPHx
R7S9RTkSPKQbOSvwGaFXA35gu48SWjj6xFMFXTCZaabSby9FEx04Ro4j2luTZY1h
m/3zajkLpxG+/VAbxOyXZrLOm9OSh3C049HIgYRtjLbE2Qsp9rMZnOunfI0wHilB
hMkZv3Rti3ooofOVeAQBtyFLKjaYlQtd9o/wU8y1T/nxeFf0imcUZsCGNw+KB8kG
lTrfGz2ML24xA62fiV+CP/goA7WNFH9MfXEEutxLK2WTZwX6wXsoMk3gY+PiahZY
OMNXS1RI6G+/oSn+BT4a9C+bTQxC5rKROVN5XLHsj18030ZF/ugutEHy/y1m/LD5
7v9inda5sdLlDeuckW0pighzujO3DDusebkN4rcHb1WGEnTzz+lrC7gU6zrTHTSJ
tdvwZBQkMvTxzWzRhrg7Va0UhRM8+/EwxHc+t+VI+o/Zoh2FNM8=
=8+uw
-----END PGP SIGNATURE-----

--Q68bSM7Ycu6FN28Q--
