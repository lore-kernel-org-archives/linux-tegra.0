From: Vidya Sagar <vidyas-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH V4 0/5] Add support for PCIe endpoint mode in Tegra194
Date: Tue, 10 Mar 2020 23:12:35 +0530
Message-ID: <b47de9cd-be18-1672-d72c-de4169fb90e5@nvidia.com>
References: <20200303105418.2840-1-vidyas@nvidia.com>
 <20200303170103.GA9641@e121166-lin.cambridge.arm.com>
 <d1e3a42f-c179-fd03-fac0-7cd449580e5b@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <d1e3a42f-c179-fd03-fac0-7cd449580e5b-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lorenzo Pieralisi <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>
Cc: bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, andrew.murray-5wv7dgnIgG8@public.gmane.org, kishon-l0cyMroinI0@public.gmane.org, gustavo.pimentel-HKixBCOQz3hWk0Htik3J/w@public.gmane.org, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, kthota-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, mmaddireddy-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, sagar.tv-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: linux-tegra@vger.kernel.org



On 3/3/2020 11:43 PM, Vidya Sagar wrote:
>=20
>=20
> On 3/3/2020 10:31 PM, Lorenzo Pieralisi wrote:
>> External email: Use caution opening links or attachments
>>
>>
>> On Tue, Mar 03, 2020 at 04:24:13PM +0530, Vidya Sagar wrote:
>>> Tegra194 has three (C0, C4 & C5) dual mode PCIe controllers that can=20
>>> operate
>>> either in root port mode or in end point mode but only in one mode at=20
>>> a time.
>>> Platform P2972-0000 supports enabling endpoint mode for C5=20
>>> controller. This
>>> patch series adds support for PCIe endpoint mode in both the driver=20
>>> as well as
>>> in DT.
>>> This patch series depends on the changes made for Synopsys DesignWare=20
>>> endpoint
>>> mode subsystem that are recently accepted.
>>> @ https://patchwork.kernel.org/project/linux-pci/list/?series=3D202211
>>> which in turn depends on the patch made by Kishon
>>> @ https://patchwork.kernel.org/patch/10975123/
>>> which is also under review.
>>>
>>> V4:
>>> * Started using threaded irqs instead of kthreads
>>
>> Hi Vidya,
>>
>> sorry for the bother, may I ask you to rebase the series (after
>> answering Thierry's query) on top of my pci/endpoint branch please ?
>>
>> Please resend it and I will merge patches {1,2,5} then.
> Sure.
> I just sent V5 series rebasing patches on top of your pci/endpoint branch=
.
Hi,
Sorry to bother you again.
Could you please take a look at V5 series?

Thanks,
Vidya Sagar
>=20
> Thanks,
> Vidya Sagar
>>
>> Thanks,
>> Lorenzo
>>
>>> V3:
>>> * Re-ordered patches in the series to make the driver change as the=20
>>> last patch
>>> * Took care of Thierry's review comments
>>>
>>> V2:
>>> * Addressed Thierry & Bjorn's review comments
>>> * Added EP mode specific binding documentation to already existing=20
>>> binding documentation file
>>> * Removed patch that enables GPIO controller nodes explicitly as they=20
>>> are enabled already
>>>
>>> Vidya Sagar (5):
>>> =C2=A0=C2=A0 soc/tegra: bpmp: Update ABI header
>>> =C2=A0=C2=A0 dt-bindings: PCI: tegra: Add DT support for PCIe EP nodes =
in Tegra194
>>> =C2=A0=C2=A0 arm64: tegra: Add PCIe endpoint controllers nodes for Tegr=
a194
>>> =C2=A0=C2=A0 arm64: tegra: Add support for PCIe endpoint mode in P2972-=
0000
>>> =C2=A0=C2=A0=C2=A0=C2=A0 platform
>>> =C2=A0=C2=A0 PCI: tegra: Add support for PCIe endpoint mode in Tegra194
>>>
>>> =C2=A0 .../bindings/pci/nvidia,tegra194-pcie.txt=C2=A0=C2=A0=C2=A0=C2=
=A0 | 125 +++-
>>> =C2=A0 .../boot/dts/nvidia/tegra194-p2972-0000.dts=C2=A0=C2=A0 |=C2=A0 =
18 +
>>> =C2=A0 arch/arm64/boot/dts/nvidia/tegra194.dtsi=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 |=C2=A0 99 +++
>>> =C2=A0 drivers/pci/controller/dwc/Kconfig=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 30 +-
>>> =C2=A0 drivers/pci/controller/dwc/pcie-tegra194.c=C2=A0=C2=A0=C2=A0 | 6=
81 +++++++++++++++++-
>>> =C2=A0 include/soc/tegra/bpmp-abi.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 =
10 +-
>>> =C2=A0 6 files changed, 918 insertions(+), 45 deletions(-)
>>>
>>> --=20
>>> 2.17.1
>>>
