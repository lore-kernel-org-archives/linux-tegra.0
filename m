Received: from mail-pj1-f65.google.com (mail-pj1-f65.google.com [209.85.216.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E49C81CDA15
	for <linux-tegra@vger.kernel.org>; Tue,  1 Oct 2024 19:35:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727811353; cv=none; b=QvmzksYn0acHpJz09oIJVcBJLLnguEt4Rr9GQ5uaaM8VSCOaO/6FrILSua/bLnFpKlr6BDnU+1H4rYbFw+jvlHNqFWwdFUB67eYe5Do8OCgqIYrBuhU2Qpna7y+C1+128VLLzKuigB1PHKi0OJbBrNXDQyXsZ3I0IttJrMHEP5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727811353; c=relaxed/simple;
	bh=FFch6zIc0o2MnfMhOwyv40/xzG4DCBsHso2BLXMhDAs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ojb312nULpWZLQOGLZY/ntrh44tiFfVWIx4kKkLJO2eKittXEHmbC5WR3D/Q0AjLKTiM6pK7H/73OPD28umv2+H1Hv7Fx7XtW4t9/1PAlZ+lt2rgXXSdcvYMT7vzQulhpjs3/vNvCp7RuZwcuaujF97TV9G614sQLsvU6ZZr+Ls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bKuaP8+S; arc=none smtp.client-ip=209.85.216.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bKuaP8+S"
Received: by mail-pj1-f65.google.com with SMTP id 98e67ed59e1d1-2e0a950e2f2so4721987a91.2
        for <linux-tegra@vger.kernel.org>; Tue, 01 Oct 2024 12:35:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727811347; x=1728416147; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FFch6zIc0o2MnfMhOwyv40/xzG4DCBsHso2BLXMhDAs=;
        b=bKuaP8+SsBTW/YWf2fy89+5maGx+1G6wFsHcm8gk6riGc7WPHLWF6tN6mZ8yvGe7zj
         hfyrM8dI7uRFqGB8Y9AYE9CYlsGHXWYYdvGIRVhP8YtH4N3V2CWdfJDt52CaXhbOacWR
         1wgAZQ6tfEmMgzRWxC03jv3JQmcbseGypDEiQzoKwSVGsxRvIUWq599/2v3UYxDBazeQ
         K6AjCnndi4rvdM0NgJ7WJp8m1RT28elrZFObc86ssAPAGxRA53qSClu18UDzszARFC4j
         /a3VqCiFGVdefPLNSlzMRPxSDve7gELR/OaXjyltMsbYybx79CYezDzycYjN6+MnxejG
         HyoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727811347; x=1728416147;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FFch6zIc0o2MnfMhOwyv40/xzG4DCBsHso2BLXMhDAs=;
        b=k3FNWyxPZ5Z90MPn2rEEWCgX6hkzW23zjfkicWZWLgXIlTOP74v5aSWuuLOpU4sLfz
         PkC5g7GEOE2keX9AO8/B2WhJheLT8iQWzrE+jC1f1XbEhdcS+K+AYvB6C9wBWtzznSLm
         xX+IldXvPCNKFtr/If4nMNmm/YP1YFrWrw+4PjXuU8BcFn0vk1bQB5SXz5LMNW3/bkAd
         juZ6+XAtUZlI/GHNmtXn/nTrLOwgxEGHZcCB9cG+Ci+iJmLXZeVtMaq/5WFidFXL4IZS
         xoNiT6Tm86S7z9W9/2t4FHJMyJcpqUpJ3diu0rWPHTqQUMyLzmnXpV99PWBKpzL5JZwM
         EYKA==
X-Forwarded-Encrypted: i=1; AJvYcCWpW5JsBXecLpzgySE/icOkd16TwOGjYy+453ZkVdvGIAtlbOVWpM93rBE4xU8RQFQqz3TFzCBnkPxOOQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YychlTeRK2n+uLpoy7eWisbUe6XZgdagRRzDlq7D7c3PvGhGFLk
	bFJMEUpb+kCJkZAGk896++g6cCgRu8ky3u5xJXGJF2wPr9eYkszQvEZl2X6V+wKxr7vJV7m/j6E
	DaAMQxhkHGZmNsaDUIEOGNqaIxy6HUZPXctU526JE
X-Google-Smtp-Source: AGHT+IF8heLhXCtQYqgBCxIt8v0VCm3UpKoXPafLJMCS7M8R2IyJVoMdFD9Tca3Qr69gqEf0u13HgUYg5nuGIwpJu54=
X-Received: by 2002:a17:90a:b884:b0:2d3:cd57:bd3 with SMTP id
 98e67ed59e1d1-2e1849699e2mr949054a91.29.1727811347119; Tue, 01 Oct 2024
 12:35:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241001190953.31152-1-zichenxie0106@gmail.com> <e8810b65-8ae7-4d47-a89b-a1471b70409a@linaro.org>
In-Reply-To: <e8810b65-8ae7-4d47-a89b-a1471b70409a@linaro.org>
From: Zichen Xie <zichenxie0106@gmail.com>
Date: Tue, 1 Oct 2024 14:35:36 -0500
Message-ID: <CANdh5G5EUhT5N17QofverJyR2QxRDt+BAn7pvThkxgC0S=OB8Q@mail.gmail.com>
Subject: Re: [PATCH] firmware: tegra: bpmp: Fix freeing uninitialized pointers
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: thierry.reding@gmail.com, jonathanh@nvidia.com, sumitg@nvidia.com, 
	linux-tegra@vger.kernel.org, Zijie Zhao <zzjas98@gmail.com>, 
	Chenyuan Yang <chenyuan0y@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thank you for your feedback!

You can see from commit 90ca6956d383 ("ice: Fix freeing uninitialized
pointers") or any other usages of __free.
Initialization is a necessary and standard way to protect your memory.

Additionally, the proper freeing function should be of_node_put()
rather than device_node().
In commit 8812b8689ee6 ("firmware: tegra: bpmp: Use scoped device node
handling to simplify error paths"),
of_node_put() was originally set to free the memory.

And as for the tag mistakes. We are sorry and will correct that later.

Best,
Zichen

On Tue, Oct 1, 2024 at 2:20=E2=80=AFPM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 01/10/2024 21:09, Gax-c wrote:
> > Like commit 90ca6956d383 ("ice: Fix freeing uninitialized pointers"),
> > automatically cleaned up pointers need to be initialized before exiting=
 their scope.
>
> So where is the early exit?
>
> > Additionally, device_node() should be replaced with a proper freeing
> > free function of_node_put() in this case.
> > And the pointer need to be initialized to NULL before any return statem=
ent.
>
> And it is already.
>
> This looks really bogus.
>
> >
> > Fixes: 8812b8689ee6 ("firmware: tegra: bpmp: Use scoped device node han=
dling to simplify error paths")
> > Signed-off-by: Zichen Xie <zichenxie0106@gmail.com>
> > Reported-by: Zichen Xie <zichenxie0106@gmail.com>
>
> Hm? How is this possible? You are writing this patch, aren't you? This
> is bogus tag.
>
> > Reported-by: Zijie Zhao <zzjas98@gmail.com>
> > Reported-by: Chenyuan Yang <chenyuan0y@gmail.com>
>
> Where are the reports? Why three people are listed here?
>
> This is an open source work and public collaboration. The "Reported-by"
> usually means that the issue was reported to us, in some way, usually in
> public. Can we see the report?
> Otherwise adding non-public, non-verifiable reports is useless and
> clutters our report-credit-system.
>
>
> Best regards,
> Krzysztof
>
>
>
