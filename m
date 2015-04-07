From: Johan Hovold <johan-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: [PATCH 0/2] USB: fix lockup on disconnect
Date: Tue,  7 Apr 2015 11:46:50 +0200
Message-ID: <1428400012-7563-1-git-send-email-johan@kernel.org>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>, Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>
Cc: linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Johan Hovold <johan-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

These patches fix an issue I ran into into where the Beaglebone Black
would lock up on disconnect.

Turns out this was related to the transfer_buffers not being properly
aligned, causing musb to use temporary buffers for the transfers. On
transfer errors (e.g. during disconnect), the full buffer content was
still being copied, something which could lead starvation of the hub
work queue when using large-enough buffers.

Included is also a fix for the same issue for ehci-tegra that has been
compile tested only.

Note that the octeon-hcd driver in staging, which also uses temporary
buffers for unaligned transfers, appears to already get this right.

Johan


Johan Hovold (2):
  USB: musb: fix inefficient copy of unaligned buffers
  USB: ehci-tegra: fix inefficient copy of unaligned buffers

 drivers/usb/host/ehci-tegra.c | 2 +-
 drivers/usb/musb/musb_host.c  | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

-- 
2.0.5
