From: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Subject: Re: [GIT PULL 03/10] ARM: tegra: remove board files
Date: Sun, 16 Sep 2012 19:10:40 -0700
Message-ID: <20120917021040.GG19186@quad.lixom.net>
References: <1347653181-19936-1-git-send-email-swarren@wwwdotorg.org>
 <1347653181-19936-3-git-send-email-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1347653181-19936-3-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Fri, Sep 14, 2012 at 02:06:14PM -0600, Stephen Warren wrote:
> This branch removes all remaining board files for Tegra; booting is
> now through device tree only.
> 
> Related, the Harmony DT is augmented with regulators, since this allows
> removal of board-harmony-power.c; no other boards had regulator support.
> This change depends on an enhancement to the TPS6586x regulator driver,
> hence the dependency mentioned below.
> 
> This branch is based on v3.6-rc4, followed by a merge of
> git://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git tps6589x-dt
> 
> This branch is a dependency the cleanup2 branch.
> 
> ----------------------------------------------------------------
> 
> The following changes since commit 1ab710fe61b91a2448de9843c746555f9725b9cc:
> 
>   Merge commit 'tps6589x-dt' into for-3.7/board-removal
> 
> are available in the git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/swarren/linux-tegra.git tegra-for-3.7-board-removal

Pulled into next/cleanup. Thanks!


-Olof
