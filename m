Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="db3UtXdY"
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com [IPv6:2607:f8b0:4864:20::635])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 66EBB121
	for <linux-tegra@vger.kernel.org>; Thu, 14 Dec 2023 09:59:59 -0800 (PST)
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-1cc79f73e58so3345ad.1
        for <linux-tegra@vger.kernel.org>; Thu, 14 Dec 2023 09:59:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1702576799; x=1703181599; darn=vger.kernel.org;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=PZ9x6kLcBYiEdBJWGUfxINmlIVM3g2sEltrcooCIdH0=;
        b=db3UtXdY8aBQieI3huxs2sGIoL44TLlJEKvRJ9MvuvbUxHU3JVbetHrCOko0PxaYDd
         SQzKmE6QChugPbwUT8s/lxkPf0UkAvt13KrFtZEXZX4rMQQ650K0dr3DZdsC3NRgB36i
         pBHhOCpCZ3YMqMvG6wGirj87knntUgZv78I8GG5CeRAJcy1ANUplXaVb8+Y5jpz0dz+l
         xnzL/RKfGWhpmAsEroo7eEdvUqC+IZ2x6mUqhBBS8m17QwES3aBg/C28cZhbTAzVNMwY
         udJ6WpTCp61nq+q2eb+sqa8Fv5xeOHLW8EmjI0dSzAwryZO613j/HxQP66J/x51yjoM5
         64oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702576799; x=1703181599;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PZ9x6kLcBYiEdBJWGUfxINmlIVM3g2sEltrcooCIdH0=;
        b=PMGsjyJzsFiMRZxeBhzRj5rZD39pTFxwX+7he8hgkvwgJZ4Rb6ll+0ovnGZZisqthU
         dlIwjGGqCcgN7Js/NRk7Hy/BEs0wlOAE3A8vhLcWab9KYVaZA+04JZ8n5PeZVnpeZL6+
         bCY25rkcami4dgvndroy/Ho5KwHfEenoyt4QEbgpTQyQdm1fyj1yFZGzVzC4G4pqENTx
         n64wARZz9Y4T3w/nNTnDZKWw73J0/1M90+Fx7DyO5aOgDaK3KsO3Q3CC9BueVpfBi6Jb
         D58jJQeurrrIxerCccC5hvA808zYJZBNLolT8BurRTS0S/2iehzkqQryYW1QkepCuRqW
         iSkw==
X-Gm-Message-State: AOJu0YxcihCe8GDc2nelV4D0w14rfSgCbs6ncuS4nh0XPOD0l/Xp8iuA
	7p8yi8gTdDzpPXUGJ/VuEEyJeA==
X-Google-Smtp-Source: AGHT+IH5RplbwvbCKQv+ptuR7ZWj127uLmsE7SQkvEwRe0Gbuexa/KME9clMyovQW6MkVTsfPUZxog==
X-Received: by 2002:a17:902:d2d2:b0:1d3:7d54:be3d with SMTP id n18-20020a170902d2d200b001d37d54be3dmr49997plc.6.1702576798577;
        Thu, 14 Dec 2023 09:59:58 -0800 (PST)
Received: from [2620:0:1008:15:740b:4c24:bdb6:a42a] ([2620:0:1008:15:740b:4c24:bdb6:a42a])
        by smtp.gmail.com with ESMTPSA id y18-20020a170902b49200b001cfc2e0a82fsm12675679plr.26.2023.12.14.09.59.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Dec 2023 09:59:58 -0800 (PST)
Date: Thu, 14 Dec 2023 09:59:57 -0800 (PST)
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
Subject: Re: [PATCH v2 09/10] iommu: observability of the IOMMU allocations
In-Reply-To: <20231130201504.2322355-10-pasha.tatashin@soleen.com>
Message-ID: <88519685-abfb-e2f8-38b4-d94340b40d1d@google.com>
References: <20231130201504.2322355-1-pasha.tatashin@soleen.com> <20231130201504.2322355-10-pasha.tatashin@soleen.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 30 Nov 2023, Pasha Tatashin wrote:

> Add NR_IOMMU_PAGES into node_stat_item that counts number of pages
> that are allocated by the IOMMU subsystem.
> 
> The allocations can be view per-node via:
> /sys/devices/system/node/nodeN/vmstat.
> 
> For example:
> 
> $ grep iommu /sys/devices/system/node/node*/vmstat
> /sys/devices/system/node/node0/vmstat:nr_iommu_pages 106025
> /sys/devices/system/node/node1/vmstat:nr_iommu_pages 3464
> 
> The value is in page-count, therefore, in the above example
> the iommu allocations amount to ~428M.
> 
> Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>

Acked-by: David Rientjes <rientjes@google.com>
