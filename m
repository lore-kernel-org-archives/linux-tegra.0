From: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: Re: [PATCH v3 3/7] drm/tegra: Implement .mode_set_base()
Date: Mon, 18 Feb 2013 07:48:32 +0100
Message-ID: <20130218064832.GB30856@avionic-0098.mockup.avionic-design.de>
References: <1360771506-17849-1-git-send-email-thierry.reding@avionic-design.de>
 <1360771506-17849-4-git-send-email-thierry.reding@avionic-design.de>
 <5121C791.3040903@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="A6N2fC+uXW/VQSAv"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <5121C791.3040903-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Zhang <nvmarkzhang-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Dave Airlie <airlied-cv59FeDIM0c@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--A6N2fC+uXW/VQSAv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 18, 2013 at 02:17:53PM +0800, Mark Zhang wrote:
> On 02/14/2013 12:05 AM, Thierry Reding wrote:
> > The sequence for replacing the scanout buffer is much shorter than a
> > full mode change operation so implementing this callback considerably
> > speeds up cases where only a new framebuffer is to be scanned out.
> >=20
> > Signed-off-by: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
> > ---
> > Changes in v3:
> > - split DC_CMD_STATE_CONTROL writes
> >=20
> >  drivers/gpu/drm/tegra/dc.c | 31 +++++++++++++++++++++++++++++++
> >  1 file changed, 31 insertions(+)
> >=20
> > diff --git a/drivers/gpu/drm/tegra/dc.c b/drivers/gpu/drm/tegra/dc.c
> > index 8f97b1c..cc4c85e 100644
> > --- a/drivers/gpu/drm/tegra/dc.c
> > +++ b/drivers/gpu/drm/tegra/dc.c
> > @@ -114,6 +114,27 @@ static int tegra_dc_add_planes(struct drm_device *=
drm, struct tegra_dc *dc)
> >  	return 0;
> >  }
> > =20
> > +static int tegra_dc_set_base(struct tegra_dc *dc, int x, int y,
> > +			     struct tegra_framebuffer *fb)
> > +{
> > +	unsigned long value;
> > +
> > +	tegra_dc_writel(dc, WINDOW_A_SELECT, DC_CMD_DISPLAY_WINDOW_HEADER);
> > +
> > +	value =3D fb->base.offsets[0] + y * fb->base.pitches[0] +
> > +		x * fb->base.bits_per_pixel / 8;
> > +
> > +	tegra_dc_writel(dc, fb->obj->paddr + value, DC_WINBUF_START_ADDR);
> > +
> > +	value =3D GENERAL_UPDATE | WIN_A_UPDATE;
> > +	tegra_dc_writel(dc, value, DC_CMD_STATE_CONTROL);
> > +
> > +	value =3D GENERAL_ACT_REQ | WIN_A_ACT_REQ;
> > +	tegra_dc_writel(dc, value, DC_CMD_STATE_CONTROL);
> > +
> > +	return 0;
> > +}
>=20
> Again, what do you think about the "line stride" problem I mentioned:
>=20
> http://lists.freedesktop.org/archives/dri-devel/2013-January/033561.html
>=20
> Don't get me wrong that I also don't want to add a line stride update
> here because that doesn't make sense. It's just a workaround. But we
> need to find a way to make multi-head page flip working.

I'm not sure that it's something we need to support. .mode_set_base() is
explicitly used only for cases where the framebuffer configuration
doesn't change. That is, only in cases where the only thing that changes
is the physical address of the framebuffer to be displayed.

The current case where one framebuffer is used as scanout for both
outputs isn't something that page-flipping can support. Page-flipping is
always per-CRTC because typically each CRTC would run at a different
frequency (or even if both ran at the same frequency the VBLANK is very
unlikely to coincide anyway).

So an application that wants to support page-flipping on two outputs
also needs to take care to set them up with different framebuffers, in
which case what you're describing here can't really happen.

Thierry

--A6N2fC+uXW/VQSAv
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iQIcBAEBAgAGBQJRIc7AAAoJEN0jrNd/PrOhDG8QAKeqXGSiTJgSyjmK5FIuxDAu
CDAwcC37nzWw6O9+ZmdzXXDOEzTtW4UG2ijKSmKJrWXgWXvrrXnpGuQFEKzbV02n
OnbkL5KuR6F/yplF5Jp70px7SAc+QSrsJ4iVuGOAcYvKA8MKnueDvrgNxJz9i8Zb
Am1PNiDPHa1QxMc06vbpAuuKwHfqzqJ3D/EW3uIs2gH7dIlYb1kZTgn9/rMpX5iq
h6v0+k8Bb/9/Wgz4O9uNQ/PsKgpBQbrR/LQkkoBVmX/BFC2vjCCaKTkk6dOfbwcK
rpc5WZHYvLPyl231dLlG1d9G0oN+suIw6P22l0Jwv/LOZrwlTBSAUyn43gakDExi
zuM+f8uCXZQln/VaZZz2GVXuQG5uwqsIj7FyRh9dquXluR1I6HSEJBDd/NcivKLJ
GiT8EPTvwIbhElNM/BQlp4b1TdsPZ/lodI2S313hqUyCuDAEyR7vbaFSELsUD9S4
WAGkQ28pQZVCr2jN5lruw0NdBswqnPmofEawBHw7xcw+ZmgHxhoPltQbZD0ATYkG
0Ch1fSzWpLilDI6kBVQKhAjidoxf/HDNBxMJkbf/fve0OqE3Kuyq43K/u+gNT3cT
mts9cAew794M81mhNVp8AHz3DDEAZZF9fXKoSlR4nhHb3UwgUmJIbIuteNh2Td2u
WC7sNpRJmA+ZKI4JXNv8
=NN4o
-----END PGP SIGNATURE-----

--A6N2fC+uXW/VQSAv--
