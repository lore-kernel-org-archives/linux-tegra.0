Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EACF836BCF5
	for <linux-tegra@vger.kernel.org>; Thu,  2 Apr 2026 18:03:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775152999; cv=pass; b=f8RPceo5D8X2dAn8J95dOmhhH+sL6KTeKV3vHRaybBFFwWjshAhKJ+4+fRCwKB1/0qIhmqmQxVP1yMQZ5rX/YFbPT9M+mOJobjvA14uODySDxloz+x2ptt+vd9YQq+iJetsFTQY2S27xzg/06BfMg0mKZR7jWbSeqFmOrtNhaP8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775152999; c=relaxed/simple;
	bh=d+41bWrPZASMK3eSIbSSj318xtKaXZplSr2koxtWAOI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OT2r1IUYbpHfHIss+CCJHZfDBxSQLwlRTOn+NM79OIuwxl2B9WsGxYMM/jnTu19TF8DwRFKk63kl6ozoLFNOnp+hHC0N0u6xUAWwYZHh/ed0NSL1B07n/wPVF9qDjDFZ033gly9Qr0dYr6SX1VHjZ266LivbeLw46iv3F6q3ff4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UZG7WqtD; arc=pass smtp.client-ip=209.85.210.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UZG7WqtD"
Received: by mail-ot1-f46.google.com with SMTP id 46e09a7af769-7d86eb7c854so681373a34.3
        for <linux-tegra@vger.kernel.org>; Thu, 02 Apr 2026 11:03:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775152997; cv=none;
        d=google.com; s=arc-20240605;
        b=eMwl8V5ocFnhtJ877FpC2B4vRb35tif1KcUQQKbADdRkgIzuyD2/+9d5FART2JNqEw
         5RkaWsDuoHOiHO6KEkIvvnC8T2FPEGIb10vR2ldIKxZySwkjIGgbCAHUJvNpBchaiKUr
         HHxwuhFDiFWTe2KtjUJhhDjQXrHMX6/ca4ZSH61VQ6Cf+vXiUE1y7Qgx7Si2oEo+axup
         4POrUC8flMzi5/pgdPMRg+uT9cpqmMjgOAmoPPTs4/fUtlD32sgbW2VST15WfBCuZRW2
         jh+lTQq70D909n9lcyh1SsTRwFC3O05AFRwoyYkMMEa/R+ffe46abXi2Ps3f65HtWW0D
         8oww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=M0TW/KELxmP6HAx/s1ZGX6uuibSSGSUbIAcodT49xPg=;
        fh=gOPOHrHffc0CyHGbMTPippH5P2rOC0agjRRCB77I08g=;
        b=AHlrQABkKz96oXQKk5VdDf9KF9IEm2n74lc5yy+hYBsnre6h3NfIZkxUm4tk7czRyv
         w3Rmb0LhVmGSuqzjI111nZuqjEx3XZUmfHGglGAiyTV9uECdEo7tBqJBQyyL3LHisAfR
         FnB4h/i66WJKVsLlBoxoM666n1PEQbESHa+rMByT9ANyFYHgE+ZMKUHtLsvSXEMkljXL
         L/EpTXrtDeXj6w8/qqqnPvAqS1pmPdhCuEuNcnM9lljtpKnxD8j7DpL38VG8ijSxJoYn
         oLVhoWV7sk2MRt/85Ob+eFekcy5croAfdZdSYF2pbYNTl466gmNxcWzwXXSq7bDvzXRe
         prsA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775152997; x=1775757797; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M0TW/KELxmP6HAx/s1ZGX6uuibSSGSUbIAcodT49xPg=;
        b=UZG7WqtDKYhsXpbN2DMSWFZ756CS6iB41FR/9CLATLVZzHAFZXV/zg8ZFhDkdcuqTF
         Eb/WEnxwaRGWeBopVhlL9FDfRF5DyAMPpnTIwo6Q7my7RBWtSl8regLuGduV8qPmXqwZ
         q61PbRO53BSFWtYfRpEVXcLaqXyAs5dQl2EQ/RIx4mWRr46DpSzMYukHyFyj5S9Pzh2m
         ckth0F0V9sLrSWG0TUydjuPbb0XmdYX7HmeErUjuPuAVd8nXvQwpqTMfuA38cvfhnNso
         QUoVtGAw++SXV/hSe4f0Al1GEGNyHkaA0EBxJdh+h5pOpU3tYC3j/GBfTMkF7jqFPkrL
         H6pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775152997; x=1775757797;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=M0TW/KELxmP6HAx/s1ZGX6uuibSSGSUbIAcodT49xPg=;
        b=oBLW5oiVgqmmHGyEYUTlvp907dbrzdlEIG/NvKr+/UHvfBxMY4KXkcGF8fSWeCio3w
         u82rwIfss8m0ks01llvcvqw4OusEfAp5m6kjbeXvlbA8ANqIOB3KfpGk1bVHHSjgXWHk
         tecs0bDGa5xpNJpWpdCa2NFsJPH2HB14IX+MD9e55EHVtQ6mfoxHfQQ3LF7ypgPfzd51
         UXSL0chHhbPZXH5eLwXu2Hcwsgx3oUhafJxXK+flYyPdm2DYxywjC+0i1W2o0Eh3PVtu
         wNrPa6JPOoo9QObzVKW2jxEbX5nfyVuA7MicOkYxdOIkH7mTH1uP/u0JLogW61/e+7qi
         3v6g==
