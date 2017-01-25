From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v2 5/6] ARM: tegra: nyan-big: Proper pinmux for TPM i2c
Date: Wed, 25 Jan 2017 12:06:44 +0100
Message-ID: <20170125110644.GF9344@ulmo.ba.sec>
References: <20170122154753.31942-1-contact@paulk.fr>
 <20170122154753.31942-5-contact@paulk.fr>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="Il7n/DHsA0sMLmDu"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170122154753.31942-5-contact@paulk.fr>
Sender: linux-kernel-owner@vger.kernel.org
To: Paul Kocialkowski <contact@paulk.fr>
Cc: linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, Jon Hunter <jonathanh@nvidia.com>, Stephen Warren <swarren@wwwdotorg.org>, Alexandre Courbot <gnurou@gmail.com>, Mikko Perttunen <cyndis@kapsi.fi>, Peter Rosin <peda@axentia.se>
List-Id: linux-tegra@vger.kernel.org


--Il7n/DHsA0sMLmDu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jan 22, 2017 at 04:47:52PM +0100, Paul Kocialkowski wrote:
> This corrects the pinmux for accessing the TPM over the i2c line.
> Thus, it allows correctly probing the module, that previously failed with=
 i2c
> errors.
>=20
> Signed-off-by: Paul Kocialkowski <contact@paulk.fr>
> ---
>  arch/arm/boot/dts/tegra124-nyan-big.dts | 20 ++++++++++----------
>  1 file changed, 10 insertions(+), 10 deletions(-)

I've applied an s/i2c/I2C/ in the commit message and applied this. Can
you also make sure that these changes go into the nyan-big configuration
of the tegra-pinmux-scripts[0]? I know Stephen wants to keep those in
sync with the DTS.

Thanks,
Thierry

[0]: https://github.com/NVIDIA/tegra-pinmux-scripts

--Il7n/DHsA0sMLmDu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAliIhsQACgkQ3SOs138+
s6GDfxAApZscJYCOO52o/rkrkFMd9ytpOHXKYqSgk0ECAqhao6PEQhWDmNffGZiW
BF/DZR4fLzgoBS1BjtOnLuvEpNTkL1C/RiB23yeIDdVxlT6NLGeeQgf5apku+hiy
9BMsGtQjgAhkKtlxD+FqBGEp+KD9kl9fDv9Q5H/Dqez30562zaOVjKSDMDQpD5qT
22hASPiYMMDN+yZ1PsjxPRxLNlqgABs+nDFRq+VMYnQCm+GHd5hM9kWYNyRrGKxE
cI5BbJ6rWd7WtnFvvNvVWWQpbJV1mENFV/IyOevUX8cAyC7mFjnclxuKjg/buG2i
YZ9QJAy91LahRTey0YsHbV3yL4yAAZROI9fac81RxojfVMcqnI95IfnJlQTPTwhW
q2psklhKGXW5cJ5TksLoarlq3hTbDdG89f5euEYoqyIqgauShElG1CUvR7SpFZqr
vgtzAz1t2bzHtpiR6CRpmrCwQFVZP2+VL2nWtqhw5Vn/Z25lpN/eojcsTcab6g63
IF7GTiApq5JWj4+ZyDF5/Lbae+7cyPq0eUQtapIlpcd5t1tDx4+Fcxe+VNR+k+JL
ROV8NvvfMrGoi3Q8/t2mhDvngHpGkb0jPl+RG8b7rRGKuuEJ54bJaxL4MRton55r
NdnrbNR2FzsIWPU6wN9ZCe6gGt406jkQXFwh5bGTYYKp5W1mS88=
=fiWa
-----END PGP SIGNATURE-----

--Il7n/DHsA0sMLmDu--
