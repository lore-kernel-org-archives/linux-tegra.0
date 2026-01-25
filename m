Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7C7217BA2
	for <linux-tegra@vger.kernel.org>; Sun, 25 Jan 2026 01:42:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769305353; cv=pass; b=kJDnCXYe+8gOBsrYkGW7CMPyZh+oI26sTK0ZdgJOo2MCZXErd/+/DW1ZHM3q4TsDGyx2JiC8Ls1oalhCTQEwSZhnaQG5AiWAYA05y+nYtytz0wVplVIKBgZSS9EhJXje2yAypD/xTO33qUweR3+9NUGLeBUmyHkUQS66PO6OXZY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769305353; c=relaxed/simple;
	bh=o62QWtWcle4DY/qGkFRQ4LThvoa5UF61oBPpFQEHMy0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qCDRT8amapOhL/a9EpC/qPizMGMAhLovJChKgKqJxsKe3H2Vl8WfbSxiUIC76ZiUovUy+RgPYj+xyKszqY5sAkSYt9rjgpEAJNM2NKJ/4cIW6CkduIeGUP3kfDerrNlZZUGNKepBB9OVLbcjitkIi7ejzLkF30C9Dzz3kogWFZY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q1gN4lrq; arc=pass smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q1gN4lrq"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-b79f8f7ea43so563854366b.2
        for <linux-tegra@vger.kernel.org>; Sat, 24 Jan 2026 17:42:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769305350; cv=none;
        d=google.com; s=arc-20240605;
        b=Zqh0HIOuNqYfCrxOmJOWz4OTr37e0ThTo/O55qcxskN9DAScAduOLk2UbOW0otZMPS
         ZyHyJ3K4tIJoGINIFq8D0si1g0VJJFA9hVygVhgJS4WC6dUsfdtBeujyosYfGBOSPPRy
         CL4cCLUZYlM+nCCIAy+9Ywam/kOWjMwVtWN7Xbdy11j1wg7D9mDB55k8p1ackj+q5aaU
         dn0livjmIq/h8Cylp4LTgD6bXM3kJP6KUOCfojSxsmjOrQ6UG8e6ExMYbuman2/sicpY
         uVGsn4aZnxdbiqawAaAkFcVpC1bKMMbGeJC03oVYb8gQmgLqgVTZ/J6fEm1sZZ/bLM0A
         NvsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=zLvoAJ9PRCVQHW3muNClNeM72pKgSuHCyQxqvs2XN7M=;
        fh=Dtu2LRQ1tKex8LCmFakpJ8BYwKjLVIN3xyYAtTk8r4Q=;
        b=MFro8EtDRmzObNFHIXfluRqnbnsJFKstLNacUqy15UcjMALiE/M55xIhI2oeeAyX5E
         8ucDuimPA98cGUSshIzT0HRAC5j75zdBhTyqIZasX1YEjaTLh6eymHwEiLY2eRMptn3g
         7juxAPBbSlLm9bVozuvnxW6be2tIgeFAKCwpHu8Q9j6Bu3fNlJyiQanQ/NVbci7igfsO
         iOLbGc4ndwqeBW/06cx4FH7jZ+v1bcUZ4PUVB1sCJ8WPwxSMBQvz/mT43PL8r8BYxft0
         x2pKeenxks6G2eKsv/iQSjBXKXCWk35s7n4aB5Lcmk6DUst26jfDhW13plGKVof9iiFH
         cHEw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769305350; x=1769910150; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zLvoAJ9PRCVQHW3muNClNeM72pKgSuHCyQxqvs2XN7M=;
        b=Q1gN4lrqzD+6W0GvKXwUZkZ7B7zFGgAgDNAwOTK5gd8e8b06uAuKF2WEag6/cR0DIX
         Z4DJbPq3Z0Ebz8kQYCKxJ41iWatKrnY1z/h937QW3YTP42g2uzDbF6cOmD6nGcCyz3GN
         SuV8KqupqPzsbD1/V5dHvuRnvK+Na1+sQrWFChcHR4NQqSeyWNeJ7qktJgUOW1Y93vU0
         aqFvRAJ4hnZ104G7zImKPK7JrnBfL5W5sQpNPoWWciUhNPzgKyV2E9hWkBQEtobhoigP
         eRRoXCT8m24cQILCszKf0iypbEL0FK8vm80YA6UJ72pO8dNhHZwIDfcbNp9louts/2OU
         3JlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769305350; x=1769910150;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zLvoAJ9PRCVQHW3muNClNeM72pKgSuHCyQxqvs2XN7M=;
        b=Qh+I6RiW1hL9sNRI5u2Zhe0oqKKvlLxtl2FvQ0pKD8Ulj1nbIHF/HUgR3pP+fUfAwZ
         6iAEJ5yxZp+cOuxUbWrnSm3B9lhJ0PkeHJ8tPrae88eeIXrnmSuZTRGUnVQuzER7AZH0
         PHazHNrDuE2YF5m+ZbfQlCEua2QKrCZxAi/DCqFiSufN/yz37L3Yw+SUVDc43/K80L34
         2Wpil1NLLFyAaduDsGpGrt8h8ZGyRNdYMZRS2IWNuLMnhtdI933YYiwawr9SPk1WoroH
         zLfsI8ystmfe2hGQ7eUJt6Og0N0p/vYxZOYJBOZYsbFN6N5pACWtiiC/JsinOHaL4pBs
         EDUw==
