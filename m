From: Wei Ni <wni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH V1 10/10] ARM: tegra: set hw trips for Tegra124
Date: Fri, 15 Jan 2016 18:00:00 +0800
Message-ID: <5698C320.6050501@nvidia.com>
References: <1452672064-563-1-git-send-email-wni@nvidia.com> <20160113155708.GI2588@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160113155708.GI2588@ulmo>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: rui.zhang-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, mikko.perttunen-/1wQRMveznE@public.gmane.org, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org



On 2016=E5=B9=B401=E6=9C=8813=E6=97=A5 23:57, Thierry Reding wrote:
> * PGP Signed by an unknown key
>=20
> On Wed, Jan 13, 2016 at 04:01:04PM +0800, Wei Ni wrote:
>> Set hw trips for Tegra124.
>>
>> Signed-off-by: Wei Ni <wni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>> ---
>>  arch/arm/boot/dts/tegra124.dtsi | 9 +++++++++
>>  1 file changed, 9 insertions(+)
>>
>> diff --git a/arch/arm/boot/dts/tegra124.dtsi b/arch/arm/boot/dts/teg=
ra124.dtsi
>> index 68669f791c8b..c670d71a8f37 100644
>> --- a/arch/arm/boot/dts/tegra124.dtsi
>> +++ b/arch/arm/boot/dts/tegra124.dtsi
>> @@ -701,6 +701,15 @@
>>  		resets =3D <&tegra_car 78>;
>>  		reset-names =3D "soctherm";
>>  		#thermal-sensor-cells =3D <1>;
>> +
>> +		hw-trips {
>> +			cpu {
>> +				therm-temp =3D <103000>;
>> +			};
>> +			gpu {
>> +				therm-temp =3D <101000>;
>> +			};
>> +		};
>>  	};
>> =20
>>  	dfll: clock@0,70110000 {
>=20
> For Tegra210 you added a mem subnode, why doesn't Tegra124 have one l=
ike
> that?

Sorry, I made a mistake, I should remove the mem for Tegra210.

>=20
> Thierry
>=20
> * Unknown Key
> * 0x7F3EB3A1
>=20
