From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH] drm/tegra: Fix regulator_get_optional() misuse
Date: Tue, 5 Nov 2019 14:15:11 +0100
Message-ID: <20191105131511.GA1609273@ulmo>
References: <20191105125943.34729-1-broonie@kernel.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1322003151=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20191105125943.34729-1-broonie@kernel.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Mark Brown <broonie@kernel.org>
Cc: David Airlie <airlied@linux.ie>, linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org, Jonathan Hunter <jonathanh@nvidia.com>
List-Id: linux-tegra@vger.kernel.org


--===============1322003151==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="3MwIy2ne0vdjdPXF"
Content-Disposition: inline


--3MwIy2ne0vdjdPXF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 05, 2019 at 12:59:42PM +0000, Mark Brown wrote:
> The tegra driver requests a supply using regulator_get_optional()
> but both the name of the supply and the usage pattern suggest that it is
> being used for the main power for the device and is not at all optional
> for the device for function, there is no meaningful handling for absent
> supplies.  Such regulators should use the vanilla regulator_get()
> interface, it will ensure that even if a supply is not described in the
> system integration one will be provided in software.
>=20
> Signed-off-by: Mark Brown <broonie@kernel.org>
> ---
>  drivers/gpu/drm/tegra/dpaux.c | 32 ++++++++++++--------------------
>  1 file changed, 12 insertions(+), 20 deletions(-)

It is in fact optional in this case. This code remains solely for
backwards compatibility with old DTBs because back at the time the VDD
supply was associated with the DPAUX block where it should've really
been associated with the eDP panel.

See also this commit for some background:

commit f3b0d8793c1619074d0ece2e1a7f64ea37eaf394
Author: Thierry Reding <treding@nvidia.com>
Date:   Wed Jun 5 10:48:01 2019 +0200

    drm/tegra: dpaux: Make VDD supply optional

    The VDD supply is only needed to supply power to eDP panels connected to
    DPAUX. Technically that supply should be dealt with in the panel driver,
    but for backwards-compatibility we need to keep this around anyway.

    Also as a bit of background: the reason for why this supply is attached
    to DPAUX is to make sure the panel is properly powered early on so that
    it can generate a hotplug pulse at the appropriate time. This may no
    longer be required given the support for deferred fbdev setup that was
    "recently" introduced in DRM/KMS.

    Signed-off-by: Thierry Reding <treding@nvidia.com>

Thierry

--3MwIy2ne0vdjdPXF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl3BddwACgkQ3SOs138+
s6FUYw/6A4qTc2lnGKnnGBghLO1g8imKr3xO4NSPlJV6WU6BoIR0dwzNa4ES3K/o
NYIN2ouYz+h0eQ9M4rzo2jXX9I1f1pRwsDWH4e9slUPRFrf8ZqhzKTnBLmJ1WGo+
87xooPAZTQsXkcu/B5xr4N0mU5pkHOLZ2/IRCw8HwH6ifLc5N1Um6ULd6a9Sr5Tk
4n2gahFIPpXpm6IByzs5fAc4aZMBb1SNibjx0Ja5gXLlcy4JmbJv1shFO+6JC4zo
YpY9UaPsM7LjoEyfG7DfgZ8grk3nK/FRh9+foMp5HcYPa/vASHfzcjwUZ8oIC3Q9
OyhtI7L/Yiz2uaAzIIJRtHvltRWeiHX546GszfrHD54GuxNCu5JI3tjXGvCTwKyq
SmCBMrllB1+Yt8d4XKCgwvCTlg29zL6hhIQdQGasMubNQUciBtsTObBMrFK+DHSl
q8AKZIB4MjtCyKjL5JbBpcsRj7Z4gvxiSrvqCrVR/x/OqAa/dbqeTsZMMrMRn3IX
suTkJSC2i5fpnNE+n0JfDiLPwx5W9mPlWKB779JGBXcMH2UP9Me5Q6cm7yKLIXSz
2slwXf+7SeTFdPFXDWypSAnoWAi6SUqqeovh1wbJRZN7S/ZdJ04EyQurH2mu4f68
VcXcvBAeBC32PHPGIXyhHd+l1GM8PAMvQ7nJ2u3HuR7s1VFtuGc=
=qSyt
-----END PGP SIGNATURE-----

--3MwIy2ne0vdjdPXF--

--===============1322003151==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1322003151==--
