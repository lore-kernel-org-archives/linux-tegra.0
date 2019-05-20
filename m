From: Baolin Wang <baolin.wang@linaro.org>
Subject: Re: [PATCH 1/8] dmaengine: Add matching device node validation in __dma_request_channel()
Date: Mon, 20 May 2019 19:27:04 +0800
Message-ID: <CAMz4kuLokUGVXQaRt5aOBJOUQjsrPK74WGsif6Y1F7zwMvDXfA@mail.gmail.com>
References: <cover.1557206859.git.baolin.wang@linaro.org> <17a22052fdb759ae6129e30f9bd8862f23a03ad9.1557206859.git.baolin.wang@linaro.org>
 <42b84cfe-3281-7f4e-03cc-6ca126e16191@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <42b84cfe-3281-7f4e-03cc-6ca126e16191@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Peter Ujfalusi <peter.ujfalusi@ti.com>
Cc: Dan Williams <dan.j.williams@intel.com>, Vinod Koul <vkoul@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org, Shawn Guo <shawnguo@kernel.org>, s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com, Zubair.Kakakhel@imgtec.com, Wolfram Sang <wsa+renesas@sang-engineering.com>, jroedel@suse.de, Vincent Guittot <vincent.guittot@linaro.org>, dmaengine@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>
List-Id: linux-tegra@vger.kernel.org

On Tue, 7 May 2019 at 16:37, Peter Ujfalusi <peter.ujfalusi@ti.com> wrote:
>
> Hi,
>
> On 07/05/2019 9.09, Baolin Wang wrote:
> > When user try to request one DMA channel by __dma_request_channel(), it=
 won't
> > validate if it is the correct DMA device to request, that will lead eac=
h DMA
> > engine driver to validate the correct device node in their filter funct=
ion
> > if it is necessary.
> >
> > Thus we can add the matching device node validation in the DMA engine c=
ore,
> > to remove all of device node validation in the drivers.
>
> I have picked this patch to my TI UDMA series and with
> __dma_request_channel() it works as expected - picking the channel from
> the correct DMA device.
>
> Tested-by: Peter Ujfalusi <peter.ujfalusi@ti.com>

Thanks Peter.

>
> >
> > Signed-off-by: Baolin Wang <baolin.wang@linaro.org>
> > ---
> >  drivers/dma/dmaengine.c   |   10 ++++++++--
> >  drivers/dma/of-dma.c      |    4 ++--
> >  include/linux/dmaengine.h |   12 ++++++++----
> >  3 files changed, 18 insertions(+), 8 deletions(-)
> >
> > diff --git a/drivers/dma/dmaengine.c b/drivers/dma/dmaengine.c
> > index 3a11b10..610080c 100644
> > --- a/drivers/dma/dmaengine.c
> > +++ b/drivers/dma/dmaengine.c
> > @@ -641,11 +641,13 @@ struct dma_chan *dma_get_any_slave_channel(struct=
 dma_device *device)
