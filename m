From: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: Re: [PATCH v2 5/5] drm/tegra: Implement page-flipping support
Date: Tue, 22 Jan 2013 09:57:56 +0100
Message-ID: <20130122085756.GA6315@avionic-0098.adnet.avionic-design.de>
References: <1358179560-26799-1-git-send-email-thierry.reding@avionic-design.de>
 <1358179560-26799-6-git-send-email-thierry.reding@avionic-design.de>
 <50FE4E4F.6080506@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="jRHKVT23PllUwdXP"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <50FE4E4F.6080506-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Terje =?utf-8?Q?Bergstr=C3=B6m?= <tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, "dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--jRHKVT23PllUwdXP
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 22, 2013 at 10:31:11AM +0200, Terje Bergstr=C3=B6m wrote:
> On 14.01.2013 18:06, Thierry Reding wrote:
> > +static int tegra_dc_page_flip(struct drm_crtc *crtc, struct drm_frameb=
uffer *fb,
> > +			      struct drm_pending_vblank_event *event)
> > +{
> > +	struct tegra_framebuffer *newfb =3D to_tegra_fb(fb);
> > +	struct tegra_dc *dc =3D to_tegra_dc(crtc);
> > +	struct drm_device *drm =3D crtc->dev;
> > +	unsigned long flags;
> > +
> > +	if (dc->event)
> > +		return -EBUSY;
> > +
> > +	tegra_dc_set_base(dc, 0, 0, newfb);
> > +
> > +	if (event) {
> > +		event->pipe =3D dc->pipe;
> > +
> > +		spin_lock_irqsave(&drm->event_lock, flags);
> > +		dc->event =3D event;
> > +		spin_unlock_irqrestore(&drm->event_lock, flags);
> > +
> > +		drm_vblank_get(drm, dc->pipe);
> > +	}
> > +
> > +	return 0;
> > +}
>=20
> The patch seems fine to me. I have a question for a follow-up.
>=20
> In downstream dc driver we initiate a page flip, and assign a fence
> (syncpt id, value) to it. We return the fence to user space. Then when
> the actual page flip is done, dc increments the sync point.
>=20
> User space can take the fence and use it for synchronizing graphics
> operations. In downstream, we use that fence to be able to submit
> operations to graphics units and synchronize them to the flip by adding
> a host wait. It improves performance, because we can prepare and send
> the graphics operations to hardware while flip is still happening.
>=20
> Is this something we could do in tegra-drm, too? DRM's page flip IOCTL
> doesn't seem to have a way to pass a fence back from fence, so we'd need
> to find a way to pass the fence back to user space.
>=20
> Of course, this has the prerequisite of having support for syncpts,
> which I hoped we would get to 3.9. The review for host1x patches seem to
> have stalled, so that's iffy.

Yes, I haven't found as much time as I would have liked to look at the
latest patches. Perhaps there will be a time slot at the end of the
week. I thought there was also the remaining issue with the memory
allocator that Lucas (Cc'ed) was working on?

Thierry

--jRHKVT23PllUwdXP
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iQIcBAEBAgAGBQJQ/lSUAAoJEN0jrNd/PrOhhD4QAJCgGB7yrzP94ap35R05BYVf
nmcbpJPVfbCq5K3e5PYU2WSBs8uivVrt2oWu2N3NwPIsLZPoBF+vZwLWBDR4iteR
NKK7mUJg5d4T7OGFCvB1sng/CYOfZ8J1ojTPoZi/wV3kHPNie5NP824c6GNQB9H1
Ga+v4gCQFYteTOP4L2lMyHxleaO9aEIpieY/kDF8ZCSXJt+Ez+jZFblmjAAK43ct
nSASCWcvyD8zkwcu539nM2jnu2tKO1g1ufDIhX4c9nMT1jAKyPWg2xDJGRzVsy1+
Yvpsb8iI6V/X7AkoROsUkoKTHR118iNFX+egFUdR5d023PjY9VBDoPQBbcqeWXTS
jxmiVlI77Z7rdmpMMGW8GKe3WzHiKXwTm6kosUHdKHESU9k9bF0JU7EVYEFs/vA1
4F7xTjBV7U+PfykPe6UyiB+7Wrxdck9tmwXUt4kFG3PtMfYFoq/8Z1vwzOmPsgTf
KRED4BMKzQli2uYcgn9ZY8wNxUNqFUek5idfLnulVTAiQgC2qpxIEnF7UMJrlwgF
9ayV0CCSb2C5cp2IIAzZZc4ZBQ9JoY2dmeQ1iW6bnf7Vl0YcIWt4Q4+cWFRX37GT
/jnQZAHyFz5M9hTN03R8/Vp0tvM7B/BHnR7RQOKoahI/M1YYyIL4daNOoP947asl
rajiK/JxfoHNw5fDg+Td
=/RnI
-----END PGP SIGNATURE-----

--jRHKVT23PllUwdXP--
