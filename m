From: Mark Zhang <nvmarkzhang-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v3 2/7] drm/tegra: Add plane support
Date: Mon, 18 Feb 2013 14:55:04 +0800
Message-ID: <5121D048.6080202@gmail.com>
References: <1360771506-17849-1-git-send-email-thierry.reding@avionic-design.de> <1360771506-17849-3-git-send-email-thierry.reding@avionic-design.de> <5121C500.3000000@gmail.com> <20130218064002.GA30856@avionic-0098.mockup.avionic-design.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20130218064002.GA30856-RM9K5IK7kjIQXX3q8xo1gnVAuStQJXxyR5q1nwbD4aMs9pC9oP6+/A@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Cc: Dave Airlie <airlied-cv59FeDIM0c@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 02/18/2013 02:40 PM, Thierry Reding wrote:
> On Mon, Feb 18, 2013 at 02:06:56PM +0800, Mark Zhang wrote:
>> On 02/14/2013 12:05 AM, Thierry Reding wrote:
>>> Add support for the B and C planes which support RGB and YUV pixel
>>> formats and can be used as overlays or hardware cursor. Currently
>>> only 32-bit RGBA pixel formats are advertised.
>>>
>>> Signed-off-by: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
>> [...]
>>> +static int tegra_dc_add_planes(struct drm_device *drm, struct tegra_dc *dc)
>>> +{
>>> +	unsigned int i;
>>> +	int err = 0;
>>> +
>>> +	for (i = 0; i < 2; i++) {
>>> +		struct tegra_plane *plane;
>>> +
>>> +		plane = devm_kzalloc(drm->dev, sizeof(*plane), GFP_KERNEL);
>>
>> Using "devm_kzalloc" here seems like not a good idea. Everytime plane
>> disable or crtc disable, we should free "struct tegra_plane" which is
>> allocated here. But the memory which devm_kzalloc allocates is only
>> freed when the driver detach. This makes lots of memory can't be
>> recycled when the plane enable/disable frequently.
> 
> Why would we want to do that? I don't think doing so would even work,
> since the planes are resources that need to be registered with the DRM
> core and therefore can't be allocated on-demand.
> 

I'm wondering if we add power management codes in the future, the
crtc/plane will be disabled/enabled frequently, e.g: system going to
suspend state then resume.

> Thierry
> 
