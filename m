From: Jon Hunter <jonathanh@nvidia.com>
Subject: Re: [PATCH V3 2/2] dmaengine: tegra-adma: Add support for Tegra210
 ADMA
Date: Mon, 2 Nov 2015 16:22:09 +0000
Message-ID: <56378DB1.4020107@nvidia.com>
References: <1444980919-20331-1-git-send-email-jonathanh@nvidia.com>
 <1444980919-20331-3-git-send-email-jonathanh@nvidia.com>
 <CAHp75VcJOxE9iwBJvhp6-TjuF85rLYT4O2F-wHNvDxQpEpMiGg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAHp75VcJOxE9iwBJvhp6-TjuF85rLYT4O2F-wHNvDxQpEpMiGg@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Laxman Dewangan <ldewangan@nvidia.com>, Vinod Koul <vinod.koul@intel.com>, Stephen Warren <swarren@wwwdotorg.org>, Thierry Reding <thierry.reding@gmail.com>, Alexandre Courbot <gnurou@gmail.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, dmaengine <dmaengine@vger.kernel.org>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org


On 29/10/15 21:03, Andy Shevchenko wrote:
> On Fri, Oct 16, 2015 at 10:35 AM, Jon Hunter <jonathanh@nvidia.com> wrote:
>> Add support for the Tegra210 Audio DMA controller that is used for
>> transferring data between system memory and the Audio sub-system.
>> The driver only supports cyclic transfers because this is being solely
>> used for audio.
>>
>> This driver is based upon the work by Dara Ramesh <dramesh@nvidia.com>.
>>
> 
> 
>> +#include <linux/bitops.h>
>> +#include <linux/clk.h>
>> +#include <linux/delay.h>
>> +#include <linux/dmaengine.h>
>> +#include <linux/dma-mapping.h>
>> +#include <linux/err.h>
>> +#include <linux/init.h>
>> +#include <linux/interrupt.h>
>> +#include <linux/io.h>
>> +#include <linux/iopoll.h>
>> +#include <linux/mm.h>
>> +#include <linux/module.h>
>> +#include <linux/of.h>
>> +#include <linux/of_device.h>
>> +#include <linux/of_dma.h>
>> +#include <linux/of_irq.h>
>> +#include <linux/platform_device.h>
>> +#include <linux/pm.h>
>> +#include <linux/pm_runtime.h>
>> +#include <linux/slab.h>
>> +#include <linux/clk/tegra.h>
> 
> Do we really need all of them present here?

Good point. I can trim this down quite a bit.

