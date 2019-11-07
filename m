From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [GIT PULL 3/8] memory: tegra: Changes for v5.5-rc1
Date: Thu, 7 Nov 2019 16:32:05 +0100
Message-ID: <20191107153205.GB2580600@ulmo>
References: <20191102144521.3863321-1-thierry.reding@gmail.com>
 <20191102144521.3863321-3-thierry.reding@gmail.com>
 <2f1c8899-ffda-51f0-64f4-48aa23dc1823@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============5275285449980417708=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <2f1c8899-ffda-51f0-64f4-48aa23dc1823@gmail.com>
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
Cc: linux-tegra@vger.kernel.org, arm@kernel.org, linux-arm-kernel@lists.infradead.org, Jon Hunter <jonathanh@nvidia.com>
List-Id: linux-tegra@vger.kernel.org


--===============5275285449980417708==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="NMuMz9nt05w80d4+"
Content-Disposition: inline


--NMuMz9nt05w80d4+
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 04, 2019 at 06:34:47PM +0300, Dmitry Osipenko wrote:
> 02.11.2019 17:45, Thierry Reding =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> > Hi ARM SoC maintainers,
> >=20
> > The following changes since commit 54ecb8f7028c5eb3d740bb82b0f1d90f2df6=
3c5c:
> >=20
> >   Linux 5.4-rc1 (2019-09-30 10:35:40 -0700)
> >=20
> > are available in the Git repository at:
> >=20
> >   git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/te=
gra-for-5.5-memory
> >=20
> > for you to fetch changes up to 8b04225c4464422f185e62c2cedfb9e234423814:
> >=20
> >   memory: tegra: Consolidate registers definition into common header (2=
019-11-01 10:57:37 +0100)
> >=20
> > Thanks,
> > Thierry
> >=20
> > ----------------------------------------------------------------
> > memory: tegra: Changes for v5.5-rc1
> >=20
> > This contains a couple of fixes and adds support for EMC frequency
> > scaling on Tegra30.
> >=20
> > ----------------------------------------------------------------
> > Dmitry Osipenko (11):
> >       clk: tegra: Add Tegra20/30 EMC clock implementation
> >       memory: tegra: Don't set EMC rate to maximum on probe for Tegra20
> >       memory: tegra: Adapt for Tegra20 clock driver changes
> >       memory: tegra: Include io.h instead of iopoll.h
> >       memory: tegra: Pre-configure debug register on Tegra20
> >       memory: tegra: Print a brief info message about EMC timings
> >       memory: tegra: Increase handshake timeout on Tegra20
> >       memory: tegra: Do not handle error from wait_for_completion_timeo=
ut()
> >       memory: tegra: Introduce Tegra30 EMC driver
> >       memory: tegra: Ensure timing control debug features are disabled
> >       memory: tegra: Consolidate registers definition into common header
> >=20
> > Sowjanya Komatineni (1):
> >       clk: Add API to get index of the clock parent
>=20
> Hello Thierry,
>=20
> I want to point out that it looks like this patch from Sowjanya
> shouldn't belong to this pull request because it is unrelated to the
> memory patches.

Indeed, this wasn't meant to be in here. It looks like I messed up the
merge order when I was reconstructing the branches.

> Also, this patch haven't got an ack from the clk maintainers yet and I
> assume that it needs an ack.

Yeah... I thought Stephen had Acked this, but I can no longer find the
mail for that. He did ack some of the other patches, so I probably got
confused.

Anyway, it looks like he's having second thought about that core patch
now (not sure why this didn't come up before, since the patches with
this particular implementation had been on the list since August.

So I think I'll go and reorder the merges to make sure only the
depending patches (basically the clock suspend/resume) pull this one
in.


> I'm just wanting to get yours attention in a case if this patch was
> added by mistake. If it was intentional, then perhaps it should be okay.

Thanks for pointing this out.

Thierry

>=20
> > Thierry Reding (3):
> >       Merge branch 'for-5.5/clk'
> >       memory: tegra: Set DMA mask based on supported address bits
> >       memory: tegra: Add gr2d and gr3d to DRM IOMMU group
> >=20
> >  drivers/clk/clk.c                   |   17 +
> >  drivers/clk/tegra/Makefile          |    2 +
> >  drivers/clk/tegra/clk-tegra20-emc.c |  293 +++++++++
> >  drivers/clk/tegra/clk-tegra20.c     |   55 +-
> >  drivers/clk/tegra/clk-tegra30.c     |   38 +-
> >  drivers/clk/tegra/clk.h             |    3 +
> >  drivers/memory/tegra/Kconfig        |   10 +
> >  drivers/memory/tegra/Makefile       |    1 +
> >  drivers/memory/tegra/mc.c           |   52 +-
> >  drivers/memory/tegra/mc.h           |   74 ++-
> >  drivers/memory/tegra/tegra114.c     |   10 +-
> >  drivers/memory/tegra/tegra124.c     |   30 +-
> >  drivers/memory/tegra/tegra20-emc.c  |  134 ++--
> >  drivers/memory/tegra/tegra30-emc.c  | 1232 +++++++++++++++++++++++++++=
++++++++
> >  drivers/memory/tegra/tegra30.c      |   34 +-
> >  include/linux/clk-provider.h        |    1 +
> >  include/linux/clk/tegra.h           |   11 +
> >  include/soc/tegra/mc.h              |    2 +-
> >  18 files changed, 1797 insertions(+), 202 deletions(-)
> >  create mode 100644 drivers/clk/tegra/clk-tegra20-emc.c
> >  create mode 100644 drivers/memory/tegra/tegra30-emc.c
> >=20
>=20

--NMuMz9nt05w80d4+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl3EOPIACgkQ3SOs138+
s6Hb4BAApDFf5WUv3aD+fEF4YgUV0NkAJ+WRDjwL+FEZZZhZkZvY7XFIdKaNVCfH
uJSUG4tNuK9kutGgqOmRxFo6AyQ+0YrO3kI/G6Hi3cZdWLSH4/GdFcdd2OXPcJj8
Iv4vM+96eaIfV5A8ON9PZZBJ21Klm0bXjnjBUii3WegzgR8ZxLjCMgyeafqJyyTQ
1Wk08Rvujlc4a0+BCiULSrMdtXd/wsoIxq8ro9v2KIxvuFHeauL8r00wx3dfuw1c
bSCfa/S2ajtKmoSW63lqHNoxfCiIy5c00vFXq5vMopL3ZqKuTUg0VTQEvi1jDk+X
A4jt/o0F8aQPZiaQWv5mRElYUoD2NSkT37GiM44hGwAb477+0b9uwp4G+Wlg8GGq
XL1nonjA1PF6P8khBW04wtDxDRHc0710R8Jzz/cGDFwQbFhCDq74OWv4qgR5sSiX
bs6R1T+fAuUXJ/AKq15phJ63VRtVttwnfQJxZHuTOQK2zoUEunWswbZ1cT71IR4o
/zYsE0kxj4p+4skJVmsuO5LyljF7sMWtn3QX2k1H4TdOOlElVZGzG/chBOE+V6GQ
H8xFGvKlKyTHAVKbqKer8ZkQfLOeBGsTGX6joJKLJjYfI+LET+Yib1LxXtKweVId
SM9kmsRELZkh1mgo46Y6fnwFgcXZdZJ9w1uXcBp4WKybe3rfkTY=
=ZcsK
-----END PGP SIGNATURE-----

--NMuMz9nt05w80d4+--


--===============5275285449980417708==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============5275285449980417708==--
