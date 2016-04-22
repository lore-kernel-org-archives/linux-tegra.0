From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 2/2] clk: tegra30: fix PLL_U post divider and init rate
Date: Fri, 22 Apr 2016 13:53:14 +0200
Message-ID: <20160422115314.GF9047@ulmo.ba.sec>
References: <1456778767-18413-1-git-send-email-dev@lynxeye.de>
 <1456778767-18413-2-git-send-email-dev@lynxeye.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="aZoGpuMECXJckB41"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1456778767-18413-2-git-send-email-dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
Cc: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Prashant Gaikwad <pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--aZoGpuMECXJckB41
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 29, 2016 at 09:46:07PM +0100, Lucas Stach wrote:
> The post divider value in the frequency table is wrong as it
> would lead to the PLL producing a output rate of 960MHz instead
> of the desired 480MHz. This wasn't a problem as nothing used the
> table to actually init the PLL rate, but the bootloader
> configuration was used unaltered.
>=20
> If the bootloader does not set up the PLL it will fail to come
> when used under Linux. To fix this don't rely on the bootloader,
> but set the correct rate in the clock driver.
>=20
> Signed-off-by: Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
> ---
>  drivers/clk/tegra/clk-tegra30.c | 11 ++++++-----
>  1 file changed, 6 insertions(+), 5 deletions(-)

Applied, thanks.

Thierry

--aZoGpuMECXJckB41
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJXGhCpAAoJEN0jrNd/PrOhhWcP/ijRSz+2FB4jkdzVVXoJMEsC
tekBAsy4D8Fm7wlTbjucgcPPMILZw8OXSjOx6QDSm/M1RXg6cMEtu57IIk8yyHHx
qI5FEsk5hs2ltF6jeCODWMbJB15q3Xr3VWwoCt2FZWEiZSkivXvqjRRozZBBZNYx
lz3CVNW45tXS1YzaVA251ACZ3YeNMIttsV4XJHdMeTTUZWmAvVl6i4CSR6oP9OYy
OVQ7kT5w6NqGf/F5qgJPexR9Bm9EuolGXftekvEt0DzRsy+OSQiaBo9pXWq1WaDl
C90pKHIvAmKIhXkGY6FIBVjGlgWQspGIrKN/fOmNBu0RYXbiw5W+r95xzLgLqWxy
RpnTV+qS6dpLxWvx+yzC9hzQmth6FeIuw+m9XeRoZzZ3FCm6uQZoA5WQHhrSAwvi
gLxUF6tjDXZGcNQ2+tjza5A079p66n4SLqlLVStziiYO41vVDyUiU/9EwiM1hpzB
5Ejve8R1Sf9Wg8yRCwyINUberGWQqvh1OMzoMYUMQUPV5sJbomkkQ3Z9AP747/2B
EwR+6KdQEw99TQNwMiA1ZsZrjbcW8nB4g4y1xKkd939QB0f/EG22/8fNhyLEU3gq
hbuWvrMzmwsUCecr+1xuOrpHu4UyebS2ovOFg0+vFUNxCF1TiOAPjjp49D93a/VF
IkUhxgzyk33LjzMXBw9z
=I9oY
-----END PGP SIGNATURE-----

--aZoGpuMECXJckB41--
