From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH 1/2] drm/panel: Add support for Samsung LTN101NT05 panel
Date: Wed, 8 Jan 2014 16:24:30 +0100
Message-ID: <20140108152429.GG21974@ulmo.nvidia.com>
References: <f03a644deb858f10affb7b039f9982bac81b02c9.1387656959.git.marvin24@gmx.de>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1437480128=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <f03a644deb858f10affb7b039f9982bac81b02c9.1387656959.git.marvin24@gmx.de>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Sender: dri-devel-bounces@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
To: Marc Dietrich <marvin24@gmx.de>
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org, Thierry Reding <treding@nvidia.com>, linux-arm-kernel@lists.infradead.org
List-Id: linux-tegra@vger.kernel.org


--===============1437480128==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ulDeV4rPMk/y39in"
Content-Disposition: inline


--ulDeV4rPMk/y39in
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Dec 21, 2013 at 09:38:12PM +0100, Marc Dietrich wrote:
> The Samsung LNT101NT05 10.1" WXVGA panel can be supported by the simple p=
anel
> driver.
>=20
> Cc: linux-fbdev@vger.kernel.org
> Cc: dri-devel@lists.freedesktop.org
> Cc: David Airlie <airlied@linux.ie>
> Signed-off-by: Marc Dietrich <marvin24@gmx.de>
> ---
> This isn't strickly required to get the panel up, but Thierry suggested o=
n IRC to
> include it anyway, in case someone else has some use for it.

For the record: the reason this isn't strictly needed is because there's
an EDID that can be probed to get the video timings. But the panel still
can be supported using the timings from the datasheet. One example where
this would be useful is when the EDID isn't connected or simply broken.

That said: applied, thanks!

Thierry

--ulDeV4rPMk/y39in
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJSzW2tAAoJEN0jrNd/PrOhXaMP/38NU0fvKjjQV0AFLuZakbMo
b5oIduYQlcwJ2BdtCC5i9Q4sxV1TjS1n5EO5tSQTJfqs2139G/MK1BfkgfNeuOVU
VCBdPgT6Ds+csRwmbs6rIJgCWzAiLSBJJkyR8hYF23l8Pk2tRtB6sayuUDXVefGW
dNBIRcKSruM2qllW8RtB3ptyoJBhCXfym2Q7BALw0ELaPdKyVp18P4gv31BCGv7T
FLvy7X54Y55K4/9l2HTas+Xi/n+R7qks49+YpdTcxWbMqWqpjPDqUGSgTXkwwJgb
u0QnKnaONAQh41WfxMJhKaBTm3ii/RquC69A1FtxQ3DDoE/+/YP15TPOQiO7mczy
zDGhDdE1Se87U/shH2oG7q4X3/RqfddmAQOyV1shScF8vfcYu46dACu/MgTrpxJC
epwFn25r240aIj5I5ZCesHl8Ge+3cs9ei6FI9FzdDBa5uEZYGL8m+JE/uFgaHKG4
9qcIoJbiLpkdhLPJ+ysoH5DkfT84fTNvfB1Df4yjMc3et2kBenLOCY5AuefKGREB
l/QQ7f/z+rGR7JgrOzL2tVLtZT+LmXuitQ8s7j1sKUdlESJhY88EliNVFhcAi/Uj
vc0T8nmvbZ3O7j9ELRgfVk/S+9X5zD8TDpGIYiwGA/XYudjVQoIraTCm4BaG1QXw
gX4uU+DczBNEi+rsQGoC
=ZPIr
-----END PGP SIGNATURE-----

--ulDeV4rPMk/y39in--

--===============1437480128==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
http://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1437480128==--
