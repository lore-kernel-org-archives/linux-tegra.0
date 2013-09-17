From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 0/9] of/irq: Defer interrupt reference resolution
Date: Tue, 17 Sep 2013 14:43:01 +0200
Message-ID: <20130917124300.GB6757@ulmo>
References: <1379320326-13241-1-git-send-email-treding@nvidia.com>
 <52383B07.5030806@free-electrons.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="1LKvkjL3sHcu1TtY"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <52383B07.5030806-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--1LKvkjL3sHcu1TtY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 17, 2013 at 01:20:39PM +0200, Alexandre Belloni wrote:
> Hi Thierry,
>=20
> On 16/09/2013 10:31, Thierry Reding wrote:
> > Hi,
> >
> > This small series allows interrupt references from the device tree to be
> > resolved at driver probe time, rather than at device creation time. The
> > current implementation resolves such references while devices are added
> > during the call to of_platform_populate(), which happens very early in
> > the boot process. This causes probe ordering issues, because all devices
> > that are an interrupt parent for other devices need to have been probed
> > by that time. This is worked around for primary interrupt controllers by
> > initializing them using a device tree specific way (of_irq_init()), but
> > it doesn't work for something like a GPIO controller that is itself a
> > platform device and an interrupt parent for other devices at the same
> > time.
[...]
> I believe this will solve the issue I was hitting back in June where
> of_i2c_register_devices() failed to get the IRQ while doing it at probe
> time was working fine:
>=20
> http://www.spinics.net/lists/linux-i2c/msg12523.html
>=20
> I couldn't test your patches yet though. I'll try to test as soon as I
> get some free time.

Yes, this series precisely aims at fixing situations as those. It'd be
great if you could give the series a spin to verify that it really works
for your case.

Thierry

--1LKvkjL3sHcu1TtY
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.21 (GNU/Linux)

iQIcBAEBAgAGBQJSOE5UAAoJEN0jrNd/PrOh3voP/1hw9WEb6DSu58FjkPwBUHq9
hTmxcJnZu17WBZenis03iBhLbriJkARhFifMNEGsVtPF2lw7hIq56r1edgzX5iC+
ktSmzJoR2D51SDdwxYPTtJRtJKX6DF6TC1s6rGBVZsuwK+R2aIBwmHB6lDaQQcOG
a8phB8yCknKBAGE7RJ4rIzesltd3z7SjMuhha7x10pYCMxjhgGnQ4AqG2SXdcMwZ
bGak47drOWWvVrjQvZ+fjmy309rK79SoWfpvRPTL06erWHsrSLQRyGBew+uZQmt0
G6iIHcxr9MUeO2WtQeLkb2E3nIPzBNaADT/M1Ow+VNhSIILW6rSBVIlD+EstROp6
hXvrohTJp5i4NJjAD/Y/71lPLpUH8S0+DGh8xv/cK1HbE56XImPqraVn9vuY+8UA
BRC5jsiqswVvdjGJrYtM30oNkxJJH1tPHwAhxN1XtWtX1X6wJlf+dPFlhIwsy1L4
5uLLvTFTrXvZVV0FMTAheVyeoNOYZf3iXF1IkBdAbVhHCFaGd3J7eNq7pm98nJo1
Y/M9DNefMa7BagU54ZuJO97oF+sY30EjEspeCjiFnMPOcSPPj0gml+rr/Gj8/am8
7F9RA+31coPCsel/EY+vRDUT/aHQIP4uWrfeAolL1uo9dzamaGRUZMoHIJsIid/s
Px/lRrlyE326OtkqeyUH
=PMhD
-----END PGP SIGNATURE-----

--1LKvkjL3sHcu1TtY--
