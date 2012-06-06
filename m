From: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH V5 2/2] dma: tegra: add dmaengine based dma driver
Date: Wed, 6 Jun 2012 23:22:27 +0530
Message-ID: <4FCF98DB.5050000@nvidia.com>
References: <1338960327-31453-1-git-send-email-ldewangan@nvidia.com> <1338960327-31453-2-git-send-email-ldewangan@nvidia.com> <4FCF97A5.5040008@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <4FCF97A5.5040008-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: "vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org" <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, "dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org" <dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, "grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org" <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org" <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Wednesday 06 June 2012 11:17 PM, Stephen Warren wrote:
> On 06/05/2012 11:25 PM, Laxman Dewangan wrote:
>> Add dmaengine based NVIDIA's Tegra APB DMA driver.
>> This driver support the slave mode of data transfer from
>> peripheral to memory and vice versa.
>> The driver supports for the cyclic and non-cyclic mode
>> of data transfer.
> Acked-by: Stephen Warren<swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
>
> Laxman, what are you plans for enabling this and replacing the existing
> non-dmaengine APB DMA driver? We will need to convert:
>
> * The fuse WAR stuff in arch/arm/mach-tegra
> * The ASoC driver in sound/soc/tegra
>
> This will require some thought and dependency management between the
> various subsystems.
Currently following drive using the non-dmanegine apb dma driver:
fuse
SPI
ASoc.

I want to first have this dma driver in the tree and then I will have 
the series of patches to use this dmaengine dma driver and delete the 
old apb dma driver.

So just waiting for this driver to be in.


> Vinod,
>
> It may be best to apply this series along in a topic branch that you
> merge into the dmaengine branch, and I can pull into Tegra if/when I
> need. Or, if you ack it, I can take it all through the Tegra tree if you
> want. That wouldn't allow patch 1 to be use by others though.
>

I like this series to be taken by Vinod. And then pull the change in to 
Tegra tree for further dependency change.
Reason is:
- If there is any dmaengine driver change/enhancement, then tegra dma 
driver will also be inline.
- Taking on tegra tree help to implement the clock framework which is 
going on.
- Also fuse related changes will be in tegra tree.
- Asoc and SPI can be also taken in the tegra tree or may be their 
corresponding tree based on how much other changes are there,
-Deletion of old driver is in Tegra tree.

> Thanks.
