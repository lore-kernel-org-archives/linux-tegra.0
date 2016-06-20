From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v2] arm: tegra124: remove commas from unit addresses
Date: Mon, 20 Jun 2016 18:40:57 +0200
Message-ID: <20160620164057.GD6175@ulmo.ba.sec>
References: <1466298275-15753-1-git-send-email-marcel.ziswiler@toradex.com>
 <576810C2.1030401@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="AbQceqfdZEv+FvjW"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <576810C2.1030401@wwwdotorg.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Warren <swarren@wwwdotorg.org>
Cc: Marcel Ziswiler <marcel.ziswiler@toradex.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, linux-tegra@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>, Alexandre Courbot <gnurou@gmail.com>, Russell King <linux@armlinux.org.uk>, linux-arm-kernel@lists.infradead.org
List-Id: linux-tegra@vger.kernel.org


--AbQceqfdZEv+FvjW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 20, 2016 at 09:50:26AM -0600, Stephen Warren wrote:
> On 06/18/2016 07:04 PM, Marcel Ziswiler wrote:
> > Remove commas from unit addresses as suggested by Rob Herring upon me
> > posting initial Apalis TK1 support:
> >=20
> > http://article.gmane.org/gmane.linux.ports.tegra/26608
>=20
> Acked-by: Stephen Warren <swarren@nvidia.com>

I'm confused now. I posted almost exactly the same patch a while ago and
we agreed that we couldn't do this because the node names were to be
considered part of the ABI.

Is it or is it not?

Thierry

--AbQceqfdZEv+FvjW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJXaByZAAoJEN0jrNd/PrOhqLQP+wdyBbLN1YA4SEWBvnYRMDGG
wqepxPhkPEqeM4l2tYB+Z4E7QzCzB5W/lD7ZKg1rnN488d9DNr0dk2LpdZaiA3Q4
g/DCHDGYonuKNJsSsQiRALmW7o/j2LjxjQFKR3mKLmv5YNObBwIGfzJTyWEhg9zK
m6dkWB/U47oolJp1DaD274dGIBU6+uBOph0SG2R+Idi9095a8VlRVGtHIdAiPPpK
cBBugIK4Tk97HZKZ55TT4WrIcJCblJMmX2zqJKCr0mbyy8cjHc2avuV22Sbl7gfS
GPgu0dUloEyxuHZHa7/T9bZm2l2YZdvZfkwiLYDccm9x3l35Ss5fg748f7f7Ped4
1We6qMbw27msTA436/NcuKlKnoSFIyl6tC9Ym1a+iNb9y1Bf4yBbpnb//j9UmtQN
uf+IRASWxo7GfigNCCB31R9J018TBCrAac1JDiJ6bTMEWyRdoTGwyaFCDoO+tglQ
xuilhQ/weg/xlvTY5tbXUq1zRX+5l/2MKlilhdFbDaI1Y0kWCrQ1HUESYpAire/e
ZJCZQqihu9Wbtx67f9aMotuC4gM7AWqIkB3YSC+UC0j5Rq8xbuC+2Pfp0Xe7Gnn8
PwXNS/du3811Zt0L7vm1qyPO03dDUhGXwm1dwko+R77AMnWwI9tRr+Wyu9p2RYL4
iZzVjcYHsKlp3JlbWJnC
=Qlew
-----END PGP SIGNATURE-----

--AbQceqfdZEv+FvjW--
