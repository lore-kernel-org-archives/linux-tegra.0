From: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Subject: Re: [GIT PULL 4/7] ARM: tegra: Add XUSB pad controller support
Date: Sat, 19 Jul 2014 12:50:18 -0700
Message-ID: <20140719195018.GD10514@quad.lixom.net>
References: <1405694740-4090-1-git-send-email-thierry.reding@gmail.com>
 <1405694740-4090-4-git-send-email-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1405694740-4090-4-git-send-email-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Fri, Jul 18, 2014 at 04:45:37PM +0200, Thierry Reding wrote:
> The following changes since commit 7171511eaec5bf23fb06078f59784a3a0626b38f:
> 
>   Linux 3.16-rc1 (2014-06-15 17:45:28 -1000)
> 
> are available in the git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-3.17-xusb-padctl
> 
> for you to fetch changes up to dc0a3938668706f3a63cde4ceb431e9189fb2a0a:
> 
>   pinctrl: Add NVIDIA Tegra XUSB pad controller support (2014-07-11 14:41:06 +0200)
> 
> ----------------------------------------------------------------
> ARM: tegra: Add XUSB pad controller support
> 
> Adds device tree bindings and a driver for the XUSB pad controller found
> on Tegra114 and later. This is a prerequisites for PCIe, SATA and XUSB
> drivers which are all currently being reviewed or pending for merge.
> 
> This is a separate branch in case it needs to be pulled into the pinctrl
> tree to resolve conflicts.

Merged, thanks.


-Olof
