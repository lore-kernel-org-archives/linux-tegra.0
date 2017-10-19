From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] arm64: defconfig: Enable Tegra PCI controller
Date: Thu, 19 Oct 2017 10:25:03 +0200
Message-ID: <20171019082503.GA9005@ulmo>
References: <20171018144620.4699-1-tuomas.tynkkynen@iki.fi>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="cWoXeonUoKmBZSoM"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20171018144620.4699-1-tuomas.tynkkynen-X3B1VOXEql0@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Tuomas Tynkkynen <tuomas.tynkkynen-X3B1VOXEql0@public.gmane.org>
Cc: Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--cWoXeonUoKmBZSoM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 18, 2017 at 05:46:20PM +0300, Tuomas Tynkkynen wrote:
> The driver has supported the 64-bit Tegra210 for a while now, so enable
> it in the defconfig.
>=20
> Signed-off-by: Tuomas Tynkkynen <tuomas.tynkkynen-X3B1VOXEql0@public.gmane.org>
> ---
> I didn't personally test this but got a report from our distro users
> that it works.
>=20
>  arch/arm64/configs/defconfig | 1 +
>  1 file changed, 1 insertion(+)

Applied, thanks.

Thierry

--cWoXeonUoKmBZSoM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlnoYV8ACgkQ3SOs138+
s6GXUxAAgF4ulqLSQCjrrBxHLiMRkgd/Rhf08etu48xUyvITLhKxXr79Z6SDuB/7
LQv56q9TOZd3nwvWIIkc8Fr+wHSJ//FeCv0916S5uRJIRblbYqHAXIcvdjPT/xHT
ixmx05dIHRGKRx3hEjMCWP8akThKfUmo3Xze8PXyk2C3ndPB8tInj3H4096H5pfN
vb+b2yE5khHi70LUS35bHEA9kudm2zMvH7TMgWDakH2N/009LupPo6505rzdOyY1
D2bBmBKfc7842/72HaTfpB/jHNPV9NLE/evw8O/PXbB6BhvJtle47WuuSvDbi7yT
vYHkuB3jg8xiicM7KbnPIzV/s04LLRsHFqG3bhqMkjOn/0KjmzvSoBDki8ZO+cbs
UbA6gjht6ZNwsSjs8m2+TWZiWcFmcIvEEBbX0fu2VwP5Y1HZiw1cfdJo03r/6WeH
bDTGQA0L5rShIV2YUIv20O9Z4mItEoqsttPfWpsvDt/Nc/Gr/u8AKeW0+7RGSrzq
zLumOdfYaE3RScD60FXbuq3vYB9EAVKmJ2GetKz65BnIzB+GEvV0R8IZrH98ZuTO
ysUexMOgTXqgcMzjdpb3ono259qI5gSR/WgK8BNh5fnl/0lT/S/4YfJOBcj3L2P0
Cjl3z9yvmjH+FG2LDVDsD/x7KFNUzX1KUuJThu10N16qrKsiMrA=
=QfEg
-----END PGP SIGNATURE-----

--cWoXeonUoKmBZSoM--
