From: Vinod Koul <vinod.koul-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Subject: Re: [PATCH V1] dmaengine: tegra: add dma driver
Date: Wed, 25 Apr 2012 15:03:45 +0530
Message-ID: <1335346425.31825.118.camel@vkoul-udesk3>
References: <1334912896-4614-1-git-send-email-ldewangan@nvidia.com>
	 <1334920487.31825.98.camel@vkoul-udesk3> <4F9153AF.7020901@nvidia.com>
	 <1335170491.31825.104.camel@vkoul-udesk3> <4F95483F.5020005@nvidia.com>
	 <20120423130659.GA22186@n2100.arm.linux.org.uk>
	 <4F95567E.3090605@nvidia.com>  <4F97BD67.1050300@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <4F97BD67.1050300-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, "dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org" <dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, "grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org" <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, "rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org" <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Wed, 2012-04-25 at 14:31 +0530, Laxman Dewangan wrote:
> 
> I had a  communication with Russell on another change thread and 
> understand that some more work need to be done in virt_chan to support 
> cyclic one.
> 
> I want to have the cyclic dma support in my driver so I want to go on 
> following steps:
> 1. I will post the patch for tegra dma which will not use the virt_dma 
> so that my driver will be independent of Russel's change.
which driver? A new driver for cyclic support only or on top of
Russell's changes?
> 2. Once the tegra dma is part of tree, I can move all my dma client to 
> use the dmaengine based driver and remove old style dma.
> 3. Till that time Russell's will have already virt_dma support for 
> cyclic one and so I will change tegra_dma.c to use virt_dma.
> 
> 
> Let me know your opinion so that I can plan my patch/change
> accordingly. 

-- 
~Vinod
