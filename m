From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [v2 0/6] CLK: tegra: convert device tree files to use CLK defines
Date: Tue, 21 May 2013 10:05:49 -0600
Message-ID: <519B9B5D.4050402@wwwdotorg.org>
References: <1369127450-15203-1-git-send-email-hdoyu@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1369127450-15203-1-git-send-email-hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Hiroshi Doyu <hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 05/21/2013 03:10 AM, Hiroshi Doyu wrote:
> This patchset converts device tree files to use CLK defines. This
> version was updated along with the latest DT changes.
> 
> The following changes since commit 7479d8bb5650f43053d0e82fa44db668cf968f11:
> 
>   TESTING: Build Tegra USB as a module (2013-05-20 13:11:19 -0600)

That commit is in my personal work-in-progress branch. This series
should be based on Tegra's for-3.11/dt branch. This will make a
difference (at least) in patch 6/6, where you've edited some DT nodes
that don't yet exist upstream (i.e. Tegra's for-3.11/dt branch) and
hence this series won't apply there.

I assume you're planning to send a series for 3.11 that converts
drivers/clk/tegra/ to use these new header files?

If so, I'll need to apply patches 1, 3, 5 to a separate branch, so it
can be pulled into the branch where the drivers/clk changes are applied,
then apply patches 2, 4, 6 to Tegra's for-3.11/dt after merging in the
branch with the header files.
