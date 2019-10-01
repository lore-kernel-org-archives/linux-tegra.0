From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v3 5/7] ASoC: tegra: set i2s_offset to 0
	for tdm
Date: Tue, 1 Oct 2019 12:44:15 +0100
Message-ID: <20191001114415.GB4786@sirena.co.uk>
References: <20190930165130.10642-1-ben.dooks@codethink.co.uk>
 <20190930165130.10642-6-ben.dooks@codethink.co.uk>
 <6d6ae684-dd5f-b180-9114-dafe12886d4f@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============6457369030198270429=="
Return-path: <alsa-devel-bounces@alsa-project.org>
In-Reply-To: <6d6ae684-dd5f-b180-9114-dafe12886d4f@nvidia.com>
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
Cc: linux-kernel@lists.codethink.co.uk, alsa-devel@alsa-project.org, Liam Girdwood <lgirdwood@gmail.com>, Takashi Iwai <tiwai@suse.com>, Ben Dooks <ben.dooks@codethink.co.uk>, Thierry Reding <thierry.reding@gmail.com>, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--===============6457369030198270429==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="gatW/ieO32f1wygP"
Content-Disposition: inline


--gatW/ieO32f1wygP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Sep 30, 2019 at 09:52:15PM +0100, Jon Hunter wrote:

> My understanding is that the difference between dsp-a and dsp-b is that
> dsp-a has an offset of 1 and dsp-b has an offset of 0.

Yes.

--gatW/ieO32f1wygP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl2TPA4ACgkQJNaLcl1U
h9A+Owf7BGtMUWznPui3fHwOqsLBFqxq6KDL31MqnMLunEAAFc0EbKlVFjUvi6Bq
eGIj2OxGZ8hk8qWRiqAyVBh2RuDk2xzCBpVcz/H0pk5Lm2Uhn6O++7K2i2z+e3BC
p7KP1hvskrS3Oidev2vyfy+xoV2MropXU61RMSSKQevM3TbYXsupYQR5kuwwXdKo
XK2Wd9YZuk7FWJdUa7ArEdXOqdZu66SjGOMijN71vfJ2A4M+ds1+jYh5umMYjWtl
aJbUUr+kvk6Pjxsr0kMwgei6tT1iJ79VPMBuEsSt4UUD47YMWF/oilqldjoMNT0d
X5z6WuReKXFlijI1XcrpjFgEGVZ30w==
=TrRV
-----END PGP SIGNATURE-----

--gatW/ieO32f1wygP--

--===============6457369030198270429==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


--===============6457369030198270429==--
