Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AAD13101D8
	for <linux-tegra@vger.kernel.org>; Wed, 18 Mar 2026 21:46:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773870416; cv=pass; b=PQ5UTaXmgu/X8/pTXuWp6TIseEEvmaYJcDCioolsd0H/d989TaEAwMirvKlm6xg7a+ED4dOKCUXxbhqnY61cFUdycsQM2hok5jbtUjDPS/RSJBNiMlN5Ku+6bX5zLMYGv6ooPEh+njzmIBYNBgfspFbzTDa6lDb1oUqeFeDpnUw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773870416; c=relaxed/simple;
	bh=WdGHCjpiPrjUbuJbv2ldSfKslMmyMYGExyvnXvzEWDc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LBTRmGydFxM5k0c7K4Q0g/AIlaPCKymfjJ3Dm6hQbKxd4rDBbQdzxY+5ljCciglnwbfPeq9TcktjwoZ4gvUv+8wdTvo3sSYZAQ8JcVmxMrA2wcG+LQeYHKUwqROnPWUIJw6sB3/1crmqy4HafabwbY/v1qjAc3KKseCLBnQghR0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f9UTwlnX; arc=pass smtp.client-ip=209.85.128.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f9UTwlnX"
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-79a60975dc5so4518567b3.0
        for <linux-tegra@vger.kernel.org>; Wed, 18 Mar 2026 14:46:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773870414; cv=none;
        d=google.com; s=arc-20240605;
        b=jowLEXVyNCht4F13fwMbJTuNXqkyxKoUXFpJWc/9X0XMvB1WJfKMsDJqZzuGu97prq
         biOjlnMEPaPxyPuwedZvtWgiXYWYKU09Zsvx653lWfdZmLuRPk/vPf+TxseomdWyP9Ik
         Vi5/PRcJ6Dh9ZtijEwUz932K082UlRFDsxGq9g2o5yYPkWd1QyqF7wucsueittSWhfc3
         cV9ktxUSPX2Aev7CIQVWXpId6ITXugGpXqdSQd0kG8v610cV+3zTYzrCnpiX+vtf75LQ
         XuETD7rDvsveVgluQ9VJNNbXygXzfdCg2TR7XZOrkwlj7rrzAxgOH7spV4MLyjho9lYz
         zJqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=WdGHCjpiPrjUbuJbv2ldSfKslMmyMYGExyvnXvzEWDc=;
        fh=nAcJX9Ej75zwQKWo6ePVFPUHtN7xntVsaWZRJludsvI=;
        b=NkGkLXvdehpKs2HananGl9bR1VWHvJMeV4z0nyOtzQFEKry2DdSmtGkIhsz291s54/
         tFGlLwB7qi45U7AvywHj5zDPFeqbeUkpW7dNcuIhOZae1FsYEARgbJhVRR9qVscXBZ1H
         iSHD1GMhENzfBM/0tTmK+S+r6riHG/rX7bUgfoG171ubodiGQ/xjguZN3eI9mAQTB4GC
         6GTPo5YNU1P/BrlnHw+yxzhgDqsRg0YGo+P4u9PaZ3xk9gNPOxFB9rBQsRR3ejd2Uq3I
         ZXir0a2Ppl4/kS/7mQpsQjv+X5tvScWsCB4PeAdHJP0MLnFqQs4xMkIB4mUvvYJVsVIc
         LeoQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773870414; x=1774475214; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=WdGHCjpiPrjUbuJbv2ldSfKslMmyMYGExyvnXvzEWDc=;
        b=f9UTwlnXzZ8nxJPXzOjGkeqcfD9ZOx7YSea4QgnEC8WQAKtVQYoFRlVflZtzDUzvhO
         AYGW14QbgHGjlzYoxoaoCosawjrqnMC0ZvjnCpqhTFdVAcDmuuM7aBP+9zDVuxtcU+Me
         y7iYXJbjYGuNBERMGoFG4T/FgetHISY9ZAY6ckcCFRaibvp6AmWumC2SSmWYpMidethk
         5s+RtrvdhMbkFiq65bz9din0XBYR6a7OtpEhCO0AvcRiUMJmACtR60smFwASOiFqfZeQ
         8b999QKuNWe3D7/GCa9cHjRNnz6B0gA91UjX7ILsgCUyEFdPExIvG5wk6Pgl0JpMHbO4
         SNIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773870414; x=1774475214;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WdGHCjpiPrjUbuJbv2ldSfKslMmyMYGExyvnXvzEWDc=;
        b=Nc5Gw0+wyuIB2ieWO5WIgR2NnJ2XGOfcSjr3masEcASJByvUtP0r4t1rd+RAOo8+EW
         Os3IiDFAImf65V3dKNKcOLD4Gdokw0INdbk+uu+nTnXCb6yHHKPuBV30hI+Y3snL1sna
         S2JQTtjNh6eh1Y9Tlle3fjqYYN6jqXHqoc2ZNhZiXSH0ZPr9S/U2SXctu8qV8NEPZzpg
         /cln89v63uLBeyX2KAMOQoUNpwcGfVP+87oGtgWKFlHeWvDlJwP15glBfpmr4GBJUe+2
         T9FnDz51b0lTrx2Ai53+qJ7QMJEbynfedfS9IpKp4l827uZqodhLpJbzV0ci+FtTPgjs
         wkiw==
