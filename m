From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v5][resend v4] of: replace Asahi Kasei Corp
	vendor prefix
Date: Fri, 09 Jan 2015 14:55:40 +0100
Message-ID: <5363275.ZK3ulH6EUO@wuerfel>
References: <878ulzx6hr.wl%kuninori.morimoto.gx@gmail.com>
 <871tn4uv0j.wl%kuninori.morimoto.gx@renesas.com>
 <CAL_Jsq+GjM+3M63amyh3Rvijkz7Lch_cdUt9vScc9wZeOubOPA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <alsa-devel-bounces@alsa-project.org>
In-Reply-To: <CAL_Jsq+GjM+3M63amyh3Rvijkz7Lch_cdUt9vScc9wZeOubOPA@mail.gmail.com>
List-Unsubscribe: <http://mailman.alsa-project.org/mailman/options/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <http://mailman.alsa-project.org/mailman/listinfo/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: alsa-devel-bounces@alsa-project.org
To: linux-arm-kernel@lists.infradead.org
Cc: Rob Herring <robh@kernel.org>, ALSA Development Mailing List <alsa-devel@alsa-project.org>, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Stephen Warren <swarren@wwwdotorg.org>, Olof Johansson <olof@lixom.net>, Mark Brown <broonie@kernel.org>, SH-Linux <linux-sh@vger.kernel.org>, Magnus Damm <magnus.damm@gmail.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, Simon Horman <horms@verge.net.au>, Geert Uytterhoeven <geert@linux-m68k.org>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, Simon Horman <horms+renesas@verge.net.au>, Andrew Morton <akpm@linux-foundation.org>, Linus Torvalds <torvalds@linux-foundation.org>
List-Id: linux-tegra@vger.kernel.org

On Friday 09 January 2015 07:46:16 Rob Herring wrote:
> On Fri, Jan 9, 2015 at 4:07 AM, Kuninori Morimoto
> <kuninori.morimoto.gx@renesas.com> wrote:
> >
> > Hi Stephen
> >
> > Thank you for your feedback
> >
> >> > I'm sending this "of: replace Asahi Kasei Corp vendor prefix" during
> >> > half-year (since Jun 2014) , many times. But, no-one care it.
> >> > I don't know who is the best maintainer.
> >> >  - Stephen : because it has Tegra ?
> >> >  - Olof    : because it has Tegra (= ARM) ?
> >> >  - Arnd    : because it has Tegra (= ARM) ?
> >> >  - Matthias: because it has Tegra (= ARM SoC) ?
> >> >  - Rob     : because DT ?
> >> >  - Andrew  : Last chance ?
> >> >
> >> > But, could you please care this patch ?
> >> > I will re-send it again
> >>
> >> It doesn't seem to be ack'd by any of the DT maintainers. Retro-actively
> >> changing a DT vendor name would need that, I think.
> >
> > Rob ?
> > I had sent this patch to him since half-years ago, many times...
> > Or other maintainer ?
> >
> >> Thierry and Alex (both Tegra maintainers) appear to have ack'd it, so it
> >> seems they expect it to go through some tree other than Tegra. Weren't
> >> there a bunch of related patches along with this (e.g. updating relevant
> >> drivers to support both prefixes?) so it was expected this patch would
> >> be applied together with them?
> >
> > I guess they expected it goes to DT branch (?)
> > This is only 1 patch. it doesn't have related patch-set
> 
> It is in my queue. If the users of it are fine with breaking things,
> who am I to argue with them.

It's an i2c device, so it won't break, based on the implementation
we use in the kernel that ignores the vendor part when the part number
matches the i2c driver name.

I also don't think we need to worry about any non-Linux operating
systems on this board that might share the same dts file.

	Arnd
