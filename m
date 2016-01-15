From: Wei Ni <wni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH V1 06/10] of: Add bindings of hw-trips for soctherm
Date: Fri, 15 Jan 2016 15:21:03 +0800
Message-ID: <56989DDF.2060004@nvidia.com>
References: <1452672022-387-1-git-send-email-wni@nvidia.com> <20160113152527.GF2588@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160113152527.GF2588@ulmo>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: rui.zhang-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, mikko.perttunen-/1wQRMveznE@public.gmane.org, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org



On 2016=E5=B9=B401=E6=9C=8813=E6=97=A5 23:25, Thierry Reding wrote:
> * PGP Signed by an unknown key
>=20
> Cc'ing devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, please make sure to always Cc that
> list on device tree binding patches.
>=20
> On Wed, Jan 13, 2016 at 04:00:22PM +0800, Wei Ni wrote:
>> Add hw-trips sub-node for soctherm, which is
>> used to describe the hardware trip points for
>> each soctherm sensors.
>=20
> Perhaps you should mention Tegra in the subject and the commit messag=
e?
>=20
> Also please use all of the 72 columns that are at your disposal when
> writing commit messages.
>=20
>> Signed-off-by: Wei Ni <wni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>> ---
>>  .../devicetree/bindings/thermal/tegra-soctherm.txt | 29 +++++++++++=
+++++++++++
>>  1 file changed, 29 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/thermal/tegra-socther=
m.txt b/Documentation/devicetree/bindings/thermal/tegra-soctherm.txt
>> index 6b68cd150405..77aef0b4968b 100644
>> --- a/Documentation/devicetree/bindings/thermal/tegra-soctherm.txt
>> +++ b/Documentation/devicetree/bindings/thermal/tegra-soctherm.txt
>> @@ -26,6 +26,18 @@ Required properties :
>>      of this property. See <dt-bindings/thermal/tegra124-soctherm.h>=
 for a
>>      list of valid values when referring to thermal sensors.
>> =20
>> +Optional properties:
>> +- hw-trips : A sub-node which is a container of hardware trip point=
s
>> +    for each sensors.
>=20
> Perhaps call the node "trip-points"? "hw-" seems kind of redundant si=
nce
> DT is a hardware description, and "trips" isn't a very good abbreviat=
ion
> for "trip-points".

In the linux thermal framework, it has the node definition "trips" and =
have
sysfs interface named as "trip-points", these "trip" are set for SW. If=
 we also
use the "trip-points" in here, it will make confusion.
I used "hw-", because it's different with the SW trip-points, the trip-=
points
under it are for the Tegra to shutdown/reset from HW, or trigger the
HW-throttle. (not SW throttle, see below)
How about "hw-trip-points"?

>=20
>> +  * sensors: Sub-nodes which are used to describe the HW trip point=
s info,
>> +        must be named as "cpu", "gpu", "mem", "pll".
>> +      Properties:
>> +      - therm-temp : Shutdown temperature in millicelsius, once the
>> +        temperature of this sensor is higher than the therm-temp, t=
he system
>> +        will be reset or shutdown.
>=20
> Why not call the property "shutdown-temperature" if that's what it is=
=2E

This is the shutdown/reset temperature. The Tegra's SPEC calls it as th=
ermtrip
event, when the temperature touch this value, it will trigger the therm=
trip
event, and then will cause the system reset or shutdown, it depends on =
the HW
platform design. So I named it as "therm-temp".
I think it's better to change to "thermtrip-temperature".

>=20
>> +      - throt-temp : HW throttle temperature in millicelsius, once =
the
>> +        temperature of this sensor is higher than the throt-temp, t=
he HW
>> +        throttle will be triggered in soctherm. (Not implement yet)
>=20
> "throttle-temperature" would be a better name in my opinion. More typ=
ing
> perhaps but less chance of getting the abbreviations wrong. Also ther=
e's
> no need for the "(Not implement yet)" because the binding isn't about=
 an
> implementation, it's about the hardware description. If you have no c=
ode
> that uses this, a safer option might be to just drop it for now.

The Tegra soctherm support throttle function, when the temperature touc=
h the
trip point, the HW will skip the CPU/GPU' pulse, so I called it as HW t=
hrottle.
=46or the SW throttle, the SW will cap the CPU/GPU or other clocks freq=
uencies.
Anyway, since we didn't support it yet, I will drop it for now.

>=20
> Thierry
>=20
> * Unknown Key
> * 0x7F3EB3A1
>=20
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
