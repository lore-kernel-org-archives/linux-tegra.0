From: Vinod Koul <vinod.koul-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Subject: Re: [PATCH] dma: tegra: enable/disable dma clock
Date: Fri, 20 Jul 2012 12:10:45 +0530
Message-ID: <1342766445.1726.246.camel@vkoul-udesk3>
References: <1342601769-13852-1-git-send-email-ldewangan@nvidia.com>
	 <1342764141.1726.199.camel@vkoul-udesk3>  <5008F4D8.9070108@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5008F4D8.9070108-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: "dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org" <dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Fri, 2012-07-20 at 11:34 +0530, Laxman Dewangan wrote:
> On Friday 20 July 2012 11:32 AM, Vinod Koul wrote:
> > On Wed, 2012-07-18 at 14:26 +0530, Laxman Dewangan wrote:
> >> Enable the DMA clock when registering DMA driver and
> >> disable clock when removing the DMA driver.
> >>
> >> The failure was observed on Tegra20 based system by
> >> Stephen Warren. However, it is working fine on tegra30
> >> based system and probably becasue uboot enable the clock
> >> on Tegra30.
> > Don't know much about the clock subsystem, but shouldn't the clocks be
> > enabled runtime..... when you actually start using the controller??
> 
> Yes, this is the plan and I am going to implement dynamic clock 
> management but it will take some time to complete and have testing 
> throughly. some of the issue which I am seeing and analyzing on this 
> approach is that
>   - clock disable can be called from isr context or not?
>   - how much complexity will be added in dma driver to implement this?
>   - What power benefit we will get on this.
>   - Is there any user which generally use dma and always keep dma on 
> requested state like UART RX always ready etc.
> 
> So keeping that in mind, it will take some time to complete this and 
> meanwhile, I want to make it work for Tegra20 based system which is not 
> working on current driver.
> and hence this is the change.
for a start you can move these to .alloc_chan_resources
and .free_chan_resources while doing a  refcount.
Further optimization can be done by moving this to tx_submit and
tasklet.

-- 
~Vinod
