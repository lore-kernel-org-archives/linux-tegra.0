From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH] clk: tegra: add KBC clock for Tegra20
Date: Tue, 22 Jan 2013 11:26:05 -0700
Message-ID: <50FED9BD.5060907@wwwdotorg.org>
References: <1357946262-25823-1-git-send-email-swarren@wwwdotorg.org> <20130122182340.24671.64241@quantum>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20130122182340.24671.64241@quantum>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Prashant Gaikwad <pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 01/22/2013 11:23 AM, Mike Turquette wrote:
> Quoting Stephen Warren (2013-01-11 15:17:42)
>> From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>>
>> This clock has been missing from all our upstream clock drivers. Add it
>> by copying the tegra_clk_periph_gate() call from Tegra30; the data
>> matches what's in the ChromeOS kernel for this clock.
>>
>> Cc: Prashant Gaikwad <pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>> Cc: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>> Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>> ---
>> Mike, I'd need to apply this to the Tegra tree as part of the common
>> clock framework conversion.
>>
> 
> Is this patch going to be rolled into patch 6/9 of the larger tegra ccf
> series?

In the latest Tegra CCF series that I posted, I've rolled all these
small fixes in already.
