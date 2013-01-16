From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH v2 03/10] ARM: dt: tegra30: Add clock information
Date: Wed, 16 Jan 2013 10:28:15 -0700
Message-ID: <50F6E32F.80602@wwwdotorg.org>
References: <1357891289-23500-1-git-send-email-pgaikwad@nvidia.com> <1357891289-23500-3-git-send-email-pgaikwad@nvidia.com> <50F65E4B.8040409@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <50F65E4B.8040409-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?ISO-8859-1?Q?Terje_Bergstr=F6m?= <tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Prashant Gaikwad <pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 01/16/2013 01:01 AM, Terje Bergstr=F6m wrote:
> On 11.01.2013 10:01, Prashant Gaikwad wrote:
>> diff --git a/arch/arm/boot/dts/tegra30.dtsi b/arch/arm/boot/dts/tegr=
a30.dtsi
>> index 6765646..c3e129a 100644
>> --- a/arch/arm/boot/dts/tegra30.dtsi
>> +++ b/arch/arm/boot/dts/tegra30.dtsi
>>  		gr3d {
>>  			compatible =3D "nvidia,tegra30-gr3d";
>>  			reg =3D <0x54180000 0x00040000>;
>> +			clocks =3D <&tegra_car 24>;
>>  		};
>=20
> In Tegra3, 3D has two clocks. I believe you'd need to add <&tegra_car
> 98> here.

Thanks. I've squashed the following into the patch. Do those clock name=
s
make sense to you?

diff --git a/arch/arm/boot/dts/tegra30.dtsi b/arch/arm/boot/dts/tegra30=
=2Edtsi
index b9709ae..c26d75b 100644
--- a/arch/arm/boot/dts/tegra30.dtsi
+++ b/arch/arm/boot/dts/tegra30.dtsi
@@ -54,7 +54,8 @@
                gr3d {
                        compatible =3D "nvidia,tegra30-gr3d";
                        reg =3D <0x54180000 0x00040000>;
-                       clocks =3D <&tegra_car 24>;
+                       clocks =3D <&tegra_car 24 &tegra_car 98>;
+                       clock-names =3D "3d", "3d2";
                };

                dc@54200000 {
