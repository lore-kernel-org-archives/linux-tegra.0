From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH] soc/tegra: flowctrl: Fix error handling
Date: Tue, 13 Jun 2017 16:48:23 +0200
Message-ID: <20170613144823.GA20577@ulmo.fritz.box>
References: <20170411034041.18662-1-christophe.jaillet@wanadoo.fr>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="k+w/mQv8wyuph6w0"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170411034041.18662-1-christophe.jaillet@wanadoo.fr>
Sender: linux-kernel-owner@vger.kernel.org
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: jonathanh@nvidia.com, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--k+w/mQv8wyuph6w0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 11, 2017 at 05:40:41AM +0200, Christophe JAILLET wrote:
> It is likely that returning returned by 'devm_ioremap_resource()' is
> expected here instead of something related to 'base' which should be a
> valid pointer at this point.
>=20
> Fixes: 841fd94c43a4 ("soc/tegra: flowctrl: Add basic platform driver")
>=20
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
>  drivers/soc/tegra/flowctrl.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied, thanks.

Thierry

--k+w/mQv8wyuph6w0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlk/+zUACgkQ3SOs138+
s6Eqlg//c4Ucj9KzgESneiTqAPK1es9Kvesl9eckqADNF9vULWwRMA0PCIlbXZyV
Jy96w9dn1/dugdXgS2QftCYMbmLmI3ikwEsCmUrdXqMyfq7pl80isKju2SkvzToq
9L9/fpgG+GVYhcK+o6Wh2Ys83htA3WExZffHMVNiAoYmbwq1yPzoy0ztOiIt4XoM
CIkrMOc8O110KAyOp8KlpIfXUeRwEI4lNE7m/Us0isTiflz4XziXTfvLnXMz54y+
TMiEpp45NRwd2pA+H6zL1U94TjrdCobV+Coj3JEHwxK3MRsmhljTnPHMr23qetIV
34z5PZD9/lWNCqmFwnrgLLekSj0BrL/B1WrosmMxssmY1S30BZnwkaLYt8+yq/pe
gzwoqXFFY3YLVL3OU6Xy7dMlQ1dF3Vc/PHjB/HGKROP5sxNP3UBkI+dkL8JNAxJx
dtZ5Ib9b9XgZ7Aps85arjtUQfyAB4tD9YDm6sSPSTH3IrWEi5f60Iex1xLVFs4z1
gn1vwKfZrQoSSB3XtAntjSKiVRchJasmg6e2JJCMGO9EWakPykJTseOaiVW2iPRN
tycPf46EasB413vN6513SibkwtM1tTUc+MsbfDcL0eXh5epLDQpW5OsQAD1CkWsv
sOet7AwliEO0UhCUeuHrE8fUrHRwxfyUKzqjzfgXasuGL4DObOU=
=OQko
-----END PGP SIGNATURE-----

--k+w/mQv8wyuph6w0--
