From: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: Re: [PATCH 5/5] drm/tegra: Implement page-flipping support
Date: Tue, 15 Jan 2013 21:17:05 +0100
Message-ID: <20130115201705.GA25976@avionic-0098.adnet.avionic-design.de>
References: <1358178932-25505-1-git-send-email-thierry.reding@avionic-design.de>
 <1358178932-25505-6-git-send-email-thierry.reding@avionic-design.de>
 <CAKMK7uFMa-QwyZJo6QaxAAbpGeNvoNp_T19wF_uA1hr1d2KHog@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="liOOAslEiF7prFVr"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAKMK7uFMa-QwyZJo6QaxAAbpGeNvoNp_T19wF_uA1hr1d2KHog-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org>
Cc: David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--liOOAslEiF7prFVr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 15, 2013 at 06:53:19PM +0100, Daniel Vetter wrote:
> On Mon, Jan 14, 2013 at 4:55 PM, Thierry Reding
> <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org> wrote:
> > +static void tegra_drm_preclose(struct drm_device *drm, struct drm_file=
 *file)
> > +{
> > +       struct drm_crtc *crtc;
> > +
> > +       list_for_each_entry(crtc, &drm->mode_config.crtc_list, head)
> > +               tegra_dc_cancel_page_flip(crtc, file);
> > +}
> > +
>=20
> Why that? If userspace dies while a flip is outstanding, it's imo ok
> to execute it - otherwise there might be an accounting mismatch if the
> hw still scans out the old fb, but drm believes the new one is used.
> Or do I miss something?

I looked at the shmobile driver for inspiration and they do this as
well. Doing so seemed reasonable since there'd be no file to deliver the
event to.

> The reason I've skimmed through the patches is to check for
> implications with my modeset locking rework. Review on that would be
> highly appreciated ...

I'm not sure how suited I am for review given my limited experience, but
I'll see if I can make some time to take a look.

Thierry

--liOOAslEiF7prFVr
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iQIcBAEBAgAGBQJQ9blBAAoJEN0jrNd/PrOhER0P+wQ/jZLBJrOgt0Y3OrmTz9DR
HTEhXhyoG/BmrTMllk7IgypnpkVsXEe6v2P4XpvaHDUz6ImcXRPl+6mbyM6eKwFA
9XzQGMnv+YImam/KBMk0wUnZiAE//q0jHMXQ/yKtSUDGU/9k0uGLEVfVxhZEMnE1
JWOJ69vQRftmrUiNBWwLMny0ZpeI5kYUXoATo6LWc8l/aHQlwJRwDxo9jPSZIngf
0w3oicqZOtLtZFtSlEEGkl/fBhDs6CZPiHZniS+ZNaPDZzvefkpXCsAWlhBDW8c/
TDmzCa4VEFA+BiMla13LddxW3KhDzpzT+yc6DE37BtloMeD0C/ZobW/F88lT4/tZ
S3bH7aqIhTDvRa+SyGov55iy/c8RXMF9dlAjMvpbj5UreKuF2Mjb5520Qtnb+zdr
a0pa0HkTq9m/o3vwH7NAP154/rBr2whdElMxz4fqbLFFCp5V27LBPfhyGX3B+nab
oOOknhs9HepzDrKaCQZqpCMM8/TadyiBffHDJYSg3uHHy8/QMX+0/mi72MdqQyqg
DN7ZX/PpMVwNFzvRL8TTZ+wCxNW/5t50hT799kiA/YUM48X00eNh/qlj8t3jgXvm
5jb7Ity1KfiEilKPZYlkX7qaoD3fljRoroNfRZoiJ67nPAf5Js3oMx47NNi0jGO7
C2pLeckBzpvd5SjG407j
=asQo
-----END PGP SIGNATURE-----

--liOOAslEiF7prFVr--
