Received: from mail-pg1-f202.google.com (mail-pg1-f202.google.com [209.85.215.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93A9D29B799
	for <linux-tegra@vger.kernel.org>; Sat, 18 Apr 2026 03:39:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776483544; cv=none; b=H1PZdgtuj+bu5vWVhVJ6F1dRFc40SjgeXUNpO9UfkHphgWVzjqT2hrF9IQX8lS4wO1Yt/3M0D8n+f05dCIsRz3CzNe2jR5Yq8BytrEUT+Yab/eEuN9KQxO6hCSoabno0ChtdWzhLiUJckrDqxk5xgTl3DEDp62Y/SQ8noBYLrBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776483544; c=relaxed/simple;
	bh=G+ETtzwm86y2ubyHKvTZyBSdg3SjvxcOgxe973ohm5w=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=DXxF+BFUPoZQc/PUBf1t0dt6Rj63Yphoiwf22QFJVe+MVIQP6yn+20Dczly1vPnjCrDo3a6pfjSC2E9WA8vzLy5gV/F6cOEAJjhudiZ7DBQqV+3gTVZeuNFIOjtcpyN33YFaQOrtLLwkGUDiTuL0t2/tryXakxx8VPSNRG0TPKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--joonwonkang.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=KfubM8NL; arc=none smtp.client-ip=209.85.215.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--joonwonkang.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="KfubM8NL"
Received: by mail-pg1-f202.google.com with SMTP id 41be03b00d2f7-c794d89a715so672740a12.1
        for <linux-tegra@vger.kernel.org>; Fri, 17 Apr 2026 20:39:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1776483543; x=1777088343; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=G+ETtzwm86y2ubyHKvTZyBSdg3SjvxcOgxe973ohm5w=;
        b=KfubM8NLzlZlE1wq7b54dcvzl18ZF7uGnCXD2jDdg+S6Q/FeyVOGdhHlZGzau8vvRT
         tjNNxAK3xJX3jCxT9b9jI2muzv+DicnnU9+0tEOVGxs4hDRdJKnRL6wuPMkr8oN8guSP
         9MbTx54IduTxAaemmh2OHi9Cs8GVtWH3j4k527Mf9mU41xdav35yRf0dhmxj4DCvdvy/
         ILySRynBjfhybtb1iK7AoTLkl3JisShlzs6bmEWL47n8/H/eY1xGLG0SlZIWgW2jgCYI
         V6pySQz9k/FuGoUliD1n2mtNF9verKkDKIv8vYgACs7g1VAyXetA1ksy+2kylp9YIbBI
         yxbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776483543; x=1777088343;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=G+ETtzwm86y2ubyHKvTZyBSdg3SjvxcOgxe973ohm5w=;
        b=AD1JF7o7RYBSOlHYILKzdZaE18A9a0ztdkRWggz7uCKrNZxZnQjc6WTixnCjWyIO/S
         YOVyrG1ILnNzX9y/C1y71dHsTJfHDM12863+aLnRG8BDQHU/suiw53khlsXGfXmojWaX
         YO8s+sxHWygqRW7XLQiXmBfaVqdnj2UYR/cvspchnLayfM6njaBucjMeHkmPzjkkpZGV
         8ARHWFDN0UWxeqYlyXvqgRBVEYHuPo0p5n4aOOTDV8M9iUrUrGECV1thpTSQUziatFOq
         dBHJZYMe4YIy7gVBj4pV3mvFil9WpM7Q4YX12Ey26qhMgN22bB11bOyPOsoGGB8iBrkp
         tl5Q==
X-Forwarded-Encrypted: i=1; AFNElJ8TfcWio6hq8nQ9BxDD9pFgBFbkmnWf7sA70V5/KoWqnCBP+3+T+vRACzzNFjoP9oBEFxTTpA93bhNtWQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8HmiZqYLFKnJn0qqXXvv3UdsCIUjWoZOfvwgOpmdKmxmzfya9
	2S4Ti4b0HIwo7e8UVwTkY7P4H1ALeg7FuMCpCI6RQ+p80ObK5llBJiWq6p7X6R2tWHUis/IG8iG
	A31t1rECp+7HLQKqi9emCCSFxsw==
X-Received: from pgbfp6.prod.google.com ([2002:a05:6a02:2ce6:b0:c76:a6b1:ed23])
 (user=joonwonkang job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6300:8088:b0:39f:216:f400 with SMTP id adf61e73a8af0-3a08d708cc3mr4939472637.14.1776483542721;
 Fri, 17 Apr 2026 20:39:02 -0700 (PDT)
Date: Sat, 18 Apr 2026 03:38:59 +0000
In-Reply-To: <CABb+yY2yBZ+hgr-=Uh_sRk-TJZRfsk2AYtoS5rPtUN8kVsUScA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <CABb+yY2yBZ+hgr-=Uh_sRk-TJZRfsk2AYtoS5rPtUN8kVsUScA@mail.gmail.com>
X-Mailer: git-send-email 2.54.0.rc1.555.g9c883467ad-goog
Message-ID: <20260418033900.3652042-1-joonwonkang@google.com>
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

> On Fri, Apr 17, 2026 at 3:43=E2=80=AFAM Joonwon Kang <joonwonkang@google.=
com> wrote:
> >
> > > On Fri, Apr 3, 2026 at 10:19=E2=80=AFAM Joonwon Kang <joonwonkang@goo=
gle.com> wrote:
> > > >
> > > > > On Thu, Apr 2, 2026 at 12:07=E2=80=AFPM Joonwon Kang <joonwonkang=
@google.com> wrote:
> > > > > >
> > > > > > When the mailbox controller failed transmitting message, the er=
ror code
> > > > > > was only passed to the client's tx done handler and not to
> > > > > > mbox_send_message(). For this reason, the function could return=
 a false
> > > > > > success. This commit resolves the issue by introducing the tx s=
tatus and
> > > > > > checking it before mbox_send_message() returns.
> > > > > >
> > > > > Can you please share the scenario when this becomes necessary? Th=
is
> > > > > can potentially change the ground underneath some clients, so we =
have
> > > > > to be sure this is really useful.
> > > >
> > > > I would say the problem here is generic enough to apply to all the =
cases where
> > > > the send result needs to be checked. Since the return value of the =
send API is
> > > > not the real send result, any users who believe that this blocking =
send API
> > > > will return the real send result could fall for that. For example, =
users may
> > > > think the send was successful even though it was not actually. I be=
lieve it is
> > > > uncommon that users have to register a callback solely to get the s=
end result
> > > > even though they are using the blocking send API already. Also, I g=
uess there
> > > > is no special reason why only the mailbox send API should work this=
 way among
> > > > other typical blocking send APIs. For these reasons, this patch mak=
es the send
> > > > API return the real send result. This way, users will not need to r=
egister the
> > > > redundant callback and I think the return value will align with the=
ir common
> > > > expectation.
> > > >
> > > Clients submit a message into the Mailbox subsystem to be sent out to
> > > the remote side which can happen immediately or later.
> > > If submission fails, clients get immediately notified. If transmissio=
n
> > > fails (which is now internal to the subsystem) it is reported to the
> > > client by a callback.
> > > If the API was called mbox_submit_message (which it actually is)
> > > instead of mbox_send_message, there would be no confusion.
> > > We can argue how good/bad the current implementation is, but the fact
> > > is that it is here. And I am reluctant to cause churn without good
> > > reason.
> > > Again, as I said, any, _legal_, setup scenario will help me come over
> > > my reluctance.
> > >
> > > Thanks
> > > Jassi
> >
> > Hi Jassi, can we continue discussing this issue from where we left off =
last
> > time?
> >
> Long passionate essays are difficult to read, so I haven't yet. A
> simple description of some setup that you think is not supported, will
> keep the discussion focused.
> If your platform is supported but you think the api is not clear,
> updates to the documentation are welcome

Sorry that it was hard for you to read. The long form was to explain what i=
s
misaligned and problematic with data and examples for better understanding
because your previous long essays did not make much sense to me. Please go
through it and let me know if anything is unclear to you. In the mean time,=
 I
will prepare a new version of patch with some update to the API doc.

Thanks,
Joonwon Kang
