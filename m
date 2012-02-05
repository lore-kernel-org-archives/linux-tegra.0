From: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Subject: Re: [PATCH 2/3] dt: rfkill-gpio: add bindings documentation
Date: Sun, 5 Feb 2012 14:00:25 -0800
Message-ID: <CAOesGMhXZLRHw+TSVqHZFQcYLeu995EKaG_hNFRkgOnPFdmq6g@mail.gmail.com>
References: <215249735783e9fe35db1c594d901f591725de50.1328461986.git.marvin24@gmx.de>
	<a2291f385edf9692f4a946fd78a7ee7cca29e3b4.1328461986.git.marvin24@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <a2291f385edf9692f4a946fd78a7ee7cca29e3b4.1328461986.git.marvin24-Mmb7MZpHnFY@public.gmane.org>
Sender: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "John W. Linville" <linville-2XuSBdqkA4R54TAoqtyWWQ@public.gmane.org>, Johannes Berg <johannes-cdvu00un1VgdHxzADdlk8Q@public.gmane.org>, Rhyland Klein <rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Hi,

On Sun, Feb 5, 2012 at 9:18 AM, Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org> wrote:
> Add device tree bindings information for rfkill gpio switches.
>
> Cc: linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> Cc: "John W. Linville" <linville-2XuSBdqkA4R54TAoqtyWWQ@public.gmane.org>
> Cc: Johannes Berg <johannes-cdvu00un1VgdHxzADdlk8Q@public.gmane.org>
> Cc: Rhyland Klein <rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> Cc: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
> Signed-off-by: Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>

Please cc devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org on device tree bindings;
not everyone monitors the linux mailing lists.



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
> + =A0Documentation/devicetree/booting-without-of.txt).
> +- type : enumerated type of the gpio (see include/linux/rfkill.h).
> +- clock : (optional) name of the clock name associated with the rfki=
ll switch
> + =A0(see include/linux/rfkill-gpio.h)

Sorry, but this is going about things the wrong way.

A device tree binding is meant to describe hardware. For example, the
type and clock properties are clearly linux specifics that shouldn't
be expressed that way in the device tree.

instead, think about what you actually need to provide for a driver to
do its work. Does the wifi device have a gpio to control power (and
one for providing reset outside of the standard interface)? Well, then
that should probably be defined in the node that describes the device
-- i.e. under the sdhci node in question here.

That doesn't fit the rfkill device/driver model perfectly, since it
doesn't have something to bind against, so the rfkill platform device
needs to be instantiated from somewhere else. It's possible that best
match is to have the wifi driver handle it, which should be OK, I
think?


-Olof
--
To unsubscribe from this list: send the line "unsubscribe linux-wireles=
s" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
