Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com [209.85.167.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FAA98F40;
	Sun, 20 Jul 2025 21:13:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753046002; cv=none; b=iB9/GBNjPFfB8UXnJXNyZCgAxcCSKIafe9DlDQPnFunDizsHmAT/vrGzMxUnrzN9dgk1DJk2bC7FVT36UXnyknTU+RKMO+8Ycd/iG2Cc37PtAdAeqp6gyWr5gFBVRgpeK1C9KmNQCTkFeCCPb8reh7dDOZnYwoscwOgLxJ+CMSc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753046002; c=relaxed/simple;
	bh=NMeW2BcUoS5p1vkk48JdBAcgFbjbmXnE8eXA/e+eiDQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=l5PYpNJSKda9ouACiuh1EUw5zfNT66Ru96McOFx2yNu+WAE8q3MPHV8IkA94os4iY7kB6tgxSMj7FMc+lmDKrFQU8Ftplm6ZKk+oIraQdf9U8zcsM/WAMNv71VydwW8zv4hou/+NM0tXwh0ZmACimriT2OfuFjsVdYshL7KJgUM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TFFwD7EG; arc=none smtp.client-ip=209.85.167.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TFFwD7EG"
Received: by mail-oi1-f176.google.com with SMTP id 5614622812f47-41baecbdd33so2143031b6e.1;
        Sun, 20 Jul 2025 14:13:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753046000; x=1753650800; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o6gErZMJt76V1eqKZ0fc9t2jYBpWpuemhCSqXUz2On8=;
        b=TFFwD7EGeRt+h9AJJPWjbV1uKa2gKH3vS/z9rxSxoUHBGmEXAS7a0h1r6Xs3Xy6li/
         OhFAm1p/YZ7nTp3ycyyrh4J7khfJF/llMwAwIAn+x62R2XSkPNjttPCxmGD8ZQO0zRxQ
         yyDUIVMIDuLOHbPptc+gsmkO5b4Oxj2EZ27rz4r1XQnNmEqLjZUHWa72ij/uIwd8yGIm
         V0ZzpFSqa8zBn38m1Xe8w+q6BTpgGBaeVreDkHoXXxnI46KtoosiVmAh4pksyM1QDF1+
         6NAYDv5Pj0hXY2BEoovwatezwn9+JbIZlEEIcApvc/GfSBKRHJpxuVV1B2Gs8LkulgOi
         RsYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753046000; x=1753650800;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=o6gErZMJt76V1eqKZ0fc9t2jYBpWpuemhCSqXUz2On8=;
        b=wEwConHD+Tb6WxDL9tIpkvBP25hDDnBV+CercWaD6traiQn1rHuvTCEiCFETt0vMh7
         V8XnlYj1YVnvkFUdmbHsvENo9NgVrhjHwHykLFgtBmRUeQGV0Y04gmbftgLdiTDt0+O2
         4oiimqkLjwGvX1rc+cOn9W3hM7NGMgxtEOZE4gXj/+3YAKt5bQOafxb2Ln/pSyKCZf7M
         VS0oS1Oh470wbJO8rALXcdw5MErxSwKXUbjZ+x2bpvQrNtx0KPI9rPD5+m6ohXrBr4/6
         e1P482S3WiFzSeVnyUXbxdFO/kaF/85F7axQJ4uy9WCpIpgTmpv6eRYaEMSOlfh+A20p
         ijeQ==
X-Forwarded-Encrypted: i=1; AJvYcCUIqRTYVk5DYU47Vtl0BVlM+j5m8FCTAvv/bbWeYafgWJ8vbNgxpINfVmp9r3Gmsuwd3vvoeWadLJN/2NQ=@vger.kernel.org, AJvYcCV+cDgLTOR7OFFUgRvrYh3E0RkOINWlRAwkK26rULp0BJlx0pS52imLKkgbJFOK9Pdis3xB9QH4zJ+06Lk=@vger.kernel.org
X-Gm-Message-State: AOJu0YxqloNSmKdXylwyi/FcOh4+xZJs2xOT7o1Jk0AL6G0InvJWm4Xd
	oL1WCth7dZV/vnuEHHSY/vPDxYtKA5hRlaQNnVkacFit5tQuKctOyVMxkY1RN0yec4pCZSHCF2l
	C4rP65/hYBUhNF7psPey9i1bmxCfKpYM=
X-Gm-Gg: ASbGncsOZshUrwHwD1EBaqV6YDYpT13TvMxXalipJgouXw1wUTtvrItcHOI+B5cb76O
	E45apbK+Il8vixR39xAccGfQ3cJv6a0ulWhbGIH6Q9AjUmNAvUpV6zWxDrotD2w2Mclc3iw0CJq
	gLc3RTDcZrw7KmQZczGqMUD5UBsluWhM5f7p3yhSo/jkCdDHI907P+XhEgtPw3YjxlTaBLqHlGF
	7c+s9lp
X-Google-Smtp-Source: AGHT+IGQBjCiAD9vIQwxV0rJzEKHpmjX4gL4eliT0pjfkXkTEmtGeAlanzndulSYj+eEPQNmRrUoqpol2Hvsi+3CglM=
X-Received: by 2002:a05:6808:81c7:b0:41f:79f9:1b6b with SMTP id
 5614622812f47-41f79f9201emr6057246b6e.34.1753046000383; Sun, 20 Jul 2025
 14:13:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250618080339.969173-1-joonwonkang@google.com>
In-Reply-To: <20250618080339.969173-1-joonwonkang@google.com>
From: Jassi Brar <jassisinghbrar@gmail.com>
Date: Sun, 20 Jul 2025 16:13:09 -0500
X-Gm-Features: Ac12FXz9vOtA1Fg51kXnXqCTNXVof0pWwc5qQoUQiAq93e2W0_AVQrge6SyFrZM
Message-ID: <CABb+yY3CBiLpZ1KrD8RFypRgkP9MOzBf1FB+gL2E-qEuSbrj6A@mail.gmail.com>
Subject: Re: [PATCH 1/2] mailbox: Use per-thread completion to fix wrong
 completion order
To: Joonwon Kang <joonwonkang@google.com>
Cc: thierry.reding@gmail.com, alexey.klimov@arm.com, sudeep.holla@arm.com, 
	jonathanh@nvidia.com, linux-kernel@vger.kernel.org, 
	linux-tegra@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 18, 2025 at 3:04=E2=80=AFAM Joonwon Kang <joonwonkang@google.co=
m> wrote:
>
> Previously, a sender thread in mbox_send_message() could be woken up at
> a wrong time in blocking mode. It is because there was only a single
> completion for a channel whereas messages from multiple threads could be
> sent in any order; since the shared completion could be signalled in any
> order, it could wake up a wrong sender thread.
>
> This commit resolves the false wake-up issue with the following changes:
> - Completions are created as many as the number of concurrent sender
>   threads
> - A completion is created in a sender thread's stack
> - Each slot of the message queue, i.e. `msg_data`, contains a pointer to
>   its target completion
> - tx_tick() signals the completion of the currently active slot of the
>   message queue
>
> Link: https://lore.kernel.org/all/1490809381-28869-1-git-send-email-jaswi=
nder.singh@linaro.org

Is your issue different from what is described in the Link?

thanks
