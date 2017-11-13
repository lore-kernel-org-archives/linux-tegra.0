From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [PATCH v4 3/5] staging: Introduce NVIDIA Tegra video decoder
 driver
Date: Mon, 13 Nov 2017 11:16:41 +0300
Message-ID: <20171113081641.fhmvxrxuylge3x2f@mwanda>
References: <cover.1508448293.git.digetx@gmail.com>
 <1a3798f337c0097e67d70226ae3ba665fd9156c2.1508448293.git.digetx@gmail.com>
 <2c2910bc-40d4-b4ac-cdbe-b3c670a91f1b@mleia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
Content-Disposition: inline
In-Reply-To: <2c2910bc-40d4-b4ac-cdbe-b3c670a91f1b@mleia.com>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: "devel" <driverdev-devel-bounces@linuxdriverproject.org>
To: Vladimir Zapolskiy <vz@mleia.com>
Cc: devel@driverdev.osuosl.org, devicetree@vger.kernel.org, Stephen Warren <swarren@wwwdotorg.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, Thierry Reding <thierry.reding@gmail.com>, linux-tegra@vger.kernel.org, Dmitry Osipenko <digetx@gmail.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On Sat, Nov 11, 2017 at 04:06:52PM +0200, Vladimir Zapolskiy wrote:
> > +	if (!wait_dma)
> > +		return 0;
> > +
> > +	err = readl_relaxed_poll_timeout(vde->bsev + INTR_STATUS, value,
> > +					 !(value & BSE_DMA_BUSY), 1, 100);
> > +	if (err) {
> > +		dev_err(dev, "BSEV DMA timeout\n");
> > +		return err;
> > +	}
> > +
> > +	return 0;
> 
> 	if (err)
> 		dev_err(dev, "BSEV DMA timeout\n");
> 
> 	return err;
> 
> is two lines shorter.
> 

This is fine, but just watch out because getting clever with a last if
statement is a common anti-pattern.  For example, you often see it where
people do success handling instead of failure handling.  And it leads
to static checker bugs, and makes the code slightly more subtle.

> > +		err = tegra_vde_attach_dmabuf(dev, source->aux_fd,
> > +					      source->aux_offset, csize,
> > +					      &frame->aux_dmabuf_attachment,
> > +					      &frame->aux_addr,
> > +					      &frame->aux_sgt,
> > +					      NULL, dma_dir);
> > +		if (err)
> > +			goto err_release_cr;
> > +	}
> > +
> > +	return 0;
> 
> 	if (!err)
> 		return 0;
> 
> and then remove a check above.
> 

Argh!!!!  Success handling.  Always do failure handling, never success
handling.

The rest of your comments I agree with, though.

regards,
dan carpenter
