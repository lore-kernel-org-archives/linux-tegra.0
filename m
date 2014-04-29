From: Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>
Subject: Re: [PATCH v2 6/7] i2c: ChromeOS EC tunnel driver
Date: Tue, 29 Apr 2014 14:33:28 +0200
Message-ID: <20140429123328.GB3640@katana>
References: <1398185154-19404-1-git-send-email-dianders@chromium.org>
 <1398185154-19404-7-git-send-email-dianders@chromium.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="tsOsTdHNUZQcU9Ye"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1398185154-19404-7-git-send-email-dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, dgreid-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org, sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Vincent Palatin <vpalatin-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, rdunlap-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org, sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, jdelvare-l3A5Bk7waGM@public.gmane.org, shane.huang-5C7GfCeVMHo@public.gmane.org, maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, laurent.pinchart+renesas-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org, u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, bjorn.andersson-/MT0OVThwyLZJqsBc5GL+g@public.gmane.org, kevin.strasser-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, linux-ci5G2KO2hbZ+pU9mqzGVBQ@public.gmane.org, andrew-g2DYL2Zd6BY@public.gmane.org, andriy.shevchenko-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, schwidefsky-tA70FqPdS9bQT0dZR+AlfA@public.gmane.org, matt.porter-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, ch.naveen-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--tsOsTdHNUZQcU9Ye
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

just a basic review to keep things rolling...

> On the original Samsung ARM Chromebook these devices were on an I2C
> bus that was shared between the AP and the EC and arbitrated using
> some extranal GPIOs (see i2c-arb-gpio-challenge).
>=20
> The original arbitration scheme worked well enough but had some
> downsides:
> * It was nonstandard (not using standard I2C multimaster)
> * It only worked if the EC-AP communication was I2C
> * It was relatively hard to debug problems (hard to tell if i2c issues
>   were caused by the EC, the AP, or some device on the bus).
>=20
> On the HP Chromebook 11 the design was changed to:

This paragraph would be a nice update for the gpio-arbitration docs.

> diff --git a/Documentation/devicetree/bindings/i2c/i2c-cros-ec-tunnel.txt=
 b/Documentation/devicetree/bindings/i2c/i2c-cros-ec-tunnel.txt

The bindings should independently be sent to the devicetree list.

> new file mode 100644
> index 0000000..898f030
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/i2c/i2c-cros-ec-tunnel.txt
> @@ -0,0 +1,39 @@
> +I2C bus that tunnels through the ChromeOS EC (cros-ec)
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
> +On some ChromeOS board designs we've got a connection to the EC (embedded
> +controller) but no direct connection to some devices on the other side of
> +the EC (like a battery and PMIC).  To get access to those devices we need
> +to tunnel our i2c commands through the EC.
> +
> +The node for this device should be under a cros-ec node like google,cros=
-ec-spi
> +or google,cros-ec-i2c.
> +
> +
> +Required properties:
> +- compatible: google,cros-ec-i2c-tunnel
> +- google,remote-bus: The EC bus we'd like to talk to.
> +
> +Optional child nodes:
> +- One node per I2C device connected to the tunnelled I2C bus.
> +
> +
> +Example:
> +	cros-ec@0 {
> +		compatible =3D "google,cros-ec-spi";
> +
> +		...
> +
> +		i2c-tunnel {
> +			compatible =3D "google,cros-ec-i2c-tunnel";
> +			#address-cells =3D <1>;
> +			#size-cells =3D <0>;
> +
> +			google,remote-bus =3D <0>;
> +
> +			battery: sbs-battery@b {
> +				compatible =3D "sbs,sbs-battery";
> +				reg =3D <0xb>;
> +				sbs,poll-retry-count =3D <1>;
> +			};
> +		};
> +	}

Can the tunnel have n busses? How to represent them then? I think the
remote-bus property should go in favor of proper sub-nodes? Wouldn't it
also be more generic to have the tunnel node seperate and reference the
tunnel-mechanism (spi here) as a phandle?

