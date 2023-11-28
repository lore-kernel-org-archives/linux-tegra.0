Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="hAjmDOgU"
Received: from mail-qt1-x832.google.com (mail-qt1-x832.google.com [IPv6:2607:f8b0:4864:20::832])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 12DDB19B2
	for <linux-tegra@vger.kernel.org>; Tue, 28 Nov 2023 15:32:58 -0800 (PST)
Received: by mail-qt1-x832.google.com with SMTP id d75a77b69052e-423a9cb7e80so18586801cf.3
        for <linux-tegra@vger.kernel.org>; Tue, 28 Nov 2023 15:32:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1701214377; x=1701819177; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T5E8YxJ+6DFizX8w/tjdr1Q20AjeSOztly1v+T84HO0=;
        b=hAjmDOgURwcCKRyzsQ2r9G/hrW5XB5oPAgH+truRdM7Ubd9bwhx+SUNOk769wz6aTr
         VYfsuUmPAUDpDhIramOnNZVkmzbTcE1UjeRmD5rqVTIW9Q/tz+C/MvLNj9eOiZz8qsGp
         +W6GO2qUsEaJy2fEIylTKL+Xx1ZDQQkwQ0zT405NTPg3borX7TjETTNniEkz183RclQt
         60Kvw5avLZcFCPd2vHJhiHAi7jNEPvFiNyGXUg6AxM1NyQ95U51usNeoyOM0Xz4qTxwS
         9F58JT1vDhwM60ZIjXHSSHHZeWT5IrJ4U3G7m2fIhWwODX7PcRzchcRkIZ7xRhpL3pFh
         TUNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701214377; x=1701819177;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T5E8YxJ+6DFizX8w/tjdr1Q20AjeSOztly1v+T84HO0=;
        b=mPPNiiVhj12EIWoMpQBQfVi8h64CqUZ+klLdnbRjI2tf5vUknTBoxlpahfp+WoEgr6
         JjbKVtxqGnV4A9S/ExetAnBAKvRMVfm7Kd2t7oRJDCul2MrIDwDsfSKAkL6F25rRsw2a
         AOfp//qfDbqVvhx5egp2H4YGmtBweK+LVp+uPLAg+wbHdOAAnhz+giqCXONVIELueR5g
         BX8ebz+jGK6uPBeQn7/ebihuehOpQZexlwhvAc6qHRDghXiMG2lLeKE/V/t1r6Y//EGE
         5lIzGRdWhWAIW7aG2UpIwOjHgWcOTYFXiKwYOHbvHfbPAh4HLHTseaWzhi+q4zulLoIb
         pJ3w==
X-Gm-Message-State: AOJu0YwGp4sI2hErlN8nmNvBEzsrECT4KHkK9ctEhIFhv+A4Srm4hVkw
	YL0s9xRD5AHrzEt8Ap/H5cMRyc98w6HY2IHqOx65Kw==
X-Google-Smtp-Source: AGHT+IEOuxWHhR77aLWnHKpzlrX1TcnL7YFPpFLtYSrpaVGNIqLOq9dSsp5P0HO6NZm9ZocGV6nook5EATgkphMBWlk=
X-Received: by 2002:ac8:5c06:0:b0:419:a2c6:820e with SMTP id
 i6-20020ac85c06000000b00419a2c6820emr19578443qti.12.1701214377257; Tue, 28
 Nov 2023 15:32:57 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231128204938.1453583-1-pasha.tatashin@soleen.com>
 <20231128204938.1453583-6-pasha.tatashin@soleen.com> <8e1961c9-0359-4450-82d8-2b2fcb2c5557@arm.com>
 <CA+CK2bDFAi1+397fd4cYetUgmHxqE2hUG4fa2m9Fi3weykQdpA@mail.gmail.com> <6f9ff0aa-7713-4de1-869e-4725828942e4@arm.com>
In-Reply-To: <6f9ff0aa-7713-4de1-869e-4725828942e4@arm.com>
From: Pasha Tatashin <pasha.tatashin@soleen.com>
Date: Tue, 28 Nov 2023 18:32:20 -0500
Message-ID: <CA+CK2bDKaXqemr2Hp=MRxxMB_=AoRnUK_D2SGm9cDkKa+JaT7A@mail.gmail.com>
Subject: Re: [PATCH 05/16] iommu/io-pgtable-arm-v7s: use page allocation
 function provided by iommu-pages.h
To: Robin Murphy <robin.murphy@arm.com>
Cc: akpm@linux-foundation.org, alex.williamson@redhat.com, 
	alim.akhtar@samsung.com, alyssa@rosenzweig.io, asahi@lists.linux.dev, 
	baolu.lu@linux.intel.com, bhelgaas@google.com, cgroups@vger.kernel.org, 
	corbet@lwn.net, david@redhat.com, dwmw2@infradead.org, hannes@cmpxchg.org, 
	heiko@sntech.de, iommu@lists.linux.dev, jasowang@redhat.com, 
	jernej.skrabec@gmail.com, jgg@ziepe.ca, jonathanh@nvidia.com, joro@8bytes.org, 
	kevin.tian@intel.com, krzysztof.kozlowski@linaro.org, kvm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, linux-rockchip@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-sunxi@lists.linux.dev, 
	linux-tegra@vger.kernel.org, lizefan.x@bytedance.com, marcan@marcan.st, 
	mhiramat@kernel.org, mst@redhat.com, m.szyprowski@samsung.com, 
	netdev@vger.kernel.org, paulmck@kernel.org, rdunlap@infradead.org, 
	samuel@sholland.org, suravee.suthikulpanit@amd.com, sven@svenpeter.dev, 
	thierry.reding@gmail.com, tj@kernel.org, tomas.mudrunka@gmail.com, 
	vdumpa@nvidia.com, virtualization@lists.linux.dev, wens@csie.org, 
	will@kernel.org, yu-cheng.yu@intel.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 28, 2023 at 6:08=E2=80=AFPM Robin Murphy <robin.murphy@arm.com>=
 wrote:
>
> On 2023-11-28 10:55 pm, Pasha Tatashin wrote:
> >>>                kmem_cache_free(data->l2_tables, table);
> >
> > We only account page allocations, not subpages, however, this is
> > something I was surprised about this particular architecture of why do
> > we allocate l2 using kmem ? Are the second level tables on arm v7s
> > really sub-page in size?
>
> Yes, L2 tables are 1KB, so the kmem_cache could still quite easily end
> up consuming significantly more memory than the L1 table, which is
> usually 16KB (but could potentially be smaller depending on the config,
> or up to 64KB with the Mediatek hacks).

I am OK removing support for this architecture, or keeping only info
for L1, I do not think there is a reason to worry about sub-page
accounting only for v7s.

Pasha

>
> Thanks,
> Robin.
