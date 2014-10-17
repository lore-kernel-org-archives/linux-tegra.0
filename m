From: Dan Carpenter <dan.carpenter-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>
Subject: re: drm/tegra: Add hardware cursor support
Date: Fri, 17 Oct 2014 14:31:23 +0300
Message-ID: <20141017113123.GA24962@mwanda>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Hello Thierry Reding,

The patch e687651bc1ed: "drm/tegra: Add hardware cursor support" from
Dec 20, 2013, leads to the following static checker warning:

	drivers/gpu/drm/tegra/dc.c:597 tegra_dc_cursor_set2()
	warn: mask and shift to zero

drivers/gpu/drm/tegra/dc.c
   594          if (bo) {
   595                  unsigned long addr = (bo->paddr & 0xfffffc00) >> 10;
   596  #ifdef CONFIG_ARCH_DMA_ADDR_T_64BIT
   597                  unsigned long high = (bo->paddr & 0xfffffffc) >> 32;
                                             ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
I'm not sure what the correct mask is.

   598  #endif
   599  

regards,
dan carpenter
