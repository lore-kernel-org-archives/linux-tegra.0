From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v1] drm/modes: Skip invalid cmdline mode
Date: Wed, 10 Jul 2019 17:03:23 +0300
Message-ID: <73d5dcd7-adef-8844-4e13-a68a0a5db98a@gmail.com>
References: <20190709145151.23086-1-digetx@gmail.com>
 <20190710100000.GZ5942@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190710100000.GZ5942@intel.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Cc: Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <maxime.ripard@bootlin.com>, Sean Paul <sean@poorly.run>, Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
List-Id: linux-tegra@vger.kernel.org

10.07.2019 13:00, Ville Syrjälä пишет:
> On Tue, Jul 09, 2019 at 05:51:51PM +0300, Dmitry Osipenko wrote:
>> The named mode could be invalid and then cmdline parser misses to validate
>> mode's dimensions, happily adding 0x0 mode as a valid mode. One case where
>> this happens is NVIDIA Tegra devices that are using downstream bootloader
>> which adds "video=tegrafb" to the kernel's cmdline and thus upstream Tegra
>> DRM driver fails to probe because of the invalid mode.
>>
>> Fixes: 3aeeb13d8996 ("drm/modes: Support modes names on the command line")
> 
> Is that actually true? This problem has been in the code since forever AFAICS.

Yes, it's a problem now because named mode is marked as specified and
everything that do not match to a non-named mode is treated as named.

>> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
>> ---
>>  drivers/gpu/drm/drm_client_modeset.c | 3 ++-
>>  drivers/gpu/drm/drm_modes.c          | 6 ++++++
>>  2 files changed, 8 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/drm_client_modeset.c b/drivers/gpu/drm/drm_client_modeset.c
>> index e95fceac8f8b..56d36779d213 100644
>> --- a/drivers/gpu/drm/drm_client_modeset.c
>> +++ b/drivers/gpu/drm/drm_client_modeset.c
>> @@ -180,7 +180,8 @@ drm_connector_pick_cmdline_mode(struct drm_connector *connector)
>>  
>>  create_mode:
>>  	mode = drm_mode_create_from_cmdline_mode(connector->dev, cmdline_mode);
>> -	list_add(&mode->head, &connector->modes);
>> +	if (mode)
>> +		list_add(&mode->head, &connector->modes);
> 
> That's the same as what I did here
> https://patchwork.freedesktop.org/patch/309223/?series=61781&rev=1
> 
> But I'd have to rebase that so let's just go with your patch.
> 
>>  
>>  	return mode;
>>  }
>> diff --git a/drivers/gpu/drm/drm_modes.c b/drivers/gpu/drm/drm_modes.c
>> index 910561d4f071..74a5739df506 100644
>> --- a/drivers/gpu/drm/drm_modes.c
>> +++ b/drivers/gpu/drm/drm_modes.c
>> @@ -158,6 +158,9 @@ struct drm_display_mode *drm_cvt_mode(struct drm_device *dev, int hdisplay,
>>  	int interlace;
>>  	u64 tmp;
>>  
>> +	if (!hdisplay || !vdisplay)
>> +		return NULL;
>> +
>>  	/* allocate the drm_display_mode structure. If failure, we will
>>  	 * return directly
>>  	 */
>> @@ -392,6 +395,9 @@ drm_gtf_mode_complex(struct drm_device *dev, int hdisplay, int vdisplay,
>>  	int hsync, hfront_porch, vodd_front_porch_lines;
>>  	unsigned int tmp1, tmp2;
>>  
>> +	if (!hdisplay || !vdisplay)
>> +		return NULL;
>> +
> 
> These lgtm
> 
> Patch is
> Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>

Thanks!
