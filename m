Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D25442DA28
	for <linux-tegra@vger.kernel.org>; Thu,  9 Jul 2026 15:56:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783612565; cv=none; b=TvHf9kQY6QtJJfOHb+EtZ1ryejURm8ifDguduERU2Xj6IboPeIkScMVdK5lyTH2rLVQZHnO9+9Iof/hb1FtMjStpSArKODjUt1WJCgOOibzEcG4Rcg49fw4pBxhpBy4Q9NmL4b28TyPijdVsTIuy/e3c7wpdJwGJm523xtvhAEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783612565; c=relaxed/simple;
	bh=GOt99IJ7fgZPI8QmxyNzz1MEgzG9KnOmLnnihrfLrQE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SuyhY38FxRDkzG4zA2YPVvD2IuIhqJHrrxn3eZScSc1SYsB5fzorkqStfc3imswdWaA0qhCVXi9DTqc64/79h6ZskzwpgPluIFcJk9ZT2zLWkG3dtIL+akdger9KtPEm+o4u8zqM8myQveOzi85upz3t34pEZMySJ9gUNnAqmiQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=sMpYtpBL; arc=none smtp.client-ip=209.85.160.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="sMpYtpBL"
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-51c0006ea8eso14533541cf.1
        for <linux-tegra@vger.kernel.org>; Thu, 09 Jul 2026 08:56:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1783612560; x=1784217360; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QupnWz0oLATZw6wM2bylQaqDWCRhZF5lJVU8oFwJF/g=;
        b=sMpYtpBLCayfT80R4wzbFZw9l7ecn/vectK5E5n8YBo3056+zypO+Cc5p+yKRJvgIH
         D/H6T9Xrdz6iMSYSYJvVieLq3byHbILjhri9t9JTeNg3KDdjrBUV59FOiPGxnwtT9VLy
         HF1d3IK7IocXO7FJq05gOC0dLYoa87K4H1Npkig9QMat1/arxBuPsjrF4STTmp+4SQnQ
         Vd1Ce49g4dasiNP2aD+fvBhZQJshbx6AC4CXzbMk76CVDp6xBP46+fI2JhSkG6d84zie
         Pt83KOr106cJz+pCklgtC47DW1rTZUKmoVq5ykQpYsi9pRg2A/xacQcZB/ubsxgpernK
         7WxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783612560; x=1784217360;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QupnWz0oLATZw6wM2bylQaqDWCRhZF5lJVU8oFwJF/g=;
        b=XYybI9GDKKWRakWrrXtLE/yU/mCrBePLiSOS2ktKJxep69at9iSxhAadWd021TQNpZ
         vJ8T3NBWGAnMOO+849e9tpVMW44+3YqEgTvAFaAykqmdlwQT5VTnuew+98OfIY/X8/gz
         G9KCrXTQKwYlTu1nL+JWcI9KH1SfkxHZKVVWiS2q3jToPKaoAqxXrXBRskRgrjUZ6OAb
         jwqmoT6YmtLjG2X6LeXDa116/IBl9PdUY7hOACyR+fPjIZgfTPxQh2zxrmxFu97c+xFc
         zQ6xi7Wal8SEfsyuBbmooXtNO827TJsHUnBjxUzdUorDoI94KwZyW5TT0BcKaEBVjx+U
         La4w==
X-Forwarded-Encrypted: i=1; AHgh+RqBcWlNljkiDPbcUBLGD7PyofacTiiFoF/KFVAdVznYsACdMDQAUTG+jXy0iRTnmp2jwbJNfQJL4MQvjw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwWZX2LQ19srrmenb5a9voadaH1Z+3pi26JYyQzMjVGGUpXxzgf
	j4X50XVqUFab404HhSol9rdI1BVFEiy+39M5b/+JFiJR3xh04v3OaAneCgxDEVe08FY=
X-Gm-Gg: AfdE7cltk/UassAA5aDjesg66UFHIIMRK2yaE0zuzo9g/ugsScypB6A8MSSQaE+bcUt
	NzrPgJ9qJX/70bEsoa2oChFiRUFcpbriK/2dQ2zOmzaPcUsZorOU7alxcwFpGxZ7YwMItpOgW2N
	KV4PY/uRTfzQ/2FCfHtljhRLajz5umBfjVE0xMR8Qwq3Ol98EyzQB8wIyIXdZaIeQ11JmU9oQlX
	YSbttRPiTKzMUzs+gzTVymDlD0+8UmmCBAzygez74Z1RIxN7OZWIzRaZuWE7tZho66WbqUQA246
	hn3pMCNz4g89wC1acjJspK+17UzzsZnIzs5v8cjh1Xi3fDFlOkT2VlOIzO9gZ7qXX4SprUKca3W
	Hsx4rPscBkb1sv8PkJlwPujfE5ervk6yBCendjpa6DgHnvy7j08E8s47PDuT/RfmfP84nwyFUtU
	C3heQDw7+yiB9OqBL3bHAuux9DPAxePStWSB0fCA+2jkL2LilP5L4wVRQh64vZG2Y3SCBs
