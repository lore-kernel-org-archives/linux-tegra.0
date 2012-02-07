From: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Subject: Re: [PATCH V1] regulator: fixed: Support for open-drain gpio
Date: Tue, 7 Feb 2012 11:43:41 +0000
Message-ID: <20120207114341.GJ3332@opensource.wolfsonmicro.com>
References: <1328611596-13279-1-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Re2uCLPLNzqOLVJA"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1328611596-13279-1-git-send-email-ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, grant-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org
Cc: lrg-l0cyMroinI0@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--Re2uCLPLNzqOLVJA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Feb 07, 2012 at 04:16:36PM +0530, Laxman Dewangan wrote:

> To make the pin to high/low for enabling/disabling the switches,
> the pins will have the pull-up connected and the high/low can be
> set using following methods:
> LOW: gpio_direction_output(gpio, 0) ... this drives the signal
> 	and overrides the pullup.
> HIGH: gpio_direction_input(gpio) ... this turns off the output,
> 	so the pullup (or some other device) controls the signal.

Thinking about this further this is potentially going to apply to any
GPIO output - perhaps we should push the implementation down into
gpiolib so we just specify a flag when requesting the GPIO and then
gpiolib does the pull low/high Z thing for us.  That would be much less
effort in individual drivers, we'd just need to be able to set the flag
and could potentially directly use any hardware open drain output
support (some GPIO controllers will do all this in hardware) if the
driver API were extended.  Grant, does that sound reasonable?

--Re2uCLPLNzqOLVJA
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQIcBAEBAgAGBQJPMQ5lAAoJEBus8iNuMP3dhlsP/iDg5BwGat8c0tPgVrtanVCt
672UQPFcdUBl+mkCkmNbWvD3S+yqZOosIxMEzp1/UMKeicsnTD6lrj+b4EenoU5Z
J0lkixRlpEZJWKd2RBo1AcoCyvdhYwICPmH9wJS6z+WPE7T2CqNbcoaRj0+p81sE
zsPlnw+VxgKkCEaWA1wtpyNv05sLFvzfajI1QQbn0MCz9Ap0ZoNcZCDXLbDlrQou
EYNAe2xFNBZFiUSn/pPIomIfUJMO9KjqMTyXYMcOp+oth38nK7y6mbgUStOpcs3e
z4uTqrbey38SnFO4QZaINOcAahwkz6DEIN9PkURAOYWDB0hEIl/REo09moN++5sn
WNKdouDBbW14N5dWjMBCPKou5DHmLjwvy5GZURDL4Yw0y0n7MM6mxHlLP508+NQO
Dnuo9qWtS444z5RXvqvJRxgBVe5MwTlo6mboAEIxg2zn8aYq36DN5eFGAWRINpsT
YfDs5DcoczjSZH5so8pfTq8K7NQaW8vc7YEXJ36OmHGbeOYhiqgcG1nDyiNug1dw
3OQehci3jBCVHwvj37ydUSaATYdhsqMwQxgxdPG9AZDXHCcb0s3FQDwywvB+maQl
3pG26aybSJ1DVmer67ei3X4hS/FbT7vMaE75x2jQzTFRu+PVDe/tRig2hkQPPphJ
TdcsU9T3w/ndrs/yiVqc
=eakE
-----END PGP SIGNATURE-----

--Re2uCLPLNzqOLVJA--
