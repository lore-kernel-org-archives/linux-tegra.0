From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [GIT PULL 10/10] phy: tegra: Changes for v5.7-rc1
Date: Thu, 19 Mar 2020 15:41:35 +0100
Message-ID: <20200319144135.GA3266151@ulmo>
References: <20200313165848.2915133-1-thierry.reding@gmail.com>
 <20200313165848.2915133-10-thierry.reding@gmail.com>
 <20200316134850.GB3825456@ulmo>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="bp/iNruPH9dso1Pn"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20200316134850.GB3825456@ulmo>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, soc-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--bp/iNruPH9dso1Pn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 16, 2020 at 02:48:50PM +0100, Thierry Reding wrote:
> On Fri, Mar 13, 2020 at 05:58:48PM +0100, Thierry Reding wrote:
> > Hi ARM SoC maintainers,
> >=20
> > The following changes since commit bb6d3fb354c5ee8d6bde2d576eb7220ea098=
62b9:
> >=20
> >   Linux 5.6-rc1 (2020-02-09 16:08:48 -0800)
> >=20
> > are available in the Git repository at:
> >=20
> >   git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/te=
gra-for-5.7-phy
> >=20
> > for you to fetch changes up to 04c929223d1db6ad4ba8e4c23122e1052f670c2e:
> >=20
> >   phy: tegra: xusb: Don't warn on probe defer (2020-03-13 09:17:50 +010=
0)
> >=20
> > This is a dependency for the USB changes that are also part of this
> > series of pull requests, so it was deemed easier to take this all
> > through the ARM SoC tree. The patches have all been acked by Kishon.
>=20
> Please don't merge this just yet. Stephen reported today that this was
> breaking the build in linux-next because of a conflict with the USB
> tree. I'll rebase this on top of Greg's usb-next branch and resend the
> pull request.
>=20
> Sorry for the inconvenience.

I've pushed an updated version of this as tegra-for-5.7-phy-v2. However,
it's also included as a dependency in a USB branch for which I've sent a
PR to Greg, so I don't think you'll need to merge this after all.

Thierry

--bp/iNruPH9dso1Pn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl5zhJ8ACgkQ3SOs138+
s6GhORAAjNlN+ZLW5SU5O91T0zeQguAXCuV2DegEYBPX2Bi4ASL1voQ77Yx1LQ7j
xIlWW9JPRfeKw8jwS9gF3VihEoTEnFe4S5XzM/Ozsn5h3v2gO+TPu/dvswa0X3AV
H/Wq5YWGMLnKDJVGi1T7rnfRHgIfw5iMwhE+0cEdCwVhPFqcfJbToF9Fi9ff33qp
y6sE2mbv/RuME62u+vNoNo9oJMva0sXo5FyJOzRD3yd2YkvCOmeVJsqlhPeJt5qH
cslbI+ExBZhTZGnGbePA8AqzRZxXEq/c4ddwN4cnW5BEpzCD8o9hfngQW2A20EpH
kzOpgZheF3SnHqOpmvMiola/5cAd6mXgVdgFkWnwDnBgPqYk9mttnL+IOLwSJCsA
W8hu2bZkw8bnstp5X7UaBZY3G8QaWToyhl+JDMD4LZcxyybQflhYIoFoFtoyWPeE
74CLBAU+VfKl/HNQqvbWsNAMss76ldwP1HKXtau552hpYY51mQrZlahUaKRMTrM1
YXNKSgbjBr7YleiMa621DKgxda7Kq/qTBYLevK6V4QBXTvLrZAH7giCOrg0P/qpW
5Cx2SOuKCaLLYz6mCOXJK1voyeIraOlvuDRClE4VpZAbOY5cqDemCBob/+L3Y6NU
xuh+YKkPNi3fel3tAMyjvsJLzYaGFev5z5Sr4jA50+HejLHZtiY=
=GYTf
-----END PGP SIGNATURE-----

--bp/iNruPH9dso1Pn--
