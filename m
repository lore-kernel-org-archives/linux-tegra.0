From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] ARM: tegra: fix naming in GPIO DT binding header
Date: Wed, 6 Apr 2016 19:28:45 +0200
Message-ID: <20160406172845.GC28843@ulmo.ba.sec>
References: <1459884307-24043-1-git-send-email-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="da4uJneut+ArUgXk"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1459884307-24043-1-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--da4uJneut+ArUgXk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 05, 2016 at 01:25:07PM -0600, Stephen Warren wrote:
> From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>=20
> According to the Tegra TRM, GPIOs are aggregated into /ports/ of 8 GPIOs,
> not into /banks/. Fix <dt-bindings/gpio/tegra-gpio.h> to correctly reflect
> this naming convention. While this seems like silly churn, it will become
> slightly more important once we introduce the GPIO binding for upcoming
> Tegra chips.
>=20
> Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>  include/dt-bindings/gpio/tegra-gpio.h | 68 +++++++++++++++++------------=
------
>  1 file changed, 34 insertions(+), 34 deletions(-)

It's not clear to me where this should be applied. This is technically
part of the GPIO controller bindings, in which case it'd need to go via
the GPIO tree. I'm fine with taking it through the Tegra tree, too, but
in case you agree that it should go through the GPIO tree:

Acked-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

--da4uJneut+ArUgXk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJXBUdMAAoJEN0jrNd/PrOhLUQP/RBq0IDla2ZA95ia2P0IZbx8
t2MMjTZdZMX6i12YyDyYib92KDz5J6Nm6iIXvudxwHBF7S7Vt4wqviQx10d5j/TD
n/zrubofXIF+ctLVDapSZqymRT2WIXV+oDpaPS+nudpSyxfBB6CncNXZ/G8rsFHl
OPaz3F1pemebQaQPY8H8rrTpyfydJ/WNfhJnpaNwKj6kTV6pH08e0DIo/2wC8Eu5
+1YoRkkr43LF1nG63MYNkEDxKIWl3NZR8hmfm5su58a3gIgM4ILDBhVsmHNCd5F8
QmXmbYXbMNzOs0MckC5Ib5B6XQrQq94AcMzZl7X7ZWhpraK+mobvulUf8SbgXfym
couBjXjLpXg3jPRe9yj9e9UahkEHuVRvFfXLw9mQKfpgVi/wKP/mncM4BJagwQrR
QXxDyzob00iwtiBEBQmJTdgpf6VLR+IIc2/BBXs9MQKKo4pL52k3F+KW4i4NJik4
Q+QN/6At/yLUw673yDh+8n/TjQMBKL7G0GjSACwHzL8A8rQ+xuxv4A6DPUJo8M9F
GXdekqITsPOrF7yRtohxQFPXpcKbcK4kGA2LOEy295Gm2kDSdweIk3wKxPzCY0eP
YjUQFM2Az5Fj58Vde9H1gWtUVP73j9Yk0iBoj9x78EaLFTO+tYmufeZZJuJrP+ei
YYS2GxXmhVEGmgBdveHl
=2uBF
-----END PGP SIGNATURE-----

--da4uJneut+ArUgXk--
