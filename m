Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="RCU1zb38"
Received: from mail-oo1-xc35.google.com (mail-oo1-xc35.google.com [IPv6:2607:f8b0:4864:20::c35])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3C6CE19AE
	for <linux-tegra@vger.kernel.org>; Tue, 28 Nov 2023 15:53:59 -0800 (PST)
Received: by mail-oo1-xc35.google.com with SMTP id 006d021491bc7-58d4968c362so2425914eaf.0
        for <linux-tegra@vger.kernel.org>; Tue, 28 Nov 2023 15:53:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1701215638; x=1701820438; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=IEFdBGBIPfDPsFioHp1AVnDQQb24hQej9vfPWpRMMTA=;
        b=RCU1zb38W1lDnFGuc/2CUsbLnoo9xXAJSrXg0v2WFXuB5lsnFzUs2hH4BE6DXrHKLy
         1rMNTQ3c8Yx7INXmJNwkJaZhLhKO/fOzPqfqSYhqUZ1wnFHGOMZez+wLEERKha1Cmxzj
         UyQzurKjXdTTf8oAqDGdOV+fZleg3V/L9XhgQc9thk17Hi0vLgbgqHa9neDAf13jZW0p
         PQiRw15NyExgFvO0p88kYGEhcfN6mrm/Pu3xzZcbvMUIVdbr8ppGEf+mWabuaq+Hjj3h
         bTTDZkWzutTErpZHE26ZdRxikFAEXVLtZN+ODOHULs5bGeJvDCpk/HwhWDLl7vwzcKc3
         x1Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701215638; x=1701820438;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IEFdBGBIPfDPsFioHp1AVnDQQb24hQej9vfPWpRMMTA=;
        b=GxjYicjQ8Vj6+sNP7V8t8RffFhFnYCq9Rok+EgK8lo6OaxOTi+1WT6OcGpp6rety6z
         hf2EfV7aQQuPxXho9DsxubY3td4k0k0XmokCC8i02rHDDvQggJ5AFvBYlBI3dcr8Odvy
         HIlgOyXU3auX4CW0rhGnM5jkfzFBMroD7uTlJZaUNl0tEG3u4aD2/gePCcns9pFx9nM0
         lKsMpXtfMHOA99fUI1IpzAhcAyZ57hyrsm3SnihMJYgLcEp4nHeXceHoOeNTDRNQkbz7
         Bg7ybtCovxUC2ztBZG6mMDSmrWtw/I6iGEfSINPnjtsnYo21byx/kTZVtURsKM0E2heN
         b20Q==
X-Gm-Message-State: AOJu0YwBX1A4HGQ5YAIxMmuY5d1zsOnzoP9Kt/B62nwRwnn4wbZq3ZIV
	lJpipYmLBrJb/wFuDz4gThgMCA==
X-Google-Smtp-Source: AGHT+IG+JvDO46eVb/i8IDuwEuHhA2SVxYkTSZoGtbM2c6nncwzUAA0+bA0p676nl1Is/JNEkvg0HA==
X-Received: by 2002:a05:6820:160a:b0:58d:9bb6:c38c with SMTP id bb10-20020a056820160a00b0058d9bb6c38cmr7347167oob.3.1701215638582;
        Tue, 28 Nov 2023 15:53:58 -0800 (PST)
Received: from ziepe.ca (hlfxns017vw-142-134-23-187.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.134.23.187])
        by smtp.gmail.com with ESMTPSA id 63-20020a4a0342000000b0058ad7b0b1a8sm2117307ooi.13.2023.11.28.15.53.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Nov 2023 15:53:58 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.95)
	(envelope-from <jgg@ziepe.ca>)
	id 1r87tt-005jIw-Fu;
	Tue, 28 Nov 2023 19:53:57 -0400
Date: Tue, 28 Nov 2023 19:53:57 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Pasha Tatashin <pasha.tatashin@soleen.com>
Cc: akpm@linux-foundation.org, alex.williamson@redhat.com,
	alim.akhtar@samsung.com, alyssa@rosenzweig.io,
	asahi@lists.linux.dev, baolu.lu@linux.intel.com,
	bhelgaas@google.com, cgroups@vger.kernel.org, corbet@lwn.net,
	david@redhat.com, dwmw2@infradead.org, hannes@cmpxchg.org,
	heiko@sntech.de, iommu@lists.linux.dev, jasowang@redhat.com,
	jernej.skrabec@gmail.com, jonathanh@nvidia.com, joro@8bytes.org,
	kevin.tian@intel.com, krzysztof.kozlowski@linaro.org,
	kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-mm@kvack.org,
	linux-rockchip@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-sunxi@lists.linux.dev,
	linux-tegra@vger.kernel.org, lizefan.x@bytedance.com,
	marcan@marcan.st, mhiramat@kernel.org, mst@redhat.com,
	m.szyprowski@samsung.com, netdev@vger.kernel.org,
	paulmck@kernel.org, rdunlap@infradead.org, robin.murphy@arm.com,
	samuel@sholland.org, suravee.suthikulpanit@amd.com,
	sven@svenpeter.dev, thierry.reding@gmail.com, tj@kernel.org,
	tomas.mudrunka@gmail.com, vdumpa@nvidia.com,
	virtualization@lists.linux.dev, wens@csie.org, will@kernel.org,
	yu-cheng.yu@intel.com
Subject: Re: [PATCH 16/16] vfio: account iommu allocations
Message-ID: <20231128235357.GF1312390@ziepe.ca>
References: <20231128204938.1453583-1-pasha.tatashin@soleen.com>
 <20231128204938.1453583-17-pasha.tatashin@soleen.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231128204938.1453583-17-pasha.tatashin@soleen.com>

On Tue, Nov 28, 2023 at 08:49:38PM +0000, Pasha Tatashin wrote:
> iommu allocations should be accounted in order to allow admins to
> monitor and limit the amount of iommu memory.
> 
> Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>
> ---
>  drivers/vfio/vfio_iommu_type1.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)

You should send the seperately and directly to Alex.

Jason
