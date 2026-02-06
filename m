Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DB6C30FC1B
	for <linux-tegra@vger.kernel.org>; Fri,  6 Feb 2026 10:02:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770372141; cv=none; b=O7EQXEm6ZDAcvu4WsY1iPuuDqWqQio6pOhcNSDIsoDWA8/iLgk8QF2IEAQvP8Y+uqAXUf6JKw4LlOU+hLC4xs+pcmYCBgjsP42zY925nIWSWiVq59VWHUsx16NSjzjaiiGezLOx3zf3zYnLymmGynhMoio/qG+T/qBqkghXLw2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770372141; c=relaxed/simple;
	bh=8T6OtLRymPVfCIUBMcoeVSXu87Rl1DjP1XQL/Jy/Qz0=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Z2J4mYJHyNLIFLNH6nd6y13SGra3ZN4vjwRM9dLfpv6Lhk8EUAD6x784Wy5doRTl+OijdVTyuYs5S48YTH69HMGC5nRIVOyTgwUYx9u511YWBg+FAOHivhl55S9axWavDnOiQ4RGH/00ipFq6Gm/HELMGkEYAfbsnWACMlRd6UY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--joonwonkang.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=0cNdDJ/t; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--joonwonkang.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="0cNdDJ/t"
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-354bc535546so86865a91.3
        for <linux-tegra@vger.kernel.org>; Fri, 06 Feb 2026 02:02:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1770372141; x=1770976941; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=zt0Gi8eng1ewWpbYcR2xwSSE4Oxk3JAUhhCfKODhyE4=;
        b=0cNdDJ/trXbMJOD7OCyoZXr6/dSf8yhMQnoP8BMnaUaNeJTQ4Pre5i8MtaBg8/n5qc
         /MamlF5X9/UYTXscT/SGsyTM6BMwKE09FmJClYR8MLrnzvq+a/CQOK1Uy9oVOpjzIfJ1
         V+QXt4uiw/JDLlSvrOdnfu4eEAHlykasIXJawWqtFBiSCEX/+PP9Fd2/+ncEkUD6+1m4
         wDd5vZtPhpgYKPxrjkNl90TwwO/VJhmNn/PhMPX9bOhwtBAqyDfU5jcxTTtHBD685DMU
         41yOaW9C1dgb6ZXK/Dd1hl7F2h+On7KuqyfYqWBhFA3YMFclmwpGZocqSlWyVnZ/rL2S
         Wvkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770372141; x=1770976941;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zt0Gi8eng1ewWpbYcR2xwSSE4Oxk3JAUhhCfKODhyE4=;
        b=QH42JZmBshB7KxKJUxChb/6H88EH65LA7Ou8sk8Wz+prY1I7FmJWCakTJbNOgqJ1Uv
         vRExcauQ59+0boTRujJQMAEt3tY9Hd2cd8V9XyG4uNVpZj4YgaNpMLkKVVH+ZaKUNaG6
         SwV+drl6RLcZL0G95Uy1fKc4eiTJ0I27DW6q4r2YZWBNaGs/GKk7nwj6ImPHwtoPwS6q
         8kuLyf3Vp5c10PAyLUGS6bKkGWpYsTAnx5p9kqX8I010VQhcod6bWzHmV9wVH0oG/UeA
         Q4oHxaCCSZAJkCie8CE1FmmmJMld+hoLDn/VxYYwkuRBDmvZjvfkkJVvKT9X0OE7AEFy
         61/Q==
X-Forwarded-Encrypted: i=1; AJvYcCUS7Vz0H7n2UGZyP9armZ/deCs60CZ1Sv6aGXKTw7SgterBtpLpSd0gTYMa6yCItN0lqHyrT2wUxwDGpQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwEvycy86x7GPyF7H+SeKc24lTH9snSHV1VaDT2XlpigYDS2gXT
	J8ChKGnaiZugIDxRrPqWefPCEV3gSon6XkSLBmnDYh+gS4jan9BZb9w7EjlnXXuGjuAUKjJia8/
	AQmaeLtwx9Vl5RX+50RttiAGD/A==
