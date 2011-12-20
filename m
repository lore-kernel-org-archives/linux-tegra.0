From: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Subject: Re: [PATCH] arm/tegra: boards: more __init/__initdata annotations
Date: Tue, 20 Dec 2011 09:32:39 -0800
Message-ID: <CAOesGMj73O79=hwFfLFpepTy1WDXCztppZQmZ_5b4tYRhjQFjQ@mail.gmail.com>
References: <1324353802-31774-1-git-send-email-olof@lixom.net>
	<20111220082641.GQ14542@n2100.arm.linux.org.uk>
	<CAOesGMjh2DmzgjvoYZyDygADDcMwf-m7E3Np0f=h8xRWZZ6-4Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAOesGMjh2DmzgjvoYZyDygADDcMwf-m7E3Np0f=h8xRWZZ6-4Q-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Tue, Dec 20, 2011 at 9:06 AM, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org> wrote:
> On Tue, Dec 20, 2011 at 12:26 AM, Russell King - ARM Linux
> <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org> wrote:
>> On Mon, Dec 19, 2011 at 08:03:22PM -0800, Olof Johansson wrote:
>>> Silence a bunch of section warnings, and mark some of the init functions as
>>> __init.
[...]
> Thanks for pointing it out -- looks like a couple of other instances
> use the wrong location as well (probably added by me in the past).
> I'll respin the patch, and fix up those cases as well.


Actually, after some brief discussion on IRC, I'll go the other way
instead: These tables are all moving to devicetree in the next release
or so, and it's uncertain what functions should (long-term) be __init
and not. For now, I'll just remove __initdata from the seaboard pinmux
tables. Sending separate patch for that.


-Olof
