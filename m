From: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Subject: Re: [PATCH v2 01/14] ARM: tegra: annotate IO_*_VIRT pointers
Date: Thu, 13 Oct 2011 15:10:36 +0100
Message-ID: <20111013141036.GX21648@n2100.arm.linux.org.uk>
References: <1317956064-17650-1-git-send-email-olof@lixom.net> <1318224484-2090-1-git-send-email-olof@lixom.net> <1318224484-2090-2-git-send-email-olof@lixom.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1318224484-2090-2-git-send-email-olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Sun, Oct 09, 2011 at 10:27:51PM -0700, Olof Johansson wrote:
> +#ifdef __ASSEMBLY__
> +#define __IOVADDR(x)	(x)
> +#else
> +#define __IOVADDR(x)	((void __force __iomem *)(x))

Please call this IOMEM() - see:

grep '#define *IOMEM' arch/arm/*/include/mach -r

for its establishment across several implementations.
