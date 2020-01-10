From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/4] memory: tegra: Correct reset value of xusb_hostr
Date: Fri, 10 Jan 2020 15:34:37 +0100
Message-ID: <20200110143437.GE2233456@ulmo>
References: <20191220002914.19043-1-nicoleotsuka@gmail.com>
 <20191220002914.19043-2-nicoleotsuka@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="KuLpqunXa7jZSBt+"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20191220002914.19043-2-nicoleotsuka-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Nicolin Chen <nicoleotsuka-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: joro-zLv9SwRftAIdnm+yROfE0A@public.gmane.org, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, iommu-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--KuLpqunXa7jZSBt+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 19, 2019 at 04:29:11PM -0800, Nicolin Chen wrote:
> According to Tegra X1 (Tegra210) TRM, the reset value of xusb_hostr
> field (bit [7:0]) should be 0x7a. So this patch simply corrects it.
>=20
> Signed-off-by: Nicolin Chen <nicoleotsuka-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>  drivers/memory/tegra/tegra210.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied to for-5.6/memory, thanks.

Thierry

--KuLpqunXa7jZSBt+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl4Yi30ACgkQ3SOs138+
s6HnChAAlH9Yv1ffvGQBL7EGN1kk3CBGC5ioxvxbPHjtk7tQhpESolBHMLLsAGIO
a8MT248f+xIhyJ1KIcr2KBatN7OHkpDzwbUjqEY/YkpVtaFv+OtZiTLGFOHXF/IV
r+NdozdY0wYbcNr84AGJoIjGzUP4yxreQ5k+MeZhZiUlSAwuSqGBaXgNJO3ILwP9
MkvWIWF0qdIJaFr9TnekBxusLdjkk+5+S8wWkgBT8t3VQidLDJwcrbvFeey6+zSm
G6cfuLKRPUxnh0mjrhptz+ykE0ew4mDoN1KcmYRu0pdz3Em9SAfg0bFUiuZXhz+w
gsEsc/DWhsTzG2zbSuO82oTes1u66rwSz6LzUNWX+isAbUazd3MpN8Ff4xwuSDHk
7wQYbG9514z60MXQQ8DFvoKaRikQXF2TcTESvOZRcaUxOcEqDrhIYSif+cFHiYfU
hWVv1YU6RIH6oQO4gtVbJbNPMYrNxwbifLm46fHkiylkc5VOFelXRd4roXdhNZBX
uqmSY0sa/7xUNmXaCvS7N1tOrfmVSXKWBzRB1waCZyhEkFnkreWfa1KCQh0KMxLT
GsLAw6ICzF7cgR0WWMd4hc04bEU8wG+eWgDZkysK2hVRl3sG7hyCnhahT6OugCpv
4jDTUd2qR7tScl63x4t0yM8WiWgeRia7K8S4L7GIwXpvjWjYVUU=
=PM99
-----END PGP SIGNATURE-----

--KuLpqunXa7jZSBt+--
