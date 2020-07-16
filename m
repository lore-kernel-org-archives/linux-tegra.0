From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 2/2] PCI: tegra: Remove PLL power supplies
Date: Thu, 16 Jul 2020 17:06:46 +0200
Message-ID: <20200716150646.GA545089@ulmo>
References: <20200623145528.1658337-1-thierry.reding@gmail.com>
 <20200623145528.1658337-2-thierry.reding@gmail.com>
 <20200716130034.GE535268@ulmo>
 <20200716140704.GA20249@e121166-lin.cambridge.arm.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="wac7ysb48OaltWcw"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20200716140704.GA20249-LhTu/34fCX3ZROr8t4l/smS4ubULX0JqMm0uRHvK7Nw@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lorenzo Pieralisi <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>
Cc: Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--wac7ysb48OaltWcw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 16, 2020 at 03:07:13PM +0100, Lorenzo Pieralisi wrote:
> On Thu, Jul 16, 2020 at 03:00:34PM +0200, Thierry Reding wrote:
> > On Tue, Jun 23, 2020 at 04:55:28PM +0200, Thierry Reding wrote:
> > > From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> > >=20
> > > The Tegra PCI controller driver doesn't need to control the PLL power
> > > supplies directly, but rather uses the pads provided by the XUSB pad
> > > controller, which in turn is responsible for supplying power to the
> > > PLLs.
> > >=20
> > > Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> > > ---
> > >  drivers/pci/controller/pci-tegra.c | 10 ++--------
> > >  1 file changed, 2 insertions(+), 8 deletions(-)
> >=20
> > Hi Lorenzo,
> >=20
> > do you have any comments on this? Can we get this into v5.9?
>=20
> Yes we can if Rob is happy with patch (1).

I think this is mostly orthogonal to the bindings. We're already
controlling these supplies from the UPHY driver and controlling them
=66rom the PCI driver is completely broken.

So I think technically these two patches could be applied separately,
but it's fine if you want to wait for Rob's feedback.

Thierry

--wac7ysb48OaltWcw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl8QbQMACgkQ3SOs138+
s6Gcvg//cOAT8pJ9LKNRJ3twRZzbatCBhch3tZEvcliE7vnaM2Rj5L8Y1fi5dz/6
ShACh/Lviksy5uqzxd57lAwABYm/ZrQ9MnjIVETcdPjQRYnPsFYUFqyqeyfu5PtI
50Uh1+7q4S+KuE8lzxFOwLTcxn2soJGCAgj15W38Dr/+BKSr++5QhJscSm3l17xY
j2MXGi9D8gkXfiEIV2puoJLIkNZBn2NkcuW6H3vYlEYeTy36jzIwgaZt8wnCes+G
X/qfEBj0YMkvW1utifn4KPyG6+Ib4oqkkVgMFmA6spoUuSgSRDPlM62Bq/5HKth4
hNSbpzKr48Zq+3/teiRmgyfDrz/M1IraVNq7LZYiMpByZnbBkd8xx6TymbHyv/FF
ry7jBOVjSgO6/G/h+45R3SM8U8LEdjPC65iC+W/Lgr5ZJjqV0gZlhi5oXkFeJ62O
1iWjg1SH0mGyU7eGaEUOwNEyB5BrPplOZZU12jlRtPd9UfZNd2aynwdWH05fBkTW
4ZRuQx3ek/UKDy2bm6vEh3xQM84ZWpO9UrWA/0TcsU+IUNbeFmLqVmHH1qxsaV+H
Cm16hWzX1/ZBm6pxteGFc0kJc/Bwl1uMr/EROPxadBCCpn7fmaSV1l5P9Hpo9mnH
llvFGYQeskTZx8DW62uJY3CU0fjC2gGYvDQxgRPnFUREPm/+enM=
=AVWD
-----END PGP SIGNATURE-----

--wac7ysb48OaltWcw--
