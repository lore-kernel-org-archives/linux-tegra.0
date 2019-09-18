From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 1/8] ASoC: tegra: Add a TDM configuration
 callback
Date: Wed, 18 Sep 2019 16:02:48 +0100
Message-ID: <20190918150248.GM2596@sirena.co.uk>
References: <20190917181233.534-1-ben.dooks@codethink.co.uk>
 <20190917181233.534-2-ben.dooks@codethink.co.uk>
 <7b21823a-86e8-d3de-10b5-e047a5e025ef@nvidia.com>
 <72705cbf3b70934bdf8e7a6116f420b5@codethink.co.uk>
 <5b0044e1-b781-9fd8-b250-3d87fe3af855@nvidia.com>
 <20190918104827.GB2596@sirena.co.uk>
 <40d78f13-c1b9-3e2d-c144-2209a4c0d716@linux.intel.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1085987757472726500=="
Return-path: <alsa-devel-bounces@alsa-project.org>
Resent-Message-ID: <20190918154548.GR2596@sirena.co.uk>
Resent-To: alsa-devel@alsa-project.org
In-Reply-To: <40d78f13-c1b9-3e2d-c144-2209a4c0d716@linux.intel.com>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: linux-kernel@lists.codethink.co.uk, alsa-devel@alsa-project.org, Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>, Ben Dooks <ben.dooks@codethink.co.uk>, Thierry Reding <thierry.reding@gmail.com>, Edward Cragg <edward.cragg@codethink.co.uk>, linux-tegra@vger.kernel.org, Jon Hunter <jonathanh@nvidia.com>, linux-tegra-owner@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--===============1085987757472726500==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="qVHblb/y9DPlgkHs"
Content-Disposition: inline


--qVHblb/y9DPlgkHs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Sep 18, 2019 at 08:33:50AM -0500, Pierre-Louis Bossart wrote:
> On 9/18/19 5:48 AM, Mark Brown wrote:

> > In DSP modes only one edge really matters anyway so it's not super
> > important how long the pulse is.

> There are exceptions to the rule.
> In the early days of SOF, we had to provide support for amplifiers that did
> require a pulse larger than a bit. In the SOF IPC we added an
> 'frame_pulse_width' field to pass the configuration all the way from
> topology to the firmware and Intel SSP driver.
> The other quirk we added is the ability to control zero-padding per slot
> instead of at the end of the frame, e.g. 1 bit of padding after 24 bits when
> using 4 slots w/ 25 bits in a 100-bit frame.

Neither of those is part of the core DSP mode definition though in the
same way that constraints like MCLK or BCLK ratios aren't.  They're
modifiers on top.

--qVHblb/y9DPlgkHs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl2CRxgACgkQJNaLcl1U
h9C3Uwf/d11JTgMoTNFlwHEDfWmf2l9yjezFSXcGaRxBGWDdfB+EPZe3EMNMC4Ry
Mq5zM2De0sa4JdiGgeKqUtXcBJqmRWeX8RBb66tyI1Qid5FVA/LPfWoMGgBExI9v
SpqXvUswmxvD9oJ4shc7Qg80TMdC4TMorfHnZidVSmv+jP0ovmRep/ZRPQK24b+h
vtClYbf85B7dUorPEAUD6Dgewh4/ZYe2u37tGh9X944Bqw/ze4+BGtQ2XEtXoycR
rOGENVk8V+8EVyqekA4tnv6cCnxSA09/3msb8+AolTJMouP8MK2VTOitnhJ+lrMU
RH7cdZXk43RRCJ0OqzDJZSZT3OIUUA==
=omCB
-----END PGP SIGNATURE-----

--qVHblb/y9DPlgkHs--

--===============1085987757472726500==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


--===============1085987757472726500==--
