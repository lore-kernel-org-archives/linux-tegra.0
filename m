Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06FE62E637
	for <linux-tegra@vger.kernel.org>; Fri,  5 Jan 2024 15:34:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="EFV5pVvH"
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-427f5cc49afso8406731cf.2
        for <linux-tegra@vger.kernel.org>; Fri, 05 Jan 2024 07:34:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1704468855; x=1705073655; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0TY2tK1Et5681qdWkhQWK7TKRb/9setDuVBnoXVgexU=;
        b=EFV5pVvHiQnqoV9y7BQQq9nRu87mykB2Rai0EIP6qviKgt54hRLI0m9de01VYYt1AX
         q0UwruXuBCSkrZCZRieqIg7+aevZFSab5kMlO8Jyz2nDpiDlf/Z5Ukub/JzndhhJtuUo
         8kGZeGqt2vARqYzwIXSAOAVHTNbUBANkLmINPM45sLwhjIxuoA54PLpdUVLS8OMKrfs/
         qzvQsiIlQ3xMVnvhcKlrxWcl2v9Kgmy7yj69GVJBQLRDbzjkgug6Q4E1c8eG94U3uNhw
         18Iyqmj1bzy1OkC8j1mxXToPWjmVekiW0bfg8cpp/1/3GgrRhENtdnle6+I78mggTVZE
         ioaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704468855; x=1705073655;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0TY2tK1Et5681qdWkhQWK7TKRb/9setDuVBnoXVgexU=;
        b=OEQswgp97QfA5ISFUCb1TGsIYmfQUdcYUCEh4KjBLre0j/CoaDVhouu78hmozcFSpj
         //eGAIIe1hsF7C7w/gAUh3xZaSe5RB+QePNmxau1ZNeP3ft9HHriU2cut7JqiQ1OBs+f
         4O81LhAbVwK8Kor5bM1Oz664AfaSXx/N69IpAvdtl0WaW1esbRD+zt6NoJn6DSEVI36n
         IdNqH7t8ofLA2+KgW99dVOmA2p+uNUewSjIBR9X2ATEwr8Sjb4hOfkNttLQeUGv+s+Cd
         0idOUE8ot6MVTkcDGhRJtsQsu1M60owdPrVDlepnHWAr3ht6dnTB92Qlxffeoj4DU8+G
         PKRQ==
X-Gm-Message-State: AOJu0YyE7EPvaFtEdPQBCCX7RUemywl3EyZf/Wg4JnZLBR/g/UoRb9zL
	mh3c+IX/+V/3RtiGFQ2qDxX6+m7ejIylypuOuDR7m8bVHbsuig==
X-Google-Smtp-Source: AGHT+IHfTfqU5MoKE0X4xG8QNmKPONd8jiakcdkHu4vud6eBZ8WvRO+n1CsOMpfQPwUC05tcfTICXquuDV0OuNZPOR0=
X-Received: by 2002:a05:622a:1349:b0:429:791f:9708 with SMTP id
 w9-20020a05622a134900b00429791f9708mr909674qtk.35.1704468854882; Fri, 05 Jan
 2024 07:34:14 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231226200205.562565-1-pasha.tatashin@soleen.com>
 <eqkpplwwyeqqd356ka3g6isaoboe62zrii77krsb7zwzmvdusr@5i3lzfhpt2xe>
 <CA+CK2bBE1bQuqZy3cbWiv8V3vJ8YNJZRayp6Wv-j2_9i37XT4g@mail.gmail.com>
 <eng4vwaci5hwlicszgcld6uny55vll2bfs3vp2yjbjf3exhamg@zf6yc2uhax7w>
 <CA+CK2bCUGepLLA2Hsmq00XEhPzLWPb5CjzY_UPT0qWSKastjAQ@mail.gmail.com> <elsuzdcx2qpnazvz2ayzmco4ctms5ci3iet3k7ggbjt3p2pfk2@tvr3plow26oi>
In-Reply-To: <elsuzdcx2qpnazvz2ayzmco4ctms5ci3iet3k7ggbjt3p2pfk2@tvr3plow26oi>
From: Pasha Tatashin <pasha.tatashin@soleen.com>
Date: Fri, 5 Jan 2024 10:33:38 -0500
Message-ID: <CA+CK2bD7gPP6TFR_sYPd=4U4yYrYHNu=qMLJdT+kgT_gbz6wBQ@mail.gmail.com>
Subject: Re: [PATCH v3 00/10] IOMMU memory observability
To: =?UTF-8?Q?Michal_Koutn=C3=BD?= <mkoutny@suse.com>
Cc: akpm@linux-foundation.org, alim.akhtar@samsung.com, alyssa@rosenzweig.io, 
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
	suravee.suthikulpanit@amd.com, sven@svenpeter.dev, thierry.reding@gmail.com, 
	tj@kernel.org, tomas.mudrunka@gmail.com, vdumpa@nvidia.com, wens@csie.org, 
	will@kernel.org, yu-cheng.yu@intel.com, rientjes@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 5, 2024 at 4:02=E2=80=AFAM Michal Koutn=C3=BD <mkoutny@suse.com=
> wrote:
>
> On Thu, Jan 04, 2024 at 02:12:26PM -0500, Pasha Tatashin <pasha.tatashin@=
soleen.com> wrote:
> > Yes, we will have a difference between GFP_ACCOUNT and what
> > NR_IOMMU_PAGES shows. GFP_ACCOUNT is set only where it makes sense to
> > charge to user processes, i.e. IOMMU Page Tables, but there more IOMMU
> > shared data that should not really be charged to a specific process.
>
> I see. I'd suggest adding this explanation to commit 10/10 message
> (perhaps with some ballpark numbers of pages). In order to have a
> reference and understadning if someone decided to charge (and limit) all
> in the future.

Sure, I will update the commit log in 10/10 with this info if we will have =
v4.

Pasha

>
> Thanks,
> Michal
