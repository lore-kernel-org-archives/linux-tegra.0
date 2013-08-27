From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [cbootimage PATCH V2] crypto: produce consistent hash for
 zero-length data
Date: Tue, 27 Aug 2013 09:48:36 +0200
Message-ID: <20130827074835.GF8686@ulmo>
References: <1377555170-6841-1-git-send-email-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="AH+kv8CCoFf6qPuz"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1377555170-6841-1-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--AH+kv8CCoFf6qPuz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 26, 2013 at 04:12:50PM -0600, Stephen Warren wrote:
> From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>=20
> In real-world use-cases, hashing zero-length data likely never happens.
> However, it is relevant when testing cbootimage with a dummy zero-length
> bootloader binary, e.g.:
>=20
> touch u-boot.bin
> cbootimage -t30 ../tamonten-ng/tegra30.img.cfg tegra30-tec-ng.img
>=20
> In this scenario, it's useful to create a consistent hash, so that one
> can compare the resultant images before and after applying patches, to
> check for regressions.
>=20
> Hence, zero out the hash data so it has consistent content if it isn't
> written to.
>=20
> Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
> v2: clear region using calloc at allocation time, rather than memset
>     at hash-calculation time.
> ---
>  src/crypto.c      | 2 +-
>  src/data_layout.c | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Looks good:

Reviewed-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

--AH+kv8CCoFf6qPuz
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.21 (GNU/Linux)

iQIcBAEBAgAGBQJSHFnTAAoJEN0jrNd/PrOhSekQAIhf5SmngjzatzLaoES62tve
8GiSj0eU+jpSEWm4CMdG99rWlc6AfZt8vmGMoRvIEZOsfCzoEnqg2ULjEJPetjrF
kHFruXdP1xI0Psf7s8H3IIWfEIEaMGYV9vLqck6daYzvx7nTAErSv5557uCyjha0
aWKe3xQUO4PJy3JShyI5H4wcJhKq12XbYfrMgKo3Cp+tRLrw+rLFLuMtHrkW73xq
0YmtcRUgiA9Jc2KigkLRp7k1MpGphGJEP2WyrmvRXrn77aff8wX3M1YqOktjXP7g
5DsMO9y/roljeY2aJbbM0zQPW514fBoxY1tZyCDjot8xbxqgUnN9u2GW2BQ/YAkf
dnRgqy6nDpDj+uywtaNRpDTlHkEIhVB00+y6s10N0Zdpq+hHUGjIWm0PLwDnZt+S
PHnQJYzSpBlalHFP6e/367cQYuqcsSO1gjUGTBjqcWpgrtzgJgmOXwVI42EnSRE3
N7bVvtsRrWrZpHYLeHRbWaKqrkSTgY9evtIZTvh91EWA38qqeHlDBiqoVdyFFp8a
0mDVhli/BWdDasEfK2XWU5qiQ93hQ8Ozetr3qte8yWOjxho4KBc4aCu2JjxrzlLr
rrttR5s5FsT3+b8jzgokj831jaFs4mJBjb4aJqb4hWof7mXRKbgen7LR0vqel9B2
vuO8wO5JXopNeo+agztG
=bX0P
-----END PGP SIGNATURE-----

--AH+kv8CCoFf6qPuz--
