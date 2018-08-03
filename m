From: Mark Brown <broonie@kernel.org>
Subject: Re: [RFC PATCH] ASoC: core: Optimise suspend/resume of
	DAPM widgets
Date: Fri, 3 Aug 2018 17:36:05 +0100
Message-ID: <20180803163605.GD6591@sirena.org.uk>
References: <1533301025-19980-1-git-send-email-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1538342717008731015=="
Return-path: <alsa-devel-bounces@alsa-project.org>
In-Reply-To: <1533301025-19980-1-git-send-email-jonathanh@nvidia.com>
List-Unsubscribe: <http://mailman.alsa-project.org/mailman/options/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <http://mailman.alsa-project.org/mailman/listinfo/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: alsa-devel-bounces@alsa-project.org
To: Jon Hunter <jonathanh@nvidia.com>
Cc: alsa-devel@alsa-project.org, Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org, Takashi Iwai <tiwai@suse.com>, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--===============1538342717008731015==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="NtwzykIc2mflq5ck"
Content-Disposition: inline


--NtwzykIc2mflq5ck
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Aug 03, 2018 at 01:57:05PM +0100, Jon Hunter wrote:

> For soundcards that have several DAI links and many DAPM widgets the
> time taken for snd_soc_suspend to execute has been observed to be
> several milliseconds. The time is largely spent executing
> dapm_power_widgets() for each for the DAI links that need to be
> suspended. Given that dapm_power_widgets() is called again after
> suspending/resuming the DAI links, one way to optimise the
> suspend/resume time is to avoid calling dapm_power_widgets() for
> each DAI link and reduces the suspend time significantly.

It's a bit alarming that dapm_power_widgets() is taking substantial
enough time to be worth worring about - it's *supposed* to be relatively
well optimized so it's effectively free.  It'll never be quite free, but
close enough.  The goal is that if nothing changes we end up testing a
few nodes at most before we figure out that nothing changed state and
stop.  Do you have any idea what it's spending its time on, we do call
it a lot so if there's any optimization opportunties there we can
probably get a lot of benefit out of them.

One thing that it occurs to me might help is to start the suspend
process by powering down all the input and output widgets that aren't
ignoring suspend in one operation, that should hopefully have the effect
of ensuring that most of the system that's going to get powered down
does so on the first pass through.

> Please note that this has been observed on the Tegra210 Jetson TX1
> platform which is not currently supported in the mainline for audio
> but has been tested with out-of-tree patches to enable I2S audio.

If someone could get the platform booting reliably in -next that'd be
good but that's a separate issue...

> In the resume path, it is not clear if there could be any issues from
> not sync'ing the DAPM power state until after unmuting and resuming
> the CPU DAI drivers, because this will happen later with this change.

This is a definite problem, we want to have the audio path powered up
before we start playing audio otherwise we loose the start of the audio
which may be important.

--NtwzykIc2mflq5ck
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAltkhHQACgkQJNaLcl1U
h9Abfwf9GL/ApQBu4ehC5vT48/dXm5e3eSnbqPF2RPN4ANgZE/sd4zN9ViCH+aZB
a+rO8heoonUwWDAzER847bozpaTlc+FlpozSvHHtGHIKy5IasJaaZGCwcSXchADq
j7dz5WYe6PClb/jRRWIlCYeUXIkVZjq8A/xpZodE8qkCQl2QWYew8Zxy37XVGcZr
kQoiDhdo+lkfWrDjjxq2YAxWESfLzbt0yovMkMhzoEU+gFJM1TwBkF+4pCLUjb6I
SngihcQxjjxfdgsO+5jzt3eHEqHa0j6XNihW7U+h/j9N35rY0SMc99Z+xXL1mbrz
esbscJh0DWpoaCT0MPRo5L1XAO5Jmg==
=0Q2R
-----END PGP SIGNATURE-----

--NtwzykIc2mflq5ck--

--===============1538342717008731015==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


--===============1538342717008731015==--
