From: Manikanta Maddireddy <mmaddireddy-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [RFC] PCI: tegra: Revert raw_violation_fixup for tegra124
Date: Mon, 20 Apr 2020 23:45:23 +0530
Message-ID: <680b456a-b1ed-45f6-aa38-6ec49783af6d@nvidia.com>
References: <20200420164304.28810-1-kwizart@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200420164304.28810-1-kwizart-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Nicolas Chauvet <kwizart-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Lorenzo Pieralisi <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Thank you Nicolas for identifying the patch which caused the CmpltTO.

Little background on the fixup,
 In the internal testing with dGPU on Tegra124, CmplTO is reported by
dGPU. This happened because FIFO queue in AFI(AXI to PCIe) module
get full by upstream posted writes. Back to back upstream writes 
interleaved with infrequent reads, triggers RAW violation and CmpltTO.
This is fixed by reducing the posted write credits and by changing
updateFC timer frequency. These settings are fixed after stress test.

In the current case, RTL NIC is also reporting CmplTO. These settings
seems to be aggravating the issue instead of fixing it.


On 20-Apr-20 10:13 PM, Nicolas Chauvet wrote:
> External email: Use caution opening links or attachments
>
>
> As reported in https://bugzilla.kernel.org/206217 , raw_violation_fixup
> is causing more harm than good in some common use-cases.
>
> This patch as RFC is a partial revert of the 191cd6fb5 commit:
>  "PCI: tegra: Add SW fixup for RAW violations"
> that was first introduced in 5.3 kernel.
> This fix the following regression since then.
>
>
> When using both the network NIC and I/O on MMC this can lead to the
> following message on jetson-tk1:
>
>  NETDEV WATCHDOG: enp1s0 (r8169): transmit queue 0 timed out
>
> and
>
>  pcieport 0000:00:02.0: AER: Uncorrected (Non-Fatal) error received: 0000:01:00.0
>  r8169 0000:01:00.0: AER: PCIe Bus Error: severity=Uncorrected (Non-Fatal), type=Transaction Layer, (Requester ID)
>  r8169 0000:01:00.0: AER:   device [10ec:8168] error status/mask=00004000/00400000
>  r8169 0000:01:00.0: AER:    [14] CmpltTO                (First)
>  r8169 0000:01:00.0: AER: can't recover (no error_detected callback)
>  pcieport 0000:00:02.0: AER: device recovery failed
>
>
> After that, the ethernet NIC isn't functional anymore even after reloading
> the module.
> After a reboot, this is reproducible by copying a large file over the
> ethernet NIC to the MMC.
> For some reasons this cannot be reproduced when the same file is copied
> to a tmpfs.
>
>
> This patch is RFC because it requires more understanding from Nvidia.
>  - Is the fixup (available in l4t downstrem) still needed for upstream ?
>  - Is there a need to update the fixup values for upstream ?
>  - If the fixup is reverted, does the hw bug can still be seen with
>    upstream ?

Downstream patch is created after multiple stress tests. I am not sure
why these settings are aggravating the issue instead of fixing it.
I need to reproduce the issue and check if upstream driver is missing
anything else for this issue.
Jetson-TK1 is the only embedded product with Tegra124, it has only
RTL NIC PCIe endpoint soldered on board. I think this revert should
be merged to fix this issue until we find exact root cause.

>
> Others can also provides more understanding:
>  - Conditions to reproduce the bug (or not)...
>
>
> Signed-off-by: Nicolas Chauvet <kwizart-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>  drivers/pci/controller/pci-tegra.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/pci/controller/pci-tegra.c b/drivers/pci/controller/pci-tegra.c
> index 3e64ba6a36a8..4027e074094a 100644
> --- a/drivers/pci/controller/pci-tegra.c
> +++ b/drivers/pci/controller/pci-tegra.c
> @@ -2470,7 +2470,7 @@ static const struct tegra_pcie_soc tegra124_pcie = {
>         .program_uphy = true,
>         .update_clamp_threshold = true,
>         .program_deskew_time = false,
> -       .raw_violation_fixup = true,
> +       .raw_violation_fixup = false,
>         .update_fc_timer = false,
>         .has_cache_bars = false,
>         .ectl.enable = false,
> --
> 2.25.2
>
Reviewed-by: Manikanta Maddireddy <mmaddireddy-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
