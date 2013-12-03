From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] gpu: host1x: Silence a few warnings with LPAE=y
Date: Tue, 3 Dec 2013 11:09:54 +0100
Message-ID: <20131203100953.GE21178@ulmo.nvidia.com>
References: <1384327010-8870-1-git-send-email-olof@lixom.net>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="maH1Gajj2nflutpK"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1384327010-8870-1-git-send-email-olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Cc: airlied-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Arto Merilainen <amerilainen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--maH1Gajj2nflutpK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 12, 2013 at 11:16:50PM -0800, Olof Johansson wrote:
> When building with LPAE=3Dy (64-bit dma_addr_t), the following warnings a=
re seen:
>=20
> drivers/gpu/host1x/hw/cdma_hw.c:57:3: warning: format '%x' expects
>   argument of type 'unsigned int', but argument 5 has type 'dma_addr_t'
>=20
> drivers/gpu/host1x/hw/debug_hw.c:167:10: warning: format '%x' expects
>   argument of type 'unsigned int', but argument 3 has type 'dma_addr_t'
>=20
> The agreed-to solution for this is upcast to u64 and using %llx.
>=20
> Signed-off-by: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
> ---
>  drivers/gpu/host1x/hw/cdma_hw.c  |    4 ++--
>  drivers/gpu/host1x/hw/debug_hw.c |    4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)

Applied, thanks.

Thierry

--maH1Gajj2nflutpK
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJSna3xAAoJEN0jrNd/PrOhjP0QAKLjLx9vOi4FoQe+kC3/B/0y
6CXuSgH2J3hxYehZK77jy320UjgHqn3dS3eFSxcxd1bcQaeqHLB+qBOECEm1+L7T
iQuNev/+KbEzZZjd7kV6FeZ3l67oIOMYjZB+zk+U/iUG9iRsHRz0EZXDyAKZAl8z
DcpZSQPnLn8HxFxRGxNwFdYlwN9/QuVG6nP0oC0/BbjCIUtybnft2qmYZxEowuyD
gW3VxdO/n9NRbHlmvaV4xSpaa62iyqDWBoxwd7+0eE+vIDBJaocRc2fPmsfSm+FA
46YE7c5YlgYDp8VHc7rxXgjYV5IWwtLgMeahDcEmVjk2a1GQpDWqXGxxlwy0hsgR
optshTAf5xEDMYWJ5+qylWiS0B7o+c+0aYpGTglKjLmxoTr8brWWmR9N0EzGWNa5
zCZgFlvMNCS5uTY1Is3q1KdhCMJi5WkawuXb4QPFu/co1mUG406Kwwpze5LXXkFd
vDWW8XmvaNN5QidK/80OHjkeLpMDhniwhJLKafgOJrgvem/TWe9ZNilR+yqnj9lw
PA2KY/pn8bxAt6i56UbeasCRK5pXdJLPvMhS+CyPLUsPQMM7kpxKzU7QV+9NUVws
qhaL2jkzuGELUh7RGwimP3WpCL/trK681XPDqx76mrumacaj1Grw2vO0QTZHObN5
njusd0MAprxoDavtLX1D
=DAw9
-----END PGP SIGNATURE-----

--maH1Gajj2nflutpK--
