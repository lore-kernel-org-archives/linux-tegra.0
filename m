From: Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>
Subject: Re: [PATCH V2] ARM: dt: tegra: paz00: add regulators
Date: Wed, 27 Jun 2012 21:01:19 +0200
Message-ID: <3814450.qCgZjqmj5N@ax5200p>
References: <1340757060-27232-1-git-send-email-swarren@wwwdotorg.org> <21985997.TUGv5fZBXQ@ax5200p> <4FEB5741.6020400@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <4FEB5741.6020400-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Wednesday 27 June 2012 12:56:01 Stephen Warren wrote:
> On 06/27/2012 12:50 PM, Marc Dietrich wrote:
> > On Wednesday 27 June 2012 12:31:01 Mark Brown wrote:
> >> On Tue, Jun 26, 2012 at 06:31:00PM -0600, Stephen Warren wrote:
> >>> sm1: HW defaults and schematic match at 1.0v. marvin24's kernel had a
> >>> max
> >>> of 1.125v, but this wasn't applied since apply_uV wasn't set.
> >> 
> >> apply_uV is only valid if a single voltage is specified.
> > 
> > yes, that's why there is a ".apply_uV = (_minmv == _maxmv)" in the
> > regulator macro.
> > 
> >> If a voltage
> >> range were specified and it were acted on we'd take the lowest (not
> >> highest) voltage allowed.
> > 
> > Sorry, I don't get it. In this case, the board wouldn't boot at all
> > because
> > nearly all supplies would be undervoltaged. I just checked and all
> > voltages
> > are actually set to the *highest* (max) value. Maybe they aren't changed
> > at
> > all?
> 
> Yes, in the absence of any explicit action (i.e. a call to
> regulator_set_voltage() elsewhere), the regulator core doesn't reprogram
> the regulator at registration time, except for a few specific conditions
> e.g. something like when min==max and apply_uV is set.
> 
> I imagine the DVFS code in your downstream kernel /is/ calling
> regulator_set_voltage() later, assuming that config option is enabled
> anyway. See arch/arm/mach-tegra/{dvfs.c,tegra2_dvfs.c}.

Great, so all the tables (except sm0/1) were moot :-( At least I learned 
something again ;-)

Stephen, I'm going to test your patch, just a few minutes ...

Thanks

Marc
