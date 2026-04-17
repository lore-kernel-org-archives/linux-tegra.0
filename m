Received: from mail-pg1-f202.google.com (mail-pg1-f202.google.com [209.85.215.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1630D3750B2
	for <linux-tegra@vger.kernel.org>; Fri, 17 Apr 2026 08:43:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776415419; cv=none; b=gLOkYu4hhrZhA+Gww6ROjzxorZPlWizeXru5HpaDsKfciD2z0bxwS/dQcAlDM+jL9pXOOFYWwRZ9Ca3jXxl7wDiI1q9ioBFwgviTEO8U6ko0QeZZStbdFSPisuiC9HRfLVtrKMzTpX938/DbCrQTok7oS9k5uiOG2TBwUMTA9uw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776415419; c=relaxed/simple;
	bh=JMis1PWBmQ2nY0YUn8Z/PvKMUmrRKtNhJv6gZchAt+s=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=RN0bfosDj9BN/CnSk1cpNodrawFAoA2ngK3B/mAsqwu4JqlCNjb8ubdccZKFmbiWcHEmPl+ldi0LoXG7ZV4iJ3r1iitR0iaiC3+pThGG0yPHvx19hzY8xE9cWJMCPXwiBHIZcJKQuWBesj972KPv5XFgV427z4/ozYso7Tbx8o8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--joonwonkang.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=P2xJ8+9J; arc=none smtp.client-ip=209.85.215.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--joonwonkang.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="P2xJ8+9J"
Received: by mail-pg1-f202.google.com with SMTP id 41be03b00d2f7-c76cb2dce57so341291a12.1
        for <linux-tegra@vger.kernel.org>; Fri, 17 Apr 2026 01:43:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1776415417; x=1777020217; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JMis1PWBmQ2nY0YUn8Z/PvKMUmrRKtNhJv6gZchAt+s=;
        b=P2xJ8+9JXzms47E7PWeEjYeToPBvwMRXGyKfHzmfYyGc6TwOQd2VayFrCaTBTPj29s
         eWAU3Po7LtrjsUKyGb+y/sS/xxPXyWdkiHeTo52eUARxn9VipLo9fflZ+aVuzzL5ZrEl
         8gcNZXITxXe/dhET0V9VrmV0m0pJCwVbi51T9SeWsdYqw/HKIOeEeVU1a7o2AS/+/FEX
         GTVjg7s/xFVvvQltrwqdROTZyQFQCjIMmAlqqOUGvE1sUNDndlt9jrS/a47Aorxnjs82
         fzuQAJLqFv4iZEZ4Ouod0rrjPOcPKJxcCLHXBYK4sZrrL2peB4mmFD3xnCS705KQQKuH
         ALpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776415417; x=1777020217;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=JMis1PWBmQ2nY0YUn8Z/PvKMUmrRKtNhJv6gZchAt+s=;
        b=VJzNwI3S9ZGih5zEyuVXpeGxj4sP2DS8Z9CY/xoQAOe52vRjGuo7Ww+dr/bpUvB0oC
         JKjG769M5awZQpD6bKwMEJh5wUtvF6SoLtjI24okLZihEPit9Mzbwi2tw0YG9RpQrrpS
         jUANvZhqzsrspkf1f7+HtqmdNFsT/s3ORvzUKkOi4W3RT0jj5OLW+B3zgftAO2425bta
         l1YABdTyjwS3eHzALfMu2LvVtiU8ODBZuMCCs+mEYCTooK0fJGexiE3GBd7II2yK+i00
         TpI7Hb/lIhlJXcoKy5NaO6WNt1DmgN91PUnj8Syy1hrllJAXcFjspdzr+sGhlTsS/zHw
         YKRQ==
X-Forwarded-Encrypted: i=1; AFNElJ8QR/ASZ4gWwHqclM6GevzVnSfEL99uRcg37ngPaO7L/Ucm6cABGS8IS9ARsgngfyg0oO1oo9xAHuUE4A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5MA/pgB6BpWNSnHKwm1DXmra2lyyHc/70quvdp2+Z54JeofZw
	7GGYkjygMpGkl/MJVA9p/Ae+HIqtI56zvYo02MCcxyWvR8GGv0ogQosgqxBWYzDF5HzfDIEXdOu
	lajyoAFcB4KGeviJyOjgdhRXJZg==
X-Received: from pfhx21.prod.google.com ([2002:a05:6a00:1895:b0:82f:7163:35c4])
 (user=joonwonkang job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a00:a248:b0:82f:316:3208 with SMTP id d2e1a72fcca58-82f8c8fb879mr1813947b3a.29.1776415417107;
 Fri, 17 Apr 2026 01:43:37 -0700 (PDT)
Date: Fri, 17 Apr 2026 08:43:34 +0000
In-Reply-To: <CABb+yY23aTXeXu6G-8sHjw32DCqmhsJLu2Mt-txenOgTBiyv+A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <CABb+yY23aTXeXu6G-8sHjw32DCqmhsJLu2Mt-txenOgTBiyv+A@mail.gmail.com>
X-Mailer: git-send-email 2.54.0.rc1.555.g9c883467ad-goog
Message-ID: <20260417084335.2092188-1-joonwonkang@google.com>
Subject: Re: [PATCH v3 2/2] mailbox: Make mbox_send_message() return error
 code when tx fails
From: Joonwon Kang <joonwonkang@google.com>
To: jassisinghbrar@gmail.com
Cc: akpm@linux-foundation.org, angelogioacchino.delregno@collabora.com, 
	jonathanh@nvidia.com, joonwonkang@google.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-tegra@vger.kernel.org, 
	matthias.bgg@gmail.com, stable@vger.kernel.org, thierry.reding@gmail.com
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
>=20
> Thanks
> Jassi

Hi Jassi, can we continue discussing this issue from where we left off last
time?

Thanks,
Joonwon Kang
