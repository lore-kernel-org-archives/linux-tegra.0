From: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 3/3] ARM: dt: tegra_ventana: als and proximity sensor
 isl29018 support
Date: Wed, 18 Apr 2012 12:33:50 +0530
Message-ID: <4F8E6756.80006@nvidia.com>
References: <1334645155-13799-1-git-send-email-ldewangan@nvidia.com> <1334645155-13799-4-git-send-email-ldewangan@nvidia.com> <4F8DF01D.9040900@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <4F8DF01D.9040900-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: "olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org" <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devel-gWbeCf7V1WCQmaza687I9mD2FQJk+8+b@public.gmane.org" <devel-gWbeCf7V1WCQmaza687I9mD2FQJk+8+b@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Wednesday 18 April 2012 04:05 AM, Stephen Warren wrote:
> On 04/17/2012 12:45 AM, Laxman Dewangan wrote:
>> Add the device info for ALS and proximity sensor isl29018.
>> +		isl29018: isl29018@44 {
> I don't think the label "isl29018:" serves any purpose; nothing else
> needs to refer to this node.
>
> I note from http://patchwork.ozlabs.org/patch/132936/ that:
>
> a) Perhaps the vendor prefix should be "isil" not "isl". Olof, can you
> please comment here?

> b) There's an interrupt signal connected to the device. Can you please
> add that, irrespective of whether the driver uses it.
>

Will do.
> c) This device is also present on Seaboard. Can you update
> tegra-seaboard.dts too? You can find the relevant bus from the link above.
>
Will do.


I will wait for finalizing the vendor prefix before creating the next patch.
This will impact the driver also.
