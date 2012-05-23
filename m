From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: [PATCH] ASoC: tegra+wm8903: remove non-DT support
	for Seaboard
Date: Wed, 23 May 2012 12:20:58 +0100
Message-ID: <20120523112058.GO4085@opensource.wolfsonmicro.com>
References: <1337724679-12481-1-git-send-email-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2091179148441831883=="
Return-path: <alsa-devel-bounces@alsa-project.org>
In-Reply-To: <1337724679-12481-1-git-send-email-swarren@wwwdotorg.org>
List-Unsubscribe: <http://mailman.alsa-project.org/mailman/listinfo/alsa-devel>,
	<mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <http://mailman.alsa-project.org/mailman/listinfo/alsa-devel>,
	<mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Sender: alsa-devel-bounces@alsa-project.org
Errors-To: alsa-devel-bounces@alsa-project.org
To: Stephen Warren <swarren@wwwdotorg.org>
Cc: linux-tegra@vger.kernel.org, alsa-devel@alsa-project.org, Stephen Warren <swarren@nvidia.com>, Liam Girdwood <lrg@ti.com>
List-Id: linux-tegra@vger.kernel.org


--===============2091179148441831883==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Qa0ccP92Gc0Ko3P8"
Content-Disposition: inline


--Qa0ccP92Gc0Ko3P8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 22, 2012 at 04:11:19PM -0600, Stephen Warren wrote:
> From: Stephen Warren <swarren@nvidia.com>
>=20
> In kernel 3.6, Seaboard will only be supported when booting using device
> tree; the board files are being removed. Hence, remove the non-DT support
> for Seaboard and derivatives Kaen and Aebl from the audio driver.

Applied, thanks.

--Qa0ccP92Gc0Ko3P8
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAEBAgAGBQJPvMgTAAoJEBus8iNuMP3dS18P/jSRPngDFVWTHVCzQ8hGa7rY
yrcrQ97btmuKrK/WqwMAhkaLEmC0nKh/2ea1b967eJ/14tmQoNN0T7cJRu95d9+A
IJieuM5K0LbJeYQORRzDtu7WsU/qi0oyNSYKrBKmZYx5qGHKJFrus/7ltXnG7e4x
Ome3RzyMPLFV1GlVQNRm0oHtTnDkZV0KMS9gf/2UW2q4WMHnWhSzChUH7RCDpjgE
lUCAzrGCVm7mw1OrLXUHIAmx6pS+IOGlCrHs+IE69FPOyiPPichQJGfbwwkn/Oiu
IJPJ3/j0zzrA+nVe4yiHt7A9V9YXSs7avU3I10XU5m5YMsnOQMsi3yZk+E++UbiQ
v9XwXkVOFHLlzEFsV5bofDbbejIYMZTmRtW2bQjOEwe820p2KZMU59eZPYCIKrEC
SBF6tvM2F82Yj9aY1jjCcIx6bS2P29T5evddAaw5xBVGmS1a/V8k3HTHHh173Ubi
oUzPyDQR6G9q4wPn+ayDcTsqBuEOImcqxSiOOdacwGqlEDfnDrcm+OHduaNYGS3K
hUhrXYk7CDPHo/An7KJ729hITy3Z5Axy8HrA7BnvNzyjqco91XlTuIeC/aXlp++x
C7kgJnB5BEWbWQesxoz8MXkmFvzpakFfCTE+5OqKDGQXSB6YXssmLj7eWgWn6MJA
63WqaZlbzaS3Y+qm/Tij
=Eu3F
-----END PGP SIGNATURE-----

--Qa0ccP92Gc0Ko3P8--

--===============2091179148441831883==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


--===============2091179148441831883==--
