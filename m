From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH v4 10/20] tegra: fdt: Add additional USB binding
Date: Wed, 18 Jan 2012 21:55:35 -0800
Message-ID: <CAPnjgZ0JAyV8+0kLv=EcM-AhBxE-YSyG-Y7rYPS8PhOAOnq6dw@mail.gmail.com>
References: <1326342789-5781-1-git-send-email-sjg@chromium.org>
	<1326342789-5781-11-git-send-email-sjg@chromium.org>
	<4F174C3E.2090403@nvidia.com>
	<20120119053523.GB27447@quad.lixom.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20120119053523.GB27447-O5ziIzlqnXUVNXGz7ipsyg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Cc: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, U-Boot Mailing List <u-boot-0aAXYlwwYIKGBzrmiIFOJg@public.gmane.org>, Tom Warren <TWarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Devicetree Discuss <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, Jerry Van Baren <vanbaren-He//nVnquyzQT0dZR+AlfA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Hi Olof,

On Wed, Jan 18, 2012 at 9:35 PM, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org> wrote:
> On Wed, Jan 18, 2012 at 03:48:30PM -0700, Stephen Warren wrote:
>> On 01/11/2012 09:32 PM, Simon Glass wrote:
>> > This adds a property to indicate a port which can switch between h=
ost and device
>> > mode.
>> >
>> > Signed-off-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
>> > ---
>> >
>> > =A0doc/device-tree-bindings/usb/tegra-usb.txt | =A0 =A04 ++++
>> > =A01 files changed, 4 insertions(+), 0 deletions(-)
>> >
>> > diff --git a/doc/device-tree-bindings/usb/tegra-usb.txt b/doc/devi=
ce-tree-bindings/usb/tegra-usb.txt
>> > index 035d63d..96fd022 100644
>> > --- a/doc/device-tree-bindings/usb/tegra-usb.txt
>> > +++ b/doc/device-tree-bindings/usb/tegra-usb.txt
>> > @@ -11,3 +11,7 @@ Required properties :
>> > =A0 - phy_type : Should be one of "ulpi" or "utmi".
>> > =A0 - nvidia,vbus-gpio : If present, specifies a gpio that needs t=
o be
>> > =A0 =A0 activated for the bus to be powered.
>> > +
>> > +Optional properties:
>> > + - support-host-mode : If present then this peripheral can switch=
 between
>> > + =A0 host and device mode
>>
>> All of Tegra's USB ports support host mode, and it's the typical mod=
e of
>> operation. The TRM also indicates that all USB ports support device =
mode
>> (possibly depending on the PHY type that's been selected for or atta=
ched
>> to port). Port 2 explicitly doesn't support run-time switching, but =
by
>> omission, ports 1 and 3 do.
>>
>> Hence, "support-host-mode" is not an accurate name, and doesn't matc=
h
>> the description given either.
>>
>> I think that it'd be better to:
>> * Add properties to explicitly specify whether the port is
>> intended/allowed to operate (per board design) in each of host or de=
vice
>> mode.
>> * Default to static host mode if no properties are present.
>>
>> i.e.:
>>
>> +Optional properties:
>> + - enable-host-mode : Indicate that the port is intended to operate=
 in
>> + =A0 host mode.
>> + - enable-device-mode : Indicate that the port is intended to opera=
te
>> + =A0 in device mode.
>
> fsl-usb.txt uses "dr_mode" here, which might make sense to reuse give=
n some of
> the shared IP in question for device mode:
>
> =A0- dr_mode : indicates the working mode for "fsl-usb2-dr" compatibl=
e
> =A0 controllers. =A0Can be "host", "peripheral", or "otg". =A0Default=
 to
> =A0 "host" if not defined for backward compatibility.

What does 'dr' mean?

Regards,
Simon

>
>
> -Olof
