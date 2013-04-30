From: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH] dma: tegra: implement suspend/resume callbacks
Date: Tue, 30 Apr 2013 18:12:32 +0530
Message-ID: <517FBC38.3000108@nvidia.com>
References: <1366797267-29567-1-git-send-email-ldewangan@nvidia.com> <20130430103046.GD1960@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20130430103046.GD1960-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Cc: "djbw-b10kYP2dOMg@public.gmane.org" <djbw-b10kYP2dOMg@public.gmane.org>, "swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org" <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Tuesday 30 April 2013 04:00 PM, Vinod Koul wrote:
> On Wed, Apr 24, 2013 at 03:24:27PM +0530, Laxman Dewangan wrote:
>> +
>> +	/* Enable clock before accessing register */
>> +	ret = tegra_dma_runtime_resume(dev);
>> +	if (ret < 0)
>> +		return ret;
> You dont seem to handle suspend when DMA is active? Otherwise looks fine.
> Stephen, you okay with this patch?

The client of dma need to gracefully stop the transfer and then do 
suspend himself.
Also driver suspend can happen even if there is no allocation of dma. In 
this case, clock is disabled so enabling explicitly here.
