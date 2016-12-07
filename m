From: Mikko Perttunen <cyndis-/1wQRMveznE@public.gmane.org>
Subject: Re: [PATCH 2/8] drm/tegra: Allocate BOs from lower 4G when without
 IOMMU
Date: Wed, 7 Dec 2016 11:32:56 +0200
Message-ID: <7587bfa4-b007-a2a0-4169-561551530191@kapsi.fi>
References: <20161110182345.31777-1-mperttunen@nvidia.com>
 <20161110182345.31777-3-mperttunen@nvidia.com>
 <20161205183955.GB22918@ulmo.ba.sec>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20161205183955.GB22918-EkSeR96xj6Pcmrwk2tT4+A@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, airlied-cv59FeDIM0c@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 05.12.2016 20:39, Thierry Reding wrote:
> On Thu, Nov 10, 2016 at 08:23:39PM +0200, Mikko Perttunen wrote:
>> On 64-bit Tegras, buffer object memory allocation may
>> return memory above 4G that units behind Host1x cannot
>> access. Add the GFP_DMA flag to these allocation when
>> IOMMU is not enabled to ensure units can always access
>> BO memory.
>
> I don't think that's entirely true. The display controller can address
> more than 32 bits. It's perhaps slightly different from other units that
> are behind host1x, but maybe we need a special case here to allow frame-
> buffers to reside in higher memory?

I checked and looks like all (or at least most) units can actually 
address 34 bits /almost always/. The thing that tripped me up was that 
apparently the firmware for VIC still needs be in the lower 32 bits. So 
we should be able to drop this patch.

>
> Thierry
>

Thanks,
Mikko.
