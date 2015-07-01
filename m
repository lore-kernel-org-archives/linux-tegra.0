From: Mark Zhang <markz-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v2 01/12] drm: panel: Add a new private mode flag: DRM_PANEL_FLAG_PREFER_ONE_SHOT
Date: Wed, 1 Jul 2015 21:01:30 +0800
Message-ID: <5593E4AA.3030608@nvidia.com>
References: <1435738915-31973-1-git-send-email-markz@nvidia.com> <1435738915-31973-2-git-send-email-markz@nvidia.com> <20150701085437.GB24055@phenom.ffwll.local>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150701085437.GB24055-dv86pmgwkMBes7Z6vYuT8azUEOm+Xw19@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org>
Cc: thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 07/01/2015 04:54 PM, Daniel Vetter wrote:
> On Wed, Jul 01, 2015 at 04:21:44PM +0800, Mark Zhang wrote:
>> Normally this flag is set by panel driver so that crtc can enable
>> the "one-shot" mode(not scan frames continuously).
>>
>> Signed-off-by: Mark Zhang <markz-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>> ---
>>  include/drm/drm_panel.h |    2 ++
>>  1 file changed, 2 insertions(+)
>>
>> diff --git a/include/drm/drm_panel.h b/include/drm/drm_panel.h
>> index 13ff44b28893..4d51cb380c75 100644
>> --- a/include/drm/drm_panel.h
>> +++ b/include/drm/drm_panel.h
>> @@ -26,6 +26,8 @@
>>  
>>  #include <linux/list.h>
>>  
>> +#define DRM_PANEL_FLAG_PREFER_ONE_SHOT		(1 << 0)
> 
> This is a panel property, not a mode property. I think it would be much
> better to put this directly into the panel struct, or maybe the dsi sink
> device stuff or wherever. But mode really doesn't have anything to do how
> exactly the pixels get to the panel.

Yeah, we've talked about this in patch set v1. I think putting this in
drm_display_mode->private_flags already makes things better. If we want
to completely remove this in drm_display_mode, I think we need to create
some mechanism which panel can use to notify crtc to enable the one-shot
mode, or crtc is able to send out a query, if somebody answers, one-shot
will be enabled.

Mark
> -Daniel
> 
