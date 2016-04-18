From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH v5 1/2] dt-bindings: pci: tegra: Update for per-lane PHYs
Date: Mon, 18 Apr 2016 10:50:16 -0600
Message-ID: <57151048.2090806@wwwdotorg.org>
References: <1460991105-22861-1-git-send-email-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1460991105-22861-1-git-send-email-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Cc: Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 04/18/2016 08:51 AM, Thierry Reding wrote:
> From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>
> The XUSB pad controller allows PCIe lanes to be controlled individually,
> providing fine-grained control over their power state. Previous attempts
> at describing the XUSB pad controller in DT had erroneously assumed that
> all PCIe lanes were driven by the same PHY, and hence the PCI host
> controller would reference only a single PHY.
>
> Moving to a representation of per-lane PHYs requires that the operating
> system driver for the PCI host controller have access to the set of PHY
> devices that make up the connection of each root port in order to power
> up and down all of the lanes as necessary.

The series,
Acked-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
