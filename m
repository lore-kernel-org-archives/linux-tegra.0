From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH] ARM: Tegra: Add smp_twd clock for Tegra20
Date: Thu, 13 Sep 2012 11:48:24 -0600
Message-ID: <50521C68.3000704@wwwdotorg.org>
References: <1347528873-3799-1-git-send-email-pgaikwad@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1347528873-3799-1-git-send-email-pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Prashant Gaikwad <pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org, ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 09/13/2012 03:34 AM, Prashant Gaikwad wrote:
> Clockevent's frequency is changed upon cpufreq change
> notification. It fetches local timer's rate to update the
> clockevent frequency. This patch adds local timer clock
> for Tegra20.

Applied to Tegra's for-3.7/common-clk branch. I re-tested that branch,
and the final re-merge of Tegra's for-next.

A nice side-effect of this, is that you can disable CONFIG_CPU_FREQ, and
still boot (since the CPU clock isn't turned off, since smp_twd is
clk_get()d which takes a reference to the CPU clock).
