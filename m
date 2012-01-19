From: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Subject: Re: [PATCH 0/4] ARM: tegra: Automatic UART selection for earlyprintk
Date: Wed, 18 Jan 2012 20:42:44 -0800
Message-ID: <20120119044244.GE7145@quad.lixom.net>
References: <1325629520-23018-1-git-send-email-swarren@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1325629520-23018-1-git-send-email-swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Tom Warren <twarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Simon Glass <sjg-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Tue, Jan 03, 2012 at 03:25:16PM -0700, Stephen Warren wrote:
> This series allows a Tegra zImage to automatically select the UART to use
> for the zImage decompressor and early printk, based on information from
> the bootloader. The code scans each UART, looking for one that is clocked,
> is out of reset, and that the bootloader has written 'D' (for 'D'ebug) to
> the scratch register.
> 
> At present, the ChromiumOS branch of U-Boot sets up UARTs in this way. If
> this patch is accepted into the kernel, I'll upstream the U-Boot change to
> mainline U-Boot.
> 
> This is important, since different boards use different UARTs, and it's
> nice not to have to configure the kernel differently when switching
> boards.
> 
> This patch series depends on patch "[PATCH V2] arm/tegra: Support Tegra30
> in decompressor UART setup" for context.
> 
> Doug Anderson (2):
>   ARM: tegra: Introduce define DEBUG_UART_SHIFT
>   ARM: tegra: uncompress.h: Store UART address in a variable
> 
> Stephen Warren (2):
>   ARM: tegra: uncompress.h: Choose a UART at runtime
>   ARM: tegra: Pass uncompress.h UART selection to DEBUG_LL

Thanks, applied.


-Olof