> +/**
> + * ec_i2c_construct_message - construct a message to go to the EC
> + *
> + * This function effectively stuffs the standard i2c_msg format of Linux=
 into
> + * a format that the EC understands.
> + *
> + * @buf: The buffer to fill.  Can pass NULL to count how many bytes the =
message
> + *       would be.

I wonder about this NULL thing. That means the size is calculated twice.
Why not make two functions instead, one fir size calc, one for setting
up?

> +/**
> + * ec_i2c_parse_response - Parse a response from the EC
> + *
> + * We'll take the EC's response and copy it back into msgs.
> + *
> + * @buf: The buffer to parse.  Can pass NULL to count how many bytes we =
expect
> + *	 the response to be. Otherwise we assume that the right number of
> + *	 bytes are available.

Ditto.

> +	result =3D bus->ec->command_sendrecv(bus->ec, EC_CMD_I2C_PASSTHRU,
> +					   request, request_len,
> +					   response, response_len);

This function pointer should be checked against NULL in probe, I
think.

> +static int ec_i2c_probe(struct platform_device *pdev)
> +{
> +	struct device_node *np =3D pdev->dev.of_node;
> +	struct cros_ec_device *ec =3D dev_get_drvdata(pdev->dev.parent);
> +	struct device *dev =3D &pdev->dev;
> +	struct ec_i2c_device *bus =3D NULL;
> +	u32 remote_bus;
> +	int err;
> +
> +	dev_dbg(dev, "Probing\n");

Drop. Device core has it already.

> +
> +	if (!np) {
> +		dev_err(dev, "no device node\n");
> +		return -ENOENT;
> +	}

Can this happen?

> +
> +	bus =3D devm_kzalloc(dev, sizeof(*bus), GFP_KERNEL);
> +	if (bus =3D=3D NULL) {
> +		dev_err(dev, "cannot allocate bus device\n");

No need for error strings when allocating.

> +		return -ENOMEM;
> +	}
> +
> +	dev_dbg(dev, "ChromeOS EC I2C tunnel adapter\n");

Drop. Device core debug has it, too.

> +
> +	return err;
> +}
> +
> +static int ec_i2c_remove(struct platform_device *dev)
> +{
> +	struct ec_i2c_device *bus =3D platform_get_drvdata(dev);
> +
> +	platform_set_drvdata(dev, NULL);

Not needed.

> +
> +	i2c_del_adapter(&bus->adap);
> +
> +	return 0;
> +}
> +

Regards,

   Wolfram


--tsOsTdHNUZQcU9Ye
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.15 (GNU/Linux)

iQIcBAEBAgAGBQJTX5wXAAoJEBQN5MwUoCm2RfsP/R9ah2QOChdnLktr/oRSSeSa
Gi0EZcMddutgVONwu57pR6O7LUIBS5B/7WscOgB6G+d8kmd1G+Fm6xDfMd0inP7x
rVbiZ/m21q0keYwSo57hdMTKl0r1b+/WzZKpw3zhQR/eCkOJNFTjbUfUx/MGnZkm
O23LHXphyW+4BXzsoto/n7WtYpKhnL1ZwhkdKzt9mybMdbTu1zh9o65JHizZjDjU
I0Px9TMYAZNi2N+Y70f2G4OZmru5qja69tr2D6PmlfqzdPJ4MU9p/7HfWNHfTn8z
Cv3CAJRL5iQKj8sDeaULeCWEmgJAu8j0uEScFu7KeTi00/7yaV8lQOFYUPkmJoS7
EYFlA5E8AV8ia95OabvgzRmCvrTJZiaAgdmNigOGcQ6STBXS7ld3TC2SeRa+LayX
62bdANvgX0RwUzAEeaNdL6hntthOsHlNHX7C2UXj4A9/Q9Uh34ZZbkYV/COeLPW3
PmGQKygcnFlIlQSrdYS8J79L2qMQ/QqcSL3Ua/S8gcaI1nmgQIW8P4nT4767Z3R8
YHQICvnyg7VRx1zMKq7TMXGkBX9iyle43syCtAHKPdqn0wiyS4uGPqxf0Epqcqus
cySdmqzA9LfcH2wPo/gq6g68k0nVxaeGQ9OzEINIxYwtisW1gIB6cCJF7e/x4SDY
4ixewa4etoHguvXgzZSO
=EJ+A
-----END PGP SIGNATURE-----

--tsOsTdHNUZQcU9Ye--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
