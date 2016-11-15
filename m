From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 2/3] dt-bindings: allow child nodes inside the Tegra BPMP
Date: Tue, 15 Nov 2016 16:42:39 +0100
Message-ID: <20161115154239.GB22611@ulmo.ba.sec>
References: <20160719191442.15439-1-swarren@wwwdotorg.org>
 <20160719191442.15439-2-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="1UWUbFP1cBYEclgG"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20160719191442.15439-2-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, MLongnecker-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, sivaramn-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--1UWUbFP1cBYEclgG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 19, 2016 at 01:14:41PM -0600, Stephen Warren wrote:
> From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>=20
> The BPMP implements some services which must be represented by separate
> nodes. For example, it can provide access to certain I2C controllers, and
> the I2C bindings represent each I2C controller as a device tree node.
> Update the binding to describe how the BPMP supports this.
>=20
> Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>  .../bindings/firmware/nvidia,tegra186-bpmp.txt     | 23 ++++++++++++++++=
++++++
>  1 file changed, 23 insertions(+)

Applied, with bpmp-i2c changed to i2c as per Rob's comment.

Thanks,
Thierry

--1UWUbFP1cBYEclgG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAABCAAGBQJYKyzvAAoJEN0jrNd/PrOhXygP/j8CWxl10fYVymc2cgNvBHJL
aoQXF5YUQr27jVO33uJsfwZNkNYB9C79keBuec5GsFRxyxgePcF+FHlCHNr+nMSt
iIoKSbOy5pFeM3Yk0b7XRhWemTmvExVuDLQpAz1K5eOew57yDaTj8nN+4aXcSZ7v
QzgtN9sgERm1F3Zn+Beae8u2IXedtHlX3cPeDcqsGC2yjxkv2nLGeaTK0mf64PKo
NLKJI2FYP14Np0f9V/fzcO6Cz5kwKnvISJ9dpr6WPb4ihUV75q33zlB7b2O+LVNE
RVVQMUrx8TN9pd5NBiPDltMxmvm20t+z+fqBC9ciD75pVYw3XUsX9SWJiT5BfOXw
ACbZ+RVIzz/GXFgoCUMT1W1Ybc4ORNSgGhSjpJDgXLvoSxgQIh7HydtZN4s0mcpZ
ZnPsVjwGON8uX1DTA1qy4jOht+H84fX4xxnpvGf41D/DmldwUR1h80gqGAg5hiXN
xzUc0vYmB6t88fyMXeHXAAJYGOJfu8S0COy493mTm4RPRy5pA8PNIKDTf7y3SlLc
pNi9w9iKn4F59JQFqeJxZoQWxuKYLXXkc/GGaK/ej9dl8n8lxAO4qaN6qqKpXWNy
TLiKuvKGj3WLHteZmv6WuhFigBl40blKT4Ajiw354Cy/Mo1sFDoJUhnGaRllpGum
e8SOUi4ERR+d/hvpbA0O
=+846
-----END PGP SIGNATURE-----

--1UWUbFP1cBYEclgG--
