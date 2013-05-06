From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH resend 1/2] clk: tegra: remove USB from clk init table
Date: Mon, 06 May 2013 15:05:24 -0600
Message-ID: <51881B14.7030703@wwwdotorg.org>
References: <1366011105-2351-1-git-send-email-dev@lynxeye.de> <516EDC0B.1060105@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <516EDC0B.1060105-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>, "mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 04/17/2013 11:29 AM, Stephen Warren wrote:
> On 04/15/2013 01:31 AM, Lucas Stach wrote:
>> The USB clocks are just clock gates, so no need to set a specific clock.
>> In fact trying to set a specific clock is just a NOP if the requested
>> clockrate is the same as those of the parent (clk_m) or will trigger a
>> WARN_ON() if rates don't match up.
>>
>> As we are not setting a specific rate, nor activating the clocks at
>> init, there is no point in keeping the the usb entries in the clock init
>> table.
> 
> Lucas, these two patches look good for me. I'm just waiting on Mike's
> ack to forward them to arm-soc. If that doesn't happen today, feel free
> to forward them to arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org when it does, with a note requesting
> they be applied since I'm away on vacation. ...

It looks like this didn't happen, so I'll forward the patches today.
