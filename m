From: Russell King - ARM Linux admin <linux@armlinux.org.uk>
Subject: Re: Unstable Kernel behavior on an ARM based board
Date: Tue, 5 Mar 2019 14:23:51 +0000
Message-ID: <20190305142351.ktciqkj5kycdwilr@shell.armlinux.org.uk>
References: <CA+_ZnZTCtghS+oUdXGW+h6SVD6nMPfsyDAvOwEugrhx6NJ3yFg@mail.gmail.com>
 <20190304142546.GB24676@ulmo>
 <CA+_ZnZQRV_7ytmbQZvWZUuyYiai0+Yo-pqV19RKebWAwSQokxQ@mail.gmail.com>
 <20190305100731.uz6tleu3fkaruwb6@shell.armlinux.org.uk>
 <CA+_ZnZTeZLyCcjZduQODzjWxTpU96AefzvTBDFbq2CSjVQxONg@mail.gmail.com>
 <20190305112226.rhbl3dwopmip45ja@shell.armlinux.org.uk>
 <20190305115730.GE26369@ulmo>
 <CA+_ZnZQ1m8QyiMJWwmVvtdqiFRDYK8PocGpG38W0NyEZ3yA8zQ@mail.gmail.com>
 <20190305132350.pzfmz4yvh6ujgotn@shell.armlinux.org.uk>
 <CA+_ZnZS7wimpnH+TnvM_ztnX3wbADpf5FUBd_8igqeg+FnFr5g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <CA+_ZnZS7wimpnH+TnvM_ztnX3wbADpf5FUBd_8igqeg+FnFr5g@mail.gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Embedded Engineer <embed786@gmail.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Vladimir Murzin <vladimir.murzin@arm.com>, Jon Hunter <jonathanh@nvidia.com>, Thierry Reding <thierry.reding@gmail.com>, linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: linux-tegra@vger.kernel.org

On Tue, Mar 05, 2019 at 06:32:19PM +0500, Embedded Engineer wrote:
> On Tue, Mar 5, 2019 at 6:23 PM Russell King - ARM Linux admin
> <linux@armlinux.org.uk> wrote:
> >
> > Is there no later u-boot you can use to rule that out?
> 
> This u-boot was working just fine with our board so didn't try
> updating it to some newer version. Also the downstream u-boot has
> different text base addresses than mainline ones I guess so didn't put
> any effort in that.

As it is also suffering from the "hanging" issue, it seems that the
problem is not specific to the kernel.

It leaves only a few possible causes:

1. The board firmware (including u-boot) is enabling some DMA that is
   causing corruption of some RAM.

2. You really do have an issue between the CPU and RAM causing
   random-ish data corruption.

It may be worth getting mm/dmapool.c to print the hexdump a number of
times to see whether the data read from the corrupted region changes.
Around line 372, there is a call to print_hex_dump().  Just replicate
that a number of times.

Another idea would be to print a hexdump of each object as it's
allocated and the next object.

Maybe something like this (untested, may need tweaks to get it to build,
you'll also need to revert Thierry's patch):

diff --git a/mm/dmapool.c b/mm/dmapool.c
index 6d4b97e7e9e9..3db1e9b63809 100644
--- a/mm/dmapool.c
+++ b/mm/dmapool.c
@@ -219,6 +219,47 @@ static void pool_initialise_page(struct dma_pool *pool, struct dma_page *page)
 	} while (offset < pool->allocation);
 }
 
+#ifdef	DMAPOOL_DEBUG
+static int verify_one(struct dma_pool *pool, struct dma_page *page,
+		      unsigned int offset, const char *desc)
+{
+	dma_addr_t handle = page->dma + offset;
+	u8 *data = page->vaddr + offset;
+	int i;
+
+	for (i = sizeof(page->offset); i < pool->size; i++) {
+		if (data[i] == POOL_POISON_FREED)
+			continue;
+		if (pool->dev)
+			dev_err(pool->dev,
+				"%s %s, %pad (corrupted)\n",
+				desc, pool->name, &handle);
+		else
+			pr_err("%s %s, %pad (corrupted)\n",
+				desc, pool->name, &handle);
+
+		/*
+		 * Dump the first 4 bytes even if they are not
+		 * POOL_POISON_FREED
+		 */
+		print_hex_dump(KERN_ERR, "", DUMP_PREFIX_OFFSET, 16, 1,
+				data, pool->size, 1);
+		return 1;
+	}
+	return 0;
+}
+
+static void verify_free(struct dma_pool *pool, struct dma_page *page, const char *desc)
+{
+	unsigned int offset;
+
+	for (offset = page->offset; offset < page->allocation;
+	     offset = *(int *)(page->vaddr + offset))
+		if (verify_one(pool, page, offset, desc))
+			break;
+}
+#endif
+
 static struct dma_page *pool_alloc_page(struct dma_pool *pool, gfp_t mem_flags)
 {
 	struct dma_page *page;
@@ -235,6 +276,9 @@ static struct dma_page *pool_alloc_page(struct dma_pool *pool, gfp_t mem_flags)
 		pool_initialise_page(pool, page);
 		page->in_use = 0;
 		page->offset = 0;
+#ifdef	DMAPOOL_DEBUG
+		verify_free(pool, page, "pool_alloc_page");
+#endif
 	} else {
 		kfree(page);
 		page = NULL;
@@ -345,35 +389,17 @@ void *dma_pool_alloc(struct dma_pool *pool, gfp_t mem_flags,
 	list_add(&page->page_list, &pool->page_list);
  ready:
 	page->in_use++;
+#ifdef	DMAPOOL_DEBUG
+	verify_free(pool, page, "dma_pool_alloc pre");
+#endif
 	offset = page->offset;
 	page->offset = *(int *)(page->vaddr + offset);
 	retval = offset + page->vaddr;
 	*handle = offset + page->dma;
 #ifdef	DMAPOOL_DEBUG
-	{
-		int i;
-		u8 *data = retval;
-		/* page->offset is stored in first 4 bytes */
-		for (i = sizeof(page->offset); i < pool->size; i++) {
-			if (data[i] == POOL_POISON_FREED)
-				continue;
-			if (pool->dev)
-				dev_err(pool->dev,
-					"dma_pool_alloc %s, %p (corrupted)\n",
-					pool->name, retval);
-			else
-				pr_err("dma_pool_alloc %s, %p (corrupted)\n",
-					pool->name, retval);
-
-			/*
-			 * Dump the first 4 bytes even if they are not
-			 * POOL_POISON_FREED
-			 */
-			print_hex_dump(KERN_ERR, "", DUMP_PREFIX_OFFSET, 16, 1,
-					data, pool->size, 1);
-			break;
-		}
-	}
+	verify_one(pool, page, offset, "dma_pool_alloc");
+	if (page->offset < pool->allocation)
+		verify_one(pool, page, page->offset, "dma_pool_alloc next");
 	if (!(mem_flags & __GFP_ZERO))
 		memset(retval, POOL_POISON_ALLOCATED, pool->size);
 #endif

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTC broadband for 0.8mile line in suburbia: sync at 12.1Mbps down 622kbps up
According to speedtest.net: 11.9Mbps down 500kbps up
