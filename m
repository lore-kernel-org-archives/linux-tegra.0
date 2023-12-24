Received: from mail-il1-f177.google.com (mail-il1-f177.google.com [209.85.166.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA82010787
	for <linux-tegra@vger.kernel.org>; Sun, 24 Dec 2023 21:34:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ogjD8IM8"
Received: by mail-il1-f177.google.com with SMTP id e9e14a558f8ab-36000a26f8aso25505ab.0
        for <linux-tegra@vger.kernel.org>; Sun, 24 Dec 2023 13:34:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1703453674; x=1704058474; darn=vger.kernel.org;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=TfM2Ozc84jVU4EjDuheFZr1xJI8bldYDvajnMAoQpG8=;
        b=ogjD8IM8k6nG6i47WrDOpIVa5tb0zEcbectB6OzBQjfO6QQf+gJbNgemrWecQ4KZ+a
         Bd+NB0HK6TKsTJx25uPuM4c/VQ3W45XIQPfpjcRCqsgQikg2qFPtR4HSj3W8ndYmEbwt
         U3AXQmq3EgFXeqc2JxLdn7OVbRN2vYlSbnDNDiVPkRP+88dXmM5NLIN9sfdFfXpDarxe
         cZ7KIz37Pmd3cx6uMT6jU0nL1RxkMEJUebyc7URqXzA0TlfinE/1pcTDP4uy2uMJFom0
         e9ClyTGGDsU6Z1qlbquIGe/0CqkMZ/wbYDWO/yanq0sFeH7QN8cxG1gyYU4eDF51jHEY
         b0cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703453674; x=1704058474;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TfM2Ozc84jVU4EjDuheFZr1xJI8bldYDvajnMAoQpG8=;
        b=JGTvHu+Prr80ROwVlqw4uB7z5uPskvNluMeodLHpfGzw7G/PSJ+fRqiQxnwfPLJVde
         evyKelb3Nwo4rrsaE94alZoOZxRkioguuVd6isGXXarR6SRBzcZkqwQnDH+CpRjLO8Nr
         GCaeLZc1t3T7Vo/6XAjfi3GogpzJ7TBWOUoankesdEuvhHt8jR/ZGYwqNBt0hgRQAVQP
         YX0X4fVVkAlWQ6cjrw74Sqe7qX4NqCkYVg/M1JFuC+wd5RSLDY4bXr0RL1SY61oqBHkC
         4G56Lso5YA2/XqEPn3ZcDX/Las4XkwbUVvEV7xFJ4r0ca6upq4I5c2jDpD4w6IH90SKW
         TIow==
X-Gm-Message-State: AOJu0YykRR19GchM31P4gWS8LKGHOX9ksE9zydPamxVshqQMwDQTGbZn
	ivWiDaTHUe+vY06cKdfl0i8Zk/+ugLCC
X-Google-Smtp-Source: AGHT+IG3cVdgoPXJNOP0FoX9QP3AtXmf/dh4TZ34AQ57wFrWDSmH4MJwWcFfrokVe6jo4lwlGVdhWA==
X-Received: by 2002:a92:6802:0:b0:35f:ff76:2d40 with SMTP id d2-20020a926802000000b0035fff762d40mr25383ilc.28.1703453673759;
        Sun, 24 Dec 2023 13:34:33 -0800 (PST)
Received: from [2620:0:1008:15:c723:e11e:854b:ac88] ([2620:0:1008:15:c723:e11e:854b:ac88])
        by smtp.gmail.com with ESMTPSA id h16-20020aa79f50000000b006d9ab1e15c3sm2281753pfr.129.2023.12.24.13.34.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Dec 2023 13:34:33 -0800 (PST)
Date: Sun, 24 Dec 2023 13:34:32 -0800 (PST)
From: David Rientjes <rientjes@google.com>
To: Pasha Tatashin <pasha.tatashin@soleen.com>
cc: akpm@linux-foundation.org, alim.akhtar@samsung.com, alyssa@rosenzweig.io, 
    asahi@lists.linux.dev, baolu.lu@linux.intel.com, bhelgaas@google.com, 
    cgroups@vger.kernel.org, corbet@lwn.net, david@redhat.com, 
    dwmw2@infradead.org, hannes@cmpxchg.org, heiko@sntech.de, 
    iommu@lists.linux.dev, jernej.skrabec@gmail.com, jonathanh@nvidia.com, 
    joro@8bytes.org, krzysztof.kozlowski@linaro.org, linux-doc@vger.kernel.org, 
    linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
    linux-mm@kvack.org, linux-rockchip@lists.infradead.org, 
    linux-samsung-soc@vger.kernel.org, linux-sunxi@lists.linux.dev, 
    linux-tegra@vger.kernel.org, lizefan.x@bytedance.com, marcan@marcan.st, 
    mhiramat@kernel.org, m.szyprowski@samsung.com, paulmck@kernel.org, 
    rdunlap@infradead.org, robin.murphy@arm.com, samuel@sholland.org, 
    suravee.suthikulpanit@amd.com, sven@svenpeter.dev, 
    thierry.reding@gmail.com, tj@kernel.org, tomas.mudrunka@gmail.com, 
    vdumpa@nvidia.com, wens@csie.org, will@kernel.org, yu-cheng.yu@intel.com
Subject: Re: [PATCH v2 03/10] iommu/io-pgtable-arm: use page allocation
 function provided by iommu-pages.h
In-Reply-To: <20231130201504.2322355-4-pasha.tatashin@soleen.com>
Message-ID: <f36a5a1e-f28f-c25b-337b-8c67ccd46943@google.com>
References: <20231130201504.2322355-1-pasha.tatashin@soleen.com> <20231130201504.2322355-4-pasha.tatashin@soleen.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 30 Nov 2023, Pasha Tatashin wrote:

> Convert iommu/io-pgtable-arm.c to use the new page allocation functions
> provided in iommu-pages.h.
> 
> Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>

Acked-by: David Rientjes <rientjes@google.com>
