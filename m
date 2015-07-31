From: Wolfram Sang <wsa@the-dreams.de>
Subject: Re: [RFT PATCH 2/2] i2c: tegra: add support for fast plus (FM+) mode
 clock rate
Date: Fri, 31 Jul 2015 12:43:06 +0200
Message-ID: <20150731104306.GE1522@katana>
References: <1435661667-11554-1-git-send-email-ldewangan@nvidia.com>
 <1435661667-11554-2-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="19uQFt6ulqmgNgg1"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1435661667-11554-2-git-send-email-ldewangan@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Laxman Dewangan <ldewangan@nvidia.com>
Cc: swarren@wwwdotorg.org, thierry.reding@gmail.com, andrewc@nvidia.com, gnurou@gmail.com, linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, Chaitanya Bandi <bandik@nvidia.com>
List-Id: linux-tegra@vger.kernel.org


--19uQFt6ulqmgNgg1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 30, 2015 at 04:24:27PM +0530, Laxman Dewangan wrote:
> Tegra I2C controller required to configure the clock divisor
> register inside controller to different value based on the clock
> speed. The recommended clock divisor for the I2C controller for
> standard/fast mode is 0x19 and for fast-mode plus is 0x10.
>=20
> Add support to configure clock divisor register of I2C controller
> based on bus clock rate.
>=20
> This clock divisor is supported form T114 onwards.
>=20
> This is based on change done by
>         Chaitanya Bandi <bandik@nvidia.com>
>=20
> Signed-off-by: Laxman Dewangan <ldewangan@nvidia.com>
> Signed-off-by: Chaitanya Bandi <bandik@nvidia.com>

Applied to for-next, thanks!


--19uQFt6ulqmgNgg1
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJVu1E6AAoJEBQN5MwUoCm2tzkQAIspkfS5k0APKYPzh50fV3W9
gqLaFDzbr2VPjt2T5l4J5dfyLgwD7rS1H4k07Bs+zkp0bKe4FV63zi6iLGvld0Kv
jtgeE+RdNLNf2pwx7GMrKitnR1C0YEojbBuegYJGBgySSeN+T0+u1VOvaLXYUMzD
tm+6xJ/NooEcA0A30KoIpf/kOeVTxD/FK52afPKPHoImlGX0c6Iijift/tDV5FAu
2jV8p28XhuwKJfel7RsorQbXn2mbnTUGeGFZhkvmcH282Opajb37BNPmofmXqVi8
c6OCwWaBdylK2HfSAlh3qs4j/NR0cwacPG3w5fLZQ3Z2WXqG3x28Lq1ZHfj0Kywi
P11ktZJcM/YpCa8kTwP6pFgzGCVuK0pq6ZAF5Ye0LP6lGggwj4+DkLRbrPB+KzHQ
zKUCOZgLIa/QbgYPQW4cqEvsDoY4MUkJSf+nJg6lpccqDsvZg4UUleJDQx9Y6O74
qyzMtitXFJ2zCF8E5ksUUi2ftRuLusWpHO6ZbQOV9L3IZM6p+Ijle3GwN+fMLAeT
U8VYrGDppeTZlKWDS9I8mXEyEdCHbqTY0CH4SS70Fjmdn0nwWOZlmK3y+za3vcw1
IK7Go2oIIt9DxkD0yf4uVFc6ACXfZ7qM6GjeqgI69LIxkdWXzAhbKXoEQJFoODXJ
gm4WmyjvIaa7rgxuIPiQ
=iVzf
-----END PGP SIGNATURE-----

--19uQFt6ulqmgNgg1--
