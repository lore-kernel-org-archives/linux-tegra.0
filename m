From: =?UTF-8?B?VGVyamUgQmVyZ3N0csO2bQ==?= <tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCHv5,RESEND 3/8] gpu: host1x: Add channel support
Date: Mon, 11 Mar 2013 11:21:05 +0200
Message-ID: <513DA201.9010707@nvidia.com>
References: <1358250244-9678-1-git-send-email-tbergstrom@nvidia.com> <1358250244-9678-4-git-send-email-tbergstrom@nvidia.com> <20130225152457.GA29545@avionic-0098.mockup.avionic-design.de> <512C84E2.5090201@nvidia.com> <513A0ED0.4070701@nvidia.com> <20130308204301.GA30742@avionic-0098.mockup.avionic-design.de> <513D79E7.5000801@nvidia.com> <20130311071851.GA6033@avionic-0098.mockup.avionic-design.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20130311071851.GA6033-RM9K5IK7kjIQXX3q8xo1gnVAuStQJXxyR5q1nwbD4aMs9pC9oP6+/A@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Cc: Arto Merilainen <amerilainen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "airlied-cv59FeDIM0c@public.gmane.org" <airlied-cv59FeDIM0c@public.gmane.org>, "dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 11.03.2013 09:18, Thierry Reding wrote:
> This sound a bit over-engineered at this point in time. DRM is currently
> the only user. Is anybody working on any non-DRM drivers that would use
> this?

Well, this contains beginning of that:

http://nv-tegra.nvidia.com/gitweb/?p=linux-2.6.git;a=blob;f=drivers/media/video/tegra_v4l2_camera.c;h=644d0be5380367aca4c826c49724c03aad08387c;hb=l4t/l4t-r16-r2

I don't want to give these guys any excuse not to port it over to host1x
code base. :-)

> Even that aside, I don't think host1x_mem_handle is a good choice of
> name here. The objects are much more than handles. They are in fact
> buffer objects, which can optionally be attached to a handle. I also
> think that using a void * to store the handle specific data isn't such a
> good idea.

Naming if not an issue for me - we can easily agree on using _bo.

> So how about the following proposal, which I think might satisfy both of
> us:
> 
> 	struct host1x_bo;
> 
> 	struct host1x_bo_ops {
> 		struct host1x_bo *(*get)(struct host1x_bo *bo);
> 		void (*put)(struct host1x_bo *bo);
> 		dma_addr_t (*pin)(struct host1x_bo *bo, struct sg_table **sgt);
> 		...
> 	};
> 
> 	struct host1x_bo *host1x_bo_get(struct host1x_bo *bo);
> 	void host1x_bo_put(struct host1x_bo *bo);
> 	dma_addr_t host1x_bo_pin(struct host1x_bo *bo, struct sg_table **sgt);
> 	...
> 
> 	struct host1x_bo {
> 		const struct host1x_bo_ops *ops;
> 		...
> 	};
> 
> 	struct tegra_drm_bo {
> 		struct host1x_bo base;
> 		...
> 	};
> 
> That way you can get rid of the host1x_memmgr_create_handle() helper and
> instead embed host1x_bo into driver-/framework-specific structures with
> the necessary initialization.

This would make sense. We'll get back when we have enough of
implementation done to understand it all. One consequence is that we
cannot use drm_gem_cma_create() anymore. We'll have to introduce a
function that does the same as drm_gem_cma_create(), but it takes a
pre-allocated drm_gem_cma_object pointer. That way we can allocate the
struct, and use DRM CMA just to initialize the drm_gem_cma_object.

Other way would be just taking a copy of DRM CMA helper, but I'd like to
defer that to the next step when we implement IOMMU aware allocator.

> It also allows you to interact directly with the objects instead of
> having to go through the memmgr API. The memory manager doesn't really
> exist anymore so keeping the name in the API is only confusing. Your
> current proposal deals with memory handles directly already so it's
> really just making the naming more consistent.

The memmgr APIs are currently just a shortcut wrapper to the ops, so in
that sense the memmgr does not really exist. I think it might still make
sense to keep static inline wrappers for calling the ops within, but we
could rename them to host1x_bo_somethingandother. Then it'd follow the
pattern we are using for the hw ops in the latest set.

Terje
