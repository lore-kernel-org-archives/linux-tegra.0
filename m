From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: soc/tegra: fuse: undefined option ARCH_TEGRA_210_SOC
Date: Fri, 15 May 2015 10:57:01 +0200
Message-ID: <20150515085700.GE4984@ulmo.nvidia.com>
References: <CAD3Xx4+6r1w+oKgjUAuLXzszy9-uRWvXyyfv3q_1YGC6shXHFQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Rgf3q3z9SdmXC6oT"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAD3Xx4+6r1w+oKgjUAuLXzszy9-uRWvXyyfv3q_1YGC6shXHFQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Content-Disposition: inline
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Valentin Rothberg <valentinrothberg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Paul Bolle <pebolle-IWqWACnzNjzz+pZb47iToQ@public.gmane.org>, Andreas Ruprecht <andreas.ruprecht-d40JDW7QUjc@public.gmane.org>, hengelein Stefan <stefan.hengelein-d40JDW7QUjc@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

--Rgf3q3z9SdmXC6oT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 14, 2015 at 01:50:08PM +0200, Valentin Rothberg wrote:
> Hi Thierry,
>=20
> your commit e3cf5bf687df ("soc/tegra: fuse: Add Tegra210 support") is
> in today's linux-next tree (i.e., next-20150514).  The following lines
> in the commit reference a Kconfig option that is not defined, so that
> the driver and the affected #ifdef blocks cannot be compiled:
>=20
> drivers/soc/tegra/fuse/Makefile:10:obj-$(CONFIG_ARCH_TEGRA_210_SOC)
>  +=3D speedo-tegra210.o
> drivers/soc/tegra/fuse/fuse-tegra.c:104:#ifdef CONFIG_ARCH_TEGRA_210_SOC
> drivers/soc/tegra/fuse/fuse-tegra30.c:49:    defined(CONFIG_ARCH_TEGRA_21=
0_SOC)
> drivers/soc/tegra/fuse/fuse-tegra30.c:148:#if defined(CONFIG_ARCH_TEGRA_2=
10_SOC)
> drivers/soc/tegra/fuse/fuse.h:84:#ifdef CONFIG_ARCH_TEGRA_210_SOC
> drivers/soc/tegra/fuse/fuse.h:104:#ifdef CONFIG_ARCH_TEGRA_210_SOC
>=20
> Is there a patch queued somewhere to add this option?

Yes, these patches are all in the process of being merged for v4.2, so
I'd expect this particular Kconfig option to show up sometime soon now.

Thanks,
Thierry

--Rgf3q3z9SdmXC6oT
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJVVbTcAAoJEN0jrNd/PrOhb2kP/36wKIjQJfsuTNd3CS4Qfs7j
sJ8DCItzFnMOm0nC5RzSo3RvbcQ5yd6GbmRLM5UhGesLmBnxyRxJ3e4vhhqeSaDa
98IIeZZFcjE7SNFbk5Ax8r1WHfuyrDL2UBmSzR4PN9apAH7cMwiCFzhbVoCcgJPx
eUBEERbDK+IGkRPvD6AagwBdLJLog4DwCgn4juXsFXA83pLDK0YsiMSeiTG3hWSG
Eoq8uPUCmMX94BCgdirHZ1LzEONrMr58iRWVJk8SlLSWjKrDWnmvLDxjWNguESoo
0hadQgYKWwjIChj2nmhnYlTXezzEHFCMqi08IgvQdAN7crSu1+L1vR5KHFkj2SKB
HLOElKu6grxdIEyZd9ss5sRN3abJy/tKZm871LB0pfOsGUquuRv7OmYWCWuqXQme
3DM/mw2fMx0cEv5dxqzeaqj9+kE6xYVA8tq350njKnKImDdk1ONHlQt94ErvBCIY
itcKs1keQ7+qdOkfOtxEO+F9Qt/6rXtaWXK6fthArcmgRJZuxHsCEKqc63hc3Tk2
WqqWEE8WZAnCwGbsXcTDgQ8++KS2T7JXDJLsBe5pXXARYcnqPsmFnomVVu5yu184
5jaZ28cj0r7v1zDw0dOFx61fm+eVcX8Lp7PkeXdNFJD1Tu1FWRwAOfURqBtPaIZr
LR9D/fUnB5hD0UjfqKAm
=QG7F
-----END PGP SIGNATURE-----

--Rgf3q3z9SdmXC6oT--
