From: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v3 6/7] i2c: ChromeOS EC tunnel driver
Date: Tue, 20 May 2014 09:47:02 +0100
Message-ID: <20140520084702.GG24991@lee--X1>
References: <1398879850-9111-1-git-send-email-dianders@chromium.org>
 <1398879850-9111-7-git-send-email-dianders@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1398879850-9111-7-git-send-email-dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org, abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, dgreid-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org, sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Vincent Palatin <vpalatin-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, rdunlap-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org, sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, jdelvare-l3A5Bk7waGM@public.gmane.org, shane.huang-5C7GfCeVMHo@public.gmane.org, maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, laurent.pinchart+renesas-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org, u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, bjorn.andersson-/MT0OVThwyLZJqsBc5GL+g@public.gmane.org, kevin.strasser-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, linux-ci5G2KO2hbZ+pU9mqzGVBQ@public.gmane.org, andrew-g2DYL2Zd6BY@public.gmane.org, andriy.shevchenko-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, schwidefsky-tA70FqPdS9bQT0dZR+AlfA@public.gmane.org, matt.porter-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, ch.naveen-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Wed, 30 Apr 2014, Doug Anderson wrote:

> On ARM Chromebooks we have a few devices that are accessed by both th=
e
> AP (the main "Application Processor") and the EC (the Embedded
> Controller).  These are:
> * The battery (sbs-battery).
> * The power management unit tps65090.
>=20
> On the original Samsung ARM Chromebook these devices were on an I2C
> bus that was shared between the AP and the EC and arbitrated using
> some extranal GPIOs (see i2c-arb-gpio-challenge).
>=20
> The original arbitration scheme worked well enough but had some
> downsides:
> * It was nonstandard (not using standard I2C multimaster)
> * It only worked if the EC-AP communication was I2C
> * It was relatively hard to debug problems (hard to tell if i2c issue=
s
>   were caused by the EC, the AP, or some device on the bus).
>=20
> On the HP Chromebook 11 the design was changed to:
> * The AP/EC comms were still i2c, but the battery/tps65090 were no
>   longer on the bus used for AP/EC communication.  The battery was
>   exposed to the AP through a limited i2c tunnel and tps65090 was
>   exposed to the AP through a custom Linux driver.
>=20
> On the Samsung ARM Chromebook 2 the scheme is changed yet again, now:
> * The AP/EC comms are now using SPI for faster speeds.
> * The EC's i2c bus is exposed to the AP through a full i2c tunnel.
>=20
> The upstream "tegra124-venice2" uses the same scheme as the Samsung
> ARM Chromebook 2, though it has a different set of components on the
> other side of the bus.
>=20
> This driver supports the scheme used by the Samsung ARM Chromebook 2.
> Future patches to this driver could add support for the battery tunne=
l
> on the HP Chromebook 11 (and perhaps could even be used to access
> tps65090 on the HP Chromebook 11 instead of using a special driver,
> but I haven't researched that enough).
>=20
> Signed-off-by: Vincent Palatin <vpalatin-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> Signed-off-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> Signed-off-by: Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> ---
> Changes in v3:
> - Separate out packet sizing from packet stuffing.
> - Get rid of useless dev_dbg.
> - Check command_sendrecv against NULL.
> - Don't check np against NULL.
> - Get rid of useless error on memory alloc fail.
> - Get rid of useless platform_set_drvdata(dev, NULL);
>=20
> Changes in v2:
> - Update tunnel binding as per swarren
>=20
>  .../devicetree/bindings/i2c/i2c-cros-ec-tunnel.txt |  39 +++
>  drivers/i2c/busses/Kconfig                         |   9 +
>  drivers/i2c/busses/Makefile                        |   1 +
>  drivers/i2c/busses/i2c-cros-ec-tunnel.c            | 318 +++++++++++=
++++++++++
>  drivers/mfd/cros_ec.c                              |   5 +
>  5 files changed, 372 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/i2c/i2c-cros-ec=
-tunnel.txt
>  create mode 100644 drivers/i2c/busses/i2c-cros-ec-tunnel.c

Applied, thanks.

> diff --git a/Documentation/devicetree/bindings/i2c/i2c-cros-ec-tunnel=
=2Etxt b/Documentation/devicetree/bindings/i2c/i2c-cros-ec-tunnel.txt
> new file mode 100644
> index 0000000..898f030
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/i2c/i2c-cros-ec-tunnel.txt
> @@ -0,0 +1,39 @@
> +I2C bus that tunnels through the ChromeOS EC (cros-ec)
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
> +On some ChromeOS board designs we've got a connection to the EC (emb=
edded
> +controller) but no direct connection to some devices on the other si=
de of
> +the EC (like a battery and PMIC).  To get access to those devices we=
 need
