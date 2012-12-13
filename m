From: =?UTF-8?B?VGVyamUgQmVyZ3N0csO2bQ==?= <tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCHv3 0/7] Support for Tegra 2D hardware
Date: Thu, 13 Dec 2012 17:33:39 +0200
Message-ID: <50C9F553.5030401@nvidia.com>
References: <1355407484-28904-1-git-send-email-tbergstrom@nvidia.com> <1355410991.11327.12.camel@selen>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1355410991.11327.12.camel@selen>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
Cc: "thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org" <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Arto Merilainen <amerilainen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 13.12.2012 17:03, Lucas Stach wrote:
> You are still doing the allocation the IMHO wrong way around. I thought
> we agreed to do all the allocations in host1x, which obviously means not
> using the cma_gem_helpers anymore, but introducing a new native host1x
> object to back GEM/V4L/whatever objects. IMHO the current approach is a
> clear layering violation and makes proper IOMMU support a lot harder. It
> would also allow to get rid of all the indirections and ifdefs in host1x
> memmgr, as host1x would only have to deal with it's native objects.
> 
> All the complexity of converting host1x to GEM objects should be located
> in tegradrm and not be scattered between different modules.
> 
> Did you leave this out on purpose in this version of the patchset?

Forgot to mention that, as IOMMU and consequently the "proper"
allocation support was planned as a follow-up. I wanted to keep the
scope of this set as small as possible.

The plan we agreed on still holds.

Terje

>>  * tegradrm has a global variable. Plan was to hide that behind a
>>    virtual device, and use that as DRM root device. That plan went
>>    bad once the FB CMA helper used the device for trying to allocate
>>    memory.
> See above, we should get rid of the helpers and do all allocations
> within host1x.

I noticed that IOMMU and not using the CMA FB helper is now exynos
managed to do this.

Terje
