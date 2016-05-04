From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v3 1/2] usb: host: ehci-tegra: Grab the correct UTMI pads
 reset
Date: Wed, 4 May 2016 22:30:45 +0200
Message-ID: <20160504203037.GC21480@mithrandir.ba.sec>
References: <1462372800-30900-1-git-send-email-thierry.reding@gmail.com>
 <572A2E0A.8040408@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="XWOWbaMNXpFDWE00"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <572A2E0A.8040408-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--XWOWbaMNXpFDWE00
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 04, 2016 at 11:14:50AM -0600, Stephen Warren wrote:
> On 05/04/2016 08:39 AM, Thierry Reding wrote:
> > From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> >=20
> > There are three EHCI controllers on Tegra SoCs, each with its own reset
> > line. However, the first controller contains a set of UTMI configuration
> > registers that are shared with its siblings. These registers will only
> > be reset as part of the first controller's reset. For proper operation
> > it must be ensured that the UTMI configuration registers are reset
> > before any of the EHCI controllers are enabled, irrespective of the
> > probe order.
> >=20
> > Commit a47cc24cd1e5 ("USB: EHCI: tegra: Fix probe order issue leading to
> > broken USB") introduced code that ensures the first controller is always
> > reset before setting up any of the controllers, and is never again reset
> > afterwards.
> >=20
> > This code, however, grabs the wrong reset. Each EHCI controller has two
> > reset controls attached: 1) the USB controller reset and 2) the UTMI
> > pads reset (really the first controller's reset). In order to reset the
> > UTMI pads registers the code must grab the second reset, but instead it
> > grabbing the first.
> >=20
> > Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> > ---
> > Stephen, Alex, Jon, have you ever encountered cases where UTMI might not
> > have worked correctly? It seems that this code was pulsing the wrong
> > reset line and therefore the UTMI pads would never be reset unless the
> > first USB controller was probed before all others. I've never seen any
> > such problems myself, so I'm unsure about whether it's worth Cc'ing the
> > patch to stable-u79uwXL29TaiAVqoAR/hOA@public.gmane.org
>=20
> I don't think I recall seeing USB issues like that, although I don't use =
USB
> a huge amount. Perhaps the issue just never happens because we always have
> USB1 enabled, and it's physically present in the DTB first, so it always
> happens to get probed first?

Actually for Jetson TK1 we don't enable USB1. It's interesting because
v1 of patch 2/2 only fixed the issue for device where USB1 was indeed
enabled and probed first (I tested on TrimSlice). Running these fixes
through EIMT I noticed that it didn't fix it in the general case and I
was still seeing the warning on Jetson TK1 for example.

That's in fact what tipped me off about the consumer name, because I was
seeing reset 58 (USB2) being requested twice.

Thierry

--XWOWbaMNXpFDWE00
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJXKlvtAAoJEN0jrNd/PrOhheAP/3m+iyvGsllSrqCN/p+VhFVs
nrBCZ8HkkCbGFQDWedpxAIHkolPKFfppGOcvYxQQYrqGnDbzpPSlXlgwARAA9rjy
S+TbzjTG3UDr6H6mgeoZIFPeb4AQJlU3s2i0jsIlMfqPnlLHSIVkNa0cXdR8Qmho
FSDQ8oerglAHBiwT5GwXzjKhSMpIzfngRxbugI5hWIEE8WffU7C6yQZnfSk9QMar
eYipAyGuBQiP0kJBgbX98J+/ypylwns0Cnu4yktNEYg/iY5aVu0lIhwYJMA6L7+g
qQLtumI/es6fkiyLwiSLG7Absl9YBJrQxia3tN2PgsSfizVB+88IAWEiE2lLGfPL
cfooKGI+MtJgoBaJbq6fpzq8UIGteSRE9ZEI+xzqdX6froIWqZbFoaSloNtC8mqJ
EzGTZW+gJaLJMm57d1uClwuIo+d1qOcP3HgvlwBjHzVG6GJ2yuPnK+FmvMP57Az/
XKhNTo/Qy1P5cziH9L4rIRQ5Yb1+kIOmHVq4COFu1zauySdXZYrDD0+/jEe/KiSp
z+Sk1vAFi2ccM7fvEoKOKbmS43/McDcNPNkpLPDw+hjephUaxvHnI6A+mMMQEp5E
Q4JMFGJ/mSZx1LUqabMdGt9m6/GGxHVOeHowQ2c9ubnqNxR5GICXm6eZDwTkVVoz
2ZW5jmwaJTYrwhcoXjt1
=S7BZ
-----END PGP SIGNATURE-----

--XWOWbaMNXpFDWE00--