X-Received: by 2002:a05:622a:311:b0:51c:185b:29e0 with SMTP id d75a77b69052e-51c8b2ae67bmr82998651cf.10.1783612559586;
        Thu, 09 Jul 2026 08:55:59 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-51c41d2d688sm169684691cf.17.2026.07.09.08.55.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 08:55:59 -0700 (PDT)
Date: Thu, 9 Jul 2026 11:55:54 -0400
From: Gregory Price <gourry@gourry.net>
To: Lorenzo Stoakes <ljs@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Russell King <linux@armlinux.org.uk>,
	Dinh Nguyen <dinguyen@kernel.org>,
	Simon Schuster <schuster.simon@siemens-energy.com>,
	"James E . J . Bottomley" <James.Bottomley@hansenpartnership.com>,
	Helge Deller <deller@gmx.de>, Jarkko Sakkinen <jarkko@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	Ian Abbott <abbotti@mev.co.uk>,
	H Hartley Sweeten <hsweeten@visionengravers.com>,
	Lucas Stach <l.stach@pengutronix.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Patrik Jakobsson <patrik.r.jakobsson@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Clark <robin.clark@oss.qualcomm.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Thierry Reding <thierry.reding@kernel.org>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Christian Koenig <christian.koenig@amd.com>,
	Huang Rui <ray.huang@amd.com>, Ankit Agrawal <ankita@nvidia.com>,
	Alex Williamson <alex@shazbot.org>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>,
	Dan Williams <djbw@kernel.org>, Muchun Song <muchun.song@linux.dev>,
	Oscar Salvador <osalvador@suse.de>,
	David Hildenbrand <david@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	"Liam R . Howlett" <liam@infradead.org>,
	Matthew Wilcox <willy@infradead.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Oleg Nesterov <oleg@redhat.com>,
	Steven Rostedt <rostedt@goodmis.org>, SeongJae Park <sj@kernel.org>,
	Miaohe Lin <linmiaohe@huawei.com>, Hugh Dickins <hughd@google.com>,
	Mike Rapoport <rppt@kernel.org>, Kees Cook <kees@kernel.org>,
	Paolo Bonzini <pbonzini@redhat.com>, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-parisc@vger.kernel.org,
	linux-sgx@vger.kernel.org, etnaviv@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
	freedreno@lists.freedesktop.org, linux-tegra@vger.kernel.org,
	kvm@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	nvdimm@lists.linux.dev, linux-mm@kvack.org, iommu@lists.linux.dev,
	linux-perf-users@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org, kasan-dev@googlegroups.com,
	damon@lists.linux.dev, Pedro Falcato <pfalcato@suse.de>,
	Rik van Riel <riel@surriel.com>, Harry Yoo <harry@kernel.org>,
	Jann Horn <jannh@google.com>
Subject: Re: [PATCH 19/30] mm: use linear_page_[index, delta]() consistently
Message-ID: <ak_EivwcDDdn1Xvp@gourry-fedora-PF4VCD3F>
References: <cover.1782735110.git.ljs@kernel.org>
 <bf56e2e98b512962a2fb88900d535a0e9e6769d8.1782735110.git.ljs@kernel.org>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bf56e2e98b512962a2fb88900d535a0e9e6769d8.1782735110.git.ljs@kernel.org>

On Mon, Jun 29, 2026 at 01:23:30PM +0100, Lorenzo Stoakes wrote:
> There are a number of places where we open code what linear_page_index()
> and linear_page_delta() calculate.
> 
> Replace this code with the appropriate functions for consistency.
> 
> No functional change intended.
> 
> Signed-off-by: Lorenzo Stoakes <ljs@kernel.org>

one nit

Reviewed-by: Gregory Price <gourry@gourry.net>

...
> diff --git a/drivers/comedi/comedi_fops.c b/drivers/comedi/comedi_fops.c
> index c09bbe04be6c..536c25d8dcee 100644
> --- a/drivers/comedi/comedi_fops.c
> +++ b/drivers/comedi/comedi_fops.c
> @@ -25,6 +25,7 @@
>  #include <linux/fs.h>
>  #include <linux/comedi/comedidev.h>
>  #include <linux/cdev.h>
> +#include <linux/pagemap.h>
>  
>  #include <linux/io.h>
>  #include <linux/uaccess.h>
> @@ -2462,7 +2463,7 @@ static int comedi_vm_access(struct vm_area_struct *vma, unsigned long addr,
>  {
>  	struct comedi_buf_map *bm = vma->vm_private_data;
>  	unsigned long offset =
> -	    addr - vma->vm_start + (vma->vm_pgoff << PAGE_SHIFT);
> +	    addr - vma->vm_start + (vma_start_pgoff(vma) << PAGE_SHIFT);
>  

Obviously correct, but was this intended for a different patch?

~Gregory
