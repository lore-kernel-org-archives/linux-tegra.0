From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] bus: tegra-gmi: fix build error
Date: Tue, 8 Nov 2016 16:45:04 +0100
Message-ID: <20161108154504.GB2244@ulmo.ba.sec>
References: <20161108135058.1991567-1-arnd@arndb.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="U+BazGySraz5kW0T"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20161108135058.1991567-1-arnd-r2nGTMty4D4@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Mirza Krak <mirza.krak-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--U+BazGySraz5kW0T
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 08, 2016 at 02:50:29PM +0100, Arnd Bergmann wrote:
> The newly added driver fails to build right away:
>=20
> drivers/bus/tegra-gmi.c: In function 'tegra_gmi_parse_dt':
> drivers/bus/tegra-gmi.c:97:11: error: 'dev' undeclared (first use in this=
 function)
>=20
> I guess a last-minute change removed a local variable, this
> adds the obvious definiton.
>=20
> Fixes: 4f95e6a5c9e4 ("bus: Add support for Tegra Generic Memory Interface=
")
> Signed-off-by: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
> ---
>  drivers/bus/tegra-gmi.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

This got reported by the 0-day builder earlier. Turns out this slipped
through because my build setup failed to pick up the new configuration
option. I pushed a fix for this to the Tegra tree, so it should all be
good by tomorrow.

Thanks,
Thierry

--U+BazGySraz5kW0T
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAABCAAGBQJYIfL9AAoJEN0jrNd/PrOhtNUQAJdBZjUm5SEbTIf29QWBRo9r
keX7rXbTFWf2jibYyTgkb3mhd7QIVjfwVy02Jh99b5Fj8rxOekXV8cyZX3pdEfad
TNqjVmuJpFdb+2MF4+4Y8rKEHOAyO96h3wPCTJUmbhr4i/HiG48pd5AObu/8JcZz
sTBpNWHmqs+NCiXS2pDbCkDdGE2sLu1B9CEdw4DrvSuraxTxwvdnNcQXUhnhNlWY
lGlWD8wCvr3BWQdB9inDWiMaVJSABH6Vx08MaTdQ4fJq1eEP5tbqUISZxofqCf/Q
amt+fcf18v15eWLD+/HcLL36BBn5RF4Ke9kYrWQq2XbyFuQj6h+zZCzD00o+nD1i
ucDLxSUwe1R70BTnojF7XCqLoUFfLX+na2hIxTNFRmnXuMssTVCqn/GTNs79FF5I
qu/NnrTjN9zzIi3/Z40q1PL2JF8tx/dyp1ZsgBVuuPxEL3jonMoSWvGBY2Cjy+Ve
VxqQraazSENZ2rZQh8taQuyzcfdINABqiPn22wKHBT6vvhQHdCMF/aGm5meqXh8j
sE1kU0P+cpJAhsXKH27HXHjJyPDKo9Vz8JIu5b0INjySha9fPI5B5dMVTKfenEch
ASnl30BzjWTRvZwQrgbDR9NpgKALbte9kurq6nrhs70G1+TioJxHDE+n2ac93Nnd
y6p0ueR49fBcjUTZV511
=ffON
-----END PGP SIGNATURE-----

--U+BazGySraz5kW0T--
