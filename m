From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v8 7/7] drm/panel-simple: Add missing connector type for
 some panels
Date: Sat, 20 Jun 2020 19:18:10 +0300
Message-ID: <ce053d7d-7458-20a0-4e9e-77f7f99d364b@gmail.com>
References: <20200617222703.17080-1-digetx@gmail.com>
 <20200617222703.17080-8-digetx@gmail.com>
 <20200620112132.GB16901@ravnborg.org>
 <20200620114934.GB5829@pendragon.ideasonboard.com>
 <ea421084-a91c-bc03-5997-1723075b7cae@gmail.com>
 <20200620143114.GA22329@ravnborg.org>
 <e77a34c1-3e0b-7f30-25d0-a955ec8d8c86@gmail.com>
 <20200620153012.GA22743@ravnborg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200620153012.GA22743-uyr5N9Q2VtJg9hUCZPvPmw@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sam Ravnborg <sam-uyr5N9Q2VtJg9hUCZPvPmw@public.gmane.org>
Cc: Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

20.06.2020 18:30, Sam Ravnborg пишет:
> Hi Dmitry
> On Sat, Jun 20, 2020 at 06:05:37PM +0300, Dmitry Osipenko wrote:
>> 20.06.2020 17:31, Sam Ravnborg пишет:
>>> Hi Dmitry
>>>
>>>>
>>>> Oops! Good catch!
>>> Yep, thanks Laurent. Should have taken a better look before applying.
>>>
>>>> Indeed, I blindly set the LVDS type to all these
>>>> panels. Please revert this patch, I'll double check each panel and
>>>> prepare an updated version of this patch. Thank you very much for the
>>>> review!
>>>
>>> If you can prepare a fix within a few days then lets wait for that.
>>> I will do a better review next time.
>>
>> Hello Sam,
>>
>> I should be able to make it later today or tomorrow. Could you please
>> clarify what do you mean by the fix, do you what it to be as an
>> additional patch on top of the applied one or a new version of the patch?
> An additional patch on top of the one applied.
> It shall carry a proper fixes: tag like this:
> 
> Fixes: 94f07917ebe8 ("drm/panel-simple: Add missing connector type for some panels")
> Cc: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> Cc: Sam Ravnborg <sam-uyr5N9Q2VtJg9hUCZPvPmw@public.gmane.org>
> Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> Cc: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org

Okay!
