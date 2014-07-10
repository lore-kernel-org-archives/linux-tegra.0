From: Tomeu Vizoso <tomeu.vizoso-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
Subject: Re: [RFC v2 0/5] Per-user clock constraints
Date: Thu, 10 Jul 2014 10:00:44 +0200
Message-ID: <53BE482C.9000503@collabora.com>
References: <1404398323-18934-1-git-send-email-tomeu.vizoso@collabora.com> <53BDA31D.40502@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
	format=flowed
Content-Transfer-Encoding: 7BIT
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <53BDA31D.40502-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Tomasz Figa <tomasz.figa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, rabin-66gdRtMMWGc@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Javier Martinez Canillas <javier.martinez-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 07/09/2014 10:16 PM, Tomasz Figa wrote:
> Hi Tomeu,
>
> On 03.07.2014 16:38, Tomeu Vizoso wrote:
>> Hello,
>>
>> here is another round for commenting, not very different from the first one.
>>
>> Something I forgot to mention before is that the function rename was performed
>> by the scripts in:
>>
>> http://cgit.collabora.com/git/user/tomeu/linux.git/commit/?h=clk-refactoring-4&id=0e983e28864229f2cd525f87d59e034c4876b233
>>
>> As before, I have only checked that drivers/clk/ builds with allyesconfig, and
>> that a kernel can be built for tegra_defconfig.
>
> This is quite an interesting series. I have reviewed two of five patches
> and have plans to look at remaining ones, however here are few general
> issues I'd like to raise:
>
> - somehow I don't see patch 2/5 on LAKML. Too big?

Yes, I'm not sure what I can do about that, but it's only automated 
function renaming. I'm going to send v3 in a bit and will CC you.

> - I see the series changing particular clock drivers. A good practice
> would be to Cc respective driver maintainers to take a look at those
> changes.

Now that I'm more confident about this approach, for the next version 
I'm going to CC them as well.

> - please make sure that all the patches don't have checkpatch errors or
> significant warnings.

Sure.

> Will try (myself or by asking someone else) to do some testing on
> Samsung platforms.

That will be great, thanks. One scenario I'm looking forward to test 
this with is low system load while the display is being updated often at 
a high resolution.

I would expect to see that the Exynos5 devfreq driver sets a relatively 
low floor frequency, and the DC driver overrides that by setting a 
higher floor, based on the calculated bandwidth that will be required to 
move pixels around.

Regards,

Tomeu

> Best regards,
> Tomasz
>
