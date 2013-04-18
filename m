From: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Subject: Re: [PATCH 1/3] ARM: tegra: fix build error when THUMB2_KERNEL
 enabled
Date: Thu, 18 Apr 2013 09:31:58 -0700
Message-ID: <20130418163158.GB7083@quad.lixom.net>
References: <1366066255-18192-1-git-send-email-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1366066255-18192-1-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Mon, Apr 15, 2013 at 04:50:53PM -0600, Stephen Warren wrote:
> From: Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> 
> This patch fix the build failure when CONFIG_THUBM2_KERNEL enabled. You
> clould see the error message below:
> 
> arch/arm/mach-tegra/sleep-tegra30.S:69: Error: shift must be constant --
> `orr r12,r12,r4,lsl r3'
> 
> Reported-by: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
> Signed-off-by: Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
> Arnd, Olof, here are 3 fixes from Joseph for some Tegra build issues,
> mostly exposed by multi-platform enablement and/or related randconfig
> testing.
> 
> Can you please apply these to arm-soc? For reference, I tested applying
> them to Tegra's for-3.10/fixes branch and they apply there fine, and
> merge with the other Tegra for-3.10 branches at least, without any issue.
> 
> Note: patch 3 triggers checkpatch, but I can't work out why; the code
> seems to be formatted the same as patch 1 and 2, and is consistent with
> other usage of ARM() and THUMB() macros in arch/arm/.


Applied to fixes-non-critical.


-Olof
