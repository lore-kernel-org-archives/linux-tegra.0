From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 3/3] dt-bindings: add Tegra186 BPMP I2C binding
Date: Tue, 15 Nov 2016 16:46:07 +0100
Message-ID: <20161115154607.GC22611@ulmo.ba.sec>
References: <20160719191442.15439-1-swarren@wwwdotorg.org>
 <20160719191442.15439-3-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="NU0Ex4SbNnrxsi6C"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20160719191442.15439-3-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, MLongnecker-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, sivaramn-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--NU0Ex4SbNnrxsi6C
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 19, 2016 at 01:14:42PM -0600, Stephen Warren wrote:
> From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>=20
> In Tegra186, the BPMP (Boot and Power Management Processor) owns certain
> HW devices, such as the I2C controller for the power management I2C bus.
> Software running on other CPUs must perform IPC to the BPMP in order to
> execute transactions on that I2C bus. This binding describes an I2C bus
> that is accessed in such a fashion.
>=20
> Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>  .../bindings/i2c/nvidia,tegra186-bpmp-i2c.txt      | 42 ++++++++++++++++=
++++++
>  1 file changed, 42 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/i2c/nvidia,tegra186=
-bpmp-i2c.txt

I ended up cherry-picking this commit from U-Boot, which already had
both of the comments addressed that were discussed here. I also took the
liberty of adding Jon's Acked-by from this thread since it's effectively
the same commit.

Thanks,
Thierry

--NU0Ex4SbNnrxsi6C
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAABCAAGBQJYKy2/AAoJEN0jrNd/PrOhRpwQAKTEh5SXxktFKiIFhLrswjwi
rzNJBWPtlxf1NpZRkUclHT6DbseM68YyX2JSPTkd0zyK6qO9NwfF7uB6/GGVIK3A
ZRAiXfqIkn8degNxaDBm4OoG6fta5TE0VcjY5t7W7tKjVsvABtphpxcg633dOet4
MxCANrSMllpB+LV6w2rwCWJB23ProiiE9LGK3+bIbRgJKn1Ec52fosIX3llpYvtI
GFAXqeHL/iUpq6sUBIR6iO/c32BOSqVafSeVQYP6MDfgd/A2/Bw1cUwOmCFgGdx0
NitHUfTMUCTjVvMl1T3dodcxdIHh/LA8FxDSDg9V+tjUX/k1LkHZiuJEpi1nbw37
Qh6ZX0WpmgxlYQte4i1J7xDyx3avZuqYIoZK2lM86vd04STyrqOWYieKe/j60rHl
Ya7nRJhqvHixVJYp0VU5qIklwJApX8H/EZHG3j/NCPqTrb9d0geXjL7Obsa5ujBW
MgWtrn4TFTW9IuWy7kVQ9EV1+N62YG0FVVMZhdW2c26RJMQ5NNDe/rE6qb/xNYOm
vs3BNwrKkUPxIWJSoTzP19R0LiKgsXmuXXY0l+7Cnnud3sQ1rk5/2yJY0N5qYDxC
BklzwSkvfpd3vRloEa4NFF1L5QvRaIRMQQQinqA4NdFn8fmmAQ0CHqieT7ZFXTmw
FyHzEZVkQqSf5+snj65z
=bE4o
-----END PGP SIGNATURE-----

--NU0Ex4SbNnrxsi6C--
