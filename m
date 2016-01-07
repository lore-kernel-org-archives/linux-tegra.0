From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: next boot: 564 boots: 59 failed, 448 passed with 57 offline
 (next-20160107)
Date: Thu, 7 Jan 2016 17:28:10 +0100
Message-ID: <20160107162810.GA25177@ulmo>
References: <568e8740.01941c0a.31072.ffffb67b@mx.google.com>
 <20160107155958.GG6588@sirena.org.uk>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="FL5UXtIhxfXey3p5"
Return-path: <linux-next-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20160107155958.GG6588@sirena.org.uk>
Sender: linux-next-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: Stephen Warren <swarren@wwwdotorg.org>, Alexandre Courbot <gnurou@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jslaby@suse.com>, Arnd Bergmann <arnd@arndb.de>, kernel-build-reports@lists.linaro.org, linux-next@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--FL5UXtIhxfXey3p5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 07, 2016 at 03:59:58PM +0000, Mark Brown wrote:
> On Thu, Jan 07, 2016 at 07:41:52AM -0800, kernelci.org bot wrote:
>=20
> > Tree: next
> > Branch: local/master
> > Git Describe: next-20160107
> > Git Commit: 0f023a298a7d2a8e99c54913f7277b3c08c1f5c9
> > Git URL: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.=
git
> > Tested: 95 unique boards, 25 SoC families, 28 builds out of 135
> >=20
> > Boot Failures Detected: https://kernelci.org/boot/?next-20160107&fail
>=20
> For the past couple of days -next has been failing to boot on various
> Tegra platforms, there are failures involving either no kernel output or
> (with tegra_defconfig) backtraces during CMA allocation from USB, for
> example:
>=20
>    http://storage.kernelci.org/next/next-20160107/arm-tegra_defconfig/lab=
-khilman/boot-tegra30-beaver.html
>=20
> >     multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy:
> >         tegra124-jetson-tk1: 2 failed labs
> >         tegra30-beaver: 1 failed lab
> >=20
> >     tegra_defconfig:
> >         tegra124-jetson-tk1: 2 failed labs
> >         tegra124-jetson-tk1_rootfs:nfs: 1 failed lab
> >         tegra124-nyan-big: 1 failed lab
> >         tegra30-beaver: 1 failed lab
> >=20
> >     multi_v7_defconfig+CONFIG_ARM_LPAE=3Dy:
> >         tegra124-jetson-tk1: 1 failed lab
> >         tegra124-nyan-big: 1 failed lab
> >=20
> >     multi_v7_defconfig:
> >         tegra124-jetson-tk1: 2 failed labs
> >         tegra30-beaver: 1 failed lab
> >=20
> >     multi_v7_defconfig+CONFIG_LKDTM=3Dy:
> >         tegra124-jetson-tk1: 2 failed labs
> >         tegra30-beaver: 1 failed lab
> >=20
> >     multi_v7_defconfig+CONFIG_PROVE_LOCKING=3Dy:
> >         tegra124-jetson-tk1: 2 failed labs
> >         tegra30-beaver: 1 failed lab
>=20
> I did bisects yesterday but they were a bit inconclusive, showing a
> series of skipped commits in the TTY tree as being the culprits:
>=20
> afd7f88f157796e586fc99d62da13a54024e0731 serial: 8250: move of_serial cod=
e to 8250 directory
> 4e33870b3bb691996354a8f9e8f69458b4fc34d9 serial: of: CONFIG_SERIAL_8250 i=
s always set
> d1b5c87fa8058a3f477ae05555916dd1cea934ad serial: remove NWP serial support
>=20
> which seems more than a little surprising and like they might be false
> positives, especially in the cases that do produce output.  The errors
> today look the same.  I've not investigated further than the bisects.
>=20
> Full bisect logs:
>=20
>  https://ci.linaro.org/view/people/job/tbaker-boot-bisect-bot/140/console
>  https://ci.linaro.org/view/people/job/tbaker-boot-bisect-bot/141/console

These should all be fixed by this patch:

	serial: 8250: of: Fix the driver and actually compile the 8250_of

which can be found in patchwork here:

	https://patchwork.kernel.org/patch/7883541/

I think this is merely waiting to be picked up into the tty tree. I
suspect the reason why there's output in the first place is because
of earlyprintk. I've seen recent linux-next work properly, with the
serial console hanging at some point (fbcon shows login prompt). If
I apply the above patch things are back to normal.

Thierry

--FL5UXtIhxfXey3p5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJWjpIVAAoJEN0jrNd/PrOhUE4P/3e3zJQcsqhGNuntZS173+rG
INM3nvTay+eJq1T6R3obDEcR4/xZVTp8+MRMUuddEXdpkDPDjrYPnnu66PoepQqi
BzUYao/NS+Vy7EhPrzyZ3cVlH2f7dCQqcHUprqJO81vAIN5M52JgXEOrklsWZe14
DXDbMdQci8AnEI5d/qKGQBX5nLDr89Y6psOlUoEXc+cy+j3T7+Rm4KdKS3a7LdkK
/OxBIUch7xDBCUIBVP35bMGmZlfIIsT0IMJvu9spfA91dt0TngW1Zk4sPbb3cTwZ
qefXFmacaeXiWUCy0S3S64xg471aFvlCT/0fvn+CH0lnmnwC470ToKMYzO3vgLB4
48c6JDAakVhHFJRzxQWWo1lHcop2xDasZ2yRkkQ3k7DaD9lC8Rc622BSOpr4EDdZ
0PiZQrrwXqqaDnmObdjb15U6aIkcXpWw4mq0P4VFazOMex2QV468dzA0WUgXKwnp
qDbwN4svjYMxwrs5XbonlLoIwTRh1NbY3of9RlqjmjgpVnekWJY5iMHx3DtMgkTf
yPdLHJuotNdVBqRu9KHhjdgUbJ73D6Ki1Sv3/Hi28jzPEKXe5LVwAKIzK1m6BrqI
tFgcDWEhKdWw1RM8mRPDQ2T2q3DC8iTkCwiARoIUYtzJijH9S3Bq6u1BfZRAB+7/
+TCdAoLUzXf5ZjBYVIJg
=eDDT
-----END PGP SIGNATURE-----

--FL5UXtIhxfXey3p5--
