From: Mikko Perttunen <mikko.perttunen-/1wQRMveznE@public.gmane.org>
Subject: Re: [GIT PULL 4/8] clk: tegra: Changes for v4.2-rc1
Date: Mon, 22 Jun 2015 10:03:33 +0300
Message-ID: <5587B345.1040202@kapsi.fi>
References: <1431524980-13599-1-git-send-email-thierry.reding@gmail.com>
 <1431524980-13599-5-git-send-email-thierry.reding@gmail.com>
 <20150520195459.GU31753@codeaurora.org> <555D7A5B.1070901@nvidia.com>
 <20150527195021.GA24204@codeaurora.org> <5566BDA5.5080104@nvidia.com>
 <20150618234126.9112.80705@quantum> <20150620204104.9112.83328@quantum>
 <5587B243.2070300@kapsi.fi>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5587B243.2070300-/1wQRMveznE@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Tomeu Vizoso <tomeu.vizoso-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Fixing Mike's mail address

On 06/22/15 09:59, Mikko Perttunen wrote:
> On 06/20/15 23:41, Michael Turquette wrote:
>> Quoting Michael Turquette (2015-06-18 16:41:26)
>> ...
>> I've decided to pull this in the interest of fairness. I'm taking the
>> Exynos cpu clock patches, which will need to be updated in the future to
>> use some new infrastructure for coordinating rate changes across
>> multiple clock nodes. I'm merging the EMC stuff with the same
>> expectation that it will need to migrate to the new infrastructure when
>> it becomes available and we'll get rid of clk_hw_reparent.
>>
>> Sound good?
>
> Sounds good! Please keep us informed and once the framework changes land
> we'll fix up this one.
>
>>
>> Regards,
>> Mike
>>
>
> Thanks,
> Mikko.
>
>>>
>>> I'm working on some core infrastructure to fix this. I'd like to get
>>> that on the list asap and possibly merged for 4.3. I think it can
>>> benefit your case and remove the need to export clk_hw_reparent, which
>>> is pretty nasty.
>>>
>>> What exactly will break if this is not pulled? I appreciate your offer
>>> to update this driver when the core changes are merged, but I would
>>> prefer to do it the right way first, instead of fixing up something that
>>> is already merged after the fact.
>>>
>>> Regards,
>>> Mike
>>>
>>>>
>>>> Thanks,
>>>> Mikko.
>> --
>> To unsubscribe from this list: send the line "unsubscribe linux-tegra" in
>>
>
