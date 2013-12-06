From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/2] ARM: tegra: rebuild tegra_defconfig
Date: Fri, 6 Dec 2013 16:22:26 +0100
Message-ID: <20131206152225.GF32372@ulmo.nvidia.com>
References: <1386196073-25193-1-git-send-email-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="yRA+Bmk8aPhU85Qt"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1386196073-25193-1-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--yRA+Bmk8aPhU85Qt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 04, 2013 at 03:27:52PM -0700, Stephen Warren wrote:
> From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>=20
> This separates out "NULL" changes from future real changes.
>=20
> Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>  arch/arm/configs/tegra_defconfig | 12 ++++--------
>  1 file changed, 4 insertions(+), 8 deletions(-)

Not sure if this makes sense for what's essentially a machine-generated
change, but I've at least verified that this doesn't drop anything
unwanted, so:

Reviewed-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

--yRA+Bmk8aPhU85Qt
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJSoeuxAAoJEN0jrNd/PrOhKwcP/2acbodD/XNf2al8WoSPboEd
BNXHLH9yAG2NHeoy3MeoD0h1Z6Ww2IzZj2x3mVD786YqF68Zdn7EVHOyGxh/5jAc
jfA/xOOCED6rgYeoRQAVdCS4OIs3naEb9hmnrinK/xh3KfotyMcf4jCPd1YFBHdy
JCebgMG33BkGdiT62axEjAicP8cPNV2nCjV8Wp41C8KFga2BCMt4fzpfWCPzE1rN
kg3Y0B3rxf94LVZ01+wX63UeURGPDuXZiM/BjChuyI+nXzSko/2zm+O5RWzosgJE
btFEuMb+XqAllD4avRr5VRDF+qVZxau5cfMN32TffelwyQc/eGo0wqv/Fqm19Lz7
9BBV4yeJUbf6+dJ/1Bc26VPm+PSADUTph+kmrnAYwnn5hfD+cnChGLBzNRU1yGMH
he8ZrbrKY05hDBSlJljwCny+OVBbJ1AUWmiwVaZsQbdbFAGiXoMt/HvRolH/B+dZ
i+FjT2Ud76N6e5Ii5kWvTTo2375n5jvBQr+sntoSbFD0y1hyAws4HZK/EUE2ICGY
LHBy6wZUffYy+D9fA3CX5YL2kqeZBPcCnGd182r+iBG03tG3oD2iKdZs3kF7SmhR
BL5Vv2KyNerxbWRvP3FC8DRNAy6nNGf5l5k6o3bVjtlgttdj3JuDGQBpV+GsqIl6
GDToC6hvfoLULdMrK0yP
=XQC5
-----END PGP SIGNATURE-----

--yRA+Bmk8aPhU85Qt--
