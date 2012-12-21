From: =?UTF-8?B?VGVyamUgQmVyZ3N0csO2bQ==?= <tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCHv4 0/8] Support for Tegra 2D hardware
Date: Fri, 21 Dec 2012 15:57:56 +0200
Message-ID: <50D46AE4.8020308@nvidia.com>
References: <1356089964-5265-1-git-send-email-tbergstrom@nvidia.com> <1356097818.1490.109.camel@tellur>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1356097818.1490.109.camel@tellur>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
Cc: "thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org" <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>, "airlied-cv59FeDIM0c@public.gmane.org" <airlied-cv59FeDIM0c@public.gmane.org>, "dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 21.12.2012 15:50, Lucas Stach wrote:
> This has to be resolved before merging. Personally I'm in favour of
> keeping reg access patterns close to what is done in other parts of the
> kernel.

I haven't so far received comments from too many people, so that's why I
left it as is.

>>  * Uses still CMA helpers. IOMMU support will replace CMA with host1x
>>    specific allocator.
> 
> I really want the allocator issue resolved before talking about merging
> those patches. Proper IOMMU support will require a bit of rework of the
> current upstream IOMMU API, so it will still be a bit out.
> 
> But if you don't mind I'll try to implement the host1x allocator over
> the holidays and provide an incremental patch.

Do you mean host1x CMA allocator using dma mapping API? That'd be great
if you could help out. I've just tried to concentrate on getting ok for
base essentials before doing any extra work.

Terje
