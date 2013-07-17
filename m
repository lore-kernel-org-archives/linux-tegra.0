From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] ASoC: tegra: depend on ARCH_TEGRA, not ARCH_TEGRA_*
Date: Wed, 17 Jul 2013 09:30:03 +0100
Message-ID: <20130717083003.GA22506@sirena.org.uk>
References: <1374013667-21435-1-git-send-email-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="rwlp4HDnqjg7pxzw"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1374013667-21435-1-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--rwlp4HDnqjg7pxzw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jul 16, 2013 at 04:27:47PM -0600, Stephen Warren wrote:

> Stop selecting I2S/AC97/SPDIF controller drivers from the machine driver
> config options; this doesn't really work if we don't know which specific
> SoC(s) we're building for. However, set their default values based on
> SND_SOC_TEGRA, since most people will probably want to enable support for
> all SoCs. This also avoids the need to change any defconfig files.

This doesn't seem terribly clever and is definitely not idiomatic for
ASoC.  If you want to just select all CPUs that'd be fine but forcing
the user to select the individual components isn't the style anything
else uses.

--rwlp4HDnqjg7pxzw
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iQIcBAEBAgAGBQJR5lYIAAoJELSic+t+oim91mUQAIuHSg8UfTu+vcNt1rYjR+VQ
BkaeU6vblSAfamN60Q19WPWxhw+7Lq+RBZ6KQEuBHA3EHeJdCVqtGMKnDAwQlUKy
mcDFPrBWApEhoRYvBudBkHSWcy3eepa6ZlR7gYYSTfx4krNJRm0WRqQCOTdcVFpM
bt8NCtk4/K9VvP1Ud6W17N3ouyc8tKyp4gNGtFmEKTUWI2ZuMpvU9vnovBsGuIBN
uK4Y23HX8U6JWye4ZnIEmTVerN7m86nYbgi8nc5/gVoJeXFMYsoahvKWaUFQV3lV
Il9oDbD8ldrIysWoVjlUmzb6zIugJEuB7BnFs/nqwGqUMnlw+MObZI/JwifChYeH
HrckGAniRx/YgUZjxKkRAt3qi9MZjmXqjEWaLJa5j9SboUlvVawCZmDEmsP+wde3
ld3U1nDKUFfYSw8+YSI2wY76h9WdGd+baklevIQHE4SORTsfhtWB0VjeM/LeaxO5
mFpL+EWeOoGmHn+m9aGKuSbUG1jUR59AawutUrFbBQBYaGv1wsMTLRyzZPj87o+A
fVngtAS2o1H/kOFN89RGEAPXLfxCPviqa8mGnqhMRXc9zxO3VCIaw0jsN9aoWpNI
iiJOA1Q8OdpGq2jyVp958wQOMniushThv7djIzaZyaJVHbfwHMi+jTi6s2TgZW8z
M0aO6wtc30JEAOI2TZOy
=39aj
-----END PGP SIGNATURE-----

--rwlp4HDnqjg7pxzw--