X-Forwarded-Encrypted: i=1; AJvYcCU9ZbVRUhdrS49eJtiM7KRujPhgqadixzkpiXP2be0w7vBKgPyICwP02EiuK2qQhgAEpIiRfCa9otZI4w==@vger.kernel.org
X-Gm-Message-State: AOJu0YxCfYQFupJhF7KbJwJDtciao3kqif3YYSG2/kyclwyEtJehCY52
	AErZa/sdTCF75l3j6k2doltlFYv0vtyEdr8uiYfKxeqzz3UUAo+PhKN0Lc6t1K5wh0f7pQsBaNw
	AO9UjLNurAQr96InbJKl9MYqvnEKP72wVo9j/
X-Gm-Gg: ATEYQzz83bxUpyw+tF5A2w/AWhTHUILoxTvZ+7OB4r/QESEIiVv+mZ9HVS5UidiSb5U
	bxdibCmPmaCVAy/eLcq1DLhebOlRdRSR/CRdTvJdOOBvy7JjnZmz6sm9UT+dSd261MafhTvos7T
	aiKmJooURZdRug0jNTQcoPhmxzBQtjOStxKMgufxNlkr7rPAIVaiHarzp34xuWAt/cfhjFOIHn+
	7sbKYV+wxfw34y9IfU6fwgmJbD8IFxWddVc+xm2M9LA/Bd5i938aaW7uQNJCJzbHPvRNB3Stvxv
	xKEX16ktS5DPiAv0Jcsu/7aS/K3JlsG/W8s+oXTgSA==
X-Received: by 2002:a05:690c:306:b0:794:ede8:16c with SMTP id
 00721157ae682-79a71cb441cmr51434537b3.60.1773870414582; Wed, 18 Mar 2026
 14:46:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <2026030929-uncheck-reclining-315b@gregkh> <20260309220718.6475-1-rayfraytech@gmail.com>
 <2026031833-pampers-steed-4804@gregkh>
In-Reply-To: <2026031833-pampers-steed-4804@gregkh>
From: Oskar Ray-Frayssinet <rayfraytech@gmail.com>
Date: Wed, 18 Mar 2026 22:46:44 +0100
X-Gm-Features: AaiRm53ByA6VMxh7mCaA4VxNX-qpBPtj7ba4TdrG9fDe7BmJ8WXBi91iGdO7w1A
Message-ID: <CAJioSGc9+_g_tSaSjaZKv=1Gw4YyVbSP7k_cfhKVaMEB31o3Zw@mail.gmail.com>
Subject: Re: [PATCH v3] staging: nvec: fix block comment style in nvec.c
To: Greg KH <gregkh@linuxfoundation.org>
Cc: marvin24@gmx.de, linux-staging@lists.linux.dev, 
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, Mar 18, 2026 at 3:59 PM Greg Kroah-Hartman wrote:
> This change is not what you documented is changing :(

You are right, I apologize. The commit message was incorrect.
The actual change was reverting an accidental capitalization
introduced in v1. I will drop this patch.

Best regards,
Oskar Ray-Frayssinet
