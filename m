Received: from mail-pf1-f202.google.com (mail-pf1-f202.google.com [209.85.210.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35B2130EF64
	for <linux-tegra@vger.kernel.org>; Fri, 17 Apr 2026 08:41:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776415299; cv=none; b=oBtHuxfrRWeO+NEayX95Oi6J7ke4ZcPxyGjUrKIAxuQx+CFVVVKppNiKWm+cwbeF5NacM23jAZf3krzoQepCDkYKG3iGDEN9yADZxoOkFlTYh4w3uj0CRICDooty9//Gy3JQnQ9xeHZLCERQOTzvAsBsB7rS9nuJy/2xe17r+xI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776415299; c=relaxed/simple;
	bh=E4ApuJ8oAQ/4OyUGknCmHnGsjWagqHfRqgj6PgH/Fjw=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=VJ6k/AlyLPUb+tVmqG0MSy9eIi0rnzYoyoIPs+14nu2+YSJ0X9vpymweUu73tG2eWFyRnq4FyicXcuU+D5rpOzUGAsLgKNLA+YNK3/8oCEolwOsqAW0w85o1bfzG18r0XqYpKKsQk+B2KG7UPCy54wKVv25vnySlR4fBVA5ReG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--joonwonkang.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=VPtiNvtx; arc=none smtp.client-ip=209.85.210.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--joonwonkang.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="VPtiNvtx"
Received: by mail-pf1-f202.google.com with SMTP id d2e1a72fcca58-82f45dadbe6so771878b3a.1
        for <linux-tegra@vger.kernel.org>; Fri, 17 Apr 2026 01:41:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1776415298; x=1777020098; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6+m189FrlHvlQluxfIKHyqtB0jWSsQDaVuzIa8Tqb+g=;
        b=VPtiNvtxlhTld4KTRwyn3zfZ48SN7eQnx8xsI5BEKgwZHkh+sCfCmX4sQTgSD7FeFn
         eUt41UiEl6b1sNxDTsOPCTxyg+miTJEpAJ++9wGhDDC2/A/FHz96Izq/a+a8V2M7Ylhp
         Cw2bHkX7+c7WRnOnA3zSrQ6QWHAHSRQCMRMYBvdHKlXxCcQZV2+Iz1J4C1Hxoz9zeFZb
         UineVWRm8i9yq6KbIZLmbrDuty69bvM56kiV0UFlOowJQqZf1Q/LbbHDWyjG90s0cylR
         0C70B7O0RzQu9mWKS0RWk6AXk0Pmx15lYQ/SsDlCL5shf+Zvdw/ZPkdYIWJqcK5Xf3da
         EaUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776415298; x=1777020098;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=6+m189FrlHvlQluxfIKHyqtB0jWSsQDaVuzIa8Tqb+g=;
        b=dSPPosll8eg06bDWDdORjoTs/4hNRmdwHR/3uxhw/uiFTmsjQ2Efd9G0bXMxWdZH7a
         4L8ElCksAHfK2XcqV3iy+9RtRyMuP7Yf+gfCaVBFaXsaXVUNgkiuSTbL0Ta4jMIEYyNm
         5RogTQW8rvzu/MwOG8POMdZi3Y8ZVV7KkyJf42HPLe+bEmROtf+VLO0788HTuMOftDAg
         Ku223ExK6BXtFxJCGiAPuHQyHZOnG35/uJoGqvlymSpb1nzTmYjhmWwVw3ipnTtr2ppl
         7SX4kzxRJLoep3a2aJfSVSQlxuSDqv5tqTpGWF5uTcN9aA6fILPwkVhcs/2orOYkDBVr
         0aPA==
X-Forwarded-Encrypted: i=1; AFNElJ8u1yMP13wXGj1gaW2nAsncPILiHgn1HOoyp/42eQWNa3VHAn483rD+zMr8/37FxlJ0shXgdzRAz3ipsw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzdWppMqsFr2iDO3DMY3MIG49vAiViIuMbpT2DHXs86zOlf+BGb
	qLVKy0U/KrhfBfnsW/Fi9ft7PEyvsU6FA0he0GbgUaHexxnNuBqnl9TXw9fBjXsxJnRcLgz440H
	pRGZxIBjnFtgmLUsYYwCgAgFa2w==
X-Received: from pfblu1.prod.google.com ([2002:a05:6a00:7481:b0:82f:24a1:2b5a])
 (user=joonwonkang job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a00:3cc6:b0:82f:111:61d3 with SMTP id d2e1a72fcca58-82f8c970802mr2065492b3a.44.1776415297277;
 Fri, 17 Apr 2026 01:41:37 -0700 (PDT)
Date: Fri, 17 Apr 2026 08:41:34 +0000
In-Reply-To: <CABb+yY0uDQh-3cadPQONV=NJKjMtc4mJekgjmHYVaHnfHXvGZQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <CABb+yY0uDQh-3cadPQONV=NJKjMtc4mJekgjmHYVaHnfHXvGZQ@mail.gmail.com>
X-Mailer: git-send-email 2.54.0.rc1.555.g9c883467ad-goog
Message-ID: <20260417084135.2091007-1-joonwonkang@google.com>
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
> It is the job of the original client to serialize its threads' access
> to the channel.
>=20
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
>=20
> Thanks
> Jassi

Hi Jassi, can we continue discussing this matter? We can start from the rec=
ent
comments from me.

Thanks,
Joonwon Kang
