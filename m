From: Baolin Wang <baolin.wang@linaro.org>
Subject: Re: [PATCH 2/8] soc: tegra: fuse: Change to the correct
 __dma_request_channel() prototype
Date: Thu, 9 May 2019 09:44:15 +0800
Message-ID: <CAMz4kuJaP2UGiqCRrRX=cwwyqfnmiJ0CG-BXBkTpwKE825xKsQ@mail.gmail.com>
References: <cover.1557206859.git.baolin.wang@linaro.org> <1ddb1abe8722154dd546d265d5c4536480a24a87.1557206859.git.baolin.wang@linaro.org>
 <8746a913-0014-7036-7fab-4e0dfab04e1b@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <8746a913-0014-7036-7fab-4e0dfab04e1b@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>
Cc: Dan Williams <dan.j.williams@intel.com>, Vinod Koul <vkoul@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org, Shawn Guo <shawnguo@kernel.org>, s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com, Zubair.Kakakhel@imgtec.com, Wolfram Sang <wsa+renesas@sang-engineering.com>, jroedel@suse.de, Vincent Guittot <vincent.guittot@linaro.org>, dmaengine@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>
List-Id: linux-tegra@vger.kernel.org

On Wed, 8 May 2019 at 23:15, Dmitry Osipenko <digetx@gmail.com> wrote:
>
> 07.05.2019 9:09, Baolin Wang =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> > Since we've introduced one device node parameter for __dma_request_chan=
nel(),
> > thus change to the correct function prototype.
> >
> > Signed-off-by: Baolin Wang <baolin.wang@linaro.org>
> > ---
> >  drivers/soc/tegra/fuse/fuse-tegra20.c |    2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/soc/tegra/fuse/fuse-tegra20.c b/drivers/soc/tegra/=
fuse/fuse-tegra20.c
> > index 49ff017..e2571b6 100644
> > --- a/drivers/soc/tegra/fuse/fuse-tegra20.c
> > +++ b/drivers/soc/tegra/fuse/fuse-tegra20.c
> > @@ -110,7 +110,7 @@ static int tegra20_fuse_probe(struct tegra_fuse *fu=
se)
> >       dma_cap_zero(mask);
> >       dma_cap_set(DMA_SLAVE, mask);
> >
> > -     fuse->apbdma.chan =3D __dma_request_channel(&mask, dma_filter, NU=
LL);
> > +     fuse->apbdma.chan =3D __dma_request_channel(&mask, dma_filter, NU=
LL, NULL);
> >       if (!fuse->apbdma.chan)
> >               return -EPROBE_DEFER;
> >
> >
>
> 1) Kernel should be kept bisect'able by not having intermediate patches
> that break compilation. Hence you should squash the changes into a
> single patch.
>
> 2) Better to replace __dma_request_channel() with dma_request_channel()
> since they are equal.

Good point. I'll change to use dma_request_channel() in next version
if no other objections. Thanks.

--=20
Baolin Wang
Best Regards
