From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: TK1 System Freeze
Date: Wed, 7 Feb 2018 18:51:06 +0100
Message-ID: <20180207175106.GA25486@ulmo>
References: <1511135854.13661.3.camel@toradex.com>
 <7d874417cbb2067bcb4f49af000f9f03@agner.ch>
 <19526d1015c3c60e8bbdf26ec9d082bb@agner.ch>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="qMm9M+Fa2AknHoGS"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <19526d1015c3c60e8bbdf26ec9d082bb-XLVq0VzYD2Y@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: stefan-XLVq0VzYD2Y@public.gmane.org
Cc: Marcel Ziswiler <marcel.ziswiler-2KBjVHiyJgBBDgjK7y7TUQ@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--qMm9M+Fa2AknHoGS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 06, 2018 at 08:51:19AM +0100, stefan-XLVq0VzYD2Y@public.gmane.org wrote:
> On 13.01.2018 01:19, Stefan Agner wrote:
> > Hi Marcel, Hi Thierry,
> >=20
> > On 2017-11-20 00:57, Marcel Ziswiler wrote:
> >> Hi there
> >>
> >> I lately was tasked to run some legacy Qt4e [1] application on Apalis
> >> TK1. It should really only draw directly to the Linux frame buffer
> >> /dev/fb0. Strangely as soon as that application is started the whole
> >> system freezes. Running it with the VNC backend or a pure frame buffer
> >> emulation it works just fine. So it must have something to do with the
> >> particular way the frame buffer is done on TK1. So far no attempt in
> >> debugging this any further bear any fruit. Whether stracing what the
> >> application is doing nor tracing the linux kernel side of things
> >> revealed where exactly the freeze happens. As I feared some kind of a
> >> configuration issue on Apalis TK1 I also tried the same on Jetson TK1
> >> with latest stock Linux kernel 4.14. However the same freeze happens.
> >=20
> > This is still the case with 4.15-rc7.
> >=20
> > While dd is not enough to reproduce it, using a simple fbdev application
> > such as ts_calibrate seems to be sufficient. Qt and ts_calibrate use
> > mmap for the framebuffer. The system seems to freeze when it tries to
> > write into the mapped area (at the memset line):
> > https://github.com/kergoth/tslib/blob/master/tests/fbutils-linux.c#L160
> >=20
> > Is this a known problem? Any idea?
>=20
> Thierry, anybody else, any idea? This should be easily reproducible on
> Jetson TK1.

I was able to reproduce this on Venice2 (just because I was using it for
unrelated work, I'm pretty certain this can be reproduced on Jetson TK1)
and came up with a fix. I think the problem is that fbdev has an mmap()
implementation that conflicts with what we do in DRM/KMS and therefore
causes a hang. I've sent out a series with the fix. It'd be great if you
two can check that this indeed fixes the issue for you on Apalis. It did
fix the issue for me on Venice2.

Tested using fbdev.c from here:

	https://patchwork.kernel.org/patch/743682/

This seems like it would have been broken since the dawn of time. Have
you never encountered this before? Or has it only recently broken with
newer kernels? We probably want this backported to all stable releases.

Thierry

--qMm9M+Fa2AknHoGS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlp7PIcACgkQ3SOs138+
s6GsLBAAiLkHj1zQGa9t90VT/adPWaOGhddjExkWGQS5YIbCx4tz66HXZG3cuNRX
s6xnJ+XMfMC0ZFFwwlnsQnDWvEx/RfULU8dC81R6vmdkepHez9imaj/1iXdoVAer
gzMdSuVdfwi6cDOWuBxUGs3OSORR7YtV+mT5tcYTgFQMDSBOMXaWIFp4sfk46lQH
aNuruTtGM8c72meH/wHIvI1UaD0ovTY6QDSzi/o66M/kZAXHWQlEn9R9gwV+j8CV
6bv6z8hNUEfBciQOhLjVMeWKyFVm+RUBUAV58+GjQGr68fw3EPbO4m6prZqc2Vx3
SJ0bVZpS1f0S3P9fdhpK3c39os0k8v3nQFBWogy9vCjSFxuEC2JDW/WmzCwpBq4z
AcLhW46NGn/qzd1S4KevjyUZ6K2qYHZmkuiKrBz+8ODBM/oz8NYtl36AodT0Bl95
OaOh5SXvTs+bvY5warQbN6szZbBvvWR5rpEbxvnMecsLl5VLXc0oTL1iRe6X7zrd
rZekZUQySRM2gHL/wC0IWIJRTcMTNjORJT2jbbQrFb8jDnycySbLamVk3YoJ/K3g
0g/7IBiPo/R7Q/voXObGZdC2pNC004gIooGjAEkEKp0A3IU60F1vNPz6zNVsVW6h
kC199RufhyWVcf1Lx4XiZCvJ8q8X66H1khzfCCfXB3ueQBGZkIQ=
=/idJ
-----END PGP SIGNATURE-----

--qMm9M+Fa2AknHoGS--