>> +
>> +#include "dmaengine.h"
>> +#include "virt-dma.h"
>> +
>> +#define ADMA_CH_CMD                                    0x00
>> +#define ADMA_CH_STATUS                                 0x0c
>> +#define ADMA_CH_STATUS_XFER_EN                         BIT(0)
>> +
>> +#define ADMA_CH_INT_STATUS                             0x10
>> +#define ADMA_CH_INT_STATUS_XFER_DONE                   BIT(0)
>> +
>> +#define ADMA_CH_INT_CLEAR                              0x1c
>> +#define ADMA_CH_CTRL                                   0x24
>> +#define ADMA_CH_CTRL_TX_REQ(val)                       (((val) & 0xf) << 28)
>> +#define ADMA_CH_CTRL_TX_REQ_MAX                                10
>> +#define ADMA_CH_CTRL_RX_REQ(val)                       (((val) & 0xf) << 24)
>> +#define ADMA_CH_CTRL_RX_REQ_MAX                                10
>> +#define ADMA_CH_CTRL_DIR(val)                          (((val) & 0xf) << 12)
>> +#define ADMA_CH_CTRL_DIR_AHUB2MEM                      2
>> +#define ADMA_CH_CTRL_DIR_MEM2AHUB                      4
>> +#define ADMA_CH_CTRL_MODE_CONTINUOUS                   (2 << 8)
>> +#define ADMA_CH_CTRL_FLOWCTRL_EN                       BIT(1)
>> +
>> +#define ADMA_CH_CONFIG                                 0x28
>> +#define ADMA_CH_CONFIG_SRC_BUF(val)                    (((val) & 0x7) << 28)
>> +#define ADMA_CH_CONFIG_TRG_BUF(val)                    (((val) & 0x7) << 24)
>> +#define ADMA_CH_CONFIG_BURST_SIZE(val)                 (((val) & 0x7) << 20)
>> +#define ADMA_CH_CONFIG_BURST_16                                5
>> +#define ADMA_CH_CONFIG_WEIGHT_FOR_WRR(val)             ((val) & 0xf)
>> +#define ADMA_CH_CONFIG_MAX_BUFS                                8
>> +
>> +#define ADMA_CH_FIFO_CTRL                              0x2c
>> +#define ADMA_CH_FIFO_CTRL_OVRFW_THRES(val)             (((val) & 0xf) << 24)
>> +#define ADMA_CH_FIFO_CTRL_STARV_THRES(val)             (((val) & 0xf) << 16)
>> +#define ADMA_CH_FIFO_CTRL_TX_SIZE(val)                 (((val) & 0xf) << 8)
>> +#define ADMA_CH_FIFO_CTRL_RX_SIZE(val)                 ((val) & 0xf)
>> +
>> +#define ADMA_CH_TC_STATUS                              0x30
>> +#define ADMA_CH_LOWER_SRC_ADDR                         0x34
>> +#define ADMA_CH_LOWER_TRG_ADDR                         0x3c
>> +#define ADMA_CH_TC                                     0x44
>> +#define ADMA_CH_TC_COUNT_MASK                          0x3ffffffc
>> +
>> +#define ADMA_CH_XFER_STATUS                            0x54
>> +#define ADMA_CH_XFER_STATUS_COUNT_MASK                 0xffff
>> +
>> +#define ADMA_GLOBAL_CMD                                        0xc00
>> +#define ADMA_GLOBAL_SOFT_RESET                         0xc04
>> +#define ADMA_GLOBAL_INT_CLEAR                          0xc20
>> +#define ADMA_GLOBAL_CTRL                               0xc24
>> +
>> +#define ADMA_CH_REG_OFFSET(a)                          (a * 0x80)
>> +
>> +#define ADMA_CH_FIFO_CTRL_DEFAULT      (ADMA_CH_FIFO_CTRL_OVRFW_THRES(1) | \
>> +                                        ADMA_CH_FIFO_CTRL_STARV_THRES(1) | \
>> +                                        ADMA_CH_FIFO_CTRL_TX_SIZE(3)     | \
>> +                                        ADMA_CH_FIFO_CTRL_RX_SIZE(3))
>> +struct tegra_adma;
>> +
>> +/*
>> + * struct tegra_adma_chip_data - Tegra chip specific data
>> + * @nr_channels: Number of DMA channels available.
>> + */
>> +struct tegra_adma_chip_data {
>> +       int nr_channels;
>> +};
>> +
>> +/*
>> + * struct tegra_adma_chan_regs - Tegra ADMA channel registers
>> + */
>> +struct tegra_adma_chan_regs {
>> +       unsigned int ctrl;
>> +       unsigned int config;
>> +       unsigned int src_addr;
>> +       unsigned int trg_addr;
>> +       unsigned int fifo_ctrl;
>> +       unsigned int tc;
>> +};
>> +
>> +/*
>> + * struct tegra_adma_desc - Tegra ADMA descriptor to manage transfer requests.
>> + */
>> +struct tegra_adma_desc {
>> +       struct virt_dma_desc            vd;
>> +       struct tegra_adma_chan_regs     ch_regs;
>> +       unsigned long                   bytes_requested;
>> +       unsigned long                   bytes_transferred;
>> +};
>> +
>> +/*
>> + * struct tegra_adma_chan - Tegra ADMA channel information
>> + */
>> +struct tegra_adma_chan {
>> +       struct virt_dma_chan            vc;
>> +       struct tegra_adma_desc          *desc;
>> +       struct tegra_adma               *tdma;
>> +       char                            name[30];
> 
> Is it default naming scheme not enough here?

Yes, will remove this and use dma_chan_name().

>> +       int                             irq;
>> +       void __iomem                    *chan_addr;
>> +       spinlock_t                      lock;
> 
> Do the virtual channel's lock is not enough?

Yes, will remove this as well.

>> +
>> +       /* Slave channel configuration info */
>> +       struct dma_slave_config         sconfig;
>> +       bool                            sconfig_valid;
>> +       unsigned int                    sreq_dir;
>> +       unsigned int                    sreq_index;
>> +       bool                            sreq_reserved;
>> +
>> +       /* Transfer count and position info */
>> +       unsigned int                    tx_buf_count;
>> +       unsigned int                    tx_buf_pos;
>> +};
>> +
>> +/*
>> + * struct tegra_adma - Tegra ADMA controller information
>> + */
>> +struct tegra_adma {
>> +       struct dma_device                       dma_dev;
>> +       struct device                           *dev;
>> +       struct clk                              *adma_clk;
>> +       void __iomem                            *base_addr;
>> +       unsigned int                            nr_channels;
>> +       unsigned long                           rx_requests_reserved;
>> +       unsigned long                           tx_requests_reserved;
>> +
>> +       /* Used to store global command register state when suspending */
>> +       unsigned int                            global_cmd;
>> +
>> +       /* Last member of the structure */
>> +       struct tegra_adma_chan                  channels[0];
>> +};
>> +
>> +static inline void tdma_write(struct tegra_adma *tdma, u32 reg, u32 val)
>> +{
>> +       writel(val, tdma->base_addr + reg);
>> +}
>> +
>> +static inline u32 tdma_read(struct tegra_adma *tdma, u32 reg)
>> +{
>> +       return readl(tdma->base_addr + reg);
>> +}
>> +
>> +static inline void tdma_ch_write(struct tegra_adma_chan *tdc,
>> +               u32 reg, u32 val)
>> +{
>> +       writel(val, tdc->chan_addr + reg);
>> +}
>> +
>> +static inline u32 tdma_ch_read(struct tegra_adma_chan *tdc, u32 reg)
>> +{
>> +       return readl(tdc->chan_addr + reg);
>> +}
>> +
>> +static inline struct tegra_adma_chan *to_tegra_adma_chan(struct dma_chan *dc)
>> +{
>> +       return container_of(dc, struct tegra_adma_chan, vc.chan);
>> +}
>> +
>> +static inline struct tegra_adma_desc *to_tegra_adma_desc(
>> +               struct dma_async_tx_descriptor *td)
>> +{
>> +       return container_of(td, struct tegra_adma_desc, vd.tx);
>> +}
>> +
>> +static inline struct device *tdc2dev(struct tegra_adma_chan *tdc)
>> +{
>> +       return tdc->tdma->dev;
>> +}
>> +
>> +static void tegra_adma_desc_free(struct virt_dma_desc *vd)
>> +{
>> +       kfree(container_of(vd, struct tegra_adma_desc, vd));
>> +}
>> +
>> +static int tegra_adma_slave_config(struct dma_chan *dc,
>> +                                  struct dma_slave_config *sconfig)
>> +{
>> +       struct tegra_adma_chan *tdc = to_tegra_adma_chan(dc);
>> +
>> +       memcpy(&tdc->sconfig, sconfig, sizeof(*sconfig));
>> +       tdc->sconfig_valid = true;
> 
> What kind of workflow may end up with wrong slave configuration?

It is really used to verify that the user has called slave_config before
calling the prep_dma_cyclic(). However, I would agree that this would be
a user issue and be be excessive. So I am happy to get rid of this
completely.

>> +
>> +       return 0;
>> +}
>> +
>> +static int tegra_adma_init(struct tegra_adma *tdma)
>> +{
>> +       u32 status;
>> +       int ret;
>> +
>> +       /* Clear any interrupts */
>> +       tdma_write(tdma, ADMA_GLOBAL_INT_CLEAR, 0x1);
>> +
>> +       /* Assert soft reset */
>> +       tdma_write(tdma, ADMA_GLOBAL_SOFT_RESET, 0x1);
>> +
>> +       /* Wait for reset to clear */
>> +       ret = readx_poll_timeout(readl,
>> +                                tdma->base_addr + ADMA_GLOBAL_SOFT_RESET,
>> +                                status, status == 0, 20, 10000);
>> +       if (ret)
>> +               return ret;
>> +
>> +       /* Enable global ADMA registers */
>> +       tdma_write(tdma, ADMA_GLOBAL_CMD, 1);
>> +
>> +       return 0;
>> +}
>> +
>> +static int tegra_adma_request_alloc(struct tegra_adma_chan *tdc,
>> +                                   unsigned int sreq_dir)
>> +{
>> +       struct tegra_adma *tdma = tdc->tdma;
>> +       unsigned int sreq_index = tdc->sreq_index;
>> +
>> +       if (tdc->sreq_reserved)
>> +               return tdc->sreq_dir == sreq_dir ? 0 : -EINVAL;
>> +
>> +       switch (sreq_dir) {
>> +       case ADMA_CH_CTRL_DIR_MEM2AHUB:
>> +               if (sreq_index > ADMA_CH_CTRL_TX_REQ_MAX) {
>> +                       dev_err(tdma->dev, "invalid DMA request\n");
>> +                       return -EINVAL;
>> +               }
>> +
>> +               if (test_and_set_bit(sreq_index, &tdma->tx_requests_reserved)) {
>> +                       dev_err(tdma->dev, "DMA request reserved\n");
>> +                       return -EINVAL;
>> +               }
>> +               break;
>> +
>> +       case ADMA_CH_CTRL_DIR_AHUB2MEM:
>> +               if (sreq_index > ADMA_CH_CTRL_RX_REQ_MAX) {
>> +                       dev_err(tdma->dev, "invalid DMA request\n");
>> +                       return -EINVAL;
>> +               }
>> +
>> +               if (test_and_set_bit(sreq_index, &tdma->rx_requests_reserved)) {
>> +                       dev_err(tdma->dev, "DMA request reserved\n");
>> +                       return -EINVAL;
>> +               }
>> +               break;
>> +
>> +       default:
>> +               dev_WARN(tdma->dev, "channel %s has invalid transfer type\n",
>> +                        tdc->name);
> 
> Can you use classical enum dma_direction and do conversion to your
> values exactly when it's needed?
> In such case before you may call helper is_slave_direction(dir).

Ok, but I prefer to use the case statement.

>> +               return -EINVAL;
>> +       }
>> +
>> +       tdc->sreq_dir = sreq_dir;
>> +       tdc->sreq_reserved = true;
>> +
>> +       return 0;
>> +}
>> +
>> +static void tegra_adma_request_free(struct tegra_adma_chan *tdc)
>> +{
>> +       struct tegra_adma *tdma = tdc->tdma;
>> +
>> +       if (!tdc->sreq_reserved)
>> +               return;
>> +
>> +       switch (tdc->sreq_dir) {
>> +       case ADMA_CH_CTRL_DIR_MEM2AHUB:
>> +               clear_bit(tdc->sreq_index, &tdma->tx_requests_reserved);
>> +               break;
>> +       case ADMA_CH_CTRL_DIR_AHUB2MEM:
>> +               clear_bit(tdc->sreq_index, &tdma->rx_requests_reserved);
>> +               break;
>> +       default:
>> +               dev_WARN(tdma->dev, "channel %s has invalid transfer type\n",
>> +                        tdc->name);
>> +               return;
> 
> Ditto.

Ok.

>> +       }
>> +
>> +       tdc->sreq_reserved = false;
>> +}
>> +
>> +static u32 tegra_adma_irq_status(struct tegra_adma_chan *tdc)
>> +{
>> +       u32 status = tdma_ch_read(tdc, ADMA_CH_INT_STATUS);
>> +
>> +       return status & ADMA_CH_INT_STATUS_XFER_DONE;
>> +}
>> +
>> +static u32 tegra_adma_irq_clear(struct tegra_adma_chan *tdc)
>> +{
>> +       u32 status = tegra_adma_irq_status(tdc);
>> +
>> +       if (status)
>> +               tdma_ch_write(tdc, ADMA_CH_INT_CLEAR, status);
>> +
>> +       return status;
>> +}
>> +
>> +static void tegra_adma_stop(struct tegra_adma_chan *tdc)
>> +{
>> +       unsigned int status;
>> +
>> +       /* Disable ADMA */
>> +       tdma_ch_write(tdc, ADMA_CH_CMD, 0);
>> +
>> +       /* Clear interrupt status */
>> +       tegra_adma_irq_clear(tdc);
>> +
>> +       if (readx_poll_timeout_atomic(readl, tdc->chan_addr + ADMA_CH_STATUS,
>> +                       status, !(status & ADMA_CH_STATUS_XFER_EN),
>> +                       20, 10000)) {
>> +               dev_err(tdc2dev(tdc), "unable to stop DMA channel\n");
>> +               return;
>> +       }
>> +
> 
>> +       tdc->desc = NULL;
> 
> Would it be memory leak here when called from terminate_all() ?

Yes, good point. Will fix.

>> +}
>> +
>> +static void tegra_adma_start(struct tegra_adma_chan *tdc)
>> +{
>> +       struct virt_dma_desc *vd = vchan_next_desc(&tdc->vc);
>> +       struct tegra_adma_chan_regs *ch_regs;
>> +       struct tegra_adma_desc *desc;
>> +
>> +       if (!vd)
>> +               return;
>> +
>> +       list_del(&vd->node);
>> +
>> +       desc = to_tegra_adma_desc(&vd->tx);
>> +
> 
> Redundant empty line.

Ok.

>> +       if (!desc) {
>> +               dev_warn(tdc2dev(tdc), "unable to start DMA, no descriptor\n");
>> +               return;
>> +       }
>> +
>> +       ch_regs = &desc->ch_regs;
>> +
>> +       tdc->tx_buf_pos = 0;
>> +       tdc->tx_buf_count = 0;
>> +       tdma_ch_write(tdc, ADMA_CH_TC, ch_regs->tc);
>> +       tdma_ch_write(tdc, ADMA_CH_CTRL, ch_regs->ctrl);
>> +       tdma_ch_write(tdc, ADMA_CH_LOWER_SRC_ADDR, ch_regs->src_addr);
>> +       tdma_ch_write(tdc, ADMA_CH_LOWER_TRG_ADDR, ch_regs->trg_addr);
>> +       tdma_ch_write(tdc, ADMA_CH_FIFO_CTRL, ch_regs->fifo_ctrl);
>> +       tdma_ch_write(tdc, ADMA_CH_CONFIG, ch_regs->config);
>> +
>> +       /* Start ADMA */
>> +       tdma_ch_write(tdc, ADMA_CH_CMD, 1);
>> +
>> +       tdc->desc = desc;
>> +}
>> +
>> +static void tegra_adma_update_position(struct tegra_adma_chan *tdc)
>> +{
>> +       struct tegra_adma_desc *desc = tdc->desc;
>> +       unsigned int max = ADMA_CH_XFER_STATUS_COUNT_MASK + 1;
>> +       unsigned int pos = tdma_ch_read(tdc, ADMA_CH_XFER_STATUS);
>> +
>> +       /*
>> +        * Handle wrap around of buffer count register
>> +        */
>> +       if (pos < tdc->tx_buf_pos)
>> +               tdc->tx_buf_count += pos + (max - tdc->tx_buf_pos);
>> +       else
>> +               tdc->tx_buf_count += pos - tdc->tx_buf_pos;
>> +
>> +       tdc->tx_buf_pos = pos;
>> +
>> +       desc->bytes_transferred = tdc->tx_buf_count * desc->ch_regs.tc;
>> +
>> +       /*
>> +        * If we are not currently active, then it is safe to read the
>> +        * remaining words from the TC_STATUS register and add the partial
>> +        * buffer to the total transferred.
>> +        */
>> +       if (!tdc->desc)
> 
> if (desc)
> return;
> ...
> 
> ?

Hmmm ... yes this is wrong.

>> +               desc->bytes_transferred += desc->ch_regs.tc -
>> +                                          tdma_ch_read(tdc, ADMA_CH_TC_STATUS);
>> +}
>> +
>> +static unsigned int tegra_adma_get_residue(struct tegra_adma_desc *desc)
>> +{
>> +       return desc->bytes_requested - (desc->bytes_transferred %
>> +                                       desc->bytes_requested);
>> +}
>> +
>> +static irqreturn_t tegra_adma_isr(int irq, void *dev_id)
>> +{
>> +       struct tegra_adma_chan *tdc = dev_id;
>> +       unsigned long status;
>> +       unsigned long flags;
>> +
>> +       spin_lock_irqsave(&tdc->lock, flags);
>> +
>> +       status = tegra_adma_irq_clear(tdc);
>> +       if (status == 0 || !tdc->desc) {
>> +               spin_unlock_irqrestore(&tdc->lock, flags);
>> +               return IRQ_NONE;
>> +       }
>> +
>> +       vchan_cyclic_callback(&tdc->desc->vd);
> 
>> +
>> +       spin_unlock_irqrestore(&tdc->lock, flags);
>> +
>> +       return IRQ_HANDLED;
>> +}
>> +
>> +static void tegra_adma_issue_pending(struct dma_chan *dc)
>> +{
>> +       struct tegra_adma_chan *tdc = to_tegra_adma_chan(dc);
>> +       unsigned long flags;
>> +
>> +       spin_lock_irqsave(&tdc->lock, flags);
>> +
>> +       if (vchan_issue_pending(&tdc->vc)) {
>> +               if (tdc->desc)
>> +                       dev_warn(tdc2dev(tdc), "DMA already running\n");
> 
> The message makes not much sense here. User can call this as many
> times as they want to.

Ok, will remove.

>> +               else
>> +                       tegra_adma_start(tdc);
>> +       }
>> +
>> +       spin_unlock_irqrestore(&tdc->lock, flags);
>> +}
>> +
>> +static int tegra_adma_terminate_all(struct dma_chan *dc)
>> +{
>> +       struct tegra_adma_chan *tdc = to_tegra_adma_chan(dc);
>> +       unsigned long flags;
>> +       LIST_HEAD(head);
>> +
>> +       spin_lock_irqsave(&tdc->lock, flags);
>> +
>> +       if (tdc->desc)
>> +               tegra_adma_stop(tdc);
>> +
>> +       tegra_adma_request_free(tdc);
>> +       vchan_get_all_descriptors(&tdc->vc, &head);
>> +       spin_unlock_irqrestore(&tdc->lock, flags);
>> +       vchan_dma_desc_free_list(&tdc->vc, &head);
>> +
>> +       return 0;
>> +}
>> +
>> +static enum dma_status tegra_adma_tx_status(struct dma_chan *dc,
>> +                                           dma_cookie_t cookie,
>> +                                           struct dma_tx_state *txstate)
>> +{
>> +       struct tegra_adma_chan *tdc = to_tegra_adma_chan(dc);
>> +       struct tegra_adma_desc *desc;
>> +       struct virt_dma_desc *vd;
>> +       enum dma_status ret;
>> +       unsigned long flags;
>> +       unsigned int residual;
>> +
>> +       spin_lock_irqsave(&tdc->lock, flags);
>> +
>> +       ret = dma_cookie_status(dc, cookie, txstate);
> 
> No need to run this under spin lock.

Ok.

>> +       if (ret == DMA_COMPLETE || !txstate) {
>> +               spin_unlock_irqrestore(&tdc->lock, flags);
>> +               return ret;
>> +       }
>> +
>> +       vd = vchan_find_desc(&tdc->vc, cookie);
>> +       if (vd) {
>> +               desc = to_tegra_adma_desc(&vd->tx);
>> +               residual = desc->ch_regs.tc;
>> +       } else if (tdc->desc && tdc->desc->vd.tx.cookie == cookie) {
>> +               tegra_adma_update_position(tdc);
>> +               residual = tegra_adma_get_residue(tdc->desc);
>> +       } else {
>> +               residual = 0;
>> +       }
>> +
>> +       dma_set_residue(txstate, residual);
> 
> This could be out of spin lock. We are protecting data, not the code.

Ok.

>> +
>> +       spin_unlock_irqrestore(&tdc->lock, flags);
>> +
>> +       return ret;
>> +}
>> +
>> +static int tegra_adma_set_xfer_params(struct tegra_adma_chan *tdc,
>> +                                     struct tegra_adma_desc *desc,
>> +                                     dma_addr_t buf_addr, size_t buf_len,
>> +                                     size_t period_len,
>> +                                     enum dma_transfer_direction direction)
>> +{
>> +       struct tegra_adma_chan_regs *ch_regs = &desc->ch_regs;
>> +       unsigned int burst_size, num_bufs, sreq_dir;
>> +
>> +       num_bufs = buf_len / period_len;
>> +
>> +       if (num_bufs > ADMA_CH_CONFIG_MAX_BUFS)
>> +               return -EINVAL;
>> +
>> +       switch (direction) {
>> +       case DMA_MEM_TO_DEV:
>> +               sreq_dir = ADMA_CH_CTRL_DIR_MEM2AHUB;
>> +               burst_size = fls(tdc->sconfig.dst_maxburst);
>> +               ch_regs->config = ADMA_CH_CONFIG_SRC_BUF(num_bufs - 1);
>> +               ch_regs->ctrl = ADMA_CH_CTRL_TX_REQ(tdc->sreq_index);
>> +               ch_regs->src_addr = buf_addr;
>> +               break;
>> +
>> +       case DMA_DEV_TO_MEM:
>> +               sreq_dir = ADMA_CH_CTRL_DIR_AHUB2MEM;
>> +               burst_size = fls(tdc->sconfig.src_maxburst);
>> +               ch_regs->config = ADMA_CH_CONFIG_TRG_BUF(num_bufs - 1);
>> +               ch_regs->ctrl = ADMA_CH_CTRL_RX_REQ(tdc->sreq_index);
>> +               ch_regs->trg_addr = buf_addr;
>> +               break;
>> +
>> +       default:
>> +               dev_err(tdc2dev(tdc), "DMA direction is not supported\n");
>> +               return -EINVAL;
> 
> Call to is_slave_direction() before switch-case might look better.

I prefer the above.

>> +       }
>> +
>> +       if (!burst_size || burst_size > ADMA_CH_CONFIG_BURST_16)
>> +               burst_size = ADMA_CH_CONFIG_BURST_16;
>> +
>> +       ch_regs->ctrl |= ADMA_CH_CTRL_DIR(sreq_dir) |
>> +                        ADMA_CH_CTRL_MODE_CONTINUOUS |
>> +                        ADMA_CH_CTRL_FLOWCTRL_EN;
>> +       ch_regs->config |= ADMA_CH_CONFIG_BURST_SIZE(burst_size);
>> +       ch_regs->config |= ADMA_CH_CONFIG_WEIGHT_FOR_WRR(1);
>> +       ch_regs->fifo_ctrl = ADMA_CH_FIFO_CTRL_DEFAULT;
>> +       ch_regs->tc = period_len & ADMA_CH_TC_COUNT_MASK;
>> +
>> +       return tegra_adma_request_alloc(tdc, sreq_dir);
>> +}
>> +
>> +static struct dma_async_tx_descriptor *tegra_adma_prep_slave_sg(
>> +       struct dma_chan *dc, struct scatterlist *sgl, unsigned int sg_len,
>> +       enum dma_transfer_direction direction, unsigned long flags,
>> +       void *context)
>> +{
>> +       struct tegra_adma_chan *tdc = to_tegra_adma_chan(dc);
>> +
>> +       dev_warn(tdc2dev(tdc), "scatter-gather transfers are not supported\n");
> 
> Any plans to do that? If no, just remove the entire function.

No not at the moment. I thought about that but then I am wondering if we
need to add a check in the include/linux/dmaengine.h that the
prep_slave_sg() is populated?

>> +
>> +       return NULL;
>> +}
>> +
>> +static struct dma_async_tx_descriptor *tegra_adma_prep_dma_cyclic(
>> +       struct dma_chan *dc, dma_addr_t buf_addr, size_t buf_len,
>> +       size_t period_len, enum dma_transfer_direction direction,
>> +       unsigned long flags)
>> +{
>> +       struct tegra_adma_chan *tdc = to_tegra_adma_chan(dc);
>> +       struct tegra_adma_desc *desc = NULL;
>> +
>> +       if (!tdc->sconfig_valid) {
> 
> Looks like excessive check. If user didn't call slave_config(), it's a
> problem of user and it should be fixed. Protective programming here
> seems not needed.

Ok, will remove.

>> +               dev_err(tdc2dev(tdc), "ADMA slave configuration not set\n");
>> +               return NULL;
>> +       }
>> +
>> +       if (!buf_len || !period_len || period_len > ADMA_CH_TC_COUNT_MASK) {
>> +               dev_err(tdc2dev(tdc), "invalid buffer/period len\n");
>> +               return NULL;
>> +       }
>> +
>> +       if (buf_len % period_len) {
>> +               dev_err(tdc2dev(tdc), "buf_len not a multiple of period_len\n");
>> +               return NULL;
>> +       }
>> +
>> +       if (!IS_ALIGNED(buf_addr, 4)) {
>> +               dev_err(tdc2dev(tdc), "invalid buffer alignment\n");
>> +               return NULL;
>> +       }
>> +
>> +       desc = kzalloc(sizeof(*desc), GFP_NOWAIT);
>> +       if (!desc)
>> +               return NULL;
>> +
>> +       desc->bytes_transferred = 0;
>> +       desc->bytes_requested = buf_len;
>> +
>> +       if (tegra_adma_set_xfer_params(tdc, desc, buf_addr, buf_len, period_len,
>> +                                      direction)) {
>> +               kfree(desc);
>> +               return NULL;
>> +       }
>> +
>> +       return vchan_tx_prep(&tdc->vc, &desc->vd, flags);
>> +}
>> +
>> +static int tegra_adma_alloc_chan_resources(struct dma_chan *dc)
>> +{
>> +       struct tegra_adma_chan *tdc = to_tegra_adma_chan(dc);
>> +       int ret;
>> +
>> +       ret = pm_runtime_get_sync(tdc2dev(tdc));
>> +       if (ret)
>> +               return ret;
>> +
>> +       dma_cookie_init(&tdc->vc.chan);
>> +       tdc->sconfig_valid = false;
>> +
>> +       return 0;
>> +}
>> +
>> +static void tegra_adma_free_chan_resources(struct dma_chan *dc)
>> +{
>> +       struct tegra_adma_chan *tdc = to_tegra_adma_chan(dc);
>> +
>> +       if (tdc->desc)
>> +               tegra_adma_terminate_all(dc);
> 
> Seems after Lars' patchset be merged this will become redundant.
> And you may call this unconditionally of course.

Ok.

>> +
>> +       tdc->sconfig_valid = false;
>> +       vchan_free_chan_resources(&tdc->vc);
>> +
>> +       pm_runtime_put(tdc2dev(tdc));
> 
> pm_runtime_get_sync() in alloc() till pm_runtime_put() in free() seems
> too much to cover in time. Imagine if user allocates resources, but
> will never use them. How possible to suspend device?

In the current use-case (for audio) the dma channel is allocated and
freed everytime audio is started and stopped. However, if audio is
active at the time of suspend then yes it would block. May be I can move
this to the start/stop of the ADMA.

>> +
>> +       tegra_adma_request_free(tdc);
>> +
>> +       tdc->sreq_index = 0;
>> +       tdc->sreq_dir = 0;
>> +}
>> +
>> +static struct dma_chan *tegra_dma_of_xlate(struct of_phandle_args *dma_spec,
>> +                                          struct of_dma *ofdma)
>> +{
>> +       struct tegra_adma *tdma = ofdma->of_dma_data;
>> +       struct tegra_adma_chan *tdc;
>> +       struct dma_chan *chan;
>> +       unsigned int sreq_index;
>> +
>> +       if (dma_spec->args_count != 1)
>> +               return NULL;
> 
> Shouldn't be already checked by of-dma library?

Right so the of-dma library checks for #dma-cells which should be 1 and
this is another test to ensure that the #dma-cells is actually 1. So
this may be redundant.

>> +
>> +       sreq_index = dma_spec->args[0];
>> +
>> +       if (sreq_index == 0) {
>> +               dev_err(tdma->dev, "DMA request must not be 0\n");
> 
> Why not? HW limitation?

Yes, the requests start at 1.

>> +               return NULL;
>> +       }
>> +
>> +       chan = dma_get_any_slave_channel(&tdma->dma_dev);
>> +       if (!chan)
>> +               return NULL;
>> +
>> +       tdc = to_tegra_adma_chan(chan);
>> +       tdc->sreq_index = sreq_index;
>> +
>> +       return chan;
>> +}
>> +
>> +static int tegra_adma_runtime_suspend(struct device *dev)
>> +{
>> +       struct tegra_adma *tdma = dev_get_drvdata(dev);
>> +
>> +       tdma->global_cmd = tdma_read(tdma, ADMA_GLOBAL_CMD);
>> +
>> +       clk_disable_unprepare(tdma->adma_clk);
>> +
>> +       return 0;
>> +}
>> +
>> +static int tegra_adma_runtime_resume(struct device *dev)
>> +{
>> +       struct tegra_adma *tdma = dev_get_drvdata(dev);
>> +       int ret;
>> +
>> +       ret = clk_prepare_enable(tdma->adma_clk);
>> +       if (ret < 0) {
>> +               dev_err(dev, "failed to enable ADMA clock: %d\n", ret);
>> +               return ret;
>> +       }
>> +
>> +       tdma_write(tdma, ADMA_GLOBAL_CMD, tdma->global_cmd);
>> +
>> +       return 0;
>> +}
>> +
>> +static const struct tegra_adma_chip_data tegra210_chip_data = {
>> +       .nr_channels = 22,
>> +};
>> +
>> +static const struct of_device_id tegra_adma_of_match[] = {
>> +       { .compatible = "nvidia,tegra210-adma", .data = &tegra210_chip_data },
>> +       { },
>> +};
>> +MODULE_DEVICE_TABLE(of, tegra_adma_of_match);
>> +
>> +static int tegra_adma_probe(struct platform_device *pdev)
>> +{
>> +       const struct of_device_id *match;
>> +       const struct tegra_adma_chip_data *cdata;
>> +       struct tegra_adma *tdma;
>> +       struct resource *res;
>> +       int ret, i;
>> +
>> +       if (!pdev->dev.of_node) {
>> +               dev_err(&pdev->dev, "no device tree node for ADMA\n");
>> +               return -ENODEV;
>> +       }
> 
> Do you need this check since you later call of_match_device() ?

No, I will drop this.

>> +
>> +       match = of_match_device(tegra_adma_of_match, &pdev->dev);
>> +       if (!match) {
>> +               dev_err(&pdev->dev, "no device match found\n");
>> +               return -ENODEV;
>> +       }
>> +       cdata = match->data;
>> +
>> +       tdma = devm_kzalloc(&pdev->dev, sizeof(*tdma) + cdata->nr_channels *
>> +                           sizeof(struct tegra_adma_chan), GFP_KERNEL);
>> +       if (!tdma)
>> +               return -ENOMEM;
>> +
>> +       tdma->dev = &pdev->dev;
>> +       tdma->nr_channels = cdata->nr_channels;
>> +       platform_set_drvdata(pdev, tdma);
>> +
>> +       res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
>> +       tdma->base_addr = devm_ioremap_resource(&pdev->dev, res);
>> +       if (IS_ERR(tdma->base_addr))
>> +               return PTR_ERR(tdma->base_addr);
>> +
>> +       tdma->adma_clk = devm_clk_get(&pdev->dev, "adma_ape");
>> +       if (IS_ERR(tdma->adma_clk)) {
>> +               dev_err(&pdev->dev, "ADMA clock not found\n");
>> +               return PTR_ERR(tdma->adma_clk);
>> +       }
>> +
>> +       pm_runtime_enable(&pdev->dev);
>> +       if (pm_runtime_enabled(&pdev->dev))
> 
>> +               ret = pm_runtime_get_sync(&pdev->dev);
>> +       else
>> +               ret = tegra_adma_runtime_resume(&pdev->dev);
>> +
>> +       if (ret) {
>> +               pm_runtime_disable(&pdev->dev);
>> +               return ret;
>> +       }
>> +
>> +       ret = tegra_adma_init(tdma);
>> +       if (ret)
>> +               goto err_pm_disable;
>> +
>> +       INIT_LIST_HEAD(&tdma->dma_dev.channels);
>> +       for (i = 0; i < tdma->nr_channels; i++) {
>> +               struct tegra_adma_chan *tdc = &tdma->channels[i];
>> +
>> +               tdc->chan_addr = tdma->base_addr + ADMA_CH_REG_OFFSET(i);
>> +
>> +               snprintf(tdc->name, sizeof(tdc->name), "adma.%d", i);
>> +
>> +               tdc->irq = platform_get_irq(pdev, i);
>> +               if (tdc->irq < 0) {
> 
>> +                       ret = -EPROBE_DEFER;
> 
> So, any failure of getting an IRQ resource will be considered as
> deferral? I doubt it's a good idea.

Yes. Why not? What if the interrupt controller has not been probed yet?

>> +                       goto err_irq;
>> +               }
>> +
>> +               ret = devm_request_irq(&pdev->dev, tdc->irq, tegra_adma_isr, 0,
>> +                                      tdc->name, tdc);
> 
> Better to use request_irq(). There is no benefit of devm_ variant in
> few cases (not only DMA Engine drivers).

Yes I am changing that.

>> +               if (ret) {
>> +                       dev_err(&pdev->dev,
>> +                               "failed to get interrupt for channel %d\n", i);
> 
> 
>> +                       goto err_irq;
>> +               }
>> +
>> +               spin_lock_init(&tdc->lock);
>> +               vchan_init(&tdc->vc, &tdma->dma_dev);
>> +               tdc->vc.desc_free = tegra_adma_desc_free;
>> +               tdc->tdma = tdma;
>> +       }
>> +
>> +       dma_cap_set(DMA_SLAVE, tdma->dma_dev.cap_mask);
>> +       dma_cap_set(DMA_PRIVATE, tdma->dma_dev.cap_mask);
>> +       dma_cap_set(DMA_CYCLIC, tdma->dma_dev.cap_mask);
>> +
>> +       tdma->dma_dev.dev = &pdev->dev;
>> +       tdma->dma_dev.device_alloc_chan_resources =
>> +                                       tegra_adma_alloc_chan_resources;
>> +       tdma->dma_dev.device_free_chan_resources =
>> +                                       tegra_adma_free_chan_resources;
>> +       tdma->dma_dev.device_issue_pending = tegra_adma_issue_pending;
>> +       tdma->dma_dev.device_prep_slave_sg = tegra_adma_prep_slave_sg;
>> +       tdma->dma_dev.device_prep_dma_cyclic = tegra_adma_prep_dma_cyclic;
>> +       tdma->dma_dev.device_config = tegra_adma_slave_config;
>> +       tdma->dma_dev.device_tx_status = tegra_adma_tx_status;
>> +       tdma->dma_dev.device_terminate_all = tegra_adma_terminate_all;
>> +       tdma->dma_dev.src_addr_widths = BIT(DMA_SLAVE_BUSWIDTH_4_BYTES);
>> +       tdma->dma_dev.dst_addr_widths = BIT(DMA_SLAVE_BUSWIDTH_4_BYTES);
>> +
>> +       ret = dma_async_device_register(&tdma->dma_dev);
>> +       if (ret < 0) {
>> +               dev_err(&pdev->dev, "ADMA registration failed: %d\n", ret);
>> +               goto err_irq;
>> +       }
>> +
>> +       ret = of_dma_controller_register(pdev->dev.of_node,
>> +                                        tegra_dma_of_xlate, tdma);
>> +       if (ret < 0) {
>> +               dev_err(&pdev->dev, "ADMA OF registration failed %d\n", ret);
>> +               goto err_unregister_dma_dev;
>> +       }
>> +
>> +       pm_runtime_put(&pdev->dev);
> 
> It might be called earlier, mightn't it?

It should not be.

>> +
>> +       dev_info(&pdev->dev, "Tegra210 ADMA driver registered %d channels\n",
>> +                tdma->nr_channels);
>> +
>> +       return 0;
>> +
>> +err_unregister_dma_dev:
>> +       dma_async_device_unregister(&tdma->dma_dev);
>> +err_irq:
>> +       while (--i >= 0) {
>> +               struct tegra_adma_chan *tdc = &tdma->channels[i];
>> +
>> +               tasklet_kill(&tdc->vc.task);
>> +       }
>> +err_pm_disable:
>> +       pm_runtime_disable(&pdev->dev);
>> +       if (!pm_runtime_status_suspended(&pdev->dev))
>> +               tegra_adma_runtime_suspend(&pdev->dev);
>> +
>> +       return ret;
>> +}
>> +
>> +static int tegra_adma_remove(struct platform_device *pdev)
>> +{
>> +       struct tegra_adma *tdma = platform_get_drvdata(pdev);
>> +       struct tegra_adma_chan *tdc;
>> +       int i;
>> +
>> +       dma_async_device_unregister(&tdma->dma_dev);
>> +
>> +       for (i = 0; i < tdma->nr_channels; ++i) {
>> +               tdc = &tdma->channels[i];
>> +               disable_irq(tdc->irq);
>> +               tasklet_kill(&tdc->vc.task);
>> +       }
>> +
>> +       pm_runtime_disable(&pdev->dev);
>> +       if (!pm_runtime_status_suspended(&pdev->dev))
>> +               tegra_adma_runtime_suspend(&pdev->dev);
>> +
>> +       return 0;
>> +}
>> +
>> +#ifdef CONFIG_PM_SLEEP
>> +static int tegra_adma_pm_suspend(struct device *dev)
>> +{
>> +       return pm_runtime_suspended(dev);
>> +}
>> +#endif
>> +
>> +static const struct dev_pm_ops tegra_adma_dev_pm_ops = {
>> +       SET_RUNTIME_PM_OPS(tegra_adma_runtime_suspend,
>> +                          tegra_adma_runtime_resume, NULL)
>> +       SET_SYSTEM_SLEEP_PM_OPS(tegra_adma_pm_suspend, NULL)
> 
> The runtime PM calls and system suspend ones are more or less
> equivalent on LATE stage. Also, it's usually a problem with DMA that
> you may try to suspend active device used by others.

I am not sure I follow your point here.

Thanks for the feedback.

Cheers
Jon
