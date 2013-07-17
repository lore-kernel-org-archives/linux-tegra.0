From: Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH V2] ARM: tegra: enable palmas device for dalmore
Date: Wed, 17 Jul 2013 11:53:32 +0300
Message-ID: <51E65B8C.1000405@nvidia.com>
References: <1373441852-27176-1-git-send-email-ldewangan@nvidia.com> <51E54FD1.1010404@nvidia.com> <51E65C74.8060405@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <51E65C74.8060405-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: "swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org" <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 07/17/2013 11:57 AM, Laxman Dewangan wrote:
> On Tuesday 16 July 2013 07:21 PM, Mikko Perttunen wrote:
>> On 07/10/2013 10:37 AM, Laxman Dewangan wrote:
>>> +
>>> +			palmas_gpio: gpio {
>>> +				compatible = "ti,palmas-gpio";
>>> +				gpio-controller;
>>> +				#gpio-cells = <2>;
>>> +			};
>> I don't think the palmas-gpio driver ever gets probed since it doesn't
>> have device tree compability strings?
>>
> You will need the patch
> [PATCH V3] gpio: palmas: add dt support
>
> which is under review from last few days.
>

Ah, ok. I guess I'm not on the proper ML for that one.
