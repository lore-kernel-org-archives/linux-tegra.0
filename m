From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/1] memory: tegra: fix fdc test bug
Date: Fri, 7 Apr 2017 19:43:01 +0200
Message-ID: <20170407174301.GA4386@ulmo.ba.sec>
References: <20170407172820.21292-1-ben.dooks@codethink.co.uk>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="PEIAKu/WMn1b1Hv9"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170407172820.21292-1-ben.dooks-4yDnlxn2s6sWdaTGBSpHTA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ben Dooks <ben.dooks-4yDnlxn2s6sWdaTGBSpHTA@public.gmane.org>
Cc: linux-kernel-81qHHgoATdFT9dQujB1mzip2UmYkHbXO@public.gmane.org, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--PEIAKu/WMn1b1Hv9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 07, 2017 at 06:28:20PM +0100, Ben Dooks wrote:
> The fdc variable is a bool, taking the address of this will generally
> produce true, thus skewing any users of the tegra_mc_set_latency_allowance
> code.
>=20
> Note, this does not seem to be producing a compiler warning. This was only
> spotted as it meant a caller was seeing 3 times higher than expected
> register results.
>=20
> Signed-off-by: Ben Dooks <ben.dooks-4yDnlxn2s6sWdaTGBSpHTA@public.gmane.org>
> ---
>  drivers/memory/tegra/mc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

What tree is this based on? I don't see this code anywhere in mainline.

Thierry

--PEIAKu/WMn1b1Hv9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAljnz6UACgkQ3SOs138+
s6E/og/+MAd//EpMnMS+reTTrbZ0bhDRO64ZMCnQG3+PRwGPtwimClvXpVsBdfpf
iqffaz1XC7VvnEyr63O8ZEAoAq6FGQyKnjof0a3fGTCpJfMPhkEs5WEErz2A7W4g
SQT/kVtF6rembM8OoNqhwlpe9uKKnEd53CHmMfOaP92qBJbkQp3EsiYI4wnfLgLE
cv4kGM3UXrw64ElQY+vaJEqUlU4OQcXtgA42k6E2ZBQfJmaCkQhwRGblglWijq7/
/g9bW22DRk8Uv+ZHyyuy4g0x5mmJm3MF9uyoNZgHCrWm82xRqGRdUR9DWAwhBkQu
4/8rfvRy3mgNLg7yTPeyW0HjDFLubh/HiHKggJuo8xrUTEnYOmSSEA0lS67FIB3T
z4FHbs7XaqQSxw6yRVbrCag/XM/mw4V7wMREya9p4jbzQJklpSu/1tx5qiYtFbFn
he395d4OZqH80uQaQlnOwoGnxjJAAIWZlZTpo6o+ucEWfdFlUMoJzAk6Uyp/Kh/Y
YKxSpYlscTRQlatPZM9Tr8EbZcpr8FA5FGaP35WPou5xcdWXmeTIdbmgKSruuIqg
VAUAhuIh2hdgkvmMAgJZgTVIgOEwUq4DxGhxkp47xRSG87W6lCs8dcNqUbBhQv97
2u0QDpWqEHUAx/ck+/TeJn7V4K9sPmy3vWDaQXqVWHHhk2q+Kks=
=20yk
-----END PGP SIGNATURE-----

--PEIAKu/WMn1b1Hv9--
