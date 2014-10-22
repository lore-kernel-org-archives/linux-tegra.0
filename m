From: Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v4] PCI: tegra: add PM-ops support
Date: Wed, 22 Oct 2014 17:09:36 -0600
Message-ID: <20141022230936.GB4795@google.com>
References: <1413193803-21718-1-git-send-email-vidyas@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1413193803-21718-1-git-send-email-vidyas-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Vidya Sagar <vidyas-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, kthota-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Mon, Oct 13, 2014 at 03:20:03PM +0530, Vidya Sagar wrote:
> adds support for suspend_noirq and resume_noirq hooks
> of PM framework. Enables powergating of PCIe partition during
> suspend.
> It also separates allocation part from
> tegra_pcie_enable_msi() to make a new API tegra_pcie_alloc_msi()
> to avoid passing extra param in the original API

This sounds like it should be two separate patches (a changelog that says
"It also ..." is a good clue).

Maybe even three patches -- the additions in tegra_pcie_power_off() look
like they are separable from the dev_pm_ops addition, because
tegra_pcie_power_off() is already present and used even before you add
dev_pm_ops.

Generally, my advice is that if you *can* separate it, you should do so.
It's very easy to squash things back together, and separating things makes
errors more obvious and bisection more useful.

> -static int tegra_pcie_enable(struct tegra_pcie *pcie)
> +static int tegra_pcie_check_ports(struct tegra_pcie *pcie)

"check_ports" is a not really a very good function name because it doesn't
give any clues about what we're checking or what return value to expect.

Bjorn
