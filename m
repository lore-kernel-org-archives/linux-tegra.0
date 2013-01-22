From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH] clk: tegra: ensure all provided clock values are valid
 cookies
Date: Tue, 22 Jan 2013 11:38:28 -0700
Message-ID: <50FEDCA4.3050407@wwwdotorg.org>
References: <1358187400-6824-1-git-send-email-swarren@wwwdotorg.org> <20130122182934.24671.1867@quantum>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20130122182934.24671.1867@quantum>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Prashant Gaikwad <pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 01/22/2013 11:29 AM, Mike Turquette wrote:
> Quoting Stephen Warren (2013-01-14 10:16:40)
>> From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>>
>> Tegra's clock implementation uses pointers as the clock cookies, and
>> hence chooses to make NULL an invalid clock cookie. However, there are
>> gaps in the assigned device tree clock IDs, and hence the array mapping
>> DT clock ID contains entries with NULL values (uninitialized BSS) unless
>> explicit action is taken. This patch enhances the Tegra clock code to
>> detect this case and explicitly initialize those lookup table entries to
>> an error value. This prevents clk_get() from ever returning NULL. Hence,
>> Tegra's clock APIs don't have to check the clock cookie they're passed
>> for NULL.
>>
>> Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>> ---
>> Mike, this also will need to go through the Tegra tree; just looking for
>> any review/ack from you. Thanks.
> 
> Stephen,
> 
> I think this is a bit strange.  Will you have gaps in the DT clock id's
> forever or is this a temporary issue?

Forever as far as I know. Since the clock IDs are just arbitrary tokens,
I don't see any particular need for them to be strictly packed.

> Also it is important than any driver using the clock api does not
> dereference the struct clk pointer and assume that a NULL clk is
> invalid.  I know that this series doesn't imply any such thing but I
> wanted to state that anyways.

Right. This ensures that clk_get() returns an IS_ERR() pointer, or a
valid cookie that the clock driver is prepared to handle (which doesn't
include NULL).

> Also are you planning to roll this into the existing tegra ccf series?

It's already rolled into the latest version of the series which I posted.
