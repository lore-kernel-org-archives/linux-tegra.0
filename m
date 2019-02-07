From: Christoph Hellwig <hch@infradead.org>
Subject: Re: [PATCH V11 3/5] i2c: tegra: Add DMA support
Date: Wed, 6 Feb 2019 23:16:33 -0800
Message-ID: <20190207071633.GA25149@infradead.org>
References: <1549356985-25726-1-git-send-email-skomatineni@nvidia.com>
 <1549356985-25726-3-git-send-email-skomatineni@nvidia.com>
 <a9e264e2-87c9-e263-808a-b561e8ed4073@gmail.com>
 <20190206145343.GA3651@ulmo>
 <5e66803c-b13b-cb00-e2ff-d096a1650612@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <5e66803c-b13b-cb00-e2ff-d096a1650612@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>
Cc: Thierry Reding <thierry.reding@gmail.com>, Sowjanya Komatineni <skomatineni@nvidia.com>, jonathanh@nvidia.com, mkarthik@nvidia.com, smohammed@nvidia.com, talho@nvidia.com, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On Wed, Feb 06, 2019 at 05:56:02PM +0300, Dmitry Osipenko wrote:
> > We don't have an IOMMU attached to I2C or APBDMA, so this can't happen
> > and even if we had an IOMMU attached, all we care about is the device's
> > DMA address space, which means IOVA space, and that would still be
> > guaranteed to be contiguous, according to the above.
> 
> Yes, but doesn't T186+ have IOMMU support for the DMA controller?

Even if it did, why would that matter?  The device would only see
IOVA space, the CPU for a normal driver only sees kernel virtual
space.

Forced contiguous space only makes sense when you have access by CPU
physical address, which should not happen for "normal" device drivers.
