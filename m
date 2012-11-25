From: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: Re: xf86-video-tegra or xf86-video-modesetting?
Date: Sun, 25 Nov 2012 14:40:33 +0100
Message-ID: <20121125134033.GB30264@avionic-0098.adnet.avionic-design.de>
References: <20121124210916.GB27042@avionic-0098.adnet.avionic-design.de>
 <CAOMqctTQGzhu3gU5hdJWKOCU0Dyk1vxCjE918PMa7aR+o1pTiQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="gj572EiMnwbLXET9"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAOMqctTQGzhu3gU5hdJWKOCU0Dyk1vxCjE918PMa7aR+o1pTiQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michal Suchanek <hramrach-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: xorg-devel-go0+a7rfsptAfugRpC6u6w@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Dave Airlie <airlied-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--gj572EiMnwbLXET9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 25, 2012 at 12:45:07PM +0100, Michal Suchanek wrote:
> Hello,
>=20
> On 24 November 2012 22:09, Thierry Reding
> <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org> wrote:
>=20
> > However, that has all the usual drawbacks of a fork so I thought maybe
> > it would be better to write some code to xf86-video-modesetting to add
> > GPU-specific acceleration on top. Such code could be leveraged by other
> > drivers as well and all of them could share a common base for the
> > functionality provided through the standard DRM IOCTLs.
> >
> > That approach has some disadvantages of its own, like the potential
> > bloat if many GPUs do the same. It would also be a bit of a step back
> > to the old monolithic days of X.
> >
>=20
> You can always make the tegra part a submodule if you think putting it
> into the driver directly is too monolithic.

Good point. I suppose it could also be made selectable at compile time,
similar to how things are done in libdrm. I'm not particularly worried
about the monolithic aspect, but I wanted to bring it up for discussion
and see what other people think.

Thierry

--gj572EiMnwbLXET9
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iQIcBAEBAgAGBQJQsh/RAAoJEN0jrNd/PrOhuRoQAMH5UFeAc0oJLpzKCPHAYRkE
8/2Q5I5U2b9+UJN9N17lODuDnqPlm4JcmDkzjXPQLQCtw/SjuBMvuKB9CUVp4Nxg
YR1t051Ax608CyvlkAZpxFvJJrQJ4ze59i7TBPVLNgqTB39zgNSfxfIF+3T2wlQ3
XA9qORDVhytO+fRT3Wz+UMAIKLyO7K3tgkxsmvgPJkuVkbOCLPAN6UuGUG1fw3y7
A/otfHx/153FxTDLxGZijyosvzntbF+q1/3PJfBTTk8UqY9vThyA16B64ZLVQY6g
o/DyIdfxEiSwyKcbSY0idLit4VblYUHrP2o8weoAVQnHPJAc/XDd4xOM6KpjYvEl
KCON52h5yD+87vXw4HXtg8o40n+QMeYuh5+pJQH6CSCcXhzQWe53cEoNnmzV+jke
pcN0FRFtSXTPegjoDIG0ykncvKG3xb0WikXOn+h0Bctuk8KBPfg9JzU/Qn5DlY/O
C84ahsYr3X18rKa6JDL0p2pKP6hKAfelcEqN1GeJ02Q7f1EOpq9LILJ26o9eOTlZ
ePcogm/2x7G1bKgDQ0wXLV4cBq3sO0/Kd2hAJhtCko0KQJ0rlx0yDD4D7W2ykDhr
Wq98CKL9iN3oio7PLumgkzRY8WN3GMzAq5Bd2AxZmJspKDtCFYwHyd5vrERY88Mn
m7FByzylxEL9tSwMl13E
=FW1r
-----END PGP SIGNATURE-----

--gj572EiMnwbLXET9--