X-Forwarded-Encrypted: i=1; AJvYcCXvJBlqO1tIII67U8is73Pk+5IymEP0W23zG0ZvfX/2R2smk62MiSpRHZM1nwWLyrsKkPzMPGV9625AXQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxCET84A7Ig85jh+I3uX3caVcjJ5VMI2JIKmj9IwAfjvZd0Atsr
	Xvp3wYTv2G1MDQpeMYjJ1FURPewP+yd2084wdD6yEau0cC1CxduO7PJoGLS5uF3UR8EEYxGIQsk
	eNWFsfNVOLQrJPoXYst3fxI4wsMlWD/U=
X-Gm-Gg: ATEYQzyg88ADgdCaixJDpp9DqA9tx5HtfFgRAvyMlDeOawxzD2u7dzxrmXxSElKrpxm
	XSG5FS32M+DpFJmph60nGrTZq3MFvXxNilYDICLUXOQMG3M0mMupyoIPoO5kPTUxyh4uix7HN3c
	dh2vvL8JNZCrS4rapwLOHt/Do3x/IbS/RoAwLiPjX7EJmoVFg+2ecy2Vw/TTDxVPgfkRNHowKl/
	koiQwTf65/TMY2naK9p5uI246v+y4RIzUud49TvkhA4ZAmQbX2zC8PQMnbXBcmVwtbYRxCBERfC
	VBIb529E
X-Received: by 2002:a05:6830:611b:b0:7d7:c96c:c5d6 with SMTP id
 46e09a7af769-7dbb6f1aea6mr240409a34.1.1775152996668; Thu, 02 Apr 2026
 11:03:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260402170641.2082547-1-joonwonkang@google.com> <20260402170641.2082547-3-joonwonkang@google.com>
In-Reply-To: <20260402170641.2082547-3-joonwonkang@google.com>
From: Jassi Brar <jassisinghbrar@gmail.com>
Date: Thu, 2 Apr 2026 13:03:05 -0500
X-Gm-Features: AQROBzCl5IvjHSRY9VamVjuRyy3ZLLYtLTcWUCKJtq-4tAuHHgLfoU-JXy74tSw
Message-ID: <CABb+yY3hYcJ82QGor3w5KKHUGz9Pc1k64Jdf-94E4Yvv0DTeyQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] mailbox: Make mbox_send_message() return error
 code when tx fails
To: Joonwon Kang <joonwonkang@google.com>
Cc: matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com, 
	thierry.reding@gmail.com, jonathanh@nvidia.com, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-tegra@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 2, 2026 at 12:07=E2=80=AFPM Joonwon Kang <joonwonkang@google.co=
m> wrote:
>
> When the mailbox controller failed transmitting message, the error code
> was only passed to the client's tx done handler and not to
> mbox_send_message(). For this reason, the function could return a false
> success. This commit resolves the issue by introducing the tx status and
> checking it before mbox_send_message() returns.
>
Can you please share the scenario when this becomes necessary? This
can potentially change the ground underneath some clients, so we have
to be sure this is really useful.

Thanks
Jassi


