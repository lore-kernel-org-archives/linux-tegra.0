From: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH V2] gpio: palmas: add dt support
Date: Wed, 17 Apr 2013 12:26:42 +0530
Message-ID: <516E47AA.2060402@nvidia.com>
References: <1366122705-3579-1-git-send-email-ldewangan@nvidia.com> <516D9C2B.302@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <516D9C2B.302-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: "linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org" <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, "rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org" <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, "gg-kDsPt+C1G03kYMGBc/C6ZA@public.gmane.org" <gg-kDsPt+C1G03kYMGBc/C6ZA@public.gmane.org>, "ian-kDsPt+C1G03kYMGBc/C6ZA@public.gmane.org" <ian-kDsPt+C1G03kYMGBc/C6ZA@public.gmane.org>, "j-keerthy-l0cyMroinI0@public.gmane.org" <j-keerthy-l0cyMroinI0@public.gmane.org>, "t-kristo-l0cyMroinI0@public.gmane.org" <t-kristo-l0cyMroinI0@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Wednesday 17 April 2013 12:14 AM, Stephen Warren wrote:
> On 04/16/2013 08:31 AM, Laxman Dewangan wrote:
>> Add of_device_id table for Palma GPIO to be enable the
>> driver from DT file.
>>
>> The driver can be registered from DT file as:
>> 	palmas: tps65913@58 {
>> 		:::::::::::
>> 		palmas_gpio: palmas_gpio {
>> 			compatible = "ti,palmas-gpio";
>> 			gpio-controller;
>> 			#gpio-cells = <2>;
>> 		};
>> 	};
> So I think this patch looks fine if everyone is agreed that all the
> Palmas sub-modules are represented as explicit child nodes in DT, and
> the probing of the child nodes is based on the top-level Palmas device
> being a bus, and enumerating its children in standard DT style, using
> compatible values. (I'm not sure how the child probing/instantiation
> will work for non-DT systems though).
>
> I'm not 100% sure if an agreement on the top-level structure of the
> Palmas DT bindings was reached though? Can the SlimLogic people confirm
> this? I assume Laxman must be OK with it since he's sending this patch?
>

I am fine with this dt approach.
Similar patch on palma-rtc was acked by Grant.

If Slimlogic/TI team can finalise the DT binding then it will be easy 
for me to push some more patches to have full support for palma driver 
on our Tegra platform.
