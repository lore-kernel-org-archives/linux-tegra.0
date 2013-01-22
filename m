From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH V5 1/3] clk: tegra: add Tegra specific clocks
Date: Tue, 22 Jan 2013 15:16:34 -0700
Message-ID: <50FF0FC2.6020908@wwwdotorg.org>
References: <1358369575-7325-1-git-send-email-swarren@wwwdotorg.org> <20130122212448.24671.89455@quantum>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20130122212448.24671.89455@quantum>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Prashant Gaikwad <pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 01/22/2013 02:24 PM, Mike Turquette wrote:
> Quoting Stephen Warren (2013-01-16 12:52:53)
>> From: Prashant Gaikwad <pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>>
>> Add Tegra specific clocks, pll, pll_out, peripheral, frac_divider, super.
>>
>> Signed-off-by: Prashant Gaikwad <pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>> [swarren: alloc sizeof(*foo) not sizeof(struct foo), add comments re:
>> storing pointers to stack variables, make a timeout loop more idiomatic,
>> use _clk_pll_disable() not clk_disable_pll() from _program_pll() to
>> avoid redundant lock operations, unified tegra_clk_periph() and
>> tegra_clk_periph_nodiv(), unified tegra_clk_pll{,e}, rename all clock
>> registration functions so they don't have the same name as the clock
>> structs.]
>> Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>> ---
>> V5: Implemented all changes marked [swarren] in the commit descriptions.
>>
>> Mike, These patches depend on a couple patches in the Tegra tree, and
>> various other Tegra patches depend on them. I'd like to take these through
>> the Tegra tree. Can you please ack or otherwise OK this? Thanks.
>>
> 
> For the series, including the updated v6 patch 2/3:
> 
> Acked-by: Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>

Thanks very much for the review.

I'm working on applying these patches and the other related ARM-side
patches to the Tegra for-3.9/soc branch as we speak.
