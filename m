From: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Subject: Re: [PATCH] ARM: tegra: solve adr range issue with THUMB2_KERNEL
 enabled
Date: Thu, 18 Apr 2013 09:36:11 -0700
Message-ID: <20130418163611.GF7083@quad.lixom.net>
References: <1366132149-17294-1-git-send-email-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1366132149-17294-1-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Dave Martin <dave.martin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Tue, Apr 16, 2013 at 11:09:09AM -0600, Stephen Warren wrote:
> From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> 
> When building the kernel with CONFIG_THUMB2_KERNEL enabled, older
> assemblers may emit the following error:
> 
> reset-handler.S:78: Error: invalid immediate for address calculation (value = 0x00000004)
> 
> Using an explicit adr.w instruction will solve this. Newer assemblers do
> this automatically. Use the W() macro to do this under Thumb mode only.
> 
> Inspired-by: Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> Suggested-by: Dave Martin <dave.martin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
> Olof, Arnd,
> 
> Can you please apply this directly to arm-soc. Thanks.
> 
> This patch replaces patch 3/3 "ARM: tegra: make sure the pointer on 4
> byte align when THUMB2_KERNEL enabled" which I forwarded yesterday. It
> can be applied to wherever Tegra's for-3.10/fixes branch was applied,
> and doesn't cause any conflicts/merge-issues with any other Tegra patches
> this cycle.


Applied.


-Olof
