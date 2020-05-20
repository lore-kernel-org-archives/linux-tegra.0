From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [GIT PULL 11/11] arm64: tegra: Device tree changes for v5.8-rc1
Date: Wed, 20 May 2020 15:43:35 +0200
Message-ID: <20200520134335.GA2147362@ulmo>
References: <20200515145311.1580134-1-thierry.reding@gmail.com>
 <20200515145311.1580134-12-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="45Z9DzgjV8m4Oswq"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20200515145311.1580134-12-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, soc-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--45Z9DzgjV8m4Oswq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 15, 2020 at 04:53:11PM +0200, Thierry Reding wrote:
> Hi ARM SoC maintainers,
>=20
> The following changes since commit 8f3d9f354286745c751374f5f1fcafee6b3f31=
36:
>=20
>   Linux 5.7-rc1 (2020-04-12 12:35:55 -0700)
>=20
> are available in the Git repository at:
>=20
>   git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegr=
a-for-5.8-arm64-dt
>=20
> for you to fetch changes up to 74265112c60be0209817c682ba68661c05da1d38:
>=20
>   arm64: tegra: Enable VI I2C on Jetson Nano (2020-05-15 16:28:58 +0200)

Hi Arnd, Olof,

Actually, can you hold off on merging this for a little bit? I'd like to
send out a v2 of this because I noticed that...

> Thanks,
> Thierry
>=20
> ----------------------------------------------------------------
> arm64: tegra: Device tree changes for v5.8-rc1
>=20
> This contains a couple of fixes for minor issues, enables XUDC support
> on Tegra194, and enables EMC frequency scaling and video capture on
> Tegra210.
>=20
> ----------------------------------------------------------------
> Jon Hunter (2):
>       arm64: tegra: Fix ethernet phy-mode for Jetson Xavier
>       arm64: tegra: Allow the PMIC RTC to wakeup Jetson Xavier
>=20
> Joseph Lo (1):
>       arm64: tegra: Add external memory controller node for Tegra210

=2E.. this patch contains some leftover changelog notes that I forgot to
remove.

There's also one fix missing from this that I was meaning to apply for
v5.8 which will enable suspend/resume on Tegra186.

Thanks,
Thierry

--45Z9DzgjV8m4Oswq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl7FNAMACgkQ3SOs138+
s6HMZA/+MDhiKjzKLTBXaFCViGhljWnkYbbcdtQ9879RRMEWQr2nvsaDt0gA5cgK
iPfID6QX2ozJdm3frwXd+fetK9Q7bre/WBR6/mc8YvZ5wywG/AFGbp9u0Wfy5+KG
6yLJHH56oyxZfl+eiKOkjo95ighOEpN5F2u5UCwDJDxMRSnzk5XjVRIJ+rzQUpMh
Og5v7iW8HkIf+QGXOFKfj2gXOA4WQODFj+HEQ0NU84vQ0DQMEtcfuR+/zcd0NN17
qSGwwXqSpOxEcrxo6xL3qmAZR8AQCW/ol1X3tSsFhIkIo/8HMiBcs6Ye+bLdjj6i
G+HBcW8cOPYep8tpWDZEcYYQot1i9GQ+MSu5Bcf/2Lp3YIXlvUEUG/IGUpnrcUr+
LDN9bPl2QbUCcBOomlH+JbwoFWzHbqY3vmn0SxokzSiOISzcEPAA1w3BdrNo/9Q8
p/oPMb5sp/8WaS8VKOrDOSjFAOhT7GIee22DavViP5rOz51GhLdU+QR8JREkYEbU
AJvNeTtq7bHxp1N4np6T19ecteoYi7GQd0PEp8r/v3lq5IifAV78aqrTN5zVSyfM
J01Fbe9QylyVAltrfcjG4inIJKMaI6SvVObP9k98oeAG0/eR47yP1ClkA2tCgzBG
pia81SqLe8vTmEqVjyH042JwIYjZSSpWFO1eWYtH7PaODZnCD1A=
=AGae
-----END PGP SIGNATURE-----

--45Z9DzgjV8m4Oswq--
