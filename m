From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [RFC PATCH v1 0/5] Add Tegra driver for video capture
Date: Thu, 30 Jan 2020 16:42:46 +0100
Message-ID: <20200130154246.GA2904678@ulmo>
References: <1580235801-4129-1-git-send-email-skomatineni@nvidia.com>
 <a6512e1b-ad0e-3f59-e775-418db4865994@xs4all.nl>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="G4iJoqBmSsgzjUCe"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <a6512e1b-ad0e-3f59-e775-418db4865994@xs4all.nl>
Sender: linux-kernel-owner@vger.kernel.org
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: Sowjanya Komatineni <skomatineni@nvidia.com>, jonathanh@nvidia.com, frankc@nvidia.com, linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--G4iJoqBmSsgzjUCe
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 30, 2020 at 03:41:50PM +0100, Hans Verkuil wrote:
> Hi Sowjanya,
>=20
> On 1/28/20 7:23 PM, Sowjanya Komatineni wrote:
> > This series adds Tegra210 VI and CSI driver for built-in test pattern
> > generator (TPG) capture.
> >=20
> > Tegra210 supports max 6 channels on VI and 6 ports on CSI where each
> > CSI port is one-to-one mapped to VI channel for video capture.
> >=20
> > This series has TPG support only where it creates hard media links
> > between CSI subdevice and VI video device without device graphs.
> >=20
> > v4l2-compliance results are available below the patch diff.
> >=20
> > [v0]:	Includes,
> > 	- Adds CSI TPG clock to Tegra210 clock driver
> > 	- Host1x video driver with VI and CSI clients.
> > 	- Support for Tegra210 only.
> > 	- VI CSI TPG support with hard media links in driver.
> > 	- Video formats supported by Tegra210 VI
> > 	- CSI TPG supported video formats
>=20
> I'm trying to compile this patch series using the media_tree master
> branch (https://git.linuxtv.org//media_tree.git), but it fails:
>=20
> drivers/staging/media/tegra/tegra-channel.c: In function =E2=80=98tegra_c=
hannel_queue_setup=E2=80=99:
> drivers/staging/media/tegra/tegra-channel.c:71:15: warning: unused variab=
le =E2=80=98count=E2=80=99 [-Wunused-variable]
>    71 |  unsigned int count =3D *nbuffers;
>       |               ^~~~~
> drivers/staging/media/tegra/tegra-channel.c: In function =E2=80=98tegra_c=
hannel_init=E2=80=99:
> drivers/staging/media/tegra/tegra-channel.c:518:55: error: =E2=80=98struc=
t host1x_client=E2=80=99 has no member named =E2=80=98host=E2=80=99
>   518 |  struct tegra_camera *cam =3D dev_get_drvdata(vi->client.host);
>       |                                                       ^
> make[4]: *** [scripts/Makefile.build:265: drivers/staging/media/tegra/teg=
ra-channel.o] Error 1
> make[4]: *** Waiting for unfinished jobs....
> drivers/staging/media/tegra/tegra-vi.c: In function =E2=80=98tegra_vi_tpg=
_graph_init=E2=80=99:
> drivers/staging/media/tegra/tegra-vi.c:157:55: error: =E2=80=98struct hos=
t1x_client=E2=80=99 has no member named =E2=80=98host=E2=80=99
>   157 |  struct tegra_camera *cam =3D dev_get_drvdata(vi->client.host);
>       |                                                       ^
> drivers/staging/media/tegra/tegra-vi.c: In function =E2=80=98tegra_vi_ini=
t=E2=80=99:
> drivers/staging/media/tegra/tegra-csi.c: In function =E2=80=98tegra_csi_i=
nit=E2=80=99:
> drivers/staging/media/tegra/tegra-vi.c:213:51: error: =E2=80=98struct hos=
t1x_client=E2=80=99 has no member named =E2=80=98host=E2=80=99
>   213 |  struct tegra_camera *cam =3D dev_get_drvdata(client->host);
>       |                                                   ^~
> drivers/staging/media/tegra/tegra-csi.c:259:51: error: =E2=80=98struct ho=
st1x_client=E2=80=99 has no member named =E2=80=98host=E2=80=99
>   259 |  struct tegra_camera *cam =3D dev_get_drvdata(client->host);
>       |                                                   ^~
> drivers/staging/media/tegra/tegra-vi.c: In function =E2=80=98tegra_vi_exi=
t=E2=80=99:
> drivers/staging/media/tegra/tegra-vi.c:246:51: error: =E2=80=98struct hos=
t1x_client=E2=80=99 has no member named =E2=80=98host=E2=80=99
>   246 |  struct tegra_camera *cam =3D dev_get_drvdata(client->host);
>       |                                                   ^~
> drivers/staging/media/tegra/tegra-csi.c: In function =E2=80=98tegra_csi_e=
xit=E2=80=99:
> drivers/staging/media/tegra/tegra-csi.c:286:51: error: =E2=80=98struct ho=
st1x_client=E2=80=99 has no member named =E2=80=98host=E2=80=99
>   286 |  struct tegra_camera *cam =3D dev_get_drvdata(client->host);
>       |                                                   ^~
>=20
> And indeed, struct host1x_client as defined in include/linux/host1x.h doe=
sn't
> have a 'host' field.
>=20
> Does this series depend on another patch that's not yet in mainline?

Sowjanya's been working on top of linux-next, so, yes, this patch
depends on a change that's been merged into the DRM tree for v5.6-rc1.

Thierry

--G4iJoqBmSsgzjUCe
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl4y+XIACgkQ3SOs138+
s6FAZA//cpCNsEQU8gEHAU0CjI4DzvBc1qaYpfV6h43+F3Yray8ifipc/2NH66wY
QUfBqh14a7p01FH/E2Y/aI01fJO62p7TN/vpTSJj7IkznUTIRDoBwSGU4AGwIHnU
GTSjcYbv247B1aD1zZdG7T8xVN6qoCyVostAQz4LQJGm/wlalTlHbjvhnxXIFgAm
tcZWT0dz7AEct7cStf5FbbfUe/3Q7YUPD/VofigxjL1QHiLrD9GlSHk4HSW2BUq+
rrYI+raXFfVyE615KDqmZRcar9D/jVWdIqkn352u7M0G7te3JNkvwGujV7CuiS6B
I/7E+QOG+r+gPR7TjLrZETkqbpaJZlhlYE2/V/GEWMavezU6yxuRnNkLH058lZ1I
BJ+m/Elc4wOu9i1Y0JvlZgtChSGekGkjv/h0Doc2M/82l0OfbWJ0SGUudc0SeFtw
eL65CkD7JaWTcamAzMmlpZAO7KulHW5bNhU9NnYL/lYt30OS2I2clqK2bgAKS3G4
qyIOdqDaxmxkiOl4YTR+jGu1HTTpLvD9UxaV0Xk1tZ40X1AvapdG+cLogvV4LLrr
8jvUw0vkEjDg6qwQ8gFs3zAG6Zn2rgbSwNb8tOUw0tR15FWM7ti7P0Ldaep2LT2T
2qQF+D4XPiA5U5iL6jne6eRwZ1/n1aNpH2YsCgq1PfJFofV0nII=
=5dmL
-----END PGP SIGNATURE-----

--G4iJoqBmSsgzjUCe--
