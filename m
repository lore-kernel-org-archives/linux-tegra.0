From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: =?UTF-8?Q?Re=3a_=5bPATCH_v2_5/5=5d_drm/tegra=3a_plane=3a_Support_18?=
 =?UTF-8?Q?0=c2=b0_rotation?=
Date: Wed, 17 Jun 2020 21:50:41 +0300
Message-ID: <2a004826-a505-75e4-b922-c74618404166@gmail.com>
References: <20200614200121.14147-1-digetx@gmail.com>
 <20200614200121.14147-6-digetx@gmail.com>
 <CACvgo50P5i2jX6ZrMD=UuGr_bA=8MbFhYBWBNvkMcdCyJKS5xg@mail.gmail.com>
 <e21404bd-49c9-039e-4aef-c4912a9c0640@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <e21404bd-49c9-039e-4aef-c4912a9c0640-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Thomas Zimmermann <tzimmermann-l3A5Bk7waGM@public.gmane.org>, Derek Basehore <dbasehore-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Sam Ravnborg <sam-uyr5N9Q2VtJg9hUCZPvPmw@public.gmane.org>, Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, Sean Paul <sean-p7yTbzM4H96eqtR555YLDQ@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "Linux-Kernel@Vger. Kernel. Org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, ML dri-devel <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

16.06.2020 14:25, Dmitry Osipenko пишет:
> 16.06.2020 00:47, Emil Velikov пишет:
>> Hi all,
>>
>> Perhaps a silly question:
>>
>> On Mon, 15 Jun 2020 at 08:28, Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>>>
>>> Combining horizontal and vertical reflections gives us 180 degrees of
>>> rotation.
>>>
>>> Signed-off-by: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>>> ---
>>>  drivers/gpu/drm/tegra/dc.c | 13 ++++++++++++-
>>>  1 file changed, 12 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/gpu/drm/tegra/dc.c b/drivers/gpu/drm/tegra/dc.c
>>> index f31bca27cde4..ddd9b88f8fce 100644
>>> --- a/drivers/gpu/drm/tegra/dc.c
>>> +++ b/drivers/gpu/drm/tegra/dc.c
>>
>>> +       if (rotation & DRM_MODE_ROTATE_180) {
>>> +               plane_state->reflect_x = !plane_state->reflect_x;
>>> +               plane_state->reflect_y = !plane_state->reflect_y;
>>> +       }
>>> +
>> As mentioned by Ville the above is already handled by
>> drm_rotation_simplify() ... although it makes me wonder:
>>
>>
>>>         err = drm_plane_create_rotation_property(&plane->base,
>>>                                                  DRM_MODE_ROTATE_0,
>>>                                                  DRM_MODE_ROTATE_0 |
>>> +                                                DRM_MODE_ROTATE_180 |
>>>                                                  DRM_MODE_REFLECT_X |
>>>                                                  DRM_MODE_REFLECT_Y);
>>
>> Would it make sense for drm_plane_create_rotation_property() itself,
>> to add DRM_MODE_ROTATE_180, when both reflections are supported?
> 
> Hello Emil,
> 
> That's a good point! All DRM_MODE_ROTATE_180 should be removed because
> Tegra can't do 180° + reflected-x. The DRM core takes care of 180°
> rotation when both x/y reflections are supported.
> 

I just found out that I forgot to drop the WIP patches which added
transparent rotation support while was checking whether these plane
DRM_MODE_ROTATE_180 could be dropped and it's actually need to be set
for the planes, otherwise 180 rotation support is filtered out by the
atomic check.
