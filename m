From: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH] dmaengine: Fix dma_get_any_slave_channel() handling of private channels
Date: Mon, 27 Apr 2015 13:23:24 +0100
Message-ID: <1430137404-30236-1-git-send-email-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Cc: Dan Williams <dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

The function dma_get_any_slave_channel() allocates private DMA channels
by calling the internal private_candidate() function. However, when
doing so, if a channel is successfully allocated, neither the
DMA_PRIVATE flag is set or the privatecnt variable is incremented for
the DMA controller. This will cause the following problems ...

1. A DMA controller initialised with the DMA_PRIVATE flag set (ie.
   channels should always be private) will become public incorrectly
   when a channel is allocated and then released. This is
   because:
   - A DMA controller initialised with DMA_PRIVATE set will have
     a initial privatecnt of 1.
   - The privatecnt is not incremented by dma_get_any_slave_channel().
   - When the channel is released via dma_release_channel(), the
     privatecnt is decremented and the DMA_PRIVATE flag is cleared
     because the privatecnt value is 0.
2. For a DMA controller initialised with the DMA_PRIVATE flag set, if
   more than one DMA channel is allocated successfully via
   dma_get_any_slave_channel() and then one channel is released, the
   following issues can occur:
   i).  All channels currently allocated will appear as public because
        the DMA_PRIVATE will be cleared (as described in #1).
   ii). Subsequent calls to dma_get_any_slave_channel() will fail even
        if there are channels available. The reason this fails is that
        the private_candidate() function (called by
        dma_get_any_slave_channel()) will detect the DMA controller is
        not private but has active channels and so cannot allocate any
        private channels (see below code snippet).

	/* devices with multiple channels need special handling as we need to
	 * ensure that all channels are either private or public.
	 */
	if (dev->chancnt > 1 && !dma_has_cap(DMA_PRIVATE, dev->cap_mask))
 		list_for_each_entry(chan, &dev->channels, device_node) {
			/* some channels are already publicly allocated */
			if (chan->client_count)
				return NULL;
		}

3. For a DMA controller initialised with the DMA_PRIVATE flag unset,
   if a private channel is allocated via dma_get_any_slave_channel(),
   then the DMA controller will still appear as public because the
   DMA_PRIVATE flag is not set and this will cause:
   i).  The allocated channel to appear as public
   ii). Prevent any further private channels being allocated via
        dma_get_any_slave_channel() (because private_candidate() will
        fail in the same way as described in 2.ii above).

Fix this by incrementing the privatecnt in dma_get_any_slave_channel().
If dma_get_any_slave_channel() allocates a channel also ensure the
DMA_PRIVATE flag is set, in case it was not before. If the privatecnt
becomes 0 then the DMA_PRIVATE flag should be cleared.

Cc: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Signed-off-by: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
This issue was found when attempting to open and close a serial
interface, that uses DMA, multiple times on a tegra device. When
opening the serial device a 2nd time after closing, the DMA channel
allocation would fail.

 drivers/dma/dmaengine.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/dma/dmaengine.c b/drivers/dma/dmaengine.c
index 0e035a8cf401..03b0e22b4a68 100644
--- a/drivers/dma/dmaengine.c
+++ b/drivers/dma/dmaengine.c
@@ -571,11 +571,16 @@ struct dma_chan *dma_get_any_slave_channel(struct dma_device *device)
 
 	chan = private_candidate(&mask, device, NULL, NULL);
 	if (chan) {
+		dma_cap_set(DMA_PRIVATE, device->cap_mask);
+		device->privatecnt++;
 		err = dma_chan_get(chan);
 		if (err) {
 			pr_debug("%s: failed to get %s: (%d)\n",
 				__func__, dma_chan_name(chan), err);
 			chan = NULL;
+
+			if (--device->privatecnt == 0)
+				dma_cap_clear(DMA_PRIVATE, device->cap_mask);
 		}
 	}
 
-- 
2.3.6
