From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 4/4] ARM: tegra: fix big-endian issue with irq code
Date: Wed, 11 Mar 2015 10:48:25 +0100
Message-ID: <20150311094822.GI19577@ulmo.nvidia.com>
References: <1420817231-8346-1-git-send-email-bob.mottram@codethink.co.uk>
 <1420817231-8346-5-git-send-email-bob.mottram@codethink.co.uk>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Encpt1P6Mxii2VuT"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1420817231-8346-5-git-send-email-bob.mottram-4yDnlxn2s6sWdaTGBSpHTA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Bob Mottram <bob.mottram-4yDnlxn2s6sWdaTGBSpHTA@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, ct173-kernel-internal-81qHHgoATdFT9dQujB1mzip2UmYkHbXO@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--Encpt1P6Mxii2VuT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 09, 2015 at 03:27:11PM +0000, Bob Mottram wrote:
> Replace the _raw-writel with writel_relaxed to fix issue with
> running tegra in big-endian. Tested on Jetson TK1.
>=20
> Signed-off-by: Bob Mottram <bob.mottram-4yDnlxn2s6sWdaTGBSpHTA@public.gmane.org>
> ---
>  arch/arm/mach-tegra/irq.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied, thanks.

Thierry

--Encpt1P6Mxii2VuT
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJVAA9mAAoJEN0jrNd/PrOhiTcQAL+oby5j+6nSsXQjngbYer3s
gwXmeMHf2zMnxtM12Z6TVp5SRruaeX0U5lvEa6me8Fam3l2Nn1C4qcNt31F2gKZy
gZDs0Y0cNRUJ38FDWcxSHKBGetBATERdHBLkks/P0w8M3cU1K9sCrFq0xBiPXpzb
CBKtLQIDYefHEKTCZRma5/KCoZcjp67rU8c/J/kn1Et3HaRQFTDnIohxb463XD9R
8UDlZWYxkvgtlnTwl02sAWAACVIiPGJV5uTCWOouXwGhtet+w/HadcCtleZOkqeK
JaN9j08qoXDkRU+NyW8UKoOmy2EtYCz2BbN1+KnnmxcAu4zDdvqpRHe9k00V9hOo
AP8anTgNlCNaORTV1m7wJPdzCUmZShOwmmcwGDYfxDBTH6fx/ep4l0+F4j7kOc22
kK0B3AovS4dD1I/jP+SYHHPIFVc9O/fI6J/kLlTzaxdu3uWRQi/ltcECe9bYRQMK
h9QF0ceuU8EmZX1222Tdn42nRPPLxXaINO82GXWpWWGiGg6Sp4ef24qRvGH+Ievu
X5bL5v/KQaxESYrMTZl1SiH5JybsnFNoXw+JXN9PJsjTj5FryDYsaeVkx5POeWDv
glUN0fBCRwHXyWgDyP7ACyoazgMgcUPyug4M0D2IUsyTYfeZdk49oIRYUpFJle/w
X+TIpHqQePmOTq4CQlnU
=zu+n
-----END PGP SIGNATURE-----

--Encpt1P6Mxii2VuT--
