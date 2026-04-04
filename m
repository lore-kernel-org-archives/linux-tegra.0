Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 182913321C2
	for <linux-tegra@vger.kernel.org>; Sat,  4 Apr 2026 11:47:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775303276; cv=none; b=kjB0pNhA7KsgNj2r6/74JR0ql7yW8ZIVz4P6EYWUdJR9V8i0X4hik7aPz3sD7sk3Wn56ceDI4/w+bxLBwNhFaAnRb2YClWS/eCfKnlbdDjpyvIDQM3zFeK1XrEICHN/KhrEAKI1n2T+Rr0XUVNxb8piwZhSOvjH+9R0nBEgi0Rc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775303276; c=relaxed/simple;
	bh=dy8yhJzNiwRlEiywyAKmr/JdveTelkXEUEII/JcVTvg=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=PthxqE3izVaM8IhZqydGLPaYbFQ1eMz8MSGdzHytu2J4UlN7eWeYskN8Lk5uRK9UpV2dPcbR+ZJzRec3+jlFO8Ex5zs9xl+/QSmk+vZYUBuMNc82H22kzaO3ZnCXkYiJcbArJzabCqI+Mo9BSZSGA3ygBbiBv6O8Ud0ZOfv1qE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--joonwonkang.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Lw1ACzpA; arc=none smtp.client-ip=209.85.214.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--joonwonkang.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Lw1ACzpA"
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-2b2489af602so24774395ad.1
        for <linux-tegra@vger.kernel.org>; Sat, 04 Apr 2026 04:47:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1775303274; x=1775908074; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0G1qQkwBhPOCSaPNNZcA5R2UExCpSWly+t1LnZq/nHI=;
        b=Lw1ACzpA7Y04E5a02q/Lc+FpOJdES0g9AoMhVBD0F9O5X2i0ymnCTtrb0Na9hQ27EW
         xMn2GCo/I4S2sTh1Y8xEy8TsNe6bl4UF3OmJM7zKVW+M1cXapWkuSjHogwrWxGZiJ1MG
         QXlG86Lt59FBoLGe88LAO5aOnS0v1JliuysHmnQlqccR1Y4lX1D0ZS2T2ngptzZM8kOi
         OBWho+ReIq5Kpz8sCvYq28DRf80xt3hjftZ/vvquJoRWPBsHf/XIvRqGRyPBt5bVP0Cc
         cPH0kJmn336XUeyeoMcWRKiTffbhbZDvIxhIqLCRct+9FQGX7jr+IDm/qpLq8XgyVdXf
         GWhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775303274; x=1775908074;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=0G1qQkwBhPOCSaPNNZcA5R2UExCpSWly+t1LnZq/nHI=;
        b=FkOiUIRRVE6Pc7jrwYZkoU5ZCnmv0c7IEdX02L1syqdGkR2Ykt3r7cfPz6pqyhGFQJ
         2oLG6NHaptCyEdXnkygdpLb/TE+OQXyREuGtm5WGZvCvjrv2hG3nq7SwgV3Rb48eXLnt
         Rj7aLWNYkAq2XcA61SCqt//uK8/CcmWtU39SL09P9D4y8GpkzbcP5JJILaBMqViOslW+
         JQwXG5gL4za87J73ZE+KrDDk8lIkJZ5DlU6tcAGqxD3jfoObjLZSdBHApQrS5Cpu9DxJ
         W4+y3fB/qL2vVMdDFQXSfGM2JRlKZWlsZtjTzLQC0mQifqt54mZC3jYbeG1d+654JewT
         GgMw==
X-Forwarded-Encrypted: i=1; AJvYcCWk6mdDiP47uS53AzoW6J7iWBXH5oSCwM7NvWuOEv3aFxecHe7tABWH3QO6ZpscIGuQjaHlAPfDWtKr0g==@vger.kernel.org
X-Gm-Message-State: AOJu0YyZRKbqx/NxohjHdu+H9iCX6yh4U1KqntefDci3QNs4i/5jlCF+
	hs1UMFkZKAL1VqQaoNzO1/z3PVrZ0HPxlds7h/eGZPHVutS33tAgIflkcpF3IEdiZ6v+v9xCz2V
	350plO6/Y7MOy2HV3pBxNoWfrog==
