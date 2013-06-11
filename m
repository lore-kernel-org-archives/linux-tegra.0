From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 2/6] gpu: host1x: Fix syncpoint wait return value
Date: Tue, 11 Jun 2013 12:48:01 +0200
Message-ID: <20130611104800.GA29395@mithrandir>
References: <1368791388-31441-1-git-send-email-amerilainen@nvidia.com>
 <1368791388-31441-3-git-send-email-amerilainen@nvidia.com>
 <20130526101243.GB1652@mithrandir>
 <51A30372.6080907@nvidia.com>
 <20130528103927.GB11547@mithrandir>
 <86y5ay6hrn.fsf@miki.keithp.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="PNTmBPCT7hxwcZjr"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <86y5ay6hrn.fsf-07MG1JmyPZaz9DMzp4kqnw@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Keith Packard <keithp-aN4HjG94KOLQT0dZR+AlfA@public.gmane.org>
Cc: Arto Merilainen <amerilainen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "airlied-cv59FeDIM0c@public.gmane.org" <airlied-cv59FeDIM0c@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Terje Bergstrom <tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, xorg-devel-go0+a7rfsptAfugRpC6u6w@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--PNTmBPCT7hxwcZjr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 28, 2013 at 01:12:12PM -0600, Keith Packard wrote:
> Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> writes:
>=20
>=20
> > That doesn't sound right. Maybe drmIoctl() needs fixing instead. Looking
> > at the history, drmIoctl() was introduced to automatically loop if a
> > signal was received (commit 8b9ab108ec1f2ba2b503f713769c4946849b3cb2).
> > However the ioctl(3p) manpage doesn't mention that ioctl() returns
> > EAGAIN in case it is interrupted by a signal.
>=20
> EAGAIN is being returned when the GPU is wedged to ask the application
> to re-submit the request, which will presumably be held until the  GPU
> is un-wedged.

Isn't that a bit risky? What if something special needs to be done to
unwedge the GPU other than re-submit the request, or if it just can't
be reasonably unwedged. In that case drmIoctl() will keep looping
indefinitely.

If the above is indeed the expected behaviour for drivers, then we need
a different error code for the SYNCPT_WAIT ioctl. EAGAIN is the best fit
and anything else doesn't quite match the use-case. A different option
might be not to use drmIoctl() on Tegra.

Thierry

--PNTmBPCT7hxwcZjr
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iQIcBAEBAgAGBQJRtwBgAAoJEN0jrNd/PrOhivUP/A5yqr0FYcREdBaHC+eLGz7v
Vlvq1uoeTm8VALGb2gJe1ZC1jyIwsif9yHYyw7YRlikXwN/dl7WXqaisYH1NqbaJ
pnfwzLae3CuIM97PYm89HmqbnVNUAXfBwPZonE6+shqIX3dV0n200Qw2o2chb5/3
xLmXUnI2qmlmJ8TpV10nIhhgozY6ZDGkGmS95gjXLIxZg6rCWJBEWpQ7zSHQO7zQ
MmHB0ZFppVRLX4Ww3KXvzVHDZSicPU2f4bxrYo1qfK6Pg4+V7JUZHqghz3hqWglZ
qekD4Zn0/7rdwj4jw9X07IVxgI/KAm0vFyX7UYvf/iWLggrdj7AAGxjwhOx7/U63
f3uYTiO1fKLZ4dxYvuVuFVK7Jg+ET+BEpk4FAtrciOZiMUACqc4WqC/nEvqgnS7x
+gaOgIxDVkUtjMdTb8VPNVwgDaTORblclglZQv/JOqbPtBXlPNhigw3iEfFqXayz
Hq94l9N4UwpEl5G+E5Y4ctMOigB5c5T1Z4IfQorFIPBA4bSmzNNqXlfiDyA2OG23
f5BbFiYa3Zu39FpTNQLr2xKwG2cOeZ2j56rWFQIz5/yPHm7N84zFqvToJQiA/9W/
MC11hO7ZJhhY1oGeslTLM1yjCu0eP6/dXu8Q6FFkoQvBkCSTULt8Lmp81oo8/rpl
TSBo6+mxYeUgg1boZwFa
=ozms
-----END PGP SIGNATURE-----

--PNTmBPCT7hxwcZjr--
