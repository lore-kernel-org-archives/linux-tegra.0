From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v3 01/11] regulator: core: add API to get voltage
 constraints
Date: Wed, 7 Feb 2018 10:43:51 +0000
Message-ID: <20180207104351.GA6003@sirena.org.uk>
References: <1517934852-23255-1-git-send-email-pdeschrijver@nvidia.com>
 <1517934852-23255-2-git-send-email-pdeschrijver@nvidia.com>
 <20180206163544.GI5681@sirena.org.uk>
 <20180207084744.GG7031@tbergstrom-lnx.Nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="opJtzjQTFsWo+cga"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180207084744.GG7031@tbergstrom-lnx.Nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Peter De Schrijver <pdeschrijver@nvidia.com>
Cc: linux-tegra@vger.kernel.org, linux-clk@vger.kernel.org, mturquette@baylibre.com, sboyd@codeaurora.org, robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org, lgirdwood@gmail.com, linux-kernel@vger.kernel.org, Laxman Dewangan <ldewangan@nvidia.com>
List-Id: linux-tegra@vger.kernel.org


--opJtzjQTFsWo+cga
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Feb 07, 2018 at 10:47:44AM +0200, Peter De Schrijver wrote:
> On Tue, Feb 06, 2018 at 04:35:44PM +0000, Mark Brown wrote:
> > On Tue, Feb 06, 2018 at 06:34:02PM +0200, Peter De Schrijver wrote:

> > > Add API to get min/max rail voltage configured from platform for
> > > given rails.

> > because...

> of the next patch where this is used to retrieve the minimum rail voltage.

And that in turn is needed for...?

--opJtzjQTFsWo+cga
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlp62GMACgkQJNaLcl1U
h9De2Qf8Dt/zu2J33AfI0h1suzCF1HhbH+w3PJ8nawVjffM8YdSvTvA5VlnFUn5W
DtgVxrpbY19UyvuKvpHBETIJeLoScwf7ElfZ8pI+CN8iLvA/RL5LC5erBxKwmiQz
kBFBxMeJwoxwpK+eAMIpdX40P1C1SGbrHgZO97Mm+beoClF4b6VECMiZpyAo1Nwp
TNq8SszkK5v1V8R+60uH+uavRQAFaOo8JzsyXwxndOC6tzfDXHx7j7NnvtopxESQ
S2TKe4ArDE8uSSYFiIOY0/SJdpEkMb8VpYaeVrA9D8OooO33P/2DwGcjsxs4VqMC
6tDB6m39ieB87fv5GpNFrNw4EvdUxg==
=8SK2
-----END PGP SIGNATURE-----

--opJtzjQTFsWo+cga--
