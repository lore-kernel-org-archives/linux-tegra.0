From: Jon Hunter <jonathanh@nvidia.com>
Subject: Re: [PATCH AUTOSEL 4.14 41/60] PCI: tegra: Enable Relaxed Ordering
 only for Tegra20 & Tegra30
Date: Fri, 19 Jul 2019 09:33:11 +0100
Message-ID: <838a6940-2a37-b91b-d522-8b154f3c71d7@nvidia.com>
References: <20190719041109.18262-1-sashal@kernel.org>
 <20190719041109.18262-41-sashal@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <stable-owner@vger.kernel.org>
In-Reply-To: <20190719041109.18262-41-sashal@kernel.org>
Content-Language: en-US
Sender: stable-owner@vger.kernel.org
To: Sasha Levin <sashal@kernel.org>, linux-kernel@vger.kernel.org, stable@vger.kernel.org, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Cc: Vidya Sagar <vidyas@nvidia.com>, Thierry Reding <treding@nvidia.com>, linux-pci@vger.kernel.org, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Hi Lorenzo,

We have not requested that this is added to stable yet, however, has
been picked up. Do we wish to let it soak in mainline for a release
first? If so maybe we can ask Sasha to drop this for now.

Cheers
Jon

On 19/07/2019 05:10, Sasha Levin wrote:
> From: Vidya Sagar <vidyas@nvidia.com>
> 
> [ Upstream commit 7be142caabc4780b13a522c485abc806de5c4114 ]
> 
> The PCI Tegra controller conversion to a device tree configurable
> driver in commit d1523b52bff3 ("PCI: tegra: Move PCIe driver
> to drivers/pci/host") implied that code for the driver can be
> compiled in for a kernel supporting multiple platforms.
> 
> Unfortunately, a blind move of the code did not check that some of the
> quirks that were applied in arch/arm (eg enabling Relaxed Ordering on
> all PCI devices - since the quirk hook erroneously matches PCI_ANY_ID
> for both Vendor-ID and Device-ID) are now applied in all kernels that
> compile the PCI Tegra controlled driver, DT and ACPI alike.
> 
> This is completely wrong, in that enablement of Relaxed Ordering is only
> required by default in Tegra20 platforms as described in the Tegra20
> Technical Reference Manual (available at
> https://developer.nvidia.com/embedded/downloads#?search=tegra%202 in
> Section 34.1, where it is mentioned that Relaxed Ordering bit needs to
> be enabled in its root ports to avoid deadlock in hardware) and in the
> Tegra30 platforms for the same reasons (unfortunately not documented
> in the TRM).
> 
> There is no other strict requirement on PCI devices Relaxed Ordering
> enablement on any other Tegra platforms or PCI host bridge driver.
> 
> Fix this quite upsetting situation by limiting the vendor and device IDs
> to which the Relaxed Ordering quirk applies to the root ports in
> question, reported above.
> 
> Signed-off-by: Vidya Sagar <vidyas@nvidia.com>
> [lorenzo.pieralisi@arm.com: completely rewrote the commit log/fixes tag]
> Signed-off-by: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
> Acked-by: Thierry Reding <treding@nvidia.com>
> Signed-off-by: Sasha Levin <sashal@kernel.org>
> ---
>  drivers/pci/host/pci-tegra.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/pci/host/pci-tegra.c b/drivers/pci/host/pci-tegra.c
> index 1987fec1f126..d2ad76ef3e83 100644
> --- a/drivers/pci/host/pci-tegra.c
> +++ b/drivers/pci/host/pci-tegra.c
> @@ -607,12 +607,15 @@ DECLARE_PCI_FIXUP_EARLY(PCI_VENDOR_ID_NVIDIA, 0x0bf1, tegra_pcie_fixup_class);
>  DECLARE_PCI_FIXUP_EARLY(PCI_VENDOR_ID_NVIDIA, 0x0e1c, tegra_pcie_fixup_class);
>  DECLARE_PCI_FIXUP_EARLY(PCI_VENDOR_ID_NVIDIA, 0x0e1d, tegra_pcie_fixup_class);
>  
> -/* Tegra PCIE requires relaxed ordering */
> +/* Tegra20 and Tegra30 PCIE requires relaxed ordering */
>  static void tegra_pcie_relax_enable(struct pci_dev *dev)
>  {
>  	pcie_capability_set_word(dev, PCI_EXP_DEVCTL, PCI_EXP_DEVCTL_RELAX_EN);
>  }
> -DECLARE_PCI_FIXUP_FINAL(PCI_ANY_ID, PCI_ANY_ID, tegra_pcie_relax_enable);
> +DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_NVIDIA, 0x0bf0, tegra_pcie_relax_enable);
> +DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_NVIDIA, 0x0bf1, tegra_pcie_relax_enable);
> +DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_NVIDIA, 0x0e1c, tegra_pcie_relax_enable);
> +DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_NVIDIA, 0x0e1d, tegra_pcie_relax_enable);
>  
>  static int tegra_pcie_request_resources(struct tegra_pcie *pcie)
>  {
> 

-- 
nvpublic
