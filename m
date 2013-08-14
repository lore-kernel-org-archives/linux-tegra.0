From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH V2] ARM: allow DEBUG_UNCOMPRESS for Tegra
Date: Wed, 14 Aug 2013 15:30:29 -0600
Message-ID: <520BF6F5.5090303@wwwdotorg.org>
References: <1375379471-15615-1-git-send-email-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1375379471-15615-1-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Cc: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 08/01/2013 11:51 AM, Stephen Warren wrote:
> From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> 
> DEBUG_UNCOMPRESS was previously disallowed for Tegra due to tegra.S's
> use of global data that was not linked into the decompressor. Solve this
> by declaring this symbol in tegra.S when it is being built into the
> decompressor. For the kernel proper, leave the declaration in
> mach-tegra/common.c as explained in the comment.
> 
> Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
> v2: Don't select DEBUG_UNCOMPRESS with DEBUG_TEGRA_UART unless
>     !ZBOOT_ROM. Add notes on ZBOOT_ROM to comment.
> 
> Russell, I assume this should go in through the ARM patch tracker. Or,
> do you want me to take it through the Tegra tree?

Russell, I put this patch into the ARM patch tracker a while back. I
assume it's something you plan to take, or should I put it into the
Tegra tree? Thanks.
