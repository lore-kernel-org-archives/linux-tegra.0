Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66CC02F6911
	for <linux-tegra@vger.kernel.org>; Tue, 10 Mar 2026 15:08:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773155338; cv=none; b=OQfWk0aD1skprg3B3e6pOJ281xsHt5BzTaSUVhm5Zv/Mlczvc63UI38cbqTZiiq5Pgof9lM1vL/LOKO79cJx/iBFzDM67fQUa7fHj9Nrzp6Y8EB/mEPMrNvwd/CPZMc2Tty308LuPMdkfMNj760ENnOMug+pykom5IG69r8XqLE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773155338; c=relaxed/simple;
	bh=l66roiogcZuRuWdg/BN7GAGFpuk8qIZkWg5A5bU5kEI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pzJmgkh7DMU8uaCH+Yai0ho692ltSXnsw2bmIxXiCdeGSDZ5h3o2kQnQI+w125fueXaIM6k9FzAlRXkoXfOuOiCj2NfxECAWr1GlgRBcpVR1Wm455oehb08r6QEoA3jZsNEyOX+liFeHRjqEhtDnxG5pEbLustDZJ6cKzwhizzY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=SPS87wIt; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="SPS87wIt"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-65c4152313fso18215971a12.1
        for <linux-tegra@vger.kernel.org>; Tue, 10 Mar 2026 08:08:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1773155333; x=1773760133; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZrhwHJgKfQunIbqKLgGEw/Kos9vy+e6R49GEIQjjeck=;
        b=SPS87wItf5UQpxDPxkRNfEwwBJR2MBJNzoKzucQ1P3Z9b6srBO3/GVVWIVnyVD4JZB
         iy1S1wmjPe5SNvcLXZyPSlL6US4soE4gW7Webmx6M9a0FaAwSZ5lnoItTxaeRbBQC7PF
         5le4eeh1ufNwfS+gPfNleH8lk+nhgUObtYkW4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773155333; x=1773760133;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZrhwHJgKfQunIbqKLgGEw/Kos9vy+e6R49GEIQjjeck=;
        b=HgX9sBYshdCLryIFwoXwmznHEpQDsViJHL7O2YlkjPqKYtHbVsLofwRhWbU+5sflwr
         JXpfrAEtMqAqcGTLSDXDTjeWnIS28tZNk+WvIiMije5AcPF6T1jvp0JfMcP5KxnwC9FN
         +4EIAdc3jCyvJWyWhnhpePp/hTD2/ZSbQcLEjedcOGlM1vH0mTm+O4BG24cwXj+CMRRZ
         OXRTrkNMF8x3TzOmw0kO2bEGPeorWhJ6A7fNTqnAOmpX/y1GWyQCUcs1A7tebpYT5ULl
         m0MHfMobxsAIizN7JpLJ57S7qkeGwffQO49sAM6KxalmjfAnp0uhkJEp1qXmzbJsVaqM
         zw3g==
X-Forwarded-Encrypted: i=1; AJvYcCW+xaTs9aWfGVDxyR7GL1eGnIgOFVQcRKL+iq5NUHrKbcanqWeOwBAtShOhEXLvw7/5i6VAbWtKUNUXSA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwLzppQNJN9Wd2/wdcXP1rIVhxQEZH0okbMqgkvMmA5OOrUsaXK
	7utarJG+HwhD2VMsZt5LlRobUp/mgUxgHv0Zu80CYohMeMtcWCTpAd5KNNfu17nNqT5CrFv/n9p
	yl2XD1qVN
X-Gm-Gg: ATEYQzxVuUtyeZxQnie+jLBPZrYV2O8Tvg9rIqfmypjW+C38DzXuTGoZtuJzKkfHXWR
	2JS4MZXd3LEYQPIkKpzkeumgiV9CeiQXeeWnz9gqE5Z/pZXAOgtmSyE6Pz4RtJc/tdxH1EbIp2T
	+q3JWkSrpEiLz8RWexHo/OVIxaB65OVD9mYnSQ7g/P+/jEbSipRtKzmx4/RlG/kiX/8kkpcQfOp
	DoMGNZrh+xCDy2BAOt/QKDz6NZJs8Fx/H194HabloPCNjURJXwMUlsM7mTu4rcWqtTttCbnc1ld
	66IMAahG9iPmAl5vsxUKqyPzT0y5ro3GAPGJ038GIgU73oO91EWZDuHkZZcmEOgyx6dDYBoOSOX
	3ICTzHIv/Z7Qtew37s/l/QWc7AfYcuBR3WS6Q7brhUhXAvB3QmihDV63O6BLv32z38C2Oz+TqyV
	glS/u3cunhvD6Bu2k1++huVTxUoUbUZPE8XBovGEmu2GRK8lvDi5gohi5IH2KHHA==
X-Received: by 2002:a17:907:e10c:b0:b96:dd06:8d9 with SMTP id a640c23a62f3a-b96dd061152mr376920866b.60.1773155332727;
        Tue, 10 Mar 2026 08:08:52 -0700 (PDT)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com. [209.85.128.52])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b96dbd03643sm375228066b.4.2026.03.10.08.08.50
        for <linux-tegra@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Mar 2026 08:08:51 -0700 (PDT)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4853c3c2fe7so14292345e9.0
        for <linux-tegra@vger.kernel.org>; Tue, 10 Mar 2026 08:08:50 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCV+XX147+JCll1ZwwLy29CmdDbch7ftkP8mO4qMx4SPNMsGBYdJUncJfNSQa5Imt65/YwHHG1BpPRAOGg==@vger.kernel.org
