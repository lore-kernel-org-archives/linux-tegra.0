From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH] clk: tegra: use _clk_pll_disable from _program_pll
Date: Tue, 22 Jan 2013 11:42:56 -0700
Message-ID: <50FEDDB0.9030008@wwwdotorg.org>
References: <1358188572-13005-1-git-send-email-swarren@wwwdotorg.org> <20130122183142.24671.75933@quantum>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20130122183142.24671.75933@quantum>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Prashant Gaikwad <pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Sivaram Nair <sivaramn-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 01/22/2013 11:31 AM, Mike Turquette wrote:
> Quoting Stephen Warren (2013-01-14 10:36:12)
>> From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>>
>> _program_pll() was dropping the PLL's lock and calling clk_pll_disable().
>> clk_pll_disable() does nothing but acquire the same lock and call
>> _clk_pll_disable(). So, remove the lock manipulation code, and just call
>> _clk_pll_disable() directly instead.
>>
>> Reported-by: Sivaram Nair <sivaramn-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>> Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>> ---
>> Mike, this also will need to go through the Tegra tree; just looking for
>> any review/ack from you. Thanks.
> 
> Stephen,
> 
> This change looks good to me, but should it not be rolled into the tegra
> CCF series?  Several patches on top of that series have surfaced; do you
> plan on posting a V6?

(in order to help you find the patches in the list) I posted v5 on 1/16
1:52pm Mountain time, and I posted v6 on 1/17 3:05pm Mountain time. For
v6, only patch 1/3 had any modifications relative to v5, so I didn't
repost the other 2 patches.
