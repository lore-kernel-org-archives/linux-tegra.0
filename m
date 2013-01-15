From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Subject: Re: [PATCH v2 2/5] drm/tegra: Add plane support
Date: Tue, 15 Jan 2013 13:35:32 +0200
Message-ID: <20130115113532.GC3503@intel.com>
References: <1358179560-26799-1-git-send-email-thierry.reding@avionic-design.de>
 <1358179560-26799-3-git-send-email-thierry.reding@avionic-design.de>
 <50F526FF.1010101@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <50F526FF.1010101-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Zhang <nvmarkzhang-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Tue, Jan 15, 2013 at 05:53:03PM +0800, Mark Zhang wrote:
> On 01/15/2013 12:05 AM, Thierry Reding wrote:
> > Add support for the B and C planes which support RGB and YUV pixel
> > formats and can be used as overlays or hardware cursor.
>=20
> I think "hardware cursor" has specific meaning for Tegra(e.g: Tegra30
> has a 32x32 24bpp or 64x64 2bpp hardware cursor). So you may change i=
t
> to "hardware accelerated cursor"?
>=20
> >=20
> > Signed-off-by: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
> > ---
> [...]
> > +
> > +static const uint32_t plane_formats[] =3D {
> > +	DRM_FORMAT_XRGB8888,
> > +	DRM_FORMAT_YUV422,
>=20
> I haven't found something related with YUV format in this patch set. =
=46or
> example, "tegra_dc_format" also doesn't take YUV into consideration. =
So
> remove this line.

Also note that YUV422 is a planar format. And since it's not the most
common 4:2:2 format, my first guess would be that it's probably not
what you wanted. YUYV or UYVY is more likely the one you're after.

--=20
Ville Syrj=E4l=E4
Intel OTC
