From: Mikko Perttunen <mikko.perttunen-/1wQRMveznE@public.gmane.org>
Subject: Re: [RFC PATCH] dt: Tegra XUSB padctl: per-lane PHYs and USB lane map
Date: Thu, 22 Oct 2015 16:03:01 +0300
Message-ID: <5628DE85.3010808@kapsi.fi>
References: <1445297442-21439-1-git-send-email-swarren@wwwdotorg.org>
 <5626130A.5090604@nvidia.com> <5626641C.8040009@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5626641C.8040009-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 10/20/2015 06:56 PM, Stephen Warren wrote:
> ...
>
> In drivers/pci/host/pci-tegra.c tegra_pcie_get_resources() I see a call
> to devm_phy_optional_get().
>
> The SATA driver doesn't seem to do anything with phys at the moment,
> although tegra124.dtsi does put phy-related properties into the SATA DT
> node.

FWIW, the SATA driver does use the PHY - just through the 
ahci_platform_{get,enable,...}_resources API. (so is life..)

Mikko

>
> So, we can either:
> a) Just ignore DT ABI for these cases claiming the DT binding is not yet
> declared stable.
>
> b) Continue to support those specifier values for ABI reasons, which
> needs the "_LEGACY" values shown above.
>
> (a) is certainly simpler.
> --
> To unsubscribe from this list: send the line "unsubscribe linux-tegra" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
