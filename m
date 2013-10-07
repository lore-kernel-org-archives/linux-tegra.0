From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 08/27] drm/tegra: gr2d: Miscellaneous cleanups
Date: Mon, 7 Oct 2013 15:13:39 +0200
Message-ID: <20131007131332.GA3795@ulmo.nvidia.com>
References: <1381134884-5816-1-git-send-email-treding@nvidia.com>
 <1381134884-5816-9-git-send-email-treding@nvidia.com>
 <CABPQNSbkS40_jyGz14s08+x3e+-pxnfy90V7pzAOfiqUF2ma2g@mail.gmail.com>
 <20131007121452.GA8324@ulmo.nvidia.com>
 <5252AE8C.9090609@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="9zSXsLTf0vkW971A"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <5252AE8C.9090609-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Terje =?utf-8?Q?Bergstr=C3=B6m?= <tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Erik Faye-Lund <kusmabite-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--9zSXsLTf0vkW971A
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 07, 2013 at 03:52:28PM +0300, Terje Bergstr=C3=B6m wrote:
> On 07.10.2013 15:14, Thierry Reding wrote:
> > * PGP Signed by an unknown key
> >=20
> > On Mon, Oct 07, 2013 at 01:34:44PM +0200, Erik Faye-Lund wrote:
> >> On Mon, Oct 7, 2013 at 10:34 AM, Thierry Reding
> >> <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> >>> Rework the address table code for the host1x firewall. The previous
> >>> implementation allocated a bitfield but didn't check for a valid poin=
ter
> >>> so it could potentially crash.
> >>
> >> I don't think it could crash. The bitmaps was allocated as a 256-bit
> >> field, and the register offset gets AND'ed with 0xFF before being
> >> looked up. What am I missing?
> >=20
> > The pointer returned from the allocation is never checked, so it could
> > theoretically be NULL and be used regardless.
> >=20
> > Also I'm not sure that AND'ing with 0xff is the right thing to do here.
>=20
> Oops, there's a check for NULL missing. If that allocation fails, probe
> should fail, so we just need to propagate the error condition. Otherwise
> we might just leave the firewall off, and let everything go in unchecked.

Yes, definitely.

> AND 0xff is necessary, because the same registers are mirrored in
> multiple contexts. AND removes the offset coming from context, and
> leaves just the plain register offset.

That looks like something which should go into a comment.

> > I'm not so sure. Caching should alleviate the issue with the increased
> > amount of data. Then there's the fact that previously we needed to
> > divide and compute the remainder of the division for the BIT_MASK and
> > BIT_WORD operations.
>=20
> Don't these get compiled into shifts and bitwise ands?

Yes, they are.

> > One other added benefit of this approach is that the address registers
> > are stored in a const array and therefore could reside in a read-only
> > memory region. With the previous approach, once somebody had access to
> > the bitmap, it could easily be overwritten with zeros and effectively
> > make the firewall useless. I'm not sure how likely that would be, but it
> > could be done.
>=20
> If somebody gets access to the bitmap, he has access to kernel data
> structures. GR2D firewall is the least of our worries in this case.

I see the point. Oh well, all my arguments are torn down. I'll drop this
patch. Or at least the part that rewrites the gr2d_is_addr() and make it
check for failed allocations properly.

For what it's worth, I still think the plain table lookup is much easier
to understand.

Thierry

--9zSXsLTf0vkW971A
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.21 (GNU/Linux)

iQIcBAEBAgAGBQJSUrOAAAoJEN0jrNd/PrOhnW4P/2BvyrVZZ/DZ7rbbIqZL7lO2
P2J9BhIubR3NaYjAK98b9LEBy59b5tC3Xfa0XvZpms+5oCaf6KM2wPUleQRiTPXr
djvtuw3+OiuiC5dR56HhbcEVk8OSPASlwfTpnoeUC9JLpfJlEsPoJRHJFT2Byut/
ZViLLKkS5bYHs7RBQ6BTHcNj2W0xtaMJN4S+gw/euDeZurCs7/YRxNyUQbpS9vLb
l0l8TVU5yrgKxg3GBs9jB9/lFNt5gXY8G4CZ72cVBVqne75MIuUz7WR9oSUfRAGe
mkzDKJ2tbC8YXtJ5dIeWMIAF8Z4R8AvnaZk8BETbFfHzSp1PeU5RtwuyMR50dI+S
EvI73L8ByHFlDsdSY9pLJ59sTVrdX42yKgmouy/kmh5c3QQYTdDqRWDdQhRWpFEs
9DzkVnjuIGCRYx0EU6yueejN8uyOvnnaJ39KmWZn3/VggjAPq20RAjfpCbZxezkE
goUzT47ph6VzJyNa4AHhcX5JVJsgTnVSlDjxqKS3bj3FvVvour9D2D8R1qE9rBd1
tznY6v4H5iUotc1Pu4Qfsq2reZ22ZvBUGc/gWjRhLRke/Ax9YQQDWsPM+EJ99Krr
nNEN3wY4aXfNhd96k5Kw7jWpn+sZAv8+7FYNm0TGQ6W3ljX5hoK1RT4wb3UMpc0s
je5oQSkWj+gcZPBq+4XE
=8C9F
-----END PGP SIGNATURE-----

--9zSXsLTf0vkW971A--
