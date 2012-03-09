From: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Subject: Re: [U-Boot] [PATCH 1/2] tegra: Implement pre-console putc() for fdt warning
Date: Thu, 8 Mar 2012 22:25:10 -0500
Message-ID: <201203082225.12623.vapier@gentoo.org>
References: <1331261577-21099-1-git-send-email-sjg@chromium.org>
Mime-Version: 1.0
Content-Type: multipart/signed;
  boundary="nextPart1989592.YOi86NNF6Z";
  protocol="application/pgp-signature";
  micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1331261577-21099-1-git-send-email-sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: u-boot-0aAXYlwwYIKGBzrmiIFOJg@public.gmane.org
Cc: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Tom Warren <twarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

--nextPart1989592.YOi86NNF6Z
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

On Thursday 08 March 2012 21:52:56 Simon Glass wrote:
> --- a/arch/arm/cpu/armv7/tegra2/board.c
> +++ b/arch/arm/cpu/armv7/tegra2/board.c
>
> +static u32 uart_reg_addr[] = {

const
-mike

--nextPart1989592.YOi86NNF6Z
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.17 (GNU/Linux)

iQIcBAABAgAGBQJPWXgYAAoJEEFjO5/oN/WBaGwP/idVJFa4+auW3DQCy3iyTjvR
GDK7JE+Ky4YdIroNM5pf4jrnzBmv0gJeL8zIh/rSldG/qQKVrxhVvNNEXJH3CrZ2
NBKWxJZtyEu4/3wI/02Xlthva8yYrqn6A33NfT/TSJBcfHflxANI/AOVJIyxyeLC
mhShLTeRecpPdYd8bBXQGBS626+L03wfmzLrQBoRWZ71vf9jiHpTUcqqCsG3WHUl
czp5qt1QJNXGMyDfSbPysqE+iGzEi0xW59PsSPKGkjJGwGMcumYQoEa1YPxjFKtT
8I86SYElyMyRdANUw59BSDcam2GZ6Du9yWhrYW3Y+O3Z0mPMBTGJciumG3S42K6U
ZCVyiZjypuHtK1koqq0zbZC3JsMBZ75Jul5xqEuv5aRnvcX1KdgS3Y9JG34tULkU
+nxIF1bIdQQNTtl3bFt8S3E2RC/lTsy85JtddiiPwVWF/GbEbPPIGQMRzAvBbAwt
ACZ5xqX7ycuvReQioks2mAZR79rH9YNPd5BZT0q+9XaZDcpN8EEHQbY+eTPC6DBn
Dm6j9/EcV9kFba42BwKmGlmvlGcSMnLRduA4umUk4tVum4FvDsP1M0KJeygTxxgG
pHCAARAPYy5LGpp8Riwb7pSkzV7wld2RfaCqX0fnzA9JVyX5jh8OmvQRq25lF5eO
5SRgqR85OznQSalIePiH
=5NUe
-----END PGP SIGNATURE-----

--nextPart1989592.YOi86NNF6Z--
