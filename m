From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH] ARM: tegra: cpuidle: use CPUIDLE_FLAG_TIMER_STOP flag
Date: Tue, 25 Jun 2013 09:12:42 -0600
Message-ID: <51C9B36A.3040808@wwwdotorg.org>
References: <1372152228-16199-1-git-send-email-josephl@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1372152228-16199-1-git-send-email-josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 06/25/2013 03:23 AM, Joseph Lo wrote:
> Use the CPUIDLE_FLAG_TIMER_STOP and let the cpuidle framework
> to handle the CLOCK_EVT_NOTIFY_BROADCAST_ENTER/EXIT when entering
> this state.

I assume this patch is only needed to support the other two series you
sent today; the Tegra114 cpuidle and system suspend series? In other
words, there's no need to apply this to 3.11 to fix a bug; it can wait
for 3.12 along with those other two series?
