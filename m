From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v1 3/3] ASoC: soc-core: fix platform name
 vs. of_node assignement
Date: Mon, 14 Jan 2019 23:02:55 +0000
Message-ID: <20190114230255.GK11073@sirena.org.uk>
References: <0660a471-3698-2059-4494-ad146518a4ed@nvidia.com>
 <20190109125340.GD10405@sirena.org.uk>
 <52f5f2cf-9260-f9c5-f73d-3c3d5debc86b@nvidia.com>
 <20190109141439.GE10405@sirena.org.uk>
 <875zuxb9uy.wl-kuninori.morimoto.gx@renesas.com>
 <a2068291-e554-cc4f-9af9-0022f3c4de34@nvidia.com>
 <871s5kqb43.wl-kuninori.morimoto.gx@renesas.com>
 <dfdc497f-9e52-99d7-208c-d8eef31fe61d@nvidia.com>
 <87h8efpoxh.wl-kuninori.morimoto.gx@renesas.com>
 <ea6b6a3a-b4eb-1d29-51fd-330b2b170005@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============7224673882882375101=="
Return-path: <alsa-devel-bounces@alsa-project.org>
In-Reply-To: <ea6b6a3a-b4eb-1d29-51fd-330b2b170005@nvidia.com>
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
Cc: alsa-devel@alsa-project.org, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Marcel Ziswiler <marcel.ziswiler@toradex.com>, linux-kernel@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>, Takashi Iwai <tiwai@suse.com>, Matthias Reichl <hias@horus.com>, Marcel Ziswiler <marcel@ziswiler.com>, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--===============7224673882882375101==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="SCOJXUq1iwCn05li"
Content-Disposition: inline


--SCOJXUq1iwCn05li
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jan 11, 2019 at 09:15:42AM +0000, Jon Hunter wrote:
> On 11/01/2019 08:51, Kuninori Morimoto wrote:

> > So, can you agree about these ?
> > 1) Add enough information/documentation about legacy/modern style and its plan.
> > 2) Add dirty pointer fixup patch as workaround
> > 3) switch to modern style as much as possible

> I think that Mark needs to decided on whether use your 'dirty pointer'
> fix or not.

I've gone ahead with Curtis' version of Morimoto-san's patch just now -
hopefully that's fine for v5.0.  Like we've been saying neither approach
is ideal, thanks Jon and Morimoto-san for your efforts analyzing this
and your proposals.

--SCOJXUq1iwCn05li
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlw9FR4ACgkQJNaLcl1U
h9Dbawf/agRz5TjSTBnTWu+KSjrCB+C+lMhRKOffsiss0cyfbgpS+mKvdujG+ZPb
4ebTzIDaG+LZWS83jkfh9wcIWy7miQrcZ7DY5XwoFaiLp4fbkVA5lW5jId2juf4u
RTy1Q2RR3WR3LxQ0RTP86a+4L9Gf3jaQm3n2NIw0k9TqKgMB89q1inAMkTNn8F0U
AozHjzvy1o1P57iHFj+BTeAmfAlpqzfJ2wsadm8dyxauitp5Pa9JWepq+BZJX0g9
rw3OrFs2VKrpj6FfcVTaeyHgMSITOqcd19B+CoJoYBKP20+ogs58j71e0ndqALxw
DH40p4DyPx1zi98Q5cyo6gMiJI2xAg==
=JWgH
-----END PGP SIGNATURE-----

--SCOJXUq1iwCn05li--

--===============7224673882882375101==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


--===============7224673882882375101==--
