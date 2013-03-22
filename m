From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH 1/1] clk: tegra: Fix periph_clk_to_bit macro
Date: Fri, 22 Mar 2013 12:43:02 -0600
Message-ID: <514CA636.9000005@wwwdotorg.org>
References: <1362606444-19970-1-git-send-email-achew@nvidia.com> <514B66A1.6020101@wwwdotorg.org> <20130321212542.834.78153@quantum>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20130321212542.834.78153@quantum>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Andrew Chew <achew-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Yen Lin <yelin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 03/21/2013 03:25 PM, Mike Turquette wrote:
> Quoting Stephen Warren (2013-03-21 12:59:29)
>> On 03/06/2013 02:47 PM, Andrew Chew wrote:
>>> The parameter name should be "gate", not "periph".  This worked, however,
>>> because it happens that everywhere periph_clk_to_bit is called, "gate" was
>>> in the local scope.
>>
>> Mike, could you please ack this so that I can take it through the Tegra
>> tree with the rest of the Tegra clock changes for 3.10? Thanks.
>>
>> Oh, I see this was never sent to Mike:-( Hence, I'm quoting the whole patch.
>>
> 
> Thanks for looping me in to the original patch.
> 
> I'm still going through v7 of the tegra114 patches now, so acking this
> is is a bit out-of-sequence, but the change is trivial enough:
> 
> Acked-by: Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>

Thanks.

This is actually a fix for the previous existing clock drivers for
Tegra20 and Tegra30, so I'll apply it before the Tegra114 CCF series.

Applied to Tegra's for-3.10/clk branch.
