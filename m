From: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: Re: [PATCH 5/5] drm/tegra: Implement page-flipping support
Date: Wed, 16 Jan 2013 11:01:49 +0100
Message-ID: <20130116100149.GA13628@avionic-0098.adnet.avionic-design.de>
References: <1358178932-25505-1-git-send-email-thierry.reding@avionic-design.de>
 <1358178932-25505-6-git-send-email-thierry.reding@avionic-design.de>
 <CAKMK7uFMa-QwyZJo6QaxAAbpGeNvoNp_T19wF_uA1hr1d2KHog@mail.gmail.com>
 <20130115201705.GA25976@avionic-0098.adnet.avionic-design.de>
 <CAKMK7uEV_w5rfoUv3xdTdYra+UOCnirf5GUK+2L2pxifUxFVmw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="azLHFNyN32YCQGCU"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAKMK7uEV_w5rfoUv3xdTdYra+UOCnirf5GUK+2L2pxifUxFVmw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org>
Cc: David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--azLHFNyN32YCQGCU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 16, 2013 at 10:43:15AM +0100, Daniel Vetter wrote:
> On Tue, Jan 15, 2013 at 9:17 PM, Thierry Reding
> <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org> wrote:
> > On Tue, Jan 15, 2013 at 06:53:19PM +0100, Daniel Vetter wrote:
> >> On Mon, Jan 14, 2013 at 4:55 PM, Thierry Reding
> >> <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org> wrote:
> >> > +static void tegra_drm_preclose(struct drm_device *drm, struct drm_f=
ile *file)
> >> > +{
> >> > +       struct drm_crtc *crtc;
> >> > +
> >> > +       list_for_each_entry(crtc, &drm->mode_config.crtc_list, head)
> >> > +               tegra_dc_cancel_page_flip(crtc, file);
> >> > +}
> >> > +
> >>
> >> Why that? If userspace dies while a flip is outstanding, it's imo ok
> >> to execute it - otherwise there might be an accounting mismatch if the
> >> hw still scans out the old fb, but drm believes the new one is used.
> >> Or do I miss something?
> >
> > I looked at the shmobile driver for inspiration and they do this as
> > well. Doing so seemed reasonable since there'd be no file to deliver the
> > event to.
>=20
> Hm, is the code in drm_events_release not good enough? And if it's
> buggy, we need to fix it. Also adding Laurent to figure out why he
> added that code in shmob ...

drm_events_release() should be enough to clean up the events, but I
suspect the reason why Laurent put that code in was that the drm_crtc
private data still has a reference to the event and needs to clear it.
Otherwise the next page flip won't be scheduled because .page_flip()
would return -EBUSY.

However, it seems like {tegra_dc,shmob_drm_crtc}_cancel_page_flip()
could both be simplified a lot and just set their event to NULL. Then
again, maybe keeping a separate reference isn't all that useful. Maybe
the better thing to do here is iterate over the list of pending VBLANK
events in *_finish_page_flip() and process each of them? That would
allow more than one user-space process to queue page flips.

> >> The reason I've skimmed through the patches is to check for
> >> implications with my modeset locking rework. Review on that would be
> >> highly appreciated ...
> >
> > I'm not sure how suited I am for review given my limited experience, but
> > I'll see if I can make some time to take a look.
>=20
> The commit message should nicely explain why I've picked the design
> and the various implications for drivers. So just checking whether
> anything collides with your upcoming stuff would be good ...

Okay, I'll take a closer look.

Thierry

--azLHFNyN32YCQGCU
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iQIcBAEBAgAGBQJQ9nqNAAoJEN0jrNd/PrOh+7cP/jCQ9F9Wi4LRJCJQvxdC3Mrs
4MaLAHwnPnNVaZRdv8in6oNw+8wS0LDzMvtdh+1TQiNbub/IiEE+OqZZQ9KS+04w
L40oFNeJJXy7mgmVGLAcx5Duk+G8nSa932aSP3vrGX14meltRizV6SGZc9rEiOCK
iuqC7IE3ApsTDfZxp+Mqek6p1WmPI/d2kcASGOLRzgR7xzIE6lQloCt5iaHa8JQ1
N/iFep5szRlMP98pcg9hB1ZAjyV012wDiiD1cHvTYQTEiC1hb8Kj8TgGT6N1c9b3
1A7qcttg1UoBLHFlfax9qYeWEMr3a7dnkeCZ5/gFOSdKl9phV+JXnAv7oQMMZ8ed
dfnQBbB9kGqf+l3PclVLn7qpRNdgdjPKE6PD8RvZrgmJCT7Ypu2Ji5WJ2W29KRUE
1Gm9scZd5Bxk/imqk279gaNwCXZj54yBdkqu6quCl+Ddc0u+rzDj0MJTD5I34tEs
wffjeuZls4uN+76Mr0qIg1wlr0RByJ8xwM47Z2LJCXJAY1fb4/jwPF4DUrFEL25p
b0lMrLh3XryFfbsApjwTNu/1jq7cJr4nHuLaUVuJh7ZbieBO3VMTWqlW6Djro05U
/hGEkoiQOGePq1kCF6kk3ezuI++In7PoP5wFebF7egbZf7Id7+4Ce8Lz3RnA7tnS
b0r7wHMPuRAjF/oTY8hs
=TyBE
-----END PGP SIGNATURE-----

--azLHFNyN32YCQGCU--
