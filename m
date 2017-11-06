From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: next/master boot: 273 boots: 63 failed, 209 passed with 1
 untried/unknown (next-20171106)
Date: Mon, 6 Nov 2017 19:17:13 +0000
Message-ID: <20171106191713.d7jqg2b6zqchythw@sirena.co.uk>
References: <5a0055f1.85a8500a.98d54.a4e4@mx.google.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="6pbgeicjjktnrrrs"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <5a0055f1.85a8500a.98d54.a4e4-ATjtLOhZ0NVl57MIdRCFDg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "kernelci.org bot" <bot-ssFOTAMYnuFg9hUCZPvPmw@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: kernel-build-reports-cunTk1MwBs8s++Sfvej+rw@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--6pbgeicjjktnrrrs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 06, 2017 at 04:30:41AM -0800, kernelci.org bot wrote:

> Full Boot Summary:
https://kernelci.org/boot/all/job/next/branch/master/kernel/next-20171106/
> Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/=
next-20171106/

Since Friday -next has been failing to boot tegra124-nyan-big in
kernelci with all configs:

> arm:

>     multi_v7_defconfig:
>         tegra124-nyan-big:
>             lab-collabora: failing since 2 days (last pass: next-20171102=
 - first fail: next-20171103)

It's fine in mainline, see:=20

    https://kernelci.org/boot/id/5a0030c959b514aad21cdd1a/

for boot log, history and comparisons with other trees.  Looks like
output started grinding to a halt at the point where it starts
requesting firmware but ICBW.

--6pbgeicjjktnrrrs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAloAtTkACgkQJNaLcl1U
h9AJJAf/Xl/mxiMj1nmYLq5FWEGHVpFNJD4+xpOCdpji9TAspiLYTWKU7kOtQFS5
6JInlk0tozObiZaMrzzxplIK4vhhyVMJqV4zgW4pkxZ9EKDvyYCoDmrRT+xUJFSV
vr2kxxc9cKEFguANCOLqQpUeRhiB0qBkGxsIOdBTOuxpmY6NNsAOu+tf8a4uPfCY
WWGgRHh5ZZLWK6aJSu0KOrwXkODDS3EMftBcB4HUuSmD7n1InkeFb3iDILJq047R
mPZasIHGz379ljLCeik7AMhXKAJho2w30Uy4O/DyFRWQ4eE8aGdTKdfS0abVXxEB
yaSQqvkSrMdsrYDL4YfpxUS7s+cnHA==
=35nt
-----END PGP SIGNATURE-----

--6pbgeicjjktnrrrs--
