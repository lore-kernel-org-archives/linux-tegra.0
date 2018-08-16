From: Mark Brown <broonie@kernel.org>
Subject: Re: [RFC PATCH] ASoC: core: Optimise suspend/resume of
	DAPM widgets
Date: Thu, 16 Aug 2018 11:51:35 +0100
Message-ID: <20180816105135.GZ2414@sirena.org.uk>
References: <1533301025-19980-1-git-send-email-jonathanh@nvidia.com>
 <20180803163605.GD6591@sirena.org.uk>
 <7ba86328-5bb6-5280-df6f-9937173fb2ab@nvidia.com>
 <20180814144004.GD5810@sirena.org.uk>
 <e1bc40ec-de7e-2b77-d7f6-ec6b3066aeec@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============4204369498219723469=="
Return-path: <alsa-devel-bounces@alsa-project.org>
In-Reply-To: <e1bc40ec-de7e-2b77-d7f6-ec6b3066aeec@nvidia.com>
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


--===============4204369498219723469==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="0786ZyFfTSxuegBe"
Content-Disposition: inline


--0786ZyFfTSxuegBe
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Aug 15, 2018 at 07:48:47PM +0100, Jon Hunter wrote:

> So then I made the following change to avoid scheduling the function
> calls unnecessarily (which I think should be fine) ...

> Please note that I am just using ktime_get() to log the time on entry
> and exit from dapm_power_widgets() and so yes the time may not be
> purely the time take to execute this function if we are preempted,
> but I am measuring in the same way in both cases and so it does seem
> to show some improvement.

That seems like a simple and useful optimization, will you send a patch?

--0786ZyFfTSxuegBe
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlt1VzQACgkQJNaLcl1U
h9C++wf/QB19v9pWanJUtK3uJI3vVk9Y6HQxYhrr0b9X6aZ9IPlhxWlBssaSEY0O
1zygbrumfW9K8OLLANmo8Xb0oMb8YcXwG5UO2aIieuIwxvQo+hwUUI9QwH020JB7
+3bRvRumioLOfR+NeZTg7M5oGuuGK34o0j/pyCT0Ej3v2YKZUlai0ynwxGkfbuav
RiPia8eACF76DkDRBcWMQYy45+kZIXdkBOJvZcnzWGUfhlNEugWo92oYQxSshySV
TsUG1H3HGN1/JvAogds/wVAOXSA8dt8fc1KddCdPEtaCPAoGa8NooKZDlrJFHn1L
FQhmW9eQB1nzC8venmJohqs7SiPvNA==
=OMjY
-----END PGP SIGNATURE-----

--0786ZyFfTSxuegBe--

--===============4204369498219723469==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


--===============4204369498219723469==--
