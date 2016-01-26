From: Wei Ni <wni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH V4 07/11] of: Add bindings of hw-trip-points for soctherm
Date: Tue, 26 Jan 2016 14:11:01 +0800
Message-ID: <56A70DF5.60600@nvidia.com>
References: <1453718796-4393-1-git-send-email-wni@nvidia.com> <20160126024157.GA15270@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160126024157.GA15270@rob-hp-laptop>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, rui.zhang-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, MLongnecker-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, mikko.perttunen-/1wQRMveznE@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org



On 2016=E5=B9=B401=E6=9C=8826=E6=97=A5 10:41, Rob Herring wrote:
> On Mon, Jan 25, 2016 at 06:46:36PM +0800, Wei Ni wrote:
>> Add hw-trips sub-node for soctherm, which is
>> used to describe the hardware trip points for
>> each soctherm sensors.
>=20
> This seems like something that should be common. There was a hwmon=20
> binding just the other day with temperature set points.

I have checked the thermal_hwmon.c, but we can't use it. Because we use
of-thermal to register thermal zone, but it doesn't support to register=
 to
hwmon. And it only support to show the critical temperature.
I think this sub-node is used for Tegra's soctherm specifically. And it=
's not
only for shutdown/reset, it also will be used to describe the hw-thrott=
le
function in next serial patches (I'm preparing it, didn't send out yet)=
=2E

BTW, I didn't find the hwmon binding to introduce the hw trips in TOT
kernel-next, could you show me it?

>=20
>> Signed-off-by: Wei Ni <wni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>> ---
>>  .../devicetree/bindings/thermal/tegra-soctherm.txt | 24 +++++++++++=
+++++++++++
>>  1 file changed, 24 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/thermal/tegra-socther=
m.txt b/Documentation/devicetree/bindings/thermal/tegra-soctherm.txt
>> index 6b68cd150405..75dc9dbe7e1a 100644
>> --- a/Documentation/devicetree/bindings/thermal/tegra-soctherm.txt
>> +++ b/Documentation/devicetree/bindings/thermal/tegra-soctherm.txt
>> @@ -26,6 +26,15 @@ Required properties :
>>      of this property. See <dt-bindings/thermal/tegra124-soctherm.h>=
 for a
>>      list of valid values when referring to thermal sensors.
>> =20
>> +Optional properties:
>> +- hw-trip-points : A sub-node which is a container of hardware trip=
 points
>> +    for each sensors.
>> +  * sensors: Sub-nodes which are used to describe the HW trip point=
s info,
>> +        must be named as "cpu", "gpu", "mem", "pll".
>> +      Properties:
>> +      - thermtrip-temperature : Shutdown or reset temperature in mi=
llicelsius,
>> +        once the temperature of this sensor is higher than the
>> +        thermtrip-temperature, the system will be shutdown or reset=
=2E
>=20
> Append units and temperature is a bit redundant. Something like=20
> thermtrip-mC or thermtrip-milliC

Hmm, got it, will change it in next version.

>=20
> You could easily have multiple levels of trip points, so perhaps the=20
> name needs to reflect the action (i.e. shutdown).

This temperature can trigger shutdown or reset, it depends on the platf=
orm
design, and the Tegra's SPEC call it as thermtrip, so I use this name. =
I prefer
to use "thermtgrip-mC".

>=20
> Rob
>=20
