From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Subject: Re: [PATCH 08/12] gpu: host1x: Port the HDMI vendor infoframe code
 the common helpers
Date: Wed, 14 Aug 2013 14:20:10 +0300
Message-ID: <20130814112010.GR7159@intel.com>
References: <1376435848-14584-1-git-send-email-damien.lespiau@intel.com>
 <1376435848-14584-9-git-send-email-damien.lespiau@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1376435848-14584-9-git-send-email-damien.lespiau-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Damien Lespiau <damien.lespiau-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Cc: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, intel-gfx-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Terje =?iso-8859-1?Q?Bergstr=F6m?= <tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Wed, Aug 14, 2013 at 12:17:24AM +0100, Damien Lespiau wrote:
> I just wrote the bits to define and pack HDMI vendor specific infofra=
me.
> Port the host1x driver to use those so I can refactor the infoframe c=
ode
> a bit more.
>=20
> Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> Cc: Terje Bergstr=F6m <tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
>=20
> Signed-off-by: Damien Lespiau <damien.lespiau-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
> ---
>  drivers/gpu/host1x/drm/hdmi.c | 24 ++++--------------------
>  1 file changed, 4 insertions(+), 20 deletions(-)
>=20
> diff --git a/drivers/gpu/host1x/drm/hdmi.c b/drivers/gpu/host1x/drm/h=
dmi.c
> index 01097da..b548918 100644
> --- a/drivers/gpu/host1x/drm/hdmi.c
> +++ b/drivers/gpu/host1x/drm/hdmi.c
> @@ -539,7 +539,7 @@ static void tegra_hdmi_setup_audio_infoframe(stru=
ct tegra_hdmi *hdmi)
> =20
>  static void tegra_hdmi_setup_stereo_infoframe(struct tegra_hdmi *hdm=
i)
>  {
> -	struct hdmi_vendor_infoframe frame;
> +	struct hdmi_hdmi_infoframe frame;
>  	unsigned long value;
>  	u8 buffer[10];
>  	ssize_t err;
> @@ -551,26 +551,10 @@ static void tegra_hdmi_setup_stereo_infoframe(s=
truct tegra_hdmi *hdmi)
>  		return;
>  	}
> =20
> -	memset(&frame, 0, sizeof(frame));
> +	hdmi_hdmi_infoframe_init(&frame);
> +	frame.s3d_struct =3D HDMI_3D_STRUCTURE_FRAME_PACKING;
> =20
> -	frame.type =3D HDMI_INFOFRAME_TYPE_VENDOR;
> -	frame.version =3D 0x01;
> -	frame.length =3D 6;

This changes the length of the infoframe from 6 to 5, which is enough
for "frame packing", but maybe the commit msg should still mention that
small detail.

> -
> -	frame.data[0] =3D 0x03; /* regid0 */
> -	frame.data[1] =3D 0x0c; /* regid1 */
> -	frame.data[2] =3D 0x00; /* regid2 */
> -	frame.data[3] =3D 0x02 << 5; /* video format */
> -
> -	/* TODO: 74 MHz limit? */
> -	if (1) {
> -		frame.data[4] =3D 0x00 << 4; /* 3D structure */
> -	} else {
> -		frame.data[4] =3D 0x08 << 4; /* 3D structure */
> -		frame.data[5] =3D 0x00 << 4; /* 3D ext. data */
> -	}
> -
> -	err =3D hdmi_vendor_infoframe_pack(&frame, buffer, sizeof(buffer));
> +	err =3D hdmi_hdmi_infoframe_pack(&frame, buffer, sizeof(buffer));
>  	if (err < 0) {
>  		dev_err(hdmi->dev, "failed to pack vendor infoframe: %zd\n",
>  			err);
> --=20
> 1.8.3.1
>=20
> _______________________________________________
> dri-devel mailing list
> dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> http://lists.freedesktop.org/mailman/listinfo/dri-devel

--=20
Ville Syrj=E4l=E4
Intel OTC
