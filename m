From: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Subject: Re: [RFC] [PATCH] ARM: tegra: emc: device tree bindings
Date: Tue, 18 Oct 2011 11:42:41 -0700
Message-ID: <CAOesGMh387Oghyd_TobnTOja6tU2uU5kt-86_HwQe7nFiL+svw@mail.gmail.com>
References: <1318873976-25335-1-git-send-email-olof@lixom.net>
	<74CDBE0F657A3D45AFBB94109FB122FF173CA2CBFB@HQMAIL01.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <74CDBE0F657A3D45AFBB94109FB122FF173CA2CBFB-C7FfzLzN0UxDw2glCA4ptUEOCMrvLtNR@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org" <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Tue, Oct 18, 2011 at 11:30 AM, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> w=
rote:
> Olof Johansson wrote at Monday, October 17, 2011 11:53 AM:
>> First cut at device tree bindings for the EMC tables on tegra.
>>
>> Note that I have a prerequisite patch that changes the tegra2_emc co=
de
>> to be a platform driver; but I wanted to do a sanity-check of my dev=
ice
>> tree usage here before posting the whole series.
>
> ...
>> +++ b/Documentation/devicetree/bindings/arm/tegra/emc.txt
> ...
>> +Embedded Memory Controller
>> +
>> +Properties:
>> +- name : Should be emc
>> +- #address-cells : Should be 1
>> +- #size-cells : Should be 0
>
> The address/size-cells properties define the require number of cells =
for
> child nodes, where the child nodes are addressable objects in a bus. =
=46or
> the EMC table child nodes, they're more configuration than nodes on a
> bus, so I don't think it's appropriate for the EMC controller to defi=
ne
> the address/size-cells properties. Those properties would be appropri=
ate
> if we ever have child nodes for the individual SDRAM chips, but I sus=
pect
> we won't ever do that?

I'm not aware of anyone going down to the granularity of representing
actual memory chips in the device tree. It's more common to use SPD on
DIMMs for it.

[Also, see below]

> ...
>> +Embedded Memory Controller configuration table
> ...
>> +Properties:
>> +- name : Should start with emc-table
>
>> +- compatible : should contain "nvidia,tegra20-emc-table".
>> +- reg : only needed if nvidia,use-ram-code is present in the
>> + =A0parent. If so, the numerical representation of the selected ram=
 code
>> + =A0as reported by the strap option APB misc register.
>
> I don't think the compatible or reg properties are needed; the EMC ta=
bles
> aren't addressable objects on a bus, so no need for reg. I could see =
an
> argument that we'd want to version the emc-table format, and so the
> compatible flag might be useful, yet AIUI, compatible is more for def=
ining
> HW compatibility (and hence driver instantiation), rather than a prop=
erty
> of some configuration node.

I was struggling with a good way to specify the selection of the
modules. I can definitely use a nvidia,ram-code property instead of
reg (with a similar definition to how reg was used here).

Compatible is still needed, in my opinion -- otherwise there will be
no way to tell if the node is there to describe emc timings or if it's
some new node used to describe something else (such as SDRAM chips as
mentioned above).

>> +- clock-frequency : the clock frequency for the EMC at which this
>> + =A0table should be used (in kHz).
>> +- nvidia,emc-registers : a 46 word array of EMC registers to be pro=
grammed
>> + =A0for operation at the 'clock-frequency' setting.
>> + =A0The order and contents of the registers are defined in the Tegr=
a TRM.
>
> That's not a very semantic representation. Still, I guess there isn't
> any benefit representing this at a higher level.

Yeah, it's not all that pretty but I don't see much value in
describing the actual values for which the register values are derived
from. It's all black magic from start to finish, as far as I am
concerned (i.e. we've always received a register blob from nvidia for
various boards with very little information on why and what certain
values were tweaked like they were).


>> +++ b/arch/arm/boot/dts/tegra-seaboard.dts
>> @@ -20,6 +20,42 @@
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 clock-frequency =3D < 216000000 >;
>> =A0 =A0 =A0 };
>>
>> + =A0 =A0 emc {
>
> I think that should be emc@7000f400, so it matches tegra20.dtsi?

If there is only one entry, unit address should be optional. I thought
this would match it up with the one from tegra20.dtsi and overlay that
already. I'll double-check on that dtc behavior and change if needed.


-Olof
