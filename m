From: Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>
Subject: Re: [PATCH v5 1/3] mfd: tps6586x: add version detection
Date: Fri, 06 Dec 2013 16:00:26 +0100
Message-ID: <5e063ab19c8fb9754216189c65d8f670@agner.ch>
References: <cover.1386333697.git.stefan@agner.ch>
 <7812fb79beac0a6a409090f43d129893f9f93b5b.1386333697.git.stefan@agner.ch>
 <20131206142605.GA32363@ulmo.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20131206142605.GA32363-AwZRO8vwLAwmlAP/+Wk3EA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
Cc: swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org, lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, kai.poggensee-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org, sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Am 2013-12-06 15:26, schrieb Thierry Reding:
> On Fri, Dec 06, 2013 at 01:51:45PM +0100, Stefan Agner wrote:
>> Use the VERSIONCRC to determine the exact device version. According to
>> the datasheet this register can be used as device identifier. The
>> identification is needed since some tps6586x regulators use a different
>> voltage table.
>>
>> Signed-off-by: Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>
>> ---
>> Changes since v4:
>>   - Use variable named version instead of ret
>>
>> Changes since v2:
>>   - Avoid moving devm_kzalloc
>> ---
>>  drivers/mfd/tps6586x.c       | 50 +++++++++++++++++++++++++++++++++++++-------
>>  include/linux/mfd/tps6586x.h |  7 +++++++
>>  2 files changed, 49 insertions(+), 8 deletions(-)
> 
> I think I also already gave my Reviewed-by on both this and 2/3, neither
> of which changed significantly enough to warrant that to be dropped. In
> general it's fine to keep Reviewed-by and Acked-by as long as you're
> only changing minor things.
> 
> Thierry

Ok, sorry, didn't realize that is my job to pick them up when doing new
revisions. Lee, can you add this when you apply this patch?

Reviewed-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