> Cc: stable@vger.kernel.org
> Signed-off-by: Joonwon Kang <joonwonkang@google.com>
> ---
>  drivers/mailbox/mailbox.c          | 20 +++++++++++++++-----
>  include/linux/mailbox_controller.h |  2 ++
>  2 files changed, 17 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/mailbox/mailbox.c b/drivers/mailbox/mailbox.c
> index d63386468982..ea9aec9dc947 100644
> --- a/drivers/mailbox/mailbox.c
> +++ b/drivers/mailbox/mailbox.c
> @@ -21,7 +21,10 @@
>  static LIST_HEAD(mbox_cons);
>  static DEFINE_MUTEX(con_mutex);
>
> -static int add_to_rbuf(struct mbox_chan *chan, void *mssg, struct comple=
tion *tx_complete)
> +static int add_to_rbuf(struct mbox_chan *chan,
> +                      void *mssg,
> +                      struct completion *tx_complete,
> +                      int *tx_status)
>  {
>         int idx;
>
> @@ -34,6 +37,7 @@ static int add_to_rbuf(struct mbox_chan *chan, void *ms=
sg, struct completion *tx
>         idx =3D chan->msg_free;
>         chan->msg_data[idx].data =3D mssg;
>         chan->msg_data[idx].tx_complete =3D tx_complete;
> +       chan->msg_data[idx].tx_status =3D tx_status;
>         chan->msg_count++;
>
>         if (idx =3D=3D MBOX_TX_QUEUE_LEN - 1)
> @@ -91,12 +95,13 @@ static void msg_submit(struct mbox_chan *chan)
>
>  static void tx_tick(struct mbox_chan *chan, int r, int idx)
>  {
> -       struct mbox_message mssg =3D {MBOX_NO_MSG, NULL};
> +       struct mbox_message mssg =3D {MBOX_NO_MSG, NULL, NULL};
>
>         scoped_guard(spinlock_irqsave, &chan->lock) {
>                 if (idx >=3D 0 && idx !=3D chan->active_req) {
>                         chan->msg_data[idx].data =3D MBOX_NO_MSG;
>                         chan->msg_data[idx].tx_complete =3D NULL;
> +                       chan->msg_data[idx].tx_status =3D NULL;
>                         return;
>                 }
>
> @@ -116,8 +121,10 @@ static void tx_tick(struct mbox_chan *chan, int r, i=
nt idx)
>         if (chan->cl->tx_done)
>                 chan->cl->tx_done(chan->cl, mssg.data, r);
>
> -       if (r !=3D -ETIME && chan->cl->tx_block)
> +       if (r !=3D -ETIME && chan->cl->tx_block) {
> +               *mssg.tx_status =3D r;
>                 complete(mssg.tx_complete);
> +       }
>  }
>
>  static enum hrtimer_restart txdone_hrtimer(struct hrtimer *hrtimer)
> @@ -286,15 +293,16 @@ int mbox_send_message(struct mbox_chan *chan, void =
*mssg)
>         int t;
>         int idx;
>         struct completion tx_complete;
> +       int tx_status =3D 0;
>
>         if (!chan || !chan->cl || mssg =3D=3D MBOX_NO_MSG)
>                 return -EINVAL;
>
>         if (chan->cl->tx_block) {
>                 init_completion(&tx_complete);
> -               t =3D add_to_rbuf(chan, mssg, &tx_complete);
> +               t =3D add_to_rbuf(chan, mssg, &tx_complete, &tx_status);
>         } else {
> -               t =3D add_to_rbuf(chan, mssg, NULL);
> +               t =3D add_to_rbuf(chan, mssg, NULL, NULL);
>         }
>
>         if (t < 0) {
> @@ -318,6 +326,8 @@ int mbox_send_message(struct mbox_chan *chan, void *m=
ssg)
>                         idx =3D t;
>                         t =3D -ETIME;
>                         tx_tick(chan, t, idx);
> +               } else if (tx_status < 0) {
> +                       t =3D tx_status;
>                 }
>         }
>
> diff --git a/include/linux/mailbox_controller.h b/include/linux/mailbox_c=
ontroller.h
> index 912499ad08ed..890da97bcb50 100644
> --- a/include/linux/mailbox_controller.h
> +++ b/include/linux/mailbox_controller.h
> @@ -117,10 +117,12 @@ struct mbox_controller {
>   * struct mbox_message - Internal representation of a mailbox message
>   * @data:              Data packet
>   * @tx_complete:       Pointer to the transmission completion
> + * @tx_status:         Pointer to the transmission status
>   */
>  struct mbox_message {
>         void *data;
>         struct completion *tx_complete;
> +       int *tx_status;
>  };
>
>  /**
> --
> 2.53.0.1185.g05d4b7b318-goog
>
