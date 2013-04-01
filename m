From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH 1/2] ARM: tegra: move <mach/powergate.h> to <linux/tegra-powergate.h>
Date: Mon, 01 Apr 2013 10:08:31 -0600
Message-ID: <5159B0FF.2010408@wwwdotorg.org>
References: <1364602790-10759-1-git-send-email-swarren@wwwdotorg.org> <201303301413.26549.arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <201303301413.26549.arnd-r2nGTMty4D4@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 03/30/2013 08:13 AM, Arnd Bergmann wrote:
> On Saturday 30 March 2013, Stephen Warren wrote:
>> From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>>
>> This is required so that code such as Tegra's PCIe and clock drivers
>> can still access this header file once Tegra is converted to
>> multiplatform, and <mach/> no longer exists.
>>
>> Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> 
> It sounds like this should be integrated in the reset controller API
> that Philipp Zabel just posted. I'm not blaming you for now knowing
> about it, since I only saw it myself a few days ago, and my interpretation
> could be wrong. Are you able to move to that API before 3.10?

Well, I wrote the binding for it:-)

> If not, we can probably take your patch for now, if you remove it
> again for 3.11.

There are at least a couple of different things in this file:

a) The reset API, which definitely should be converted to the new reset
API. I can't make any promises about which kernel release that will
happen in, but it's definitely something we know we have to do.

b) Power-gating. This should probably be converted to use the
powerdomains code. I believe Joseph Lo is aware of this, but again I
can't promise any specific time-scale at this time.

So is this still OK, without any promises of timescale?
