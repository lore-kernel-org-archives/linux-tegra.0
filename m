Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25835F9E8
	for <linux-tegra@vger.kernel.org>; Thu,  9 Jul 2026 00:06:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783555573; cv=pass; b=NFEplfGKBSPcYpBqW6a64HfM68IZxL8DoDoctoTptMlNObFC4otgM82vjwV2ztDmbmQMiarlPrghY1hg11ee2TU4Nn46bpHXSSBYriTDOteSMqemV3FyKIZ7Za+Xoq43OfXIAez/wlSS0Fig2hF3onFlg+8CR4/crpgIgpKKL9U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783555573; c=relaxed/simple;
	bh=4EuRdo8+QeN+yDW6A3X+o12IBSIMc42jYmwxuetdwEg=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ectcbYsfKEyznwB4TtSXoHlxTKHxNZoMy1avPICSWYYPpFNn0Y/86UbazTYLxa7fz8F79tM0Os0ZZLPWx0EhUmoQmhRECtQB/OoEm93fAtvm9IV3txwnks3vPnmx0PBa3PfLM+g+WuaKxcp8MlaKTnqWjnL/5TUUUMv9S3nqh2o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Tui2OcZi; arc=pass smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Tui2OcZi"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2cacd69a9c0so16130585ad.1
        for <linux-tegra@vger.kernel.org>; Wed, 08 Jul 2026 17:06:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783555572; cv=none;
        d=google.com; s=arc-20260327;
        b=U+HK/eMN5PBJtg4Yw8I5r8+KzUv3DxXe2FVZ0TNewvv02+q9Yf7eeeRDo/4xGUhhvA
         VYlvL47fhVBDyal6Ds6dqvrPJdkLIvD8I9fmyO8gDv72PgZEtyo2/XpBV/z0v4lwqKP0
         aSY8uNPJtpvQN/Um/VdDZBG73jKQy595I24oT1Q/LW88cyMe7nl4Wor5dHYdk17qARcr
         513G7U1trw2gckyOvy1LT0ANX/IX9HOiIEQFTK7pCgzzfblnqvy6r+rodVoPoZeuf6KG
         K+L4Zsr1bLw6yJZXdjsdnm7CXYphDNXE4MvCm9l1ZsSakitGEfXr4C9etFg7p8N11Z9Q
         yQYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=LGyVs/ziq+v8OBPSx6ZOv0f1yGdel9dIe8uNrAG5/8g=;
        fh=yvoUB1pD5USv2+GmLnsMHZFkegV2lFcpEMBX5VQPLBg=;
        b=QoYucSMQXr/yaMDzPxh7skYVf3T9TCAbS0GpiNvjjT06WM92nzhzP73QboeVdb49VC
         1RRf0NinxgqRpUsWUHbipquBd9IY5jOVcN0TwDmRUGlE77GDd0yEunMVDjsnSNCTXLY2
         ulfmBeGiR+7EsEoibiwvG6AnDS24AtuUFCnxxgPpyOUuW/HRvi5BqM18tmCdUXq5L0nn
         4/YbYylw5YOG+zUPVvleb09Nx4EIePfEoArFWLp03IX33L9+u8uIrLnIh4Y4q/ybWZYd
         3lQmgy+9kl3q/ZcSLd7IPmHD1QoBK2Jaz4z/L/NQyspM1IQ1UdnSvBQKEFcttzGePIch
         4Ikg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1783555572; x=1784160372; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LGyVs/ziq+v8OBPSx6ZOv0f1yGdel9dIe8uNrAG5/8g=;
        b=Tui2OcZis/oIXOg64/k9In1vUq+guVmxXWVelpwI1011KYfw3Hl1jPM5DNAtnP6dud
         tNbegsDZz3ZfVCv3LGp5grJaOjpctg70Hd3LmUk7dQI8Vv2jYETpC0sGkT/KvKGM691w
         BT+XRpKkVjD2SrNiht7Qet9iH3M7c1BU5Bigcy4v8kA+8fmSzuSX066UPuR7CrLlRe5Q
         CeybiJeWPPdsESYlJxF9n44iu34oqvjy5d7QBDLGRppOZkrJs8UCxKIxMeLGvH74IBhr
         QssXYAiGebRkpz82B4ZjFbA4HpYTL9wbjKch97ta4LdApRDYqVK52ldJ7qx70kqeApqR
         Xu2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783555572; x=1784160372;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LGyVs/ziq+v8OBPSx6ZOv0f1yGdel9dIe8uNrAG5/8g=;
        b=qFz4BwlZy+rMwYRTduPYKjL+baEDsaAzSeFCqQDRtE3iJTCny7pkWJwF+oI/rysmV6
         IWGvoAwnsy1KVbI1QDvFqi/ptOLL9nIN9VcvrIheGDI9LMKQbWviUYbqSzV083HYrWyZ
         DwNfszAfVvCwUtEK4K09RVNIw5wB0Uu7WIUtNha332WzfrNUWM87A12uUfGXLi1xj7QZ
         aw98WsiPrMWSbUxjGxa29Yi8ZIfrrx211pZzfcvQ+/sCpplaRlLA++XFjKvpwLsEvgS6
         Gz9uH1sjvvgHXtvh+CsfWVN7S7tII83NePyMBFy3LvfOA2ADDdzG85F2jm+pSe9b77nJ
         dRyA==
