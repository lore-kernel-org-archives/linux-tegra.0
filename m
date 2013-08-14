From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH 6/29] tegra: simplify use of devm_ioremap_resource
Date: Wed, 14 Aug 2013 10:49:35 -0600
Message-ID: <520BB51F.5000707@wwwdotorg.org>
References: <1376471493-22215-1-git-send-email-Julia.Lawall@lip6.fr> <1376471493-22215-7-git-send-email-Julia.Lawall@lip6.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1376471493-22215-7-git-send-email-Julia.Lawall-L2FTfq7BK8M@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Julia Lawall <Julia.Lawall-L2FTfq7BK8M@public.gmane.org>
Cc: kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 08/14/2013 03:11 AM, Julia Lawall wrote:
> From: Julia Lawall <Julia.Lawall-L2FTfq7BK8M@public.gmane.org>
> 
> Remove unneeded error handling on the result of a call to
> platform_get_resource when the value is passed to devm_ioremap_resource.

I believe that drivers/iommu changes are usually applied by Joerg Roedel
<joro-zLv9SwRftAIdnm+yROfE0A@public.gmane.org> and drivers/memory changes by Greg Kroah-Hartman
<gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, although admittedly neither of those is
particularly called out by the MAINTAINERS file...

I guess these are simple enough that I can take them through the Tegra
tree though, since it doesn't look like there will be any conflicts
doing so for 3.12.
