From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 08/27] drm/tegra: gr2d: Miscellaneous cleanups
Date: Mon, 7 Oct 2013 14:14:52 +0200
Message-ID: <20131007121452.GA8324@ulmo.nvidia.com>
References: <1381134884-5816-1-git-send-email-treding@nvidia.com>
 <1381134884-5816-9-git-send-email-treding@nvidia.com>
 <CABPQNSbkS40_jyGz14s08+x3e+-pxnfy90V7pzAOfiqUF2ma2g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="LZvS9be/3tNcYl/X"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CABPQNSbkS40_jyGz14s08+x3e+-pxnfy90V7pzAOfiqUF2ma2g-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Erik Faye-Lund <kusmabite-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--LZvS9be/3tNcYl/X
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 07, 2013 at 01:34:44PM +0200, Erik Faye-Lund wrote:
> On Mon, Oct 7, 2013 at 10:34 AM, Thierry Reding
> <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> > Rework the address table code for the host1x firewall. The previous
> > implementation allocated a bitfield but didn't check for a valid pointer
> > so it could potentially crash.
>=20
> I don't think it could crash. The bitmaps was allocated as a 256-bit
> field, and the register offset gets AND'ed with 0xFF before being
> looked up. What am I missing?

The pointer returned from the allocation is never checked, so it could
theoretically be NULL and be used regardless.

Also I'm not sure that AND'ing with 0xff is the right thing to do here.

> > Furthermore setting up a bitfield makes
> > the code more complex than it needs to be.
>=20
> Doesn't this perform worse than the current implementation? Going from
> 1 to 13 checks per write sounds less than ideal to me...

I'm not so sure. Caching should alleviate the issue with the increased
amount of data. Then there's the fact that previously we needed to
divide and compute the remainder of the division for the BIT_MASK and
BIT_WORD operations.

One other added benefit of this approach is that the address registers
are stored in a const array and therefore could reside in a read-only
memory region. With the previous approach, once somebody had access to
the bitmap, it could easily be overwritten with zeros and effectively
make the firewall useless. I'm not sure how likely that would be, but it
could be done.

I guess one could actually go and run a benchmark against both versions
and balance the performance impact against the possible security
implications. But given that we don't really have any benchmarks that's
pretty hard to do.

Thierry

--LZvS9be/3tNcYl/X
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.21 (GNU/Linux)

iQIcBAEBAgAGBQJSUqW8AAoJEN0jrNd/PrOhsdQP/1qUr2J667J4LLMH8Hn6ULuw
1iZoxBdc6zXXxToRoTANKfTUqcXDazO87unynPy/aCpQCNzcxZG3MmsIVjOVNIVm
fnQOsq/x+AilcWipiwHG3Ff0Jc5jAMtgNiYy9PeIxTiH+iMBWy1VlUvH3Ld0itaW
b0Q8NkVHBn0prff64PIjN/tTw6iofB5aZV92VpvGgjemQDry7q2jPL78YFgIjyRg
CkLzBKHFT6SqH7dZmAwHQYf9vqxRaFGuBW2oG+YwFq64L8KcCIC5ZmNx42tk697E
XQG0AGdus7yzJsrkCbuN0dkgEoc0p/TtTLm2Z69xmd8Tz2GxFEZFf9YzUJKD67vc
O4/7g41SQNsPlK2U/r+Xr9NNJCikHvOrFCkrGRVlqubR5zmwAcwI5sqZPHCUamSI
MmwmG9rKE5UxsvwAKKu+GY0GBQ7wDCv5nNGogUou0ZjR8k75TiNebMTFIcNRfAUF
Im3k2lIPqW0TEDgplmpbyWp7ry+q6wY2xzv86ikNbVeRoVg17yZmvyEbBb2LwBH8
7kj3z/mk1CutRUTeRk1MSfPrPMC/ckmL7fupVo1AUqIlzemXUEjGd7JIFUqM8biL
XafAtqnK/3F9pY5SJFNTmosa2FubQI7RphuznIQnuN8F3vsKtRGp18Mq5plWDBnU
CVNw/toMMvkSZkp0rQl+
=qvw+
-----END PGP SIGNATURE-----

--LZvS9be/3tNcYl/X--
