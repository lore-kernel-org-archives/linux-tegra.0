From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH V4 0/7] ARM: tegra30: cpuidle: add a powered-down state
Date: Wed, 31 Oct 2012 14:24:41 -0600
Message-ID: <50918909.60100@wwwdotorg.org>
References: <1351676481-28425-1-git-send-email-josephl@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1351676481-28425-1-git-send-email-josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 10/31/2012 03:41 AM, Joseph Lo wrote:
> This adds a "powered-down" state for cpuidle. It's a power gating idle
> mode. It supports the secondary CPUs (i.e., CPU1-CPU3) to go into
> powered-down state independently. When any of the secondary CPUs go into
> this state, it can be power gated alone. There is a limitation on CPU0.
> The CPU0 can go into powered-down state only when all secondary CPU is
> offline. After CPU0 is in powered-down state, the CPU rail can be turned
> off.
> 
> All CPUs entering powered-down state is not working. The CPU0 enters this
> state only when secondary CPU is offline. This can be coverd by CPUquiet
> and cluster switching mechanism.

OK, this appears to work OK. I have applied it to Tegra's
for-3.8/cpuidle branch.

> V4:
> * rebased on next-20121031

Purely as an FYI, being based on top of Tegra's for-3.8/cpuidle or
for-next branches would have been even better, although in practice this
time around, there were no conflicts applying it there.
