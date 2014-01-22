From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH 4/5] ARM: trusted_foundations: implement do_idle()
Date: Wed, 22 Jan 2014 13:43:56 -0700
Message-ID: <52E02D8C.7090309@wwwdotorg.org>
References: <1390299016-14105-1-git-send-email-acourbot@nvidia.com> <1390299016-14105-5-git-send-email-acourbot@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1390299016-14105-5-git-send-email-acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Cc: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 01/21/2014 03:10 AM, Alexandre Courbot wrote:
> Support the do_idle() firmware call, which is necessary to properly
> support cpuidle.

> diff --git a/arch/arm/firmware/trusted_foundations.c b/arch/arm/firmware/trusted_foundations.c

> +#define TF_CPU_PM		 0xfffffffc
> +#define TF_CPU_PM_LP0		 0xffffffe3
> +#define TF_CPU_PM_LP1		 0xffffffe6
> +#define TF_CPU_PM_LP1_NO_MC_CLK	 0xffffffe5
> +#define TF_CPU_PM_LP2		 0xffffffe4
> +#define TF_CPU_PM_LP2_NOFLUSH_L2 0xffffffe7

Hmm. This must be Tegra-specific, not generic to any TF client, since
aren't the names of the suspend states (LP0, LP1, LP2) entirely specific
to Tegra?
