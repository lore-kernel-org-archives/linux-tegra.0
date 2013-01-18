From: Mark Zhang <nvmarkzhang-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 2/5] drm/tegra: Add plane support
Date: Fri, 18 Jan 2013 11:59:06 +0800
Message-ID: <50F8C88A.9070700@gmail.com>
References: <1358179560-26799-1-git-send-email-thierry.reding@avionic-design.de>  <1358179560-26799-3-git-send-email-thierry.reding@avionic-design.de>  <50F526FF.1010101@gmail.com> <1358247034.1524.17.camel@tellur>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1358247034.1524.17.camel@tellur>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
Cc: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 01/15/2013 06:50 PM, Lucas Stach wrote:
> Am Dienstag, den 15.01.2013, 17:53 +0800 schrieb Mark Zhang:
>> On 01/15/2013 12:05 AM, Thierry Reding wrote:
>>> Add support for the B and C planes which support RGB and YUV pixel
>>> formats and can be used as overlays or hardware cursor.
>>
>> I think "hardware cursor" has specific meaning for Tegra(e.g: Tegra30
>> has a 32x32 24bpp or 64x64 2bpp hardware cursor). So you may change it
>> to "hardware accelerated cursor"?
>>
> According to the TRM no Tegra has ARGB hardware cursor support, but only
> 2-color. So we talked about doing the hardware cursor by using a plane.
> If the TRM is wrong in this regard and we can get a ARGB cursor on Tegra
> 3 it would be nice to know.
> 

Lucas, yes, TRM says "Hardware cursor is supported for 32x32 or for
64x64 2-bpp cursor.", but just as you can see, we can set cursor's
foreground & background color by register "DC_DISP_CURSOR_FOREGROUND_0
" & "DC_DISP_CURSOR_BACKGROUND_0".

So I asked the expert in nvidia and here is the explanation of the
hardware cursor:

"each pixel in the cursor is encoded by 2 bits.
only 3 values are used per pixel: transparent, foreground, background.

when pixel is transparent - no pixel is displayed. (also known as a mask)
when pixel is foreground - color of pixel is 24-bit value in
DC_DISP_CURSOR_FOREGROUND_0.
when pixel is background - color of pixel is 24-bit value in
DC_DISP_CURSOR_BACKGROUND_0.

So I would still phrase it as a 2-bit cursor. It's a palette with 2
colors plus a 1-bit alpha. The palette entries are 24-bit."

Mark
>>>
>>> Signed-off-by: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
>>> ---
>> [...]
>>> +};
>>> +
>>> +static int tegra_dc_add_planes(struct drm_device *drm, struct tegra_dc *dc)
>>> +{
>>> +	unsigned int i;
>>> +	int err = 0;
>>> +
>>> +	for (i = 0; i < 2; i++) {
>>> +		struct tegra_plane *plane;
>>> +
>>> +		plane = devm_kzalloc(drm->dev, sizeof(*plane), GFP_KERNEL);
>>> +		if (!plane)
>>> +			return -ENOMEM;
>>> +
>>> +		plane->index = i;
>>
>> I suggest to change this line to: "plane->index = i + 1;". This makes
>> the plane's index be consistent with Tegra's windows number. And also we
>> don't need to worry about passing "plane->index + 1" to some functions
>> which need to know which window is operating on.
>>
> Again, if we make WIN_C the root window, we can keep the plane index
> assignment as is and get rid of the "index + 1" passing.
> 
> 
