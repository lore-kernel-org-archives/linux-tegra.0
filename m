From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 2/8] ASoC: tegra: Allow 24bit and 32bit
 samples
Date: Wed, 18 Sep 2019 13:05:56 +0100
Message-ID: <20190918120553.GE2596@sirena.co.uk>
References: <20190917181233.534-1-ben.dooks@codethink.co.uk>
 <20190917181233.534-3-ben.dooks@codethink.co.uk>
 <077870b1-8856-9a28-dd13-f8bfb1418adb@linux.intel.com>
 <de15ea8e9d2c07a1253fd414b421efbe@codethink.co.uk>
 <20190918100828.GA2596@sirena.co.uk>
 <943c243563b4936a537b52b6c3b1fd99@codethink.co.uk>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============3727602889729791712=="
Return-path: <alsa-devel-bounces@alsa-project.org>
In-Reply-To: <943c243563b4936a537b52b6c3b1fd99@codethink.co.uk>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>
To: Ben Dooks <ben.dooks@codethink.co.uk>
Cc: Jonathan Hunter <jonathanh@nvidia.com>, Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, alsa-devel@alsa-project.org, Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@lists.codethink.co.uk, Takashi Iwai <tiwai@suse.com>, Thierry Reding <thierry.reding@gmail.com>, Edward Cragg <edward.cragg@codethink.co.uk>, linux-tegra@vger.kernel.org, linux-tegra-owner@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--===============3727602889729791712==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="1sNVjLsmu1MXqwQ/"
Content-Disposition: inline


--1sNVjLsmu1MXqwQ/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Sep 18, 2019 at 12:50:13PM +0100, Ben Dooks wrote:
> On 2019-09-18 11:08, Mark Brown wrote:

> > > Yes, will do when this series has been reviewed and modifications
> > > done.

> > I didn't look at it due to the lack of signoffs.

> Thanks, although you could have just flagged this and reviewed the rest
> anyway. I'll post a new version with signoff sorted at the end of the week
> as I cannot get in to the office to test any changes until Friday.

None of the patches I looked at had signoffs, Pierre had already told
you about that problem and there were a bunch of other review comments
anyway before I saw the series so it was fairly clear that a new version
is needed anyway.  Once you've got some review you shouldn't rely on
getting extra review explicitly since it's not generally useful to repeat
the same review comments others have already made.

--1sNVjLsmu1MXqwQ/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl2CHaEACgkQJNaLcl1U
h9Bfggf+KwyoUQbzbZdW85lkbYYzjdzcUvyz+11E+e1BPqECET8U0XyV3hBp0uAT
rcQ3ME6HGjxUDubR3fatWVg36HhkV54jmAitGld7v3zsDvEyC7KSR2a/i7OlxGmC
KmGqqqZR4iHwvnqrjJ+A2wC7HmuA/ZePVR6XCSt+pJ0EGrO/RlD2+mvjESUWDbtH
x37GNRGa6fMnBynxH0K4tKDNRyAtyRh3FKXYEDPC+Xi8m5kyIAmkn44BZT6n8KZq
zLAcAnsf1j+NiwihiJJdDauU8UFbOYNzm9Cw1VikWF4GOWI6RUagZugS+ZY6Q7WF
D1Ex0aYM7MFQF6xDCWziP3UjudCbfA==
=GnTn
-----END PGP SIGNATURE-----

--1sNVjLsmu1MXqwQ/--

--===============3727602889729791712==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


--===============3727602889729791712==--
