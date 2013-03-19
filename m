From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH] clk: add table lookup to mux
Date: Tue, 19 Mar 2013 15:43:26 -0600
Message-ID: <5148DBFE.3040402@wwwdotorg.org>
References: <1363113747-6572-1-git-send-email-pdeschrijver@nvidia.com> <513F79BA.7000608@wwwdotorg.org> <20130319213706.8663.87186@quantum>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20130319213706.8663.87186@quantum>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Prashant Gaikwad <pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 03/19/2013 03:37 PM, Mike Turquette wrote:
> Quoting Stephen Warren (2013-03-12 11:53:46)
>> On 03/12/2013 12:42 PM, Peter De Schrijver wrote:
>>> Add a table lookup feature to the mux clock. Also allow arbitrary masks
>>> instead of the width. This will be used by some clocks on Tegra114. Also
>>> adapt the tegra periph clk because it uses struct clk_mux directly.
>>>
>>> Signed-off-by: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>>>
>>> --
>>> Mike,
>>>
>>> This is the same patch I posted before which implements a table lookup
>>> feature for the mux clock. I squashed both the changes to clk-mux.c and
>>> tegra/clk.h together in order to make the patch bisectable.
>>
>> For the record in this thread, this is a dependency of the Tegra114
>> clock driver. Can this patch be added to a stable branch in the clk or
>> arm-soc trees, which I can merge before applying the Tegra114 clock
>> driver? Thanks.
> 
> Yes.  I don't have an immutable branch today, but I will have one by
> -rc4.  It will be named clk-for-3.10.

Perhaps this series could be merged into an immutable topic branch of
its own. That could then be merged into your clk-for-3.10, and Tegra's
branch, and reduce the number of commits that get merged into the Tegra
tree from outside?
