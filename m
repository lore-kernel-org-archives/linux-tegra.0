From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 1/8] ASoC: tegra: Add a TDM configuration
	callback
Date: Wed, 18 Sep 2019 11:48:27 +0100
Message-ID: <20190918104827.GB2596@sirena.co.uk>
References: <20190917181233.534-1-ben.dooks@codethink.co.uk>
 <20190917181233.534-2-ben.dooks@codethink.co.uk>
 <7b21823a-86e8-d3de-10b5-e047a5e025ef@nvidia.com>
 <72705cbf3b70934bdf8e7a6116f420b5@codethink.co.uk>
 <5b0044e1-b781-9fd8-b250-3d87fe3af855@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============7014943400818606924=="
Return-path: <alsa-devel-bounces@alsa-project.org>
Resent-Message-ID: <20190918112850.GC2596@sirena.co.uk>
Resent-To: alsa-devel@alsa-project.org
In-Reply-To: <5b0044e1-b781-9fd8-b250-3d87fe3af855@nvidia.com>
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
Cc: linux-kernel@lists.codethink.co.uk, alsa-devel@alsa-project.org, Liam Girdwood <lgirdwood@gmail.com>, Takashi Iwai <tiwai@suse.com>, Ben Dooks <ben.dooks@codethink.co.uk>, Thierry Reding <thierry.reding@gmail.com>, Edward Cragg <edward.cragg@codethink.co.uk>, linux-tegra@vger.kernel.org, linux-tegra-owner@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--===============7014943400818606924==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="eJnRUKwClWJh1Khz"
Content-Disposition: inline


--eJnRUKwClWJh1Khz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Sep 18, 2019 at 11:25:39AM +0100, Jon Hunter wrote:

> Why 2? From looking at various codecs that support dsp-a/b modes, it is
> more common for the f-sync to be 1 regardless of the number of slots.

In DSP modes only one edge really matters anyway so it's not super
important how long the pulse is.

--eJnRUKwClWJh1Khz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl2CC3oACgkQJNaLcl1U
h9BFnAf/WyYMlppq9ssZv4HEBgxxsYN/XQexPFHMP7crDn62tGtHByJh3iKq1cRa
XJ3srU6r+IV+S3XI5udoz5il/R442tQjsjZ1deLoKTvih1pu83l0ELkQJOAV4YG2
3Dmt+KImny71YqKLgZ9haZTZuDEiRFGT7F4MxH1hepOS/aNYwvbojczspSncObVt
cEp1p8vSq9Wc/E628i7BQ1x+IM/3OLm3Toi3soPP+00s3Uh3s+1Ct7W/501JxCl3
bUrUIpHTI/SV8PseVs+o0Qt+6dwcXYo5GG1gVZS1IqwTsoUH5KNTZbhtrEa1SNJC
WUsl5grAThT2yA5nAL7EeG0DM9C1LA==
=Dj84
-----END PGP SIGNATURE-----

--eJnRUKwClWJh1Khz--

--===============7014943400818606924==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


--===============7014943400818606924==--
