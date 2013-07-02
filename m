From: Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: Re: [PATCH] ARM: move body of head-common.S back to text section
Date: Tue, 2 Jul 2013 16:22:59 -0700
Message-ID: <20130702232259.GH11625@codeaurora.org>
References: <1372805629-18382-1-git-send-email-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1372805629-18382-1-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Paul Gortmaker <paul.gortmaker-CWA4WttNNZF54TAoqtyWWQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 07/02, Stephen Warren wrote:
> From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> 
> Commit 281ecb7 "arm: delete __cpuinit/__CPUINIT usage from all ARM
> users" removed a __CPUINIT from head-common.S. However, the code
> immediately before the removed tag was marked __INIT, and was missing
> a match __FINIT. This caused code after the removed __CPUINIT to end
> up in the init section rather than the main text section as desired.
> This caused issues such as secondary CPU boot failures or crashes.
> Add the missing __FINIT to solve this.
> 
> Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>  arch/arm/kernel/head-common.S | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/arch/arm/kernel/head-common.S b/arch/arm/kernel/head-common.S
> index 529ce99..a9dc804 100644
> --- a/arch/arm/kernel/head-common.S
> +++ b/arch/arm/kernel/head-common.S
> @@ -122,6 +122,8 @@ __mmap_switched_data:
>  	.long	init_thread_union + THREAD_START_SP @ sp
>  	.size	__mmap_switched_data, . - __mmap_switched_data
>  
> +	__FINIT
> +
>  /*
>   * This provides a C-API version of __lookup_processor_type
>   */

Shouldn't this come after lookup_processor_type()? Otherwise you
just removed that function from the init section?

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
hosted by The Linux Foundation
