From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v7 7/9] drm: tegra: use cec_notifier_conn_(un)register
Date: Mon, 14 Oct 2019 14:17:19 +0200
Message-ID: <20191014121719.GB422231@ulmo>
References: <20190814104520.6001-1-darekm@google.com>
 <20190814104520.6001-8-darekm@google.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="b5gNqxB1S1yM7hjW"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190814104520.6001-8-darekm@google.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dariusz Marcinkiewicz <darekm@google.com>
Cc: dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org, hverkuil-cisco@xs4all.nl, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Jonathan Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--b5gNqxB1S1yM7hjW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 14, 2019 at 12:45:05PM +0200, Dariusz Marcinkiewicz wrote:
> Use the new cec_notifier_conn_(un)register() functions to
> (un)register the notifier for the HDMI connector, and fill in
> the cec_connector_info.
>=20
> Changes since v4:
> 	- only create a CEC notifier for HDMI connectors
>=20
> Signed-off-by: Dariusz Marcinkiewicz <darekm@google.com>
> Tested-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> ---
>  drivers/gpu/drm/tegra/output.c | 28 +++++++++++++++++++++-------
>  1 file changed, 21 insertions(+), 7 deletions(-)

Applied, thanks.

Thierry

--b5gNqxB1S1yM7hjW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl2kZ08ACgkQ3SOs138+
s6HRvA/9FCMG8xuBzW58WQPgv7upIyoGmbyjXMcB+GZHiu/ziLojFw2/6AHUVgWv
vUdbN79pMwLpJ/6fyDlltaeB6y9U4KSJ1B8+0CzAivrc454O/AflNVE/Eq+GNvWY
bZSicV3BhRfZcQ99FpApoX/RR+RWqJgSCw7FGRFPnV6zODoHzTrceTABesfyajku
uG15X+iKJn+BLWnXBGUCzJAVOmDARdUipNrGZX+sz0YlWTEw7RHMrKWyErmjy0AE
HUUsxB5jLFZu5oBii2NangwZCb4vyGsFSmxHYeUzKVeg1bSymdvN9tPbDARY3084
KWbqqQ52vZD2dNDWQbzWAKWyFYffjBT88FdfZVM1RGTlR//6cFk3takN7xoKCHjv
E2zXdDb9jj8dhoJZrEUN/D9XB18jsDMU88+5zpsmNTTd0kBhzbNg1bqhoYCXyfsj
wRsTfHhicnPWBPEUyLhukyWiAqYDoOzCkPylPMe+YRte+n3ENh+BqUAGkwW9gyZJ
x7efFoQs4mCeEFcNl5A4a/DHaqH5q9FY3+193To/+lHXsH9vMFlner04WTp0UTa3
Vk6xW57T9XvbY/dLcA80HLQWcObfsIgLPRinUhs/ZKTIrvEhZImWIKQqX+vqYLkQ
3Tri2+gUpeODIShnLlTJ8T7LEMB9FfxuLVy10DsX4faZW/WiF9M=
=igMm
-----END PGP SIGNATURE-----

--b5gNqxB1S1yM7hjW--
