From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH V2] gpu: host1x: handle the correct # of syncpt regs
Date: Mon, 14 Apr 2014 14:53:51 -0600
Message-ID: <534C4ADF.7010607@wwwdotorg.org>
References: <1396650665-6992-1-git-send-email-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1396650665-6992-1-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, =?ISO-8859-1?Q?Terje_Ber?= =?ISO-8859-1?Q?gstr=F6m?= <tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 04/04/2014 04:31 PM, Stephen Warren wrote:
> From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> 
> BIT_WORD() truncates rather than rounds, so the loops in
> syncpt_thresh_isr() and _host1x_intr_disable_all_syncpt_intrs() use <=
> rather than < in an attempt to process the correct number of registers
> when rounding of the conversion of count of bits to count of words is
> necessary. However, when rounding isn't necessary because the value is
> already a multiple of the divisor (as is the case for all values of
> nb_pts the code actually sees), this causes one too many registers to
> be processed.
> 
> Solve this by using and explicit DIV_ROUND_UP() call, rather than
> BIT_WORD(), and comparing with < rather than <=.

I don't see this in linux-next yet.
