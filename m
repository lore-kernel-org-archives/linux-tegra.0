From: Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>
Subject: Re: Re: [PATCH 2/3] dt: rfkill-gpio: add bindings documentation
Date: Thu, 16 Feb 2012 11:29:17 +0100
Message-ID: <166174495.hTFI2yeA72@fb07-iapwap2>
References: <1ec0e63a7453072689618430ebc2bdd7b62542a2.1329073559.git.marvin24@gmx.de> <4F391470.3090102@gmail.com> <CAOesGMjofzC9pp1H9SXS693QR7JU9XjvVLVi6gBSGuqVNJ-rKA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAOesGMjofzC9pp1H9SXS693QR7JU9XjvVLVi6gBSGuqVNJ-rKA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Cc: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "John W. Linville" <linville-2XuSBdqkA4R54TAoqtyWWQ@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Johannes Berg <johannes-cdvu00un1VgdHxzADdlk8Q@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Am Montag, 13. Februar 2012, 11:43:17 schrieb Olof Johansson:
> Hi,
> 
> On Mon, Feb 13, 2012 at 5:47 AM, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> > On 02/12/2012 02:21 PM, Simon Glass wrote:
> >> Hi Marc,
> >> 
> >> On Sun, Feb 12, 2012 at 11:13 AM, Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org> wrote:
> >>> Add device tree bindings information for rfkill gpio switches.
> >>> 
> >>> Cc: linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> >>> Cc: "John W. Linville" <linville-2XuSBdqkA4R54TAoqtyWWQ@public.gmane.org>
> >>> Cc: Johannes Berg <johannes-cdvu00un1VgdHxzADdlk8Q@public.gmane.org>
> >>> Cc: Rhyland Klein <rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> >>> Cc: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
> >>> Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
> >>> Signed-off-by: Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>
> >>> ---
> >>>  Documentation/devicetree/bindings/gpio/rfkill.txt |   38
> >>> +++++++++++++++++++++ 1 files changed, 38 insertions(+), 0 deletions(-)
> >>>  create mode 100644 Documentation/devicetree/bindings/gpio/rfkill.txt
> >>> 
> >>> diff --git a/Documentation/devicetree/bindings/gpio/rfkill.txt
> >>> b/Documentation/devicetree/bindings/gpio/rfkill.txt new file mode 100644
> >>> index 0000000..22bf22a
> >>> --- /dev/null
> >>> +++ b/Documentation/devicetree/bindings/gpio/rfkill.txt
> >>> @@ -0,0 +1,38 @@
> >>> +RFKILL switches connected to GPIO lines
> >>> +
> >>> +Required properties:
> >>> +- compatible : should be "rfkill-gpio".
> >>> +
> >>> +Each rfkill switch is represented as a sub-node of the rfkill-gpio device.
> >>> +Each node has a label property which represents the name of the
> >>> corresponding
> >>> +rfkill device.
> >>> +
> >>> +RFKILL sub-node properties:
> >>> +- label :  (optional) The label for this rfkill switch.  If omitted, the
> >>> label is +  taken from the node name (excluding the unit address).
> >>> +- reset-gpio, shutdown-gpio :  Should specify the rfkill gpios for reset
> >>> and
> >>> +  shutdown (see "Specifying GPIO information for devices" in
> >> 
> >> Should that be reset-gpios, shutdown-gpios? Even though you have only
> >> one it seems that people put an 's' on the end.
> 
> Agreed.
> 
> >>> +  Documentation/devicetree/booting-without-of.txt).
> >>> +- type : enumerated type of the gpio (see include/linux/rfkill.h).
> >> 
> >> It would be better I think if this were explicit here. If you have a
> >> number, then what values does it take and what do they mean?
> 
> This should most likely be moved to a set of properties instad of an
> enumerated type, I agree. And/or use a string to encode the type
> simiar to how powerpc does some of the USB interfaces.
> 
> >>> +- clock : (optional) name of the clock name associated with the rfkill
> >>> switch
> >> 
> >> Can this be a phandle instead of a string?
> > 
> > This seems to be in the wrong place altogether. The gpio controller
> > would have a clock, not particular gpio line.
> 
> And either way, this should conform to the standard clock binding, not
> use something locally hacked up.
> 
> >>> +  (see include/linux/rfkill-gpio.h)
> >> 
> >> IMO device tree bindings should be fully documented in this file,
> >> rather than needing to look at a separate header. This is particularly
> >> true if the binding is used in another project.
> > 
> > Correct. A binding should not be Linux specific. It should describe the h/w.
> > 
> >>> +
> >>> +Examples:
> >>> +
> >>> +rfkill-switches {
> >>> +       compatible = "rfkill-gpio";
> >>> +
> >>> +       wifi {
> >>> +               label = "wifi";
> >>> +               reset-gpio = <&gpio 25 0>; /* Active high */
> >>> +               shutdown-gpio = <&gpio 85 0>; /* Active high */
> >>> +               type = <1>;
> >>> +       };
> >>> +
> >>> +       bt {
> >>> +               label = "bluetooth";
> >>> +               reset-gpio = <&gpio 17 0>; /* Active high */
> >>> +               shutdown-gpio = <&gpio 35 0>; /* Active high */
> >>> +               type = <1>;
> >>> +       };
> > 
> > Why wouldn't the gpio lines just be part of the bt and wifi device nodes
> > themselves? The DT is supposed to describe h/w connections.
> 
> The thing is, that "rfkill" isn't a _device_, and Marc is trying to
> describe it as one. It's really just a software abstraction of a
> collection of power supplies and/or GPIO lines that are used to power
> up/down specific peripherals.
> 
> I know that the USB modem, for example, is probed through autoprobing
> the USB bus. So there's no device to associate it with, per se. But
> the USB slot that the modem is connected to, which is also the
> connector that the GPIO controls the power supplies and reset line to,
> are connected directly to one of the USB host controllers, right? So
> maybe describing it there is a better option.
> 
> That still leaves the issue of actually having something to bind it
> against. As I already said, rfkill isn't a device, so crafting one
> just because linux wants one is the wrong way to go about. Maybe using
> /chosen to refer to the device nodes for the GPIO lines under USB
> instead, and have rfkill look for those and create a device if they're
> found is a better way to go about it.

So to move forward, what about a "fake" device like this?

usb@c5000000 {
		wifi-card@1 { /* 1nd port on usb bus 1 */
				compatible = "rfkill-gpio";

				wifi {
						label = "internal wifi";
						reset-gpios = <&gpio 25 0>; /* Active high */
						shutdown-gpios = <&gpio 85 0>; /* Active high */
						type = "wlan";
						clocks = <&tegra-car 17>;
				};
		};

		bt-card@2 { /* 2rd port on usb bus 1 */
				compatible = "rfkill-gpio";

				bt {
						label = "internal bluetooth";
						reset-gpios = <&gpio 17 0>; /* Active high */
						shutdown-gpios = <&gpio 35 0>; /* Active high */
						type = "bluetooth";
				};
		};
};

I hope this won't confuse the usb controller.

Marc
