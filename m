From: =?UTF-8?B?VGVyamUgQmVyZ3N0csO2bQ==?= <tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v2 5/5] drm/tegra: Implement page-flipping support
Date: Tue, 22 Jan 2013 12:39:18 +0200
Message-ID: <50FE6C56.1010803@nvidia.com>
References: <1358179560-26799-1-git-send-email-thierry.reding@avionic-design.de>  <1358179560-26799-6-git-send-email-thierry.reding@avionic-design.de>  <50FE4E4F.6080506@nvidia.com>  <20130122085756.GA6315@avionic-0098.adnet.avionic-design.de>  <1358846121.1540.6.camel@tellur>  <20130122093150.GA22264@avionic-0098.adnet.avionic-design.de>  <50FE5F61.4080103@nvidia.com> <1358848092.1540.13.camel@tellur>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1358848092.1540.13.camel@tellur>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
Cc: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, "dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 22.01.2013 11:48, Lucas Stach wrote:
> I think the test suite is enough to fulfil the formal requirement of
> having a working userspace. But still it would be nice to have at least
> some simple accel functions working in the DDX. Maybe just to see on how
> well the current design integrates into the DDX code.
> 
> So I wouldn't make a working DDX a hard requirement for merging G2D
> code, but I suspect that if the kernel code goes into 3.10 instead of
> 3.9, we'll just naturally get to the point of working DDX accel by the
> same time.

For me, the most important thing would be to nail down a baseline
structure. That way new feature development would be unblocked (IOMMU,
other host1x clients, context switching, wait bases come to mind) and we
could start to synchronize downstream with upstream.

Biggest benefit of getting merged is that it's a pretty strong
indication of a solid baseline. :-)

Terje
