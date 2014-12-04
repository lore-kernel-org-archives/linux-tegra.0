From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [GIT PULL v3 1/4] ARM: tegra: IOMMU support for v3.19
Date: Thu, 4 Dec 2014 17:36:39 +0100
Message-ID: <20141204163637.GA16914@ulmo.nvidia.com>
References: <1416570832-6220-1-git-send-email-thierry.reding@gmail.com>
 <1417707950-7633-1-git-send-email-thierry.reding@gmail.com>
 <2182969.Fashf5lCE4@wuerfel>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="a8Wt8u1KmwUX3Y2C"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <2182969.Fashf5lCE4@wuerfel>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Joerg Roedel <joro-zLv9SwRftAIdnm+yROfE0A@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--a8Wt8u1KmwUX3Y2C
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 04, 2014 at 05:21:27PM +0100, Arnd Bergmann wrote:
> On Thursday 04 December 2014 16:45:49 Thierry Reding wrote:
> > Hi ARM SoC maintainers,
> >=20
> > The following changes since commit 0690cbd2e55a72a8eae557c389d1a136ed9f=
a142:
> >=20
> >   powerpc/iommu: Rename iommu_[un]map_sg functions (2014-11-18 11:30:01=
 +0100)
> >=20
> > are available in the git repository at:
> >=20
> >   git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/te=
gra-for-3.19-iommu
> >=20
> > for you to fetch changes up to 8918465163171322c77a19d5258a95f56d89d2e4:
> >=20
> >   memory: Add NVIDIA Tegra memory controller support (2014-12-04 16:11:=
47 +0100)
> >=20
> > Here's a version of the pull request rebased on top of Joerg's core
> > branch from the IOMMU tree. It has the advantage of having resolved
> > the merge conflicts and the disadvantage of pulling in v3.18-rc3.
> > It also contains an updated commit description with some details
> > that ensued from a discussion regarding the DT binding as well as
> > the memory-client to SWGROUP mapping tables.
> >=20
> > This pull request also contains fixes for a build error reported by the
> > 0-day builder as well as a couple of issues in the IOMMU domain detach
> > path that I've found since v2 while doing extensive driver unload and
> > reload stress testing.
>=20
> Pulled into next/drivers, thanks for you patience!

Thanks,
Thierry

--a8Wt8u1KmwUX3Y2C
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJUgI2VAAoJEN0jrNd/PrOhSakQAMAhdfOJXoYahc12OlAdnFTG
IdFvPScBCNH6W/b3Zse2NqDHk8hb8cF8zTi8guk45pjOytrGwfzzgkKg/saKWM0Q
s9OmSOxYpzO9IWWI7UkPeCw0txN5CHa3NwMhSGlk7mhPUeA6QBgWguKY55h8241q
OSJ7byykwW1YbGxTho3KViDvQirUfT+BS7XZPfCdCClDnXqupPgO91+7NmBr8zV8
vQYxMU4WKMkJCpdsbnraGIsDtbesz1mS6XNmnXTCX+ccEB/eGlpZ71omooYrurut
kyNiY6LG2b93YQJZdxpvoU5Ez0Z97Etib0vAu0eS12ZxiF6K2GAE+JU/yQJJzKFk
cD0A5WO7aFeyx66kSi9Zv4cQjxP4yDKWK7CjPfo54af7T3WIuzkiumTY/Eowelc7
RMiUU4mCh4zJtcgAqRz7uyfgGhLfc/CJSwbS12GE+0VImthHn22I/l4ITpyb1G7z
znO9OzwuR5S6lH31PozFglT9xPkOPyyfhAKNO0nhUj7rmclQjAcV7EOSriYBi8SN
VTKSGdZ1fe+l2TJb6mjfrwm2TkXDnFEApE/XtbMuBTCNzFDthQPmjORJPMByYEVM
0rpIvNimMyutBuws8/5/QkopEAia1BHX80iFzTubNemsyItyT03hN51XG24Wz4Q+
wVzPV4KTeyXpsEGNKLQk
=onPS
-----END PGP SIGNATURE-----

--a8Wt8u1KmwUX3Y2C--
