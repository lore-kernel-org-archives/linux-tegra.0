From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] ARM: tegra: nyan: Enable GPU node and related supply
Date: Mon, 7 Nov 2016 14:29:45 +0100
Message-ID: <20161107132945.GG12559@ulmo.ba.sec>
References: <20160918141311.17140-1-contact@paulk.fr>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="I3tAPq1Rm2pUxvsp"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20160918141311.17140-1-contact-W9ppeneeCTY@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Paul Kocialkowski <contact-W9ppeneeCTY@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--I3tAPq1Rm2pUxvsp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 18, 2016 at 04:13:11PM +0200, Paul Kocialkowski wrote:
> This enables the GPU node for tegra124 nyan boards, which is required to
> get graphics acceleration with nouveau on these devices.
>=20
> Signed-off-by: Paul Kocialkowski <contact-W9ppeneeCTY@public.gmane.org>
> ---
>  arch/arm/boot/dts/tegra124-nyan.dtsi | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)

Applied, thanks.

Thierry

--I3tAPq1Rm2pUxvsp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAABCAAGBQJYIIHJAAoJEN0jrNd/PrOhNpkP/0QaChaaeSaBeu6YFgI2IS9j
wUEETZ6ZzqQ6xa0q6z5pMDYf/LALYzuDAkjM4rHZsjqxh3khhqtqTvQ2/VIhiN6p
UN3DuACyBN6aqTUYzhJiYFTIZEmI6Q3MHSRveEIEFek1CYCXFC9ll6Cb8Vn5r5kg
UOY0cMfVm/YFYg7H9oD4O6COIHDXIBIBDv4JNPdVK8H9EtsmYeAm6/gxYDDWM4z3
7XIXtc4LH+UiGXBQOxRestT6ybWR/2QlFvat5zwYOhifbOuVe4TesNAk5qcltQLY
sAecLBTAqCMZQ0tIxEy1HpVDXTv1+18PcMm77bALPBqIyu8sS+TOS36vNUfSjZ7v
0+mv1Ij3P7yc+pR8HpIcbOzgY9XdRdUvR77edZDSEDZOSASz6JrlBeaRkZiPIL9Y
ObvIv92mN8VLKXa/Gn7gQagyzoUN6HeVYYfEze4TIziOqQD0f9vNgy69zXCfHBYE
l6kaL+YEhb2MUKBrXUkxtjppDqAjTYFiRVwtvGBrsVysDWrJG2YaXnDimVNhGMmG
ef76+eoNfyOarQl9GJJmlOl51XsZ1d5k2np8EfbOs34Y8OF/b2WuUqqM/7V1xsX+
bgAkVLgq6zY9v1S4rnGlUf4rowLH4SAanGwkoDKgQzaaFFpIfII1+QqiLkylt1LJ
abmK92VrlIfYoDUn4ymR
=1Yta
-----END PGP SIGNATURE-----

--I3tAPq1Rm2pUxvsp--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
