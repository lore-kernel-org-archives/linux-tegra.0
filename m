From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH] ASoC: tegra: add runtime PM to resume
	functions
Date: Tue, 4 Jun 2013 20:47:44 +0100
Message-ID: <20130604194744.GU31367@sirena.org.uk>
References: <1370372294-25844-1-git-send-email-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============4149228403671627032=="
Return-path: <alsa-devel-bounces@alsa-project.org>
In-Reply-To: <1370372294-25844-1-git-send-email-swarren@wwwdotorg.org>
List-Unsubscribe: <http://mailman.alsa-project.org/mailman/options/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <http://mailman.alsa-project.org/mailman/listinfo/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: alsa-devel-bounces@alsa-project.org
To: Stephen Warren <swarren@wwwdotorg.org>
Cc: linux-tegra@vger.kernel.org, alsa-devel@alsa-project.org, Stephen Warren <swarren@nvidia.com>, Liam Girdwood <lgirdwood@gmail.com>
List-Id: linux-tegra@vger.kernel.org


--===============4149228403671627032==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="kPvmKZRaHW6UEX9w"
Content-Disposition: inline


--kPvmKZRaHW6UEX9w
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 04, 2013 at 12:58:14PM -0600, Stephen Warren wrote:
> From: Stephen Warren <swarren@nvidia.com>
>=20
> Tegra HW needs clocks etc. active when touching registers. Make sure they
> are active during resume, by calling pm_runtime_get_sync() before touching
> HW.

Applied, thanks.

--kPvmKZRaHW6UEX9w
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iQIbBAEBAgAGBQJRrkRdAAoJELSic+t+oim9dtcP920sOsCI9jDs8J4YjQjWBbYo
3WhOCONeJ5MwtlWObJ1Rg9oGynRkqIpG/k8U7TTRlV6S+QY/igtjDKRbeCgriHLl
KS4aSeun+PA8gKjUVxuIxPaklGdf8FMnQayzq6iPLFBKWc+zmE1XJt6TQNdJfitY
2WzEcGP2/riDHO9ygvW82yJzdGhaxyfAi2gmsZ9PeXPTwVJsBq0tj5h1Q+sHxxp3
MTfXySvzv1R79wkfl7b8Zt+9/0yqjiB47ifa8YvspKLv6gCKx8HFG4Sf2+OouhaR
DoY1hA90yGq9rbepH1LEjswb5KFBzROSRLGZXkkLTzuDD+YtTnN3li/dqqlqLgHv
eApmi8hYQ14hA6LevRCazWA6ILGf5OxkB/l2sh74vCpMD0L+iiKjich9dkCIitS/
sv+08v/B5eHxcwDq5lToU/ZI0sb4fo7HMcO7/8pKYZJ5FvhQXQKbh0QdNPXcv75R
09LmkOSuE47oqStX0AZecSwKkIIuLaWgW0CunQRjsy6ywnHO1Ocx7JZQfNASf/fn
62LJhCGGlQ5QQVG7ptne+CHuFukYtIBj0IX1kOJLFlT5MsWPBEfulEwNYhZNzHEB
jaqzc+9wCaG3gJU50VVWAmJsAh+1J7oIMBoa6bFWja4KJ9PttyQdLu9JW5nz4qkD
qRDabRP7qUSHZ6UNUVo=
=Ob0h
-----END PGP SIGNATURE-----

--kPvmKZRaHW6UEX9w--

--===============4149228403671627032==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


--===============4149228403671627032==--
