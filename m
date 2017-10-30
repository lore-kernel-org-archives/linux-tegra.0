From: Manikanta Maddireddy <mmaddireddy@nvidia.com>
Subject: Re: [PATCH V2 01/12] PCI: tegra: Start LTSSM after programming root
 port
Date: Mon, 30 Oct 2017 16:06:24 +0530
Message-ID: <42a902fb-1481-9fd3-77c7-e18d0d0c306d@nvidia.com>
References: <1509337143-25963-1-git-send-email-mmaddireddy@nvidia.com>
 <1509337143-25963-2-git-send-email-mmaddireddy@nvidia.com>
 <5911b4d5-cc54-9fed-f6be-5c9b7ca05c2e@kapsi.fi>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-pci-owner@vger.kernel.org>
In-Reply-To: <5911b4d5-cc54-9fed-f6be-5c9b7ca05c2e@kapsi.fi>
Content-Language: en-US
Sender: linux-pci-owner@vger.kernel.org
To: Mikko Perttunen <cyndis@kapsi.fi>, thierry.reding@gmail.com, bhelgaas@google.com, jonathanh@nvidia.com, vidyas@nvidia.com
Cc: linux-tegra@vger.kernel.org, linux-pci@vger.kernel.org, kthota@nvidia.com
List-Id: linux-tegra@vger.kernel.org



On 30-Oct-17 2:38 PM, Mikko Perttunen wrote:
> On 30.10.2017 06:18, Manikanta Maddireddy wrote:
>> This patch ensures that LTSSM is started (by deasserting pcie_xrst) only
>> after all the required root port register programming is completed.
>>
>> Signed-off-by: Manikanta Maddireddy <mmaddireddy@nvidia.com>
>> ---
>> V2:
>> * no change in this patch
>>
>>  drivers/pci/host/pci-tegra.c | 9 +++++----
>>  1 file changed, 5 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/pci/host/pci-tegra.c b/drivers/pci/host/pci-tegra.c
>> index 96e8038c3019..b41c60c7414c 100644
>> --- a/drivers/pci/host/pci-tegra.c
>> +++ b/drivers/pci/host/pci-tegra.c
>> @@ -1024,9 +1024,6 @@ static int tegra_pcie_enable_controller(struct tegra_pcie *pcie)
>>          }
>>      }
>>
>> -    /* take the PCIe interface module out of reset */
>> -    reset_control_deassert(pcie->pcie_xrst);
>> -
>>      /* finally enable PCIe */
>>      value = afi_readl(pcie, AFI_CONFIGURATION);
>>      value |= AFI_CONFIGURATION_EN_FPCI;
>> @@ -1065,7 +1062,6 @@ static void tegra_pcie_power_off(struct tegra_pcie *pcie)
>>              dev_err(dev, "failed to power off PHY(s): %d\n", err);
>>      }
>>
>> -    reset_control_assert(pcie->pcie_xrst);
> 
> Why is this change being made? Is there a reason we cannot leave this reset asserted when the controller is powered off?
In this change I moved deassert pcie_xrst to tegra_pcie_enable_ports. tegra_pcie_power_off() will not come into picture after deasserting pcie xrst.
So this asserting pcie xrst redundant now.
> 
>>      reset_control_assert(pcie->afi_rst);
>>      reset_control_assert(pcie->pex_rst);
>>
>> @@ -2116,7 +2112,12 @@ static void tegra_pcie_enable_ports(struct tegra_pcie *pcie)
>>               port->index, port->lanes);
>>
>>          tegra_pcie_port_enable(port);
>> +    }
>>
>> +    /* take the PCIe interface module out of reset */
>> +    reset_control_deassert(pcie->pcie_xrst);
>> +
>> +    list_for_each_entry_safe(port, tmp, &pcie->ports, list) {
>>          if (tegra_pcie_port_check_link(port))
>>              continue;
>>
>>
