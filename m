From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 2/2] ASoC: tegra: probe deferral error
	reporting
Date: Fri, 20 Jul 2018 13:16:12 +0100
Message-ID: <20180720121612.GC10784@sirena.org.uk>
References: <20180720080424.31505-1-marcel@ziswiler.com>
 <20180720080424.31505-2-marcel@ziswiler.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============3105660243370161700=="
Return-path: <alsa-devel-bounces@alsa-project.org>
In-Reply-To: <20180720080424.31505-2-marcel@ziswiler.com>
List-Unsubscribe: <http://mailman.alsa-project.org/mailman/options/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <http://mailman.alsa-project.org/mailman/listinfo/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: alsa-devel-bounces@alsa-project.org
To: Marcel Ziswiler <marcel@ziswiler.com>
Cc: alsa-devel@alsa-project.org, Liam Girdwood <lgirdwood@gmail.com>, Marcel Ziswiler <marcel.ziswiler@toradex.com>, Takashi Iwai <tiwai@suse.com>, linux-kernel@vger.kernel.org, Jonathan Hunter <jonathanh@nvidia.com>, Thierry Reding <thierry.reding@gmail.com>, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--===============3105660243370161700==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Clx92ZfkiYIKRjnr"
Content-Disposition: inline


--Clx92ZfkiYIKRjnr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jul 20, 2018 at 10:04:24AM +0200, Marcel Ziswiler wrote:

> -			dev_err(&pdev->dev, "could not get codec-reset GPIO\n");
> +			dev_err(&pdev->dev, "could not get codec-reset GPIO: "
> +					    "%d\n", ret);

Don't split strings over lines like this, it causes problems when people
grep for errors.  It's better to go over 80 columns.

>  	ac97->sync_gpio = of_get_named_gpio(pdev->dev.of_node,
>  					    "nvidia,codec-sync-gpio", 0);
>  	if (!gpio_is_valid(ac97->sync_gpio)) {
> -		dev_err(&pdev->dev, "no codec-sync GPIO supplied\n");
> +		ret = ac97->sync_gpio;
> +		dev_err(&pdev->dev, "no codec-sync GPIO supplied: %d\n", ret);
>  		goto err_clk_put;
>  	}

This isn't reporting an error code associated with the attempt to find a
codec-sync GPIO, it's the result of some other operation.

--Clx92ZfkiYIKRjnr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAltR0osACgkQJNaLcl1U
h9AVmwf/e4WjlzV4DYAbjzGF9Ht1ig2O1wJA0BPK4/21DHuYhCAkLkLXbGoE3HKD
j+0NjjLNSqdSeuQChz+tY0Tw12CIupCNSInA6+AS6cQ/OaAPlaTnNuPjDpF3aXWs
aoxbZ+OclgsvtoHU3q7Oq1EHDJTuYBRMIQsw3fZmSG2L9ZX3u86S6spEE2pdVifW
ZMHRfbqeIFJpnuVnhHEecYH3y4ZaK1oxOCqpzPWSpcnbSTotMzXSGQLZtc9Voyn7
tS4/aTY3iMsLa/RUpC9PMCBvPdn4Hj9zzWkOeDz1AviKsW0eJaMdAlg2m8f9it8E
c0gfHvC1bc0xNsqpQQLp2doD2OwWYA==
=qJDp
-----END PGP SIGNATURE-----

--Clx92ZfkiYIKRjnr--

--===============3105660243370161700==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


--===============3105660243370161700==--