X-Received: by 2002:a05:600c:1d04:b0:47e:e7e5:ff32 with SMTP id
 5b1f17b1804b1-48526983292mr236479455e9.34.1773155329681; Tue, 10 Mar 2026
 08:08:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260216181002.3475421-1-dianders@chromium.org>
 <20260216100943.v3.1.I600d04c0553f5c5ba39c2f92201da313aedfe746@changeid> <CABb+yY2RKJgyNQ6789ua6s8C4tuOvhWqdcS16_4yU3AHjAiv_A@mail.gmail.com>
In-Reply-To: <CABb+yY2RKJgyNQ6789ua6s8C4tuOvhWqdcS16_4yU3AHjAiv_A@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 10 Mar 2026 08:08:38 -0700
X-Gmail-Original-Message-ID: <CAD=FV=U4te2V7MaOrQ8kSibLazqUy_Kv3ZcJyAAaCAiGWOY1Gw@mail.gmail.com>
X-Gm-Features: AaiRm51YHmAMmjPRIWQTSvpfsMBkAMaTT684zHe2XNjk21TEkEMaZPx6RHcKG9o
Message-ID: <CAD=FV=U4te2V7MaOrQ8kSibLazqUy_Kv3ZcJyAAaCAiGWOY1Gw@mail.gmail.com>
Subject: Re: [PATCH v3 01/15] mailbox: Deprecate NULL mbox messages; Introduce mbox_ring_doorbell()
To: Jassi Brar <jassisinghbrar@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Frank.Li@nxp.com, arm-scmi@vger.kernel.org, 
	cristian.marussi@arm.com, festevam@gmail.com, imx@lists.linux.dev, 
	jay.buddhabhatti@amd.com, jonathanh@nvidia.com, kernel@pengutronix.de, 
	konradybcio@kernel.org, krzk@kernel.org, lenb@kernel.org, 
	linux-acpi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-remoteproc@vger.kernel.org, linux-tegra@vger.kernel.org, 
	lucaswei@google.com, mathieu.poirier@linaro.org, michal.simek@amd.com, 
	nm@ti.com, rafael@kernel.org, robh@kernel.org, s.hauer@pengutronix.de, 
	shawn.guo@linaro.org, ssantosh@kernel.org, sudeep.holla@kernel.org, 
	tglx@kernel.org, thierry.reding@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Mar 9, 2026 at 8:24=E2=80=AFPM Jassi Brar <jassisinghbrar@gmail.com=
> wrote:
>
> Hi Doug,
>
> On Mon, Feb 16, 2026 at 12:11=E2=80=AFPM Douglas Anderson <dianders@chrom=
ium.org> wrote:
> > @@ -249,6 +255,28 @@ int mbox_send_message(struct mbox_chan *chan, void=
 *mssg)
> >         if (!chan || !chan->cl)
> >                 return -EINVAL;
> >
> > +       /*
> > +        * The mailbox core gets confused when mbox_send_message() is c=
alled
> > +        * with NULL messages since the code directly stores messages i=
n
> > +        * `active_req` and assumes that a NULL `active_req` means no r=
equest
> > +        * is active. This causes the core to call the mailbox controll=
er a
> > +        * second time even if the previous message hasn't finished and=
 also
> > +        * means the client's tx_done() callback will never be called. =
However,
> > +        * clients historically passed NULL anyway. Deprecate passing N=
ULL
> > +        * here by adding a warning.
> > +        *
> > +        * Clients who don't have a message should switch to using
> > +        * mbox_ring_doorbell(), which explicitly documents the immedia=
te
> > +        * sending of doorbells, the lack of txdone, and what happens i=
f you
> > +        * mix doorbells and normal messages.
> > +        *
> > +        * TODO: when it's certain that all clients have transitioned, =
consider
> > +        * changing this to return -EINVAL.
> > +        */
> > +       if (!mssg)
> > +               dev_warn_once(chan->mbox->dev,
> > +                             "NULL mbox messages are deprecated; use m=
box_ring_doorbell\n");
> > +
> Does this patchset leave some such clients out?  If not, should we
> drop this block and return -EINVAL already?

This patchset series got all the clients that were in mainline at the
time I last checked. However, it was unclear to me if all the patches
would all go through your tree or not, since they don't touch mailbox
drivers but the somewhat widespread places that were clients of
mailbox.

If all the patches aren't going through your tree, we'll need to keep
it like this until we can confirm all of the clients have been
updated. If all the patcheds are going through your tree, then we
could make it return -EINVAL right away, but it we'd have to do that
as a last patch in the series. I think it would still make sense for
the first patch (which adds the mbox_ring_doorbell() call) to have a
warning like this and then a final patch to switch to -EINVAL. That
keeps things bisectable.

What do you think?

I'm happy to post a patch atop my series that switches it to -EINVAL
and you can land it whenever you see fit. Would that work?

-Doug
