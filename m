From: Benson Leung <bleung-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH V2 2/2] mfd: cros ec: spi: Simplify delay handling
 between SPI messages
Date: Sat, 18 Nov 2017 22:17:41 -0800
Message-ID: <20171119061741.GB51565@decatoncale.mtv.corp.google.com>
References: <1510670608-19594-1-git-send-email-jonathanh@nvidia.com>
 <1510670608-19594-2-git-send-email-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="2B/JsCI69OhZNC5r"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1510670608-19594-2-git-send-email-jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Brian Norris <briannorris-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Shawn Nematbakhsh <shawnn-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Benson Leung <bleung-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--2B/JsCI69OhZNC5r
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Jon,

On Tue, Nov 14, 2017 at 02:43:28PM +0000, Jon Hunter wrote:
> The EC SPI driver prevents SPI transfers being to rapidly by keeping
> track of the time the last transfer was issued via the
> 'last_transfer_ns' variable. Previously, if the 'last_transfer_ns'
> variable was zero, this indicated that no previous transfer had been
> sent and that no delay was needed. However, the EC SPI driver has
> been updated to always initialise the 'last_transfer_ns' variable
> during probe and therefore, it is no longer necessary to test if it
> is zero. Remove the code that checks if this variable is zero.
>=20
> Signed-off-by: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> Reviewed-by: Brian Norris <briannorris-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>

Acked-by: Benson Leung <bleung-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>

--=20
Benson Leung
Staff Software Engineer
Chrome OS Kernel
Google Inc.
bleung-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org
Chromium OS Project
bleung-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org

--2B/JsCI69OhZNC5r
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBCgAGBQJaESIFAAoJEB8J9XsKL+ZYU9sP/iNvH+wFBVOyQxrrlNxS4Lo5
O/C3jQuKsBxQCsbLvozvKJrW6+YjWlDT1Iur7eZ+wOB1plGCJpviOkvCJOLx3bsm
jlOICN/+O8MFMxv4p0BQRyHHWqiLC35Cz0WU09PB4Im2Uw7ZLmAthGD0PZnrDjNV
kcBJqCVRShrw1VKRHMhABEep0ZhNR1iOPkJnBummGCAI65OQy3XFy19RBNCTL8F2
SDgtLTVhtW9HlAzBc4NrqLb4Q+pElE0WNN5NMClL+PsGBHq1cVXwLY+90NvPIZl0
gysLhi5+Js2EAmDuSaEuP5CrPqNZc8FH/rMOWbTRRnw6Hs9vvXDh71+FkpTpMJQL
tuKG1rDm9BECVsDWJPKCmASw9eQvj9W3A0XCL3KklGSQmjVBYLRZSGfHhKA50iLg
8A147dHIBW3chKv/XGHuIniqD8GKm6ufQLXL+OBQGQdcOk2MV1R4qqsqcMg2BRP2
RsbJuY4nhXXZh1SZw/Ma7Oz3UBgR1dFlWwiLrK5TljVZAUSCMo6kbUCc2BqcXlTz
i7ZpyD91/goKRxAZyoKfVtCmnqiIJ27ttr9lXOnnfeKlNNxPyAIbRtNG4N3T6pT1
L/LuoSLKWpS2C2o04t6L65lE6rZW2F97A69I0T6i8mQS9xQxHsiuM1sPeMXCwPTs
vRWiCFjQc69Vlcy2IZhR
=sD9Z
-----END PGP SIGNATURE-----

--2B/JsCI69OhZNC5r--
