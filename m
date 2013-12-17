From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v2 RESEND 1/2] ASOC: tegra: fix matching of
 AC97 components
Date: Tue, 17 Dec 2013 13:56:25 +0000
Message-ID: <20131217135625.GH3185@sirena.org.uk>
References: <1387277564-4774-1-git-send-email-dev@lynxeye.de>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2601095514271103831=="
Return-path: <alsa-devel-bounces@alsa-project.org>
In-Reply-To: <1387277564-4774-1-git-send-email-dev@lynxeye.de>
List-Unsubscribe: <http://mailman.alsa-project.org/mailman/options/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <http://mailman.alsa-project.org/mailman/listinfo/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: alsa-devel-bounces@alsa-project.org
To: Lucas Stach <dev@lynxeye.de>
Cc: linux-tegra@vger.kernel.org, alsa-devel@alsa-project.org, swarren@wwwdotorg.org
List-Id: linux-tegra@vger.kernel.org


--===============2601095514271103831==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="kCKiWLxDBCSujrdW"
Content-Disposition: inline


--kCKiWLxDBCSujrdW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Dec 17, 2013 at 11:52:43AM +0100, Lucas Stach wrote:
> Matching works completely based on the cpu of_node.

Applied, though this isn't a fix at all so I updated the subject line.

> CC: Mark Brown <broonie@linaro.org>

Why are you adding my work address?

--kCKiWLxDBCSujrdW
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJSsFgGAAoJELSic+t+oim9twQP/j6xOjKDMxr5ViqLY6MZ81Kv
uakxN4Gsd0/IRD7GXvQn/QV+mPzjIeCaFpkb+ksR79qXVFZgDkemWrlSrvfvGbE9
NHRkfDfJFDPzHmaOeXqJucZAo4DBUuf94gqkNtusi44wMAAJdsTPz6mOxGhEvBPA
cgMfaZJl75kg5xUaG/rHPGdeHe9sFEeaioE+oPQndBhdQcoQti8/Bm35q2PRlt+F
G4X1NO9bN6okJ4EtToffnGdu7l7Umlu9Sfyjyp+Kj5i3dS2Ggrnz+J19+Hq5uMW4
Z9/+b5qW1LGXiDKaCyOgZkNl9Kf3M8odsnMB1fZt3IVVJ0G9tQxdzbId6JyVHE0Y
zMyS5TTreGFMcT60hGOFQQ6RU7Lolm6KQSW//1aV0f6l18obFfMLtmps/lTatZJL
tk/4xFIFdxborX/1ObMdobj43w7O/VBF191Feo4MOUCOQw3Mo8ycsgp31Vf4tdNl
L2uGdk2FTWL2dZpoziyuv3OTvBmu64uKqfYIsgDOealwCD66YKN9Z7BS+6t6VRrl
TpdCVDHVoKOD4gDOeQyJkeWQe7SiF3U67XtflGR0diJf5cQsaPKLrQGGgXAanI/u
nkiUVO8wLmKmiEeR+yrOsjSWq7bnY9CdTbvivuEVxcUWVS694MwY7Pd8r7nabX8o
9QtNbfdmQKRAcuh5nX/q
=Ik+r
-----END PGP SIGNATURE-----

--kCKiWLxDBCSujrdW--

--===============2601095514271103831==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


--===============2601095514271103831==--
