From: Jon Hunter <jonathanh@nvidia.com>
Subject: Re: [PATCH 1/2] arm64: tegra: add ACONNECT, ADMA and AGIC nodes
Date: Thu, 6 Jun 2019 08:06:57 +0100
Message-ID: <3b19a2bb-20a0-c650-49b7-d966585b5ba9@nvidia.com>
References: <1557143908-5850-1-git-send-email-spujar@nvidia.com>
 <9f9962fc-a261-aecc-b4c5-408a75ebcb5f@nvidia.com>
 <490b81d9-2734-bb93-303b-94bb20a4f6a5@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <490b81d9-2734-bb93-303b-94bb20a4f6a5@nvidia.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Sameer Pujar <spujar@nvidia.com>, thierry.reding@gmail.com, robh+dt@kernel.org, mark.rutland@arm.com
Cc: devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


On 06/06/2019 06:58, Sameer Pujar wrote:
>=20
> On 6/4/2019 2:37 PM, Jon Hunter wrote:
>> On 06/05/2019 12:58, Sameer Pujar wrote:
>>> Add DT nodes for following devices on Tegra186 and Tegra194
>>> =C2=A0 * ACONNECT
>>> =C2=A0 * ADMA
>>> =C2=A0 * AGIC
>>>
>>> Signed-off-by: Sameer Pujar <spujar@nvidia.com>
>>> ---
>>> =C2=A0 arch/arm64/boot/dts/nvidia/tegra186.dtsi | 67
>>> ++++++++++++++++++++++++++++++++
>>> =C2=A0 arch/arm64/boot/dts/nvidia/tegra194.dtsi | 67
>>> ++++++++++++++++++++++++++++++++
>>> =C2=A0 2 files changed, 134 insertions(+)
>>>
>>> diff --git a/arch/arm64/boot/dts/nvidia/tegra186.dtsi
>>> b/arch/arm64/boot/dts/nvidia/tegra186.dtsi
>>> index 6e2b6ce..2c432c9 100644
>>> --- a/arch/arm64/boot/dts/nvidia/tegra186.dtsi
>>> +++ b/arch/arm64/boot/dts/nvidia/tegra186.dtsi
>>> @@ -1153,4 +1153,71 @@
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_=
LOW)>;
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 interrupt-parent=
 =3D <&gic>;
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 };
>>> +
>>> +=C2=A0=C2=A0=C2=A0 aconnect@2a41000 {
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
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 #address-cells =3D <2>;
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 #size-cells =3D <2>;
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ranges;
>> My recollection is that non-empty range is preferred from what Rob told
>> me in the past. See the Tegra210 binding.
> I see at various places empty ranges property is used. From DT spec, it
> means
> there is no translation in the address space between parent/child.

Yes that is correct, but this is what Rob told me in the past ...

"Use of non-empty ranges is preferred though there is not much benefit
if the parent and child sizes are the same. However, it does also
limit what is a valid address for those child nodes."

So I think it is best to be consistent.

> Also I looked at Tegra210 binding,
> ranges =3D <0x702c0000 0x0 0x702c0000 0x00040000>;
> Should it be encoded as a triplet(child addr, parent addr, length)?
Right but remember the parent address is 2 cells, hence the 4 values.

Jon

--=20
nvpublic
