From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH 2/3] dt: rfkill-gpio: add bindings documentation
Date: Sun, 12 Feb 2012 12:21:12 -0800
Message-ID: <CAPnjgZ2b4QjKMKjKyHqGGU1TbMamq6pBPUAAO99gMa98Rd+Erw@mail.gmail.com>
References: <1ec0e63a7453072689618430ebc2bdd7b62542a2.1329073559.git.marvin24@gmx.de>
	<86044d44009316a48b402050f9dd742391d46eac.1329073559.git.marvin24@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <86044d44009316a48b402050f9dd742391d46eac.1329073559.git.marvin24-Mmb7MZpHnFY@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "John W. Linville" <linville-2XuSBdqkA4R54TAoqtyWWQ@public.gmane.org>, Johannes Berg <johannes-cdvu00un1VgdHxzADdlk8Q@public.gmane.org>, Rhyland Klein <rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Hi Marc,

On Sun, Feb 12, 2012 at 11:13 AM, Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org> wrote=
:
> Add device tree bindings information for rfkill gpio switches.
>
> Cc: linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> Cc: "John W. Linville" <linville-2XuSBdqkA4R54TAoqtyWWQ@public.gmane.org>
> Cc: Johannes Berg <johannes-cdvu00un1VgdHxzADdlk8Q@public.gmane.org>
> Cc: Rhyland Klein <rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> Cc: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
> Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
> Signed-off-by: Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>
> ---
> =A0Documentation/devicetree/bindings/gpio/rfkill.txt | =A0 38 +++++++=
++++++++++++++
> =A01 files changed, 38 insertions(+), 0 deletions(-)
> =A0create mode 100644 Documentation/devicetree/bindings/gpio/rfkill.t=
xt
>
> diff --git a/Documentation/devicetree/bindings/gpio/rfkill.txt b/Docu=
mentation/devicetree/bindings/gpio/rfkill.txt
> new file mode 100644
> index 0000000..22bf22a
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/gpio/rfkill.txt
> @@ -0,0 +1,38 @@
> +RFKILL switches connected to GPIO lines
> +
> +Required properties:
> +- compatible : should be "rfkill-gpio".
> +
> +Each rfkill switch is represented as a sub-node of the rfkill-gpio d=
evice.
> +Each node has a label property which represents the name of the corr=
esponding
> +rfkill device.
> +
> +RFKILL sub-node properties:
> +- label : =A0(optional) The label for this rfkill switch. =A0If omit=
ted, the label is
> + =A0taken from the node name (excluding the unit address).
> +- reset-gpio, shutdown-gpio : =A0Should specify the rfkill gpios for=
 reset and
> + =A0shutdown (see "Specifying GPIO information for devices" in

Should that be reset-gpios, shutdown-gpios? Even though you have only
one it seems that people put an 's' on the end.

> + =A0Documentation/devicetree/booting-without-of.txt).
> +- type : enumerated type of the gpio (see include/linux/rfkill.h).

It would be better I think if this were explicit here. If you have a
number, then what values does it take and what do they mean?

> +- clock : (optional) name of the clock name associated with the rfki=
ll switch

Can this be a phandle instead of a string?

> + =A0(see include/linux/rfkill-gpio.h)

IMO device tree bindings should be fully documented in this file,
rather than needing to look at a separate header. This is particularly
true if the binding is used in another project.

> +
> +Examples:
> +
> +rfkill-switches {
> + =A0 =A0 =A0 compatible =3D "rfkill-gpio";
> +
> + =A0 =A0 =A0 wifi {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 label =3D "wifi";
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 reset-gpio =3D <&gpio 25 0>; /* Active =
high */
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 shutdown-gpio =3D <&gpio 85 0>; /* Acti=
ve high */
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 type =3D <1>;
> + =A0 =A0 =A0 };
> +
> + =A0 =A0 =A0 bt {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 label =3D "bluetooth";
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 reset-gpio =3D <&gpio 17 0>; /* Active =
high */
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 shutdown-gpio =3D <&gpio 35 0>; /* Acti=
ve high */
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 type =3D <1>;
> + =A0 =A0 =A0 };
> +};
> --
> 1.7.5.4
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-tegra=
" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html

Regards,
Simon
