From: Mark Brown <broonie@kernel.org>
Subject: Re: Re: [PATCH] regmap: add iopoll-like atomic polling macro
Date: Wed, 8 Jan 2020 13:36:08 +0000
Message-ID: <20200108133608.GB3817@sirena.org.uk>
References: <1578392889-16587-1-git-send-email-spujar@nvidia.com>
 <20200107120902.GC4877@sirena.org.uk>
 <ae119533-6966-157a-d14b-365306907554@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="ftEhullJWpWg/VHq"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <ae119533-6966-157a-d14b-365306907554@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sameer Pujar <spujar@nvidia.com>
Cc: jonathanh@nvidia.com, linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--ftEhullJWpWg/VHq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jan 08, 2020 at 10:20:37AM +0530, Sameer Pujar wrote:

> While checking the documentation on snd_soc_dai_ops, it appears trigger() is
> in atomic context.
> This means I cannot use regmap interface (with default configuration) in
> trigger().
> The above issue went away with usage of regmap_read_poll_timeout_atomic()
> and now I think I just got lucky.

It's fine if your regmap is set up to support atomic use (using a flat
or no cache and MMIO) but not for regmaps in general, I'm asking you to
document the fact that it's only usable with some regmaps.

--ftEhullJWpWg/VHq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl4V2scACgkQJNaLcl1U
h9DyyQf+LRcDvu8nJIgo56AfloLDZvisdiVJj7IrHeWoTCRS9c1x+UZUP70TNT6z
U8jW6z/jfA0AjReMQygFjd6K+3qAlfl3A/7EdFIb2oIv8xhW89KOhEIG2gp0ai57
bID5m+17D34TDlaCbzVgR5jAapB34UzAK6Okv1VjbeTgAXvEhUbbPYPgNbF2WVB7
Sz8KTR4CVfHPNN3UVh/9PBkrbEx5ndgBhAyjf00iffGfisbtUJ2WoHWd06VuUAmW
MlUxoi4kSwbgx+yd9L1gq+TOcCYqrCiW/8b2UubQ/xEe4hOM6i8SvMKbtuViORIa
W9nhfZ/Ki+3VjeiMnh+n2/XUVY4ndw==
=8PIN
-----END PGP SIGNATURE-----

--ftEhullJWpWg/VHq--
