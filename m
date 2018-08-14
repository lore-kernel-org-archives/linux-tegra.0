From: Mark Brown <broonie@kernel.org>
Subject: Re: [RFC PATCH] ASoC: core: Optimise suspend/resume of
	DAPM widgets
Date: Tue, 14 Aug 2018 15:40:04 +0100
Message-ID: <20180814144004.GD5810@sirena.org.uk>
References: <1533301025-19980-1-git-send-email-jonathanh@nvidia.com>
 <20180803163605.GD6591@sirena.org.uk>
 <7ba86328-5bb6-5280-df6f-9937173fb2ab@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============5358409178770170642=="
Return-path: <alsa-devel-bounces@alsa-project.org>
In-Reply-To: <7ba86328-5bb6-5280-df6f-9937173fb2ab@nvidia.com>
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


--===============5358409178770170642==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="osDK9TLjxFScVI/L"
Content-Disposition: inline


--osDK9TLjxFScVI/L
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 13, 2018 at 07:19:16PM +0100, Jon Hunter wrote:
>=20
> I had taken some ftrace graphs but there was not one thing that really
> stood out. Looking again it seems that each call to
> async_schedule_domain() can take tens of uS and so it there are a lot of
> DAPM widgets (100+) this can take some time. I will dig into it a bit
> further.

We don't call that per widget, we call that per context.  We might have
a lot of contexts but it's definitely not number of widgets level.
Perhaps what we need there is something which remembers if we actually
changed anything in each context and/or there's relevant operations and
then doesn't do this if not, we're working on the basis that these
operations are fairly cheap.

> > One thing that it occurs to me might help is to start the suspend
> > process by powering down all the input and output widgets that aren't
> > ignoring suspend in one operation, that should hopefully have the effect
> > of ensuring that most of the system that's going to get powered down
> > does so on the first pass through.

> If the async_schedule_domain() calls are the problem, then it may not
> help as we call that for all dapms apart from the card->dapm.

No, we actually need to run the operations on all contexts - they can
all do things if they want to.  We just want them all to run in parallel
so if we are doing things like waiting for capacitors to charge we don't
do it in series.

--osDK9TLjxFScVI/L
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlty6cQACgkQJNaLcl1U
h9Cu4ggAhNYHM3NFIKtqdn0xYhoxvkssFh3GROehNT3p06HwwvCytbNXsyT7VelC
4Tmf1pktMnBs+Lg+jOIFTY/rGqPr/+xk4DYbNwUDd3B3+jSnrTWixh+GTdXmPiuB
SRzgOZznTocV3E6Fmz+DIVJ9QKfaIWZQjZfCS8eqG1Qmru4BPXxjrvRqprXG3SDJ
6NxbQGQCW9Nc3szoVXPuXbUV1FlQPFfApa4cABsl/1qAPFq3NEJLky+GUbM0N6X7
ajW7CmOBAs4MfuDjN7/sB2qmj5blfC/Bp1rEb77CzjaptLNJLzY0XQj1o4+T5O7u
Cnk0bQZUQlukZCuQmrNnVwd1+pT0mA==
=ANgL
-----END PGP SIGNATURE-----

--osDK9TLjxFScVI/L--

--===============5358409178770170642==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


--===============5358409178770170642==--
