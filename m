From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 1/2] dt-bindings: Add Tegra186 BPMP I2C binding
Date: Mon, 30 Jan 2017 07:47:34 +0100
Message-ID: <20170130064734.GA3585@ulmo.ba.sec>
References: <20170127083939.20393-1-thierry.reding@gmail.com>
 <20170127083939.20393-2-thierry.reding@gmail.com>
 <20170127221857.GA15715@mithrandir.ba.sec>
 <CAL_Jsq+Sr=dOw7_9UAL4jO0zXycT7sHoCvUM4C2-9LBgdx=25g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="tKW2IUtsqtDRztdT"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAL_Jsq+Sr=dOw7_9UAL4jO0zXycT7sHoCvUM4C2-9LBgdx=25g-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--tKW2IUtsqtDRztdT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 27, 2017 at 04:52:37PM -0600, Rob Herring wrote:
> On Fri, Jan 27, 2017 at 4:19 PM, Thierry Reding
> <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> > On Fri, Jan 27, 2017 at 09:39:38AM +0100, Thierry Reding wrote:
> >> From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> >>
> >> In Tegra186, the BPMP (Boot and Power Management Processor) owns certa=
in
> >> HW devices, such as the I2C controller for the power management I2C bu=
s.
> >> Software running on other CPUs must perform IPC to the BPMP in order to
> >> execute transactions on that I2C bus. This binding describes an I2C bus
> >> that is accessed in such a fashion.
> >>
> >> Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> >> Reviewed-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> >> Signed-off-by: Tom Warren <twarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> >> Acked-by: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> >> Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> >> ---
> >>  .../bindings/i2c/nvidia,tegra186-bpmp-i2c.txt      | 42 +++++++++++++=
+++++++++
> >>  1 file changed, 42 insertions(+)
> >>  create mode 100644 Documentation/devicetree/bindings/i2c/nvidia,tegra=
186-bpmp-i2c.txt
> >
> > Rob, sorry for not Cc'ing you earlier on this, but I had thought this
> > binding had already been reviewed and acked since it is merged in
> > U-Boot.
>=20
> Ha! Good one. :(

So I went looking for earlier discussion on this patch because I
distinctly remembered you being part of it, and found this:

	https://patchwork.ozlabs.org/patch/650385/

You already gave an Acked-by, but I failed to pick it up for some
reason. Given what you said below I'm going to assume that it still
applies.

Wolfram, do you want me to resend with Rob's Acked-by from back in
July or do you want to add it yourself when applying?

Thanks,
Thierry

> > Wolfram was concerned in particular about the nvidia,bpmp-bus-id
> > property below.
> >
> > Can you give this a quick look, please?
> >
> > Thanks,
> > Thierry
> >
> >> diff --git a/Documentation/devicetree/bindings/i2c/nvidia,tegra186-bpm=
p-i2c.txt b/Documentation/devicetree/bindings/i2c/nvidia,tegra186-bpmp-i2c.=
txt
> >> new file mode 100644
> >> index 000000000000..ab240e10debc
> >> --- /dev/null
> >> +++ b/Documentation/devicetree/bindings/i2c/nvidia,tegra186-bpmp-i2c.t=
xt
> >> @@ -0,0 +1,42 @@
> >> +NVIDIA Tegra186 BPMP I2C controller
> >> +
> >> +In Tegra186, the BPMP (Boot and Power Management Processor) owns cert=
ain HW
> >> +devices, such as the I2C controller for the power management I2C bus.=
 Software
> >> +running on other CPUs must perform IPC to the BPMP in order to execute
> >> +transactions on that I2C bus. This binding describes an I2C bus that =
is
> >> +accessed in such a fashion.
> >> +
> >> +The BPMP I2C node must be located directly inside the main BPMP node.=
 See
> >> +../firmware/nvidia,tegra186-bpmp.txt for details of the BPMP binding.
> >> +
> >> +This node represents an I2C controller. See ../i2c/i2c.txt for detail=
s of the
> >> +core I2C binding.
> >> +
> >> +Required properties:
> >> +- compatible:
> >> +    Array of strings.
> >> +    One of:
> >> +    - "nvidia,tegra186-bpmp-i2c".
> >> +- #address-cells: Address cells for I2C device address.
> >> +    Single-cell integer.
> >> +    Must be <1>.
> >> +- #size-cells:
> >> +    Single-cell integer.
> >> +    Must be <0>.
> >> +- nvidia,bpmp-bus-id:
> >> +    Single-cell integer.
> >> +    Indicates the I2C bus number this DT node represent, as defined b=
y the
> >> +    BPMP firmware.
>=20
> This seems okay to me given it's a pretty specific use and dictated by
> the firmware. If there were multiple, then perhaps we should use reg,
> but that may collide with other BPMP child nodes.
>=20
> Rob
> --
> To unsubscribe from this list: send the line "unsubscribe linux-tegra" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

--tKW2IUtsqtDRztdT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAliO4YQACgkQ3SOs138+
s6FvwQ//dhz6z4U3B59b8rwHbBCn2Xqt2AgFXMHVWGWMsbpytdPtpirysw2dEoYM
s6ODK5X2PM+iDsfU2n6RqPAuk3jBnJLnkh1y7iNRjk6ar3TOYwChSkWu8Qgz5O8H
z8VjXjyS9HiNZlznZaT/4iThYtPf65p3qt+ofc/+Mi+A31oXAq7t7nET0M27tFTu
qWcDzunG1FJvgk20ny1b3L9t1a4ZF/lhAWA1EKM9JmfRFvUOfuxAgH15APiCEcZy
n0MLwt24NY5bST2kEKHLZyUEI9WKX3TI/C/GdG3VVmoFmIrgcmJQAcE+5W8pGlcy
ce0ODKGeUhGih4Qpgw2w+TPHimhOJ9LjwbVq1/8YIVlYMJ24MlE4JcX1crAh9nwY
nGj2JM+z7cR8Gh5ZZdqBOe8HgLfXxOF5W4H8Yc7H/FVMWj/WDToqG4wdKNchCauD
TabhfISVGpc45n/fbF2OXkoJy2CME/yRobN95APUyBAyR+zLAP8A39ouf7A4daXd
gNXXPbud8ULm9gMYy3Eni+ohVS7luHDrtj0GnG6+ctCCAqSlmsyiuKAuVs0gt9D5
3A9+3GZtgbH/ZFj+s5kV6BunFMH08drML8CpYoQkD7YWNf+74ZOTFhH+27NQ0SJk
hz3eF+8ePFKtn58m5loS9bNu0eO2JOOk8Bo0wo5MJEegy1EsRQ0=
=yQHP
-----END PGP SIGNATURE-----

--tKW2IUtsqtDRztdT--
