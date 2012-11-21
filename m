From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [PATCH V4 1/3] of: introduce for_each_matching_node_and_match()
Date: Wed, 21 Nov 2012 10:06:16 +0000
Message-ID: <CACxGe6u5UBqVPrBqwn9rhjuBx4uCuuHKU=FcvSp0GJ2G8ogSNQ@mail.gmail.com>
References: <1353453142-4973-1-git-send-email-swarren@wwwdotorg.org> <201211210953.20552.arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <201211210953.20552.arnd-r2nGTMty4D4@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Josh Cartwright <josh.cartwright-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, John Stultz <johnstul-r/Jw6+rmf7HQT0dZR+AlfA@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Wed, Nov 21, 2012 at 9:53 AM, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org> wrote:
> On Tuesday 20 November 2012, Stephen Warren wrote:
>> However, this results in iterating over table twice; the second time
>> inside of_match_node(). The implementation of for_each_matching_node()
>> already found the match, so this is redundant. Invent new function
>> of_find_matching_node_and_match() and macro
>> for_each_matching_node_and_match() to remove the double iteration,
>> thus transforming the above code to:
>>
>>     for_each_matching_node_and_match(np, table, &match)
>>
>> Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>
> This look useful, but I wonder if the interface would make more sense if you
> make the last argument to the macro a normal pointer, rather than a
> pointer-to-pointer. You can take the reference as part of the macro.

To me that makes for harder to understand code. It *looks* like an
argument to a normal function call, but it gets changed by the caller.

g.
