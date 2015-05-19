From: Russell King - ARM Linux <linux@arm.linux.org.uk>
Subject: Re: [PATCH] ARM: v7 setup function should invalidate L1 cache
Date: Tue, 19 May 2015 23:32:47 +0100
Message-ID: <20150519223247.GN2067@n2100.arm.linux.org.uk>
References: <E1Yuk8W-0001tC-IK@rmk-PC.arm.linux.org.uk>
 <2080993.BUNZpO9uLL@wuerfel>
 <20150519220721.GK2067@n2100.arm.linux.org.uk>
 <8164344.VcU8v2tIF5@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-sh-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <8164344.VcU8v2tIF5@wuerfel>
Sender: linux-sh-owner@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: linux-arm-kernel@lists.infradead.org, Heiko Stuebner <heiko@sntech.de>, Andrew Lunn <andrew@lunn.ch>, linux-sh@vger.kernel.org, Gregory Clement <gregory.clement@free-electrons.com>, Thierry Reding <thierry.reding@gmail.com>, Alexandre Courbot <gnurou@gmail.com>, Florian Fainelli <f.fainelli@gmail.com>, Magnus Damm <magnus.damm@gmail.com>, Michal Simek <michal.simek@xilinx.com>, Wei Xu <xuwei5@hisilicon.com>, linux-rockchip@lists.infradead.org, bcm-kernel-feedback-list@broadcom.com, =?iso-8859-1?B?U8O2cmVu?= Brinkmann <soren.brinkmann@xilinx.com>, Michael =?iso-8859-1?Q?Niew=F6hner?= <mniewoeh@stud.hs-offenburg.de>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Jason Cooper <jason@lakedaemon.net>, Stephen Warren <swarren@wwwdotorg.org>, Marc Carino <marc.ceeeee@gmail.com>, Simon Horman <horms@verge.net.au>, Gregory Fong <gregory.0xf0@gmail.com>linux-
List-Id: linux-tegra@vger.kernel.org

On Wed, May 20, 2015 at 12:18:43AM +0200, Arnd Bergmann wrote:
> On Tuesday 19 May 2015 23:07:21 Russell King - ARM Linux wrote:
> > The /simplest/ change which would fix this problem is to just change
> > proc-v7.S.  The remainder is effectively a cleanup removing redundant
> > code.
> 
> Fair enough. I wasn't sure if we're confident enough about that
> change already to put it into stable backports. If the risk is low
> enough, that's fine.

When the kernel is entered from the decompressor, the last steps just
before calling the kernel is to clean and invalidate the caches, then
turn them off, and then jump to the kernel.

So, there _should_ be no dirty cache lines which we rely upon at this
point - if there was dirty data in the cache, then it hasn't been flushed
to memory, and we're potentially going to crash because some part of
the decompressed kernel image hasn't been flushed out to memory.

So I'll put a confidence value of 99.999% on this.

The case which might bite people is if they bypass the decompressor.
Even then, leaving bits of the kernel image in the caches is really
dodgy.

-- 
FTTC broadband for 0.8mile line: currently at 10.5Mbps down 400kbps up
according to speedtest.net.