X-Forwarded-Encrypted: i=1; AJvYcCXg53j/ZzU7VvgOirR1dC7JBKhI6M58++DyYFUpGRbrIz9nquR1mW2hlh2+Z/AjJTTLB8ABi3suht5Rfw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzY32ap5DdIcV+hZQAzr/vkL1ucyRSiNWDqHRDWasdrigT8p1pT
	+Kfl5wZPLGTfEMkvzG1VLOaMaXir2U/k6ncbvXKHC8nZSGNPeb3gwMAjDTdW7ECEdIqJF/j2xqi
	CMcfCMdklHmuETlc7KIw/pyc1qC7b5wk=
X-Gm-Gg: AZuq6aJAF61925Jm4pvMwhz8rwp0DE8bz7R1Mqef3PR8Swz91msR4y3ITA8+j/7fUUX
	VxQRghlr7EAsBrAlfRy+I/TNKa3oNxYuT6tzkFvK5LWYASdLO8Eu4AfXZe+SrKvkV4G7YpglcxN
	cey4+NPR8Q1alluKpW1DYxjFkRngz09qSpBewFxqCmBAcsbmhqQtt8qlk42TSU5ENw5BnL0WDZR
	6diCNJ3friGHizpr8JTDMr1IwUINDPfaZW9lKXaCqYl7Qh+/f66lEiDEAiWaYcCCvLJQfTx
X-Received: by 2002:a17:907:3f0e:b0:b87:1e50:95c2 with SMTP id
 a640c23a62f3a-b8d20b4f2a3mr26845466b.3.1769305350219; Sat, 24 Jan 2026
 17:42:30 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251216084334.903376-1-joonwonkang@google.com>
In-Reply-To: <20251216084334.903376-1-joonwonkang@google.com>
From: Jassi Brar <jassisinghbrar@gmail.com>
Date: Sat, 24 Jan 2026 19:42:18 -0600
X-Gm-Features: AZwV_QgijN2oexrG2LfmfcIUkp1z36F-46iHu5_OKT2Q9YLc-TzhUJUCi6aKPJo
Message-ID: <CABb+yY39rhTZbtA21MecYk-R9fh7VQQr5kZUgCw4z92mWhZ1Rg@mail.gmail.com>
Subject: Re: [PATCH 1/2 RESEND] mailbox: Use per-thread completion to fix
 wrong completion order
To: Joonwon Kang <joonwonkang@google.com>
Cc: thierry.reding@gmail.com, alexey.klimov@arm.com, sudeep.holla@arm.com, 
	jonathanh@nvidia.com, linux-kernel@vger.kernel.org, 
	linux-tegra@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 16, 2025 at 2:43=E2=80=AFAM Joonwon Kang <joonwonkang@google.co=
m> wrote:
>
> Previously, a sender thread in mbox_send_message() could be woken up at
> a wrong time in blocking mode. It is because there was only a single
> completion for a channel whereas messages from multiple threads could be
> sent on the same channel in any order; since the shared completion could
> be signalled in any order, it could wake up a wrong sender thread.
>
> This commit resolves the false wake-up issue with the following changes:
> - Completions are created just as many as the number of concurrent sender
>   threads
> - A completion is created on a sender thread's stack
> - Each slot of the message queue, i.e. `msg_data`, contains a pointer to
>   its target completion
> - tx_tick() signals the completion of the currently active slot of the
>   message queue
>
Mailbox API does not support shared channels. Each channel is supposed
to be owned by one client. Though a client can serve multiple users of
the channel, but then it will have to serialize access to the channel.
The implication is mailbox_send_message should not be called before
the last call returns (in blocking mode).
Even with this patch, consider when threadA is active and threadB too
is waiting next. If the tx_tout races with threadA's transmission,
threadB may timeout and call tx_tick() on the channel thereby
affecting threadA. Which also eventually proceeds to complete on
threadB's tx_complete which was on the stack and hence no more exists
thereby causing UAF. So if you have multiple users in blocking mode,
have a local queuing mechanism.

Thanks.
Jassi
