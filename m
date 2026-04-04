Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F1AE2DB7BF
	for <linux-tegra@vger.kernel.org>; Sat,  4 Apr 2026 12:44:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775306672; cv=none; b=BujF6hc1o3JSVuy1tMbYmsVsd6kzG5d9tY+A++CeEKYA8SviwQARr3cBbzwxhjVcdXF3UwJ/AxPtf+gj9p8h271uK2jxHc4adoE96V+/iOwkTYufryhWwmkbq6yZiRf3HAY+IJSkD2JeLXvme38Fqjy7251tGqfd7W62egUR8qY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775306672; c=relaxed/simple;
	bh=6x4+gdTKW6z5iGkG21DDDihOqybDWtH12NpDzzaC5ZI=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Y2kllAK0dDj8dmp+3RQjj1BTSNpVnGL8fkdK/YfppLlRK+c0xuBG+ULDInTSUnQSxnNa1bqyEzc581gVissxPlSm5yhGHatJcCMbJcETdImOkYjbUr50UwLq1XZR//pSdmgocTLmBvDnaeLaeGwsWqln89CjX95A0HItXhZX3KA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--joonwonkang.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=KjDDAt5k; arc=none smtp.client-ip=209.85.214.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--joonwonkang.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="KjDDAt5k"
Received: by mail-pl1-f202.google.com with SMTP id d9443c01a7336-2b2523e0299so71929265ad.3
        for <linux-tegra@vger.kernel.org>; Sat, 04 Apr 2026 05:44:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1775306671; x=1775911471; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=q1l0x4W+UvoXzUmEv9e5e/HxO0/QK/ip62Tt8sY3EdQ=;
        b=KjDDAt5kGR0Iuq0ShmJgU1XnUrSQJ5FwFnWfziq13bwtnVB/cmgvoslH9ulhtJ5I1v
         dQHuVgT2N/JAZttz+ofOadtku+MW9ZTQoYYmYwmCnYAupr3xZBfiU1yxm4fvUbSgrwnf
         5HCHX8optEwRaXmDDQ5OvgA5XQLUM185mL4meaWIyEj6juTDSWwoYZECBHsEAVZTgSYG
         8Qg/dFQmbvYljuP+ghE+GQz++KCtw91Zx6szxXmZikfnJ6rOytUil3ZGxuOm2lsqa0Rs
         dAgNIkQ+1fdosVhMPrSQoL4cpPamogRdawdWD4nAVqbwdR7DblRHjoLzCeN5XJEJQF53
         7Csw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775306671; x=1775911471;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=q1l0x4W+UvoXzUmEv9e5e/HxO0/QK/ip62Tt8sY3EdQ=;
        b=X8yzwNrYt/1LQWZ2XkxWBmo/5OdNgZWDa0kW7ITY6K7QOqZtq3yzQHq7t8sF41tEBr
         Vf4zPs2u4g0HgPjEEjgkS/WOig0oiAPi87veh2DTobgZtly8xKBwlyrAT9b/R+WIT/XM
         A6nLWH1RvE6v5KmdZ9/KlWSga/56DVAKxrbNYluBuhdRA38q1OSN/RH8DV841C7VFJ7A
         RAnPrUln0Q9UL61cL8iktbTzRAmc7sDXVfNNh0/23s3qaLxvxm57xwijtYhUCBh57P0e
         WB2seAnumnYuZGlKGHp4wSvTFsUk+NZDYE46ghvMxIikXF/yvZtK01/7/PowkEWjCybi
         /AWQ==
X-Forwarded-Encrypted: i=1; AJvYcCXw4QzehB8RgXVUFegPoyje+fscO6KztbV+XyKYUKMyEoXv2OX2GDI/a7cUqpvOmc1CdihybkeANIRkKQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxV3cTtBPPYvF2giyKY2ZmeBmfecVkdMFifqGffuXNahDHXnpRd
	L8JGjNTVnUUDGva5w2UBwrAUlzo5xFCaerVydipK4zjBuQ8VRR+V7nZ3CNRgwkP98lbYgwNRFIv
	ONtNqfaFCivcqdvPVEd6ogxqC8A==
