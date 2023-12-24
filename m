Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91D0AF510
	for <linux-tegra@vger.kernel.org>; Sun, 24 Dec 2023 21:39:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="EjRJVnPg"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-1d42ed4cdc7so135605ad.0
        for <linux-tegra@vger.kernel.org>; Sun, 24 Dec 2023 13:39:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1703453968; x=1704058768; darn=vger.kernel.org;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=EOImtChB3trquByqyhjURvrTs5b+pxovzmqfkNY6h9E=;
        b=EjRJVnPgCqC8roRIPxUNBnFna+BYhT6sRvXfmMJWisNDf58gIewumUWgv27egGCzD3
         kU2Q9Szqs5MKenBthlpQokiiBDLXGfVqYIy2CXJglwTciB2dMxzktrCQYfW1A0Xafxdj
         EBo3TKeTJhImcETK/+D7QvAnjFSbvjVoUYkctcaO3BHOcMUWXIii6ykcdn/DlKEKmrU/
         lROoR99TjGJKuJfln1qK9TXXOiDM23X2MTMYOnsO6d5iSC8NcfnR05PNoufw2E3CKtP9
         XSGq3L8W72QGC/vkxZl4bg22du4MUtpnTgxeIGOCT+7a8UYvskpYf8wgLFjoBbzus3an
         dl7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703453968; x=1704058768;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EOImtChB3trquByqyhjURvrTs5b+pxovzmqfkNY6h9E=;
        b=LzSessPpcqmvuINLEUi1scR5BMYNSokQvYyZtE3pQgFEw2tfPnFDz8JbBGyBHtAYjo
         TbsSzMOct7WztKq4kAG2mCGVIoBbRQY7AkqE+W3IvwcMWT4Yv81iIxPsB4LCMacuaFUi
         HvFX6V6Fwhp0V+oOPGzhQ55F0rN9ZW1hhTBvDqgoO6gkELlvy50EAEgRvIikwnxuE3T/
         KLvgL1YDBoqCRi0INCsRbpvp5yWt7bEMLhDwVIjkzFL4+0OMiMyKCkLWm6Z3Rkn+oKj/
         Qj+GeMFmfJ1OFsgRTk/lOJJJHEl0oOvL4blXNh7oia0q0w2vu0E4zFmLMnZEpL/vw17W
         PSJg==
X-Gm-Message-State: AOJu0Yx5HKKT5Bgczo/lvFGJSXV77UE68SZiwR1FhXk2dotcNqCuHzD5
	+jo5UwMiorfYhQNEBk6u8bO0pxSwDlsf
X-Google-Smtp-Source: AGHT+IElpEFSzbeLneHWmSC7ejxW+Do+3dnn4gYiug1msTA/I/LBb12Sdd4HWPHDnGbuoug2DX8XpA==
X-Received: by 2002:a17:902:e84b:b0:1d3:a238:77ad with SMTP id t11-20020a170902e84b00b001d3a23877admr287503plg.18.1703453967726;
        Sun, 24 Dec 2023 13:39:27 -0800 (PST)
Received: from [2620:0:1008:15:c723:e11e:854b:ac88] ([2620:0:1008:15:c723:e11e:854b:ac88])
        by smtp.gmail.com with ESMTPSA id jv11-20020a170903058b00b001d3b258e04bsm6894532plb.248.2023.12.24.13.39.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Dec 2023 13:39:27 -0800 (PST)
Date: Sun, 24 Dec 2023 13:39:26 -0800 (PST)
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
Subject: Re: [PATCH v2 06/10] iommu/rockchip: use page allocation function
 provided by iommu-pages.h
In-Reply-To: <20231130201504.2322355-7-pasha.tatashin@soleen.com>
Message-ID: <25bded65-29ed-2fe7-9db6-570dedf8d530@google.com>
References: <20231130201504.2322355-1-pasha.tatashin@soleen.com> <20231130201504.2322355-7-pasha.tatashin@soleen.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 30 Nov 2023, Pasha Tatashin wrote:

> Convert iommu/rockchip-iommu.c to use the new page allocation functions
> provided in iommu-pages.h.
> 
> Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>

Acked-by: David Rientjes <rientjes@google.com>
