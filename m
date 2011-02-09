From: David Daney <ddaney-M3mlKVOIwJVv6pq1l3V1OdBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 3/4] usb: host: Add EHCI driver for NVIDIA Tegra SoCs
Date: Wed, 09 Feb 2011 11:43:54 -0800
Message-ID: <4D52EE7A.4090505@caviumnetworks.com>
References: <1297228927-23497-1-git-send-email-benoit@android.com> <1297228927-23497-4-git-send-email-benoit@android.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1297228927-23497-4-git-send-email-benoit-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Benoit Goby <benoit-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
Cc: David Brownell <dbrownell-Rn4VEauK+AKRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>, Greg Kroah-Hartman <gregkh-l3A5Bk7waGM@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Robert Morell <rmorell-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Erik Gilling <konkers-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 02/08/2011 09:22 PM, Benoit Goby wrote:
> Signed-off-by: Benoit Goby<benoit-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
> ---
>   drivers/usb/Kconfig           |    1 +
>   drivers/usb/host/Kconfig      |    8 +
>   drivers/usb/host/ehci-hcd.c   |    5 +
>   drivers/usb/host/ehci-tegra.c |  673 +++++++++++++++++++++++++++++++++++++++++
>   include/linux/tegra_usb.h     |   35 +++
>   5 files changed, 722 insertions(+), 0 deletions(-)
>   create mode 100644 drivers/usb/host/ehci-tegra.c
>   create mode 100644 include/linux/tegra_usb.h
>
> diff --git a/drivers/usb/Kconfig b/drivers/usb/Kconfig
> index fceea5e..a2fa2a8 100644
> --- a/drivers/usb/Kconfig
> +++ b/drivers/usb/Kconfig
> @@ -59,6 +59,7 @@ config USB_ARCH_HAS_EHCI
>   	default y if PPC_MPC512x
>   	default y if SOC_AU1200
>   	default y if ARCH_IXP4XX
> +	default y if ARCH_TEGRA
>   	default y if ARCH_W90X900

This doesn't belong here.

Do 'select USB_ARCH_HAS_EHCI' in your arch specific Kconfig instead.

David Daney
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
