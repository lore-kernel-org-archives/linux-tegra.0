Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0288828C5D9
	for <linux-tegra@vger.kernel.org>; Tue, 22 Jul 2025 07:58:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753171120; cv=none; b=tM3t/GaHMW/pRuSg1CwV2ToXB7V3E341+AGX6ood5fauMl+yFJknWnCtiB/phwd8bQUxFzmjBRbG+igk7Wz91Fz1lsx9oRfxSOyUeXWTqHAWYjiX2QHTXrtF24Wk+pKS08QyymP/5i/67V7oKIJTjassmCut1hA2ERD+qf2dIpo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753171120; c=relaxed/simple;
	bh=0u/JOtFb40G7OAdJNGXOF0HiHT46TMaka4nAW2CBJuE=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=OAgM7wqQ6V9X4ats8QUE8tF/Mz+pyxrHg8YFxGTpokvn9X5E2jR4xhTS9xeMqSlLs7zT6l2bWwjVMC3/6jkNKYCIj4N/rQKX+ToSrZExm64dNy962Gb+Q0EiG/eEIS2nQRXMAdEjXZ0XYoqtfJncqcf8RTkiQWxKti+X7q8XBZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--joonwonkang.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Vl0oJ9zV; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--joonwonkang.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Vl0oJ9zV"
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-311d670ad35so4911336a91.3
        for <linux-tegra@vger.kernel.org>; Tue, 22 Jul 2025 00:58:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1753171118; x=1753775918; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=GKEOkG/SCnvVWejgvKtsOSVohJEAQBSTYyoB9NogI0o=;
        b=Vl0oJ9zV6Sh+L6WIjXkruTSlMQLjlNmtqXLaBy6hrOEml9mUbfFLHyb5pTniJUWI/A
         V2L4MQWZ0lOwnzUbxsFoEUilQmk4oCMIkNgWYqOwa2cQURMWiT2LeJqPhoazdCtMYBhq
         1ap51rcfwa7O2mdnd+fdT5r0ZLWBk6tBP1VvnnjubHCtey5g6G5qDJbU092ovbo0EEgt
         Qg/BSKkae9kle6nP6AXMkvJ3FegbfFPQUFTsBCJvA4ZrqDAgPPGC9mYvzSHO5rq7DiWz
         mjNXtVjs5gSB4ZxJBp+hqQwz+OXtZcTL4/pngAXqIqgzBBNv005obI8s/v0TMc5MGCCb
         SkQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753171118; x=1753775918;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GKEOkG/SCnvVWejgvKtsOSVohJEAQBSTYyoB9NogI0o=;
        b=C5CkYnjNSxsS9fOH+c+fG7F0R2o9guMZ35XXBOvbhp0xYGG46+P35zc6ad0hC33suC
         648jfbQZ/4iC25jEpOaPqEOueJ3IWFw6kzzboprda2NwD+N5ffpsl/rxptNUaIouqewT
         FpFGb2Z/8zxDkr/G15qV22kMH5NbmjRTDMbpvXRzzLGKIlIq+nyr6A8Bdo+OiFQP/fDE
         8mlcuMrHy/uFDqvkhDcqrenzlfKbS9L2bXyXbnom0ll/nydzdjWyuCQzxpb1ebxuESIS
         5lj0mcPrjVexr33/PdvzCV6Gd9TTSKjufiQsLJeNqwLSSaZS47X2twzwySGuxjMxv5S3
         Pzzw==
X-Forwarded-Encrypted: i=1; AJvYcCWbu4EiMZUQvxwTR5QQiyqoUr6E7zRZqkgTt3l0LGB4eG34lk1JxWyfEPCZqudYyYIssOT+KUKrCWDMhQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyr7C9Ze8EgVlrejh7FKnomYspJtUlK9RNbJY+qc8ThcjEL5Fct
	kcvXjVYB9i1VUIu7KY3gjAIp0c05IdCYgBEH19ZMBzqRumi+YA3ECjuaCqQQVsgVp+Od1S6d/3L
	ItZmAbbMkPwmM66/4tpw3AFoGag==
X-Google-Smtp-Source: AGHT+IHvMW19PnyhW57uHAL5HrdQCFvuBfBi+yS0EnotVmDFVgYIhkVHWQUrvQYsMhN5ow/1DnYnfAQhqWMWjqjr4g==
X-Received: from pjff12.prod.google.com ([2002:a17:90b:562c:b0:313:d95c:49db])
 (user=joonwonkang job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:224e:b0:311:c1ec:7d0a with SMTP id 98e67ed59e1d1-31c9f4cf4bemr29442369a91.25.1753171118159;
 Tue, 22 Jul 2025 00:58:38 -0700 (PDT)
Date: Tue, 22 Jul 2025 07:58:36 +0000
In-Reply-To: <CABb+yY3CBiLpZ1KrD8RFypRgkP9MOzBf1FB+gL2E-qEuSbrj6A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <CABb+yY3CBiLpZ1KrD8RFypRgkP9MOzBf1FB+gL2E-qEuSbrj6A@mail.gmail.com>
X-Mailer: git-send-email 2.50.0.727.gbf7dc18ff4-goog
Message-ID: <20250722075836.2295285-1-joonwonkang@google.com>
Subject: 
From: Joonwon Kang <joonwonkang@google.com>
To: jassisinghbrar@gmail.com
Cc: alexey.klimov@arm.com, jonathanh@nvidia.com, joonwonkang@google.com, 
	linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, 
	sudeep.holla@arm.com, thierry.reding@gmail.com
Content-Type: text/plain; charset="UTF-8"

On Wed, Jun 18, 2025 at 3:04=E2=80=AFAM Joonwon Kang <joonwonkang@google.co=
m> wrote:
>>
>> Previously, a sender thread in mbox_send_message() could be woken up at
>> a wrong time in blocking mode. It is because there was only a single
>> completion for a channel whereas messages from multiple threads could be
>> sent in any order; since the shared completion could be signalled in any
>> order, it could wake up a wrong sender thread.
>>
>> This commit resolves the false wake-up issue with the following changes:
>> - Completions are created as many as the number of concurrent sender
>>   threads
>> - A completion is created in a sender thread's stack
>> - Each slot of the message queue, i.e. `msg_data`, contains a pointer to
>>   its target completion
>> - tx_tick() signals the completion of the currently active slot of the
>>   message queue
>>
>> Link: https://lore.kernel.org/all/1490809381-28869-1-git-send-email-jaswi=
>nder.singh@linaro.org
>
> Is your issue different from what is described in the Link?
>
> thanks

The issue is the same, but the solution is different.

The previous solution in the Link tried to have per-message completion; each
completion belongs to each slot of the message queue. However, the solution in
this patch tries to have per-thread completion; each completion belongs to each
sender thread and each slot of the message queue has a pointer to that
completion; `struct mbox_message` has the "pointer" field
`struct completion *tx_complete` which points to the completion which is
created in the stack of the sender instead of owning the completion by having
the non-pointer field `struct completion tx_complete`. This way, we could avoid
the window where the same completion is reused by different sender threads
which could lead to a wrong completion order, IMHO.
