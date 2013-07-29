From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH 3/8] clk: tegra114: add LP1 suspend/resume support
Date: Mon, 29 Jul 2013 16:51:53 -0600
Message-ID: <51F6F209.2090309@wwwdotorg.org>
References: <1374830110-30685-1-git-send-email-josephl@nvidia.com> <1374830110-30685-4-git-send-email-josephl@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1374830110-30685-4-git-send-email-josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 07/26/2013 03:15 AM, Joseph Lo wrote:
> When the system suspends to LP1, the clock of the CPU would be switched to
> CLK_M (12MHz Oscillator) during suspend/resume flow. The clock driver
> needs to restore the clock of CPU after LP1 resume.

It's unclear to me how the code change implements "restore the clock of
the CPU". A register name of CCLKG_BURST_POLICY doesn't sound like it's
anything to do with enabled/disabling the CPU clock, nor configuring its
rate. What exactly does this register do, and hence what does this new
code actually restore?

Why don't Tegra20/30 need a similar change?
