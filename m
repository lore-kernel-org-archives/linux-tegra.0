From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH v2 1/5] PCI: tegra: Overhaul regulator usage
Date: Thu, 29 May 2014 11:48:45 -0600
Message-ID: <538772FD.40407@wwwdotorg.org>
References: <1401288555-24197-1-git-send-email-thierry.reding@gmail.com> <1401288555-24197-2-git-send-email-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1401288555-24197-2-git-send-email-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 05/28/2014 08:49 AM, Thierry Reding wrote:
> From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> 
> The current usage of regulators for the Tegra PCIe block is wrong. It
> doesn't accurately reflect the actual supply inputs of the IP block and
> therefore isn't as flexible as it should be. Rectify this by describing
> all possible supply inputs in the device tree binding documentation and
> deprecate the old supply properties.

The series looks fine to me at a quick glance. Since Bjorn has ack'd the
PCIe driver patch, I'll apply this to the Tegra tree for 3.17. I'll put
it into a topic branch in case it needs to be merged into the PCI tree
to resolve any conflicts.