X-Received: from plwg14.prod.google.com ([2002:a17:902:f74e:b0:2b0:5b0d:f4db])
 (user=joonwonkang job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:902:e748:b0:2b2:50bd:83b3 with SMTP id d9443c01a7336-2b281706f12mr64261875ad.10.1775306670477;
 Sat, 04 Apr 2026 05:44:30 -0700 (PDT)
Date: Sat,  4 Apr 2026 12:44:27 +0000
In-Reply-To: <CABb+yY0uDQh-3cadPQONV=NJKjMtc4mJekgjmHYVaHnfHXvGZQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <CABb+yY0uDQh-3cadPQONV=NJKjMtc4mJekgjmHYVaHnfHXvGZQ@mail.gmail.com>
X-Mailer: git-send-email 2.53.0.1213.gd9a14994de-goog
Message-ID: <20260404124428.3077670-1-joonwonkang@google.com>
Subject: Re: [PATCH v3 1/2] mailbox: Use per-thread completion to fix wrong
 completion order
From: Joonwon Kang <joonwonkang@google.com>
To: jassisinghbrar@gmail.com
Cc: angelogioacchino.delregno@collabora.com, jonathanh@nvidia.com, 
	joonwonkang@google.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	linux-tegra@vger.kernel.org, matthias.bgg@gmail.com, stable@vger.kernel.org, 
	thierry.reding@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

> On Fri, Apr 3, 2026 at 9:51=E2=80=AFAM Joonwon Kang <joonwonkang@google.c=
om> wrote:
> >
> > > On Thu, Apr 2, 2026 at 12:07=E2=80=AFPM Joonwon Kang <joonwonkang@goo=
gle.com> wrote:
> > > >
> > > > Previously, a sender thread in mbox_send_message() could be woken u=
p at
> > > > a wrong time in blocking mode. It is because there was only a singl=
e
> > > > completion for a channel whereas messages from multiple threads cou=
ld be
> > > > sent in any order; since the shared completion could be signalled i=
n any
> > > > order, it could wake up a wrong sender thread.
> > > >
> > > > This commit resolves the false wake-up issue with the following cha=
nges:
> > > > - Completions are created just as many as the number of concurrent =
sender
> > > >   threads
> > > > - A completion is created on a sender thread's stack
> > > > - Each slot of the message queue, i.e. `msg_data`, contains a point=
er to
> > > >   its target completion
> > > > - tx_tick() signals the completion of the currently active slot of =
the
> > > >   message queue
> > > >
> > > I think I reviewed it already or is this happening on
> > > one-channel-one-client usage? Because mailbox api does not support
> > > channels shared among multiple clients.
> >
> > Yes, this patch is handling the one-channel-one-client usage but when t=
hat
> > single channel is shared between multiple threads.
>=20
> hmm.... how is this not single-channel-multiple-clients ?
> A channel is returned as an opaque token to the clients, if that
> client shares that with other threads - they will race.

They will race because of the current blocking mode implementation. With th=
is
patch, they should not race as it handles the known racing point. So, I thi=
nk
it will be important to decide whether to support multi-threads in blocking
mode or not.

> It is the job of the original client to serialize its threads' access
> to the channel.

I can see the disparity with the non-blocking mode here. Currently, the cli=
ent
does not need to serialize its threads' access to the channel in non-blocki=
ng
mode whereas it needs to in blocking mode. It would be nice if the client d=
oes
not need to in both modes, but it may also depend on the necessity as you s=
aid.

> > From my understanding, the
> > discussion back then ended with how to circumvent the issue rather than=
 whether
> > we will eventually solve this in the mailbox framework or not, and if y=
es, how
> > we will, and if not, why.
>=20
> It will be interesting to see how many current clients actually need
> to share channels. If there are enough, it makes sense to implement
> some helper api
> on top of existing code, instead of changing its nature totally.

I agree that we may need research on the current uses of channels and the
necessity of shared channels. However, it may require non-trivial amount of
time since it requires thorough understanding of the context of every clien=
t
driver. At this point, I think we at least need a clear documentation in te=
rms
of multi-threads support as we have none now. Since it is obvious that
multi-threads is not supported for now, I can create another patch to add t=
his
to the API doc to be clear. How do you think?

Thanks,
Joonwon Kang
