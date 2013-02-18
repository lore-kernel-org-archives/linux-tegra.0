From: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: Re: [PATCH v3 3/7] drm/tegra: Implement .mode_set_base()
Date: Mon, 18 Feb 2013 08:20:57 +0100
Message-ID: <20130218072057.GA31486@avionic-0098.mockup.avionic-design.de>
References: <1360771506-17849-1-git-send-email-thierry.reding@avionic-design.de>
 <1360771506-17849-4-git-send-email-thierry.reding@avionic-design.de>
 <5121C791.3040903@gmail.com>
 <20130218064832.GB30856@avionic-0098.mockup.avionic-design.de>
 <5121D2E2.7080905@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="X1bOJ3K7DJ5YkBrT"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <5121D2E2.7080905-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Zhang <nvmarkzhang-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Dave Airlie <airlied-cv59FeDIM0c@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--X1bOJ3K7DJ5YkBrT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 18, 2013 at 03:06:10PM +0800, Mark Zhang wrote:
> On 02/18/2013 02:48 PM, Thierry Reding wrote:
> > On Mon, Feb 18, 2013 at 02:17:53PM +0800, Mark Zhang wrote:
> >> On 02/14/2013 12:05 AM, Thierry Reding wrote:
> >>> The sequence for replacing the scanout buffer is much shorter than a
> >>> full mode change operation so implementing this callback considerably
> >>> speeds up cases where only a new framebuffer is to be scanned out.
> >>>
> >>> Signed-off-by: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
> >>> ---
> >>> Changes in v3:
> >>> - split DC_CMD_STATE_CONTROL writes
> >>>
> >>>  drivers/gpu/drm/tegra/dc.c | 31 +++++++++++++++++++++++++++++++
> >>>  1 file changed, 31 insertions(+)
> >>>
> >>> diff --git a/drivers/gpu/drm/tegra/dc.c b/drivers/gpu/drm/tegra/dc.c
> >>> index 8f97b1c..cc4c85e 100644
> >>> --- a/drivers/gpu/drm/tegra/dc.c
> >>> +++ b/drivers/gpu/drm/tegra/dc.c
> >>> @@ -114,6 +114,27 @@ static int tegra_dc_add_planes(struct drm_device=
 *drm, struct tegra_dc *dc)
> >>>  	return 0;
> >>>  }
> >>> =20
> >>> +static int tegra_dc_set_base(struct tegra_dc *dc, int x, int y,
> >>> +			     struct tegra_framebuffer *fb)
> >>> +{
> >>> +	unsigned long value;
> >>> +
> >>> +	tegra_dc_writel(dc, WINDOW_A_SELECT, DC_CMD_DISPLAY_WINDOW_HEADER);
> >>> +
> >>> +	value =3D fb->base.offsets[0] + y * fb->base.pitches[0] +
> >>> +		x * fb->base.bits_per_pixel / 8;
> >>> +
> >>> +	tegra_dc_writel(dc, fb->obj->paddr + value, DC_WINBUF_START_ADDR);
> >>> +
> >>> +	value =3D GENERAL_UPDATE | WIN_A_UPDATE;
> >>> +	tegra_dc_writel(dc, value, DC_CMD_STATE_CONTROL);
> >>> +
> >>> +	value =3D GENERAL_ACT_REQ | WIN_A_ACT_REQ;
> >>> +	tegra_dc_writel(dc, value, DC_CMD_STATE_CONTROL);
> >>> +
> >>> +	return 0;
> >>> +}
> >>
> >> Again, what do you think about the "line stride" problem I mentioned:
> >>
> >> http://lists.freedesktop.org/archives/dri-devel/2013-January/033561.ht=
ml
> >>
> >> Don't get me wrong that I also don't want to add a line stride update
> >> here because that doesn't make sense. It's just a workaround. But we
> >> need to find a way to make multi-head page flip working.
> >=20
> > I'm not sure that it's something we need to support. .mode_set_base() is
> > explicitly used only for cases where the framebuffer configuration
> > doesn't change. That is, only in cases where the only thing that changes
> > is the physical address of the framebuffer to be displayed.
> >=20
> > The current case where one framebuffer is used as scanout for both
> > outputs isn't something that page-flipping can support. Page-flipping is
> > always per-CRTC because typically each CRTC would run at a different
> > frequency (or even if both ran at the same frequency the VBLANK is very
> > unlikely to coincide anyway).
> >=20
> > So an application that wants to support page-flipping on two outputs
> > also needs to take care to set them up with different framebuffers, in
> > which case what you're describing here can't really happen.
>=20
> Yes, the userspace application needs to setup different framebuffers for
> different crtcs. So if LVDS & HDMI are connected, here is what the
> application does:
>=20
> 1. drm reports that 2 connectors: LVDS & HDMI are present in the system
> 2. The resolution of them are: 1366x768 & 1080p
> 3. Userspace application allocates 2 fbs according to the resolution got
> above.
> 4. call drmModeSetCrtc to switch the fb shown in LVDS to the new fb we
> created.
> 5. At this time, remember the line stride setting in dc which connects
> with LVDS is calculated according to the 1080p resolution. So finally we
> got a corrupt display because we're showing a 1366x768 fb but with
> 1080p's line stride.

I don't see how the 1080p stride would still be relevant here. Setting
the LVDS to the new 1366x768 framebuffer should trigger a full modeset
and therefore set the stride to the value required by the new 1366x768
framebuffer.

Thierry

--X1bOJ3K7DJ5YkBrT
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iQIcBAEBAgAGBQJRIdZZAAoJEN0jrNd/PrOhgMsP/2IUAlOobflWT3fa9e0C6tY8
/x9WY07O2FFviC9H5bTN1Jl6Vs9o65do5fq8GlcN5eNcU6ImRQ1m5Mad3d/lXxSV
LdO1XQW0GYGRxYpuO0CnTmDxTL6g2oOvK1+ptTLs0IIguVtS7coay9DKSg80bCIO
B+iqvW5GX/tdRou4vjvjBeUiPnFH8Mo6sbSfMvqG4YjKWQWlhbi1rPcmza22mbJr
aZCiwXIkSFMm+Bs1lKKFyPHSJQwXyVxRvmalg97aidpI21jGEU0fmnwwkYHG2gRX
Zjuuy6odpaTmD7ciF9CgvP1fh584WQM0BfX7LdfgeFOmTtsW0C9nEY/qYg2zUdK9
cx7TXS5QA4amGlg1O89A3pRwddPX/YBaFcNEGWBh9atOPJq5hwwe3T1LvdWokuM2
vcK2ljCjfDzS8/GZ9l9yNwPwNZoPyYKYgcq0T+AtNl8GMVZg+i2d6Gti2aJ1JAUw
7nMR9zT0/MQswlw4GkRUWiayOwH1JxA055oDk/j2NBh4SIaDlEjxcXqLN/syyfPw
gjZOOa91LRMFQ49JU39UTlPL5ncVg+o5BgxdnEnL4OSUYjC30jVaiZtLVgJ3moU8
piPoiIxQh1fwraOVWxZ6oHrAyYYkDkthfMcz07memkyEBzAiI5WjH1iOPGT3g+vk
SjR8/meS0dANWa+Tl7xz
=LSQR
-----END PGP SIGNATURE-----

--X1bOJ3K7DJ5YkBrT--
