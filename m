From: Erik Gilling <konkers-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH 1/2] video: tegra: Add dc color dithering support
Date: Mon, 18 Apr 2011 09:19:57 -0700
Message-ID: <BANLkTim_cQA0ngn=4O=u080FpHVG+Zj+cg@mail.gmail.com>
References: <1302923939-374-1-git-send-email-rmorell@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1302923939-374-1-git-send-email-rmorell-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Robert Morell <rmorell-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Fri, Apr 15, 2011 at 8:18 PM, Robert Morell <rmorell-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wro=
te:

 snip

> + =A0 =A0 =A0 /*
> + =A0 =A0 =A0 =A0* The line buffer for error-diffusion dither is limi=
ted to 640 pixels
> + =A0 =A0 =A0 =A0* per line, so we can't use it if the active region =
is larger than 640
> + =A0 =A0 =A0 =A0* pixels. =A0Be nice and fall back to ordered dither=
ing, but warn so the
> + =A0 =A0 =A0 =A0* platform data can be corrected.
> + =A0 =A0 =A0 =A0*/
> + =A0 =A0 =A0 if (WARN_ON(dc->out->dither =3D=3D TEGRA_DC_ERRDIFF_DIT=
HER &&
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 dc->mode.h_active > 640)) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 dc->out->dither =3D TEGRA_DC_ORDERED_DI=
THER;
> + =A0 =A0 =A0 }

snip

> + =A0 =A0 =A0 case TEGRA_DC_ERRDIFF_DITHER:
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 BUG_ON(dc->mode.h_active > 640);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 color_control |=3D DITHER_CONTROL_ERRDI=
=46F;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 break;
> + =A0 =A0 =A0 }

Since you explicitly make this condition impossible above, the BUG_ON
is not needed.

-Erik
