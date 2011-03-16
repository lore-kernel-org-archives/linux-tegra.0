From: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Subject: Re: Move tegra in linux-next merge order
Date: Wed, 16 Mar 2011 22:15:22 +0000
Message-ID: <20110316221522.GF15605@opensource.wolfsonmicro.com>
References: <AANLkTikoBGKh9DP1q3ujDBg1fH5Azkahy8RpSO=GqzOR@mail.gmail.com>
 <20110317091048.98b63924.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20110317091048.98b63924.sfr-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Rothwell <sfr-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org>
Cc: Colin Cross <ccross-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Linux Tegra Mailing List <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "Ben Dooks (embedded platforms)" <ben-linux-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Thu, Mar 17, 2011 at 09:10:48AM +1100, Stephen Rothwell wrote:

> The usual way to do that is for (in this case) the asoc tree to have a
> branch that contains the commits that the tegra tree depends on and for
> both trees to merge the branch.   This is much better than (say)
> cherry-picking the commits into the tegra tree.

We'd need to cherry pick the commits into a branch to create the new
ASoC branch anyway, I can't rebase the tree as it's merged elsewhere.
The need to use the code in the Tegra tree wasn't flagged until too
late.
--
To unsubscribe from this list: send the line "unsubscribe linux-tegra" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
