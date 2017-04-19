From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [GIT PULL 4/4] arm64: tegra: Device tree changes for v4.12-rc1
Date: Wed, 19 Apr 2017 17:24:11 +0200
Message-ID: <20170419152411.GA9866@ulmo.ba.sec>
References: <20170406231020.32048-1-thierry.reding@gmail.com>
 <20170406231020.32048-4-thierry.reding@gmail.com>
 <20170419131905.GD29219@localhost>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="wRRV7LY7NUeQGEoC"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170419131905.GD29219@localhost>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Cc: arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--wRRV7LY7NUeQGEoC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 19, 2017 at 06:19:05AM -0700, Olof Johansson wrote:
> On Fri, Apr 07, 2017 at 01:10:20AM +0200, Thierry Reding wrote:
> > Hi ARM SoC maintainers,
> >=20
> > The following changes since commit c1ae3cfa0e89fa1a7ecc4c99031f5e9ae99d=
9201:
> >=20
> >   Linux 4.11-rc1 (2017-03-05 12:59:56 -0800)
> >=20
> > are available in the git repository at:
> >=20
> >   git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/te=
gra-for-4.12-arm64-dt
> >=20
> > for you to fetch changes up to 18236a14883b718ce973e4c090db6ecb49b38287:
> >=20
> >   arm64: tegra: Update the Tegra132 flowctrl compatible string (2017-04=
-04 17:15:05 +0200)
> >=20
> > Thanks,
> > Thierry
> >=20
> > ----------------------------------------------------------------
> > arm64: tegra: Device tree changes for v4.12-rc1
> >=20
> > This adds a bunch of features for Tegra186, such as PMC, ethernet, I2C,
> > SDHCI and GPIO. It also enables various features on the P2771 devkit.
> >=20
> > A small fix is made to the compatible string list for the flow
> > controller on Tegra132 and the IOMMU is enabled for host1x on Tegra210.
>=20
> Nice, merged. Any chance we'll see Jetson TX2 support for 4.13?

P2771 *is* Jetson TX2. I suppose I could go and update the DTS file and
clarify that in the model string.

Thierry

--wRRV7LY7NUeQGEoC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlj3gRgACgkQ3SOs138+
s6FBdw//Ysu65RSe53DBLy59ZKhAgcv1T5d7qUaZ0p6Gf/6JG3kHdKghwHbWNuPl
LvwNPfj3VYsyw4oKeeHjHUiy5ihPWu4/IfgQtUfHeyya8BLmXp7TnuU7OheW3asb
Kisz7mKaxIQk63qDnwivTgCH6oMRXfuSfYDI/yDdZbjUqxwEuwjinVyyjLNqa4zo
mVHXuLqtB1e6UrqYSqoq9Bx4BqNdZoqR7c/0FTNGx6f/KF29XGaas4tirJ7xAJtS
I2l58YKt0WQM7+D3Vq6rORVljn4EmEgrmSC8U5P4F/NF4umacD53NH+5NWvZ2WUl
PVuTMhUkO0x181GynlYlUuDMBSXOhtTyt9vAKJVgADF8kHflxtMH+YHjQjj+tnHg
PrWNBxvaf2A2iFkzbWXUk8P7dNG9jyPV5lENr8pzcgKO383h77jQyA0Vi21VHmgz
pj44Er+uu8xNUo6myWQfWXH3o6lgKR3aC24a/Ys+jhuKUO3fzdCjj7hSGeWxJ47P
kT4URwyx6CRGSRVGWq1WFGR5rHOKQKq8qL7XkQN9Cgec1EvF43MB78kUFFZT5oDF
rXFsRkPF9x2Jrrxe+IBviVOhjEVH1IfIekwCriAerbq+Pk55IPc7EeNCSU9natY8
O7FVGeowq5WKMfTqTgCKR8jRK7/PCuqlMe6pM+7wyGaNfoQ/ZxU=
=QWrh
-----END PGP SIGNATURE-----

--wRRV7LY7NUeQGEoC--
