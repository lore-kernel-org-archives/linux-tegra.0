From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [RFC 2/2] ARM:Tegra: Device Tree Support: Initialize audio card
 gpio's from the device tree.
Date: Mon, 30 May 2011 13:20:39 -0600
Message-ID: <BANLkTi=hkScxYpt449CQCky+bLU3UvkC_A@mail.gmail.com>
References: <20110527205444.21000.90209.stgit@riker> <20110527205721.21000.78599.stgit@riker>
 <20110528012427.GB5971@opensource.wolfsonmicro.com> <BANLkTinKLcYmStvBEGDcN84BapJXe5Y5bg@mail.gmail.com>
 <20110530033826.GE4130@opensource.wolfsonmicro.com> <20110530061155.GC23517@ponder.secretlab.ca>
 <4DE336A1.5040509@firmworks.com> <20110530070138.GA5036@opensource.wolfsonmicro.com>
 <8d2515b13c817cc956b185d043bcef00@kernel.crashing.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <8d2515b13c817cc956b185d043bcef00-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Segher Boessenkool <segher-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
Cc: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Mitch Bradley <wmb-D5eQfiDGL7eakBO8gow8eQ@public.gmane.org>, Olof Johansson <olofj-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Mon, May 30, 2011 at 12:54 PM, Segher Boessenkool
<segher-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org> wrote:
>>> I'm currently dealing with an SoC that has over a hundred GPIOs.
>>> Whatever we choose, I think it should be able to handle an insane
>>> number of GPIOs without getting any more cumbersome that is
>>> necessary.
>>
>> This is *consumer* side GPIOs, not bindings for the device providing=
 the
>> GPIOs. =A0If a single device needs to use hundreds of GPIOs I'd expe=
ct
>> many of them will be block functions so you'd have a binding with an
>> array for things like "databus" and "addrbus".
>
> But please name them like "databus-gpio", so that it is obvious what =
it
> is. =A0Also have to think about how this will work with multiple GPIO
> controllers: do you require the GPIO controller node to be part of ev=
ery
> GPIO description, or do you do some "gpio-parent" scheme as well, how
> does that interact with not having a single array of GPIOs?
>
> Better write this down as a binding, before committing to it :-)

Here's my thinking: Exactly the same binding for "gpios" as is now,
except can use different property names, like "chipsel-gpios" or
"wp-gpio".  Here is a draft patch to the binding:

diff --git a/Documentation/devicetree/bindings/gpio/gpio.txt
b/Documentation/devicetree/bindings/gpio/gpio.txt
index edaa84d..21dd4f9 100644
--- a/Documentation/devicetree/bindings/gpio/gpio.txt
+++ b/Documentation/devicetree/bindings/gpio/gpio.txt
@@ -4,17 +4,45 @@ Specifying GPIO information for devices
 1) gpios property
 -----------------

-Nodes that makes use of GPIOs should define them using `gpios' propert=
y,
-format of which is: <&gpio-controller1-phandle gpio1-specifier
-		     &gpio-controller2-phandle gpio2-specifier
-		     0 /* holes are permitted, means no GPIO 3 */
-		     &gpio-controller4-phandle gpio4-specifier
-		     ...>;
+Nodes that makes use of GPIOs should specify them using one or more
+properties, each containing a 'gpio-list':

-Note that gpio-specifier length is controller dependent.
+	gpio-list ::=3D <single-gpio> [gpio-list]
+	single-gpio ::=3D <gpio-phandle> <gpio-specifier>
+	gpio-phandle : phandle to gpio controller node
+	gpio-specifier : Array of #gpio-cells specifying specific gpio
+			 (controller specific)
+
+GPIO properties should be named either "gpios" or "*-gpio".  Exact
+meaning of each gpio property must be documented in the device tree
+binding for each device.
+
+For example, the following could be used to describe gpios pins to use
+as chip select lines; with chip selects 0, 1 and 3 populated, and chip
+select 2 left empty:
+
+	gpio1: gpio1 {
+		gpio-controller
+		 #gpio-cells =3D <2>;
+	};
+	gpio2: gpio2 {
+		gpio-controller
+		 #gpio-cells =3D <1>;
+	};
+	[...]
+	 chipsel-gpio =3D <&gpio1 12 0>,
+			<&gpio1 13 0>,
+			<0>, /* holes are permitted, means no GPIO 2 */
+			<&gpio2 2>;
+
+Note that gpio-specifier length is controller dependent.  In the
+above example, &gpio1 uses 2 cells to specify a gpio, while &gpio2
+only uses one.

 gpio-specifier may encode: bank, pin position inside the bank,
 whether pin is open-drain and whether pin is logically inverted.
+Exact meaning of each specifier cell is controller specific, and must
+be documented in the device tree binding for the device.

 Example of the node using GPIOs:

@@ -28,8 +56,8 @@ and empty GPIO flags as accepted by the "qe_pio_e"
gpio-controller.
 2) gpio-controller nodes
 ------------------------

-Every GPIO controller node must have #gpio-cells property defined,
-this information will be used to translate gpio-specifiers.
+Every GPIO controller node must both an empty "gpio-controller"
+property, and have #gpio-cells contain the size of the gpio-specifier.

 Example of two SOC GPIO banks defined as gpio-controller nodes:
