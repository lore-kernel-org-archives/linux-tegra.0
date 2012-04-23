From: Russell King - ARM Linux <linux@arm.linux.org.uk>
Subject: Re: [PATCH V1] dmaengine: tegra: add dma driver
Date: Mon, 23 Apr 2012 14:06:59 +0100
Message-ID: <20120423130659.GA22186@n2100.arm.linux.org.uk>
References: <1334912896-4614-1-git-send-email-ldewangan@nvidia.com> <1334920487.31825.98.camel@vkoul-udesk3> <4F9153AF.7020901@nvidia.com> <1335170491.31825.104.camel@vkoul-udesk3> <4F95483F.5020005@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <4F95483F.5020005@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Laxman Dewangan <ldewangan@nvidia.com>
Cc: Vinod Koul <vinod.koul@linux.intel.com>, "dan.j.williams@intel.com" <dan.j.williams@intel.com>, "grant.likely@secretlab.ca" <grant.likely@secretlab.ca>, "rob.herring@calxeda.com" <rob.herring@calxeda.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, Stephen Warren <swarren@nvidia.com>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

On Mon, Apr 23, 2012 at 05:47:03PM +0530, Laxman Dewangan wrote:
> Hi Russell,
> On Monday 23 April 2012 02:11 PM, Vinod Koul wrote:
>> On Fri, 2012-04-20 at 17:46 +0530, Laxman Dewangan wrote:
>>> Thanks Vinod for quick review.
>> Since I was on vacation, I hadn't noticed Russell has already sent the
>> patches for omap dma support.
>> http://permalink.gmane.org/gmane.linux.ports.arm.omap/75034
>>
>> It would be nice if both the efforts are coordinated.
>>
>> Btw I like the virtual channel support introduced by Russell
>>
>
> Can you please point me the virtual channel related change? I am not  
> able to locate this like search for function vchan_* ().
> My driver is also on same line but not used vchan_* and also having  
> support for cyclic transfer.

It's only been posted in RFC form on linux-arm-kernel and linux-omap
lists.  The specific patch is:

http://lists.arm.linux.org.uk/lurker/message/20120418.101116.082b350f.en.html

I wouldn't call it perfected yet, but usable.  It doesn't have any
knowledge about cyclic transfers either.
