From: Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
Subject: Re: [PATCHv4 0/8] Support for Tegra 2D hardware
Date: Fri, 21 Dec 2012 14:50:18 +0100
Message-ID: <1356097818.1490.109.camel@tellur>
References: <1356089964-5265-1-git-send-email-tbergstrom@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1356089964-5265-1-git-send-email-tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Terje Bergstrom <tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org, airlied-cv59FeDIM0c@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Am Freitag, den 21.12.2012, 13:39 +0200 schrieb Terje Bergstrom:
> This set of patches adds support for Tegra20 and Tegra30 host1x and
> 2D. It is based on linux-next-20121220.
> 
> The fourth version has only few changes compared to previous version:
>  * Fixed some sparse warnings
>  * Fixed host1x Makefile to allow building as module
>  * Fixed host1x module unload
>  * Fixed tegradrm unload sequence
>  * host1x creates DRM dummy device and tegradrm uses it for storing
>    DRM related data.
> 
> Some of the issues left open:
>  * Register definitions still use static inline. There has been a
>    debate about code style versus ability to use compiler type
>    checking and code coverage analysis. There was no conclusion, so
>    I left it as was.
This has to be resolved before merging. Personally I'm in favour of
keeping reg access patterns close to what is done in other parts of the
kernel.

>  * Uses still CMA helpers. IOMMU support will replace CMA with host1x
>    specific allocator.

I really want the allocator issue resolved before talking about merging
those patches. Proper IOMMU support will require a bit of rework of the
current upstream IOMMU API, so it will still be a bit out.

But if you don't mind I'll try to implement the host1x allocator over
the holidays and provide an incremental patch.

Regards,
Lucas
