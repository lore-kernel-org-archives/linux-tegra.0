From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v3 06/10] ASoC: tegra: Add a control for
 the headphone switch
Date: Wed, 28 Jan 2015 11:02:30 +0000
Message-ID: <20150128110230.GQ21293@sirena.org.uk>
References: <1422442278-10405-1-git-send-email-tomeu.vizoso@collabora.com>
 <1422442278-10405-7-git-send-email-tomeu.vizoso@collabora.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0556726507503123523=="
Return-path: <alsa-devel-bounces@alsa-project.org>
In-Reply-To: <1422442278-10405-7-git-send-email-tomeu.vizoso@collabora.com>
List-Unsubscribe: <http://mailman.alsa-project.org/mailman/options/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <http://mailman.alsa-project.org/mailman/listinfo/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: alsa-devel-bounces@alsa-project.org
To: Tomeu Vizoso <tomeu.vizoso@collabora.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, alsa-devel@alsa-project.org, Lars-Peter Clausen <lars@metafoo.de>, Stephen Warren <swarren@wwwdotorg.org>, Andrew Bresticker <abrestic@chromium.org>, Simon Glass <sjg@chromium.org>, Wolfram Sang <wsa@the-dreams.de>, Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org, Takashi Iwai <tiwai@suse.de>, Thierry Reding <thierry.reding@gmail.com>, linux-tegra@vger.kernel.org, Dylan Reid <dgreid@chromium.org>, Javier Martinez Canillas <javier.martinez@collabora.co.uk>
List-Id: linux-tegra@vger.kernel.org


--===============0556726507503123523==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="XPvsYLa7iS7+7YV1"
Content-Disposition: inline


--XPvsYLa7iS7+7YV1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jan 28, 2015 at 11:51:04AM +0100, Tomeu Vizoso wrote:

> To be used by userspace when the headphones jack is plugged in.

>  static const struct snd_kcontrol_new tegra_max98090_controls[] = {
> +	SOC_DAPM_PIN_SWITCH("Headphones"),
>  	SOC_DAPM_PIN_SWITCH("Speakers"),
>  };

Why is userspace doing this?  If this is supposed to be associated with
the jack detection I'd expect us to be doing this in kernel.

--XPvsYLa7iS7+7YV1
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJUyMHGAAoJECTWi3JdVIfQQM0H/iFNJ3INZXCih/67wRAUDIct
2+j4H0gbnVoL2LBC/A8JEvyFSNO2+dx1yb+VGRYJTyoeVzbTVU5Wl2hY6OzLuRLn
5qECrRW5h5L4PLetqlwy5vHj/7y9udq91PQts0lvx/C1KIwPx5CdqY3KzGKQ192F
20eo/tCVObuAwr+AuVlefp54GX0G5gEFiOGjszenK99uD1D4w3pbUZuV4mwgZXDl
Et0vKqMsTcTD98uBuDempyTnKZUdaKS8WdeNcTuzYPxr5TZsBybyeIWwOrsIWw5o
3RZuCgEvBYhI8LpSRS3TA6esruMP1WC1DnLSw4WZdFz/Ooo1pjDkGjGKwLtKiWY=
=IrM6
-----END PGP SIGNATURE-----

--XPvsYLa7iS7+7YV1--

--===============0556726507503123523==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


--===============0556726507503123523==--
