From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH V3 1/2] clocksource: add common of_clksrc_init() function
Date: Tue, 20 Nov 2012 13:38:42 -0700
Message-ID: <50ABEA52.6070405@wwwdotorg.org>
References: <1353439206-1654-1-git-send-email-swarren@wwwdotorg.org> <20121120201026.GF6280@kryptos>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20121120201026.GF6280@kryptos>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Josh Cartwright <josh.cartwright-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: John Stultz <johnstul-r/Jw6+rmf7HQT0dZR+AlfA@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 11/20/2012 01:10 PM, Josh Cartwright wrote:
> On Tue, Nov 20, 2012 at 12:20:05PM -0700, Stephen Warren wrote:
>> From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>>
>> It is desirable to move all clocksource drivers to drivers/clocksource,
>> yet each requires its own initialization function. We'd rather not
>> pollute <linux/> with a header for each function. Instead, create a
>> single of_clksrc_init() function which will determine which clocksource
>> driver to initialize based on device tree.
>>
>> Inspired by a similar patch for drivers/irqchip by Thomas Petazzoni.
>>
>> Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>> ---
>> v3: Use a linker section to replace manually maintained table.
>> v2: New patch.
>>
> [..]
>> --- /dev/null
>> +++ b/drivers/clocksource/clksrc-of.c

>> +void __init clocksource_of_init(void)
...
>> +	for ( ; table < stop; table++) {
>> +		for_each_matching_node(np, *table) {
>> +			match = of_match_node(*table, np);
>> +			init_func = match->data;
>> +			init_func();
> 
> Hmm.  Am I crazy, or does this for_each_matching_node()/of_match_node()
> pattern end up walking the match table twice, unnecessarily?

Yes, that's true.

> I'm wondering if we can come up with a for_each_matching_node_id() macro
> that also provides a pointer to the matching of_device_id...

Good idea; I'll do that.
