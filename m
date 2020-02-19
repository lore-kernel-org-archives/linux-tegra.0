From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [alsa-devel] [PATCH v3 0/7] ASoC: soc-pcm cleanup step2
Date: Wed, 19 Feb 2020 17:03:55 +0000
Message-ID: <20200219170355.GG4488@sirena.org.uk>
References: <87d0anceze.wl-kuninori.morimoto.gx@renesas.com>
 <5d19876d-86a4-a461-f47a-68c7ba1f46ac@gmail.com>
 <d60ccad5-9c52-551b-ae22-2815ab768a59@linux.intel.com>
 <alpine.DEB.2.21.2002191900170.2957@eliteleevi.tm.intel.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="c7hkjup166d4FzgN"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.21.2002191900170.2957-cz35TXaqH4VICrp9aNEsHNh3ngVCH38I@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Kai Vehmanen <kai.vehmanen-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Cc: Pierre-Louis Bossart <pierre-louis.bossart-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Kuninori Morimoto <kuninori.morimoto.gx-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux-ALSA <alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org>, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--c7hkjup166d4FzgN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 19, 2020 at 07:01:33PM +0200, Kai Vehmanen wrote:
> On Wed, 19 Feb 2020, Pierre-Louis Bossart wrote:

> > We also see a regression Kai bisected to the same patch

> > https://github.com/thesofproject/linux/pull/1805#issuecomment-588266014

> issue rootcaused -- this relates to the new "opened" tracking, I'll send =
a=20
> patch shortly after a few more test rounds.

Oh, excellent thanks - I was just starting to poke at this a little!

--c7hkjup166d4FzgN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl5NanoACgkQJNaLcl1U
h9DF8Qf9GsLpU85BKuVRGsLykt81rr/+87ujyl8pzIcOzVotCJtAhfKR4DsnnHJz
7u01I/fyGwYdxO2gvRjlFxe4UO0KVJh8Kbmyh4ZwPjeAEa5NLhs9D9JQo7qEhRWM
6ARwANJVcZ43UQDcvlV3ZX7lHCuRZPQi2ZuIiaI9jo4jRpfEIh25iVuxjafrKkkc
AD1EYa/nFJKUWXRMrJfFhZdXYQvnY6pCX/3PGwrxD0gnwsaPW7wVR5iwElZyToVK
i/TIjmyKHvNXYSKbpYA/FQYYuAzwIUFJD7wczFgCH4ImrJbdYZl7RxJnso81UynD
s8aFo8gkQQ5ke6JIyJF+eHlQjhevWA==
=C3SM
-----END PGP SIGNATURE-----

--c7hkjup166d4FzgN--
