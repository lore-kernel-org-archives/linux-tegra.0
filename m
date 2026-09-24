Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9C5F4A1E06
	for <linux-tegra@vger.kernel.org>; Thu, 24 Sep 2026 19:25:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790277956; cv=none; b=uynhj4l+0DGoPPUz9KE1XBAbhZCPNQa0leLa+fpzZ8b0MXP2+/T6MyEDW14qlvgfqeXF4SSFrdJCZh4TXSF/RrG/SMSfxhOGvAMk60ABkqzsjpLS344KVi8U6Oh4mo/CLwQW7ByLKrM02QdSMf2hyAe6tkeGGgdFgxmVMNOCpFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790277956; c=relaxed/simple;
	bh=yl7byw9V/8EXNs2araC6QFRi1x86VMjG7XO2NiJSzk4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=R7IYSpSnWqqhPfawCL1FsZb0+hmvxssSlBR9ZpuPLSqIymZQ3jN8iN+BdySf/6BFjDZ1F6kkgxS/Mm8eAXOhc+pxwfxQy3pjZT4Bclay0k4gA5fdSXr16mFMqQ4AYwoenl3tvghkrINSK78VRVQziwOj5fRjhvPyuqQJL0mXqP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=CqTh1vrc; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=TGKsAV9f; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="CqTh1vrc";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="TGKsAV9f"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790277942;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nvu4jmSjpEKtUCT3yeOXCWZTbIcGf9M3fr7tv012qzc=;
	b=CqTh1vrcIWGft2qvKa/xmVqMruaTeXZurfB5aN889Tkoap0QiAwpwCWVm/6dnrRxVCLLBP
	dISHwFjBEGSLp3pn0gkUEkYVjFbIoaXraKqwoQWirmKCQbeUy2vlUzfEFbPj51tvk8JVJw
	9mWsv5anVwRKZd2orSjfKgFhvcirT7k=
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com
 [209.85.128.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-588-5xYe3AAZM5OCwc4yWrDrYw-1; Thu, 24 Sep 2026 15:25:38 -0400
X-MC-Unique: 5xYe3AAZM5OCwc4yWrDrYw-1
X-Mimecast-MFC-AGG-ID: 5xYe3AAZM5OCwc4yWrDrYw_1790277938
Received: by mail-yw1-f198.google.com with SMTP id 00721157ae682-836c9f68dcbso3912137b3.0
        for <linux-tegra@vger.kernel.org>; Thu, 24 Sep 2026 12:25:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1790277938; x=1790882738; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nvu4jmSjpEKtUCT3yeOXCWZTbIcGf9M3fr7tv012qzc=;
        b=TGKsAV9fi+DLWxN09as3YJADsveqqIn8KJhoPq2noPQsugKWnTvjX/M66N4Zea9eQ5
         xXGv8uGRvAg9fofn534kdy18SAECxVpqer2El30lR6n06mUZChUDvrJuj6M4YqbKZVJT
         ehzjGSmAoV32N7kHP+6mzhZNYC0Wfx4rkaJLd2hiBLqd0IH4ttaUzXI64tifLL5JxuP0
         AS1lxVjxsLryNM+VgYsBuRclP8vqVSaJLhhLfdcGxk2CF6rmla1+j5cB8kS9boTAFpr+
         Z2EFLV9mnFYHgo450rKgr6Tqw2P4unYg462rbz+PzMItMQItypb1NMPDDEroXQJC/Kuu
         6O6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790277938; x=1790882738;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nvu4jmSjpEKtUCT3yeOXCWZTbIcGf9M3fr7tv012qzc=;
        b=1tMyNb+/PF+3kIS55d9KaoysDCjBOinnZxkQ4F3+xN5hVXqjFTqAt3xCMQGmo5HNP7
         70g5wu9QI7XWcL3UEzbDfoa/dnQleWGcMtIpGR5MkEWLya2D/xVMQ5JprH0l7HI/4y87
         CRJs7lkhGgeta9Nmg6bXsXaGgxvfAljO+XqCRDADw6C0knGbtgEm9X3uNN/V1Uc9NhJD
         Ebd301+fk5jKsKh5ZU3XuXvyl/K4XtfyFm7yt6qFdI6/tbiyY6228G9Fo+mQq59V/Qmq
         NduiuNaI/i1V414x6r4OshQ5xmf8Ohr7XdMpP84cM8svqgD+iXkIio0eZPYsINwXChTs
         ca/g==
X-Forwarded-Encrypted: i=1; AKwUvBw0nAHrYH2VR/QnxxUJZPgGChvWadsm/1YMhtYF4//yEhwch3FhDKCqAswaKugDs6QI3qsuvz/WdCmnLA==@vger.kernel.org
X-Gm-Message-State: AFuF++njKGzsYVEv8JJ59u8StNdymn69sq5/fjH2keprRH6Uya1kzRZr
	flH0VysVEJ1XJZtpkQdtvMof7ZpWluDbvroxgi5Y7uL7tZoVxJMjGXzmjjFmEGG0f0V2yai58Q3
	Ga10JnLx9/TtTTTZgEdKoUQSOrvaRmSKSg8qLB1MmGTZnHH8Spi8TaTbj/YV/iN3K
X-Gm-Gg: AYBFou0uUSsS1naUSJJx0xAFgHe93NniRI7cQWKofrymXcRWk9wVELEofk+JA/G4wI9
	6YyPLohng05nkEGzDg4Y3OJguthm4kgAghzOfV5RjuEawj7fCYtVl4B0Fe1DC9djB3NkxyC9+AT
	UTOpCsKlW7FFGOivGj6tdzP2O1QrwrZ00VQQFnn174ab6r5l8nhH24eLouEJTc8c/fIYS6enjyA
	DU90QmesKclItCq3C4UB+v916NpY/HRe2qGBmnYgTRskqdHyZY/C5BcdDqWNb+4jmJa0/VuvpC3
	q0IZlvctp0Sn/zbsNhweGfCGNc2Ike8DX1rTLsL1yuSnJx2j3ImYpurRkA099EUS6lpvEy4u7mi
	FEtdD8MM=
X-Received: by 2002:a05:690c:6607:b0:868:505e:b935 with SMTP id 00721157ae682-8a64bb008c0mr22054717b3.13.1790277938302;
        Thu, 24 Sep 2026 12:25:38 -0700 (PDT)
X-Received: by 2002:a05:690c:6607:b0:868:505e:b935 with SMTP id 00721157ae682-8a64bb008c0mr22054527b3.13.1790277937833;
        Thu, 24 Sep 2026 12:25:37 -0700 (PDT)
Received: from [192.168.134.224] ([2600:382:8501:4f43:e566:7498:c7c8:a7ec])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8a860e5a5e9sm1031967b3.17.2026.09.24.12.25.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 12:25:36 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
To: Thierry Reding <thierry.reding@kernel.org>, 
 Jonathan Hunter <jonathanh@nvidia.com>, Bill Wendling <morbo@google.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Kees Cook <kees@kernel.org>, 
 "Gustavo A. R. Silva" <gustavoars@kernel.org>, linux-clk@vger.kernel.org, 
 linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-hardening@vger.kernel.org, codemender-patching+linux@google.com
In-Reply-To: <20260922110601.1959213-1-morbo@google.com>
References: <20260922110601.1959213-1-morbo@google.com>
Subject: Re: [PATCH] clk: tegra: annotate struct tegra210_clk_emc_provider
 with __counted_by_ptr
Message-Id: <179027789851.211017.14017390990337858574.b4-ty@b4>
Date: Thu, 24 Sep 2026 15:24:58 -0400
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=355; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=yuS8PUHpyjlmxe/bLBUuHCrQMMO3MXVmrvfWzdbYyP8=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGLK2VmpOuG07yfjjy7Z1G4vOC1trzMrY6ObP/vv2JuZHR
 1dIrmqQ7ihlYRDjYpAVU2RZkmtUEJG6yvbeHU0WmDmsTCBDGLg4BWAiIiaMDLuWajPG8J80S8wz
 m8g+ide+/k6w7+bZm3mkDlhaRVzK3sPIsO52hPCLV16fpLdfu2EgPPVex0GRoEtfZ5TKizPxXPB
 4xA4A
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087


On Tue, 22 Sep 2026 11:06:01 +0000, Bill Wendling wrote:
> clk: tegra: annotate struct tegra210_clk_emc_provider with __counted_by_ptr

Applied, thanks!

[1/1] clk: tegra: annotate struct tegra210_clk_emc_provider with __counted_by_ptr
      commit: a1f2029b89ccd7bef54e187384417db4d72d0a11

Best regards,
-- 
Brian Masney <bmasney@redhat.com>

