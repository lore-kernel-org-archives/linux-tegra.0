From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH 1/4] clk: tegra124: add wait_for_reset and disable_clock
 for tegra_cpu_car_ops
Date: Tue, 08 Oct 2013 10:51:42 -0600
Message-ID: <5254381E.9060100@wwwdotorg.org>
References: <1381220587-29697-1-git-send-email-josephl@nvidia.com> <1381220587-29697-2-git-send-email-josephl@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1381220587-29697-2-git-send-email-josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 10/08/2013 02:23 AM, Joseph Lo wrote:
> Hook the functions for CPU hotplug support. After the CPU is hot
> unplugged, the flow controller will handle to clock gate the CPU clock.
> But still need to implement an empty function to avoid warning message.
> 
> Cc: Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> Cc: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> Signed-off-by: Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
> This patch depends on the patch series "[PATCH 0/5] Tegra124 clock support"
> that sent by Peter on 10/4/2013.

Uggh. This series mixes patches for drivers/clk and arch/arm/mach-tegra.
I don't want to introduce dependencies between those two subsystems.
Instead, if this patch is applied to the clock tree, and the reset of
the patches to the Tegra tree, will that cause any build issues, or any
run-time for any SoC other than Tegra124 (which is a new feature so it's
fine if it doesn't work until everything is merged together)?
