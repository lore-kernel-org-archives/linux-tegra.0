From: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: Re: [PATCH v2 5/5] drm/tegra: Implement page-flipping support
Date: Mon, 11 Feb 2013 10:00:01 +0100
Message-ID: <20130211090001.GA3423@avionic-0098.mockup.avionic-design.de>
References: <1358179560-26799-1-git-send-email-thierry.reding@avionic-design.de>
 <1358179560-26799-6-git-send-email-thierry.reding@avionic-design.de>
 <50FE4E4F.6080506@nvidia.com>
 <50FECBFC.8080307@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="LQksG6bCIzRHxTLp"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <50FECBFC.8080307-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mario Kleiner <mario.kleiner.de-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Terje =?utf-8?Q?Bergstr=C3=B6m?= <tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Mario Kleiner <mario.kleiner-TdbV1Z3I5XE0NhjG498hmQ@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--LQksG6bCIzRHxTLp
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 22, 2013 at 06:27:24PM +0100, Mario Kleiner wrote:
> On 22.01.13 09:31, Terje Bergstr=C3=B6m wrote:
> >On 14.01.2013 18:06, Thierry Reding wrote:
> >>+static int tegra_dc_page_flip(struct drm_crtc *crtc, struct drm_frameb=
uffer *fb,
> >>+			      struct drm_pending_vblank_event *event)
> >>+{
> >>+	struct tegra_framebuffer *newfb =3D to_tegra_fb(fb);
> >>+	struct tegra_dc *dc =3D to_tegra_dc(crtc);
> >>+	struct drm_device *drm =3D crtc->dev;
> >>+	unsigned long flags;
> >>+
> >>+	if (dc->event)
> >>+		return -EBUSY;
>=20
> Hi
>=20
> I haven't read the Tegra programming manual or played with this, so
> maybe i'm wrong for some reason, but i think there is a race here
> between actual pageflip completion - latching newfb into the scanout
> base register and the completion routine that gets called from the
> vblank irq handler.
>=20
> If this code gets called close to vblank or inside vblank, couldn't
> it happen that tegra_dc_set_base() programs a pageflip that gets
> executed immediately - the new fb gets latched into the crtc, but
> the corresponding vblank irq handler for the vblank of flip
> completion runs before the "if (event)" block can set dc->event =3D
> event;? Or vblank irq's are off because drm_vblank_get() is only
> called at the end of the routine? In both cases the completion
> routine would miss the correct vblank and only timestamp and emit
> the completion event 1 vblank after actual flip completion.
>=20
> In that case it would be better to place tegra_dc_set_base() after
> the "if (event)" block and have some check inside the flip
> completion routine to make sure the pageflip completion event is
> only emitted if the scanout is really already latched with the
> newfb.

An easier solution might be to expand the scope of the lock a bit to
encompass the call to tegra_dc_set_base() and extend until the end of
tegra_dc_page_flip(). That should properly keep the page-flip completion
=66rom interfering, right?

	spin_lock_irqsave(&drm->event_lock, flags);

	tegra_dc_set_base(dc, 0, 0, newfb);

	if (event) {
		event->pipe =3D dc->pipe;
		dc->event =3D event;
		drm_vblank_get(drm, dc->pipe);
	}

	spin_unlock_irqrestore(&drm->event_lock, flags);

Thierry

--LQksG6bCIzRHxTLp
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iQIcBAEBAgAGBQJRGLMRAAoJEN0jrNd/PrOh1UMP/1CPYGryDdsHZDwlfSOx6kTB
78aoRwZxkbvw9h6UTCxHbRtQHZbt2QRPKcXK7momx3Yf/pkksZ2zYG4BtHe8uNUJ
D3fJpiLbTOjUTvIfoEBM0l3shAh0cusyqNUSFiPJTkJxBiBIXE3mpIIj0nqOBqGM
VVjrHZ+6cb+J2mZ8+N61TcNbs/F6iMIko/IVBWEzKYYbHgcLYi643Cu6zPrPdsiS
zK/EsCHCr871bTX3kwyVx8YfChvqX5cYfAal9qUVekrAV1y4Q+sgyE5uQTyNogZM
PE8oL/LExXxlSSr8XoAL7TRs5TeqKm9DLe5eMixAKcEBhLB7rvFcQWXfq8xHiXWM
C5R4enrM1xTLMVQOW1MGjZyF6/wBR2lMXig77rblUaDospKTC5rZEP+MAHgyaf9u
7Dvy/OC+yRf+L5HqXExy4pr4DDdTNd2YcMTIjMIOzDx7YTTdpc0lBiIOOrVbi21t
pdS5z8yraDoiVsLUTPGHu7gQ5ZaPE2UsvdchNqkkUhspDHOdH7w5uf3FkDdBUq/3
d4C/j+kYc6GAXlkrYZlY58ig3WIweUfjiu7y7/AQFDCHJ3/seJezH6G8L9RDLQVA
X38EPVyOCOJFbpqPxS94bLSBPIzxb6iSndVjcZUJUutKJPeCe3uY4/jDU8o6UDT1
0gRLcR9urQATiMeXeesw
=Arer
-----END PGP SIGNATURE-----

--LQksG6bCIzRHxTLp--
