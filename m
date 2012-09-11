From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?=
	<u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH 1/2] dma: tegra: make tegra_dma.chip_data a pointer to
 const data
Date: Tue, 11 Sep 2012 08:58:19 +0200
Message-ID: <20120911065819.GF28643@pengutronix.de>
References: <20120829084911.GE28643@pengutronix.de>
 <1346230295-15898-1-git-send-email-u.kleine-koenig@pengutronix.de>
 <504E2F95.6040808@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <504E2F95.6040808@wwwdotorg.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Warren <swarren@wwwdotorg.org>, Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>
Cc: Laxman Dewangan <ldewangan@nvidia.com>, Vinod Koul <vinod.koul@intel.com>, djbw@fb.com, linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, kernel@pengutronix.de
List-Id: linux-tegra@vger.kernel.org

On Mon, Sep 10, 2012 at 12:21:09PM -0600, Stephen Warren wrote:
> On 08/29/2012 02:51 AM, Uwe Kleine-K=F6nig wrote:
> > From: Laxman Dewangan <ldewangan@nvidia.com>
> >=20
> > This prepares *of_device_id.data becoming const. Without this chang=
e
> > the following warning would occur:
> >=20
> > 	drivers/dma/tegra20-apb-dma.c: In function 'tegra_dma_probe':
> > 	drivers/dma/tegra20-apb-dma.c:1210:9: warning: assignment discards=
 'const' qualifier from pointer target type [enabled by default]
> >=20
> > [ukl: split Laxman's patch to prevent warnings in the middle of the
> > series. Original patch was sent with msgid
> > 1346217447-19730-1-git-send-email-ldewangan@nvidia.com]
> >=20
> > Signed-off-by: Laxman Dewangan <ldewangan@nvidia.com>
> > Acked-by: Stephen Warren <swarren@wwwdotorg.org>
> > Acked-by: Vinod Koul <vinod.koul@linux.intel.com>
> > Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>
>=20
> Uwe,
>=20
> I don't see these patches in linux-next, so compilation is still brok=
en.
> Can you please apply them? Thanks.
I have, but my new tree didn't make it into arm-soc. Arnd/Olof, can you
please refetch it?

Thanks
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig        =
    |
Industrial Linux Solutions                 | http://www.pengutronix.de/=
  |
