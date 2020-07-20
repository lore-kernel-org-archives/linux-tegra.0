From: Rajesh Gumasta <rgumasta-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: RE: [Patch v1 0/4] Add Nvidia Tegra GPC-DMA driver
Date: Mon, 20 Jul 2020 10:00:27 +0000
Message-ID: <MN2PR12MB4143A3B01549E8243280CF30A27B0@MN2PR12MB4143.namprd12.prod.outlook.com>
References: <1595226856-19241-1-git-send-email-rgumasta@nvidia.com>
 <20200720092556.GA2141917@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200720092556.GA2141917@ulmo>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "vkoul-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <vkoul-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org" <dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, "p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org" <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, "dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Krishna Yarlagadda <kyarlagadda-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org



> -----Original Message-----
> From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> Sent: Monday, July 20, 2020 2:56 PM
> To: Rajesh Gumasta <rgumasta-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> Cc: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>; Jonathan Hunter
> <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>; vkoul-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org; dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org;
> p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org; dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; linux-
> tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; Krishna Yarlagadda
> <kyarlagadda-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> Subject: Re: [Patch v1 0/4] Add Nvidia Tegra GPC-DMA driver
>=20
> On Mon, Jul 20, 2020 at 12:04:12PM +0530, Rajesh Gumasta wrote:
> > Add support for Nvida Tegra general purpose DMA driver for
> > Tegra186 and Tegra194 platform.
> >
> > Patch 1: Add dt-binding document for Tegra GPCDMA driver Patch 2: Add
> > Tegra GPCDMA driver Patch 3: Enable Tegra GPCDMA as module Patch 4:
> > Add GPCDMA DT node for Tegra186 and Tegra194
> >
> > Rajesh Gumasta (4):
> >   dt-bindings: dma: Add DT binding document
> >   dma: tegra: Adding Tegra GPC DMA controller driver
> >   arm64: configs: enable tegra gpc dma
> >   arm64: tegra: Add GPCDMA node in dt
> >
> >  .../bindings/dma/nvidia,tegra-gpc-dma.yaml         |   99 ++
> >  arch/arm64/boot/dts/nvidia/tegra186-p3310.dtsi     |    4 +
> >  arch/arm64/boot/dts/nvidia/tegra186.dtsi           |   46 +
> >  arch/arm64/boot/dts/nvidia/tegra194.dtsi           |   44 +
> >  arch/arm64/configs/defconfig                       |    1 +
> >  drivers/dma/Kconfig                                |   12 +
> >  drivers/dma/Makefile                               |    1 +
> >  drivers/dma/tegra-gpc-dma.c                        | 1512 ++++++++++++=
++++++++
> >  8 files changed, 1719 insertions(+)
> >  create mode 100644
> > Documentation/devicetree/bindings/dma/nvidia,tegra-gpc-dma.yaml
> >  create mode 100644 drivers/dma/tegra-gpc-dma.c
>=20
> Hi Rajesh,
>=20
> can you provide instructions on how to test that this driver does what it=
's
> supposed to? I could probably figure out how to run this with the kernel'=
s built-in
> dmatest module, but if you could provide a set of parameters that you've =
used
> or other instructions on how to validate this it would greatly help.
>=20

I have used below parameter setting with kernel's built-in dmatest module t=
o test mem to mem copy =20
cd /sys/module/dmatest/parameters=20
echo 50000 > iterations
echo dma0chan20 > channel
echo 1 > run

> Thanks,
> Thierry
>=20
> >
> > --
> > 2.7.4
> >

Thanks
Rajesh Gumasta
