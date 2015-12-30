From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [GIT PULL 3/5] ARM: tegra: Core SoC changes for v4.5-rc1
Date: Wed, 30 Dec 2015 16:46:47 +0100
Message-ID: <20151230154647.GB7085@ulmo>
References: <1450356639-7758-1-git-send-email-thierry.reding@gmail.com>
 <1450356639-7758-3-git-send-email-thierry.reding@gmail.com>
 <20151222195446.GH30172@localhost>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="QKdGvSO+nmPlgiQ/"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20151222195446.GH30172@localhost>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Cc: arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--QKdGvSO+nmPlgiQ/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 22, 2015 at 11:54:46AM -0800, Olof Johansson wrote:
> On Thu, Dec 17, 2015 at 01:50:37PM +0100, Thierry Reding wrote:
> > Hi ARM SoC maintainers,
> >=20
> > The following changes since commit 8005c49d9aea74d382f474ce11afbbc7d713=
0bec:
> >=20
> >   Linux 4.4-rc1 (2015-11-15 17:00:27 -0800)
> >=20
> > are available in the git repository at:
> >=20
> >   git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/te=
gra-for-4.5-soc
> >=20
> > for you to fetch changes up to a262e87ff354f12447bb6268bd63edf7ba1c20e0:
> >=20
> >   ARM: tegra: select USB_ULPI from EHCI rather than platform (2015-11-2=
4 16:47:26 +0100)
> >=20
> > Thanks,
> > Thierry
> >=20
> > ----------------------------------------------------------------
> > ARM: tegra: Core SoC changes for v4.5-rc1
> >=20
> > The big thing here is Tegra210 support, which is really only the Kconfig
> > symbol. Other than that there's a few miscellaneous fixes.
>=20
> Hi,
>=20
> We merge arch/arm and arch/arm64 and drivers/bus contents through separate
> branches, so having them come in from you in one combined branch isn't wo=
rking
> very well.
>=20
> If you don't have any downstream users of this I can just cherry-pick the=
m into
> the appropriate branches, but if you do, please send separate requests for
> those three categories.

I don't think that'll work. Or at least, the outcome will be almost the
same because of interdependencies between the branches.

For the patches in this branch:

      soc/tegra: Provide per-SoC Kconfig symbols
      soc/tegra: Add Tegra210 support

These are dependencies for the following:

      ARM: tegra: select USB_ULPI from EHCI rather than platform

Whereas these two:

      ARM: tegra: Ensure entire dcache is flushed on entering LP0/1
      amba: Hide TEGRA_AHB symbol

can be applied in any order. So I could send you a pull request with
only the drivers/bus patch, and another one with the dcache flush fix.

But that's about it. The Kconfig changes are dependent on each other,
hence will need to be brought in via a common ancestor, unless you want
to resolve a rather annoying conflict in arm-soc.

As for the for-4.5/dt branch that has a dependency on both the
for-4.5/clk branch for a DT include file and on the for-4.5/soc branch
for the new ARCH_TEGRA_210_SOC Kconfig symbol. I suppose it wouldn't be
strictly necessary to pull in the branch because it is a ("soft") make
dependency and the Tegra210 DTBs will simply be ignored unless the
for-4.5/soc branch is also merged. That's slightly confusing because
then there's a branch with DTS files that can't be built.

Anyway, let me know what you prefer and I'm sure I can work something
out that will suite you.

Thierry

--QKdGvSO+nmPlgiQ/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJWg/xkAAoJEN0jrNd/PrOhgCMP/jmpQlVkeImnF8ZUgCbGTJSE
+5lJIL9LqHZiCl1MTpX4dPQb6PIcWZOnGsqs6LZiN/irUCXQA+NfO62heF2I59Gi
fwmoLKp18+JslKbQ5HJaZ4ifsxJ47DMcR6+ciAzIVzLwffhFgF79RyWysCgPBCwu
E5JmMQBD/AClItn3naBlsRjbJGc1mMzSibqX84yP86c/z4kyK75jnmqwiY8VIjLs
sNO6DZ6GQ3H4gQvHtVuJUQQ3IrdpvsjQyfUFPZQ/aku0fUS6KZwYlk7LRANcEu1B
8SSTBsPU7PwviUmV6XhmPHKFKO3zKD4vnhG1FWPIhvEVIEF4lx+g299D8ltIHsr+
lS1U2QDEwKtcloBt5dRb6LfUA/pZvZYG28t/vVfptQo7v51Ll8G/YJ4MvPDLXzHS
p6ExVauzrmiGK8RUQtT2V2xAVuvXg0fk4QZ9cSzcEhtRKoEnXbOhbc/aBn4JPZ5g
hHcwEM9Va1KUAiH4UAfdbgwY5aNgiAWwuPs48FcORwTXwDwkLvAERlFA4gx/bqU6
1/RJ/QaURI5jQB6NXxZyqxn3TMaWz+vzy8pPmOIrybsim4OHK948fNjOkInRPT29
qYSy+qyLuLAp+dFox51CCPya/Pa5N8pYM0axQkGZlpgZgEQ/Eantr3s+C3j1I35o
F2yoA+2BA7VjuEUMaICe
=6huo
-----END PGP SIGNATURE-----

--QKdGvSO+nmPlgiQ/--
