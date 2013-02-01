From: Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>
Subject: Re: [PATCH 5/5] drm/tegra: Implement page-flipping support
Date: Sat, 02 Feb 2013 00:05:28 +0100
Message-ID: <1944869.Bk5ttSU6yt@avalon>
References: <1358178932-25505-1-git-send-email-thierry.reding@avionic-design.de> <CAKMK7uFQKwvEN0j-L=g1UwTzVvtYyqyyBaH8apQnqWPa2sq5vQ@mail.gmail.com> <20130116185606.GC28660@avionic-0098.adnet.avionic-design.de>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart1398412.dDGAGpRi1G"; micalg="pgp-sha1"; protocol="application/pgp-signature"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20130116185606.GC28660-RM9K5IK7kjIyiCvfTdI0JKcOhU4Rzj621B7CTYaBSLdn68oJJulU0Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Cc: Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--nextPart1398412.dDGAGpRi1G
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Thierry,

On Wednesday 16 January 2013 19:56:06 Thierry Reding wrote:
> On Wed, Jan 16, 2013 at 01:36:17PM +0100, Daniel Vetter wrote:
> > On Wed, Jan 16, 2013 at 11:01 AM, Thierry Reding wrote:
> > > drm_events_release() should be enough to clean up the events, but I
> > > suspect the reason why Laurent put that code in was that the drm_crtc
> > > private data still has a reference to the event and needs to clear it.
> > > Otherwise the next page flip won't be scheduled because .page_flip()
> > > would return -EBUSY.
> > 
> > Hm, indeed we seem to have a nice bug in most drivers there :(
> > 
> > > However, it seems like {tegra_dc,shmob_drm_crtc}_cancel_page_flip()
> > > could both be simplified a lot and just set their event to NULL. Then
> > > again, maybe keeping a separate reference isn't all that useful. Maybe
> > > the better thing to do here is iterate over the list of pending VBLANK
> > > events in *_finish_page_flip() and process each of them? That would
> > > allow more than one user-space process to queue page flips.
> > 
> > I think we need a slightly more generally useful solution, since most
> > drivers are currently broken. I've read a bit through the code, but
> > short of refcounting drm events and adding event->file_priv checks at
> > relevent places I don't see a sane solution ... And even that one is
> > rather invasive. Do you have an idea? Imo doing the cleanup in each
> > driver will be rather error-prone, and since usually kms clients wait
> > for flips to complete, also guaranteed to be little tested.
> 
> While this probably doesn't improve the situation much, maybe adding
> more extensive tests to libdrm or so would help. I wrote a couple of
> small programs to test vblank and plane support.
> 
> The vblank one basically generates two framebuffers with different
> patterns and uses page-flipping to alternate between them. The plane
> test does something similar, sets up a plane and associates a buffer
> with it. It includes scaling the plane to test that functionality as
> well.
> 
> Perhaps these tests could even be added to the existing libdrm tests,
> but maybe having separate binaries wouldn't hurt.

Further cleanup of the modetest application is somewhere on my to-do list (but 
probably so low that I'll never get to it unless there's a real incentive 
;-)). It's a good candidate for more page flip testing (there's basic page 
flip support there already).

> Back to the original topic: should it not work to queue a page flip and
> immediately exit(0) after that to test the cleanup code? I suppose if
> that can be tested on all drivers we should have pretty good coverage.

Maybe we need some kind of compliance test suite tool ?

-- 
Regards,

Laurent Pinchart

--nextPart1398412.dDGAGpRi1G
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iQEcBAABAgAGBQJRDEpBAAoJEIkPb2GL7hl17CkH/2roF1uWP5E0t7Hc8R1n4LNQ
pu4pBEvrGfSEPb2HKOVPtrTjGwX+0MrMVvUPL9ZKrM1VnrVOOMb6AKiujX3viTOp
0mCBxEGQY2J+PSNeM0/6k3znyVJVQJ+urVYkqlTwnEgIu0/C3F8HebG/+srnpI1y
bCJN2alVuFPA/4trMksG7u41yfNZerIn6Wyd18lYD56xICzj2IK2Qj9i761q+Rtg
WtlqxFGbKo5Vp4ScJct3v8KdVwBsNPDP5KSSDsMjMGowJN7cawSQwqZN0b7WNRgP
KF1vCm2yGpsQdLPVihm1SynSYDeNuSp0HV6pbJsjMxx77dKO7wCDMoh7zaen8Ns=
=7SYl
-----END PGP SIGNATURE-----

--nextPart1398412.dDGAGpRi1G--
