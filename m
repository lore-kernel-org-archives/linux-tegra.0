From: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH] dma: tegra: enable/disable dma clock
Date: Fri, 20 Jul 2012 12:04:13 +0530
Message-ID: <5008FBE5.9090603@nvidia.com>
References: <1342601769-13852-1-git-send-email-ldewangan@nvidia.com>	 <1342764141.1726.199.camel@vkoul-udesk3>  <5008F4D8.9070108@nvidia.com> <1342766445.1726.246.camel@vkoul-udesk3>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1342766445.1726.246.camel@vkoul-udesk3>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Vinod Koul <vinod.koul-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Cc: "dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org" <dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Friday 20 July 2012 12:10 PM, Vinod Koul wrote:
> On Fri, 2012-07-20 at 11:34 +0530, Laxman Dewangan wrote:
>> On Friday 20 July 2012 11:32 AM, Vinod Koul wrote:
>>
> for a start you can move these to .alloc_chan_resources
> and .free_chan_resources while doing a  refcount.
> Further optimization can be done by moving this to tx_submit and
> tasklet.
>
Agree. I will send the new patch.