X-Received: from plbjz3.prod.google.com ([2002:a17:903:4303:b0:2b0:6207:5fd3])
 (user=joonwonkang job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:903:2ec8:b0:2b0:aebe:259 with SMTP id d9443c01a7336-2b2821a7fbemr58943675ad.19.1775303273972;
 Sat, 04 Apr 2026 04:47:53 -0700 (PDT)
Date: Sat,  4 Apr 2026 11:47:51 +0000
In-Reply-To: <CABb+yY23aTXeXu6G-8sHjw32DCqmhsJLu2Mt-txenOgTBiyv+A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <CABb+yY23aTXeXu6G-8sHjw32DCqmhsJLu2Mt-txenOgTBiyv+A@mail.gmail.com>
X-Mailer: git-send-email 2.53.0.1213.gd9a14994de-goog
Message-ID: <20260404114752.3052748-1-joonwonkang@google.com>
Subject: Re: [PATCH v3 2/2] mailbox: Make mbox_send_message() return error
 code when tx fails
From: Joonwon Kang <joonwonkang@google.com>
To: jassisinghbrar@gmail.com
Cc: akpm@linux-foundation.org, angelogioacchino.delregno@collabora.com, 
	jonathanh@nvidia.com, joonwonkang@google.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-tegra@vger.kernel.org, 
	matthias.bgg@gmail.com, stable@vger.kernel.org, thierry.reding@gmail.com, 
	lee@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

> On Fri, Apr 3, 2026 at 10:19=E2=80=AFAM Joonwon Kang <joonwonkang@google.=
com> wrote:
> >
> > > On Thu, Apr 2, 2026 at 12:07=E2=80=AFPM Joonwon Kang <joonwonkang@goo=
gle.com> wrote:
> > > >
> > > > When the mailbox controller failed transmitting message, the error =
code
> > > > was only passed to the client's tx done handler and not to
> > > > mbox_send_message(). For this reason, the function could return a f=
alse
> > > > success. This commit resolves the issue by introducing the tx statu=
s and
> > > > checking it before mbox_send_message() returns.
> > > >
> > > Can you please share the scenario when this becomes necessary? This
> > > can potentially change the ground underneath some clients, so we have
> > > to be sure this is really useful.
> >
> > I would say the problem here is generic enough to apply to all the case=
s where
> > the send result needs to be checked. Since the return value of the send=
 API is
> > not the real send result, any users who believe that this blocking send=
 API
> > will return the real send result could fall for that. For example, user=
s may
> > think the send was successful even though it was not actually. I believ=
e it is
> > uncommon that users have to register a callback solely to get the send =
result
> > even though they are using the blocking send API already. Also, I guess=
 there
> > is no special reason why only the mailbox send API should work this way=
 among
> > other typical blocking send APIs. For these reasons, this patch makes t=
he send
> > API return the real send result. This way, users will not need to regis=
ter the
> > redundant callback and I think the return value will align with their c=
ommon
> > expectation.
> >
> Clients submit a message into the Mailbox subsystem to be sent out to
> the remote side which can happen immediately or later.
> If submission fails, clients get immediately notified. If transmission
> fails (which is now internal to the subsystem) it is reported to the
> client by a callback.
> If the API was called mbox_submit_message (which it actually is)
> instead of mbox_send_message, there would be no confusion.
> We can argue how good/bad the current implementation is, but the fact
> is that it is here. And I am reluctant to cause churn without good
> reason.
> Again, as I said, any, _legal_, setup scenario will help me come over
> my reluctance.

mbox_send_message() in blocking mode is not only for submitting the message=
 in
the first place if we read through the API docs.

From the API doc for `mbox_send_message()`:
```
 * If the client had set 'tx_block', the call will return
 * either when the remote receives the data or when 'tx_tout' millisecs
 * run out.
```

From the API doc for `struct mbox_client`:
```
 * @tx_block:		If the mbox_send_message should block until data is
 *			transmitted.
```

With the docs, I think it is apparent that the API covers "transmission" of=
 the
message, not only submission of it. If sumbitting is the sole purpose of th=
e
API, what does the API block for in the first place? We would not need the
blocking mode at all then.

The current return value of the API in failure cases is as follows:

 - When submission fails, returns failure.
 - When submission succeeds but timeout occurs during transmission, return
   failure, i.e. -ETIME.
 - When submission succeeds but transmission fails without timeout, return
   success.

The third case looks problematic. This patch is focusing on this. There is =
also
disparity to handle the failure between timeout(the second case) and
non-timeout(the third case). Why does it not return failure when non-timeou=
t
error occurs during transmission whereas it does when timeout occurs during
transmission? If the API is solely for submission, why does it return failu=
re
instead of success in the second case?

In the third case, the controller(or the client) will inform the mailbox co=
re
of the transmission failure. Then, why not return that failure as a return
value of the API despite having this information in the core?

An alternative to fixing this issue would be adding the API doc by saying l=
ike:

 - In blocking mode, the send API will return -ETIME when timeout occurs du=
ring
   transmission, but it will not return failure but success(since submissio=
n
   itself was successful before transmission) when other errors occur durin=
g
   transmission. Users have to register a callback to collect the error cod=
e
   when non-timeout error occurs.

But, I think we can go away with this unnecessary confusion by fixing the A=
PI
just to return the error code when error occurs regardless of whether it is
timeout or not. Then, we could simply say:

 - In blocking mode, the send API will return failure when error occurs.

Since this patch is pointing out this anomaly of the send API's behavior, I
am not sure what scenario we would need more. In other words, the current w=
ay
of working would be more surprising to the users than the fixed version of =
it
as it was when I found out this issue for the first time.

Do you think that this change will cause any other problem on the client si=
de
than fixing the existing issue? If not, I am wondering why not go fix the
issue with this patch.

Thanks,
Joonwon Kang
