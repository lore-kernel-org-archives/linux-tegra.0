From: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>
Subject: [PATCH 0/9] usb: fix PHY error handling
Date: Fri, 15 Mar 2013 11:12:01 +0200
Message-ID: <1363338730-14581-1-git-send-email-balbi@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Linux USB Mailing List <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Cc: Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, Greg KH <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Hi Folks,

this patch set depends on [1] which makes PHY layer
*always* return an error as suggested by Alan Stern.

I have compiled what I could, please go over the
patches and give your Acked-by or NAK it if you think
there's something wrong with any of the patches.

cheers

[1] http://marc.info/?l=linux-usb&m=136327710513124

Felipe Balbi (9):
  usb: dwc3: fix PHY error handling
  usb: gadget: mv_udc_core: fix PHY error handling
  usb: gadget: s3c-hsotg: fix PHY error handling
  usb: musb: omap2430: fix PHY error handling
  usb: host: ehci-msm: fix PHY error handling
  usb: host: ehci-mv: fix PHY error handling
  usb: host: ehci-s5p: fix PHY error handling
  usb: host: ehci-tegra: fix PHY error handling
  usb: host: ohci-exynos: fix PHY error handling

 drivers/usb/dwc3/core.c          | 24 ++++++++++++++++++++++--
 drivers/usb/gadget/mv_udc_core.c | 11 +++++++----
 drivers/usb/gadget/s3c-hsotg.c   |  2 +-
 drivers/usb/host/ehci-msm.c      |  2 +-
 drivers/usb/host/ehci-mv.c       | 19 +++++++++----------
 drivers/usb/host/ehci-s5p.c      |  2 +-
 drivers/usb/host/ehci-tegra.c    | 12 +++---------
 drivers/usb/host/ohci-exynos.c   |  2 +-
 drivers/usb/musb/omap2430.c      |  7 ++++++-
 9 files changed, 51 insertions(+), 30 deletions(-)

-- 
1.8.2
