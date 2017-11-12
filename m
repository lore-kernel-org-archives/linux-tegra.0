From: Vidya Sagar <vidyas-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH V3 0/3] Add ASPM-L1 Substates support for Tegra
Date: Sun, 12 Nov 2017 18:47:51 +0530
Message-ID: <1510492674-12786-1-git-send-email-vidyas@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kthota-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, mmaddireddy-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, vidyas-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Tegra chips T210 and T186 support ASPM-L1 Substates (i.e. L1.1 and L1.2)
This patch series
- applies fixups to reflect correct capability values for
  T_cmrt (Common Mode Restore Time) and
  T_pwr_on (Power On)
  and adjusts counter values for 19.2 MHz of clk_m
- applies fixup specific to T210 to avoid unnecessary wake ups from L1.2 state
- enables advertisement of ASPM-L1 support in capability register

NOTE:- This version of patch series drops a patch (that was present till V2 series)
that introduces an API for host controller drivers to specify LTR_L1.2_THRESHOLD
value as more details and better understanding of spec is required to program
LTR_L1.2_THRESHOLD value.
It also reorders patches to appropriately have software fixups and advertisement
of capabilities

PCIe - ASPM L1 Sub States spec
https://pcisig.com/sites/default/files/specification_documents/ECN_L1_PM_Substates_with_CLKREQ_31_May_2013_Rev10a.pdf

Testing Done on T210 and T186
- ASPM-L1:
  Verified ASPM-L1 enablement by selecting PCIEASPM_POWERSAVE config
  With the help of Tegra rootport's internal counter registers, confirmed
  link entry in and out of ASPM-L1 state using USB3.0 add-on card, NVMe and NIC
  cards
- ASPM-L1 SubStates:
  Verified ASPM-L1 Substates enablement by selecting PCIEASPM_POWER_SUPERSAVE config
  Confirmed link's entry into L1SS using Westren Digital NVMe card (with Sandisk
  Controller) using Tegra rootport's internal counter registers

Vidya Sagar (3):
  PCI: tegra: Apply sw fixups to support ASPM-L1 Sub-States
  PCI: tegra: fixups to avoid unnecessary wakeup from ASPM-L1.2
  PCI: tegra: Enable ASPM-L1 capability advertisement

 drivers/pci/host/pci-tegra.c | 93 ++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 93 insertions(+)

-- 
2.7.4
