From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v4 3/3] drm/tegra: output: rgb: Support LVDS encoder
 bridge
Date: Fri, 17 Apr 2020 23:51:10 +0300
Message-ID: <23afcbc1-729c-c125-4d94-508c8edc57c9@gmail.com>
References: <20200417175238.27154-1-digetx@gmail.com>
 <20200417175238.27154-4-digetx@gmail.com>
 <20200417192453.GH5861@pendragon.ideasonboard.com>
 <598c81ef-ba22-a832-0822-e08023f3dff6@gmail.com>
 <20200417203435.GL5861@pendragon.ideasonboard.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200417203435.GL5861-N3hz7ZxfLydczECFQUw77jytWr6r+dGw0E9HWUfgJXw@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Sam Ravnborg <sam-uyr5N9Q2VtJg9hUCZPvPmw@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

17.04.2020 23:34, Laurent Pinchart пишет:
> On Fri, Apr 17, 2020 at 11:11:06PM +0300, Dmitry Osipenko wrote:
>> 17.04.2020 22:24, Laurent Pinchart пишет:
>> ...
>>> As I tried to explain before, if you wrap the panel in a bridge with
>>> drm_panel_bridge_add() (or the devm_ variant), you will always have a
>>> bridge associated with the output, and will be able to remove your
>>> custom connector implementation. I thus recommend converting to
>>> drm_panel_bridge_add() either as part of this patch series, or just
>>> after it, to get full benefits.
>>>
>>> With the assumption that this will be handled,
>>>
>>> Reviewed-by: Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>
>>
>> Thanks you very much!
>>
>> Yes, I got yours point about wrapping panel into the bridge. But I don't
>> think that it's worth the effort right now because each Tegra output has
>> it's own implantation of the connector and it should be cleaner not to
>> touch that code.
>>
>> Secondly, I don't have hardware to test all available panel output types
>> on Tegra and the benefits of messing with all that code are a bit dim to me.
>>
>> I can make a patch to wrap the RGB panel into a bridge, but this should
>> make code a bit inconsistent in regards to not having a common code path
>> for the "legacy" nvidia,panel. So perhaps it's better to leave it all
>> as-is for now.
> 
> I had a brief look at the code, converting the different output types
> one by one would be a better way forward than not doing anything at all
> in my opinion :-) Once you convert the first output it will also serve
> as an example on how to do it, and hopefully other developers with
> access to hardware could then do more conversions.
> 

Thierry, would you want to have RGB panel converted into a bridge? If
yes, I'll make a v5 with that change.
