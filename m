From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] ASoC: tegra: always use clk_get() in utility code
Date: Tue, 14 May 2013 08:45:32 +0400
Message-ID: <20130514044532.GD14811@sirena.org.uk>
References: <1368473172-10198-1-git-send-email-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="YD3LsXFS42OYHhNZ"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1368473172-10198-1-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--YD3LsXFS42OYHhNZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 13, 2013 at 01:26:12PM -0600, Stephen Warren wrote:
> From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>=20
> Now that all of the Tegra device trees have been updated to represent
> the required audio clocks, remove the compatibility code from the Tegra
> ASoC utility code, and always use clk_get() rather than clk_get_sys().

Applied, thanks.

--YD3LsXFS42OYHhNZ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iQIcBAEBAgAGBQJRkcFjAAoJELSic+t+oim91vcQAJLrePcu5lL3p+tUUW3F5oND
4QAIEkLEwrBRRekkkfAefKq+QeFarR4JgDMDtiRC8QdBCtZhC1QwcwmBTYsADspD
ondQljTG9g1x6pmqkl3EUQ9wjvWPZ7aymk7x2sB+f8c/TU7J83/wFm/fegIpuxuS
fQMwttaF0jVmXHa9yKmXI+1nj4boNlPJxeuhFthgqlBbM9zAwFa1grmQ79yJdO4U
IaeIyiymqLgJrk2vixdKXx/heAGpX6bURRS/geiqHPHgqJX1s0UZRZ4yP6nNND1u
S7XhVo5pLxNYqSxaZyYtWiWeFHEUzIT7bjiwAiwjnbOXNXpwBt0mOPOQGKbCMeae
1SG48wkL26ksQyzqru0ROkau40VJrx29hPa/HBVTYnkRoW+7dNJ0Gwq1Pmp7HG3A
fX6rLvJ668mMkJ7sGigFPwT+bzb1MhlUhqKpZTy+Tzl6SNbzxdUnmcMloAhLe5xi
Nq2lD7WiNZFQLRtwJ33JRLXnLyj1SuoRIfpQY47N72Zqn98WMJlMdZra1grnW3V7
hiqvA5RjHIPJyHmwPAA91RVsCOIUqD37SXef0hSSEXRyAWJupXWtty6F3f5O9E1x
aM1hB9WGFbpGg4K20NE3+OMUo6MWzc+35JFCRslbcF/pEaU7jmscXzMVsc8rFAG7
uFd2QdydWA0p4yuDhBek
=bj5p
-----END PGP SIGNATURE-----

--YD3LsXFS42OYHhNZ--
