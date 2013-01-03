From: =?ISO-8859-1?Q?Terje_Bergstr=F6m?= <tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCHv4 0/8] Support for Tegra 2D hardware
Date: Thu, 3 Jan 2013 07:50:00 +0200
Message-ID: <50E51C08.1020603@nvidia.com>
References: <1356089964-5265-1-git-send-email-tbergstrom@nvidia.com> <50DD6311.9000002@gmail.com> <50E40106.4020406@nvidia.com> <50E4FBAF.30700@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <50E4FBAF.30700-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Zhang <nvmarkzhang-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org" <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>, "airlied-cv59FeDIM0c@public.gmane.org" <airlied-cv59FeDIM0c@public.gmane.org>, "dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org" <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>, "dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 03.01.2013 05:31, Mark Zhang wrote:
> Sorry I didn't get it. Yes, in current design, you can pin all mem
> handles in one time but I haven't found anything related with "locking
> only once per submit".
> 
> My idea is:
> - remove "job->addr_phys"
> - assign "job->reloc_addr_phys" & "job->gather_addr_phys" separately
> - In "pin_job_mem", just call "host1x_memmgr_pin_array_ids" twice to
> fill the "reloc_addr_phy" & "gather_addr_phys".
> 
> Anything I misunderstood?

The current design uses CMA, which makes pinning basically a no-op. When
we have IOMMU support, pinning requires calling into IOMMU. Updating
SMMU tables requires locking, and probably maintenance before SMMU code
also requires its own locked data tables. For example, preventing
duplicate pinning might require a global table of handles.

Putting all of the handles in one table allows doing duplicate detection
across cmdbuf and reloc tables. This allows pinning each buffer exactly
once, which reduces number of calls to IOMMU.

> "host1x_cma_pin_array_ids" doesn't return negative value right now, so
> maybe you need to take a look at it.

True, and also a consequence of using CMA: pinning can never fail. With
IOMMU, pinning can fail.

Terje
