From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 3/4] clk: tegra: Correct bit width for PMC output clock
 mux
Date: Tue, 16 Aug 2016 15:02:21 +0200
Message-ID: <20160816130221.GA4133@ulmo.ba.sec>
References: <1470134069-12178-1-git-send-email-jonathanh@nvidia.com>
 <1470134069-12178-4-git-send-email-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="J2SCkAp4GZ/dPZZf"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1470134069-12178-4-git-send-email-jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--J2SCkAp4GZ/dPZZf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 02, 2016 at 11:34:28AM +0100, Jon Hunter wrote:
> The bit field for setting the clock mux for the PMC output clocks is a
> 2-bit field and has always been a 2-bit field for all Tegra devices that
> have these clocks (starting with Tegra30). However, the PMC clock driver
> incorrectly specifies that this bit field is 3 bits wide and this causes
> other bits in the register to be over-written when setting up the mux.
> Therefore, correct the width for PMC clock mux to prevent over-writing
> other fields.
>=20
> Signed-off-by: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>=20
> I did not bother marking this for stable because it has been around for
> such a long time I don't think that this has caused any problems. I only
> stumbled across this when dumping the register contents during some
> testing. Nonetheless we should correct this.
>=20
>  drivers/clk/tegra/clk-tegra-pmc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied, thanks.

Thierry

--J2SCkAp4GZ/dPZZf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJXsw7bAAoJEN0jrNd/PrOhzDkP/1RpOkYL2yxQRQgb3kCGj8pU
f+XnaAr8+sEBxsm/8fxSFS1BEx5Qt3qbYnxvNypMdT5uFksFGJCCrZRVOkxRh4nT
gJ/PbmatDDOZWF7wpMftbfqhs4NLFDbHGtU4LSeYIDWjMaoyMb3b2dupwHr40SYT
BNCDYr0r38H4CLLyRcRq+i16FN6JyXQpoVvp40++yL+88ppBkBHdUOohkQurT4Wx
Hriwp7xcOwqzz9blUSvgjfi0XfVaupulITISWJPJKW3dsOmShIGcYbCB54palukD
Ta8dFO5MGpnfsD9HfIUf0fLeE4YwOOrKMvRFgWaq1mvfa+1K/xsv6ZmHZUp+8WyK
c/ERmnGPLiYUzf98gkaBcsa1Z9F7wXXcp0XquBXKSj342TJ+2xoInlY1kbZlgHQB
4gQUmZmFPhF0KNNHdwjnD3dEZwRSoII8KXOTrAkURmyW24WxttiU4KxYn/K4qthQ
fLbbexFKTNVPSGnPaPTqV0nhOpHb6ec11npT93IMZo5ub1WmOv2J4IdgfdIow40w
X3Iz5pa8ZUqXFIOynK8+kQlEFRyeUpc6sn6RK3wCnC//pDzkluPDUPKqod2t+Plg
lVcYrP2k3b+Mro0TR+3ftbZQQVciycCqJRWYVH78yyPuv27OeE3gaiU4KjC797PU
vrYlflKKwACJJ/huRwYv
=kT+H
-----END PGP SIGNATURE-----

--J2SCkAp4GZ/dPZZf--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
