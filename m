From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH 0/7] misc Tegra clock fixes
Date: Wed, 08 Jan 2014 15:41:02 -0700
Message-ID: <52CDD3FE.1070404@wwwdotorg.org>
References: <1388105067-24438-1-git-send-email-abrestic@chromium.org> <CAL1qeaG0Y4__viWsZeoFdf8XFN3Wk7CO2abeEjzRZg+wNRV56w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAL1qeaG0Y4__viWsZeoFdf8XFN3Wk7CO2abeEjzRZg+wNRV56w-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Prashant Gaikwad <pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 01/08/2014 03:28 PM, Andrew Bresticker wrote:
> Hi Stephen, Peter,
> 
>> Fixes for various clock-related issues found during bringup of
>> Tegra124-based Venice2 and Norrin boards.
...
> Any comments on this series?

Peter owns drivers/clk/tegra/, so I assume he'll handle these patches. I
briefly looked at them when they were posted and didn't see any issues.
