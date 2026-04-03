Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE1D81DE894
	for <linux-tegra@vger.kernel.org>; Fri,  3 Apr 2026 15:19:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775229595; cv=none; b=uuKUyTIkrUSS4JSskmjbekqrWLsSTn8xoH/EeMxGmxibNFTZB3SGFuuzglQFewYNpHmITcVZK5b9zdIU4S4jg6O0Hx6F/7oBWmL/SvHvGvVrtPkP85QkevXSharM0oerp2lVh/vlE26Lp+we+zf81w4dysNQMEOHCNk6izmTrQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775229595; c=relaxed/simple;
	bh=uA+6V46rf6BOemDNgqn1Ld9hPYGCKqeJGfmxwLPppmM=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=PsbXkgcfM6n/jAhApqW8ySQnld007JZcYrUGg+qOOdy8NF1YfnhwUCzZiS76H+dH/lNGH1bXNZcspZxa/aLkZn4M5kDQFkvdU6vHk9TSlfbqPN1z/DW9Ypvz/p7iVb4VeUYR0Syj3fcaMFt9Hvjv9cQuG9HlOB2ShI3z5K9sdx8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--joonwonkang.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=oPAz2bJY; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--joonwonkang.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="oPAz2bJY"
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-3594620fe97so4357404a91.1
        for <linux-tegra@vger.kernel.org>; Fri, 03 Apr 2026 08:19:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1775229592; x=1775834392; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uTxlcaECIOSPGuWyVGV6jMrdulKgnVXDtGKmH5N3sQ8=;
        b=oPAz2bJYijjKA93RCct32bDF+otXfrANys3svf4OG1dqO42V50uTwy6xf9dEfa1J3Y
         fVSvqhbzZSFonm/VNLYGxAQJtQBokZeMTE2z5AMQY59eri42H/PT4tlSrVb/rGZObI+k
         qgtaS0ysi22NZBXb4MhpYR1vzwNTdXBuKUNZVXe8V6tKPAAfJsDs8v0rbtOitKlbuc3p
         jB9ofUfsA3RjW//eM6mg6hqljhU/CGLEFxc6xQnJufGQXkFqM4Qh4s95KohfP1pEOswW
         nhaVAZ+y2bAOm4fpbT4FtlTbm113PbVVXXBpT7m36boosh50+wE4K1QgBBf5Gz/H8shb
         brmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775229592; x=1775834392;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=uTxlcaECIOSPGuWyVGV6jMrdulKgnVXDtGKmH5N3sQ8=;
        b=dlUM4Lu0o+XKBhDVfLIPJeWzv4IJznx4D5lmXs93opEaMXstmp4n8xeMvKNku13qDK
         hCGm1v01YTQz+8+RQ63yPOntj+XCFTsow/kZj1hR2SfcSeMTiQcSvS2XP4VLV1siZ8mE
         FJPtQ3ak0rmbLZ8qiG1ly5bYcZPKDAi86OSieiMgK2RyHVnJ1Xgrx/svPiZi8FSmG1rV
         yAFyJQ1zZHKbx4tgP6J6dhO6Vi1M7nFPntmJFDp/az8067V+VZkwRrupum9nU+10mfnH
         UDH/kfKNpLJ6ZQPU25bJ0mxfev4G9yhFp6X/TpUfBZpHMONOACwt3S+pcSLno49CzKcl
         DqOw==
X-Forwarded-Encrypted: i=1; AJvYcCX897qOlir4lhYoTrQQqPXaA6y7kc4lpih73T01fgHCwMO8L5uFXd9VYPbb0VLsO/X030HqNIWfGHkw8w==@vger.kernel.org
X-Gm-Message-State: AOJu0YyaoEb8PM3ehxm8nupDJGjmC6ajaFNnyWqeA06S6qcznsRizrCn
	lOiZIF+/5O3PUqtM9A+stvu3C82CRo53OLp6kopEmXlZoHuuQcTZIe+tp8rMQWPMAUs9BoWkoXO
	Jy36nyBV3irEHgf+c10AYId8H0Q==
