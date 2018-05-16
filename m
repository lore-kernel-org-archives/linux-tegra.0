From: Emil Goode <emil.fsw@goode.io>
Subject: [PATCH v2] gpu: host1x: Fix compiler errors by converting to
 dma_addr_t
Date: Wed, 16 May 2018 12:22:04 +0200
Message-ID: <20180516102204.stviarlxgrz3k2nh@lianli>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Thierry Reding <treding@nvidia.com>, dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

The compiler is complaining with the following errors:

drivers/gpu/host1x/cdma.c:94:48: error:
	passing argument 3 of ‘dma_alloc_wc’ from incompatible pointer type
	[-Werror=incompatible-pointer-types]

drivers/gpu/host1x/cdma.c:113:48: error:
	passing argument 3 of ‘dma_alloc_wc’ from incompatible pointer type
	[-Werror=incompatible-pointer-types]

The expected pointer type of the third argument to dma_alloc_wc() is
dma_addr_t but phys_addr_t is passed.

Change the phys member of struct push_buffer to be dma_addr_t so that we
pass the correct type to dma_alloc_wc().
Also check pb->mapped for non-NULL in the destroy function as that is the
right way of checking if dma_alloc_wc() was successful.

Signed-off-by: Emil Goode <emil.fsw@goode.io>
---
v2: - Change the phys member type instead of adding casts.
    - Check pb->mapped in the destroy function as 0 is a valid value
      for dma_addr_t.

 drivers/gpu/host1x/cdma.c | 2 +-
 drivers/gpu/host1x/cdma.h | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/host1x/cdma.c b/drivers/gpu/host1x/cdma.c
index 28541b280739..02a0b61be18f 100644
--- a/drivers/gpu/host1x/cdma.c
+++ b/drivers/gpu/host1x/cdma.c
@@ -51,7 +51,7 @@ static void host1x_pushbuffer_destroy(struct push_buffer *pb)
 	struct host1x_cdma *cdma = pb_to_cdma(pb);
 	struct host1x *host1x = cdma_to_host1x(cdma);
 
-	if (!pb->phys)
+	if (!pb->mapped)
 		return;
 
 	if (host1x->domain) {
diff --git a/drivers/gpu/host1x/cdma.h b/drivers/gpu/host1x/cdma.h
index 286d49386be9..446ee1a84969 100644
--- a/drivers/gpu/host1x/cdma.h
+++ b/drivers/gpu/host1x/cdma.h
@@ -44,7 +44,7 @@ struct host1x_job;
 struct push_buffer {
 	void *mapped;			/* mapped pushbuffer memory */
 	dma_addr_t dma;			/* device address of pushbuffer */
-	phys_addr_t phys;		/* physical address of pushbuffer */
+	dma_addr_t phys;		/* physical address of pushbuffer */
 	u32 fence;			/* index we've written */
 	u32 pos;			/* index to write to */
 	u32 size;
-- 
2.11.0
