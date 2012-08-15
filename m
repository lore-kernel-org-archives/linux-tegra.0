From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH V2 0/6] ARM: tegra: add CPU hotplug support
Date: Wed, 15 Aug 2012 10:05:18 -0600
Message-ID: <502BC8BE.8060800@wwwdotorg.org>
References: <1345022554-26292-1-git-send-email-josephl@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1345022554-26292-1-git-send-email-josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 08/15/2012 03:22 AM, Joseph Lo wrote:
> This patch set adds CPU hotplug support for Tegra20 and Tegra30 SoCs.
> 
> The first 3 patches make the CPU clock and reset control be a module and
> the abstraction APIs for TegraXX SoCs. And clean up some codes for later
> usage. Then add CPU hotplug support for Tegra20 and Tegra30.
> 
> Verified on Seaboard(Tegra20) and Cardhu(Tegra30)
> 
> V2:
> * add one more patch for enable HOTPLUG_CPU [6/6]

The build problem when HOTPLUG_CPU is disabled is still present. The
kernel needs to build with this option disabled.

Enabling HOTPLUG_CPU in defconfig doesn't force everyone to enable that
configuration option; not everyone uses tegra_defconfig, people don't
always update to the latest defconfig, people should be free to disable
functionality they don't need and still get a buildable & working
kernel, etc.

Besides, even if defconfig were a legitimate solution to this problem,
this series still wouldn't work with "git bisect", since the defconfig
patch comes after the patch that causes the build failure.

> * move all the SoC specific CPU shutdown code into platform_cpu_die [4/6]

The reboot problem is indeed solved.

P.S. It'd be nice to include a summary of what changed in each affected
patch, as well as in the cover letter.
