Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C47112236FC
	for <linux-tegra@vger.kernel.org>; Tue, 22 Jul 2025 08:16:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753172217; cv=none; b=dB41LzKySAQZxIph0lPIGB5vcR4zwZSMqJBLbPS+VkMfHWxp2ffKpTHQ0EenpaumUGQ759bQxRwYr4qgdfNTehdt5o3n3f2rqMsA9ZmHBl9CSYMjZT3fC2gYfGLGAsNwr7HD4w/MjBeSyHPtv6iw5ImNAdV6EvL1X7Lo8MagTw0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753172217; c=relaxed/simple;
	bh=MkD1qta3tVmZrV+e3+jqw73ERpKiBhV9QH3nk2YXHWU=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=ZFDlyJaP7/nq7Vy++LAr5h0SR9VNVn5yKucbAptbRDhKgjbRXnmUiVWHCOYhEjpq/OaZI0s5kB/+x0gy2p90XRTCIZLoN8OaBlQBVan6Kxsivfza/ph3bEB5Hsz29EN6HsVfmFNMSyHfodMFuJgD9SSgvcuq8g/KuUri7+C7SXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--joonwonkang.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=d7A1qqYI; arc=none smtp.client-ip=209.85.214.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--joonwonkang.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="d7A1qqYI"
Received: by mail-pl1-f202.google.com with SMTP id d9443c01a7336-23dc7d3e708so37466815ad.3
        for <linux-tegra@vger.kernel.org>; Tue, 22 Jul 2025 01:16:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1753172215; x=1753777015; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uHrDixyBOWPrC724EF/vBl7f2DBfBuByrzZDyz49rEg=;
        b=d7A1qqYI8LHdsXxgBQdTJz6mCMyALMmxuDLzp2RcDiVWo7C9/V2vvN2MCv7gMV53ZF
         wN+eTEVDfZGn0BcxiDRfP4RAlnIbwYiZnNEXiGqdpHDPr1FrCIK/5ZC/K2iNqdFbjC89
         9UiCLd8mzZxqdx89RWV4giYdcbwYBh0bQtIy/XiDb65EjEEDUEhy2G+dtN6QxmPOwx7H
         vQ9Pnme45P9RiPsdBtotuCUdIdEm9fFfWykVoH9YAdIWKY6J/yGBKXTeGBvmOUVAvUAC
         uvvufE9+mdAKG/SOclIPpuXF8M0a50BYN+NThBoR7s9KSF9w2GOu7eQf4ReSV0q/1qbk
         7MSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753172215; x=1753777015;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=uHrDixyBOWPrC724EF/vBl7f2DBfBuByrzZDyz49rEg=;
        b=KvjZnppT+seB29E8pUIpIv1ZwGExbtLOhNnvjdqC6g9ao/DwgGAkBAeAcBXsurWqh0
         SY71ieNzeJYRxoYpE48yBDCmOE+Z5NCfj1Qhg49ar7YNk6jOBmgcuTtRnO84MNyQinzE
         FxgSI+mMcxIcBZaKJ+hryAdnREiDFbBrDer618WnPaANusAkaXUBCLFqw5sTgxeA9ALx
         zCb90ZF+AwVTlaSoKNJRfVg6+tH+9NxwxEt8ZfW7L4d6sir8TPTpmMVS1DijP6EH80FE
         IISFQ9mkT/dHDHywVyAFbpuEfSncZmgAqv/hheHr7AltY2eFASfu6eh8jhYBlXLUGyOv
         3WRA==
X-Forwarded-Encrypted: i=1; AJvYcCU1udx1RqRBHJkose5NrmaOTvZco+fMRsv00m+hZBovJhIMNjc/LxJOs2Q6YjLrzz6cNByFO8xZuVtoiw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxuQ2MHH0bLFtnjuTPMeW/kjPJQ71SLETMN+LOiAgZbcYJAT0d5
	Sx16PDjMwAx/b5A+P+FDHmPXfuY7a9SAX/zkokNODKIC2xNKza6g9r4OngWra6azpGcysA+KkVx
	oOir4fzi8DUQgp0WHwICsfqMcGQ==
X-Google-Smtp-Source: AGHT+IG5tp2UrU/XB7h35HgO96Lzjvp2sErZ5M7J6hXb8cUTG5ybB/EvLpA0TUtt6MU0hq1ilG52dIzCspM5U+YkgA==
X-Received: from pjb7.prod.google.com ([2002:a17:90b:2f07:b0:311:8076:14f1])
 (user=joonwonkang job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:902:f601:b0:234:cb4a:bc1b with SMTP id d9443c01a7336-23e2577851fmr332463105ad.49.1753172215171;
 Tue, 22 Jul 2025 01:16:55 -0700 (PDT)
Date: Tue, 22 Jul 2025 08:15:59 +0000
In-Reply-To: <CABb+yY3CBiLpZ1KrD8RFypRgkP9MOzBf1FB+gL2E-qEuSbrj6A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <CABb+yY3CBiLpZ1KrD8RFypRgkP9MOzBf1FB+gL2E-qEuSbrj6A@mail.gmail.com>
X-Mailer: git-send-email 2.50.0.727.gbf7dc18ff4-goog
Message-ID: <20250722081653.2300581-1-joonwonkang@google.com>
Subject: Re: [PATCH 1/2] mailbox: Use per-thread completion to fix wrong
 completion order
From: Joonwon Kang <joonwonkang@google.com>
To: jassisinghbrar@gmail.com
Cc: alexey.klimov@arm.com, jonathanh@nvidia.com, joonwonkang@google.com, 
	linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, 
	sudeep.holla@arm.com, thierry.reding@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

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
>> Link: https://lore.kernel.org/all/1490809381-28869-1-git-send-email-jasw=
inder.singh@linaro.org
>
> Is your issue different from what is described in the Link?
>
> thanks

The issue is the same, but the solution is different.

The previous solution in the Link tried to have per-message completion; eac=
h
completion belongs to each slot of the message queue. However, the solution=
 in
this patch tries to have per-thread completion; each completion belongs to =
each
sender thread and each slot of the message queue has a pointer to that
completion; `struct mbox_message` has the "pointer" field
`struct completion *tx_complete` which points to the completion which is
created in the stack of the sender instead of owning the completion by havi=
ng
the non-pointer field `struct completion tx_complete`. This way, we could a=
void
the window where the same completion is reused by different sender threads
which could lead to a wrong completion order, IMHO.
