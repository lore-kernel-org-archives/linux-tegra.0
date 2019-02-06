From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH] ARM: tegra: add "jedec,spi-nor" flash compatible binding
Date: Wed, 6 Feb 2019 14:16:29 +0100
Message-ID: <20190206131629.GL21676@ulmo>
References: <1439705605-9127-1-git-send-email-zajec5@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============3504374050724055852=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1439705605-9127-1-git-send-email-zajec5@gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc: linux-tegra@vger.kernel.org, Alexandre Courbot <gnurou@gmail.com>, linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org, Stephen Warren <swarren@wwwdotorg.org>
List-Id: linux-tegra@vger.kernel.org


--===============3504374050724055852==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="hTKW8p8tUZ/8vLMe"
Content-Disposition: inline


--hTKW8p8tUZ/8vLMe
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 16, 2015 at 08:13:25AM +0200, Rafa=C5=82 Mi=C5=82ecki wrote:
> Starting with commit 8947e396a829 ("Documentation: dt: mtd: replace
> "nor-jedec" binding with "jedec, spi-nor"") we have "jedec,spi-nor"
> binding indicating support for JEDEC identification.
>=20
> Use it for all flashes that are supposed to support READ ID op according
> to the datasheets.
>=20
> Signed-off-by: Rafa=C5=82 Mi=C5=82ecki <zajec5@gmail.com>
> ---
>  arch/arm/boot/dts/tegra114-dalmore.dts    | 2 +-
>  arch/arm/boot/dts/tegra124-jetson-tk1.dts | 2 +-
>  arch/arm/boot/dts/tegra124-nyan.dtsi      | 2 +-
>  arch/arm/boot/dts/tegra124-venice2.dts    | 2 +-
>  arch/arm/boot/dts/tegra20-trimslice.dts   | 2 +-
>  arch/arm/boot/dts/tegra30-beaver.dts      | 2 +-
>  arch/arm/boot/dts/tegra30-cardhu.dtsi     | 2 +-
>  7 files changed, 7 insertions(+), 7 deletions(-)

Applied, thanks.

Thierry

--hTKW8p8tUZ/8vLMe
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlxa3i0ACgkQ3SOs138+
s6FzxRAAoDfDaCX7J8H8blXNDyTGD0iOTOiMNOB5faoxhPvYy+kpc21rF8X/hcCi
mFXT52dgo44lQ0Lrf/dkCU9cfga6k0yYnoPDAhB/pzHjXS1vZF2sxAtnJEewUmjC
fMFppJ1ae5yPfOkKh7026tI3Oup1UVWRFzJko5PffaMD7qoQSBT4WUCNEZ94oQd4
uRmPLZ1jXOusUZBTszb9SvTLAYKMsyuTniW2sjdXvSPwx6mEhIVIqNiJLrjEWj2L
YJRc03HrFTMhAyYkquzUCx8l9orjjEnmk/6xsuGyQxPxXrHomsY2y1IzhHET38lz
qdgJJq94c0Tq4CL2GHDyWh9WtRaiHqNf4IxW50rDcKsjvZE2UqluEDpIkeguMCyK
x5JkUW2bFZrZ7mxzpobBVc+Lv+XIxeBxZyHpFD/a212k9zwmBAGy2ull5rhLZid3
PiV+RJKEIz1LiriGd6Fl/tkjt7QnT5zoGqwt4V7X7z4VLlymVr10CqwBz/2iSfVa
lLjaQVj3vYCG+On10dvkwV6lrRsDDf2kI9EYu7lZJynwKgCkqphQ1cZq+EBu9UzK
uxRih2E0Jzjw8M4YzLOL9wVS1N7KfP8icS8Kvd/94p55ALePbQaC6i7Fz95ppPWn
KrF1DvQ550iqV3vIJ1Y01oFtuXwBV57kGrzT8cl2agUy9nHY7kg=
=8i6y
-----END PGP SIGNATURE-----

--hTKW8p8tUZ/8vLMe--


--===============3504374050724055852==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============3504374050724055852==--
