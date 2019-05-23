From: Mark Brown <broonie@kernel.org>
Subject: Re: Applied "ASoC: simple-card: Fix configuration of DAI format" to
 the asoc tree
Date: Thu, 23 May 2019 14:17:52 +0100
Message-ID: <20190523131752.GE17245@sirena.org.uk>
References: <20190521203241.B277E1126D1B@debutante.sirena.org.uk>
 <51ce00db-05ce-ba66-f1be-74c800f6daed@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="XuV1QlJbYrcVoo+x"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <51ce00db-05ce-ba66-f1be-74c800f6daed@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jon Hunter <jonathanh@nvidia.com>
Cc: alsa-devel@alsa-project.org, Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, Takashi Iwai <tiwai@suse.com>, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
List-Id: linux-tegra@vger.kernel.org


--XuV1QlJbYrcVoo+x
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, May 23, 2019 at 09:54:25AM +0100, Jon Hunter wrote:

> Please can you drop this patch?

> Per some offline review with Morimoto-san, it turns out that the actual
> issue resided in my DT (which was incorrect) and not the simple-card
> machine driver.

Sure, can you send a patch doing a revert with a commit log explaining
why please?

--XuV1QlJbYrcVoo+x
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlzmnX8ACgkQJNaLcl1U
h9DyeAf/aqaSRpEHFdpE0yh4ivOxtAiWHU4BGbL0CGJ3CqeO3BzuYJQHxDNAgNWe
6+jnVf+RcMVwAFOJ3E4fqt6rYsQ+qIf/aHRGKmUX++TapvVWGnYCMZ6QK3FugGdp
9YAdt2Go05f+SuPe8xCpgnh2NZubzLRmKycDBbW9xc9C7OOgi+2BxXpdyL7Z66bH
cYsJ/OdsgDBVnrl2wT4xVMfS6C4x93ym2m4BZEls7E9tyV3E4niW/wMcTlC3I2gd
SvunVwfZf/3SagJYwJpOBl2zFX/Mi27G+b0O3uCXpidWAZag2CgDPtB2CoAH7/XH
r9LWxEXv8rzMATbdPAIp9UFP+BE4JA==
=jm60
-----END PGP SIGNATURE-----

--XuV1QlJbYrcVoo+x--
