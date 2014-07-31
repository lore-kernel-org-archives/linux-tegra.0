From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH 2/5] char: tile-srom: Remove reference to platform_bus
Date: Thu, 31 Jul 2014 14:32:27 -0700
Message-ID: <20140731213227.GB25027@kroah.com>
References: <1406298233-27876-1-git-send-email-pawel.moll@arm.com>
 <1406298233-27876-2-git-send-email-pawel.moll@arm.com>
 <53DAA605.2030500@tilera.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <53DAA605.2030500@tilera.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Chris Metcalf <cmetcalf@tilera.com>
Cc: Pawel Moll <pawel.moll@arm.com>, Olof Johansson <olof@lixom.net>, Stephen Warren <swarren@wwwdotorg.org>, Catalin Marinas <Catalin.Marinas@arm.com>, paul@pwsan.com, Arnd Bergmann <arnd@arndb.de>, Peter De Schrijver <pdeschrijver@nvidia.com>, arm@kernel.org, linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On Thu, Jul 31, 2014 at 04:24:37PM -0400, Chris Metcalf wrote:
> On 7/25/2014 10:23 AM, Pawel Moll wrote:
> >The code was creating "srom" class devices using
> >platform_bus as a parent. As they are not really
> >platform devices, make them virtual, using NULL instead.
> >
> >Cc: Chris Metcalf<cmetcalf@tilera.com>
> >Signed-off-by: Pawel Moll<pawel.moll@arm.com>
> >---
> >  drivers/char/tile-srom.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> Can you clarify the point of this change a bit?  The SROM devices
> in question are real devices (bits of silicon on the processor die), not
> some kind of virtual construct.

Then tie them to the "real" parent device that they live on, don't try
to hang them under the platform bus where they don't belong.

> In addition, we also have user binaries in the wild that know to look
> for /sys/devices/platform/srom/ paths,

That's never a good idea, you should be iterating over your bus's
devices, to find your devices, not at a specific location within the
/sys/devices/ tree, as that is guaranteed to move around over time.
It's also why we have those symlinks and lists of devices in your bus
directory.

> so I'm pretty reluctant to change this path without good reason.

Because srom is not a platform device, so why would you put it at the
root of the platform device "tree"?

thanks,

greg kh
