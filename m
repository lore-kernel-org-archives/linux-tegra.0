From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH 5/6] clk: tegra114: implement wait_for_reset and disable_clock
 for tegra_cpu_car_ops
Date: Wed, 15 May 2013 17:02:33 -0600
Message-ID: <51941409.3030909@wwwdotorg.org>
References: <1368613644-11863-1-git-send-email-josephl@nvidia.com> <1368613644-11863-6-git-send-email-josephl@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1368613644-11863-6-git-send-email-josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 05/15/2013 04:27 AM, Joseph Lo wrote:
> The conventional CPU hotplug sequence on the other Tegra chips, we will also
> clock gate the CPU in tegra_cpu_kill() after the CPU was power gated. For
> Tegra114, the flow controller will clock gate the CPU after the power down
> sequence. But we still need to implement a empty function for disable_clock
> to avoid kernel warning message.

I assume I need to apply this patch in the Tegra tree along with all the
other patches in this series? i.e. Mike can't apply it on its own to the
clk tree?

If so, I'll wait for an ack from Mike.
