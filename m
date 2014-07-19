From: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Subject: Re: [GIT PULL 6/7] ARM: tegra: device tree changes for 3.17
Date: Sat, 19 Jul 2014 12:52:39 -0700
Message-ID: <20140719195239.GE10514@quad.lixom.net>
References: <1405694740-4090-1-git-send-email-thierry.reding@gmail.com>
 <1405694740-4090-6-git-send-email-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1405694740-4090-6-git-send-email-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Fri, Jul 18, 2014 at 04:45:39PM +0200, Thierry Reding wrote:
> The following changes since commit 69c018268b3bbebbd0d9013a1b72831a8ae9e790:
> 
>   Merge branch 'for-3.17/xusb-padctl' into for-3.17/dt (2014-07-17 15:01:57 +0200)
> 
> are available in the git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-3.17-dt
> 
> for you to fetch changes up to 2236927d9820199bb6f29f2a89b1783c4513d34f:
> 
>   ARM: tegra: roth: add display DT node (2014-07-17 15:02:14 +0200)
> 
> ----------------------------------------------------------------
> ARM: tegra: device tree changes for 3.17
> 
> - New board support:
>   - Apalis T30
> - HDA support for Tegra124 and Venice2
> - Display on Medcom Wide and Roth
> - GK20A support on Tegra124
> - XUSB pad controller for Tegra124 and Jetson TK1
> - Various cleanups
> 
> This pulls in the for-3.17/fuse-move, for-3.17/dt-cros-ec-kbd and
> for-3.17/xusb-padctl branches to resolve dependencies.
> 
> Note that the Apalis T30 support has a runtime dependency on the
> for-3.17/pcie-regulators branch, so they should preferably be applied
> in that order. I didn't merge that branch into this because Apalis T30
> support is new, therefore can't regress, and because the dependency
> exists only at runtime.

Yep, that's the preferred way to do it. Looks good, merged into next/dt.

This also means that the kbd dependency is merged (I didn't do that
separately).


-Olof
