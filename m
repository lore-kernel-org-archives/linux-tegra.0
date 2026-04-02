Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F4B13ECBDD
	for <linux-tegra@vger.kernel.org>; Thu,  2 Apr 2026 17:07:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775149629; cv=none; b=PRUScpNy32SiuvQsEAqKsk9lkOIgt8LoiZmsWG1bD+DPEYDy6qAfsAw2G9b8Rzlqk64dUyf6yHupCFe88m1crNxAXBWUGYiCCET8Cfpde54HkO9gaXwc7xva/nFmV5t0MpHF1qVyfMeHXnI49A6V2+4fGttxQJUc+kxuJggNjHY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775149629; c=relaxed/simple;
	bh=pjCqOLmJ4hu1XzDffMUDURIAFvHzh4g7TG3XafIlPn8=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=aj0qP5Ctgkra5wQZvRtTFkyln3RnSE41RpJsifsCM5loQj9Hxm8B6m9giOftYMByPKrwg6fnsddESIB6vOV8b6pxePStkg58DBKo9M38A+csJBhEX+W3pACe6X+MeRN9TAaC3FzF3l4fLojSw8xVBNjhXsWmkYxyj/m7R8Oa3xA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--joonwonkang.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=NI41NAY3; arc=none smtp.client-ip=209.85.214.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--joonwonkang.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="NI41NAY3"
Received: by mail-pl1-f202.google.com with SMTP id d9443c01a7336-2b249975139so25712575ad.0
        for <linux-tegra@vger.kernel.org>; Thu, 02 Apr 2026 10:07:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1775149619; x=1775754419; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=5ceebF0cNoevtXZxXS/tupzteUV9Qk2AK74OlrZ5xNE=;
        b=NI41NAY3v8ioJHB/zaJecieiy4H8OpVGK2LSHQ80ZVdcIKp0hxo+8ZSOegWMZBCdGJ
         hb5PFeIg06tczKyeK+TmDkkVYfVh4DCJUR/BRwuGtNv9avMPuwE/chjpc2wYMNfkmU0V
         10w0aSbbXARE9XNuDJ2txcnWFkl9Z+KJGP5uwJEbTK8oRNhcXtUHzMt8iJzSV2LldD7s
         VyJeQ/0Pi/MmzXzQJcf0K2uZfn/UxELhzBBMFg99lPFakULQbD/Q4/h5RfQLc1iRma6J
         CtTiJcCnZ8k7oM2LOvJJ7/+MGN8ymDF3/c97fkhStHPSQtW/tdP2cnY24d5Wpad0z1QJ
         MlBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775149619; x=1775754419;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5ceebF0cNoevtXZxXS/tupzteUV9Qk2AK74OlrZ5xNE=;
        b=GYQcvVKC6CCp7vEuQdYvuyzMjjc1IZFAhoe3mLWe9W3wRmJt7H95DNQfYSN+tNCfw4
         YaDb1+wAdQx798V97cDbyDMqGNyc3xiGmAoQ2kDJKGFXTM68XYKXFMy/tqwxmdjPUHtY
         Mj5AJf5aRbhd4+aQB8kTRDc6DNpUxZwALKRuvqotx2tCS6RVLch+7tZ0gfeQkiayfJ2l
         yHHJzDiPGPeAge4zuLkkp3R7UBb/dqihDZLiuylnoOkaH1b4bOb20msIffsuaalylZRS
         FLfdbw9GUiJlzWCOPkTLf4rEkM1V6OHJ6NVVBYn6KMVr6FMcshX32+yC95bTPRZ+8Mw+
         frNw==
X-Forwarded-Encrypted: i=1; AJvYcCUf64zH/Qz7mpVIDPc5tBRVxP9jCOjA/E5mDjcSfBFxTwfaWcNhdlJVHz6+IoFirLz1aLNrMvn/nQAt0w==@vger.kernel.org
X-Gm-Message-State: AOJu0YxTDUxwYqh0Jka/FxASwMwAukyqLBa4W8k/sTGrvbb3HYs5ukAt
	Aotxus4G/wzbX+o+30o70XGbv4c5V50J7I69AMulPKc3QK7AWCm0hNzwwL0RNbfjzKpUvg828U4
	CeebSZAeNOoKLY4NuqIUUU8oJgg==
