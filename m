From: Wei Ni <wni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH V3 07/11] of: Add bindings of hw-trips for soctherm
Date: Mon, 25 Jan 2016 13:53:23 +0800
Message-ID: <56A5B853.3070609@nvidia.com>
References: <1453111448-12445-1-git-send-email-wni@nvidia.com> <20160121145251.GD32301@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160121145251.GD32301@ulmo>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: rui.zhang-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, MLongnecker-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, mikko.perttunen-/1wQRMveznE@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org



On 2016=E5=B9=B401=E6=9C=8821=E6=97=A5 22:52, Thierry Reding wrote:
> * PGP Signed by an unknown key
>=20
> On Mon, Jan 18, 2016 at 06:04:08PM +0800, Wei Ni wrote:
>> Add hw-trips sub-node for soctherm, which is
>> used to describe the hardware trip points for
>> each soctherm sensors.
>=20
> Please make use of the full 78 characters in each line. Otherwise loo=
ks
> good to me.

Ok, I will check it again.

>=20
> Oh, also make sure to Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org on device tree
> binding patches. Doing that now, hence quoting verbatim.

Sure, will do it.

>=20
> Thierry
>=20
>>
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
>> =20
>>  Example :
>> =20
>> @@ -40,6 +49,21 @@ Example :
>>  		reset-names =3D "soctherm";
>> =20
>>  		#thermal-sensor-cells =3D <1>;
>> +
>> +		hw-trip-points {
>> +			cpu {
>> +				thermtrip-temperature =3D <103000>;
>> +			};
>> +			gpu {
>> +				thermtrip-temperature =3D <103500>;
>> +			};
>> +			mem {
>> +				thermtrip-temperature =3D <103500>;
>> +			};
>> +			pll {
>> +				thermtrip-temperature =3D <105000>;
>> +			};
>> +		};
>>  	};
>> =20
>>  Example: referring to thermal sensors :
>> --=20
>> 1.9.1
>>
>=20
> * Unknown Key
> * 0x7F3EB3A1
>=20
