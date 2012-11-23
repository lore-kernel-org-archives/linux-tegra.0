From: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: Re: [PATCH 1/6] video: tegra: Add nvhost driver
Date: Sat, 24 Nov 2012 00:38:55 +0100
Message-ID: <20121123233855.GD21555@avionic-0098.adnet.avionic-design.de>
References: <1353577684-7896-1-git-send-email-tbergstrom@nvidia.com>
 <1353577684-7896-2-git-send-email-tbergstrom@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="d01dLTUuW90fS44H"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1353577684-7896-2-git-send-email-tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Terje Bergstrom <tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Arto Merilainen <amerilainen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--d01dLTUuW90fS44H
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 22, 2012 at 11:47:59AM +0200, Terje Bergstrom wrote:
> Add nvhost, the driver for host1x and 2D, which is a client device
> for host1x.
>=20
> Change-Id: Id93a28491dc2d54049e0adce4ad287c5985b2bca
> Signed-off-by: Terje Bergstrom <tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> Signed-off-by: Arto Merilainen <amerilainen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>  drivers/video/Kconfig                              |    2 +
>  drivers/video/Makefile                             |    2 +
>  drivers/video/tegra/host/Kconfig                   |   20 +
>  drivers/video/tegra/host/Makefile                  |   21 +
>  drivers/video/tegra/host/bus_client.c              |  101 ++++
>  drivers/video/tegra/host/bus_client.h              |   32 ++
>  drivers/video/tegra/host/chip_support.c            |   68 +++
>  drivers/video/tegra/host/chip_support.h            |  179 +++++++
>  drivers/video/tegra/host/debug.c                   |  255 ++++++++++
>  drivers/video/tegra/host/debug.h                   |   50 ++
>  drivers/video/tegra/host/dev.c                     |  104 ++++
>  drivers/video/tegra/host/dev.h                     |   33 ++
>  drivers/video/tegra/host/dmabuf.c                  |  151 ++++++
>  drivers/video/tegra/host/dmabuf.h                  |   51 ++
>  drivers/video/tegra/host/host1x/Makefile           |    6 +
>  drivers/video/tegra/host/host1x/host1x.c           |  320 ++++++++++++
>  drivers/video/tegra/host/host1x/host1x.h           |   97 ++++
>  .../video/tegra/host/host1x/host1x01_hardware.h    |  157 ++++++
>  drivers/video/tegra/host/host1x/host1x_cdma.c      |  488 ++++++++++++++=
++++
>  drivers/video/tegra/host/host1x/host1x_cdma.h      |   39 ++
>  drivers/video/tegra/host/host1x/host1x_channel.c   |  157 ++++++
>  drivers/video/tegra/host/host1x/host1x_debug.c     |  405 +++++++++++++++
>  drivers/video/tegra/host/host1x/host1x_intr.c      |  263 ++++++++++
>  drivers/video/tegra/host/host1x/host1x_syncpt.c    |  170 +++++++
>  .../video/tegra/host/host1x/hw_host1x01_channel.h  |  182 +++++++
>  drivers/video/tegra/host/host1x/hw_host1x01_sync.h |  398 +++++++++++++++
>  .../video/tegra/host/host1x/hw_host1x01_uclass.h   |  474 ++++++++++++++=
+++
>  drivers/video/tegra/host/nvhost_acm.c              |  532 ++++++++++++++=
++++++
>  drivers/video/tegra/host/nvhost_acm.h              |   49 ++
>  drivers/video/tegra/host/nvhost_cdma.c             |  473 ++++++++++++++=
+++
>  drivers/video/tegra/host/nvhost_cdma.h             |  116 +++++
>  drivers/video/tegra/host/nvhost_channel.c          |  129 +++++
>  drivers/video/tegra/host/nvhost_channel.h          |   65 +++
>  drivers/video/tegra/host/nvhost_intr.c             |  391 ++++++++++++++
>  drivers/video/tegra/host/nvhost_intr.h             |  110 ++++
>  drivers/video/tegra/host/nvhost_job.c              |  398 +++++++++++++++
>  drivers/video/tegra/host/nvhost_memmgr.c           |  252 ++++++++++
>  drivers/video/tegra/host/nvhost_memmgr.h           |   66 +++
>  drivers/video/tegra/host/nvhost_syncpt.c           |  453 ++++++++++++++=
+++
>  drivers/video/tegra/host/nvhost_syncpt.h           |  148 ++++++
>  drivers/video/tegra/host/t20/Makefile              |    6 +
>  drivers/video/tegra/host/t20/t20.c                 |   78 +++
>  drivers/video/tegra/host/t20/t20.h                 |   29 ++
>  drivers/video/tegra/host/t30/Makefile              |    6 +
>  drivers/video/tegra/host/t30/t30.c                 |   80 +++
>  drivers/video/tegra/host/t30/t30.h                 |   29 ++
>  include/linux/nvhost.h                             |  302 +++++++++++
>  include/trace/events/nvhost.h                      |  249 +++++++++
>  48 files changed, 8186 insertions(+)
>  create mode 100644 drivers/video/tegra/host/Kconfig
>  create mode 100644 drivers/video/tegra/host/Makefile
>  create mode 100644 drivers/video/tegra/host/bus_client.c
>  create mode 100644 drivers/video/tegra/host/bus_client.h
>  create mode 100644 drivers/video/tegra/host/chip_support.c
>  create mode 100644 drivers/video/tegra/host/chip_support.h
>  create mode 100644 drivers/video/tegra/host/debug.c
>  create mode 100644 drivers/video/tegra/host/debug.h
>  create mode 100644 drivers/video/tegra/host/dev.c
>  create mode 100644 drivers/video/tegra/host/dev.h
>  create mode 100644 drivers/video/tegra/host/dmabuf.c
>  create mode 100644 drivers/video/tegra/host/dmabuf.h
>  create mode 100644 drivers/video/tegra/host/host1x/Makefile
>  create mode 100644 drivers/video/tegra/host/host1x/host1x.c
>  create mode 100644 drivers/video/tegra/host/host1x/host1x.h
>  create mode 100644 drivers/video/tegra/host/host1x/host1x01_hardware.h
>  create mode 100644 drivers/video/tegra/host/host1x/host1x_cdma.c
>  create mode 100644 drivers/video/tegra/host/host1x/host1x_cdma.h
>  create mode 100644 drivers/video/tegra/host/host1x/host1x_channel.c
>  create mode 100644 drivers/video/tegra/host/host1x/host1x_debug.c
>  create mode 100644 drivers/video/tegra/host/host1x/host1x_intr.c
>  create mode 100644 drivers/video/tegra/host/host1x/host1x_syncpt.c
>  create mode 100644 drivers/video/tegra/host/host1x/hw_host1x01_channel.h
>  create mode 100644 drivers/video/tegra/host/host1x/hw_host1x01_sync.h
>  create mode 100644 drivers/video/tegra/host/host1x/hw_host1x01_uclass.h
>  create mode 100644 drivers/video/tegra/host/nvhost_acm.c
>  create mode 100644 drivers/video/tegra/host/nvhost_acm.h
>  create mode 100644 drivers/video/tegra/host/nvhost_cdma.c
>  create mode 100644 drivers/video/tegra/host/nvhost_cdma.h
>  create mode 100644 drivers/video/tegra/host/nvhost_channel.c
>  create mode 100644 drivers/video/tegra/host/nvhost_channel.h
>  create mode 100644 drivers/video/tegra/host/nvhost_intr.c
>  create mode 100644 drivers/video/tegra/host/nvhost_intr.h
>  create mode 100644 drivers/video/tegra/host/nvhost_job.c
>  create mode 100644 drivers/video/tegra/host/nvhost_memmgr.c
>  create mode 100644 drivers/video/tegra/host/nvhost_memmgr.h
>  create mode 100644 drivers/video/tegra/host/nvhost_syncpt.c
>  create mode 100644 drivers/video/tegra/host/nvhost_syncpt.h
>  create mode 100644 drivers/video/tegra/host/t20/Makefile
>  create mode 100644 drivers/video/tegra/host/t20/t20.c
>  create mode 100644 drivers/video/tegra/host/t20/t20.h
>  create mode 100644 drivers/video/tegra/host/t30/Makefile
>  create mode 100644 drivers/video/tegra/host/t30/t30.c
>  create mode 100644 drivers/video/tegra/host/t30/t30.h
>  create mode 100644 include/linux/nvhost.h
>  create mode 100644 include/trace/events/nvhost.h

