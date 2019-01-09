From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH] ASoC: core: Fix deferral of machine drivers
Date: Wed, 9 Jan 2019 18:36:05 +0000
Message-ID: <20190109183605.GH10405@sirena.org.uk>
References: <1546968494-22993-1-git-send-email-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="svZFHVx8/dhPCe52"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1546968494-22993-1-git-send-email-jonathanh@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jon Hunter <jonathanh@nvidia.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, Marcel Ziswiler <marcel@ziswiler.com>, Matthias Reichl <hias@horus.com>
List-Id: linux-tegra@vger.kernel.org


--svZFHVx8/dhPCe52
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 08, 2019 at 05:28:14PM +0000, Jon Hunter wrote:

> --- a/include/sound/soc.h
> +++ b/include/sound/soc.h
> @@ -925,7 +925,7 @@ struct snd_soc_dai_link {
>  	 */
>  	const char *platform_name;
>  	struct device_node *platform_of_node;
> -	struct snd_soc_dai_link_component *platform;
> +	struct snd_soc_dai_link_component platform;
> =20
>  	int id;	/* optional ID for machine driver link identification */
> =20

This breaks the build for the SCU cards (and we needs a little rebase
against another fix I just merged, though I did do that when applying).
I do think that this is going to be the safest thing to do for v5.0, it
can always be reverted later on when it's not needed but it seems clear
that a better fix is going to be way too invasive for the -rcs.  Can you
respin and retest please?

--svZFHVx8/dhPCe52
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlw2PxQACgkQJNaLcl1U
h9DsVQf7Bl7vEBMABSqiIzvDhDkyN+XK0TSjJ3FL2od/a+726iim+xXCPWWPX3lH
gJpGNqEdpUOoOHmF/vdJG+mXCgDZIWQNcno7WS2NXKxZTuR7nGq7jlEVPhCMB7uz
03p1MsAS9cgejzohTErsCKcgcGpdRvaJe+WyNwu4uQK5vaOFoS8e9VnP+RiLo3gQ
aQR0Gqxw4C3CwZZt7abSfwB/Y20gJ8xFreTAJOqAoqMQV4R4KOU0Wqmou2pYzLGW
D4CRr53m1xD1F4E2v+i/XvpHJ+FGRYkv287tj05kdaCgRQzsCMuYuZUw1wymXq/t
BszRVWAPqyfTHsJk+jTrcHlYroKyJQ==
=oZNb
-----END PGP SIGNATURE-----

--svZFHVx8/dhPCe52--
