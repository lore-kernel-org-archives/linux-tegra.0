From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH 2/2] firmware: Move Trusted Foundations support
Date: Thu, 11 Apr 2019 09:50:53 +0200
Message-ID: <20190411075053.GA4633@ulmo>
References: <20190410085708.10798-1-thierry.reding@gmail.com>
 <20190410085708.10798-2-thierry.reding@gmail.com>
 <f31d103c-c2b4-9d43-60c9-cc957457b96a@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============7240986609030120080=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <f31d103c-c2b4-9d43-60c9-cc957457b96a@gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Dmitry Osipenko <digetx@gmail.com>
Cc: linux-tegra@vger.kernel.org, Russell King <linux@armlinux.org.uk>, linux-arm-kernel@lists.infradead.org, Jon Hunter <jonathanh@nvidia.com>
List-Id: linux-tegra@vger.kernel.org


--===============7240986609030120080==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="9amGYk9869ThD9tj"
Content-Disposition: inline


--9amGYk9869ThD9tj
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 11, 2019 at 12:20:20AM +0300, Dmitry Osipenko wrote:
> 10.04.2019 11:57, Thierry Reding =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> > From: Thierry Reding <treding@nvidia.com>
> >=20
> > Move the Trusted Foundations support out of arch/arm/firmware and into
> > drivers/firmware where most other firmware support implementations are
> > located.
> >=20
> > Signed-off-by: Thierry Reding <treding@nvidia.com>
> > ---
> >  arch/arm/Kconfig                              |  2 --
> >  arch/arm/Makefile                             |  1 -
> >  arch/arm/firmware/Kconfig                     | 29 -------------------
> >  arch/arm/firmware/Makefile                    |  4 ---
> >  arch/arm/mach-tegra/Kconfig                   |  2 +-
> >  arch/arm/mach-tegra/cpuidle-tegra114.c        |  3 +-
> >  arch/arm/mach-tegra/pm.c                      |  3 +-
> >  arch/arm/mach-tegra/reset.c                   |  3 +-
> >  arch/arm/mach-tegra/tegra.c                   |  3 +-
> >  drivers/firmware/Kconfig                      | 15 ++++++++++
> >  drivers/firmware/Makefile                     |  1 +
> >  .../firmware/trusted_foundations.c            |  4 ++-
> >  .../linux/firmware}/trusted_foundations.h     |  4 +--
> >  13 files changed, 30 insertions(+), 44 deletions(-)
>=20
> Please add the MAINTAINERS entry for the driver.

Are you volunteering?

Thierry

--9amGYk9869ThD9tj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlyu8doACgkQ3SOs138+
s6FMSw/9H3eRcgXYQIdM+51O/y/nhEhQKD196/YOklBdD4rOUOW0ctXz/WR9M8Tl
+LqznjEXdq2uboCiB9byyceKfqMG2JvFA3L2UK/9ebOcgawhbbQf4Oh9CJ3ZRoPx
h87ntMVnV63ntuvQy5NOVGm7u2GcKgRFFcsa8bYczfjmBAnGyJBDXp0v5F5gky6g
nnNkbBs4/aZIMP92npiMgL16yf1URLTSJ72v4bOz8ULfAmfGQGu9bU34ucxwT0vC
AKF85HrAtCiDUClMQ/3ymMeFzMjRzJ0hDAtaxGgH/TnVXIo3X64LnSi1EVw7hbP1
FkH5Nek2O6pGqGqFfDqwL6FPsWIRzlucZfP6HrPYeYD+xngKeJO1tJpAn/HJuTHW
omekA5zZK/vOYYZQbWqmqfx2foZA0QKrOWm4C6CRqbXsENRzjKETLuys8j5mlJLr
k7nsXDbaYAi4nu0ol6bLMjD6/e0gtDHdE1908qf0qe8jILvyV5tDDECUvwlsZluF
XhSW5THI9RPRuenj9gBs1vH0G741XcNgRSndF9AzmKN+Nzu1K86mse81eixgzLi4
tDp/B3rYUPMX8CcIeiRCFn/o2nmE6jw2SFM/DbNYpFFr7P5ay1LQOB7V8jkw5aqk
l/dqjv1Z8gaotqYsKBoM3MdJHMqnTt3gWsl+6ILLpK9/lRjchBE=
=11xa
-----END PGP SIGNATURE-----

--9amGYk9869ThD9tj--


--===============7240986609030120080==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============7240986609030120080==--
