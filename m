From: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Subject: Re: [PATCH] PCI: tegra: replace devm_request_and_ioremap by
 devm_ioremap_resource
Date: Thu, 29 Aug 2013 13:02:38 -0700
Message-ID: <20130829200238.GM18542@quad.lixom.net>
References: <1377508269-9664-1-git-send-email-treding@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1377508269-9664-1-git-send-email-treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Julia Lawall <Julia.Lawall-L2FTfq7BK8M@public.gmane.org>, Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Mon, Aug 26, 2013 at 11:11:09AM +0200, Thierry Reding wrote:
> From: Julia Lawall <Julia.Lawall-L2FTfq7BK8M@public.gmane.org>
> 
> Use devm_ioremap_resource instead of devm_request_and_ioremap.
> 
> This was done using the semantic patch
> scripts/coccinelle/api/devm_ioremap_resource.cocci
> 
> Error-handling code was manually removed from the associated calls to
> platform_get_resource.
> 
> Adjust the comment at the third platform_get_resource_byname to make clear
> why ioremap is not done at this point.
> 
> Signed-off-by: Julia Lawall <Julia.Lawall-L2FTfq7BK8M@public.gmane.org>
> Acked-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> Tested-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> Acked-by: Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
> Acked-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
> Hi,
> 
> This is a small cleanup patch on top of the recently merged Tegra PCIe
> driver. Can someone please apply this to the same branch that Tegra's
> tegra-for-3.12-soc branch was merged? I think Kevin Hilman pulled it
> into next/soc.

Applied. 


-Olof
