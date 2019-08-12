From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v8 01/21] pinctrl: tegra: Fix write barrier placement in
 pmx_writel
Date: Mon, 12 Aug 2019 11:20:21 +0200
Message-ID: <20190812092021.GC8903@ulmo>
References: <1565308020-31952-1-git-send-email-skomatineni@nvidia.com>
 <1565308020-31952-2-git-send-email-skomatineni@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="i7F3eY7HS/tUJxUd"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1565308020-31952-2-git-send-email-skomatineni@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sowjanya Komatineni <skomatineni@nvidia.com>
Cc: jonathanh@nvidia.com, tglx@linutronix.de, jason@lakedaemon.net, marc.zyngier@arm.com, linus.walleij@linaro.org, stefan@agner.ch, mark.rutland@arm.com, pdeschrijver@nvidia.com, pgaikwad@nvidia.com, sboyd@kernel.org, linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, jckuo@nvidia.com, josephl@nvidia.com, talho@nvidia.com, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, mperttunen@nvidia.com, spatra@nvidia.com, robh+dt@kernel.org, digetx@gmail.com, devicetree@vger.kernel.org, rjw@rjwysocki.net, viresh.kumar@linaro.org, linux-pm@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--i7F3eY7HS/tUJxUd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 08, 2019 at 04:46:40PM -0700, Sowjanya Komatineni wrote:
> pmx_writel uses writel which inserts write barrier before the
> register write rather.
>=20
> This patch has fix to replace writel with writel_relaxed followed
> by a write barrier to ensure write operation before the barrier
> is completed for successful pinctrl change.
>=20
> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
> ---
>  drivers/pinctrl/tegra/pinctrl-tegra.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)

Acked-by: Thierry Reding <treding@nvidia.com>

--i7F3eY7HS/tUJxUd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl1RL1EACgkQ3SOs138+
s6GgOQ/+KHEjD8Jzg9BS66GmKuNoOclOxDM03l3CoYiOGhyyUsPjifCTvtnDFGwa
lqaq7sH3V7fOCC/qun2i5BE8pumI+NgLEkm9tYKvmLCn2vKCzIpv2LGX37+e91M8
GiMD27bmKkEDW4nLgIza9y3v/t6kJ4XhwKnFA2+eMjqZB9SNleworpYAZp832AIj
nl0HbqRiGpkLjcIaWAibNY5+0OEpRB6AhZlhsCWz5h7c00Jad8qK1rBnoLxDiq7a
s5jPfDc8fYWQ6OnIutLEjm+GdSx17odH7R+mprW9OiKqWPmdZUp/aZEHDyS434Al
+c8I0wEpxWWCEk924kF6oPytP6KKjOHy29SdhPg0RV7uuK/qPm6ylaSxem3NyCMi
sibGMlfXuMKdFaDbCEIv0XbVsu7nmu1I0h7PV1Gy+oCSnPI8EJ+tFiGozbYoy9hQ
INdJWkMQLWXsCRsECrP1zWyDdiA5zhI0nRNVSflZi5Lz9GkcGa8fmi+r0o4vOL+x
Lsy85RpW8ukLteRRUf51hpXNcvsXTGXZEempESfd+uLu7eHTpq8WciMDDT0//ekQ
L4xaq/9TB7s0sDH3D2O8VOd5s1tR0nHl0DojzeY/YS25hOi3nW/8/fHaz+1c6z/C
cZ7LUpJxyGhfs9Sj00Ftyj2fWVZGuIxFDQXh5ny339ST1DhgPRQ=
=NUo9
-----END PGP SIGNATURE-----

--i7F3eY7HS/tUJxUd--
