From: =?UTF-8?B?VGVyamUgQmVyZ3N0csO2bQ==?= <tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCHv5,RESEND 3/8] gpu: host1x: Add channel support
Date: Mon, 11 Mar 2013 08:29:59 +0200
Message-ID: <513D79E7.5000801@nvidia.com>
References: <1358250244-9678-1-git-send-email-tbergstrom@nvidia.com> <1358250244-9678-4-git-send-email-tbergstrom@nvidia.com> <20130225152457.GA29545@avionic-0098.mockup.avionic-design.de> <512C84E2.5090201@nvidia.com> <513A0ED0.4070701@nvidia.com> <20130308204301.GA30742@avionic-0098.mockup.avionic-design.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20130308204301.GA30742-RM9K5IK7kjIQXX3q8xo1gnVAuStQJXxyR5q1nwbD4aMs9pC9oP6+/A@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Cc: Arto Merilainen <amerilainen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "airlied-cv59FeDIM0c@public.gmane.org" <airlied-cv59FeDIM0c@public.gmane.org>, "dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 08.03.2013 22:43, Thierry Reding wrote:
> A bo is just a buffer object, so I don't see why the name shouldn't
> be used. The name is in no way specific to DRM or GEM. But the point
> that I was trying to make was that there is nothing to suggest that
> we couldn't use drm_gem_object as the underlying scaffold to base all
> host1x buffer objects on.
> 
> Furthermore I don't understand why you've chosen this approach. It
> is completely different from what other drivers do and therefore
> makes it more difficult to comprehend. That alone I could live with
> if there were any advantages to that approach, but as far as I can
> tell there are none.

I was following the plan we agreed on earlier in email discussion with
you and Lucas:

On 29.11.2012 11:09, Lucas Stach wrote:
> We should aim for a clean split here. GEM handles are something which
> is really specific to how DRM works and as such should be constructed
> by tegradrm. nvhost should really just manage allocations/virtual
> address space and provide something that is able to back all the GEM
> handle operations.
> 
> nvhost has really no reason at all to even know about GEM handles.
> If you back a GEM object by a nvhost object you can just peel out
> the nvhost handles from the GEM wrapper in the tegradrm submit ioctl
> handler and queue the job to nvhost using it's native handles.
> 
> This way you would also be able to construct different handles (like
> GEM obj or V4L2 buffers) from the same backing nvhost object. Note
> that I'm not sure how useful this would be, but it seems like a
> reasonable design to me being able to do so.

With this structure, we are already prepared for non-DRM APIs. Tt's a
matter of familiarity of code versus future expansion. Code paths for
both are as simple/complex, so neither has a direct technical
superiority in performance.

I know other DRM drivers have opted to hard code GEM dependency
throughout the code. Then again, host1x hardware is managing much more
than graphics, so we need to think outside the DRM box, too.

Terje
