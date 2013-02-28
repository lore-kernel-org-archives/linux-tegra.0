From: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: Re: [PATCH 1/2] ARM: Tegra: Add clock entry for smp_twd clock
Date: Thu, 28 Feb 2013 21:04:15 +0100
Message-ID: <20130228200415.GA17598@avionic-0098.mockup.avionic-design.de>
References: <1362037381-4730-1-git-send-email-pgaikwad@nvidia.com>
 <512F9F59.5030702@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="45Z9DzgjV8m4Oswq"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <512F9F59.5030702-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Prashant Gaikwad <pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--45Z9DzgjV8m4Oswq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 28, 2013 at 11:18:01AM -0700, Stephen Warren wrote:
> On 02/28/2013 12:43 AM, Prashant Gaikwad wrote:
> > As DT support for clocks and smp_twd is enabled, add clock entry
> > for smp_twd clock to DT.
>=20
> Is this a cleanup for 3.10, or a bug-fix for 3.9? Perhaps it solves the
> "twd: clock not found" bug I reported?

Yes. This is pretty much identical to the patch I sent a few days ago
before your patch that fixed the clock drivers to match the devicetree
binding documentation.

The "clock not found" is exactly what this fixes.

Thierry

--45Z9DzgjV8m4Oswq
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iQIcBAEBAgAGBQJRL7g/AAoJEN0jrNd/PrOhc3cP/11NBfoe6v5+gnm1d0CMmlOd
6lioQ/T6ZonyIPEleTuLtqe1DXsuH/u9NlseOIc4X7Mx5HpA9gqsJmlFI4NKreVZ
obVEVJEXkkmnSvZz6N+EtPrgucO0FbFlUNdSOx03CX9A7mLe61zK9tf+8DWOuhE+
1UaB6DO3zCzrSewoaEc9t6gucRGi61pU1GYaxuIgulNr7YSB9ZngyBce+14kHL6l
miXmxn6XB+buf+tk+AIwiRLBhlOMO4+Uym0BGAI5fqyrgiF9//9KdcsQ0iLf0eya
a9vm0DUo62L/ZJMsc5cQWddQsVZLXqpmEIhtAPVfiDvyXgdJTFtm3uZpQH3ZjXs6
zLVAN8xvQyMvSZLX4QFpBPf0zXhQncylqKxrLUCRTcc7M0LaqPH95U+YuJ7lC3+b
SEb4LzaI10ixnobHPz5iLES4T5bW/TXGAjDZ5Z2d8GwoCyHH7HPEfYZeL8OdWeo/
kovd8TnFuWqCo/vVzsh2ezdu7gMclCNdDs2kKlXBoGDUeg64iF7EeYvsjJPif80O
41NVJsuZanEArFfxJa/ZrBCo/pwfEmcOJNmpojGfOB6ktezh+ou8SNbIb14CUAGm
A/1ua0YaagTFNDhv/rgvf5tsIqrEZl31NZW7ljoYoJKFYUAzdbuUhc/DU2zHIJ7r
mNdcyEanD7rqRA+Cth70
=Sn9Z
-----END PGP SIGNATURE-----

--45Z9DzgjV8m4Oswq--
