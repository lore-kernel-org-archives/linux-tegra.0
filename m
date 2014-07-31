From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH 5/8] of: Add Tegra124 EMC bindings
Date: Thu, 31 Jul 2014 09:32:01 -0600
Message-ID: <53DA6171.30100@wwwdotorg.org>
References: <1405088313-20048-1-git-send-email-mperttunen@nvidia.com>	<1405088313-20048-6-git-send-email-mperttunen@nvidia.com>	<CAL1qeaGHfjQhLHvgzt85hmbuY4FOG5-k=f80=CNvzPDEgi9_6w@mail.gmail.com>	<53CD860B.7030800@wwwdotorg.org>	<CAL1qeaHtGQxCO3cGdeCRUYuk6mxei6z1B63-iZdBECEbFqGhHw@mail.gmail.com>	<53CE9514.1050903@wwwdotorg.org> <CAL1qeaEkL+mxb0S4JhQbXBjyNyKJndffTSjMaAFQD6ooDJPd+Q@mail.gmail.com> <53CEA093.6060106@wwwdotorg.org> <53D75B90.7050501@nvidia.com> <53D7C276.2080204@wwwdotorg.org> <53DA1EF0.7060207@nvidia.com> <53DA230E.7060903@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <53DA230E.7060903-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Prashant Gaikwad <pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 07/31/2014 05:05 AM, Mikko Perttunen wrote:
> On 31/07/14 13:48, Mikko Perttunen wrote:
>>>
>>> I see that the TRM implies the whole 4-bit field is RAM code, rather
>>> than there being 2 separate 2-bit fields for RAM code and boot device
>>> code. Can you please file a bug against the TRM to document this
>>> correctly? (The details of which bits are which are visible on the
>>> Jetson TK1 schematics for example).
>>
>> Yes, I'll file a bug.
>
> On a closer look, the downstream kernel has been recently updated to
> consider the whole 4 bits the ram code. The relevant bug also has a
> comment mentioning that starting from T124, the whole 4 bits is
> considered the RAM code.

That's odd. Given the structure of the BCT hasn't change, I suspect 
that's a documentation bug that's propagated elsewhere. Can you send me 
the bug number internally, and I'll take a look? Thanks.
