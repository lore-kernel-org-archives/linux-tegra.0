From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] ASoC: tegra: free jack GPIOs before the sound card is
 freed
Date: Mon, 26 May 2014 14:32:47 +0100
Message-ID: <20140526133247.GB22111@sirena.org.uk>
References: <1400796893-29540-1-git-send-email-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="d+OnLgn+wkzLMn3r"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1400796893-29540-1-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--d+OnLgn+wkzLMn3r
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 22, 2014 at 04:14:53PM -0600, Stephen Warren wrote:
> From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>=20
> snd_soc_jack_add_gpios() schedules a work queue item to poll the GPIO to
> generate an initial jack status report. If sound card initialization
> fails, that work item needs to be cancelled, so it doesn't run after the

Applied, thanks.

--d+OnLgn+wkzLMn3r
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJTg0J8AAoJELSic+t+oim9CVkQAJahzO8TY/XX4YFoeiqXRoDo
gfH+OYIRxvtnURw4U+Ohh+78lDOyxW+hIdbpiXxKdgUnIcynZvED8nbT2/fS+C6Y
8g71DQMQAKNwFsE6qNqoOz9dy//H6R4rjEOn0nUsVObRyzmwrJfKU0CEX76+6oT4
oPB1s0MofRJCTgUFj7ds+7Ep7MMs7Q5oMk2ktvLSyOhF++K7A1W6EE9VmAoWyHbp
CoBk0f4eNkAKNX77y2Zs6v7ZnYlst+Jg0GlcNL4G1Cdqa8no+AIffuT+tsOy9uoS
uIOHUNFSBahQ1AJIPGwSNrJKgbJCs6ODwCLI8OAXnS6kVvQUK1JIborOR1XQk7e6
Lt15ytJCcYR+qhnRB6NTtMsUA0xmUbOa9XaGqfOf+tVdJPqNz3nUZg8D8JMm8T0G
31cqrf0vx6ghHQdcsG3HWKDQpnVNmepdT8+hg8M4hFyzvHHwyQE0j6Fr3TL+PK1i
s5SxC6lrTnM5DT1JUUr4yQV4UVKWU3Y6wuU2Jex4hrkZDZAUbwEmJH3mdNwd96jp
16Ml4Bb5Wwokwah2D2CT0YvTrXaGj94PaSJSY6d4DiQA+Q48N3SmP+8klzocknnA
1zIz7XfE30p3Yw/kiOm1J6hr1OE/bOqiIP2y3GBg3DnbsNot+QO3WXbemsR08LhS
YwTVI5XPH4BxVQThbCTY
=OUzp
-----END PGP SIGNATURE-----

--d+OnLgn+wkzLMn3r--
