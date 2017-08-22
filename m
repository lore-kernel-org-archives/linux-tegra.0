From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 4/6] dt-bindings: host1x: Fix and add Tegra186 information
Date: Mon, 21 Aug 2017 21:39:23 -0500
Message-ID: <20170822023923.nr22ujsuiousvt2y@rob-hp-laptop>
References: <20170817185413.6324-1-mperttunen@nvidia.com>
 <20170817185413.6324-5-mperttunen@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170817185413.6324-5-mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dnibade-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, amerilainen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, sgurrappadi-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Thu, Aug 17, 2017 at 09:54:11PM +0300, Mikko Perttunen wrote:
> Add note that address/size-cells should be 2 on 64-bit systems,
> and add Tegra186-specific register range properties.

Generally the cell sizes have nothing to do with the addressing size of 
the cpu. They should be as small as what fits for the given sub-tree. If 
all the register space fits into 4GB, then there's no reason for the 
#size-cells to be 2. The same is true if the sub-tree has a parent bus.

Rob
