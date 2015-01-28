From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v3 07/10] ASoC: tegra: add sink for the
 internal mic to tegra_max98090
Date: Wed, 28 Jan 2015 17:15:27 +0000
Message-ID: <20150128171527.GY21293@sirena.org.uk>
References: <1422442278-10405-1-git-send-email-tomeu.vizoso@collabora.com>
 <1422442278-10405-8-git-send-email-tomeu.vizoso@collabora.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============3108242781334043790=="
Return-path: <alsa-devel-bounces@alsa-project.org>
In-Reply-To: <1422442278-10405-8-git-send-email-tomeu.vizoso@collabora.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>, Alexandre Courbot <gnurou@gmail.com>, alsa-devel@alsa-project.org, Lars-Peter Clausen <lars@metafoo.de>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Andrew Bresticker <abrestic@chromium.org>, Simon Glass <sjg@chromium.org>, Stephen Warren <swarren@wwwdotorg.org>, linux-kernel@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>, Takashi Iwai <tiwai@suse.de>, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, Wolfram Sang <wsa@the-dreams.de>, Kumar Gala <galak@codeaurora.org>, linux-tegra@vger.kernel.org, Dylan Reid <dgreid@chromium.org>, Javier Martinez Canillas <javier.martinez@collabora.co.uk>
List-Id: linux-tegra@vger.kernel.org


--===============3108242781334043790==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="dYleC2xWAd0KQmG+"
Content-Disposition: inline


--dYleC2xWAd0KQmG+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jan 28, 2015 at 11:51:05AM +0100, Tomeu Vizoso wrote:
> This is used in the Tegra-based Chromebooks.

This doesn't apply due to the dependency on the previous patch, and
also...

>  static const struct snd_kcontrol_new tegra_max98090_controls[] = {
>  	SOC_DAPM_PIN_SWITCH("Headphones"),
>  	SOC_DAPM_PIN_SWITCH("Speakers"),
> +	SOC_DAPM_PIN_SWITCH("Int Mic"),
>  };

...it's not clear what the purpose of the pin switch is here.

--dYleC2xWAd0KQmG+
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJUyRkvAAoJECTWi3JdVIfQLwsH/jZvWuboYO0fkeZFnSj8VLr2
5B04qTlws5iCIbceSv5B4cCza4fgxQObaceeCiVx7Zv+bD+hLakwV1UTvmpcOy4C
7qWMLtO3QJxqmcL/hGreLWobldGdooht/y+wfvehWqJ3ZGm8evJcbHYfQm92ISQE
TzaMfQFWtkWjbUbbMVxoZxmwyXEbRTiqQ2A05RlhLdV4/M7Ov7NGSs7kf9AAx1/I
pu4vkcwjCPI0D9DzWPuy3DPToA1ybhyQTEuuk1PUMDefyxII5xDRjaR1NtGPBw/0
hKU/bKdf1WCwq9Rqh1PoPR9MKuVk3MdI7IkcpatO94KZOKPulTFrpGrL61H5pV8=
=yywg
-----END PGP SIGNATURE-----

--dYleC2xWAd0KQmG+--

--===============3108242781334043790==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


--===============3108242781334043790==--
