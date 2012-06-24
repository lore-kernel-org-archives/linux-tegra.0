From: Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>
Subject: Re: [PATCH 3/3] ARM: dt: tegra: paz00: add regulators
Date: Sun, 24 Jun 2012 14:01:58 +0200
Message-ID: <4127323.noaajNecru@ax5200p>
References: <1340406842-27135-1-git-send-email-swarren@wwwdotorg.org> <1963397.cqAXgGafFs@ax5200p> <20120624110306.GA16455@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20120624110306.GA16455-GFdadSzt00ze9xe1eoZjHA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Sunday 24 June 2012 12:03:06 Mark Brown wrote:
> On Sat, Jun 23, 2012 at 06:35:01PM +0200, Marc Dietrich wrote:
> > > The regulator configurations were all taken from the AC100 kernel used
> > > by
> 
> > > the Ubuntu port, specifically:
> These generally all look pretty broken...
> 
> > > +				regulator@0 {
> > > +					reg = <0>;
> > > +					regulator-compatible = "sm0";
> > > +					regulator-name = "+1.2vs_sm0";
> > > +					regulator-min-microvolt = < 725000>;
> > > +					regulator-max-microvolt = <1300000>;
> 
> Most of these ranges look suspiciously like the maximum possible
> variation the regulator has, not what the board actually requires (which
> is a depressingly common error, I've no idea why people seem to think
> they're supposed to cut'n'paste the physical limits of the regualtor out
> of the driver).  If something decides to take advantage of the variation
> this could be problematic.

AFAIR we saw some instabilities with 1.2 V here, but looking back, that could 
also be related to something else. Finding these "undervolt" bugs is really 
hard to do. I indeed just copied the values from the original source ( 
http://gitorious.org/ac100/kernel/blobs/2.6.32/arch/arm/mach-
tegra/odm_kit/adaptations/pmu/tps6586x/nvodm_pmu_tps6586x.c#line136 ) and 
bumped up sm0 by 100 mV for the said stabilty reasons. 

According to the datasheet, sm0 can go up to 1.5 V if I read it correctly, so 
1.3 V is still inside the spec and not the maximum the regulator can provide.

> 
> > > +				regulator@3 {
> > > +					reg = <3>;
> > > +					regulator-compatible = "ldo0";
> > > +					regulator-name = "+3.3vs_ldo0";
> > > +					regulator-min-microvolt = <1250000>;
> > 
> > I think the common sense was that this should also be 3.3 V as it is the
> > pex clock (which is not used at all on this board). I guess it doesn't
> > matter much. So ...
> > 
> > Acked-By: Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>
> > 
> > > +					regulator-max-microvolt = <3300000>;
> 
> This is one example, it looks like the rail needs to be fixed to 3.3V.

I think nowhere in the code a regulator (beside sm*) is programmed to some 
different value that the maximum given here (this is not the maximum the 
regulator can provide). I never understood why the kernel code always sets the 
regulator to the maximum value if no other value was specified. IMHO, there 
should be some initial value, e.g. regulator-default-microvolt, as the 
original driver (from 2.6.32 ages) did. This way the maximum value can be set 
to the hw limits, but maybe this is a bit dangerous.

Marc
