From: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: Re: [RFC v2 0/8] Support for Tegra 2D hardware
Date: Sat, 1 Dec 2012 15:45:12 +0100
Message-ID: <20121201144512.GA18209@avionic-0098.adnet.avionic-design.de>
References: <1353935954-13763-1-git-send-email-tbergstrom@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="cNdxnHkX5QqsyA0e"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1353935954-13763-1-git-send-email-tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Terje Bergstrom <tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--cNdxnHkX5QqsyA0e
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Nov 26, 2012 at 03:19:06PM +0200, Terje Bergstrom wrote:
[...]
> The patch set also adds user space API to tegradrm for accessing
> host1d and 2D. We are preparing also patches to libdrm, but they are
> not yet in condition that they could be sent out.

I did some prototyping on how a libdrm API could look like a few weeks
back. I should clean the patches up some and push them to a public
repository or to the mailing lists for review.

There isn't actually much more than a bit of framework along with two
IOCTLs that allow creating and looking up a Tegra-specific GEM. The
related kernel patches aren't available anywhere since I didn't deem
them ready yet. At that time I wasn't even sure if we'd need special
allocations other than what the dumb BO infrastructure provides. They
implement some parts of what you've implemented in this series as well,
with some slight differences.

Currently these still use the CMA-backed GEM objects but it should be
easy to switch to something backed by the host1x infrastructure once
that's in good shape.

While I can't find the quote right now, I seem to remember that you said
at some point that you were planning on adding some 2D acceleration bits
to libdrm. I don't think that's the right place. That code should rather
go into the DDX. libdrm should instead provide a thin layer on top of
the DRM IOCTLs to manage buffers and submit command streams. I hope I
can finish the cleanup of my libdrm patches over the weekend and push
them out so this may become clearer. Maybe I can even get the
corresponding kernel patches pushed out.

Thierry

--cNdxnHkX5QqsyA0e
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iQIcBAEBAgAGBQJQuhf4AAoJEN0jrNd/PrOhNEsP+wReouOOeSVAbncR5IK58UUn
Cngi8dGAVr2QMaa5Ouc9ZV2EXFD1sProryvEy23VAPs0Bsrg0DyCMrDAwWpjzFaS
gIExzX9fWHVmLV7Tt4V9z7q5DXaJa9GgpB/K/P5Csm9dfWvIPKzRfuIYu4HDBSYm
kITwPofRL6JYgxhMVNYkRdDXqM+0+kB5xYxXSQ7ebWTpW5E1qWOemw1xYwr1gizb
yzyBh7obsCoqRDMvW82oubLxLmn7HWzowttGscoMB6u0LUGFQKPZP+D78cybSdpJ
6IP9goFqHZ5qZAGcuR7YJephjiI8jV1cbebXUf/iW0iXp5SHj7D1MU5yQBL2ciGp
4J86p6qa2gtWqOcEAuqAY8C7+SzIWH15Ai9YEyvgRBUL4fCexHQVin0qif5Qq+qb
ZVBc/bgdofmXDyYkkaozsl78nfMxnHKW2qsNb+Vs3bKTF42EzSl4qG+DJm3pDoqV
5a7TZbqvZ9Fd4T5PUxFUy6FmLz1AfWoQ7I4xyMBF1Evfm4pX3OhUxMUw10gNS0vE
hA0tnr7a3r7Qq3ceDvOvr+Tz5Rcn1MaLphclmMOk0mtohVhAxCXg2q4b2N0C6bBC
DEqzMWYHRzc1SOSOFQhOn9D8xMpQOp265uBXlaMXBMYZgmIszdJhl5amE3u/lVNw
CReIF73IT9SSfXF18/kT
=FzI8
-----END PGP SIGNATURE-----

--cNdxnHkX5QqsyA0e--
