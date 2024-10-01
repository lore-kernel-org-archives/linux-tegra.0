Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com [209.85.214.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C9DC1CBE98
	for <linux-tegra@vger.kernel.org>; Tue,  1 Oct 2024 20:09:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727813355; cv=none; b=KMgvO8gOYbZEa6HgQjt9QQTINraC7B0hq+MhGBYodhsmpCT5bJb7KpOx9hqkHumtXm70cZVif9nd/tHcadOi9D4nYn4IOSLbCqmlviSOxTxUhKzz1eZZJ0IKTgu83ZSaN68zz6HP3dMl974axUQT46X0xurCJkRh8sxNLWBabFk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727813355; c=relaxed/simple;
	bh=8HRmpFeZV4eYtlbEGAV1Setz9f/MptVynN2vC19Qpxk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gRLKWPrkN7e576PKNHezHLwDp6ARmGTbPgZtV5XNpC7fVSrECXraIXTsDdJQtwBP6Ogka6QAhYzbXaUZGunWlHc08ennI9GlhrZV88O3GzTuezzeLeKC0UwdflXANhTC+gbFcgZzAI1y82qqD3FZmTSI0XgTDLKWbu4VBJHjWHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NBNK5kqf; arc=none smtp.client-ip=209.85.214.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NBNK5kqf"
Received: by mail-pl1-f194.google.com with SMTP id d9443c01a7336-20b95359440so21175505ad.0
        for <linux-tegra@vger.kernel.org>; Tue, 01 Oct 2024 13:09:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727813354; x=1728418154; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8HRmpFeZV4eYtlbEGAV1Setz9f/MptVynN2vC19Qpxk=;
        b=NBNK5kqfP8uT7SF+QtZWjF9GCaUs3rEmvbZH91FI1ftB4l2S+Z0P5DZRfk0zMCnOL3
         WTQyJoqnaJc+xVdeseLMv+YYB8JB00H83T9ZFUCBkFQ6HobLdKRmIHOE9kuKGRWYs4Cf
         qVNBfg26/jFdwV7GmjCGSOGy9C01qArJRn2WyMFLExEvJ/fbhfXLdxHno3+d53B/1ddx
         nxuPeKQ2PltPQff3T1MefE3hEH6fHk0jA47GQ2aY1xMWlDli0xn/cIOExCsGWdsQnnfY
         oigfS8vFbbh2zNazeAJPJ+6P8Odz0z8Tk9Ahg9qslp3D7Jz4Pp+MhGNSjdyou/OH4d7y
         +VPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727813354; x=1728418154;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8HRmpFeZV4eYtlbEGAV1Setz9f/MptVynN2vC19Qpxk=;
        b=F+16iKlju5xVl/VaetIFO00wbMEfu7Xw1UTGFWBF5oanJlvYxrBiHLCV+5tY7Q+LV+
         nvbgYTluyCxPgTYqi9IBFqYlBEXjtHw36qImByJkCXN7lNwv1RXk4CED+sm+jEaFvfT7
         pMIgxf68/+Jb6iCSxeADiFn1bkJrhWPT3zQhQ/KQaAxrBF7oXH8+9cAwfcocjyBiePqo
         NBZUtET0K5wjq1j9vm02FTFhBgpzn/EeRz/cO5B4vkqiuNEwFhCpwTm0+2UbQxzMmmR6
         Y3r9uCqC9ze3Y6FANJHyayQVfna6pSNYYgRphTHxoGCqzSGLycOlD3TSNJKHtBupxMrF
         eebA==
X-Forwarded-Encrypted: i=1; AJvYcCUwTNFW4jybtHxY1Zf2MYKtFBh3F6AYQ6YgbNISr7GDZDLtIUE/WXDbprk+CTvcHN+FaAVSZWWsRVXJoA==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywim1Q5cnM7rvcv/O9G0d/xDqHsnkfbk73WdH9xNbAcSKbQKmNf
	XmHHH94pZNivmsXmtdnyayvmrvL4A7XcgcZ6Cp/ev+5I+PNXARcwlBBvAhfqDCixLMrJRUTyxtd
	oIC/V17EearR12gL0+RbqU8sQL2K0I6TeQKMHkAed
X-Google-Smtp-Source: AGHT+IF7wYL4jN7QzuA8efMSMy2vvQoms1mRzsUUAGRdat3E/L1QKEI9mGPxUMF+5llXS2kz9ysdQkPiPGAeUXyO7Hg=
X-Received: by 2002:a17:90b:188d:b0:2e1:8a29:99e with SMTP id
 98e67ed59e1d1-2e18a290b9fmr348039a91.26.1727813353887; Tue, 01 Oct 2024
 13:09:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241001190953.31152-1-zichenxie0106@gmail.com>
 <e8810b65-8ae7-4d47-a89b-a1471b70409a@linaro.org> <CANdh5G5EUhT5N17QofverJyR2QxRDt+BAn7pvThkxgC0S=OB8Q@mail.gmail.com>
 <171a2cad-35ab-4a81-a9a3-ee73a762f321@linaro.org> <b82f6079-b349-487c-9e9e-a836933dea34@linaro.org>
In-Reply-To: <b82f6079-b349-487c-9e9e-a836933dea34@linaro.org>
From: Zichen Xie <zichenxie0106@gmail.com>
Date: Tue, 1 Oct 2024 15:09:03 -0500
Message-ID: <CANdh5G5T43sS7wKxgkUGUgKcqSdeZoVTHWiC5qU9SKvk2Mq4iw@mail.gmail.com>
Subject: Re: [PATCH] firmware: tegra: bpmp: Fix freeing uninitialized pointers
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: thierry.reding@gmail.com, jonathanh@nvidia.com, sumitg@nvidia.com, 
	linux-tegra@vger.kernel.org, Zijie Zhao <zzjas98@gmail.com>, 
	Chenyuan Yang <chenyuan0y@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I don't think device_node() is a correct freeing function here:
'struct device_node *np __free(device_node);'
even if I'm not an expert in Kernel.

And I think it could be more convincing to explain 'why', rather than
simply highlighting the errors repeatedly.

Best,
Zichen

On Tue, Oct 1, 2024 at 2:58=E2=80=AFPM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 01/10/2024 21:42, Krzysztof Kozlowski wrote:
> > On 01/10/2024 21:35, Zichen Xie wrote:
> >> Thank you for your feedback!
> >>
> >> You can see from commit 90ca6956d383 ("ice: Fix freeing uninitialized
> >> pointers") or any other usages of __free.
> >> Initialization is a necessary and standard way to protect your memory.
> >
> > You did not understand that commit.
> >
> >>
> >> Additionally, the proper freeing function should be of_node_put()
> >> rather than device_node().
> >
> > What?
> >
> >> In commit 8812b8689ee6 ("firmware: tegra: bpmp: Use scoped device node
> >> handling to simplify error paths"),
> >> of_node_put() was originally set to free the memory.
> >
> > What?!?!
> >
> > You don't understand this code, do you?
>
> To be clear:
> 1. Neither your code nor explanation make any sense.
> 2. Patch is wrong - buggy.
> 3. Patch was never even compiled.
>
> That's a NAK, before anyone tries to pick it up.
>
> Best regards,
> Krzysztof
>
