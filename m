From: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Subject: Re: [PATCH 2/3] ARM: tegra: fix relocation truncated error when
 THUMB2_KERNEL enabled
Date: Thu, 18 Apr 2013 09:32:13 -0700
Message-ID: <20130418163213.GC7083@quad.lixom.net>
References: <1366066255-18192-1-git-send-email-swarren@wwwdotorg.org>
 <1366066255-18192-2-git-send-email-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1366066255-18192-2-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Mon, Apr 15, 2013 at 04:50:54PM -0600, Stephen Warren wrote:
> From: Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> 
> The conditional branch instruction in Thumb2 only available to short range.
> The linker will fail when the conditional branch over the range. Then
> resulting in link error when generating kernel image. e.g.:
> 
> arch/arm/mach-tegra/reset-handler.S:47:(.text+0xf8e):
> relocation truncated to fit: R_ARM_THM_JUMP19 against symbol
> `cpu_resume' defined in .data section in arch/arm/kernel/built-in.o
> 
> This patch using a Thumb2 instruction IT (if-then) to have a longer branch
> range.
> 
> Reported-by: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
> Signed-off-by: Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>


Applied to fixes-non-critical.


-Olof
