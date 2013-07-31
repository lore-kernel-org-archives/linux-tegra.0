From: Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 08/11] clk: tegra114: add suspend/resume function for tegar_cpu_car_ops
Date: Tue, 30 Jul 2013 20:37:21 -0700
Message-ID: <CAPtuhTgsU0mr0ARK1WT=670ct5R158B5eAz3TwWkM-hL+X-hVQ@mail.gmail.com>
References: <1372152475-18617-1-git-send-email-josephl@nvidia.com>
 <1372152475-18617-9-git-send-email-josephl@nvidia.com> <20130730212100.5270.53947@quantum>
 <1375237637.1231.1.camel@jlo-ubuntu-64.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1375237637.1231.1.camel-yx3yKKdKkHfc7b1ADBJPm0n48jw8i0AO@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Tue, Jul 30, 2013 at 7:27 PM, Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wrote:
> On Wed, 2013-07-31 at 05:21 +0800, Mike Turquette wrote:
>> Quoting Joseph Lo (2013-06-25 02:27:52)
>> > Adding suspend/resume function for tegra_cpu_car_ops. We only save and
>> > restore the setting of the clock of CoreSight. Other clocks still need
>> > to be taken care by clock driver.
>> >
>> > Cc: Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
>> > Signed-off-by: Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>>
>> Change looks OK to me, besides Stephen's comments. I was waiting for a
>> V2 to hit the list but I never saw it. Any plans?
>>
> Hi Mike,
>
> The V2 was sent on 2013/7/3.

Ok, looks like Stephen took it into his branch.

Thanks,
Mike

>
> Thanks,
> Joseph
>
>
