From: Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>
Subject: Re: [PATCH] i2c: tegra: match return type of
 wait_for_completion_timeout
Date: Sun, 15 Mar 2015 10:17:54 +0100
Message-ID: <20150315091754.GB3393@katana>
References: <1425219461-3261-1-git-send-email-hofrat@osadl.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="bCsyhTFzCvuiizWE"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1425219461-3261-1-git-send-email-hofrat-Q945KHDl0DbYtjvyW6yDsg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Nicholas Mc Guire <hofrat-Q945KHDl0DbYtjvyW6yDsg@public.gmane.org>
Cc: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--bCsyhTFzCvuiizWE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Mar 01, 2015 at 09:17:41AM -0500, Nicholas Mc Guire wrote:
> return type of wait_for_completion_timeout is unsigned long not int. As r=
et
> was only used for wait_for_completion_timeout here it is renamed to time_=
left
> the type changed to unsigned long and references fixed up.
>=20
> Signed-off-by: Nicholas Mc Guire <hofrat-Q945KHDl0DbYtjvyW6yDsg@public.gmane.org>

Applied to for-next, thanks!


--bCsyhTFzCvuiizWE
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJVBU5CAAoJEBQN5MwUoCm2Cv0P/2n6MRyGdsxsCJ75qgF2KLmw
7QnL/YXS6db+qB1f9BG0cSisq4WzPXSgTIioEkQBh5fFcTL/5lvF9MmYdGB5qE6n
T0VeUNgTQFLeUdFnQj+MHDCS4hyjYZItxBf/EJvNOMoFOdxufcy+iXrxCagNlYrD
YhU6Bt/2c7QllM8HzVMK6vssTuYSqICqmVaDtME6d089N5Q4S8nCksFdogXifXuu
iElSMmsKvJtqfyhbF39cFwVvXMpLJ+26ceMZU+1nkhUpdlQ+cISf16BbT3MrfKGg
YyMof6sfZWK2XFJlCh9JpvPcR1pCykakIFbW2//+QEWYIM5oR5zHDrs8eDq0L8gb
HNLKdRvLJQkKie82cJWrDDcx8/0ssh948KhPR+ryASRIz7ds9p0jMbUeeVFNmxBe
rB6uef/qKL+OD/6ckuelwi5BEMQYl01NTeVMv5UBDcV+uZI6RxnUmokd0/ey+usz
QcR9G3LdAbkX7WJPVO8fOdN1cl3vnZTvE+tWezsdOsxSZCtpSGZETRBWyoXMvdi5
Y9ovkAMB6T8LAk94EOR2RHpy8NowSBCk35zBiyYJbDsLfNCiz9swZPcvM/kooq30
XmPEEk/18W07Hfet8V6YaYRWk/uY6/WKOBma40qX+/T+Q7ynQbSZCB0Rqk2MZyAj
YFS3auUeCKRS7XF7fIdM
=LKET
-----END PGP SIGNATURE-----

--bCsyhTFzCvuiizWE--
