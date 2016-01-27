From: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v2 1/2] ARM: tegra: Fixed typo
Date: Wed, 27 Jan 2016 18:15:50 +0900
Message-ID: <56A88AC6.4090105@nvidia.com>
References: <1453827558-10954-1-git-send-email-ralf@ramses-pyramidenbau.de>
 <1453827558-10954-2-git-send-email-ralf@ramses-pyramidenbau.de>
 <CAAVeFuKiaSZH5RF=zEnYVoRU_rtVvONRYdtGbK=fgV_icO8tDw@mail.gmail.com>
 <56A883C7.9000007@ramses-pyramidenbau.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <56A883C7.9000007-ex4EvEgDZR1o7HI0AxOeTKwczVv4G7md@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ralf Ramsauer <ralf-ex4EvEgDZR1o7HI0AxOeTKwczVv4G7md@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 01/27/16 17:45, Ralf Ramsauer wrote:
> On 01/27/2016 08:59 AM, Alexandre Courbot wrote:
>> Hey Ralf, thanks for following up with patches as we discussed in private!
>>
>> Small nit: you will want to use the active form ("Fix typo" instead of
>> "Fixed typo") in your commit messages.
> So even my language skills got improved ;-)

This is grammatically correct, but using imperative form is the 
convention in the kernel. As per Documentation/SubmittingPatches:

Describe your changes in imperative mood, e.g. "make xyzzy do frotz"
instead of "[This patch] makes xyzzy do frotz" or "[I] changed xyzzy
to do frotz", as if you are giving orders to the codebase to change
its behaviour.

>> It would also be nice if the commit title was a little more precise
>> about where the typo has been corrected.
> Uhm - as this is be pretty small non-diff-related change... Is it
> necessary to send a v3 or would it also be okay to let the maintainer
> amend the subject?
> (to sth.: like "ARM: tegra: Fix the same C&P typo in several dts includes")

Let's see what Thierry says about this.
