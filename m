From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v2 3/4] media: staging: tegra-vde: Turn ON power domain
 on shutdown
Date: Fri, 26 Jun 2020 09:43:33 +0200
Message-ID: <20200626074333.GB3109062@ulmo>
References: <20200624150847.22672-1-digetx@gmail.com>
 <20200624150847.22672-4-digetx@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="+pHx0qQiF2pBVqBT"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20200624150847.22672-4-digetx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>
Cc: Jonathan Hunter <jonathanh@nvidia.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org, linux-tegra@vger.kernel.org, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--+pHx0qQiF2pBVqBT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 24, 2020 at 06:08:46PM +0300, Dmitry Osipenko wrote:
> On some devices bootloader isn't ready to a clamped VDE power, and thus,
> machine hangs on a warm reboot (CPU reset). The VDE power partition is
> turned ON by default on a cold boot, hence VDE driver should keep power
> partition enabled on system's reboot too. This fixes hang on a warm reboot
> on a Tegra20 Acer A500 device, which is handy if Embedded Controller
> driver is unavailable, i.e. cold reboot can't be performed.
>=20
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/staging/media/tegra-vde/vde.c | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)

Unfortunate that we have to do this, but looks fine:

Acked-by: Thierry Reding <treding@nvidia.com>

--+pHx0qQiF2pBVqBT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl71pyUACgkQ3SOs138+
s6F5dw/8CW7nKPapQO4CpytXDxMMoCTTtQyWgDFYQ/xU3ylzovRIiKhI+LeVqVTn
Rdi4QA5q5nZPPASa5H9gKccbKel0rgoZFmRt0Lfsz49e/vM7VsoN0+STNG0/cLP8
cn2+ZKSNi1Pdp+kjoHdet3Lep5X3u3wRWlYP18r6D2zRC40WQnV9xzREOwoLZbi2
6MqN1AgbJoLJuKjSFLTqWmegx+J0UtpNhU7SMzPT4BzyGSbssdsu4dkBzDsknq9X
tXGCHE5yYwNZ8L4qqZJHs5Z9B5Xgt4S8hoV3fLHBPHiULPsPbqRrCu/Olto1z2br
wNfzo3idaet4Rpt1LeaIQf4XFikpOyJzFAmWk05rrcdOV98lGDS/wYiffwl0VF9C
FaYtJpoQBKLWAlAGtDyYOUCdpRsRnTYr2D8fQU5li5E+NixhF0MmIAkKmBty8w9l
3sO3na4DMbOmVv6TyT41jpWyYQBgENBeQm1CyxifcgdvTcnuXlW3LAShO3BlVuRi
pEOKovKDd0o/BDnjrcJCBuXebZjFs9tdJMNFnvWcGFcgmW48Q1NNrn+8uJhCEjej
8dX50tDvBKvGgD7rhQ5XhV/UxSU9pi5WjHBWzWuPoQo3M0prZzktl6aLRZCMT6Wo
NIxCf/cuXOtvwQrGeVse3gFZijVOJdNs0OdVbIsCCAEmOthIDl0=
=jvXi
-----END PGP SIGNATURE-----

--+pHx0qQiF2pBVqBT--