X-Received: from pjbqx13.prod.google.com ([2002:a17:90b:3e4d:b0:34e:795d:fe31])
 (user=joonwonkang job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:350d:b0:34e:5516:6655 with SMTP id 98e67ed59e1d1-354b3c5bb83mr1709576a91.9.1770372140784;
 Fri, 06 Feb 2026 02:02:20 -0800 (PST)
Date: Fri,  6 Feb 2026 10:02:18 +0000
In-Reply-To: <CABb+yY39rhTZbtA21MecYk-R9fh7VQQr5kZUgCw4z92mWhZ1Rg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <CABb+yY39rhTZbtA21MecYk-R9fh7VQQr5kZUgCw4z92mWhZ1Rg@mail.gmail.com>
X-Mailer: git-send-email 2.53.0.rc2.204.g2597b5adb4-goog
Message-ID: <20260206100218.4163478-1-joonwonkang@google.com>
Subject: Re: [PATCH 1/2 RESEND] mailbox: Use per-thread completion to fix
From: Joonwon Kang <joonwonkang@google.com>
To: jassisinghbrar@gmail.com
Cc: alexey.klimov@arm.com, jonathanh@nvidia.com, joonwonkang@google.com, 
	linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, 
	stable@vger.kernel.org, sudeep.holla@arm.com, thierry.reding@gmail.com
Content-Type: text/plain; charset="UTF-8"

> > Previously, a sender thread in mbox_send_message() could be woken up at
> > a wrong time in blocking mode. It is because there was only a single
> > completion for a channel whereas messages from multiple threads could be
> > sent on the same channel in any order; since the shared completion could
> > be signalled in any order, it could wake up a wrong sender thread.
> >
> > This commit resolves the false wake-up issue with the following changes:
> > - Completions are created just as many as the number of concurrent sender
> >   threads
> > - A completion is created on a sender thread's stack
> > - Each slot of the message queue, i.e. `msg_data`, contains a pointer to
> >   its target completion
> > - tx_tick() signals the completion of the currently active slot of the
> >   message queue
> >
> Mailbox API does not support shared channels. Each channel is supposed
> to be owned by one client. Though a client can serve multiple users of
> the channel, but then it will have to serialize access to the channel.
> The implication is mailbox_send_message should not be called before
> the last call returns (in blocking mode).

This sounds like a suddenly big change to the mailbox API after all other docs
or discussion, e.g. Link in the commit message, imply that it supports multi-
thread use case. I think it would be better to make it support multi-thread not
to cause breaking changes to the mailbox client drivers. At least, we may be
able to implement mbox_send_message() using mutex or other locks to still
support multi-thread.

> Even with this patch, consider when threadA is active and threadB too
> is waiting next. If the tx_tout races with threadA's transmission,
> threadB may timeout and call tx_tick() on the channel thereby
> affecting threadA. Which also eventually proceeds to complete on
> threadB's tx_complete which was on the stack and hence no more exists
> thereby causing UAF.

Indeed, thanks for this input. Here we need to consider how tx_tick() is
is called in conjunction with other events like timeout. tx_tick() can be
called either when timeout occurs or by client or controller. Below is the
break down of the cases.

Case 1) Thread A is active and no timeout occurs to Thread B

In this case, tx_tick() will be called once the tx is done for Thread A and
then Thread B will go next. So, no problem.

Case 2) Thread A is active but timeout occurs to Thread B

This is the case that you pointed out. In this case, we could cancel the
request for Thread B not disrupting the active request of Thread A and it
should be okay to cancel it since it is before sending it to the controller,
i.e. before the call to mbox->ops->send_data(). By not sending it, tx_tick()
should also not be called either by client or controller. So, it should be no
problem.

Will create a new version of patch with this change.

Case 3) Thread A is active but timeout occurs to Thread A and tx_tick() is
called for Thread A

Case 4) Thread A is done with tx, Thread B is now active but timeout occurs to
Thread B and tx_tick() is called for Thread B

These cases could occur, e.g. when there is no way for controller to know a tx
done interrupt that it receives is for the currently active request or for the
previous one, or when the timeout occurrs just before the controller is about
to call mbox_chan_txdone(). If it happens anyway, it could also cause
inconsistency of the mailbox internal status, but UAF will not occur with
the patch which handles Case 2. However, these cases are out of topic for
multi-thread support. It is more about the timeout support. It could occur even
in a single thread as follows.

- Thread A is active with a request and timeout occurs.
- Thread A goes with the next request and is active again.
- However, the controller calls mbox_chan_txdone(), thus tx_tick(), intending
  for the first request.
- The mailbox internal status goes inconsistent!
- The controller may soon call another mbox_chan_txdone() for the second
  request.

So, these timeout cases are existing issues regardless of whether it is single-
thread or multi-thread and should be considered orthogonally.
