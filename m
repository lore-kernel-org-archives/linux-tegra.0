From: Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>
Subject: Re: [PATCH V2] ARM: dt: tegra: paz00: add regulators
Date: Wed, 27 Jun 2012 20:50:57 +0200
Message-ID: <21985997.TUGv5fZBXQ@ax5200p>
References: <1340757060-27232-1-git-send-email-swarren@wwwdotorg.org> <20120627113100.GF308@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20120627113100.GF308-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Wednesday 27 June 2012 12:31:01 Mark Brown wrote:
> On Tue, Jun 26, 2012 at 06:31:00PM -0600, Stephen Warren wrote:
> > sm1: HW defaults and schematic match at 1.0v. marvin24's kernel had a max
> > of 1.125v, but this wasn't applied since apply_uV wasn't set.
> 
> apply_uV is only valid if a single voltage is specified.  

yes, that's why there is a ".apply_uV = (_minmv == _maxmv)" in the regulator 
macro.

> If a voltage
> range were specified and it were acted on we'd take the lowest (not
> highest) voltage allowed.

Sorry, I don't get it. In this case, the board wouldn't boot at all because 
nearly all supplies would be undervoltaged. I just checked and all voltages 
are actually set to the *highest* (max) value. Maybe they aren't changed at 
all?

Marc
