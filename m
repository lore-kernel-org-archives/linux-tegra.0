From: Jingoo Han <jg1.han-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH 2/2] PCI: tegra: Fix license string
Date: Fri, 11 Jul 2014 16:07:21 +0900
Message-ID: <004301cf9cd6$c22ae840$4680b8c0$%han@samsung.com>
References: <1405061938-2191-1-git-send-email-thierry.reding@gmail.com>
 <1405061938-2191-2-git-send-email-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <1405061938-2191-2-git-send-email-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Content-language: ko
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: 'Thierry Reding' <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, 'Bjorn Helgaas' <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Cc: 'Thomas Petazzoni' <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, 'Jason Cooper' <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, 'Stephen Warren' <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, 'Jingoo Han' <jg1.han-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Friday, July 11, 2014 3:59 PM, Thierry Reding wrote:
> 
> From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> 
> The proper MODULE_LICENSE() string for the GPL v2 is "GPL v2", not
> "GPLv2".
> 
> Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Reviewed-by: Jingoo Han <jg1.han-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>

Best regards,
Jingoo Han

> ---
>  drivers/pci/host/pci-tegra.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/pci/host/pci-tegra.c b/drivers/pci/host/pci-tegra.c
> index 7df5aaf58921..14ec5b2c69e0 100644
> --- a/drivers/pci/host/pci-tegra.c
> +++ b/drivers/pci/host/pci-tegra.c
> @@ -1742,4 +1742,4 @@ module_platform_driver(tegra_pcie_driver);
> 
>  MODULE_AUTHOR("Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>");
>  MODULE_DESCRIPTION("NVIDIA Tegra PCIe driver");
> -MODULE_LICENSE("GPLv2");
> +MODULE_LICENSE("GPL v2");
> --
> 2.0.1