> >   * @mask: capabilities that the channel must satisfy
> >   * @fn: optional callback to disposition available channels
> >   * @fn_param: opaque parameter to pass to dma_filter_fn
> > + * @np: device node to look for DMA channels
> >   *
> >   * Returns pointer to appropriate DMA channel on success or NULL.
> >   */
> >  struct dma_chan *__dma_request_channel(const dma_cap_mask_t *mask,
> > -                                    dma_filter_fn fn, void *fn_param)
> > +                                    dma_filter_fn fn, void *fn_param,
> > +                                    struct device_node *np)
> >  {
> >       struct dma_device *device, *_d;
> >       struct dma_chan *chan =3D NULL;
> > @@ -653,6 +655,10 @@ struct dma_chan *__dma_request_channel(const dma_c=
ap_mask_t *mask,
> >       /* Find a channel */
> >       mutex_lock(&dma_list_mutex);
> >       list_for_each_entry_safe(device, _d, &dma_device_list, global_nod=
e) {
> > +             /* Finds a DMA controller with matching device node */
> > +             if (np && device->dev->of_node && np !=3D device->dev->of=
_node)
> > +                     continue;
> > +
> >               chan =3D find_candidate(device, mask, fn, fn_param);
> >               if (!IS_ERR(chan))
> >                       break;
> > @@ -769,7 +775,7 @@ struct dma_chan *dma_request_chan_by_mask(const dma=
_cap_mask_t *mask)
> >       if (!mask)
> >               return ERR_PTR(-ENODEV);
> >
> > -     chan =3D __dma_request_channel(mask, NULL, NULL);
> > +     chan =3D __dma_request_channel(mask, NULL, NULL, NULL);
> >       if (!chan) {
> >               mutex_lock(&dma_list_mutex);
> >               if (list_empty(&dma_device_list))
> > diff --git a/drivers/dma/of-dma.c b/drivers/dma/of-dma.c
> > index 91fd395..6b43d04 100644
> > --- a/drivers/dma/of-dma.c
> > +++ b/drivers/dma/of-dma.c
> > @@ -316,8 +316,8 @@ struct dma_chan *of_dma_simple_xlate(struct of_phan=
dle_args *dma_spec,
> >       if (count !=3D 1)
> >               return NULL;
> >
> > -     return dma_request_channel(info->dma_cap, info->filter_fn,
> > -                     &dma_spec->args[0]);
> > +     return __dma_request_channel(&info->dma_cap, info->filter_fn,
> > +                                  &dma_spec->args[0], dma_spec->np);
> >  }
> >  EXPORT_SYMBOL_GPL(of_dma_simple_xlate);
> >
> > diff --git a/include/linux/dmaengine.h b/include/linux/dmaengine.h
> > index d49ec5c..504085b 100644
> > --- a/include/linux/dmaengine.h
> > +++ b/include/linux/dmaengine.h
> > @@ -1314,7 +1314,8 @@ static inline enum dma_status dma_async_is_comple=
te(dma_cookie_t cookie,
> >  enum dma_status dma_wait_for_async_tx(struct dma_async_tx_descriptor *=
tx);
> >  void dma_issue_pending_all(void);
> >  struct dma_chan *__dma_request_channel(const dma_cap_mask_t *mask,
> > -                                     dma_filter_fn fn, void *fn_param)=
;
> > +                                    dma_filter_fn fn, void *fn_param,
> > +                                    struct device_node *np);
> >  struct dma_chan *dma_request_slave_channel(struct device *dev, const c=
har *name);
> >
> >  struct dma_chan *dma_request_chan(struct device *dev, const char *name=
);
> > @@ -1339,7 +1340,9 @@ static inline void dma_issue_pending_all(void)
> >  {
> >  }
> >  static inline struct dma_chan *__dma_request_channel(const dma_cap_mas=
k_t *mask,
> > -                                           dma_filter_fn fn, void *fn_=
param)
> > +                                                  dma_filter_fn fn,
> > +                                                  void *fn_param,
> > +                                                  struct device_node *=
np)
> >  {
> >       return NULL;
> >  }
> > @@ -1411,7 +1414,8 @@ static inline int dmaengine_desc_free(struct dma_=
async_tx_descriptor *desc)
> >  void dma_run_dependencies(struct dma_async_tx_descriptor *tx);
> >  struct dma_chan *dma_get_slave_channel(struct dma_chan *chan);
> >  struct dma_chan *dma_get_any_slave_channel(struct dma_device *device);
> > -#define dma_request_channel(mask, x, y) __dma_request_channel(&(mask),=
 x, y)
> > +#define dma_request_channel(mask, x, y) \
> > +     __dma_request_channel(&(mask), x, y, NULL)
> >  #define dma_request_slave_channel_compat(mask, x, y, dev, name) \
> >       __dma_request_slave_channel_compat(&(mask), x, y, dev, name)
> >
> > @@ -1429,6 +1433,6 @@ static inline int dmaengine_desc_free(struct dma_=
async_tx_descriptor *desc)
> >       if (!fn || !fn_param)
> >               return NULL;
> >
> > -     return __dma_request_channel(mask, fn, fn_param);
> > +     return __dma_request_channel(mask, fn, fn_param, NULL);
> >  }
> >  #endif /* DMAENGINE_H */
> >
>
> - P=C3=A9ter
>
> Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
> Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki



--=20
Baolin Wang
Best Regards
