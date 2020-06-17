From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v3] drm/tegra: Add zpos property for cursor planes
Date: Wed, 17 Jun 2020 20:14:06 +0300
Message-ID: <fcb11625-b17c-752b-de12-29f916ade7cb@gmail.com>
References: <20200616181449.3147258-1-thierry.reding@gmail.com>
 <8e45b425-b667-433e-2074-7a058329f5c2@gmail.com>
 <20200617141015.GB3536291@ulmo>
 <cef8e371-03a8-455e-561d-fca9d0b88309@gmail.com>
 <20200617163724.GA3547875@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200617163724.GA3547875@ulmo>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Daniel Stone <daniel-rLtY4a/8tF1rovVCs/uTlw@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

17.06.2020 19:37, Thierry Reding пишет:
> On Wed, Jun 17, 2020 at 05:20:14PM +0300, Dmitry Osipenko wrote:
>> 17.06.2020 17:10, Thierry Reding пишет:
>>> On Tue, Jun 16, 2020 at 09:39:19PM +0300, Dmitry Osipenko wrote:
>>>> 16.06.2020 21:14, Thierry Reding пишет:
>>>>> From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>>>>>
>>>>> As of commit 4dc55525b095 ("drm: plane: Verify that no or all planes
>>>>> have a zpos property") a warning is emitted if there's a mix of planes
>>>>> with and without a zpos property.
>>>>>
>>>>> On Tegra, cursor planes are always composited on top of all other
>>>>> planes, which is why they never had a zpos property attached to them.
>>>>> However, since the composition order is fixed, this is trivial to
>>>>> remedy by simply attaching an immutable zpos property to them.
>>>>>
>>>>> v3: do not hardcode zpos for overlay planes used as cursor (Dmitry)
>>>>> v2: hardcode cursor plane zpos to 255 instead of 0 (Ville)
>>>>>
>>>>> Reported-by: Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>>>>> Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>>>>> ---
>>>>>  drivers/gpu/drm/tegra/dc.c | 1 +
>>>>>  1 file changed, 1 insertion(+)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/tegra/dc.c b/drivers/gpu/drm/tegra/dc.c
>>>>> index 83f31c6e891c..04d6848d19fc 100644
>>>>> --- a/drivers/gpu/drm/tegra/dc.c
>>>>> +++ b/drivers/gpu/drm/tegra/dc.c
>>>>> @@ -957,6 +957,7 @@ static struct drm_plane *tegra_dc_cursor_plane_create(struct drm_device *drm,
>>>>>  	}
>>>>>  
>>>>>  	drm_plane_helper_add(&plane->base, &tegra_cursor_plane_helper_funcs);
>>>>> +	drm_plane_create_zpos_immutable_property(&plane->base, 255);
>>>>>  
>>>>>  	return &plane->base;
>>>>>  }
>>>>>
>>>>
>>>> Looks nice, thanks! Since you dropped all other zpos changes for other
>>>> planes and given that the other planes have 255 for the max zpos, what
>>>> about to set the cursor's zpos to 256?
>>>
>>> I'd prefer to have all of the planes' zpos within the same range. By
>>> default the other planes will be on the very bottom end of that range
>>> and the atomic core will normalize the zpos for all planes anyway, so
>>> the cursor plane will end up with a very small normalized zpos in the
>>> end.
>>>
>>> The zpos documentation already mentions that the behaviour is undefined
>>> if two planes have the same zpos value, so I think userspace is going to
>>> know how to set these anyway.
>>>
>>> It might be worth to do a follow-up patch that is smarter about setting
>>> the range of valid values. 0-255 is true on later chips where we
>>> actually have a proper "layer depth" register field and I wanted this to
>>> be uniform across all generations. Other drivers seem to set the upper
>>> limit on the zpos range to be equal to the number of planes available,
>>> so that there aren't potentially big gaps in the numbering. That said,
>>> since the core already normalizes the zpos for us, I don't see a big
>>> benefit in explicitly clipping the range.
>>
>> But the cursor plane doesn't use the "layer depth" register, doesn't it?
>> So the zpos over 255 shouldn't matter in this case.
>>
>> I know that DRM should normalizes the given zpos, but still it makes me
>> a bit uncomfortable knowing that there are the ranges overlap visible to
>> userspace :)
> 
> Userspace has to be able to deal with this anyway because it can't make
> any assumptions about what hardware supports underneath. A cursor on a
> different platform may very well be stackable anywhere in the layout so
> it must ensure that the cursor always has the highest zpos (provided
> that that's what it wants). Immutable 255 basically just says that the
> cursor is always going to be at the top. /If/ userspace then decides to
> set some other plane's zpos = 255, then we're in the "undefined"
> behaviour case that the documentation mentions, in which case the
> behaviour on Tegra would still be sane in showing the cursor on top.
> 
> So I don't think there's really an issue with the overlap.

It should work okay, but if cursor had zpos set to 256 then it would
lower the chance for userspace to create the undefined behavior situation.
