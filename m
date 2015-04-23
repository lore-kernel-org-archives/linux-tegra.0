From: Johan Hovold <johan-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: [PATCH v2 0/3] USB: fix inefficient copy of unaligned buffers
Date: Thu, 23 Apr 2015 16:06:49 +0200
Message-ID: <1429798012-21916-1-git-send-email-johan@kernel.org>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>, Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>
Cc: linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Johan Hovold <johan-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

These patches (for 4.1) make sure that only the received data is copied
from the temporary buffers used for unaligned transfers.

I discovered this when debugging an issue where the Beaglebone Black
would lock up on disconnect.

Turns out it was related to the transfer_buffers not being properly
aligned, causing musb to use temporary buffers for the transfers. On
transfer errors (e.g. during disconnect), the full buffer content was
still being copied, something which would alter timings enough to
prevent the disconnect from being detected and processed.

The first patch in the series works around the problem in that
particular set up, but obviously does not solve the underlying issue,
which needs to be analysed further.

I also included a corresponding patch for ehci-tegra that has been
compile tested only.

Note that the octeon-hcd driver in staging, which also uses temporary
buffers for unaligned transfers, was broken for isochronous transfers.
The third patch fixes that, but is also untested due to lack of
hardware.

Johan


v2:
 - Make sure to copy the full buffer for isochronous transfers, in which
   case the received data is not necessarily contiguous (thanks Alan).
 - Drop stable tags as this is really just an optimisation.


Johan Hovold (3):
  USB: musb: fix inefficient copy of unaligned buffers
  USB: ehci-tegra: fix inefficient copy of unaligned buffers
  staging: octeon-usb: fix unaligned isochronous transfers

 drivers/staging/octeon-usb/octeon-hcd.c | 12 +++++++++---
 drivers/usb/host/ehci-tegra.c           | 12 +++++++++---
 drivers/usb/musb/musb_host.c            |  9 +++++++--
 3 files changed, 25 insertions(+), 8 deletions(-)

-- 
2.0.5
