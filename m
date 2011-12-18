From: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Subject: Re: [PATCH 0/9] arm/tegra: Various pinmux-related cleanups
Date: Sat, 17 Dec 2011 16:57:02 -0800
Message-ID: <20111218005702.GA4336@quad.lixom.net>
References: <1324073552-15542-1-git-send-email-swarren@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1324073552-15542-1-git-send-email-swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Fri, Dec 16, 2011 at 03:12:23PM -0700, Stephen Warren wrote:
> While working on switching Tegra to a new pinctrl-based pin mux driver,
> I made a bunch of small pinmux-related fixes; this patch series.
>
> This patch series will have a few small context conflicts with Peter
> De Schrijver's Tegra30 support. Peter's patch series should have
> priority over this one (i.e. be the one merged if it's difficult to
> merge both).

Contents of the series as a whole looks good to me, but I did notice a
bunch of section mismatches. Instead of commenting on the specific
ones, just compile with CONFIG_DEBUG_SECTION_MISMATCH=y and fix up the
new ones and repost, please. :)

> In particular:
> * My patch 3 "arm/tegra: Harmony PCIe: Don't touch pinmux" and Peter's
>   patch "arm/tegra: prepare pinmux code for multiple tegra variants"
>   will have context conflicts; I've described the best way to resolve
>   this in my patch's commit description.
> * This series edits board-dt.c whereas Peter's series renames that to
>   board-dt-tegra20.c. I assume git will handle this without any issue.
> * There may be other obvious context conflicts that should be trivial
>   to resolve.

The fixups were indeed trivial and no big deal, thanks for providing the
preferred resolutions and heads-up though.

> Following this series, I have 3 patches in my local tree:
>   arm/tegra: Select PINMUX Kconfig variables
>   arm/tegra: Switch to new pinctrl driver
>   arm/tegra: Remove pre-pinctrl pinmux driver
> 
> (all work in DT and non-DT on all supported Tegra20 boards)
> 
> I need to rebase those on top of Peter's patches (the first patch needs
> updates for Tegra30 support, the last patch needs to delete the new
> Tegra30 pinmux driver that Peter's series adds). It will also depend on
> the pinctrl subsystem, which is being merged for the first time in 3.3,
> and probably also patches to pinctrl that may only show up in 3.4. So,
> I'll probably hold off posting those patches for merge until after 3.3
> is out, but will probably send them out as a preview before that.

It's no problem to add a topic branch that has dependencies and make
sure it gets merged upstream with said dependencies resolved, as long as
they are on stable branches by then (i.e. that they won't be rebased). So
either way works, it's up to you.


-Olof
