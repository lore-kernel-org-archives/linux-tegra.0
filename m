From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [RESEND PATCH] ARM: tegra: fix erroneous address in dts
Date: Thu, 21 Jul 2016 14:28:55 +0200
Message-ID: <6423681.52qkIkgFBQ@wuerfel>
References: <1468835208-13426-1-git-send-email-ralf@ramses-pyramidenbau.de> <20160718095802.GA422@ulmo.ba.sec>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20160718095802.GA422@ulmo.ba.sec>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: arm@kernel.org, Ralf Ramsauer <ralf@ramses-pyramidenbau.de>, Stephen Warren <swarren@wwwdotorg.org>, Alexandre Courbot <gnurou@gmail.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On Monday, July 18, 2016 11:58:02 AM CEST Thierry Reding wrote:
> On Mon, Jul 18, 2016 at 11:46:48AM +0200, Ralf Ramsauer wrote:
> > c90bb7b enabled the high speed UARTs of the Jetson TK1. Due to a merge
> > quirk, wrong addresses were introduced. Fix it and use the correct
> > addresses.
> > 
> > Thierry let me know, that there is another patch (b5896f67ab3c in
> > linux-next) in preparation which removes all the '0,' prefixes of unit
> > addresses on Tegra124 and is planned to go upstream in 4.8, so
> > this patch will get reverted then.
> > 
> > But for the moment, this patch is necessary to fix current misbehaviour.
> > 
> > Fixes: c90bb7b9b9 ("ARM: tegra: Add high speed UARTs to Jetson TK1 device tree")
> > Signed-off-by: Ralf Ramsauer <ralf@ramses-pyramidenbau.de>
> > Acked-by: Thierry Reding <thierry.reding@gmail.com>
> > Cc: linux-tegra@vger.kernel.org
> > ---
> >  arch/arm/boot/dts/tegra124-jetson-tk1.dts | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> ARM-SoC maintainers,
> 
> Just to clarify, this is targetted at v4.7 because the offending patch
> was merged in v4.7-rc1. If at all possible it'd be great to get this in,
> even if this is terribly last minute.
> 

I've applied it to the fixes branch, but as Linus is currently offline
and hasn't pulled the previous set of fixes, I suspect it's not
going to make it.

Olof, do you think we should send an amended pull request, or are
we at the point where nothing gets pulled anyway?

	Arnd
