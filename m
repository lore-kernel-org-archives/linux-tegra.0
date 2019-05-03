From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Subject: Re: [PATCH] dma-buf: add struct dma_buf_attach_info v2
Date: Fri, 3 May 2019 14:05:47 +0200
Message-ID: <cbcbb076-a8b0-67b0-8c16-daf1d060fc1d@gmail.com>
References: <20190430111002.106168-1-christian.koenig@amd.com>
 <20190430173127.k5ivpaz6ktbfecgo@shell.armlinux.org.uk>
Reply-To: christian.koenig@amd.com
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190430173127.k5ivpaz6ktbfecgo@shell.armlinux.org.uk>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Russell King - ARM Linux admin <linux@armlinux.org.uk>
Cc: xen-devel@lists.xenproject.org, devel@driverdev.osuosl.org, linux-tegra@vger.kernel.org, intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org, sstabellini@kernel.org, jgross@suse.com, boris.ostrovsky@oracle.com, digetx@gmail.com, gregkh@linuxfoundation.org, arnd@arndb.de, mchehab@kernel.org, kyungmin.park@samsung.com, m.szyprowski@samsung.com, pawel@osciak.com, jonathanh@nvidia.com, thierry.reding@gmail.com, tomi.valkeinen@ti.com, rodrigo.vivi@intel.com, joonas.lahtinen@linux.intel.com, jani.nikula@linux.intel.com, sean@poorly.run, maxime.ripard@bootlin.com, maarten.lankhorst@linux.intel.com, sumit.semwal@linaro.org
List-Id: linux-tegra@vger.kernel.org

Am 30.04.19 um 19:31 schrieb Russell King - ARM Linux admin:
> On Tue, Apr 30, 2019 at 01:10:02PM +0200, Christian König wrote:
>> Add a structure for the parameters of dma_buf_attach, this makes it much easier
>> to add new parameters later on.
> I don't understand this reasoning.  What are the "new parameters" that
> are being proposed, and why do we need to put them into memory to pass
> them across this interface?
>
> If the intention is to make it easier to change the interface, passing
> parameters in this manner mean that it's easy for the interface to
> change and drivers not to notice the changes, since the compiler will
> not warn (unless some member of the structure that the driver is using
> gets removed, in which case it will error.)
>
> Additions to the structure will go unnoticed by drivers - what if the
> caller is expecting some different kind of behaviour, and the driver
> ignores that new addition?

Well, exactly that's the intention here: That the drivers using this 
interface should be able to ignore the new additions for now as long as 
they are not going to use them.

The background is that we have multiple interface changes in the 
pipeline, and each step requires new optional parameters.

> This doesn't seem to me like a good idea.

Well, the obvious alternatives are:

a) Change all drivers to explicitly provide NULL/0 for the new parameters.

b) Use a wrapper, so that the function signature of dma_buf_attach stays 
the same.

Key point here is that I have an invalidation callback change, a P2P 
patch set and some locking changes which all require adding new 
parameters or flags. And at each step I would then start to change all 
drivers, adding some more NULL pointers or flags with 0 default value.

I'm actually perfectly fine going down any route, but this just seemed 
to me simplest and with the least risk of breaking anything. Opinions?

Thanks,
Christian.
