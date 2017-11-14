From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v3 0/2] Correct Tegra20 FUSE driver DMA usage
Date: Tue, 14 Nov 2017 14:25:28 +0300
Message-ID: <a149fdb0-64ff-fa99-734e-9335605191ce@gmail.com>
References: <cover.1508450681.git.digetx@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <cover.1508450681.git.digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 20.10.2017 01:08, Dmitry Osipenko wrote:
> Change log:
> 
> v3:
> 	- Addressed v2 review comments: added 'config.device_fc = false'
> 	  and utilize of_device_is_compatible() for dma-filter
> 
> v2:
> 	- Dropped DT patch as turned out it was incorrect and made things
> 	  work by luck.
> 
> 	- Now FUSE driver requests DMA channel from the APB DMA driver
> 	  utilizing DMA channel filter.
> 
> 	- This patchset now depends on the APB DMA driver patch that allows
> 	  DMA client to issue a non-flow controlled transfers. I haven't
> 	  included that patch to this patchset since DMA usage is broken
> 	  anyway right now. It will work once this patchset and APBDMA
> 	  patch get applied.
> 
> Dmitry Osipenko (2):
>   soc/tegra: fuse: Fix reading registers using DMA on Tegra20
>   soc/tegra: fuse: Explicitly request DMA channel from APB DMA driver
> 
>  drivers/soc/tegra/fuse/fuse-tegra.c   |  1 +
>  drivers/soc/tegra/fuse/fuse-tegra20.c | 13 +++++++++++--
>  2 files changed, 12 insertions(+), 2 deletions(-)
> 

Thierry, why this patchset isn't in 'for 4.15' PR?
