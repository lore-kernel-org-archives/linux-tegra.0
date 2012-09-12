From: "Turquette, Mike" <mturquette-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH 2/2] ARM: tegra: cpu-tegra: explicitly manage re-parenting
Date: Tue, 11 Sep 2012 20:57:40 -0700
Message-ID: <CAJOA=zP5mYLBKGcTzEoJEfNa5WLbdBei0BeN26Qgn=CJyXw=1Q@mail.gmail.com>
References: <1347318758-7954-1-git-send-email-swarren@wwwdotorg.org>
 <1347318758-7954-2-git-send-email-swarren@wwwdotorg.org> <20120911044530.20289.8165@nucleus>
 <20120912041001.GB3402@S2100-06.ap.freescale.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20120912041001.GB3402-+NayF8gZjK2ctlrPMvKcciBecyulp+rMXqFh9Ls21Oc@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Prashant Gaikwad <pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Tue, Sep 11, 2012 at 9:10 PM, Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
> On Mon, Sep 10, 2012 at 09:45:30PM -0700, Mike Turquette wrote:
>> > To solve this, have the Tegra cpufreq driver explicitly perform the
>> > reparenting operations itself. This is probably reasonable anyway,
>> > since such reparenting is somewhat a matter of policy (e.g. which
>> > alternate clock source to use, whether to leave the CPU clock a child
>> > of the alternate clock source if it's running at the desired rate),
>> > and hence is something more appropriate for the cpufreq driver than
>> > the core clock driver anyway.
>> >
>>
>> I definitely agree about the policy.  Just FYI I'm hacking on an RFC to
>> make reparenting clocks from a call to clk_set_rate even easier, but
>> perhaps in your case it is better the cpufreq driver knows the clock
>> tree topology details.
>>
> I disagree.  The whole point of clock framework is to hide clock details
> like tree topology behind clock API, so that we do not need every single
> clock client driver to handle those details on their own.  It's
> definitely desired to have clk_set_rate call handle reparenting nicely.
>
> From what I see, if tegra clock driver can handle the dependency between
> cpu_clk and emc_clk that is currently handled in cpufreq driver.  It's
> likely that the generic cpufreq driver (cpufreq-cpu0) would work for
> tegra.  But with this patch, the driver moves to the opposite direction.
>

Hmm, the cpufreq-cpu0 case is a good point.  Well like I said in my
previous email this can be done in the framework.  I'll try to get an
example of this on the list ASAP but of course my todo list is a fifo
not a stack.

Regards,
Mike

> Regards,
> Shawn
>
