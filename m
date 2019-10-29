From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v6 09/18] clk: tegra: Add missing stubs for the case of
 !CONFIG_PM_SLEEP
Date: Tue, 29 Oct 2019 14:19:15 +0100
Message-ID: <20191029131915.GE508460@ulmo>
References: <20191015170015.1135-1-digetx@gmail.com>
 <20191015170015.1135-10-digetx@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="Rgf3q3z9SdmXC6oT"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20191015170015.1135-10-digetx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>
Cc: Jonathan Hunter <jonathanh@nvidia.com>, Peter De Schrijver <pdeschrijver@nvidia.com>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, Daniel Lezcano <daniel.lezcano@linaro.org>, linux-pm@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--Rgf3q3z9SdmXC6oT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 15, 2019 at 08:00:06PM +0300, Dmitry Osipenko wrote:
> The new CPUIDLE driver uses the Tegra's CLK API and that driver won't
> strictly depend on CONFIG_PM_SLEEP, hence add the required stubs in
> order to allow compiling of the new driver with the CONFIG_PM_SLEEP=3Dn.
>=20
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  include/linux/clk/tegra.h | 13 +++++++++++++
>  1 file changed, 13 insertions(+)

Applied to for-5.5/clk, thanks.

Thierry

--Rgf3q3z9SdmXC6oT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl24PFIACgkQ3SOs138+
s6GpQA/+ObhDGFKfUw2kmzmVofglBZKfac9iUKEOtJRjpACY1HQzbddmh7XDV0kz
x3ZpXS/64v2SYFT1MEDg+P0HIE9VEMhn0gTuht4eH6koVffOmKQW0mMcnmNXA0vT
Xz4DSqpdEa+1povmLaifTj6FAGsuT2FQXuK+eWA0UFkW3407KhhazMuwuJvlQ77J
0bq78zIdwRH33kP6MgZvTF94dggX02TsRt8x3FQxGjo6lxan5qe18h06/sTUGW4j
QvshCliwMiCaSskcQCULJYuRX9f54Iu6HkcmqURzP1LohAM4o7NnFboxKorGQAbY
76j6WB6i7O5isg5Ng0wV3YH/xHTuptMzX12iniF3BqwYWXab2J2qyNQ7ipnFlDvY
Y9m2caM4cPfILsUozrjvQqGWOkg8EujGzDhEOkqwGI1zj2rE0QzSTZbYFLYNp2ka
jHVMR+TN2Q4pwBTOPmJ4r2hPoy9KvTTEfLMU6T931lPPjNSKONvlr0oNz7fxVE2H
1adqcQRShR6hM1UzuFA3J9mjP8bqYFPYRIMVazpM6nQMwHTDSq9j/IIHp7LpFuVr
uDxLZYmA+mP7Sbo2eBAK3qwrR2Hgnyv4+tyLquKGuns+1mdP2B3+Nkw8Xrpf8b5c
RRWen5QU639f+YV7G6qxSxhljZri59qMYqGoQojtUZxIvMdNtyo=
=lnmo
-----END PGP SIGNATURE-----

--Rgf3q3z9SdmXC6oT--
