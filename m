From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH] clk: tegra: Don't enable PLLs during early boot
Date: Mon, 25 Mar 2013 11:32:38 -0600
Message-ID: <51508A36.2010605@wwwdotorg.org>
References: <1363953308-28828-1-git-send-email-pdeschrijver@nvidia.com> <514C7D3B.40602@wwwdotorg.org> <20130325101542.GB18519@tbergstrom-lnx.Nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20130325101542.GB18519-Rysk9IDjsxmJz7etNGeUX8VPkgjIgRvpAL8bYrjMMd8@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Prashant Gaikwad <pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 03/25/2013 04:15 AM, Peter De Schrijver wrote:
> On Fri, Mar 22, 2013 at 04:48:11PM +0100, Stephen Warren wrote:
>> On 03/22/2013 05:54 AM, Peter De Schrijver wrote:
>>> The PLL code relies on udelay() which is not available when CCF is
>>> initialized. Hence we can't enable any PLL during this phase.
...
>>> Can you confirm this is ok for the audio drivers?
>>>
>>> We used to be lucky that this has worked up to now, but I will introduce some
>>> changes to the pll lock check code which cause this to fail due to the
>>> slight differences in timing.
>>
>> No, this won't work for the audio drivers; they assume the clock is
>> enabled when they start.
...
>> Perhaps this is due to initializing the Tegra clock driver in the
>> machine descriptor's init_irq function, rather than in the init_machine
>> function? Can this be moved?
> 
> Maybe. But we need the clockframework before the timers are initialized...
> So I have to check the dependencies.

In kernel 3.8, the initialization of the Tegra clock driver and the
processing of the "clock initialization table" were separate. The clock
driver used to be initialized in .init_early(), whereas the clock init
table was processed in .init_machine().

In 3.9, those two things have been conflated into .init_irq().

Is the solution here to separate those two initialization steps again;
leave the base clock driver init in .init_irq() since that's where it
needs to be for unrelated reasons, but move the processing of the clock
init table back into .init_machine() so that there are no restrictions
re: which clocks can actually be initialized?

That would probably require exposing some custom API from the Tegra clk
driver for the Tegra DT board file to call to process the clock init
table, but that should be pretty easy to do, and shouldn't cause any
scalability issues.

Perhaps that extra API can even be standardized later, along with some
way of representing the initial clock tree parenting/... setup in the
DT, and thus making it useful for any SoC.
