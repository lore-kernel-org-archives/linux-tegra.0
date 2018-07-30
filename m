From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 4/4] ASoC: tegra: i2s: Add support for more than 2
 channels
Date: Mon, 30 Jul 2018 11:21:45 +0100
Message-ID: <20180730102145.GG5789@sirena.org.uk>
References: <20180727125931.9794-1-jorge.sanjuan@codethink.co.uk>
 <20180727125931.9794-5-jorge.sanjuan@codethink.co.uk>
 <d81d5c3c-2b2f-308f-d98e-d39c5d5d147f@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="cyV/sMl4KAhiehtf"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <d81d5c3c-2b2f-308f-d98e-d39c5d5d147f@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jon Hunter <jonathanh@nvidia.com>
Cc: Jorge Sanjuan <jorge.sanjuan@codethink.co.uk>, lgirdwood@gmail.com, thierry.reding@gmail.com, alsa-devel@alsa-project.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, linux-kernel@lists.codethink.co.uk
List-Id: linux-tegra@vger.kernel.org


--cyV/sMl4KAhiehtf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jul 30, 2018 at 10:46:14AM +0100, Jon Hunter wrote:
> On 27/07/18 13:59, Jorge Sanjuan wrote:

> > -	if (params_channels(params) != 2)
> > +	if (params_channels(params) > 8)
> >  		return -EINVAL;

> For normal I2S mode, channels should always be 2 and so it could be worth checking
> if we are using TDM mode here or not.

Yes, there's some question if a multi-channel I2S setup is going to be
all the left channels then all the right channels, have multiple data
lines in parallel (this especially common for high end applications) or
something else.  Usually it's safer to use a DSP mode for those.

Please fix your mail client to word wrap within paragraphs at something
substantially less than 80 columns.  Doing this makes your messages much
easier to read and reply to.

--cyV/sMl4KAhiehtf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlte5rgACgkQJNaLcl1U
h9Az4wf9ENuJw9xHWLzCcUCojvR2r6t/dd8C4zfCSklN8D/pL24kyXy+HXtDXgqw
dzYaYCL27iECyw16JmuMzM3U/vnnOTIxamjlcCF3/6BjBxYaJJ94gZP3RBLImrDF
bCga+cNlb3FK0D7FEpyFSlSvREN3ZBpG5H+Da0vhdHZxglKYFsvqkjzJABamiGDK
u3ryKn9BWMWVFITB5X9o24f902wdc2DY/ErIfCB5nQbmSLPXU7dAJ/3I7YmNSOLD
8HiHKm74QIAtiDzZT3Sv+kZ8EgAbp8XmkWs/PGxoN7eveBbAJpEQHewQ99ystzKy
tJNxVjlj1mGVRCxIsi+vNT1JAm9+RA==
=moNh
-----END PGP SIGNATURE-----

--cyV/sMl4KAhiehtf--
