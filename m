From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2] arm64: tegra: Add GPU node for Tegra 186
Date: Tue, 4 Apr 2017 15:22:16 +0200
Message-ID: <20170404132216.GB843@ulmo.ba.sec>
References: <20170330091831.18322-2-acourbot@nvidia.com>
 <20170330092828.13336-1-acourbot@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="6sX45UoQRIJXqkqR"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170330092828.13336-1-acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--6sX45UoQRIJXqkqR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 30, 2017 at 06:28:28PM +0900, Alexandre Courbot wrote:
> Add the DT node for the GP10B GPU on Tegra 186.
>=20
> Signed-off-by: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>  arch/arm64/boot/dts/nvidia/tegra186.dtsi | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)

Applied to for-4.12/arm64/dt, thanks.

Thierry

--6sX45UoQRIJXqkqR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAljjnggACgkQ3SOs138+
s6HY+Q//QNe/KYydkDCCj8yCHJnJKNysQuFF3glxJN0SS1JR5C4NnsiiwCi/ClMi
v9jZyAoBV3R2Cs6o8OO4vxey5YLrjNYQ+Ho5rOIUhccMhIvmshfg3A2qH01H2NN+
aX8T8NwW0MIcDkmPvXx/9NFJFOqJx64EERXWQdwd5g+xqRTLpsdhCDbL67sdMShY
wX0aGVThJXRwON5nRX0qJpAOQgEq8H+BEByQHqZWb3aTHlCqR97yOSelOqDR3N2Q
2JScLzolHnhmt6EOHpznVWnr8HKJoLZxoXX3zELpiZ0trq3plQVi6ABayNpldi5L
2ja1aDMaNM9G28P7YgvpL74OBZ0J7yg0aSlhjTyVjqzehW5FoEpPmqohtopEd1pG
c3cL/JKNExXjRMyhy5mwzcPQGtXUqhTBG654vyy1X+WKfjIYl6I1TNLmXV+C26nr
ZDKLcxTOzP2TmIgaMcSpIwGmOZdCLNWfIv0RRpFQOr8zEfnOb6s4qdx28lPURu2X
zz7uSyWtD+HTMFYkm2RXNdokeqTXbnzz6UhGxJ3UcKj/kmMA61Wzb0WIOD0WMtz3
vLd+JFvjOnxvlwG0FrCAC5t6h3my3UC3TAKDa19h6K6ZgUvlSaNCY0/jVkDnGmp7
PhtXvFTEM0STzvl5K3R9NPRXgWV4lyz1VwDT62d6J+OjvnO5uig=
=5pOL
-----END PGP SIGNATURE-----

--6sX45UoQRIJXqkqR--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
