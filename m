From: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: Re: Unifying device tree filenames, and U-Boot SoC name
Date: Mon, 21 May 2012 16:22:14 +0200
Message-ID: <20120521142214.GC21513@avionic-0098.mockup.avionic-design.de>
References: <4FB3E788.2040801@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="YD3LsXFS42OYHhNZ"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <4FB3E788.2040801-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Tom Warren <TWarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, U-Boot Mailing List <u-boot-0aAXYlwwYIKGBzrmiIFOJg@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Allen Martin <amartin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--YD3LsXFS42OYHhNZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

* Stephen Warren wrote:
> I just posted a patch which causes U-Boot to define some variables
> describing which board you're running on:
>=20
> http://lists.denx.de/pipermail/u-boot/2012-May/124556.html
>=20
> In particular, see the description of that first patch for motivation
> re: U-Boot scripts.
>=20
> The one issue here is that the U-Boot SoC name for Tegra20 is tegra2
> (hence it will define board_soc=3Dtegra2), whereas the kernel's device
> tree files are all tegra-*.dts not tegra2-*.dts.
>=20
> I propose we fix this by:
>=20
> a) In the kernel, renaming tegra*-${board}.dts to tegra20-${board}.dts
> (or tegra30-${board}.dts). This appears to better match what most other
> ARM sub-arches are doing anyway.
>=20
> b) In U-Boot, rename the tegra2 support to tegra20 so that U-Boot ends
> up setting board_soc=3Dtegra20, so this matches the .dts/.dtb filenames.
> This would involve renaming arch/arm/cpu/armv7/tegra2/ to
> ./arch/arm/cpu/armv7/tegra20/ and editing boards.cfg to match, and
> possibly other related changes.
>=20
> This sounds like churn, but I think we could easily fold this into
> Allen's series that moves the tegra2 directory in order to put it in a
> common place for separate SPL/non-SPL builds to avoid doing this kind of
> thing multiple times.
>=20
> Does anyone think this is a good/bad/... idea? Thanks.

I like it. It's better to have the names consistent.

Thierry

--YD3LsXFS42OYHhNZ
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAk+6T5YACgkQZ+BJyKLjJp8GhQCfTU7FscKgkzy4hdvVHc+pGZs4
Fd0AoI86KLsVlv7EzkZ7AxUw1IcX+CbA
=fev9
-----END PGP SIGNATURE-----

--YD3LsXFS42OYHhNZ--
