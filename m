From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v3 4/4] ARM: tegra: roth: add display DT node
Date: Fri, 11 Jul 2014 15:14:22 +0200
Message-ID: <20140711131421.GD10827@ulmo>
References: <1404822734-8603-1-git-send-email-acourbot@nvidia.com>
 <1404822734-8603-5-git-send-email-acourbot@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0397952534=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1404822734-8603-5-git-send-email-acourbot@nvidia.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: gnurou@gmail.com, Terje Bergstrom <tbergstrom@nvidia.com>, Stephen Warren <swarren@wwwdotorg.org>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Andrzej Hajda <a.hajda@samsung.com>, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--===============0397952534==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="11Y7aswkeuHtSBEs"
Content-Disposition: inline


--11Y7aswkeuHtSBEs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 08, 2014 at 09:32:14PM +0900, Alexandre Courbot wrote:
> Tegra DSI support has been fixed to support continuous clock behavior that
> the panel used on SHIELD requires, so finally add its device tree node
> since it is functional.
>=20
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
> ---
>  arch/arm/boot/dts/tegra114-roth.dts | 22 +++++++++++++++++++---
>  1 file changed, 19 insertions(+), 3 deletions(-)

I've applied this to Tegra's for-3.17/dt branch. Thanks.

Thierry

--11Y7aswkeuHtSBEs
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJTv+MtAAoJEN0jrNd/PrOhUcQQAJFUrru8mU40w0L9H6Cu7cVb
ljJ23wwc81SJo4QzIJIbhIXL0LQkIZ50vt+sgYC7Jzlr9WQ8OU/wvUkvrtUIAPVI
bf9SoR5zbOi6K+1ih1/5nCFFyhlCQ8Ovp3VHy54fIuG8kI2yPgLchR/9sP0NKZTu
dYfudFla9bpGpOkGvdXBGMRU18JCQ5P//MN+azjB80qCB79NaQyFAXZMUwiyc5fO
g/vuFep9+CGDZF6+6vvLcgvBAXK0fu0UXSI3Vl0Lbb2/Wy/3aUqwsgDZ+rU4ORjD
8c3yY3hwQ9AgAqNORIn7MlB7RlCfMqA1r369CQOwVXIWr7wxuQLJKrADH5kUtPre
uLL0Lk1YQ7bzuAinI875tKmnKIyN2N/G7f4dmqvFRI9zzw4Qhs2QtuC1eV72MXqG
CTy38tR0HhQIzEW5GABImH8W/F0QDY98wuh7xFCAWVKPr8LycGtpc8XJvSeFjKzV
6TWV8PM+cWwU3SuHEBWVYQjRbxgS9hx+VCcS9tl9fnoTls3X+sIg5bDJxgfSPjAf
cojezho0Yyhi42VCel7XAYX0IJ9FEoW8WUQIlhFQ5Bc+w3W8CpcBNTPj1oL3wS+i
vicU9kAQCPVcIk8I/z8yGBBsSgKF6psG4Keor/CVLNAd4T4/K9E9a38p00F5qQbR
1FqiyZ3LqPcgme9nG8oo
=o2Q7
-----END PGP SIGNATURE-----

--11Y7aswkeuHtSBEs--

--===============0397952534==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
http://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0397952534==--