X-Received: from ploe7.prod.google.com ([2002:a17:903:2407:b0:2b0:b03a:16ce])
 (user=joonwonkang job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:903:3d0f:b0:2b2:4cd2:e174 with SMTP id d9443c01a7336-2b281811ef1mr573475ad.43.1775149618937;
 Thu, 02 Apr 2026 10:06:58 -0700 (PDT)
Date: Thu,  2 Apr 2026 17:06:39 +0000
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.53.0.1213.gd9a14994de-goog
Message-ID: <20260402170641.2082547-1-joonwonkang@google.com>
Subject: [PATCH v3 0/2] mailbox: Fix wrong completion order and improper send
 result in the blocking mode send API
From: Joonwon Kang <joonwonkang@google.com>
To: jassisinghbrar@gmail.com, matthias.bgg@gmail.com, 
	angelogioacchino.delregno@collabora.com, thierry.reding@gmail.com, 
	jonathanh@nvidia.com
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, linux-tegra@vger.kernel.org, 
	Joonwon Kang <joonwonkang@google.com>
Content-Type: text/plain; charset="UTF-8"

Hi team,

This patch series fixes the two major issues in blocking mode.

1) Wrong completion order in the send API as described in [1]:

        Thread#1(T1)               Thread#2(T2)
     mbox_send_message           mbox_send_message
            |                           |
            V                           |
        add_to_rbuf(M1)                 V
            |                     add_to_rbuf(M2)
            |                           |
            |                           V
            V                      msg_submit(picks M1)
        msg_submit                      |
            |                           V
            V                   wait_for_completion(on M2)
     wait_for_completion(on M1)         |  (1st in waitQ)
            |   (2nd in waitQ)          V
            V                   wake_up(on completion of M1)<--incorrect

2) Send API does not return the actual send result.

This patch series contains two patches for each issue:
  0001-mailbox-Use-per-thread-completion-to-fix-wrong-co.patch
  0002-mailbox-Make-mbox_send_message-return-error-code-.patch

The first issue has to do with multi-threads support. Given the
discussion in [1] with the mailbox framework maintainer, it has been
long thought that the mailbox framework is designed to support
multi-threads although it missed the completion order issue at its
introduction. The first patch of this series is to fix it.

Alternatively, we could instead declare that the mailbox API does not
support multi-threads [2]. However, it would be a sudden big change to
the mailbox users after the long standing implication of supporting
multi-threads. Plus, it would have disparity with the non-blocking mode
which supports multi-threads already, which could also lead to confusion
to the users by saying "non-blocking mode supports multi-threads whereas
blocking mode doesn't". For this reason, the first patch in this series
does not choose this alternative.

The patch series rules out the case where tx_tick() is called twice or
more for a sent message on the same channel. In theory, it could happen
when timeout occurs. For example, one tx_tick() by the mailbox core due
to timeout and another tx_tick() by the mailbox controller or client by
accident or for any other reason. If it happens, the internal mailbox
state could become inconsistent even on a single thread. Thus, this
issue should be handled in an orthogonal effort later on.

The second issue forces users to register tx done callback to get the
actual send result although they are using the blocking mode send API.
This behavior is different from typical blocking send APIs, which just
return the actual send result directly, and so confusing to the users.
Without knowing this additional requirement of the API, it would be
prone to miss the send result check entirely. The second patch is to fix
it by making the blocking mode send API return the actual send result.

Change log of the first patch:
 - v3: Rebase on the latest for-next branch.
 - v2: Consider the case where timeout occurs and so tx_tick() is called
   for a channel by one thread while another thread is having an active
   request on the same channel. In that case, we mark the inactive
   request as canceled and do not send it to the controller.
 - v1: The previous solution in v0 tries to have per-message completion:
   `tx_cmpl[MBOX_TX_QUEUE_LEN]`; each completion belongs to each slot of
   the message queue: `msg_data[i]`. Those completions take up additional
   memory even when they are not used. Instead, this patch tries to have
   per-"thread" completion; each completion belongs to each sender thread
   and each slot of the message queue has a pointer to that completion;
   `struct mbox_message` has the "pointer" field
   `struct completion *tx_complete` which points to the completion which
   is created on the stack of the sender, instead of owning the
   completion by `struct completion tx_complete`. This way, we could
   avoid additional memory use since a completion will be allocated only
   when necessary. Plus, more importantly, we could avoid the window
   where the same completion is reused by different sender threads, which
   the previous solution still has.
 - v0: This first attempt tries to have per-message completion: [1].

Change log of the second patch:
 - No major change from v1.

References:
 - [1]: https://lore.kernel.org/all/1490809381-28869-1-git-send-email-jaswinder.singh@linaro.org
 - [2]: https://lore.kernel.org/all/CABb+yY39rhTZbtA21MecYk-R9fh7VQQr5kZUgCw4z92mWhZ1Rg@mail.gmail.com/


Joonwon Kang (2):
  mailbox: Use per-thread completion to fix wrong completion order
  mailbox: Make mbox_send_message() return error code when tx fails

 drivers/mailbox/mailbox.c          | 98 ++++++++++++++++++++----------
 drivers/mailbox/mtk-vcp-mailbox.c  |  2 +-
 drivers/mailbox/tegra-hsp.c        |  2 +-
 include/linux/mailbox_controller.h | 22 +++++--
 4 files changed, 85 insertions(+), 39 deletions(-)


Thanks,
Joonwon Kang
-- 
2.53.0.1185.g05d4b7b318-goog