X-Received: from pgcn23.prod.google.com ([2002:a63:7217:0:b0:c73:bace:526e])
 (user=joonwonkang job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a20:7354:b0:39b:e321:784f with SMTP id adf61e73a8af0-39f2f05041dmr3566398637.40.1775229591907;
 Fri, 03 Apr 2026 08:19:51 -0700 (PDT)
Date: Fri,  3 Apr 2026 15:19:47 +0000
In-Reply-To: <CABb+yY3hYcJ82QGor3w5KKHUGz9Pc1k64Jdf-94E4Yvv0DTeyQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <CABb+yY3hYcJ82QGor3w5KKHUGz9Pc1k64Jdf-94E4Yvv0DTeyQ@mail.gmail.com>
X-Mailer: git-send-email 2.53.0.1213.gd9a14994de-goog
Message-ID: <20260403151950.2592581-1-joonwonkang@google.com>
Subject: Re: [PATCH v3 2/2] mailbox: Make mbox_send_message() return error
 code when tx fails
From: Joonwon Kang <joonwonkang@google.com>
To: jassisinghbrar@gmail.com
Cc: angelogioacchino.delregno@collabora.com, jonathanh@nvidia.com, 
	joonwonkang@google.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	linux-tegra@vger.kernel.org, matthias.bgg@gmail.com, stable@vger.kernel.org, 
	thierry.reding@gmail.com, akpm@linux-foundation.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

> On Thu, Apr 2, 2026 at 12:07=E2=80=AFPM Joonwon Kang <joonwonkang@google.=
com> wrote:
> >
> > When the mailbox controller failed transmitting message, the error code
> > was only passed to the client's tx done handler and not to
> > mbox_send_message(). For this reason, the function could return a false
> > success. This commit resolves the issue by introducing the tx status an=
d
> > checking it before mbox_send_message() returns.
> >
> Can you please share the scenario when this becomes necessary? This
> can potentially change the ground underneath some clients, so we have
> to be sure this is really useful.

I would say the problem here is generic enough to apply to all the cases wh=
ere
the send result needs to be checked. Since the return value of the send API=
 is
not the real send result, any users who believe that this blocking send API
will return the real send result could fall for that. For example, users ma=
y
think the send was successful even though it was not actually. I believe it=
 is
uncommon that users have to register a callback solely to get the send resu=
lt
even though they are using the blocking send API already. Also, I guess the=
re
is no special reason why only the mailbox send API should work this way amo=
ng
other typical blocking send APIs. For these reasons, this patch makes the s=
end
API return the real send result. This way, users will not need to register =
the
redundant callback and I think the return value will align with their commo=
n
expectation.

Regarding the change in the ground for some clients, could you help to clar=
ify
a bit more on what change, you expect, would surprise the clients?

Thanks,
Joonwon Kang

>=20
> Thanks
> Jassi
>=20
>=20
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Joonwon Kang <joonwonkang@google.com>
> > ---
> >  drivers/mailbox/mailbox.c          | 20 +++++++++++++++-----
> >  include/linux/mailbox_controller.h |  2 ++
> >  2 files changed, 17 insertions(+), 5 deletions(-)
> >
> > diff --git a/drivers/mailbox/mailbox.c b/drivers/mailbox/mailbox.c
> > index d63386468982..ea9aec9dc947 100644
> > --- a/drivers/mailbox/mailbox.c
> > +++ b/drivers/mailbox/mailbox.c
> > @@ -21,7 +21,10 @@
> >  static LIST_HEAD(mbox_cons);
> >  static DEFINE_MUTEX(con_mutex);
> >
> > -static int add_to_rbuf(struct mbox_chan *chan, void *mssg, struct comp=
letion *tx_complete)
> > +static int add_to_rbuf(struct mbox_chan *chan,
> > +                      void *mssg,
> > +                      struct completion *tx_complete,
> > +                      int *tx_status)
> >  {
> >         int idx;
> >
> > @@ -34,6 +37,7 @@ static int add_to_rbuf(struct mbox_chan *chan, void *=
mssg, struct completion *tx
> >         idx =3D chan->msg_free;
> >         chan->msg_data[idx].data =3D mssg;
> >         chan->msg_data[idx].tx_complete =3D tx_complete;
> > +       chan->msg_data[idx].tx_status =3D tx_status;
> >         chan->msg_count++;
> >
> >         if (idx =3D=3D MBOX_TX_QUEUE_LEN - 1)
> > @@ -91,12 +95,13 @@ static void msg_submit(struct mbox_chan *chan)
> >
> >  static void tx_tick(struct mbox_chan *chan, int r, int idx)
> >  {
> > -       struct mbox_message mssg =3D {MBOX_NO_MSG, NULL};
> > +       struct mbox_message mssg =3D {MBOX_NO_MSG, NULL, NULL};
> >
> >         scoped_guard(spinlock_irqsave, &chan->lock) {
> >                 if (idx >=3D 0 && idx !=3D chan->active_req) {
> >                         chan->msg_data[idx].data =3D MBOX_NO_MSG;
> >                         chan->msg_data[idx].tx_complete =3D NULL;
> > +                       chan->msg_data[idx].tx_status =3D NULL;
> >                         return;
> >                 }
> >
> > @@ -116,8 +121,10 @@ static void tx_tick(struct mbox_chan *chan, int r,=
 int idx)
> >         if (chan->cl->tx_done)
> >                 chan->cl->tx_done(chan->cl, mssg.data, r);
> >
> > -       if (r !=3D -ETIME && chan->cl->tx_block)
> > +       if (r !=3D -ETIME && chan->cl->tx_block) {
> > +               *mssg.tx_status =3D r;
> >                 complete(mssg.tx_complete);
> > +       }
> >  }
> >
> >  static enum hrtimer_restart txdone_hrtimer(struct hrtimer *hrtimer)
> > @@ -286,15 +293,16 @@ int mbox_send_message(struct mbox_chan *chan, voi=
d *mssg)
> >         int t;
> >         int idx;
> >         struct completion tx_complete;
> > +       int tx_status =3D 0;
> >
> >         if (!chan || !chan->cl || mssg =3D=3D MBOX_NO_MSG)
> >                 return -EINVAL;
> >
> >         if (chan->cl->tx_block) {
> >                 init_completion(&tx_complete);
> > -               t =3D add_to_rbuf(chan, mssg, &tx_complete);
> > +               t =3D add_to_rbuf(chan, mssg, &tx_complete, &tx_status)=
;
> >         } else {
> > -               t =3D add_to_rbuf(chan, mssg, NULL);
> > +               t =3D add_to_rbuf(chan, mssg, NULL, NULL);
> >         }
> >
> >         if (t < 0) {
> > @@ -318,6 +326,8 @@ int mbox_send_message(struct mbox_chan *chan, void =
*mssg)
> >                         idx =3D t;
> >                         t =3D -ETIME;
> >                         tx_tick(chan, t, idx);
> > +               } else if (tx_status < 0) {
> > +                       t =3D tx_status;
> >                 }
> >         }
> >
> > diff --git a/include/linux/mailbox_controller.h b/include/linux/mailbox=
_controller.h
> > index 912499ad08ed..890da97bcb50 100644
> > --- a/include/linux/mailbox_controller.h
> > +++ b/include/linux/mailbox_controller.h
> > @@ -117,10 +117,12 @@ struct mbox_controller {
> >   * struct mbox_message - Internal representation of a mailbox message
> >   * @data:              Data packet
> >   * @tx_complete:       Pointer to the transmission completion
> > + * @tx_status:         Pointer to the transmission status
> >   */
> >  struct mbox_message {
> >         void *data;
> >         struct completion *tx_complete;
> > +       int *tx_status;
> >  };
> >
> >  /**
> > --
> > 2.53.0.1185.g05d4b7b318-goog
> >
