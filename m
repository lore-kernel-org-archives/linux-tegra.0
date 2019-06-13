From: Jon Hunter <jonathanh@nvidia.com>
Subject: Re: [PATCH v5 1/2] arm64: tegra: add ACONNECT, ADMA and AGIC nodes
Date: Thu, 13 Jun 2019 16:01:55 +0100
Message-ID: <97303572-48d5-3da6-6e60-51056c82b7fd@nvidia.com>
References: <1560422477-11242-1-git-send-email-spujar@nvidia.com>
 <3f1ebc62-1498-f26c-9044-8634242fc61e@nvidia.com>
 <9c5dbfc5-122b-2049-fdad-7ffeab6a9ec9@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <9c5dbfc5-122b-2049-fdad-7ffeab6a9ec9@nvidia.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Sameer Pujar <spujar@nvidia.com>, thierry.reding@gmail.com, robh+dt@kernel.org, mark.rutland@arm.com
Cc: mkumard@nvidia.com, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


On 13/06/2019 15:43, Sameer Pujar wrote:
>=20
> On 6/13/2019 7:39 PM, Jon Hunter wrote:
>> On 13/06/2019 11:41, Sameer Pujar wrote:
>>> Add DT nodes for following devices on Tegra186 and Tegra194
>>> =C2=A0 * ACONNECT
>>> =C2=A0 * ADMA
>>> =C2=A0 * AGIC
>>>
>>> Signed-off-by: Sameer Pujar <spujar@nvidia.com>
>>> ---
>>> =C2=A0 changes from previous revision
>>> =C2=A0=C2=A0 * fixed size value for ranges property in aconnect
>>>
>>> =C2=A0 arch/arm64/boot/dts/nvidia/tegra186.dtsi | 67
>>> ++++++++++++++++++++++++++++++++
>>> =C2=A0 arch/arm64/boot/dts/nvidia/tegra194.dtsi | 67
>>> ++++++++++++++++++++++++++++++++
>>> =C2=A0 2 files changed, 134 insertions(+)
>>>
>>> diff --git a/arch/arm64/boot/dts/nvidia/tegra186.dtsi
>>> b/arch/arm64/boot/dts/nvidia/tegra186.dtsi
>>> index 426ac0b..5e9fe7e 100644
>>> --- a/arch/arm64/boot/dts/nvidia/tegra186.dtsi
>>> +++ b/arch/arm64/boot/dts/nvidia/tegra186.dtsi
>>> @@ -1295,4 +1295,71 @@
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_=
LOW)>;
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 interrupt-parent=
 =3D <&gic>;
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 };
>>> +
>>> +=C2=A0=C2=A0=C2=A0 aconnect {
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 compatible =3D "nvidia,tegr=
a210-aconnect";
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 clocks =3D <&bpmp TEGRA186_=
CLK_APE>,
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 <&bpmp TEGRA186_CLK_APB2APE>;
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 clock-names =3D "ape", "apb=
2ape";
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 power-domains =3D <&bpmp TE=
GRA186_POWER_DOMAIN_AUD>;
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 #address-cells =3D <1>;
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 #size-cells =3D <1>;
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ranges =3D <0x02900000 0x0 =
0x02900000 0x200000>;
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 status =3D "disabled";
>>> +
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dma-controller@2930000 {
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 com=
patible =3D "nvidia,tegra186-adma";
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 reg=
 =3D <0x02930000 0x50000>;
>> Sorry but I have been double checking these register addresses and I
>> wonder if this should be a length of 0x10000. The 0x50000 includes all
>> the ranges where the registers are paged, so I don't think that this is
>> correct including these.
> Is it because we don't have virtualization support yet?

Yes those are for virtulisation, but I don't believe we need them here.

> and isn't the range 0x10000 covers only global register space, don't we
> want to include page1 ADMA channel registers. In that case it would be
> 0x20000.

Yes, 0x20000 is correct indeed

Cheers
Jon

--=20
nvpublic
