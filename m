From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v6 8/8] ARM: tegra: Add Tegra124 ACTMON support
Date: Tue, 24 Mar 2015 11:32:19 +0100
Message-ID: <20150324103218.GE18115@ulmo.nvidia.com>
References: <1426584991-11110-1-git-send-email-tomeu.vizoso@collabora.com>
 <1426584991-11110-9-git-send-email-tomeu.vizoso@collabora.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="jKBxcB1XkHIR0Eqt"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1426584991-11110-9-git-send-email-tomeu.vizoso-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Tomeu Vizoso <tomeu.vizoso-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Mikko Perttunen <mikko.perttunen-/1wQRMveznE@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--jKBxcB1XkHIR0Eqt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 17, 2015 at 10:36:18AM +0100, Tomeu Vizoso wrote:
> Add device node for the ACTMON block to the Tegra124 device tree.
>=20
> Signed-off-by: Tomeu Vizoso <tomeu.vizoso-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
> Reviewed-by: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>=20
> ---
>=20
> v6:	* Remove operating-points property
>=20
> v2:	* Add operating-points property
> ---
>  arch/arm/boot/dts/tegra124.dtsi | 11 +++++++++++
>  1 file changed, 11 insertions(+)

Applied, thanks.

Thierry

--jKBxcB1XkHIR0Eqt
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJVET0yAAoJEN0jrNd/PrOhLYcP/0ny/HqIFX127rQh3w0BPEgL
8+TpX9Td9cOcIc5lhrs+mSFAQXruYr4YZi3buVh1JUGIv3WmKXhT6a5aJffFt9X3
N9BU1XKPTpj66SmjKJifHtx4+t+6nGFHxRqeWr5IBQLy0KSq92ROMdMOGxheFObt
tIgMIZE5m4Jo1g4fRoJ8s7R62RQ+igf4WTIsiNbrz2eF3I3t41erroWGam4sPPF0
YYi+RKhqrWDVqZfHbtY/y8++4Km5vI77s8xmhNAXYHr0RvC2oP5ki04aCWtfZZvF
JxBoB1lQYwlOzVQbcgceo7+UEtY6Qv8+EPAE0vy/G9a7t6UlxxTQwq3v76sN5s5u
PPB8dV0dGybVj4g5fNvRWpNOMUlDUA6XuEv0yisnzKBb1U6mdIJ7Wxrx1p1YGKQh
ST5S89w9Ok+le6WB8W0jbndeSRO/KN7Ghey60ze8FJqdG1+wM3myHiHDW5DDaxvL
WrfoSQshR0C7tvQnOZU0Nvi1geWibpjNSW7TsHXdTTk0L67YcDCyk6XQ79h60zVC
rnLZCRYgFxjkbUk3picBq+mfi1ksyoZiCZ1u1T4338mM73QXCyBgq+HIjYOhxyRr
kHWR34Z6PX3OCNyRzpfOJ3lTXj2Eh4FKEjynPEetG7BqN75iDcc7mTLJX3+FO7IF
7176s+OmaCDOs++fdd0C
=amsA
-----END PGP SIGNATURE-----

--jKBxcB1XkHIR0Eqt--
