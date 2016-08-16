From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 3/4] clk: tegra: Correct bit width for PMC output clock
 mux
Date: Tue, 16 Aug 2016 15:03:48 +0200
Message-ID: <20160816130348.GB4133@ulmo.ba.sec>
References: <1470134069-12178-1-git-send-email-jonathanh@nvidia.com>
 <1470134069-12178-4-git-send-email-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="/WwmFnJnmDyWGHa4"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1470134069-12178-4-git-send-email-jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--/WwmFnJnmDyWGHa4
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

--/WwmFnJnmDyWGHa4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJXsw80AAoJEN0jrNd/PrOhh5EP/3te3LUQyjpclWugHZyj2HBP
TBLdkU93zBRZ3Sw3mqvVnsTURQwDz+ovXLJhQYGP4eOnmWmBx7cqbCC5gAUQCzP0
7TqhL79JwN99SjeuVTH+IHzqNy82UsIHOvLNNsvl94xwSzqRacOGBZV1yTaE0qJ6
67FNHzVkIOelJZWS3ipSuAV+Xhuhs139aFIRrr8CV7x0nJY+QJkZzrRU1Z0TG50V
9PQHUOpFNr9Mk5tRIbTptYRA4a9CnUBIE7X5Zue+5wh+sVcbo2h8CM/EfHPejCWR
SSU41cOeoCIYFl1xLpTsSLXIN2RF7e0afI+bjOJQe88ab60ZlkQCxNL4680ihRBJ
1o5YBU+CNARl/WPi2Z2XXhGWoU1wm346UJaiPPOgn/dfUDi4Fkc2UtbRRlUYttuD
vDkV/EQ9mcYRTmIiM75zGoifUcUxLSRvTLXZe3h1uYFfPaqOLez0l0Icb1A6skUV
/Tyn0sv87d9HBJPxh8D2i0GJlK5cqPYqVc5FqsFbVhvAfSM0NP4rOWml9jWFzopV
+VBEYnFQiZgu90oLzGgx99VBFjg3zqT1CJU0St6533DFwwL7bqA0AlY0UP4ClFNH
1C95XSSOwRi9EGn+21bfnh6Iut5oJhgsSpJjmHDkvgiOZTY+FbO88OixnL+eMjle
1UptadEeWW3lBTdzv4qH
=p1pV
-----END PGP SIGNATURE-----

--/WwmFnJnmDyWGHa4--
