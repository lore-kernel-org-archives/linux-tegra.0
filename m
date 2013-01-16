From: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: Re: [PATCH 5/5] drm/tegra: Implement page-flipping support
Date: Wed, 16 Jan 2013 19:56:06 +0100
Message-ID: <20130116185606.GC28660@avionic-0098.adnet.avionic-design.de>
References: <1358178932-25505-1-git-send-email-thierry.reding@avionic-design.de>
 <1358178932-25505-6-git-send-email-thierry.reding@avionic-design.de>
 <CAKMK7uFMa-QwyZJo6QaxAAbpGeNvoNp_T19wF_uA1hr1d2KHog@mail.gmail.com>
 <20130115201705.GA25976@avionic-0098.adnet.avionic-design.de>
 <CAKMK7uEV_w5rfoUv3xdTdYra+UOCnirf5GUK+2L2pxifUxFVmw@mail.gmail.com>
 <20130116100149.GA13628@avionic-0098.adnet.avionic-design.de>
 <CAKMK7uFQKwvEN0j-L=g1UwTzVvtYyqyyBaH8apQnqWPa2sq5vQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ALfTUftag+2gvp1h"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAKMK7uFQKwvEN0j-L=g1UwTzVvtYyqyyBaH8apQnqWPa2sq5vQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org>
Cc: David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--ALfTUftag+2gvp1h
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 16, 2013 at 01:36:17PM +0100, Daniel Vetter wrote:
> On Wed, Jan 16, 2013 at 11:01 AM, Thierry Reding
> <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org> wrote:
> > drm_events_release() should be enough to clean up the events, but I
> > suspect the reason why Laurent put that code in was that the drm_crtc
> > private data still has a reference to the event and needs to clear it.
> > Otherwise the next page flip won't be scheduled because .page_flip()
> > would return -EBUSY.
>=20
> Hm, indeed we seem to have a nice bug in most drivers there :(
>=20
> > However, it seems like {tegra_dc,shmob_drm_crtc}_cancel_page_flip()
> > could both be simplified a lot and just set their event to NULL. Then
> > again, maybe keeping a separate reference isn't all that useful. Maybe
> > the better thing to do here is iterate over the list of pending VBLANK
> > events in *_finish_page_flip() and process each of them? That would
> > allow more than one user-space process to queue page flips.
>=20
> I think we need a slightly more generally useful solution, since most
> drivers are currently broken. I've read a bit through the code, but
> short of refcounting drm events and adding event->file_priv checks at
> relevent places I don't see a sane solution ... And even that one is
> rather invasive. Do you have an idea? Imo doing the cleanup in each
> driver will be rather error-prone, and since usually kms clients wait
> for flips to complete, also guaranteed to be little tested.

While this probably doesn't improve the situation much, maybe adding
more extensive tests to libdrm or so would help. I wrote a couple of
small programs to test vblank and plane support.

The vblank one basically generates two framebuffers with different
patterns and uses page-flipping to alternate between them. The plane
test does something similar, sets up a plane and associates a buffer
with it. It includes scaling the plane to test that functionality as
well.

Perhaps these tests could even be added to the existing libdrm tests,
but maybe having separate binaries wouldn't hurt.

Back to the original topic: should it not work to queue a page flip and
immediately exit(0) after that to test the cleanup code? I suppose if
that can be tested on all drivers we should have pretty good coverage.

Thierry

--ALfTUftag+2gvp1h
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iQIcBAEBAgAGBQJQ9vfGAAoJEN0jrNd/PrOhfmsP/3ojEdzS6B5fmNNpAADyXYs9
/OQFntiRWBf0XP1ONbHXiCFJ0QNw+4CYLDr8SlSeRjeXBIgxMuLJ0qiICuY5+PQ+
aaVGcah115KUlsjCG6v/YlQbdoh5ud1B08hP2foMEY1n0Nqmans9jKUSdDKSwipS
VcDjia8DPPHEW9RQ7OxKhcoYq7aTCSHENSp8h8WRwa4P8KOwYEToM442xLpMVu1R
W2jpqpZRzTdO2r0dnbxoPGjcuESBxLT4ZCekHb+57VFt0076E5Z7tHnVznzliWsl
0jh6mOrz47JauLwoWG6zpTh94v7d5NUBoHcUJBV49FEfUndbpDZKo70IHiKWtjDV
IyeRIrXiohBVDr7dSTOnYZfDRJuNwMAmr+rPNB+3xQDaWCUrHV3rwBY+yvF4r5Z9
JnjNDDA0aOe6p9xhjjXZ9OR6D+ugC+Kr0rGMC6aLt853AwsqUPJn0H6jhvvikbRR
SNMKPMaJ69fxwhgN+ph/I26MtVgD4r3C1NLGvEkGkByTTsQiFFq9o6adgcKyDjdM
ASTsbu9dYWPvbUmKQFlTr145R6P14aRJ8izLQ9Do9TfJR1yXiWHMREQj3dnm/1J6
LDf6LpQbL7uEMeUXSk9xwSxgpMbUirAJ5XGKCv2V6e2awk8KGwLw2jtaiFbv4Gdz
mQ2djughdWzs9t33Jm1s
=ptyw
-----END PGP SIGNATURE-----

--ALfTUftag+2gvp1h--
