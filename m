From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH v2] PCI: tegra: Use physical range for I/O mapping
Date: Thu, 27 Nov 2014 10:12:47 +0100
Message-ID: <2095645.ggFcdgUqAP@wuerfel>
References: <1417078449-9556-1-git-send-email-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1417078449-9556-1-git-send-email-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Liviu Dudau <liviu.dudau-5wv7dgnIgG8@public.gmane.org>, Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Thursday 27 November 2014 09:54:09 Thierry Reding wrote:
> From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> 
> Commit 0b0b0893d49b ("of/pci: Fix the conversion of IO ranges into IO
> resources") changed how I/O resources are parsed from DT. Rather than
> containing the physical address of the I/O region, the addresses will
> now be in I/O address space.
> 
> On Tegra the union of all ranges is used to expose a top-level memory-
> mapped resource for the PCI host bridge. This helps to make /proc/iomem
> more readable.
> 
> Combining both of the above, the union would now include the I/O space
> region. This causes a regression on Tegra20, where the physical base
> address of the PCIe controller (and therefore of the union) is located
> at physical address 0x80000000. Since I/O space starts at 0, the union
> will now include all of system RAM which starts at 0x00000000.
> 
> This commit fixes this by keeping two copies of the I/O range: one that
> represents the range in the CPU's physical address space, the other for
> the range in the I/O address space. This allows the translation setup
> within the driver to reuse the physical addresses. The code registering
> the I/O region with the PCI core uses both ranges to establish the
> mapping.
> 
> Fixes: 0b0b0893d49b ("of/pci: Fix the conversion of IO ranges into IO resources")
> Reported-by: Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>
> Suggested-by: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
> Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Reviewed-by: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
