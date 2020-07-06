From: Vinod Koul <vkoul@kernel.org>
Subject: Re: [qemu] boot failed: Unable to handle kernel NULL pointer
 dereference at virtual address 0000000000000000
Date: Mon, 6 Jul 2020 20:40:41 +0530
Message-ID: <20200706151041.GL633187@vkoul-mobl>
References: <CA+G9fYvqW-RQxt3kSoNkh5Y2REoe0QQB_dTz_KPzhJzcwiM5OA@mail.gmail.com>
 <CAK8P3a1Lda8HhsDvDREf-cOgb4RkCgEKK5Q-Zj+UhK8tsAaBLw@mail.gmail.com>
 <8c50799e-d0ba-626a-5627-5ff4e5825f6a@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-serial-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <8c50799e-d0ba-626a-5627-5ff4e5825f6a@intel.com>
Sender: linux-serial-owner@vger.kernel.org
To: Dave Jiang <dave.jiang@intel.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Naresh Kamboju <naresh.kamboju@linaro.org>, linux-serial@vger.kernel.org, open list <linux-kernel@vger.kernel.org>, Jiri Slaby <jslaby@suse.com>, linux-arm-msm <linux-arm-msm@vger.kernel.org>, linux-tegra <linux-tegra@vger.kernel.org>, jirislaby@kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Andy Gross <agross@kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, ldewangan@nvidia.com, Thierry Reding <thierry.reding@gmail.com>, Jon Hunter <jonathanh@nvidia.com>, Qian Cai <cai@lca.pw>, lkft-triage@lists.linaro.org
List-Id: linux-tegra@vger.kernel.org

On 06-07-20, 07:33, Dave Jiang wrote:

> > I don't see anything suspicious in dmaengine drivers, but there is a
> > recent series
> > from Dave Jiang that might explain it. Could you try reverting  commit
> > deb9541f5052 ("dmaengine: check device and channel list for empty")?
> > 
> > I think the broken change is this one:
> > 
> > @@ -819,6 +850,11 @@ struct dma_chan *dma_request_chan(struct device
> > *dev, const char *name)
> > 
> >          /* Try to find the channel via the DMA filter map(s) */
> >          mutex_lock(&dma_list_mutex);
> > +       if (list_empty(&dma_device_list)) {
> > +               mutex_unlock(&dma_list_mutex);
> > +               return NULL;
> > +       }
> > +
> >          list_for_each_entry_safe(d, _d, &dma_device_list, global_node) {
> >                  dma_cap_mask_t mask;
> >                  const struct dma_slave_map *map = dma_filter_match(d,
> > name, dev);
> > 
> > which needs to return an error code like -ENODEV instead of NULL. There
> > may be other changes in the same patch that introduce the same bug
> > elsewhere.
> > 
> >       Arnd
> > 
> 
> Vinod,
> Do you want a diff fix or a revision of the patch for the fix?

Diff fix please

-- 
~Vinod
