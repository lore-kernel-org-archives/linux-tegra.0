From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 18/31] ASoC: tegra: allocate AHUB FIFO during probe() not
 startup()
Date: Sat, 16 Nov 2013 10:04:21 +0000
Message-ID: <20131116100421.GH15393@sirena.org.uk>
References: <1384548866-13141-1-git-send-email-swarren@wwwdotorg.org>
 <1384548866-13141-19-git-send-email-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="PW0Eas8rCkcu1VkF"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1384548866-13141-19-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--PW0Eas8rCkcu1VkF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 15, 2013 at 01:54:13PM -0700, Stephen Warren wrote:
> From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>=20
> Teh Tegra30 I2S driver currently allocates DMA FIFOs from the AHUB only
> when an audio stream starts playback. This is theoretically nice for
> resource sharing, but makes no practical difference for any configuration

Acked-by: Mark Brown <broonie-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>

--PW0Eas8rCkcu1VkF
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJSh0MiAAoJELSic+t+oim9qU8P/0bicxG1XfaX5QcKbEHCI0ic
wBwEjPntytMlzYo5HKLtS0dUVkviZW01MrCbsCCyg5DQeoIA1nnot4PM0IHmeE5s
PAQqn4ubqp1DsGWvaOKCUTTcCpDoI4ThUjPdEgS1Bnr4fKOe0JVuXc52ri1wJoQy
/RwbfjAfC4EItaZQ+offvyjkdxXH/rPOWSR8/U+st10r/xrF5sTsNDLMrThO+wkj
k1hSvjH3tUeSN73uGvtVSgmD7vh/9f+djMRj31qxDEeaW2ZG/hYoHLQEeOq3DXYs
BdppDdogrsGStQXVoE0nZYwlIDogDr+g/szc1hxNh+paK2/wY/bPnNJHNaOkCDVO
747fHbkzyCBJnLFgZuwYdp7Pwcwmeq1KROgMgTsuvYX/9xpzkIp6NeRAw5ivnYvF
2wKO5cz7gjLVI7MKScrnrZN9tI3dRIRhgNb9lmbHVC+9z7bDsFaYp3t1h/qa8DbD
AvcGedYzqHFSk0vES7I/ds/Tn0BIdTDfjoH1D+vraoxe/s8qCYW/nw34wLh7kkIJ
yk4y7Qe2TeXoNjaxuZfciT3rjUy/2nAgQgNFSz4ix2Suy38eH1EWTuBg3iZcfQ2x
Exk1YKuRKYqjzBUi4KY+6n+4WSvwHfiXCnOIR7pDxVBiVGhqzOMhPM2avKmObbpN
51o8LBNxQ9434kTQIBMu
=I51B
-----END PGP SIGNATURE-----

--PW0Eas8rCkcu1VkF--
