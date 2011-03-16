From: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Subject: Re: Move tegra in linux-next merge order
Date: Wed, 16 Mar 2011 22:54:59 +0000
Message-ID: <20110316225459.GG15605@opensource.wolfsonmicro.com>
References: <AANLkTikoBGKh9DP1q3ujDBg1fH5Azkahy8RpSO=GqzOR@mail.gmail.com>
 <20110317091048.98b63924.sfr@canb.auug.org.au>
 <20110316221522.GF15605@opensource.wolfsonmicro.com>
 <20110317095016.e0fd4012.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20110317095016.e0fd4012.sfr-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Rothwell <sfr-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org>
Cc: Colin Cross <ccross-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Linux Tegra Mailing List <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "Ben Dooks (embedded platforms)" <ben-linux-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Thu, Mar 17, 2011 at 09:50:16AM +1100, Stephen Rothwell wrote:

> All you would need to do is create a branch (ref) at the last of the
> necessary commits in the asoc tree and Colin could pull that.  This means
> that Colin will merge a (hopefully not to large) subset of the asoc tree.
> Or he could just merge the asoc tree as it is today.  Either way, the
> merge commit should contain an explanation.

I wouldn't even need to create a branch, that doesn't make any practical
difference over working directly with the commit ID.  Colin wasn't
enthusiastic about merging the fairly active ASoC tree into Tegra, and
the Tegra side changes depend on other Tegra changes so the reverse
merge was an issue also.

Given how trivial the change is it may as well just get dropped in in
-rc1 - I really don't understand the handwringing here.
--
To unsubscribe from this list: send the line "unsubscribe linux-tegra" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
