From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] ARM: tegra: mark panel regulator as enabled on boot
Date: Wed, 25 Jan 2017 09:15:09 +0100
Message-ID: <20170125081509.GE13025@ulmo.ba.sec>
References: <1d6749b2aa21112cb73e162a73e9e0e36b32a677.1481273581.git.marvin24@gmx.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="k3qmt+ucFURmlhDS"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1d6749b2aa21112cb73e162a73e9e0e36b32a677.1481273581.git.marvin24-Mmb7MZpHnFY@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-dWgojZr1M5Qdnm+yROfE0A@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--k3qmt+ucFURmlhDS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 09, 2016 at 10:20:38AM +0100, Marc Dietrich wrote:
> Current u-boot enables the display already. Fixes sporadic panel
> initialization failure with tegra_defconfig.
>=20
> Signed-off-by: Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>
> ---
>  arch/arm/boot/dts/tegra20-paz00.dts | 1 +
>  1 file changed, 1 insertion(+)

Applied, thanks. I did move the regulator-boot-on up a line so that the
regulator- and GPIO-related properties remain grouped together.

Thierry

--k3qmt+ucFURmlhDS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAliIXo0ACgkQ3SOs138+
s6HN2xAAkA3gAIql0gEeLfESFRp1t+oAJ/qiPaKuAq8vy62DZdhWw/2yurrp5w2r
c81f/V6Wy/kEk80B96zsQwCqu/csxzo/98lJTW7ttuclgKliPmsMxA+IdAGa3Nul
EBilXuEHTcemfxaRbOO6Stij/mN2HfZnos9FM4SqrX28YazlAcOPgq1uuZCri/88
z5/WFOF4km5wiG+Dumxl3terbQj6lJH19NOK/NSpPmyezpIx7b+QhqwtK8AQBt2O
V9koL9dMaf7qJl+csYhz6SdCuNl05IHMfBdgz/dL5/Jj5nN3h4AAmc/mNHOBHDt4
cM4U2UOrEMZ5aoizZLluc22i9Cs8lSOkBPkgeDPlPd9LEDvfAzEzVnPAmnr6it3s
6KOLHSDqpjv6IxOfsVCVINkD2BTKLDI28RWhigY93PQkw/avDBtizZAcKbtE6Yv5
oj9O1+lRRw0uqPewuNFi4pj+SUf4KfRs/2Aekligs/4qVfX0TqBW+AWzHT3pRotL
exOW4yJCJzTfo5KHZ9Ct0hU6rc7mKw+tY3ErS291KpDhrFt6nrMN1GHrTIwSkLB0
kk8jm1LxrnxWM8bZ7cotq4/HcpaeyRpbaXBvl1RP6UkOmgx+MYFEtNtTTqE7f7Em
b8+I+LOx92NATKcF0rUvMJR3WF4unfoWywYjkJa27UQfqt2Vguk=
=3IqH
-----END PGP SIGNATURE-----

--k3qmt+ucFURmlhDS--
