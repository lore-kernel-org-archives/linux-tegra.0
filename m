From: Jon Hunter <jonathanh@nvidia.com>
Subject: Re: [PATCH v2 2/2] arm64: tegra: enable ACONNECT, ADMA and AGIC
Date: Wed, 12 Jun 2019 14:01:18 +0100
Message-ID: <30df3490-a263-233f-3775-b719d76e3302@nvidia.com>
References: <1560243406-2535-1-git-send-email-spujar@nvidia.com>
 <1560243406-2535-2-git-send-email-spujar@nvidia.com>
 <4e017e97-8a05-c1fe-2cd9-b985e79d02a1@nvidia.com>
 <ce8e26f7-4ed0-a5a4-821b-fdfa3a7e334e@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <ce8e26f7-4ed0-a5a4-821b-fdfa3a7e334e@nvidia.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Sameer Pujar <spujar@nvidia.com>, thierry.reding@gmail.com, robh+dt@kernel.org, mark.rutland@arm.com
Cc: mkumard@nvidia.com, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


On 12/06/2019 13:44, Sameer Pujar wrote:
>=20
> On 6/12/2019 6:07 PM, Jon Hunter wrote:
>>
>> On 11/06/2019 09:56, Sameer Pujar wrote:
>>> Enable ACONNECT, ADMA and AGIC devices for following platforms
>>> =C2=A0=C2=A0 * Jetson TX2
>>> =C2=A0=C2=A0 * Jetson Xavier
>>>
>>> Verified driver probe path and devices get registered fine.
>>>
>>> Signed-off-by: Sameer Pujar <spujar@nvidia.com>
>>> ---
>>> =C2=A0 arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dts | 12 ++++++++=
++++
>>> =C2=A0 arch/arm64/boot/dts/nvidia/tegra194-p2972-0000.dts | 12 ++++++++=
++++
>>> =C2=A0 2 files changed, 24 insertions(+)
>>>
>>> diff --git a/arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dts
>>> b/arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dts
>>> index 5102de1..b818355 100644
>>> --- a/arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dts
>>> +++ b/arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dts
>>> @@ -298,4 +298,16 @@
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 vin-supply =3D <&vdd_5v0_sys>;
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 };
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 };
>>> +
>>> +=C2=A0=C2=A0=C2=A0 aconnect@2a41000 {
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 status =3D "okay";
>>> +
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dma-controller@2930000 {
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sta=
tus =3D "okay";
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 };
>>> +
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 agic@2a41000 {
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sta=
tus =3D "okay";
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 };
>>> +=C2=A0=C2=A0=C2=A0 };
>>> =C2=A0 };
>>> diff --git a/arch/arm64/boot/dts/nvidia/tegra194-p2972-0000.dts
>>> b/arch/arm64/boot/dts/nvidia/tegra194-p2972-0000.dts
>>> index 6e6df65..d1cc028 100644
>>> --- a/arch/arm64/boot/dts/nvidia/tegra194-p2972-0000.dts
>>> +++ b/arch/arm64/boot/dts/nvidia/tegra194-p2972-0000.dts
>>> @@ -167,4 +167,16 @@
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 };
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 };
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 };
>>> +
>>> +=C2=A0=C2=A0=C2=A0 aconnect@2a41000 {
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 status =3D "okay";
>>> +
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dma-controller@2930000 {
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sta=
tus =3D "okay";
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 };
>>> +
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 agic@2a41000 {
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sta=
tus =3D "okay";
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 };
>>> +=C2=A0=C2=A0=C2=A0 };
>>> =C2=A0 };
>>>
>> I believe that I have already ACK'ed this, so please include for the
>> next revision.
> There is a small change related to dma node.
> Will include ACK in the next revision.

OK. I had assumed there was no change. Ah the 'dma-controller' name!

Usually you should list the changes for each revision under the '---'
beneath the signed-off line so people can see if there are any changes.

Cheers
Jon

--=20
nvpublic
