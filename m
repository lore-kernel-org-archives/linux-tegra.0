From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH] ASoC: tegra: Read and use the GPIO flags of the
 headphone detect
Date: Tue, 21 Oct 2014 22:23:45 +0100
Message-ID: <20141021212345.GA2344@sirena.org.uk>
References: <1413905609-23268-1-git-send-email-alban.bedel@avionic-design.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="jI8keyz6grp/JLjh"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1413905609-23268-1-git-send-email-alban.bedel@avionic-design.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Alban Bedel <alban.bedel@avionic-design.de>
Cc: linux-kernel@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.de>, Stephen Warren <swarren@wwwdotorg.org>, Thierry Reding <thierry.reding@gmail.com>, Alexandre Courbot <gnurou@gmail.com>, Lars-Peter Clausen <lars@metafoo.de>, alsa-devel@alsa-project.org, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--jI8keyz6grp/JLjh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Oct 21, 2014 at 05:33:29PM +0200, Alban Bedel wrote:
> The headphone detect was hardcoded to low-active, use the flags from
> DT to allow high-active as well.

Applied, thanks.

--jI8keyz6grp/JLjh
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBAgAGBQJURs7gAAoJECTWi3JdVIfQUkUH/2IVWvsdByMd4o1ne4x77BcC
+v5EfPMf4n1f7+aEZ99QRru5hsmVeysQbYZhbJlFwi24t4XKfCOFBgz7CuiZnchd
odpOnGdaJ/aQkcMypb9TJpACDTwDReGCBDx1/5s6xD51jmjAv5UMk+qJLaYnoaD9
B3FLIb8GqwifkeIwT0AzPgvq97zuTf11WnvB8i8kcMhts5h9h9+J5WE1zYNZKMwr
hNkUGUUyUlQ/yP6TGWXeNt1sBEiaAHO91QfXC8oW7SXZ/yGtQnhwvbxQkI/ATcUv
E5ra8szxLvD6dcqoGZuhlqc6qxoEnrBofuDYEFS8Hfz5vHJHxfa0sK4ZdqoDN3M=
=3Ejy
-----END PGP SIGNATURE-----

--jI8keyz6grp/JLjh--