X-Forwarded-Encrypted: i=1; AHgh+Rq61xiHIm46k5oK0A5TTwf+K+tUKbzHiPqpj2ydR026jj0e7yk92qvzQhfheIC4yVeTFGEJACmM+xyvVw==@vger.kernel.org
X-Gm-Message-State: AOJu0YybUgGkK9PEKS8ttN+M1B6NV4kEJxeZ+8xJ/6g9g8hKWAuSk22H
	8iFogJfnpBHSFOagFeBIRALX6l9Sp7mhsvNOG9nL7PaOBbjv/SNm96PjSFam9Fc18hzAeGXTUDt
	ZckWeONi6T8cRBBOysadYl1i1AN9/7yWwj8HHTJj8
X-Gm-Gg: AfdE7clUeLRkBiQ9yoA9/95QQvx+6Fgtx+4axF+BVboi6BBvejdmfNJAtZHHkYUWMKa
	4/xXLHPeorEpbtRY7xcr1G0W/wh4mz8Jx7eugYPY1+xcIDVS1rcif1DVCBK6fxnqSxYc8ads/Zl
	MksD0rBV+5Ikid1/1u17PBG9YfvnIHl8Bg7fzjjOI0YWgCO7gfi9rOlHMx8wBEpgxvdlstXMI4U
	MbvZffkUO+lGgYk8UuDaAAtK52kQCdol7z2QwZv1FjKgx1o8/9Lt6N4t3OhH16MMtwLP2jt6von
	oWQ5lmuMVqrp4iUcFv6pSkBGe8C1sC4JrUHXL/INNPgHpRgWYmZ4MXyEXHg=
X-Received: by 2002:a05:6a21:1f88:b0:3c0:9c19:b27b with SMTP id
 adf61e73a8af0-3c0bcce9940mr4979424637.73.1783555571036; Wed, 08 Jul 2026
 17:06:11 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 8 Jul 2026 17:06:10 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 8 Jul 2026 17:06:09 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <bf56e2e98b512962a2fb88900d535a0e9e6769d8.1782735110.git.ljs@kernel.org>
