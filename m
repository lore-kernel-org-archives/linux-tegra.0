From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH] PCI: tegra: Use physical range for I/O mapping
Date: Wed, 26 Nov 2014 17:55:05 +0100
Message-ID: <3072281.UjpXkitFjL@wuerfel>
References: <1417018897-3965-1-git-send-email-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1417018897-3965-1-git-send-email-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Liviu Dudau <liviu.dudau-5wv7dgnIgG8@public.gmane.org>, Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Wednesday 26 November 2014 17:21:37 Thierry Reding wrote:
> -
> +       pci_add_resource_offset(&sys->resources, &pcie->pio, sys->io_offset);
>         pci_add_resource_offset(&sys->resources, &pcie->mem, sys->mem_offset);
>         pci_add_resource_offset(&sys->resources, &pcie->prefetch,
>                                 sys->mem_offset);
> 

You don't set sys->io_offset anywhere, which is a bug if you have multiple
instances of the PCI host in one system. In my draft patch, I was setting
both io_offset and mem_offset for consistency, and while mem_offset would
in practice be always zero (as discussed on IRC), the io_offset in fact has
a realistic chance of being nonzero and you should definitely set it.

	Arnd
