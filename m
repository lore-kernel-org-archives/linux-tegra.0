From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v3 00/10] Introduce NVIDIA Tegra Partition Table
Date: Mon, 23 Mar 2020 22:44:13 +0300
Message-ID: <9f63f113-fc67-5e1c-a539-81e3b0cd4e31@gmail.com>
References: <20200323163431.7678-1-digetx@gmail.com>
 <20200323180750.GA30585@qmqm.qmqm.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200323180750.GA30585-cHozx32mtrEEUmgCuDUIdw@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux-CoA6ZxLDdyEEUmgCuDUIdw@public.gmane.org>
Cc: Jens Axboe <axboe-tSWWG44O7X1aa/9Udqfwiw@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, David Heidelberg <david-W22tF5X+A20@public.gmane.org>, Peter Geis <pgwipeout-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Nicolas Chauvet <kwizart-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Ulf Hansson <ulf.hansson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Adrian Hunter <adrian.hunter-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Billy Laws <blaws05-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-block-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Andrey Danin <danindrey-JGs/UdohzUI@public.gmane.org>, Gilles Grandou <gilles-4LeZiQkTMnPR7s880joybQ@public.gmane.org>, Ryan Grachek <ryan-JnT2LfGw4MD1P9xLtpHBDw@public.gmane.org>, linux-mmc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

23.03.2020 21:07, Michał Mirosław пишет:
> On Mon, Mar 23, 2020 at 07:34:21PM +0300, Dmitry Osipenko wrote:
>> Some NVIDIA Tegra devices have GPT entry at a wrong location and others may
>> even not have it at all. So either a custom workaround for GPT parsing or
>> TegraPT support is needed for those devices if we want to support them in
>> upstream kernel. The former solution was already rejected [1], let's try
>> the latter.
> [...]
> 
> Hi Dmitry,
> 
> This amusing use of whole-device offsets in the TegraPT makes it take
> a lot of hacks to support it. Have you considered to first join the MMC
> hardware partitions using DM and its linear target and only then processing
> the partition table dividing just the merged device?

Hello Michał,

Thank you very much for the suggestion! I had a thought about that and
it's not apparent to me how to determine when the joining needs to be
done and when not.

The joining shouldn't be done for devices that aren't booting from eMMC
because then the alt GPT entry will be found on a joined block device
and this shouldn't happen.

Actually, maybe we could create a new MMC device-tree property, telling
that the joining needs to be performed. Perhaps this indeed could result
in a less hackery, I'll give it a try and see how it goes.
