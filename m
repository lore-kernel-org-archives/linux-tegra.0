From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 1/2] ASoC: tegra: implement suspend/resume for Tegra30
 AHUB
Date: Mon, 3 Jun 2013 19:53:26 +0100
Message-ID: <20130603185326.GT31367@sirena.org.uk>
References: <1370281062-15238-1-git-send-email-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="TYjWXklH5JTzT8n9"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1370281062-15238-1-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--TYjWXklH5JTzT8n9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 03, 2013 at 11:37:41AM -0600, Stephen Warren wrote:
> From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>=20
> Add tegra30_ahub_{suspend,resume}. These use regcache functions to
> restore all HW registers after power loss during a suspend/resume cycle.

Applied both, thanks.

--TYjWXklH5JTzT8n9
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iQIcBAEBAgAGBQJRrOYjAAoJELSic+t+oim9TRYP+gP7HGe883Uw9ET2OZf7KkSl
0Z3z4NmJwCUfaplxHFd3pfhIjtfXhjLxgrhLYjbj+5M4KHGNiVa77q+PJM8fwN76
4DP8TO+lxJ/aPdWiuvXjM00sleOxJo26n5o7a69/RFSM//ZYFWrCvhYAPDbm8D+2
E83Mm/tQ8Wqd8YWx/b+BdOkG3th8WZyOD0dUPacJE5EDrcrPAR/o5KgFt8i7OaId
1caRAslYoMfp1m9KKLyeSJsi0BR8KPFwKyuk0avuUeRtmEHMAgvjmK4Nqd17x89+
sJJhrSBYvtBzCdMMFd1SUOOcuPocVsbulgOD8CGLfUqPxZPILoLkuNm/gKJiES8j
nO14oQMV2tbfNIo9ECDg5ddffQrHgjfqJVw1tNxI4idiz9AwIIQhPELMjn4+8PqM
c3ZiQUhIywjDL1sN1g4KKBQG5euf4isp8YaUU+69ikstJ4dO6OQQDsFejTu9mPy1
uqtoiPKjDWYGlRmvAAaBIwQae/9ziYGai73cVn5+inOcl+RfMuj26jZiFyD61s5t
cn8yyI1xvfEMSkXFV8Xma1sdjSbuSwOluGePdgdaUzuBrpb1BnRhUxgzTHAVDs5C
fc0/sajnNSHgS47zv92S0UCJvq7kiBIgfobkC3FYV5qnyx7m+S0d9mTETc2+8K2o
HVJxgghl2iL46WnShZHR
=skxU
-----END PGP SIGNATURE-----

--TYjWXklH5JTzT8n9--
