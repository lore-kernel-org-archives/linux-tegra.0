From: Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v3 05/10] resource: add PCI configuration space support
Date: Mon, 13 Aug 2012 22:00:45 -0700
Message-ID: <CAErSpo4qg45brVRwEbw3=R04VsbnvUowSMWcT+M6VoAxbf3Cqg@mail.gmail.com>
References: <1343332512-28762-1-git-send-email-thierry.reding@avionic-design.de>
 <1343332512-28762-6-git-send-email-thierry.reding@avionic-design.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1343332512-28762-6-git-send-email-thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Mitch Bradley <wmb-D5eQfiDGL7eakBO8gow8eQ@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Thu, Jul 26, 2012 at 12:55 PM, Thierry Reding
<thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org> wrote:
> This commit adds a new flag that allows marking resources as PCI
> configuration space.
>
> Signed-off-by: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
> ---
> Changes in v3:
> - new patch
>
>  include/linux/ioport.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/include/linux/ioport.h b/include/linux/ioport.h
> index 589e0e7..3314843 100644
> --- a/include/linux/ioport.h
> +++ b/include/linux/ioport.h
> @@ -102,7 +102,7 @@ struct resource {
>
>  /* PCI control bits.  Shares IORESOURCE_BITS with above PCI ROM.  */
>  #define IORESOURCE_PCI_FIXED           (1<<4)  /* Do not move resource */
> -
> +#define IORESOURCE_PCI_CS              (1<<5)  /* PCI configuration space */

What is the purpose of this?  It seems that you are marking regions
that we call MMCONFIG on x86, or ECAM-type regions in the language of
the PCIe spec.  I see that you set it in several places, but I don't
see anything that ever looks for it.  Do you have plans to use it in
the future?  If it really does correspond to MMCONFIG/ECAM, we should
handle those regions consistently across all architectures.

>  /* helpers to define resources */
>  #define DEFINE_RES_NAMED(_start, _size, _name, _flags)                 \
> --
> 1.7.11.2
>
