From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH] ARM: v7 setup function should invalidate L1 cache
Date: Wed, 20 May 2015 00:18:43 +0200
Message-ID: <8164344.VcU8v2tIF5@wuerfel>
References: <E1Yuk8W-0001tC-IK@rmk-PC.arm.linux.org.uk>
 <2080993.BUNZpO9uLL@wuerfel> <20150519220721.GK2067@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <20150519220721.GK2067-l+eeeJia6m9vn6HldHNs0ANdhmdF6hFW@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-rockchip/>
List-Post: <mailto:linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-rockchip" <linux-rockchip-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Cc: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, linux-sh-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Magnus Damm <magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Michal Simek <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, Wei Xu <xuwei5-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Michael =?ISO-8859-1?Q?Niew=F6hner?= <mniewoeh-0BV18Q16miHGpFsiFCTsGXqWYbMAw+HU@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Marc Carino <marc.ceeeee-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Simon Horman <horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>, Gregory Fong <gregory.0xf0-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, =?ISO-8859-1?Q?S=C3=B6ren?= Brinkmann <soren.brinkman>
List-Id: linux-tegra@vger.kernel.org

On Tuesday 19 May 2015 23:07:21 Russell King - ARM Linux wrote:
> If you look carefully at this, you'll notice that it's utter crap.
> (Sorry, but it is.)  It has two problems:
> 
> 1. It'll never match a Cortex-A9 CPU.  Cortex-A9 has a MIDR value of
>    0x412fc09a, not 0x00000c09.  The bit position of the part number
>    field isn't even right.
>
> 2. If it does match, then we branch to "v7_invalidate_l1" without setting
>    the link register: we'll never return back here (we'll return to whatever
>    random value the link register contains) and so we'll never make it to
>    secondary_startup.  *Thankfully*, because of (1), this branch will
>    never be taken - this is it's saving grace.

Yes, I've understood both before.
 
> Your patch introduces a /third/ form of crapiness:
> 
> 3. If the PSR happens to have Z=1, the "beq" instruction will be taken,
>    thereby crashing the system because of (2).

Right, this was the result of sloppiness on my side when fat-fingering
a patch for illustration.
 
> The /simplest/ change which would fix this problem is to just change
> proc-v7.S.  The remainder is effectively a cleanup removing redundant
> code.

Fair enough. I wasn't sure if we're confident enough about that
change already to put it into stable backports. If the risk is low
enough, that's fine.

	Arnd
