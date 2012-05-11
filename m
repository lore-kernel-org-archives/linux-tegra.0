From: Laxman Dewangan <ldewangan@nvidia.com>
Subject: Re: [PATCH V2 2/2] dmaengine: tegra: add dma driver
Date: Fri, 11 May 2012 16:28:36 +0530
Message-ID: <4FACF0DC.3050209@nvidia.com>
References: <1336030889-32269-1-git-send-email-ldewangan@nvidia.com>	 <1336030889-32269-3-git-send-email-ldewangan@nvidia.com>	 <1336558444.1540.243.camel@vkoul-udesk3>  <4FAA4EA3.70001@nvidia.com>	 <1336620844.1540.269.camel@vkoul-udesk3>  <4FAB4C7D.7030406@nvidia.com> <1336725713.15424.1856.camel@vkoul-udesk3>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1336725713.15424.1856.camel@vkoul-udesk3>
Sender: linux-kernel-owner@vger.kernel.org
To: Vinod Koul <vinod.koul@linux.intel.com>
Cc: "dan.j.williams@intel.com" <dan.j.williams@intel.com>, "grant.likely@secretlab.ca" <grant.likely@secretlab.ca>, "rob.herring@calxeda.com" <rob.herring@calxeda.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

On Friday 11 May 2012 02:11 PM, Vinod Koul wrote:
> On Thu, 2012-05-10 at 10:35 +0530, Laxman Dewangan wrote:
>
>> But when we update the chan->completed_cookie for aborted cookie?
>> Otherwise I will get the DMA_IN_PROGRSS when I call dma_cookie_status()
>> but actually it is aborted.
> no in .device_tx_status, you should check if the descriptor is aborted
> or not and rteurn error for aborted descriptor.
>
OK, I will not call this function.
Also I am dropping the ONCE_NOTIFY_HALF and will add later if require. I 
realize that patch patch should be simple and sufficient so that  other 
driver development/upstream can be unblock. Later on we can add feature 
based on necessary.

I am sending the new patch with considering all your feedback.
Thanks again for review.

Thanks,
Laxman
