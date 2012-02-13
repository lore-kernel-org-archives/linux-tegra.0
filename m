From: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Subject: Re: [PATCH 2/3] dt: rfkill-gpio: add bindings documentation
Date: Mon, 13 Feb 2012 11:43:17 -0800
Message-ID: <CAOesGMjofzC9pp1H9SXS693QR7JU9XjvVLVi6gBSGuqVNJ-rKA@mail.gmail.com>
References: <1ec0e63a7453072689618430ebc2bdd7b62542a2.1329073559.git.marvin24@gmx.de>
	<86044d44009316a48b402050f9dd742391d46eac.1329073559.git.marvin24@gmx.de>
	<CAPnjgZ2b4QjKMKjKyHqGGU1TbMamq6pBPUAAO99gMa98Rd+Erw@mail.gmail.com>
	<4F391470.3090102@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <4F391470.3090102-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>, linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "John W. Linville" <linville-2XuSBdqkA4R54TAoqtyWWQ@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Johannes Berg <johannes-cdvu00un1VgdHxzADdlk8Q@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Hi,

On Mon, Feb 13, 2012 at 5:47 AM, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wr=
ote:
> On 02/12/2012 02:21 PM, Simon Glass wrote:
>> Hi Marc,
>>
>> On Sun, Feb 12, 2012 at 11:13 AM, Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org> wr=
ote:
>>> Add device tree bindings information for rfkill gpio switches.
>>>
>>> Cc: linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
>>> Cc: "John W. Linville" <linville-2XuSBdqkA4R54TAoqtyWWQ@public.gmane.org>
>>> Cc: Johannes Berg <johannes-cdvu00un1VgdHxzADdlk8Q@public.gmane.org>
>>> Cc: Rhyland Klein <rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>>> Cc: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
>>> Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
>>> Signed-off-by: Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>
>>> ---
>>> =A0Documentation/devicetree/bindings/gpio/rfkill.txt | =A0 38 +++++=
++++++++++++++++
>>> =A01 files changed, 38 insertions(+), 0 deletions(-)
>>> =A0create mode 100644 Documentation/devicetree/bindings/gpio/rfkill=
=2Etxt
>>>
>>> diff --git a/Documentation/devicetree/bindings/gpio/rfkill.txt b/Do=
cumentation/devicetree/bindings/gpio/rfkill.txt
>>> new file mode 100644
>>> index 0000000..22bf22a
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/gpio/rfkill.txt
>>> @@ -0,0 +1,38 @@
>>> +RFKILL switches connected to GPIO lines
>>> +
>>> +Required properties:
>>> +- compatible : should be "rfkill-gpio".
>>> +
>>> +Each rfkill switch is represented as a sub-node of the rfkill-gpio=
 device.
>>> +Each node has a label property which represents the name of the co=
rresponding
>>> +rfkill device.
>>> +
>>> +RFKILL sub-node properties:
>>> +- label : =A0(optional) The label for this rfkill switch. =A0If om=
itted, the label is
>>> + =A0taken from the node name (excluding the unit address).
>>> +- reset-gpio, shutdown-gpio : =A0Should specify the rfkill gpios f=
or reset and
>>> + =A0shutdown (see "Specifying GPIO information for devices" in
>>
>> Should that be reset-gpios, shutdown-gpios? Even though you have onl=
y
>> one it seems that people put an 's' on the end.

Agreed.

>>
>>> + =A0Documentation/devicetree/booting-without-of.txt).
>>> +- type : enumerated type of the gpio (see include/linux/rfkill.h).
>>
>> It would be better I think if this were explicit here. If you have a
>> number, then what values does it take and what do they mean?

This should most likely be moved to a set of properties instad of an
enumerated type, I agree. And/or use a string to encode the type
simiar to how powerpc does some of the USB interfaces.

>>> +- clock : (optional) name of the clock name associated with the rf=
kill switch
>>
>> Can this be a phandle instead of a string?
>
> This seems to be in the wrong place altogether. The gpio controller
> would have a clock, not particular gpio line.

And either way, this should conform to the standard clock binding, not
use something locally hacked up.

>>> + =A0(see include/linux/rfkill-gpio.h)
>>
>> IMO device tree bindings should be fully documented in this file,
>> rather than needing to look at a separate header. This is particular=
ly
>> true if the binding is used in another project.
>>
>
> Correct. A binding should not be Linux specific. It should describe t=
he h/w.
>
>>> +
>>> +Examples:
>>> +
>>> +rfkill-switches {
>>> + =A0 =A0 =A0 compatible =3D "rfkill-gpio";
>>> +
>>> + =A0 =A0 =A0 wifi {
>>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 label =3D "wifi";
>>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 reset-gpio =3D <&gpio 25 0>; /* Activ=
e high */
>>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 shutdown-gpio =3D <&gpio 85 0>; /* Ac=
tive high */
>>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 type =3D <1>;
>>> + =A0 =A0 =A0 };
>>> +
>>> + =A0 =A0 =A0 bt {
>>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 label =3D "bluetooth";
>>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 reset-gpio =3D <&gpio 17 0>; /* Activ=
e high */
>>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 shutdown-gpio =3D <&gpio 35 0>; /* Ac=
tive high */
>>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 type =3D <1>;
>>> + =A0 =A0 =A0 };
>
> Why wouldn't the gpio lines just be part of the bt and wifi device no=
des
> themselves? The DT is supposed to describe h/w connections.

The thing is, that "rfkill" isn't a _device_, and Marc is trying to
describe it as one. It's really just a software abstraction of a
collection of power supplies and/or GPIO lines that are used to power
up/down specific peripherals.

I know that the USB modem, for example, is probed through autoprobing
the USB bus. So there's no device to associate it with, per se. But
the USB slot that the modem is connected to, which is also the
connector that the GPIO controls the power supplies and reset line to,
are connected directly to one of the USB host controllers, right? So
maybe describing it there is a better option.

That still leaves the issue of actually having something to bind it
against. As I already said, rfkill isn't a device, so crafting one
just because linux wants one is the wrong way to go about. Maybe using
/chosen to refer to the device nodes for the GPIO lines under USB
instead, and have rfkill look for those and create a device if they're
found is a better way to go about it.


-Olof
