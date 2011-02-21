From: Colin Cross <ccross-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 2/4] ARM: tegra: Prevent requeuing in-progress DMA requests
Date: Sun, 20 Feb 2011 20:09:46 -0800
Message-ID: <AANLkTinngEn5QV9CSYQq0mXVEHPRhAaXRumqgdPxGgmn@mail.gmail.com>
References: <1298173137-9242-1-git-send-email-swarren@nvidia.com>
	<1298173137-9242-3-git-send-email-swarren@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1298173137-9242-3-git-send-email-swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: konkers-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Sat, Feb 19, 2011 at 7:38 PM, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wr=
ote:
> If a request already in the queue is passed to tegra_dma_enqueue_req,
> tegra_dma_req.node->{next,prev} will end up pointing to itself instea=
d
> of at tegra_dma_channel.list, which is the way a the end-of-list
> should be set up. When the DMA request completes and is list_del'd,
> the list head will still point at it, yet the node's next/prev will
> contain the list poison values. When the next DMA request completes,
> a kernel panic will occur when those poison values are dereferenced.
>
> This makes the DMA driver more robust in the face of buggy clients.
>
> Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
> =A0arch/arm/mach-tegra/dma.c | =A0 =A08 ++++++++
> =A01 files changed, 8 insertions(+), 0 deletions(-)
>
> diff --git a/arch/arm/mach-tegra/dma.c b/arch/arm/mach-tegra/dma.c
> index 250bc7b..f3b869b 100644
> --- a/arch/arm/mach-tegra/dma.c
> +++ b/arch/arm/mach-tegra/dma.c
> @@ -311,6 +311,7 @@ int tegra_dma_enqueue_req(struct tegra_dma_channe=
l *ch,
> =A0 =A0 =A0 =A0struct tegra_dma_req *req)
> =A0{
> =A0 =A0 =A0 =A0unsigned long irq_flags;
> + =A0 =A0 =A0 struct tegra_dma_req *_req;
> =A0 =A0 =A0 =A0int start_dma =3D 0;
>
> =A0 =A0 =A0 =A0if (req->size > NV_DMA_MAX_TRASFER_SIZE ||
> @@ -321,6 +322,13 @@ int tegra_dma_enqueue_req(struct tegra_dma_chann=
el *ch,
>
> =A0 =A0 =A0 =A0spin_lock_irqsave(&ch->lock, irq_flags);
>
> + =A0 =A0 =A0 list_for_each_entry(_req, &ch->list, node) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (req =3D=3D _req) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 spin_unlock_irqrestore(=
&ch->lock, irq_flags);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 return -EEXIST;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 }
> + =A0 =A0 =A0 }
> +
> =A0 =A0 =A0 =A0req->bytes_transferred =3D 0;
> =A0 =A0 =A0 =A0req->status =3D 0;
> =A0 =A0 =A0 =A0req->buffer_status =3D 0;
> --
> 1.7.1
>
>

Pushed to tegra for-next
--
To unsubscribe from this list: send the line "unsubscribe linux-tegra" =
in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
