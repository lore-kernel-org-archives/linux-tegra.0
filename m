From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCHv4 1/4] dt-bindings: document the tegra CEC bindings
Date: Thu, 19 Oct 2017 11:22:19 +0200
Message-ID: <20171019092219.GD9005@ulmo>
References: <20170911122952.33980-1-hverkuil@xs4all.nl>
 <20170911122952.33980-2-hverkuil@xs4all.nl>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="J5MfuwkIyy7RmF4Q"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170911122952.33980-2-hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Hans Verkuil <hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org>
Cc: linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Hans Verkuil <hans.verkuil-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--J5MfuwkIyy7RmF4Q
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 11, 2017 at 02:29:49PM +0200, Hans Verkuil wrote:
> From: Hans Verkuil <hans.verkuil-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>
>=20
> This documents the binding for the Tegra CEC module.
>=20
> Signed-off-by: Hans Verkuil <hans.verkuil-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>
> Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> ---
>  .../devicetree/bindings/media/tegra-cec.txt        | 27 ++++++++++++++++=
++++++
>  1 file changed, 27 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/tegra-cec.txt
>=20
> diff --git a/Documentation/devicetree/bindings/media/tegra-cec.txt b/Docu=
mentation/devicetree/bindings/media/tegra-cec.txt
> new file mode 100644
> index 000000000000..c503f06f3b84
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/tegra-cec.txt
> @@ -0,0 +1,27 @@
> +* Tegra HDMI CEC hardware
> +
> +The HDMI CEC module is present in Tegra SoCs and its purpose is to
> +handle communication between HDMI connected devices over the CEC bus.
> +
> +Required properties:
> +  - compatible : value should be one of the following:
> +	"nvidia,tegra114-cec"
> +	"nvidia,tegra124-cec"
> +	"nvidia,tegra210-cec"
> +  - reg : Physical base address of the IP registers and length of memory
> +	  mapped region.
> +  - interrupts : HDMI CEC interrupt number to the CPU.
> +  - clocks : from common clock binding: handle to HDMI CEC clock.
> +  - clock-names : from common clock binding: must contain "cec",
> +		  corresponding to the entry in the clocks property.
> +  - hdmi-phandle : phandle to the HDMI controller, see also cec.txt.

I don't understand the need for the -phandle suffix. I would've probably
just gone with "hdmi", or "hdmi-controller". But I see that this is
already pretty standardized, so...

Acked-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

--J5MfuwkIyy7RmF4Q
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlnobssACgkQ3SOs138+
s6G7ug/8CcguPaMyiFjoMwMuWfF0Q9r/QS3QzsuAKftj7MnryvGk43oaVP7FgSb9
XBkRj5msH+eg10k0OAOusBdH/1dX81nqkoo+qE/o/GGD9MjIVhKE2QvxCS+lVyHN
VLly9NXcxXZTcOpaFpJU+xnydi9PXKyWyw+LCBS28UAc+lVuVy6BEYNApasrrNtf
GdefRPaX/AiavTqgzo5YOjpnXb+sge4H5LPQ8n8iUkFXb84DquYjzk2IEbHnPqWu
bXxqxuhQxDW3luE0GeETZsmP5Vh8xhdrN5GL/KEfiftSsbcxz4e45AVSILtCUnyD
k7YMB2rmZyculzpIElXI07gMT+YBRUxU7D65HC8egeiiWOFVn6GWIybFGHhj7jej
r5k3upv4bNq+LgXQZtWCqycpdDNKaOaIgoIqGL6wOqaoJ1XPUO9rEJFN0h60whYy
5LXZ7SaUnGWvhLTIPoEOreyO7flWS90ZtNRhy5h5iRIjarr4Q3XlD/H1lh3Hwmpv
JpXWsYyhb1+5sJJXaLoMavzAotpeyOBJYnQnHy/Z/33XOR4ALNb2cQeBzEJeXhLf
inKmwiWNGo4TOj/M1gIZWKiOdV+y7SJxr2F6QhB17Zcvl6Q4Qy8/M/fh/XSxtMNm
9tnHjHhF8TCp2Gc1hL3mIfD91NxnOwqGEb1SyxicPWDtf1Zgw1o=
=6R5L
-----END PGP SIGNATURE-----

--J5MfuwkIyy7RmF4Q--
