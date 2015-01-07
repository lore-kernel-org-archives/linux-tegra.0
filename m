From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] ARM: tegra: Regenerate defconfig based on v3.19-rc1
Date: Wed, 7 Jan 2015 16:18:47 +0100
Message-ID: <20150107151843.GA2912@ulmo>
References: <1420550407-4059-1-git-send-email-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="rwEMma7ioTxnRzrJ"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1420550407-4059-1-git-send-email-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--rwEMma7ioTxnRzrJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 06, 2015 at 02:20:07PM +0100, Thierry Reding wrote:
> From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>=20
> Removes the following entries from the default configuration:
>=20
> - PM: enabled by default (via PM_SLEEP -> SUSPEND)
> - RESOURCE_COUNTERS: removed
>=20
> Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
> I intend to apply this to the for-3.20/defconfig branch if nobody
> objects.
>=20
>  arch/arm/configs/tegra_defconfig | 2 --
>  1 file changed, 2 deletions(-)

I've applied this to the for-3.20/defconfig branch.

Thierry

--rwEMma7ioTxnRzrJ
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJUrU5TAAoJEN0jrNd/PrOhYYwP/jbSHud/lE1A1yNME69PC1sR
7ekseMIl6TdJJFURfrNDjoM1yEZFlq77GhpBdu8N3Ao7Aq1fO1a7diqqsNpztenn
ieGs728IhxGD3aWHGQcCoAfu5MpVVP5ASiybYqnUrQIsyqD2Zk7z4DGwi04laovO
yPaJRd39G4GZDc/2CsmTnYOMpSKVbluVDzcikf93HZOPKIGqOos53umPdWDuSdUK
OmH1QBLQPzZRPM71Vup5Vkwkdhvoxk7hdPjgM0J3lTsMfvH1tTPtPn9IHIkm7sRZ
WqMeOOVwUBRfUpGkovxnvGiNATgWTzmS6UZA7tSOOvJk10xeJG9KOSGqm9OE/kxM
uemMXmcONaVHulP2axt5j29xkdMITVtM5a8F3oK4P3nLK36erF1YBDr5Nuw8U5iD
JychyPjKy153Gruv1iARtSfU3rt9jNPFjw0UMt0jDIyhjf9Hvj/2v66opAyIlcyh
fEHjoMc3TMeOe7J8Uj1VAvispqYd6jtty3+sKXeHlXzgqUF39XQzj/nt+f+HGBoI
4tMKffIlpDDKYqbBscne0KRfZRspC3WoGRtHk/uxchNR/33TzUDe1uXV9MfPQNxv
enXbUgvNzH60YlySte0/dnBXMEVW1tVosIUB2iFbkTPuFF4G8Mt+aKoHhfXcgfYO
6yhCYL6anVTbFev0rpoV
=KJeN
-----END PGP SIGNATURE-----

--rwEMma7ioTxnRzrJ--
