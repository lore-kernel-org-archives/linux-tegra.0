From: Manikanta Maddireddy <mmaddireddy-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH V8 0/4] Add loadable kernel module and power management support
Date: Tue, 13 Feb 2018 20:54:06 +0530
Message-ID: <1518535450-24400-1-git-send-email-mmaddireddy@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org, cyndis-/1wQRMveznE@public.gmane.org
Cc: jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, vidyas-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, kthota-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, Manikanta Maddireddy <mmaddireddy-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

This series of patches adds loadable kernel module and power management
support to Tegra PCIe host controller driver. irq_set_msi_desc() and
tegra_cpuidle_pcie_irqs_in_use() symbols will be taken care in next
set of patches.

These patches are tested on Jetson TK1, TX1 and TX2 platforms, following
are the verification details.
	- Multiple module insert & remove
	- PCIe device functionality after module insert
	- Free clock, resets, regulators, powergate, iomem and interrupt
	resources after module remove
	- PCIe device functionality after resume from RAM

V2: PM QoS fix is dropped in V2 from this series because the fix is
incorporated in latest 'commit 0759e80b84e3 ("PM / QoS: Fix device resume
latency framework")'. Update commit message of few patches in V2.

V3: Patches to export irq_set_msi_desc() and tegra_cpuidle_pcie_irqs_in_use()
are dropped based on review comments. These symbols will be addressed in next
series. Took care of few other review comments.

V4: Dropped pci_find_host_bridge() export patch and added new patch to use
bus->sysdata for private data.

V5: Decouple from https://patchwork.ozlabs.org/patch/832053/ and rebase
on top of linux-next

V6: Rebased on lpieralisi/pci/tegra branch

V7: Addressed comments on patch: 6 and 7 in V6
Limiting this series to linux-tegra & linux-pci since patches for other 
subsystem are merged or dropped

V8: Since LKM is not completely implemented changing PCI_TEGRA config
back to bool

Manikanta Maddireddy (4):
  PCI: tegra: Free resources on probe failure
  PCI: tegra: Add loadable kernel module support
  PCI: tegra: Broadcast PME_Turn_Off message before link goes to L2
  PCI: tegra: Add power management support

 drivers/pci/host/pci-tegra.c | 354 +++++++++++++++++++++++++++++++++----------
 1 file changed, 278 insertions(+), 76 deletions(-)

-- 
2.1.4
