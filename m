From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH 3.9-stable] dma: tegra: avoid channel lock up after free
Date: Wed, 10 Jul 2013 18:31:21 +0400
Message-ID: <51DD7039.6020100@gmail.com>
References: <1373460257-4493-1-git-send-email-jhbird.choi@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <stable-owner@vger.kernel.org>
In-Reply-To: <1373460257-4493-1-git-send-email-jhbird.choi@samsung.com>
Sender: stable-owner@vger.kernel.org
To: Jonghwan Choi <jhbird.choi@gmail.com>
Cc: Vinod Koul <vinod.koul@intel.com>, Stephen Warren <swarren@wwwdotorg.org>, stable@vger.kernel.org, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

10.07.2013 16:44, Jonghwan Choi =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> From: Dmitry Osipenko <digetx@gmail.com>
>=20
> This patch looks like it should be in the 3.9-stable tree, should we =
apply
> it?
>=20
> ------------------
>=20
> From: "Dmitry Osipenko <digetx@gmail.com>"
>=20
> commit 7bdc1e272a471062e8f310137c896e2355b46d13 upstream
>=20
> Lock scenario: Channel 1 was allocated and prepared as slave_sg, used=
 and freed.
> Now preparation of cyclic dma on channel 1 will fail with err "DMA co=
nfiguration
> conflict" because tdc->isr_handler still setted to handle_once_dma_do=
ne.
>=20
> This happens because tegra_dma_abort_all() won't be called on channel=
 freeing
> if pending list is empty and channel not busy. We need to clear isr_h=
andler
> on channel freeing to avoid locking.
>=20
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> Acked-by: Stephen Warren <swarren@nvidia.com>
> Acked-by: Laxman Dewangan <ldewangan@nvidia.com>
> Signed-off-by: Vinod Koul <vinod.koul@intel.com>
> Signed-off-by: Jonghwan Choi <jhbird.choi@samsung.com>
> ---
>  drivers/dma/tegra20-apb-dma.c | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/drivers/dma/tegra20-apb-dma.c b/drivers/dma/tegra20-apb-=
dma.c
> index fcee27e..d464225 100644
> --- a/drivers/dma/tegra20-apb-dma.c
> +++ b/drivers/dma/tegra20-apb-dma.c
> @@ -1189,6 +1189,7 @@ static void tegra_dma_free_chan_resources(struc=
t dma_chan *dc)
>  	list_splice_init(&tdc->free_dma_desc, &dma_desc_list);
>  	INIT_LIST_HEAD(&tdc->cb_desc);
>  	tdc->config_init =3D false;
> +	tdc->isr_handler =3D NULL;
>  	spin_unlock_irqrestore(&tdc->lock, flags);
> =20
>  	while (!list_empty(&dma_desc_list)) {
>=20

Currently the only dma user in upstream is sound. This should be more a=
ctual
after fixing serial tegra driver which has obvious deadlock issue and p=
robably
some other issue that prevents correct data transfer (not possible to c=
omplete
large file transfer via bluetooth). I have fix for deadlock but data tr=
ansfer
breakage looks much more difficult and I'm not fully sure yet that it's=
 serial
issue.
