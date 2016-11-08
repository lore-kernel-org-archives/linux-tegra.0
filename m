From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 0/5] Tegra PMC Updates
Date: Tue, 8 Nov 2016 12:09:46 +0100
Message-ID: <20161108110946.GB13098@ulmo.ba.sec>
References: <1477164236-29351-1-git-send-email-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="Pd0ReVV5GZGQvF3a"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1477164236-29351-1-git-send-email-jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--Pd0ReVV5GZGQvF3a
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 22, 2016 at 08:23:51PM +0100, Jon Hunter wrote:
> Some updates and clean-ups for the Tegra PMC driver.
>=20
> Jon Hunter (5):
>   soc/tegra: pmc: Guard against uninitialised PMC clock
>   soc/tegra: pmc: Simplify IO rail bit handling
>   soc/tegra: Clean-up PMC rail IO error messages
>   soc/tegra: pmc: Check return code for pm_genpd_init()
>   soc/tegra: pmc: Remove genpd when adding provider fails
>=20
>  drivers/soc/tegra/pmc.c | 56 +++++++++++++++++++++++++++++++------------=
------
>  1 file changed, 36 insertions(+), 20 deletions(-)

I've applied this series, though I had to rebase most of the patches on
top of Laxman's I/O pad work. As a side-effect most of patch 3 did no
longer apply, so I changed it a little.

Thanks,
Thierry

--Pd0ReVV5GZGQvF3a
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAABCAAGBQJYIbJ6AAoJEN0jrNd/PrOhbmYQAKXKKOcCdgxKtFJJtzDqBIqJ
7NSRTsBuLbn9h3+ZDkUm86LQ2UeSuzM4YJVuFXwPYOmhjmIXiivlLj/7nxHfkwsU
d42jXi/58o7onAK/QUVKv8/JIpCxoi/XmUwPr/qUULwxkzUDe/tFgtoA6OsdgPot
D1X9NAa7KMQTUV+g+IZoN1/7PdeYJjZn3SPLMp/W3fdyGuO8OVmJHD9RsjH3QU6B
7tZAmIBrFWkmoMkWslUfRw2c6a3yz9I7JU1hiKTD+lWpIkRoeIW7x8PDn1cpEGFo
Fg2OrU39YJ42HIJAPxGm7nRZn7GKXHTlty0eNkcGd9a8CZBcuitikSoP6YMUBvEi
+Kw17SXIsGdR1yCAZRB2lBgDAVYKCj0tLKBZA0LYfH2jFj5vSAIx3eS91mLPPmnx
N7KY5PkQzBr+nz6uzBGfmrG7owxp8bjAo7SSeTmYmrZCslJXKKxbWgOWb2i1pzyw
emXixoV3yW4aZFhBhaDvWBs12OMg5Y1qRaQYyKSP04iwUCnm9tbVi5BJPm263nRo
X/v8OCgOi0d39qPY2Qgb01m6rzwDYaRvNdpu5xCw91zqhoxdhd2o58XlH5Pw14gy
RkE7d2Sc+rSZreLTJuAPVMJeGUUbEExkjZfREJn52DTY1r33RarR1MSnQ5NvF4dV
xeS1hBf29FXRDCbIvRLb
=sWMR
-----END PGP SIGNATURE-----

--Pd0ReVV5GZGQvF3a--
