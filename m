From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH 0/5] ARM: tegra: add CPU hotplug support
Date: Tue, 14 Aug 2012 12:32:45 -0600
Message-ID: <502A99CD.3060400@wwwdotorg.org>
References: <1344931644-3927-1-git-send-email-josephl@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1344931644-3927-1-git-send-email-josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 08/14/2012 02:07 AM, Joseph Lo wrote:
> This patch set adds CPU hotplug support for Tegra20 and Tegra30 SoCs.
> 
> The first 3 patches make the CPU clock and reset control be a module and
> the abstraction APIs for TegraXX SoCs. And clean up some codes for later
> usage. Then add CPU hotplug support for Tegra20 and Tegra30.
> 
> Verified on Seaboard(Tegra20) and Cardhu(Tegra30)

There are two problems with this series:

1) It doesn't compile if CONFIG_HOTPLUG_CPU isn't enabled. Please also
make sure that Tegra20-only and Tegra30-only kernels compile (I didn't
check this, so it may well already be the case).

2) It prevents the "reboot" from working; the kernel hangs as it
attempts to do the reboot. I've confirmed this isn't the case without
this patch series, even if CONFIG_HOTPLUG_CPU is enabled.

I assume we'll want to enable CONFIG_HOTPLUG_CPU in tegra_defconfig once
this is checked in?
