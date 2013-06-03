From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH 4/4] ARM: tegra: check processor id in tegra_{set,clear}_cpu_in_lp2
Date: Mon, 03 Jun 2013 14:35:02 -0600
Message-ID: <51ACFDF6.5050602@wwwdotorg.org>
References: <1370258267-30184-1-git-send-email-josephl@nvidia.com> <1370258267-30184-5-git-send-email-josephl@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1370258267-30184-5-git-send-email-josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 06/03/2013 05:17 AM, Joseph Lo wrote:
> The tegra_set_cpu_in_lp2 was used in the Tegra reset handler to know the
> CPU were coming up with which state then redirect to the appropriate
> handler. So we need to pass the processor id every time when we use the
> function. Now moving the code into the function.

That description makes very little sense. To me, the second sentence
actually implies the opposite code change to the content of this patch.
I think the following would be better:

ARM: tegra: don't pass CPU ID to tegra_{set,clear}_cpu_in_lp2

tegra_{set,clear}_cpu_in_lp2 can easily determine which CPU ID they are
running on; there is no need to pass the CPU ID into those functions.
So, remove their CPU ID function parameter.
