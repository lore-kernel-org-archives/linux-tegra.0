From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: =?UTF-8?Q?Re=3a_=5bPATCH_v2_5/5=5d_drm/tegra=3a_plane=3a_Support_18?=
 =?UTF-8?Q?0=c2=b0_rotation?=
Date: Mon, 15 Jun 2020 21:07:50 +0300
Message-ID: <a22285cb-21d9-bb0e-3b6b-3b1876ebbb59@gmail.com>
References: <20200614200121.14147-1-digetx@gmail.com>
 <20200614200121.14147-6-digetx@gmail.com> <20200615165758.GR6112@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200615165758.GR6112-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Thomas Zimmermann <tzimmermann-l3A5Bk7waGM@public.gmane.org>, Derek Basehore <dbasehore-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Sam Ravnborg <sam-uyr5N9Q2VtJg9hUCZPvPmw@public.gmane.org>, Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, Sean Paul <sean-p7yTbzM4H96eqtR555YLDQ@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

15.06.2020 19:57, Ville Syrjälä пишет:
> On Sun, Jun 14, 2020 at 11:01:21PM +0300, Dmitry Osipenko wrote:
>> Combining horizontal and vertical reflections gives us 180 degrees of
>> rotation.
>>
>> Signed-off-by: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>> ---
>>  drivers/gpu/drm/tegra/dc.c | 13 ++++++++++++-
>>  1 file changed, 12 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/tegra/dc.c b/drivers/gpu/drm/tegra/dc.c
>> index f31bca27cde4..ddd9b88f8fce 100644
>> --- a/drivers/gpu/drm/tegra/dc.c
>> +++ b/drivers/gpu/drm/tegra/dc.c
>> @@ -608,6 +608,7 @@ static int tegra_plane_atomic_check(struct drm_plane *plane,
>>  {
>>  	struct tegra_plane_state *plane_state = to_tegra_plane_state(state);
>>  	unsigned int rotation = DRM_MODE_ROTATE_0 |
>> +				DRM_MODE_ROTATE_180 |
> 
> Leave this out ...
> 
>>  				DRM_MODE_REFLECT_X |
>>  				DRM_MODE_REFLECT_Y;
>>  	struct tegra_bo_tiling *tiling = &plane_state->tiling;
>> @@ -659,6 +660,14 @@ static int tegra_plane_atomic_check(struct drm_plane *plane,
>>  	else
>>  		plane_state->reflect_y = false;
>>  
>> +	if (tegra_fb_is_bottom_up(state->fb))
>> +		plane_state->reflect_y = true;
>> +
>> +	if (rotation & DRM_MODE_ROTATE_180) {
>> +		plane_state->reflect_x = !plane_state->reflect_x;
>> +		plane_state->reflect_y = !plane_state->reflect_y;
>> +	}
> 
> ... and drm_rotation_simplify() will do this for you.

Hello Ville,

Indeed, thank you for the suggestion!

> Though the bottim_up() thing will need a slightly different tweak I
> guess.
> 
> I'd write this as somehting like:
> rotation = state->rotation;
> if (bottom_up())
> 	rotation ^= DRM_MODE_REFLECT_Y;
> rotation = drm_rotation_simplify(rotation,
> 				 DRM_MODE_ROTATE_0 |
> 				 DRM_MODE_REFLECT_X |
> 				 DRM_MODE_REFLECT_Y;
> 
> Also note my use of XOR for the bottom_up() handling. I suspect
> the current code is already broken if you combine bottom_up()
> and REFLECT_Y since it just uses an OR instead of an XOR. That's
> assuming my hucnh what bottom_up() is supposed to do is correct.

The bottom_up() is a legacy way of specifying reflect_y flag of the
modern DRM's rotation property. It's was used by older userspace before
Tegra DRM driver got support for the rotation property and we keep it
today in order to maintain backwards compatibility with older userspace.
Although, maybe it's about time to retire it since I don't think that
such old userspace exists anymore.

The legacy bottom_up() duplicates the modern reflect_y flag, so these
are not mutually exclusive. Combining with yours suggestion above, we
can write it in this way:

  /*
   * Older userspace used custom BO flag in order to specify
   * the Y reflection, while modern userspace uses the generic
   * DRM rotation property in order to achieve the same result.
   * The legacy BO flag amends the modern rotation property
   * when both are set.
   */
  if (tegra_fb_is_bottom_up(state->fb))
    rotation = drm_rotation_simplify(state->rotation |
                                     DRM_MODE_REFLECT_Y,
                                     rotation);
  else
    rotation = drm_rotation_simplify(state->rotation,
                                     rotation);

Thank you very much for taking a look at this patch! I'll prepare v3 in
accordance to yours comments.