References: <cover.1782735110.git.ljs@kernel.org> <bf56e2e98b512962a2fb88900d535a0e9e6769d8.1782735110.git.ljs@kernel.org>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Wed, 8 Jul 2026 17:06:09 -0700
X-Gm-Features: AVVi8CdcseowPqFId5ObGoqB8gTqCLO4QEXGH1ZjH1-pjTCLGI84NpwTLe_LrAc
Message-ID: <CAEvNRgEV9VkWHULS4g5hVHu3T6=YZ89HJmkv6rS0+hK=5UFu6Q@mail.gmail.com>
Subject: Re: [PATCH 19/30] mm: use linear_page_[index, delta]() consistently
To: Lorenzo Stoakes <ljs@kernel.org>, Andrew Morton <akpm@linux-foundation.org>
Cc: Russell King <linux@armlinux.org.uk>, Dinh Nguyen <dinguyen@kernel.org>, 
	Simon Schuster <schuster.simon@siemens-energy.com>, 
	"James E . J . Bottomley" <James.Bottomley@hansenpartnership.com>, Helge Deller <deller@gmx.de>, 
	Jarkko Sakkinen <jarkko@kernel.org>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	Ian Abbott <abbotti@mev.co.uk>, H Hartley Sweeten <hsweeten@visionengravers.com>, 
	Lucas Stach <l.stach@pengutronix.de>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Patrik Jakobsson <patrik.r.jakobsson@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Rob Clark <robin.clark@oss.qualcomm.com>, 
	Dmitry Baryshkov <lumag@kernel.org>, Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
	Thierry Reding <thierry.reding@kernel.org>, Mikko Perttunen <mperttunen@nvidia.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Christian Koenig <christian.koenig@amd.com>, 
	Huang Rui <ray.huang@amd.com>, Ankit Agrawal <ankita@nvidia.com>, 
	Alex Williamson <alex@shazbot.org>, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Christian Brauner <brauner@kernel.org>, Dan Williams <djbw@kernel.org>, 
	Muchun Song <muchun.song@linux.dev>, Oscar Salvador <osalvador@suse.de>, 
	David Hildenbrand <david@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
	"Liam R . Howlett" <liam@infradead.org>, Matthew Wilcox <willy@infradead.org>, 
	Marek Szyprowski <m.szyprowski@samsung.com>, Peter Zijlstra <peterz@infradead.org>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Oleg Nesterov <oleg@redhat.com>, 
	Steven Rostedt <rostedt@goodmis.org>, SeongJae Park <sj@kernel.org>, Miaohe Lin <linmiaohe@huawei.com>, 
	Hugh Dickins <hughd@google.com>, Mike Rapoport <rppt@kernel.org>, Kees Cook <kees@kernel.org>, 
	Paolo Bonzini <pbonzini@redhat.com>, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-parisc@vger.kernel.org, 
	linux-sgx@vger.kernel.org, etnaviv@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
	freedreno@lists.freedesktop.org, linux-tegra@vger.kernel.org, 
	kvm@vger.kernel.org, linux-fsdevel@vger.kernel.org, nvdimm@lists.linux.dev, 
	linux-mm@kvack.org, iommu@lists.linux.dev, linux-perf-users@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org, kasan-dev@googlegroups.com, 
	damon@lists.linux.dev, Pedro Falcato <pfalcato@suse.de>, Rik van Riel <riel@surriel.com>, 
	Harry Yoo <harry@kernel.org>, Jann Horn <jannh@google.com>
Content-Type: text/plain; charset="UTF-8"

Lorenzo Stoakes <ljs@kernel.org> writes:

> diff --git a/virt/kvm/guest_memfd.c b/virt/kvm/guest_memfd.c
> index db57c5766ab6..f0e5da490866 100644
> --- a/virt/kvm/guest_memfd.c
> +++ b/virt/kvm/guest_memfd.c
> @@ -440,7 +440,7 @@ static int kvm_gmem_set_policy(struct vm_area_struct *vma, struct mempolicy *mpo
>  static struct mempolicy *kvm_gmem_get_policy(struct vm_area_struct *vma,
>  					     unsigned long addr, pgoff_t *ilx)
>  {
> -	pgoff_t pgoff = vma->vm_pgoff + ((addr - vma->vm_start) >> PAGE_SHIFT);
> +	pgoff_t pgoff = linear_page_index(vma, addr);
>  	struct inode *inode = file_inode(vma->vm_file);
>
>  	*ilx = inode->i_ino;
> --
> 2.54.0

For the guest_memfd change:

Reviewed-by: Ackerley Tng <ackerleytng@google.com>

Thank you!
