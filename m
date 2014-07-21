From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: [PATCH 2/2] PCI: tegra: Implement a proper resource hierarchy
Date: Mon, 21 Jul 2014 09:58:02 -0600
Message-ID: <53CD388A.7090006@wwwdotorg.org>
References: <1405062505-2606-1-git-send-email-thierry.reding@gmail.com> <1405062505-2606-2-git-send-email-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-pci-owner@vger.kernel.org>
In-Reply-To: <1405062505-2606-2-git-send-email-thierry.reding@gmail.com>
Sender: linux-pci-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>, Bjorn Helgaas <bhelgaas@google.com>
Cc: linux-pci@vger.kernel.org, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On 07/11/2014 01:08 AM, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> Currently the resource hierarchy generated from the PCIe host bridge is
> completely flat:
...
> The host bridge driver doesn't request all the resources that are used.
> Windows allocated to each of the root ports aren't tracked, so there is
> no way for resources allocated to individual devices to be matched up
> with the correct parent resource by the PCI core.
> 
> This patch addresses this in two steps. It first takes the union of all
> regions associated with the PCIe host bridge (control registers, root
> port registers, configuration space, I/O and prefetchable as well as
> non-prefetchable memory regions) and uses it as the new root of the
> resource hierarchy.

This patch briefly,
Reviewed-by: Stephen Warren <swarren@nvidia.com>
