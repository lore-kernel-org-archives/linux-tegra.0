From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH 2/5] host1x: hdmi: Detect whether display is connected
 with HDMI or DVI
Date: Wed, 28 Aug 2013 14:07:28 +0200
Message-ID: <20130828120727.GA32254@ulmo>
References: <1377686459-16634-1-git-send-email-mperttunen@nvidia.com>
 <1377686459-16634-3-git-send-email-mperttunen@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="/9DWx/yDrRhgMJTb"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1377686459-16634-3-git-send-email-mperttunen@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Mikko Perttunen <mperttunen@nvidia.com>
Cc: tbergstrom@nvidia.com, dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--/9DWx/yDrRhgMJTb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 28, 2013 at 01:40:56PM +0300, Mikko Perttunen wrote:
> Use EDID data to determine whether the display supports HDMI or just DVI.
> This used to be hardcoded to be HDMI, which broke support for DVI displays
> that couldn't understand the interspersed audio/other data.
>=20
> If the EDID data isn't available, default to DVI, which should be a safer
> choice.
>=20
> Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
> ---
>  drivers/gpu/host1x/drm/hdmi.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
>=20
> diff --git a/drivers/gpu/host1x/drm/hdmi.c b/drivers/gpu/host1x/drm/hdmi.c
> index d81fac8..140339b 100644
> --- a/drivers/gpu/host1x/drm/hdmi.c
> +++ b/drivers/gpu/host1x/drm/hdmi.c
> @@ -702,6 +702,14 @@ static int tegra_output_hdmi_enable(struct tegra_out=
put *output)
>  	unsigned long value;
>  	int retries =3D 1000;
>  	int err;
> +	struct drm_property_blob *edid_blob =3D output->connector.edid_blob_ptr;
> +
> +	if (edid_blob && edid_blob->data &&
> +		drm_detect_hdmi_monitor((struct edid *)edid_blob->data)) {
> +		hdmi->dvi =3D false;
> +	} else {
> +		hdmi->dvi =3D true;
> +	}
> =20
>  	pclk =3D mode->clock * 1000;
>  	h_sync_width =3D mode->hsync_end - mode->hsync_start;

Odd, now that I see that code I remember that there was a similar patch
a few months back, but it was never applied for some reason:

	http://lists.freedesktop.org/archives/dri-devel/2013-January/033509.html

That was already reviewed by me and Jon Mayo, so I'll go ahead and apply
that one instead.

Thierry

--/9DWx/yDrRhgMJTb
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.21 (GNU/Linux)

iQIcBAEBAgAGBQJSHef/AAoJEN0jrNd/PrOh/P0QAJmIW9L44iA5CetsBMux8aiH
sbzrc5VQa7nkaeYIi2y+1t3Yu4/VKr8u4FBAsguFoJo6/xgonyTJi+4XGQy0/jeb
r5jw+zJKuotBPr4Y9JgN4BZHwblIolyrsriHPrZ0Tn/QzEIWcVhXDjiG331tDSIm
N/lF2ZBt4nMD07t/2iGH+OubtzzbZc/Mx22TLsUAt5JIzRKq3IFPSPPrkGfKSuCT
q+WFr8Dn5iKYHkYA+qm92taW4AHiiHpJeUxHsUy5U6rO1odl2Vejet9VHuUXL+M+
zyVvV7cDFgebCMZyYX0Qq6EUT2gpR35k+iOqZUbR5icjcnmMOkcP2FsjPIPvFvW0
676DsCcgFYLrhKaeGTnlLtamy7q7ieGG7lrJWeMiuLsKJsWRVYQOhLBl3iG8NZ4H
lMwhl/LAQy8kfFyOQMT7G4WBLTWkvwQ+OxZTlehcO8bciGBCfTSizxmKhsD7FNBd
zsiw9yFpD0ETihDUiuVbaCVjr9rwCQhIhVwkxxLtrv59cVr2nM6SnRDQSngHeGiG
SA6rFabW3RHmm/Gwdbu7Nd3IO/uBTvP4BFC9pfFmd4ijGXxJy0Bdsbje67tsiAWg
aWqRxzobU1nZSW6/65/G4G7M7ua6RtkptKQGlrZSwO8EZC1ktU6sJDnyxBSg/iol
AKoOtlZMssNPfXrYUyEm
=03iA
-----END PGP SIGNATURE-----

--/9DWx/yDrRhgMJTb--
