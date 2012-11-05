From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH V3 1/5] ARM: implement debug_ll_io_init()
Date: Mon, 05 Nov 2012 12:03:57 -0700
Message-ID: <50980D9D.7050207@wwwdotorg.org>
References: <1350686507-3022-1-git-send-email-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1350686507-3022-1-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 10/19/2012 04:41 PM, Stephen Warren wrote:
> When using DEBUG_LL, the UART's (or other HW's) registers are mapped
> into early page tables based on the results of assembly macro addruart.
> Later, when the page tables are replaced, the same virtual address must
> remain valid. Historically, this has been ensured by using defines from
> <mach/iomap.h> in both the implementation of addruart, and the machine's
> .map_io() function. However, with the move to single zImage, we wish to
> remove <mach/iomap.h>. To enable this, the macro addruart may be used
> when constructing the late page tables too; addruart is exposed as a
> C function debug_ll_addr(), and used to set up the required mapping in
> debug_ll_io_init(), which may called on an opt-in basis from a machine's
> .map_io() function.

Patch 1 has been taken into arm-soc, and I've applied patches 2-5 to the
Tegra tree.
