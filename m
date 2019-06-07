From: Vidya Sagar <vidyas@nvidia.com>
Subject: Re: [PATCH V8 13/15] phy: tegra: Add PCIe PIPE2UPHY support
Date: Fri, 7 Jun 2019 19:15:32 +0530
Message-ID: <5a5545c8-9e4c-b459-c40e-9e1c4e5daf5b@nvidia.com>
References: <20190526043751.12729-1-vidyas@nvidia.com>
 <20190526043751.12729-14-vidyas@nvidia.com>
 <c81c5d42-4292-ba6d-b5ab-afe1a604115f@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <c81c5d42-4292-ba6d-b5ab-afe1a604115f@gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>, lorenzo.pieralisi@arm.com, bhelgaas@google.com, robh+dt@kernel.org, mark.rutland@arm.com, thierry.reding@gmail.com, jonathanh@nvidia.com, kishon@ti.com, catalin.marinas@arm.com, will.deacon@arm.com, jingoohan1@gmail.com, gustavo.pimentel@synopsys.com
Cc: mperttunen@nvidia.com, linux-pci@vger.kernel.org, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kthota@nvidia.com, mmaddireddy@nvidia.com, sagar.tv@gmail.com
List-Id: linux-tegra@vger.kernel.org

On 6/6/2019 10:00 PM, Dmitry Osipenko wrote:
> 26.05.2019 7:37, Vidya Sagar =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>> Synopsys DesignWare core based PCIe controllers in Tegra 194 SoC interfa=
ce
>> with Universal PHY (UPHY) module through a PIPE2UPHY (P2U) module.
>> For each PCIe lane of a controller, there is a P2U unit instantiated at
>> hardware level. This driver provides support for the programming require=
d
>> for each P2U that is going to be used for a PCIe controller.
>>
>> Signed-off-by: Vidya Sagar <vidyas@nvidia.com>
>> ---
>> Changes since [v7]:
>> * Changed P2U driver file name from pcie-p2u-tegra194.c to phy-tegra194-=
p2u.c
>>
>> Changes since [v6]:
>> * None
>>
>> Changes since [v5]:
>> * Addressed review comments from Thierry
>>
>> Changes since [v4]:
>> * None
>>
>> Changes since [v3]:
>> * Rebased on top of linux-next top of the tree
>>
>> Changes since [v2]:
>> * Replaced spaces with tabs in Kconfig file
>> * Sorted header file inclusion alphabetically
>>
>> Changes since [v1]:
>> * Added COMPILE_TEST in Kconfig
>> * Removed empty phy_ops implementations
>> * Modified code according to DT documentation file modifications
>>
>>   drivers/phy/tegra/Kconfig            |   7 ++
>>   drivers/phy/tegra/Makefile           |   1 +
>>   drivers/phy/tegra/phy-tegra194-p2u.c | 109 +++++++++++++++++++++++++++
>>   3 files changed, 117 insertions(+)
>>   create mode 100644 drivers/phy/tegra/phy-tegra194-p2u.c
>>
>> diff --git a/drivers/phy/tegra/Kconfig b/drivers/phy/tegra/Kconfig
>> index a3b1de953fb7..c56fc8452e03 100644
>> --- a/drivers/phy/tegra/Kconfig
>> +++ b/drivers/phy/tegra/Kconfig
>> @@ -6,3 +6,10 @@ config PHY_TEGRA_XUSB
>>  =20
>>   	  To compile this driver as a module, choose M here: the module will
>>   	  be called phy-tegra-xusb.
>> +
>> +config PHY_TEGRA194_P2U
>> +	tristate "NVIDIA Tegra194 PIPE2UPHY PHY driver"
>> +	depends on ARCH_TEGRA || COMPILE_TEST
>=20
> ARCH_TEGRA is a bit too much, ARCH_TEGRA_194_SOC should fit better here.
>=20
Ok. I'll take care of it in the next patch series.
