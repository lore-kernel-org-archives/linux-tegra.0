From: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v8 4/9] mfd: Add binding document for NVIDIA Tegra XUSB
Date: Wed, 13 May 2015 15:39:54 +0100
Message-ID: <20150513143954.GA3394@x1>
References: <1430761002-9327-1-git-send-email-abrestic@chromium.org>
 <1430761002-9327-5-git-send-email-abrestic@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1430761002-9327-5-git-send-email-abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Mon, 04 May 2015, Andrew Bresticker wrote:

> Add a binding document for the XUSB host complex on NVIDIA Tegra124
> and later SoCs.  The XUSB host complex includes a mailbox for
> communication with the XUSB micro-controller and an xHCI host-control=
ler.
>=20
> Signed-off-by: Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> Cc: Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>
> Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
> Cc: Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>
> Cc: Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
> Cc: Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
> Cc: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> ---
> Changes from v7:
>  - Move non-shared resources into child nodes.
> New for v7.
> ---
>  .../bindings/mfd/nvidia,tegra124-xusb.txt          | 37 ++++++++++++=
++++++++++
>  1 file changed, 37 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mfd/nvidia,tegr=
a124-xusb.txt
>=20
> diff --git a/Documentation/devicetree/bindings/mfd/nvidia,tegra124-xu=
sb.txt b/Documentation/devicetree/bindings/mfd/nvidia,tegra124-xusb.txt
> new file mode 100644
> index 0000000..bc50110
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mfd/nvidia,tegra124-xusb.txt
> @@ -0,0 +1,37 @@
> +NVIDIA Tegra XUSB host copmlex
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
> +
> +The XUSB host complex on Tegra124 and later SoCs contains an xHCI ho=
st
> +controller and a mailbox for communication with the XUSB micro-contr=
oller.
> +
> +Required properties:
> +--------------------
> + - compatible: For Tegra124, must contain "nvidia,tegra124-xusb".
> +   Otherwise, must contain '"nvidia,<chip>-xusb", "nvidia,tegra124-x=
usb"'
> +   where <chip> is tegra132.
> + - reg: Must contain the base and length of the XUSB FPCI registers.
> + - ranges: Bus address mapping for the XUSB block.  Can be empty sin=
ce the
> +   mapping is 1:1.
> + - #address-cells: Must be 2.
> + - #size-cells: Must be 2.
> +
> +Example:
> +--------
> +	usb@0,70098000 {
> +		compatible =3D "nvidia,tegra124-xusb";
> +		reg =3D <0x0 0x70098000 0x0 0x1000>;
> +		ranges;
> +
> +		#address-cells =3D <2>;
> +		#size-cells =3D <2>;
> +
> +		usb-host@0,70090000 {
> +			compatible =3D "nvidia,tegra124-xhci";
> +			...
> +		};
> +
> +		mailbox {
> +			compatible =3D "nvidia,tegra124-xusb-mbox";
> +			...
> +		};

This doesn't appear to be a proper MFD.  I would have the USB and
Mailbox devices probe seperately and use a phandle to point the USB
device to its Mailbox.

usb@xyz {
	mboxes =3D <&xusb-mailbox, [chan]>;
};

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
