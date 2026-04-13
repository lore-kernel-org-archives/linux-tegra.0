Received: from mail-oa1-f52.google.com (mail-oa1-f52.google.com [209.85.160.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BCB418872A
	for <linux-tegra@vger.kernel.org>; Mon, 13 Apr 2026 01:42:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776044581; cv=pass; b=mBvGkUAjKUcAMl5SVx1INs8iVSrTTu3dWQctjPmxe1ZN3O5NMbQkPPMQ4A7JxbTN75CkTVIFmdCf7UvItr1cHL81t7wJ1Kcm2fJfyY3NZSn/e8X+sBL04MoMiBxps4Gd8Qi1EOM+honzLfZhk+qACtqic5aASH0y+M+22tVR280=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776044581; c=relaxed/simple;
	bh=qOI+HL01lOQlV/37/I6AGHvFI1YGoKNR8Wv08+v7GWs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mirOzGD9U8evdTk+09/nV2MU0Dl05hj6XfgDSoIrFi/G6IDYfRZU8Yonictrq2GXt9UksjuzHDe4cRcIh36YEzXVrndo8WCQmaNl9CAOOdm7rwO9AfdF+l3/3MkaI+lYEb1lW3Onmgf0F7PQAOaax/9Nf+x1rBoTewWw5A9y4js=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MAp2hMTp; arc=pass smtp.client-ip=209.85.160.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MAp2hMTp"
Received: by mail-oa1-f52.google.com with SMTP id 586e51a60fabf-42321c8b8f5so3154746fac.1
        for <linux-tegra@vger.kernel.org>; Sun, 12 Apr 2026 18:42:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776044578; cv=none;
        d=google.com; s=arc-20240605;
        b=bvY990FhM69V5HhfsmZBEHkry52d6m94lLk6usDBNJkCU5W24b2wu9e3LhgRIKmQKv
         H7uNolVhLDIv1y1cd7bqjS+9jwJZR/f5C0Ip0rKXUdoF+R3seqbvhYt8kxkSf5m4mdST
         PF7f6xk7azHmzTkz9RqNK5/qOmPfBf11SB/Vicm+3DoGfDr28CE902lp3LeFly0C1V1/
         HbpSvhO3TBVnDP+gHUyupS1tPRKtrP9xr+NDXojxM4aHT0IRpendvQA2ARvKAFxsunfp
         rndB5qs08DwuP/J8rwRW/Tn6S15BPYly6a5ra9OzxrvYapfNNj3+b2LIfEs6fw7SuVs5
         kCJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ZpqWZ5OeBihZW+KiOWj3yc4NCjFh45eEbq7S9GQ1ONE=;
        fh=RwCEF4qTXMw+nqUC8ni6sLuZsNMKygNYZ2gW6wM+NgY=;
        b=G8/PozDQxsw8fjgkOBQq6NPThe83ZbiBq9yPyLbQ49UgdRLpKlXPi2bqb/MXooxDOc
         cha4NF5tFaCkJkkhkYR84EUJ2D7P+lxntoKQ1k61C82Mie+3WHmn340d+3AQEv+g//gl
         3Ek0waEuQ2YWmi0UJRv2lOTtjEG6RbH4WxC4sLYx2kQbhB/3VutTku6IT2/vFEGsKpuL
         MYQpH35sFeo753C3IoqrocOlHx6f5egTyASdo6NcU+qbjcX3wjDt79WWjJ2MCtUIQXV+
         3YESFw/ACdTkuTP+rmklJKZDouSn9PUvPJco4b7XOZc6z17ALZVFHLczuWfASE/9tJAV
         pBYA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776044578; x=1776649378; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZpqWZ5OeBihZW+KiOWj3yc4NCjFh45eEbq7S9GQ1ONE=;
        b=MAp2hMTp8z+yF+iYZPUK9xkSbrOpnVX7H8amirdZHFUIyRJqhLM1pEdaOR/yj6xXXi
         Yb8iPC/unO8wtR/+Yv5oVo5vnOXBcGx0ohp09I1KUrqbDKOULacjMyiypeMWHsSH/uiM
         4YCXBT8YbUje1jl237xUiaeDjzspkrA/gK/3osqxfcuhGg7myWm8Hh7DV2R5Y0CvKvrQ
         u1LuWnqssp+mtBiZKBo9tv9ND+aMXi5E3jvnmfzJMIBuyASHPqX2NFMa+YHXuP7rqoWc
         PmMgWQ5dcQ4yZyVc6WOlSMwjZsqFTr1Ms3gZhMNffDH9JwhhtLB9PZp39tYi7v5Fl61+
         YSBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776044578; x=1776649378;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZpqWZ5OeBihZW+KiOWj3yc4NCjFh45eEbq7S9GQ1ONE=;
        b=lcq0BQ66VOXzoUyU6dWl5X+y5N6nNdwQHyqOowUWzjMdWaMqZgKCdVcroK+GolbbMx
         IIE3E4xXus9ZkiP0zwFWelUnWtA11/MHNQO4DP3PqtcQL4IBm59bl372P7uSVebFAZl5
         kfb2VtQKdqBwyR/ZM5fQA5bt7f4lL5dZcOJNaW40E77cEyUDLmhtfkbqFnjncQnpxRqZ
         4Kw1PlEzsz1rSFstyAlm2fm3+Z5iyskKkbSjeZScwB9aws309PnK+NJ11Krv36xDhX/v
         BVqAGHgjsLktj1zT9XzE2RjC5D+GAXCV+fUxlQdL/0Zx/JkhfqYL84w2gjvCRUhCKBJv
         5b+A==
X-Forwarded-Encrypted: i=1; AFNElJ8YfZU0UCuHIv+Sh5ywdq6LIfLoyaJ/1V98yJWj8ogzIjprcBCfCvDWlLYUd7hj+Zwd2PEDwKGJwmBRxw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4x3R4P//iR4HrhxGei3Rm7u+y0AwMjYnIxyQYkliuuXMoH2F2
	6NNgIy28J0SSD7+52zSsW07ZhGxPyGZ2VcPY8wZv1l+JVhRUgcEP5AxgVwt4q7LTpt2M9JGYCdS
	crRzmeJzcmq3KK+Kby2mkJntuFy7ofGM=
X-Gm-Gg: AeBDietbv8RKd7VZNWxdwHKtoCq+gJCxNemhU521MuoUrzdB4uSx5emf2Sdp5zBLzOS
	AtZihF0HTJTjD5gxYNtYHwstbvgcbMmzjJrhS4r6nCav5YSqYkQ17CzmclnQGypF/I6G1l7S4za
	tQc+7zzZQVmOvVr54+9dYnCc1NPtN9CW4feO9VtUDxsAtcBEfianHHq236g03U5yA7neagiWqFR
	ToFhMM4ACptC96ceKspo4xGmNdxfsCHurllJ60/m9hp/X/J2JiYqwwslFa3rNRGRZPDxIeMAf2C
	smt1kGcG
X-Received: by 2002:a05:687c:20c2:b0:41c:9797:d1e6 with SMTP id
 586e51a60fabf-423e1e1318dmr5077336fac.14.1776044577979; Sun, 12 Apr 2026
 18:42:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260410125105.39340-2-wsa+renesas@sang-engineering.com>
In-Reply-To: <20260410125105.39340-2-wsa+renesas@sang-engineering.com>
From: Jassi Brar <jassisinghbrar@gmail.com>
Date: Sun, 12 Apr 2026 20:42:46 -0500
X-Gm-Features: AQROBzD5VLydoqD-crkS8q5jKVQvu0Dgk3PHuV4kaQv0TPwaWMSf23DdaK7QoI0
Message-ID: <CABb+yY0QydFqBQ2sPzrbDjoj1ODTe0FW_p_4jyBR8cP_gxg9XQ@mail.gmail.com>
Subject: Re: [PATCH] mailbox: prefix new constants with MBOX_
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, Peter Chen <peter.chen@cixtech.com>, 
	Fugang Duan <fugang.duan@cixtech.com>, 
	CIX Linux Kernel Upstream Group <cix-kernel-upstream@cixtech.com>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Thierry Reding <thierry.reding@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, 
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev, 
	linux-mediatek@lists.infradead.org, linux-tegra@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 10, 2026 at 7:51=E2=80=AFAM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
>
> Commit 89e5d7d61600 ("mailbox: remove superfluous internal header")
> moved some constants to a public header but forgot to add a mailbox
> specific prefix. Add this now to prevent future collisions on a too
> generic naming.
>
> Link: https://sashiko.dev/#/patchset/20260327151112.5202-2-wsa%2Brenesas%=
40sang-engineering.com
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
>
> This patch improves the above mentioned commit which already sits in
> -next. It is not really a fix but it probably is still a good idea to
> apply it before rc1 to avoid confusion.
>
>  drivers/mailbox/cix-mailbox.c      |  2 +-
>  drivers/mailbox/imx-mailbox.c      |  2 +-
>  drivers/mailbox/mailbox.c          | 22 +++++++++++-----------
>  drivers/mailbox/mtk-cmdq-mailbox.c |  2 +-
>  drivers/mailbox/omap-mailbox.c     |  2 +-
>  drivers/mailbox/tegra-hsp.c        |  2 +-
>  include/linux/mailbox_controller.h |  6 +++---
>  7 files changed, 19 insertions(+), 19 deletions(-)
>
> diff --git a/drivers/mailbox/cix-mailbox.c b/drivers/mailbox/cix-mailbox.=
c
> index 8cfaa91b75bd..43c76cdab24a 100644
> --- a/drivers/mailbox/cix-mailbox.c
> +++ b/drivers/mailbox/cix-mailbox.c
> @@ -413,7 +413,7 @@ static int cix_mbox_startup(struct mbox_chan *chan)
>         switch (cp->type) {
>         case CIX_MBOX_TYPE_DB:
>                 /* Overwrite txdone_method for DB channel */
> -               chan->txdone_method =3D TXDONE_BY_ACK;
> +               chan->txdone_method =3D MBOX_TXDONE_BY_ACK;
>                 fallthrough;
>         case CIX_MBOX_TYPE_REG:
>                 if (priv->dir =3D=3D CIX_MBOX_TX) {
> diff --git a/drivers/mailbox/imx-mailbox.c b/drivers/mailbox/imx-mailbox.=
c
> index 22331b579489..246a9a9e3952 100644
> --- a/drivers/mailbox/imx-mailbox.c
> +++ b/drivers/mailbox/imx-mailbox.c
> @@ -732,7 +732,7 @@ static struct mbox_chan * imx_mu_xlate(struct mbox_co=
ntroller *mbox,
>         p_chan =3D &mbox->chans[chan];
>
>         if (type =3D=3D IMX_MU_TYPE_TXDB_V2)
> -               p_chan->txdone_method =3D TXDONE_BY_ACK;
> +               p_chan->txdone_method =3D MBOX_TXDONE_BY_ACK;
>
>         return p_chan;
>  }
> diff --git a/drivers/mailbox/mailbox.c b/drivers/mailbox/mailbox.c
> index 138ffbcd4fde..30eafdf3a91e 100644
> --- a/drivers/mailbox/mailbox.c
> +++ b/drivers/mailbox/mailbox.c
> @@ -72,7 +72,7 @@ static void msg_submit(struct mbox_chan *chan)
>                 }
>         }
>
> -       if (!err && (chan->txdone_method & TXDONE_BY_POLL)) {
> +       if (!err && (chan->txdone_method & MBOX_TXDONE_BY_POLL)) {
>                 /* kick start the timer immediately to avoid delays */
>                 scoped_guard(spinlock_irqsave, &chan->mbox->poll_hrt_lock=
)
>                         hrtimer_start(&chan->mbox->poll_hrt, 0, HRTIMER_M=
ODE_REL);
> @@ -162,7 +162,7 @@ EXPORT_SYMBOL_GPL(mbox_chan_received_data);
>   */
>  void mbox_chan_txdone(struct mbox_chan *chan, int r)
>  {
> -       if (unlikely(!(chan->txdone_method & TXDONE_BY_IRQ))) {
> +       if (unlikely(!(chan->txdone_method & MBOX_TXDONE_BY_IRQ))) {
>                 dev_err(chan->mbox->dev,
>                        "Controller can't run the TX ticker\n");
>                 return;
> @@ -183,7 +183,7 @@ EXPORT_SYMBOL_GPL(mbox_chan_txdone);
>   */
>  void mbox_client_txdone(struct mbox_chan *chan, int r)
>  {
> -       if (unlikely(!(chan->txdone_method & TXDONE_BY_ACK))) {
> +       if (unlikely(!(chan->txdone_method & MBOX_TXDONE_BY_ACK))) {
>                 dev_err(chan->mbox->dev, "Client can't run the TX ticker\=
n");
>                 return;
>         }
> @@ -344,8 +344,8 @@ static int __mbox_bind_client(struct mbox_chan *chan,=
 struct mbox_client *cl)
>                 chan->cl =3D cl;
>                 init_completion(&chan->tx_complete);
>
> -               if (chan->txdone_method =3D=3D TXDONE_BY_POLL && cl->know=
s_txdone)
> -                       chan->txdone_method =3D TXDONE_BY_ACK;
> +               if (chan->txdone_method =3D=3D MBOX_TXDONE_BY_POLL && cl-=
>knows_txdone)
> +                       chan->txdone_method =3D MBOX_TXDONE_BY_ACK;
>         }
>
>         if (chan->mbox->ops->startup) {
> @@ -499,8 +499,8 @@ void mbox_free_channel(struct mbox_chan *chan)
>         scoped_guard(spinlock_irqsave, &chan->lock) {
>                 chan->cl =3D NULL;
>                 chan->active_req =3D MBOX_NO_MSG;
> -               if (chan->txdone_method =3D=3D TXDONE_BY_ACK)
> -                       chan->txdone_method =3D TXDONE_BY_POLL;
> +               if (chan->txdone_method =3D=3D MBOX_TXDONE_BY_ACK)
> +                       chan->txdone_method =3D MBOX_TXDONE_BY_POLL;
>         }
>
>         module_put(chan->mbox->dev->driver->owner);
> @@ -531,13 +531,13 @@ int mbox_controller_register(struct mbox_controller=
 *mbox)
>                 return -EINVAL;
>
>         if (mbox->txdone_irq)
> -               txdone =3D TXDONE_BY_IRQ;
> +               txdone =3D MBOX_TXDONE_BY_IRQ;
>         else if (mbox->txdone_poll)
> -               txdone =3D TXDONE_BY_POLL;
> +               txdone =3D MBOX_TXDONE_BY_POLL;
>         else /* It has to be ACK then */
> -               txdone =3D TXDONE_BY_ACK;
> +               txdone =3D MBOX_TXDONE_BY_ACK;
>
> -       if (txdone =3D=3D TXDONE_BY_POLL) {
> +       if (txdone =3D=3D MBOX_TXDONE_BY_POLL) {
>
>                 if (!mbox->ops->last_tx_done) {
>                         dev_err(mbox->dev, "last_tx_done method is absent=
\n");
> diff --git a/drivers/mailbox/mtk-cmdq-mailbox.c b/drivers/mailbox/mtk-cmd=
q-mailbox.c
> index 547a10a8fad3..e523c84b4808 100644
> --- a/drivers/mailbox/mtk-cmdq-mailbox.c
> +++ b/drivers/mailbox/mtk-cmdq-mailbox.c
> @@ -728,7 +728,7 @@ static int cmdq_probe(struct platform_device *pdev)
>         cmdq->mbox.ops =3D &cmdq_mbox_chan_ops;
>         cmdq->mbox.of_xlate =3D cmdq_xlate;
>
> -       /* make use of TXDONE_BY_ACK */
> +       /* make use of MBOX_TXDONE_BY_ACK */
>         cmdq->mbox.txdone_irq =3D false;
>         cmdq->mbox.txdone_poll =3D false;
>
> diff --git a/drivers/mailbox/omap-mailbox.c b/drivers/mailbox/omap-mailbo=
x.c
> index 5772c6b9886a..535ca8020877 100644
> --- a/drivers/mailbox/omap-mailbox.c
> +++ b/drivers/mailbox/omap-mailbox.c
> @@ -238,7 +238,7 @@ static int omap_mbox_startup(struct omap_mbox *mbox)
>         }
>
>         if (mbox->send_no_irq)
> -               mbox->chan->txdone_method =3D TXDONE_BY_ACK;
> +               mbox->chan->txdone_method =3D MBOX_TXDONE_BY_ACK;
>
>         omap_mbox_enable_irq(mbox, IRQ_RX);
>
> diff --git a/drivers/mailbox/tegra-hsp.c b/drivers/mailbox/tegra-hsp.c
> index 7b1e1b83ea29..500fa77c7d53 100644
> --- a/drivers/mailbox/tegra-hsp.c
> +++ b/drivers/mailbox/tegra-hsp.c
> @@ -514,7 +514,7 @@ static int tegra_hsp_mailbox_startup(struct mbox_chan=
 *chan)
>         struct tegra_hsp *hsp =3D mb->channel.hsp;
>         unsigned long flags;
>
> -       chan->txdone_method =3D TXDONE_BY_IRQ;
> +       chan->txdone_method =3D MBOX_TXDONE_BY_IRQ;
>
>         /*
>          * Shared mailboxes start out as consumers by default. FULL and E=
MPTY
> diff --git a/include/linux/mailbox_controller.h b/include/linux/mailbox_c=
ontroller.h
> index e3896b08f22e..a49ee687d4cf 100644
> --- a/include/linux/mailbox_controller.h
> +++ b/include/linux/mailbox_controller.h
> @@ -15,9 +15,9 @@ struct mbox_chan;
>  /* Sentinel value distinguishing "no active request" from "NULL message =
data" */
>  #define MBOX_NO_MSG    ((void *)-1)
>
> -#define TXDONE_BY_IRQ  BIT(0) /* controller has remote RTR irq */
> -#define TXDONE_BY_POLL BIT(1) /* controller can read status of last TX *=
/
> -#define TXDONE_BY_ACK  BIT(2) /* S/W ACK received by Client ticks the TX=
 */
> +#define MBOX_TXDONE_BY_IRQ     BIT(0) /* controller has remote RTR irq *=
/
> +#define MBOX_TXDONE_BY_POLL    BIT(1) /* controller can read status of l=
ast TX */
> +#define MBOX_TXDONE_BY_ACK     BIT(2) /* S/W ACK received by Client tick=
s the TX */
>
>  /**
>   * struct mbox_chan_ops - methods to control mailbox channels
> --
> 2.51.0
>
Applied to mailbox/for-next
Thanks
Jassi
