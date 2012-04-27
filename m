From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: Tegra board file deprecation schedule
Date: Fri, 27 Apr 2012 15:53:44 -0600
Message-ID: <4F9B1568.9070704@wwwdotorg.org>
References: <4F9B0E7C.1060408@wwwdotorg.org> <CAOesGMh3NY4cQERSQY-p0QsMtcCXyhkdGSGnnrckcz8-DPjbBw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAOesGMh3NY4cQERSQY-p0QsMtcCXyhkdGSGnnrckcz8-DPjbBw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Cc: "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>, Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>, ARM kernel mailing list <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 04/27/2012 03:39 PM, Olof Johansson wrote:
> On Fri, Apr 27, 2012 at 2:24 PM, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org> wrote:
>> Eventually, Tegra support will become device tree only in the mainline
>> kernel; arch/arm/mach-tegra/board* will be deleted.
>>
>> I propose the following policy towards this goal: I'd like to maintain
>> the board files until the relevant device tree file has the same level
>> of functionality. Once that is achieved, and a Linus kernel is release
>> with full support for the board via device tree, the board files can be
>> deleted from the next kernel release.
...
> Sounds great, but I think you can be more aggressive than this; no
> need to keep the non-DT board alive for the final release.

I'm slightly hesitant not to have some overlap. But then again, I very
rarely use non-DT these days anyway, so it's not like it gets tested
much, unless anyone else is doing it silently.

>> The device tree conversion status is:
...
> if this is the only thing holding it up sunsetting all non-DT boards
> on tegra then I suggest just adding a one-time runtime test that adds
> a platform device on that device tree platform. As long as there
> aren't more of them creeping in over time that should be OK.

The only one sticking point might be that the Harmony regulator
initialization needs to wait for the regulator driver to be probed, but
happen before the PCIe driver is registers. Perhaps we could hook up
some temporary bus notifiers to handle that. But since PCIe will likely
be fixed in 3.6, we could probably just wait for that on Harmony.

Other than that, it's probably all very easy. I'll work on some patches
and maybe we can at least bring in the TrimSlice and Paz00 schedule.
