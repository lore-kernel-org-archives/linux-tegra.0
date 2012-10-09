From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH 0/7] ARM: tegra30: cpuidle: add LP2 support
Date: Tue, 09 Oct 2012 16:26:03 -0600
Message-ID: <5074A47B.3050906@wwwdotorg.org>
References: <1349691981-31038-1-git-send-email-josephl@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1349691981-31038-1-git-send-email-josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 10/08/2012 04:26 AM, Joseph Lo wrote:
> The CPU idle LP2 is a power gating idle mode for Tegra30. It supports the
> secondary CPUs (i.e., CPU1-CPU3) to go into LP2 dynamically. When any of
> the secondary CPUs go into LP2, it can be power gated alone. There is a
> limitation on CPU0. The CPU0 can go into LP2 only when all secondary CPUs
> are already in LP2. After CPU0 is in LP2, the CPU rail can be turned off.
> 
> Verified on Seaboard(Tegra20) and Cardhu(Tegra30).

What's the most comprehensive way to verify this? I booted Cardhu with
these patches applied and saw that all CPU cores did enter both idle
states. However, I'm unsure what the best way to stress the system is,
i.e. how would I stress and test for correct handling of all the L2
caching/SMP coherency issues, etc.
