From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v5 3/7] ASoC: tegra: i2s: Add support for
 more than 2 channels
Date: Thu, 24 Oct 2019 20:18:46 +0100
Message-ID: <20191024191846.GJ46373@sirena.co.uk>
References: <20191018154833.7560-1-ben.dooks@codethink.co.uk>
 <20191018154833.7560-4-ben.dooks@codethink.co.uk>
 <2eef499e-d9d4-732a-ddd6-8d307d8cb08d@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============7606295208313226982=="
Return-path: <alsa-devel-bounces@alsa-project.org>
In-Reply-To: <2eef499e-d9d4-732a-ddd6-8d307d8cb08d@nvidia.com>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>
To: Jon Hunter <jonathanh@nvidia.com>
Cc: linux-kernel@lists.codethink.co.uk, alsa-devel@alsa-project.org, Liam Girdwood <lgirdwood@gmail.com>, Takashi Iwai <tiwai@suse.com>, Ben Dooks <ben.dooks@codethink.co.uk>, Thierry Reding <thierry.reding@gmail.com>, Edward Cragg <edward.cragg@codethink.co.uk>, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--===============7606295208313226982==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="J2uG6jHjFLimDtBY"
Content-Disposition: inline


--J2uG6jHjFLimDtBY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Oct 24, 2019 at 05:12:21PM +0100, Jon Hunter wrote:
> On 18/10/2019 16:48, Ben Dooks wrote:

> > @@ -90,10 +92,12 @@ static int tegra30_i2s_set_fmt(struct snd_soc_dai *dai,
> >  		TEGRA30_I2S_CTRL_LRCK_MASK;
> >  	switch (fmt & SND_SOC_DAIFMT_FORMAT_MASK) {
> >  	case SND_SOC_DAIFMT_DSP_A:
> > +		ch_val = TEGRA30_I2S_CH_CTRL_EGDE_CTRL_NEG_EDGE;

> Sorry, I just saw the feedback on the previous iteration. I don't think
> we want to set the polarity but based upon the format that is passed ...

The polarity should be set based on the the inversion flags in the
format, normally both DSP modes trigger on the rising edge of the LRCLK.
The difference is if there's a delay before the first data bit or not.

--J2uG6jHjFLimDtBY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl2x+RUACgkQJNaLcl1U
h9BG7Af/aTUi+TadPqNOylY+6X2Spzqs0gV+LMh/W0yvVf0aL57cGaJ10dMwmwbC
as56JKIZ89JWzfQHg5fBEXQswb9q12ExaVYNdnIjc/XEx9QnSGHD0Wse7J/lCnbD
FjluXJ9sUFuoRH7yayraajy6bnT2b4EQHB2xkzlYib6rsrqR51Xgrs4MH64MpA59
cCMHuxP12rACbUm5atFzeCgt6TvESWJ0pD++r9Ht/vVGyArSMjjt7HZdOFNSDGwc
1TAOqK6xdPvEqt5LJxXyw+1QCPZT8KFJ3He2g7lax4tuW+czSPfsgPxTEEDIRO2u
FZr56e49pYtzzeN6lG9U8XnkqsF89A==
=xWHD
-----END PGP SIGNATURE-----

--J2uG6jHjFLimDtBY--

--===============7606295208313226982==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


--===============7606295208313226982==--
