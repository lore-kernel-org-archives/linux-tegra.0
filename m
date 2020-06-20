From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v8 7/7] drm/panel-simple: Add missing connector type for
 some panels
Date: Sat, 20 Jun 2020 16:19:00 +0300
Message-ID: <ea421084-a91c-bc03-5997-1723075b7cae@gmail.com>
References: <20200617222703.17080-1-digetx@gmail.com>
 <20200617222703.17080-8-digetx@gmail.com>
 <20200620112132.GB16901@ravnborg.org>
 <20200620114934.GB5829@pendragon.ideasonboard.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200620114934.GB5829-N3hz7ZxfLydczECFQUw77jytWr6r+dGw0E9HWUfgJXw@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, Sam Ravnborg <sam-uyr5N9Q2VtJg9hUCZPvPmw@public.gmane.org>
Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

20.06.2020 14:49, Laurent Pinchart пишет:
> Hi Sam and Dmitry,
> 
> On Sat, Jun 20, 2020 at 01:21:32PM +0200, Sam Ravnborg wrote:
>> On Thu, Jun 18, 2020 at 01:27:03AM +0300, Dmitry Osipenko wrote:
>>> The DRM panel bridge core requires connector type to be set up properly,
>>> otherwise it rejects the panel. The missing connector type problem popped
>>> up while I was trying to wrap CLAA070WP03XG panel into a DRM bridge in
>>> order to test whether panel's rotation property work properly using
>>> panel-simple driver on NVIDIA Tegra30 Nexus 7 tablet device, which uses
>>> CLAA070WP03XG display panel.
>>>
>>> The NVIDIA Tegra DRM driver recently gained DRM bridges support for the
>>> RGB output and now driver wraps directly-connected panels into DRM bridge.
>>> Hence all panels should have connector type set properly now, otherwise
>>> the panel's wrapping fails.
>>>
>>> This patch adds missing connector types for the LVDS panels that are found
>>> on NVIDIA Tegra devices:
>>>
>>>   1. AUO B101AW03
>>>   2. Chunghwa CLAA070WP03XG
>>>   3. Chunghwa CLAA101WA01A
>>>   4. Chunghwa CLAA101WB01
>>>   5. EDT ET057090DHU
>>>   6. Innolux N156BGE L21
>>>   7. Samsung LTN101NT05
>>>
>>> Signed-off-by: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>>
>> Very good to have this fixed.
>> I went ahead and pushed this commit to drm-misc-next as it is really
>> independent from the rest of the series.
>>
>>> ---
>>>  drivers/gpu/drm/panel/panel-simple.c | 7 +++++++
>>>  1 file changed, 7 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
>>> index 6764ac630e22..9eb2dbb7bfa6 100644
>>> --- a/drivers/gpu/drm/panel/panel-simple.c
>>> +++ b/drivers/gpu/drm/panel/panel-simple.c
>>> @@ -687,6 +687,7 @@ static const struct panel_desc auo_b101aw03 = {
>>>  		.width = 223,
>>>  		.height = 125,
>>>  	},
>>> +	.connector_type = DRM_MODE_CONNECTOR_LVDS,
> 
> Note that, for LVDS panels, the bus_format field is mandatory. This
> panel, for instance, according to
> http://www.vslcd.com/Specification/B101AW03%20V.0.pdf, uses
> MEDIA_BUS_FMT_RGB666_1X7X3_SPWG (see
> https://linuxtv.org/downloads/v4l-dvb-apis/userspace-api/v4l/subdev-formats.html#v4l2-mbus-pixelcode).
> The panels below need to be investigated similarly.

Okay! I'll add the missing field in v9.

>>>  };
>>>  
>>>  static const struct display_timing auo_b101ean01_timing = {
>>> @@ -1340,6 +1341,7 @@ static const struct panel_desc chunghwa_claa070wp03xg = {
>>>  		.width = 94,
>>>  		.height = 150,
>>>  	},
>>> +	.connector_type = DRM_MODE_CONNECTOR_LVDS,
>>>  };
>>>  
>>>  static const struct drm_display_mode chunghwa_claa101wa01a_mode = {
>>> @@ -1362,6 +1364,7 @@ static const struct panel_desc chunghwa_claa101wa01a = {
>>>  		.width = 220,
>>>  		.height = 120,
>>>  	},
>>> +	.connector_type = DRM_MODE_CONNECTOR_LVDS,
>>>  };
>>>  
>>>  static const struct drm_display_mode chunghwa_claa101wb01_mode = {
>>> @@ -1384,6 +1387,7 @@ static const struct panel_desc chunghwa_claa101wb01 = {
>>>  		.width = 223,
>>>  		.height = 125,
>>>  	},
>>> +	.connector_type = DRM_MODE_CONNECTOR_LVDS,
>>>  };
>>>  
>>>  static const struct drm_display_mode dataimage_scf0700c48ggu18_mode = {
>>> @@ -1573,6 +1577,7 @@ static const struct panel_desc edt_et057090dhu = {
>>>  	},
>>>  	.bus_format = MEDIA_BUS_FMT_RGB666_1X18,
>>>  	.bus_flags = DRM_BUS_FLAG_DE_HIGH | DRM_BUS_FLAG_PIXDATA_DRIVE_NEGEDGE,
>>> +	.connector_type = DRM_MODE_CONNECTOR_LVDS,
> 
> This contradicts .bus_format and .bus_flags that hint that the panel is
> a DPI panel, not an LVDS panel. According to
> https://www.lcdtek.co.uk/dwpdf/ET057090DHU-RoHS.pdf, this isn't an LVDS
> panel.
> 
> I'm worried enough research hasn't gone into this patch, and I'd prefer
> reverting it until we check each panel individually.

Hello Sam and Laurent,

Oops! Good catch! Indeed, I blindly set the LVDS type to all these
panels. Please revert this patch, I'll double check each panel and
prepare an updated version of this patch. Thank you very much for the
review!