> +to tunnel our i2c commands through the EC.
> +
> +The node for this device should be under a cros-ec node like google,=
cros-ec-spi
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
> diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfig
> index c94db1c..9a0a6cc 100644
> --- a/drivers/i2c/busses/Kconfig
> +++ b/drivers/i2c/busses/Kconfig
> @@ -993,6 +993,15 @@ config I2C_SIBYTE
>  	help
>  	  Supports the SiByte SOC on-chip I2C interfaces (2 channels).
> =20
> +config I2C_CROS_EC_TUNNEL
> +	tristate "ChromeOS EC tunnel I2C bus"
> +	depends on MFD_CROS_EC
> +	help
> +	  If you say yes here you get an I2C bus that will tunnel i2c comma=
nds
> +	  through to the other side of the ChromeOS EC to the i2c bus
> +	  connected there. This will work whatever the interface used to
> +	  talk to the EC (SPI, I2C or LPC).
> +
>  config SCx200_I2C
>  	tristate "NatSemi SCx200 I2C using GPIO pins (DEPRECATED)"
>  	depends on SCx200_GPIO
> diff --git a/drivers/i2c/busses/Makefile b/drivers/i2c/busses/Makefil=
e
> index 18d18ff..e110ca9 100644
> --- a/drivers/i2c/busses/Makefile
> +++ b/drivers/i2c/busses/Makefile
> @@ -95,6 +95,7 @@ obj-$(CONFIG_I2C_VIPERBOARD)	+=3D i2c-viperboard.o
>  # Other I2C/SMBus bus drivers
>  obj-$(CONFIG_I2C_ACORN)		+=3D i2c-acorn.o
>  obj-$(CONFIG_I2C_BCM_KONA)	+=3D i2c-bcm-kona.o
> +obj-$(CONFIG_I2C_CROS_EC_TUNNEL)	+=3D i2c-cros-ec-tunnel.o
>  obj-$(CONFIG_I2C_ELEKTOR)	+=3D i2c-elektor.o
>  obj-$(CONFIG_I2C_PCA_ISA)	+=3D i2c-pca-isa.o
>  obj-$(CONFIG_I2C_SIBYTE)	+=3D i2c-sibyte.o
> diff --git a/drivers/i2c/busses/i2c-cros-ec-tunnel.c b/drivers/i2c/bu=
sses/i2c-cros-ec-tunnel.c
> new file mode 100644
> index 0000000..8e7a714
> --- /dev/null
> +++ b/drivers/i2c/busses/i2c-cros-ec-tunnel.c
> @@ -0,0 +1,318 @@
> +/*
> + *  Copyright (C) 2013 Google, Inc
> + *
> + *  This program is free software; you can redistribute it and/or mo=
dify
> + *  it under the terms of the GNU General Public License as publishe=
d by
> + *  the Free Software Foundation; either version 2 of the License, o=
r
> + *  (at your option) any later version.
> + *
> + * Expose an I2C passthrough to the ChromeOS EC.
> + */
> +
> +#include <linux/module.h>
> +#include <linux/i2c.h>
> +#include <linux/mfd/cros_ec.h>
> +#include <linux/mfd/cros_ec_commands.h>
> +#include <linux/platform_device.h>
> +#include <linux/slab.h>
> +
> +/**
> + * struct ec_i2c_device - Driver data for I2C tunnel
> + *
> + * @dev: Device node
> + * @adap: I2C adapter
> + * @ec: Pointer to EC device
> + * @remote_bus: The EC bus number we tunnel to on the other side.
> + * @request_buf: Buffer for transmitting data; we expect most transf=
ers to fit.
> + * @response_buf: Buffer for receiving data; we expect most transfer=
s to fit.
> + */
> +
> +struct ec_i2c_device {
> +	struct device *dev;
> +	struct i2c_adapter adap;
> +	struct cros_ec_device *ec;
> +
> +	u16 remote_bus;
> +
> +	u8 request_buf[256];
> +	u8 response_buf[256];
> +};
> +
> +/**
> + * ec_i2c_count_message - Count bytes needed for ec_i2c_construct_me=
ssage
> + *
> + * @i2c_msgs: The i2c messages to read
> + * @num: The number of i2c messages.
> + *
> + * Returns the number of bytes the messages will take up.
> + */
> +static int ec_i2c_count_message(const struct i2c_msg i2c_msgs[], int=
 num)
