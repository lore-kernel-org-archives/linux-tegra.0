From: Vidya Sagar <vidyas-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v1 0/2] PCI/ASPM: Refine L1 PM Substates support
Date: Tue, 5 Dec 2017 00:38:50 +0530
Message-ID: <d462c519-3af0-d763-063d-62839f15ec29@nvidia.com>
References: <20171202211833.23146.5744.stgit@bhelgaas-glaptop.roam.corp.google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171202211833.23146.5744.stgit-1RhO1Y9PlrlHTL0Zs8A6p5iNqAH0jzoTYJqu5kTmcBRl57MIdRCFDg@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Bjorn Helgaas <helgaas-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Kenji Chen <kenji.chen-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Manikanta Maddireddy <mmaddireddy-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, David Daney <david.daney-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org>, Krishna Kishore <kthota-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Julia Lawall <Julia.Lawall-L2FTfq7BK8M@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Patrick Georgi <pgeorgi-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Rajat Jain <rajatja-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Yinghai Lu <yinghai-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Stefan Reinauer <stefan.reinauer-7ChRSZmxDtxg9hUCZPvPmw@public.gmane.org>, Duncan Laurie <dlaurie-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Reviewed-by: Vidya Sagar <vidyas-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

On Sunday 03 December 2017 03:15 AM, Bjorn Helgaas wrote:
> The PCIe active link power state is L0.  ASPM defines two low-power
> states: L0s and L1.  The L1 PM Substates feature defines two
> additional low-power states: L1.1 and L2.2.
>
> The L1.2 state may have substantial entry/exit latency.  Downstream
> devices can use the Latency Tolerance Reporting (LTR) feature to
> report how much latency they can tolerate.  The L1 PM Substates
> capability includes a programmable L1.2 threshold register.  If the
> downstream devices can tolerate the latency indicated by the
> threshold, L1.2 may be used.
>
> If LTR is not enabled, the L1.2 threshold is ignored and L1.2 can be
> used whenever it is enabled and CLKREQ# is de-asserted.  Linux
> currently never enables LTR, but firmware may have done so.
>
> The current L1 PM substates support in Linux sets the L1.2 threshold
> to a fixed value (163.84us) copied from coreboot [1].  I don't know
> where that value came from, and it is incorrect for some platforms,
> e.g., Tegra [2].
>
> These patches change that so we calculate the L1.2 threshold based on
> values reported by the hardware, and we enable LTR whenever possible.
>
> This is all just my understanding from reading the spec.  I'd be glad
> to be corrected if I'm going wrong.
>
> I'm particularly puzzled about the coreboot code in
> pciexp_L1_substate_commit() that sets LTR_L1.2_THRESHOLD:
>
> +	pcie_update_cfg(root, root_cap + 0x08, ~0xe3ff0000,
> +		(1 << 21) | (1 << 23) | (1 << 30));
>
> This is writing the L1 PM Substates Control 1 register, but the shifts
> don't match up with any of the fields in the register, so this is an
> awfully funny way to write the threshold.
>
> [1] https://mail.coreboot.org/pipermail/coreboot-gerrit/2015-March/021134.html
> [2] https://lkml.kernel.org/r/1510492674-12786-1-git-send-email-vidyas-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
>
> ---
>
> Bjorn Helgaas (2):
>        PCI/ASPM: Calculate LTR_L1.2_THRESHOLD from device characteristics
>        PCI/ASPM: Enable Latency Tolerance Reporting when supported
>
>
>   drivers/pci/pcie/aspm.c |   71 +++++++++++++++++++++++++++++++----------------
>   drivers/pci/probe.c     |   33 ++++++++++++++++++++++
>   include/linux/pci.h     |    2 +
>   3 files changed, 82 insertions(+), 24 deletions(-)
