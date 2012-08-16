From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH V3 0/6] ARM: tegra: add CPU hotplug support
Date: Thu, 16 Aug 2012 11:22:04 -0600
Message-ID: <502D2C3C.9090506@wwwdotorg.org>
References: <1345109513-21553-1-git-send-email-josephl@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1345109513-21553-1-git-send-email-josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 08/16/2012 03:31 AM, Joseph Lo wrote:
> This patch set adds CPU hotplug support for Tegra20 and Tegra30 SoCs.
> 
> The first 3 patches make the CPU clock and reset control be a module and
> the abstraction APIs for TegraXX SoCs. And clean up some codes for later
> usage. Then add CPU hotplug support for Tegra20 and Tegra30.
> 
> Verified on Seaboard(Tegra20) and Cardhu(Tegra30)

Thanks, I applied patches 1-5 to for-3.7/cpu-hotplug, and squashed patch
6 into the patch in for-3.7/defconfig.
