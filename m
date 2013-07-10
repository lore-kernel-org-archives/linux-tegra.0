From: Rhyland Klein <rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: Exposing GPU information for userspace processes
Date: Wed, 10 Jul 2013 12:11:39 -0400
Message-ID: <51DD87BB.8070307@nvidia.com>
References: <51DC8493.9090405@nvidia.com> <CAPM=9tyCTF_+Z0S0+TKxio94LCRpJeWJ6U2EcozUj8tjmMESNg@mail.gmail.com> <20130710060949.GG18285@phenom.ffwll.local>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20130710060949.GG18285-dv86pmgwkMBes7Z6vYuT8azUEOm+Xw19@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org>
Cc: Dave Airlie <airlied-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 7/10/2013 2:09 AM, Daniel Vetter wrote:
> On Wed, Jul 10, 2013 at 04:01:49PM +1000, Dave Airlie wrote:
>> On Wed, Jul 10, 2013 at 7:45 AM, Rhyland Klein <rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wrote:
>>> We are currently looking into exporting some information from the linux
>>> kernel to userspace about the GPU. This information is specific per
>>> board as the data can vary depending on the fuses burnt on the board.
>>>
>>> Right now we are leaning towards adding sysfs properties to our existing
>>> nodes to share this information.
>>>
>>> Before we write up the patches and update our userspace apps to check
>>> the new locations, we wanted to make sure there wasn't a more
>>> accepted/proper way to export information already.
>>>
>>> Right now for instance we want to export a property to say how many
>>> pixel pipes there are. This could then be exported in something like:
>>>
>>> /sys/bus/platform/drivers/gr3d/54180000.gr3d/num_pixel_pipes
>>>
>>> Is this the best approach to take right now or is there another way we
>>> should export this and similar HW specific information?
>>
>> All the x86 GPU drivers use gpu specific get param ioctls for this so far.
>>
>> e.g. drivers/gpu/drm/radeon/radeon_kms.c:radeon_info_ioctl
> 
> In drm/i915 we also expose a bunch of thing to sysfs, but everything that
> the userspace drivers need for operation is exposed through the getparam
> ioctl. We add sysfs interfaces on top if there's a legit reason for the
> user to script changes (e.g. gpu error state collection or tuning the
> frequency scaling and related read-only statistics).
> -Daniel
> 

Thank you both for your helpful responses. I was considering an ioctl as
another option, and it seems that is likely the best approach to take
for this type of information.

Thanks,

-rhyland

-- 
nvpublic
