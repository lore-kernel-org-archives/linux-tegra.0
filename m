From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH 3/3] ARM: dt: tegra: paz00: add regulators
Date: Fri, 29 Jun 2012 11:32:30 -0600
Message-ID: <4FEDE6AE.4080409@wwwdotorg.org>
References: <1340406842-27135-1-git-send-email-swarren@wwwdotorg.org> <1340406842-27135-3-git-send-email-swarren@wwwdotorg.org> <1963397.cqAXgGafFs@ax5200p> <20120624110306.GA16455@sirena.org.uk> <4FEA3942.9040906@wwwdotorg.org> <20120626230235.GX30406@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20120626230235.GX30406-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Cc: Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 06/26/2012 05:02 PM, Mark Brown wrote:
> On Tue, Jun 26, 2012 at 04:35:46PM -0600, Stephen Warren wrote:
> 
>> So I think this sm0 (and the sm1) entry might actually be
>> correct; sm0 feeds vdd_core and sm1 feeds vdd_cpu. These rails
>> have DVFS and hence the voltage can vary. I guess I should change
>> the regulator-name in these cases to something more useful than
>> the very first signal name on the schematics too.
> 
> Even if they feed these supplies are they capable of varying on
> this board if they're shared with other things?  This is one of the
> common issues with constraints...  But generally if the supply
> covers more than one thing the idiomatic thing is to list them all
> separated by / or something.

Just FYI, the particular choice of "/" as a separator doesn't work
well, because then /sys/kernel/debug/regulator/${regulator-name} can't
be created. I guess I'll use a comma. I assume it's not worth fixing
the regulator core to s@/@,@ when generating the debugfs filenames?
