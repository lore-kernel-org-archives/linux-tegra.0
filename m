Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="RvsWmgXg"
Received: from mail-qt1-x82b.google.com (mail-qt1-x82b.google.com [IPv6:2607:f8b0:4864:20::82b])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 93BBFB6
	for <linux-tegra@vger.kernel.org>; Wed, 29 Nov 2023 14:00:21 -0800 (PST)
Received: by mail-qt1-x82b.google.com with SMTP id d75a77b69052e-423e7e0a619so2234811cf.1
        for <linux-tegra@vger.kernel.org>; Wed, 29 Nov 2023 14:00:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1701295220; x=1701900020; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aiOfm5uGDMrP0UYnHwC5BRUcA0oU3b2DbcdcIFPiI/Q=;
        b=RvsWmgXgSTSe55spuxPnTVTCjzAxwYMn8vLxWO0UVjnE/+I0G4uCc/mMWkz7TzlfJF
         KtNWzgzGYoJ7fLVvLoxeVMtb3WDlPy+6hP4iRUccXPRDSbTrJ0gTwMO2CKuKMefAWzee
         AWa1cOJNynCMOnsZbRXAg79SjOOjhjwxG/jxiqwbT6OYyryLd2NFMXae+aTGw7ZYNbNT
         lN5L1ym5+VyVJRztXDpUf9KRzZpuOqiQ8vr22ep7YL+20UAw1+yFUey6AP6YH8T7Y0iX
         +xsXaew4+oGxUiXkTu/6edL8aFZwNJyZj60Wggxyt0s69I5lmMnbtZaKAuS/hIAHRZNz
         oSBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701295220; x=1701900020;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aiOfm5uGDMrP0UYnHwC5BRUcA0oU3b2DbcdcIFPiI/Q=;
        b=KWzEJYXNGejTdTNPzUtm7c+BEwkjlQOHUwFd24BHAc0R9cBEx9/iKby956MAgGMIBi
         z53CF4SBhqOZ9umltaaPESEg/MCMs4qR0NdH9ZfrG/cD/jyYbkxmjgO5QPT9SDISEecS
         gzp8DIU1Zx4gfQS2a/h+R2jTeyNcaFZhK3JNtqqQAAphkruxtYGhmjP8qKIjwxJtcMiB
         WzlrcYj+SQe/sJ9D8nnux0gtlqLgT/u0V2c1WjN/pPJF6TNEdpKVvHGzTlOd0L46HPhp
         dKN05ZxVxW/lxpib4e2lzTr3+ldu0WMvog9ruahJiQi3gTT8S3Ee7UQIjIUMerCmKFnj
         lu4g==
X-Gm-Message-State: AOJu0YyoXz45YatNPeWVtiuvzJQA4270Tg7XizMcQYmbleo4XvZqJMeH
	GUMek1rzPmGUa25nLY+MqdpaPPqf32mOe6R5DAgstw==
X-Google-Smtp-Source: AGHT+IGmE/x/Q9wBAAP4WSVeu6Pzwkh80gJNXkwIoavJV9VXufokUhNCLXMfXFExg6GRm7Q1Y/p8TrFXYkay1vjqtA4=
X-Received: by 2002:ac8:5ac4:0:b0:41c:d62b:fb51 with SMTP id
 d4-20020ac85ac4000000b0041cd62bfb51mr39263562qtd.26.1701295220560; Wed, 29
 Nov 2023 14:00:20 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231128204938.1453583-1-pasha.tatashin@soleen.com>
 <20231128204938.1453583-10-pasha.tatashin@soleen.com> <20231128235254.GE1312390@ziepe.ca>
In-Reply-To: <20231128235254.GE1312390@ziepe.ca>
From: Pasha Tatashin <pasha.tatashin@soleen.com>
Date: Wed, 29 Nov 2023 16:59:43 -0500
Message-ID: <CA+CK2bC=vMU54wXz1GSzpOcLFCuX5vuE6tD49JF8cMbz4tis-g@mail.gmail.com>
Subject: Re: [PATCH 09/16] iommu/iommufd: use page allocation function
 provided by iommu-pages.h
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: akpm@linux-foundation.org, alex.williamson@redhat.com, 
	alim.akhtar@samsung.com, alyssa@rosenzweig.io, asahi@lists.linux.dev, 
	baolu.lu@linux.intel.com, bhelgaas@google.com, cgroups@vger.kernel.org, 
	corbet@lwn.net, david@redhat.com, dwmw2@infradead.org, hannes@cmpxchg.org, 
	heiko@sntech.de, iommu@lists.linux.dev, jasowang@redhat.com, 
	jernej.skrabec@gmail.com, jonathanh@nvidia.com, joro@8bytes.org, 
	kevin.tian@intel.com, krzysztof.kozlowski@linaro.org, kvm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, linux-rockchip@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-sunxi@lists.linux.dev, 
	linux-tegra@vger.kernel.org, lizefan.x@bytedance.com, marcan@marcan.st, 
	mhiramat@kernel.org, mst@redhat.com, m.szyprowski@samsung.com, 
	netdev@vger.kernel.org, paulmck@kernel.org, rdunlap@infradead.org, 
	robin.murphy@arm.com, samuel@sholland.org, suravee.suthikulpanit@amd.com, 
	sven@svenpeter.dev, thierry.reding@gmail.com, tj@kernel.org, 
	tomas.mudrunka@gmail.com, vdumpa@nvidia.com, virtualization@lists.linux.dev, 
	wens@csie.org, will@kernel.org, yu-cheng.yu@intel.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 28, 2023 at 6:52=E2=80=AFPM Jason Gunthorpe <jgg@ziepe.ca> wrot=
e:
>
> On Tue, Nov 28, 2023 at 08:49:31PM +0000, Pasha Tatashin wrote:
> > Convert iommu/iommufd/* files to use the new page allocation functions
> > provided in iommu-pages.h.
> >
> > Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>
> > ---
> >  drivers/iommu/iommufd/iova_bitmap.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
>
> This is a short term allocation, it should not be counted, that is why
> it is already not using GFP_KERNEL_ACCOUNT.

I made this change for completeness. I changed all calls to
get_free_page/alloc_page etc under driver/iommu to use the
iommu_alloc_* variants, this also helps future developers in this area
to use the right allocation functions.
The accounting is implemented using cheap per-cpu counters, so should
not affect the performance, I think it is OK to keep them here.