> +{
> +	int i;
> +	int size;
> +
> +	size =3D sizeof(struct ec_params_i2c_passthru);
> +	size +=3D num * sizeof(struct ec_params_i2c_passthru_msg);
> +	for (i =3D 0; i < num; i++)
> +		if (!(i2c_msgs[i].flags & I2C_M_RD))
> +			size +=3D i2c_msgs[i].len;
> +
> +	return size;
> +}
> +
> +/**
> + * ec_i2c_construct_message - construct a message to go to the EC
> + *
> + * This function effectively stuffs the standard i2c_msg format of L=
inux into
> + * a format that the EC understands.
> + *
> + * @buf: The buffer to fill.  We assume that the buffer is big enoug=
h.
> + * @i2c_msgs: The i2c messages to read.
> + * @num: The number of i2c messages.
> + * @bus_num: The remote bus number we want to talk to.
> + *
> + * Returns 0 or a negative error number.
> + */
> +static int ec_i2c_construct_message(u8 *buf, const struct i2c_msg i2=
c_msgs[],
> +				    int num, u16 bus_num)
> +{
> +	struct ec_params_i2c_passthru *params;
> +	u8 *out_data;
> +	int i;
> +
> +	out_data =3D buf + sizeof(struct ec_params_i2c_passthru) +
> +		   num * sizeof(struct ec_params_i2c_passthru_msg);
> +
> +	params =3D (struct ec_params_i2c_passthru *)buf;
> +	params->port =3D bus_num;
> +	params->num_msgs =3D num;
> +	for (i =3D 0; i < num; i++) {
> +		const struct i2c_msg *i2c_msg =3D &i2c_msgs[i];
> +		struct ec_params_i2c_passthru_msg *msg =3D &params->msg[i];
> +
> +		msg->len =3D i2c_msg->len;
> +		msg->addr_flags =3D i2c_msg->addr;
> +
> +		if (i2c_msg->flags & I2C_M_TEN)
> +			msg->addr_flags |=3D EC_I2C_FLAG_10BIT;
> +
> +		if (i2c_msg->flags & I2C_M_RD) {
> +			msg->addr_flags |=3D EC_I2C_FLAG_READ;
> +		} else {
> +			memcpy(out_data, i2c_msg->buf, msg->len);
> +			out_data +=3D msg->len;
> +		}
> +	}
> +
> +	return 0;
> +}
> +
> +/**
> + * ec_i2c_count_response - Count bytes needed for ec_i2c_parse_respo=
nse
> + *
> + * @i2c_msgs: The i2c messages to to fill up.
> + * @num: The number of i2c messages expected.
> + *
> + * Returns the number of response bytes expeced.
> + */
> +static int ec_i2c_count_response(struct i2c_msg i2c_msgs[], int num)
> +{
> +	int size;
> +	int i;
> +
> +	size =3D sizeof(struct ec_response_i2c_passthru);
> +	for (i =3D 0; i < num; i++)
> +		if (i2c_msgs[i].flags & I2C_M_RD)
> +			size +=3D i2c_msgs[i].len;
> +
> +	return size;
> +}
> +
> +/**
> + * ec_i2c_parse_response - Parse a response from the EC
> + *
> + * We'll take the EC's response and copy it back into msgs.
> + *
> + * @buf: The buffer to parse.
> + * @i2c_msgs: The i2c messages to to fill up.
> + * @num: The number of i2c messages; will be modified to include the=
 actual
> + *	 number received.
> + *
> + * Returns 0 or a negative error number.
> + */
> +static int ec_i2c_parse_response(const u8 *buf, struct i2c_msg i2c_m=
sgs[],
> +				 int *num)
> +{
> +	const struct ec_response_i2c_passthru *resp;
> +	const u8 *in_data;
> +	int i;
> +
> +	in_data =3D buf + sizeof(struct ec_response_i2c_passthru);
> +
> +	resp =3D (const struct ec_response_i2c_passthru *)buf;
> +	if (resp->i2c_status & EC_I2C_STATUS_TIMEOUT)
> +		return -ETIMEDOUT;
> +	else if (resp->i2c_status & EC_I2C_STATUS_ERROR)
> +		return -EREMOTEIO;
> +
> +	/* Other side could send us back fewer messages, but not more */
> +	if (resp->num_msgs > *num)
> +		return -EPROTO;
> +	*num =3D resp->num_msgs;
> +
> +	for (i =3D 0; i < *num; i++) {
> +		struct i2c_msg *i2c_msg =3D &i2c_msgs[i];
> +
> +		if (i2c_msgs[i].flags & I2C_M_RD) {
> +			memcpy(i2c_msg->buf, in_data, i2c_msg->len);
> +			in_data +=3D i2c_msg->len;
> +		}
> +	}
> +
> +	return 0;
> +}
> +
> +static int ec_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg i2c_=
msgs[],
> +		       int num)
> +{
> +	struct ec_i2c_device *bus =3D adap->algo_data;
> +	struct device *dev =3D bus->dev;
> +	const u16 bus_num =3D bus->remote_bus;
> +	int request_len;
> +	int response_len;
> +	u8 *request =3D NULL;
> +	u8 *response =3D NULL;
> +	int result;
> +
> +	request_len =3D ec_i2c_count_message(i2c_msgs, num);
> +	if (request_len < 0) {
> +		dev_warn(dev, "Error constructing message %d\n", request_len);
> +		result =3D request_len;
> +		goto exit;
> +	}
> +	response_len =3D ec_i2c_count_response(i2c_msgs, num);
> +	if (response_len < 0) {
> +		/* Unexpected; no errors should come when NULL response */
> +		dev_warn(dev, "Error preparing response %d\n", response_len);
> +		result =3D response_len;
> +		goto exit;
> +	}
> +
> +	if (request_len <=3D ARRAY_SIZE(bus->request_buf)) {
> +		request =3D bus->request_buf;
> +	} else {
> +		request =3D kzalloc(request_len, GFP_KERNEL);
> +		if (request =3D=3D NULL) {
> +			result =3D -ENOMEM;
> +			goto exit;
> +		}
> +	}
> +	if (response_len <=3D ARRAY_SIZE(bus->response_buf)) {
> +		response =3D bus->response_buf;
> +	} else {
> +		response =3D kzalloc(response_len, GFP_KERNEL);
> +		if (response =3D=3D NULL) {
> +			result =3D -ENOMEM;
> +			goto exit;
> +		}
> +	}
> +
> +	ec_i2c_construct_message(request, i2c_msgs, num, bus_num);
> +	result =3D bus->ec->command_sendrecv(bus->ec, EC_CMD_I2C_PASSTHRU,
> +					   request, request_len,
> +					   response, response_len);
> +	if (result)
> +		goto exit;
> +
> +	result =3D ec_i2c_parse_response(response, i2c_msgs, &num);
> +	if (result < 0)
> +		goto exit;
> +
> +	/* Indicate success by saying how many messages were sent */
> +	result =3D num;
> +exit:
> +	if (request !=3D bus->request_buf)
> +		kfree(request);
> +	if (response !=3D bus->response_buf)
> +		kfree(response);
> +
> +	return result;
> +}
> +
> +static u32 ec_i2c_functionality(struct i2c_adapter *adap)
> +{
> +	return I2C_FUNC_I2C | I2C_FUNC_SMBUS_EMUL;
> +}
> +
> +static const struct i2c_algorithm ec_i2c_algorithm =3D {
> +	.master_xfer	=3D ec_i2c_xfer,
> +	.functionality	=3D ec_i2c_functionality,
> +};
> +
> +static int ec_i2c_probe(struct platform_device *pdev)
> +{
> +	struct device_node *np =3D pdev->dev.of_node;
> +	struct cros_ec_device *ec =3D dev_get_drvdata(pdev->dev.parent);
> +	struct device *dev =3D &pdev->dev;
> +	struct ec_i2c_device *bus =3D NULL;
> +	u32 remote_bus;
> +	int err;
> +
> +	if (!ec->command_sendrecv) {
> +		dev_err(dev, "Missing sendrecv\n");
> +		return -EINVAL;
> +	}
> +
> +	bus =3D devm_kzalloc(dev, sizeof(*bus), GFP_KERNEL);
> +	if (bus =3D=3D NULL)
> +		return -ENOMEM;
> +
> +	err =3D of_property_read_u32(np, "google,remote-bus", &remote_bus);
> +	if (err) {
> +		dev_err(dev, "Couldn't read remote-bus property\n");
> +		return err;
> +	}
> +	bus->remote_bus =3D remote_bus;
> +
> +	bus->ec =3D ec;
> +	bus->dev =3D dev;
> +
> +	bus->adap.owner =3D THIS_MODULE;
> +	strlcpy(bus->adap.name, "cros-ec-i2c-tunnel", sizeof(bus->adap.name=
));
> +	bus->adap.algo =3D &ec_i2c_algorithm;
> +	bus->adap.algo_data =3D bus;
> +	bus->adap.dev.parent =3D &pdev->dev;
> +	bus->adap.dev.of_node =3D np;
> +
> +	err =3D i2c_add_adapter(&bus->adap);
> +	if (err) {
> +		dev_err(dev, "cannot register i2c adapter\n");
> +		return err;
> +	}
> +	platform_set_drvdata(pdev, bus);
> +
> +	return err;
> +}
> +
> +static int ec_i2c_remove(struct platform_device *dev)
> +{
> +	struct ec_i2c_device *bus =3D platform_get_drvdata(dev);
> +
> +	i2c_del_adapter(&bus->adap);
> +
> +	return 0;
> +}
> +
> +static struct platform_driver ec_i2c_tunnel_driver =3D {
> +	.probe =3D ec_i2c_probe,
> +	.remove =3D ec_i2c_remove,
> +	.driver =3D {
> +		.name =3D "cros-ec-i2c-tunnel",
> +	},
> +};
> +
> +module_platform_driver(ec_i2c_tunnel_driver);
> +
> +MODULE_LICENSE("GPL");
> +MODULE_DESCRIPTION("EC I2C tunnel driver");
> +MODULE_ALIAS("platform:cros-ec-i2c-tunnel");
> diff --git a/drivers/mfd/cros_ec.c b/drivers/mfd/cros_ec.c
> index c58ab96..61bc909 100644
> --- a/drivers/mfd/cros_ec.c
> +++ b/drivers/mfd/cros_ec.c
> @@ -90,6 +90,11 @@ static const struct mfd_cell cros_devs[] =3D {
>  		.id =3D 1,
>  		.of_compatible =3D "google,cros-ec-keyb",
>  	},
> +	{
> +		.name =3D "cros-ec-i2c-tunnel",
> +		.id =3D 2,
> +		.of_compatible =3D "google,cros-ec-i2c-tunnel",
> +	},
>  };
> =20
>  int cros_ec_register(struct cros_ec_device *ec_dev)

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
