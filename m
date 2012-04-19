From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH 3/3] ARM: dt: tegra_ventana: als and proximity sensor
 isl29018 support
Date: Thu, 19 Apr 2012 09:31:11 -0600
Message-ID: <4F902FBF.8010607@wwwdotorg.org>
References: <1334645155-13799-1-git-send-email-ldewangan@nvidia.com> <1334645155-13799-4-git-send-email-ldewangan@nvidia.com> <4F8DF01D.9040900@wwwdotorg.org> <4F8FD709.60308@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <4F8FD709.60308-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: "olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org" <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devel-gWbeCf7V1WCQmaza687I9mD2FQJk+8+b@public.gmane.org" <devel-gWbeCf7V1WCQmaza687I9mD2FQJk+8+b@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 04/19/2012 03:12 AM, Laxman Dewangan wrote:
> On Wednesday 18 April 2012 04:05 AM, Stephen Warren wrote:
>> On 04/17/2012 12:45 AM, Laxman Dewangan wrote:
>>> Add the device info for ALS and proximity sensor isl29018.
>>
>> a) Perhaps the vendor prefix should be "isil" not "isl". Olof, can you
>> please comment here?
> 
> Any comments on this? I think "isil" is good as it is the symbol in
> nasdaq also: Intersil Corporation (ISIL).
> If no objection than I can send my next version of patch ;)

Yes, the idea is to use stock ticker symbols where possible, so it
sounds like isil is the way to go.
