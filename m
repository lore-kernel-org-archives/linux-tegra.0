From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [cbootimage PATCH] Bump to version 1.2
Date: Wed, 28 Aug 2013 17:09:08 +0200
Message-ID: <20130828150907.GA27027@ulmo>
References: <1377628366-25039-1-git-send-email-swarren@wwwdotorg.org>
 <20130828063715.GB5141@ulmo>
 <521E0D81.5010108@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="3V7upXqbjpZ4EhLz"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <521E0D81.5010108-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--3V7upXqbjpZ4EhLz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 28, 2013 at 08:47:29AM -0600, Stephen Warren wrote:
> On 08/28/2013 12:37 AM, Thierry Reding wrote:
> > On Tue, Aug 27, 2013 at 12:32:46PM -0600, Stephen Warren wrote:
> >> From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> >>=20
> >> Create a release that includes Tegra124 support.
> >>=20
> >> Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> ---=20
> >> configure.ac | 2 +- 1 file changed, 1 insertion(+), 1
> >> deletion(-)
> >>=20
> >> diff --git a/configure.ac b/configure.ac index 9b83a21..2d166c5
> >> 100644 --- a/configure.ac +++ b/configure.ac @@ -2,7 +2,7 @@ #
> >> Process this file with autoconf to produce a configure script.
> >>=20
> >> AC_PREREQ([2.67]) -AC_INIT([cbootimage], [1.1],
> >> [pchiu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org]) +AC_INIT([cbootimage], [1.2],
> >> [pchiu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org]) AM_INIT_AUTOMAKE=20
> >> AC_CONFIG_SRCDIR([src/cbootimage.c])=20
> >> AC_CONFIG_HEADERS([config.h])
> >=20
> > I wonder, do we have any place where we can upload tarballs so
> > that distributions can grab them for packaging?
>=20
> Not at present. It looks like github automatically implements this for
> tags. Perhaps we should think about moving the repos there, since we
> already have some on github.

github likely allows you to download a tarball that contains everything
in the repository. However, for distributions it'd be much nicer if they
could just grab a tarball as created by `make dist', since that would
allow them to just run `./configure' without having to autoreconf.

Thierry

--3V7upXqbjpZ4EhLz
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.21 (GNU/Linux)

iQIcBAEBAgAGBQJSHhKTAAoJEN0jrNd/PrOhPKMP/jvvMfxwYq8BkUVx01EJlD17
yaVswskhIJlY0oISQNkZA1OxIdqA5Cd3t8Zlfkkkjw5kZinsiji78W0YJT8NUkO1
QEWfP7jKvGN7EFUJNOw5kn5f3tzHVH7/kZRC9ihAQcncJA9pv7cD0NwG+H7bFjtv
Y3ccWtTQcfhNpWavL9s6D8ITYVX956fespWEmy8MulYHbh5L+q5AtwrFqj/7nph0
RjUi7IqZxQxfwVInZ/Acb3uPzXUWIczmCBqA+xlzHKM27zCqYDqo3u0SVjTGiVMF
+h00EVo7CWwIVosklhRVB5da4oPOiKnBRf7dmcMWdjeLg+xAHJhnm9dZhTYYMtRT
kX61W5QTjCnicIMNhTxHZCDkjlr4Q+wW7+e61JCnvZiFbh4frlbHT1LuvGIt4/Mu
nYwynYeNkcz7trYvmLOcfF66yp8UZFvKdnxvcX4aRWAOA45bZiotgcFpT/qvKNrm
f0JWhzA7IircpE0qwRNylXbjkorqKntAP90xsLHWeKOsOca1lmVrMiIwTWpaLWeh
SkMiQyfImPXcpRQ2mf5iRIKbJ90P0nzCizS5xJNeSGo5NCst9en79Tv6nAmjH/X7
U2ydLj8XtwYnyuWYiAtPumM17AErw0NHdjGf5LTktt4RBKWsowKU2PVEgqbbxzKV
0QsNlff4rpVxDGyS9kDT
=1ruF
-----END PGP SIGNATURE-----

--3V7upXqbjpZ4EhLz--