Okay, there's a huge amount of code here. From a quick look this seems
like the whole nvhost implementation as found in the L4T kernel. It'll
obviously take quite a bit of time to go through all of it.

I would really like this to be phased in in more manageable chunks. For
instance syncpoints could be added on top of the existing host1x
infrastructure (the display controllers can make use of it for VBLANK
reporting, right?), followed by channel support for command submission.

While VBLANK reporting is already rudimentarily supported using the
display controllers' VBLANK interrupts, adding syncpt based support
should be easy to do.

Last but not least, I'd really appreciate it if we could settle on one
name for this component. One place calls it graphics host, another one
refers to it as host1x and now we have an nvhost driver for it. The TRM
isn't very consistent either, unfortunately, but a number of chapters
refer to it as host1x and the clock that drives the block is also named
host1x. Those are pretty much the reasons why I chose to call the DT
node and the driver host1x and I would like to suggest we stay with it
to keep things less confusing.

Thierry

--d01dLTUuW90fS44H
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iQIcBAEBAgAGBQJQsAkPAAoJEN0jrNd/PrOhbCIP/0tFk3Py7sbtTvftg4fN73Qs
8mlesJGgYkLqDxNK3bcasyQH8Nz1ROVWrV4FkgaXfc3w6d40x0uIa1ZePQPrW/kH
/R9i3Zp4pRb3vBiOffzXNu9F8XAJFJShmjz9b+RMkF8tqqipSPWeqRYmcg0pGUhd
qtqzdAL41KPbdfsm8V0K8OhGjiLjbB1Ogdq9dxK3o2AjJ+N0FvsjD2Aqz2p06jxR
j6sfGL41RUKfJKcKvqjwrMb8p85tON5bwThRXJMOxPTqsB2pAKlkY+nHY8J0pW7T
icRSif8L91DK6zCxkRc+eRFBcu/jhti/g3LCrrn2j6Dhmfo7WlvRk7bhpE6A+OX2
wKNUaSSE8wHHHGnPciiRYSLY/UEUNA81lq1xEC8AiH/GHNnb8U5fUz61Z73orT7n
ircW3uvDDtlllaAVmSslHqTwnLDFHY/blNnZuhVgMchwRwJsMdDTak2NH5hoV3K3
7uhD4B3nnvUmycVUWnjaoe9pb8wvbOAFYqY2FFdVMKVdHYw/Fk2nvEmZOV6PZFxj
QBppWBlbY1t+R1yag3uUSP4Iw6Eo398iWtHy6+WsqvgmpMMJQDe0NcqzvOaRHyi3
Hn8BeS9NXKxiTfuemVxUQQkao+twGJHrOA95m8iFu72DkyvruZbEC0ilBIBdjhCI
eBf2o6FGV50WZ4wvpNxq
=pKvX
-----END PGP SIGNATURE-----

--d01dLTUuW90fS44H--
