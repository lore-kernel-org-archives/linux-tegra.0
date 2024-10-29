Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78848194ACA
	for <linux-tegra@vger.kernel.org>; Tue, 29 Oct 2024 15:43:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730216640; cv=none; b=G3wK0F3ZojWKxzmkid2l4PzRpcW6bvM/BujotP0LRc694ZdGstUjPpYMq95Q7dqB3s2c+09zJIgRMTjwOkTymmDyz6dfcg+gJ7ugSFmPoSYrPraC4HUFdTU43eniN2ghWG4apQ2sDpI1OU48/nUqNB/Jbg7S6Z/V+UBc/UAmc2Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730216640; c=relaxed/simple;
	bh=NpW9OQB0oELUjMsXRPoFfEQ7ebhVOyOcHnHODfgIDk0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qn7v48aOQ8SvstSJWwXNRi7kYvjE4tk0pE+RoiP2+LFxGrsXMnEvFviNKW8BFXYcx+naW+cyPlVU619Id2zf+9rYK6xQZ3Pzg7ashbJCtvv/Sdghx+8UOKXPw4hv4tUnDlIM2/4SJI9bhLx59gJLdYkXE2xEhRHvdm5YauO3TZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Kh4PKJpm; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Kh4PKJpm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1730216637;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wLzrPWzlgkFiUziotVGT3esj9crGq7+1ihwfkLHXWiQ=;
	b=Kh4PKJpmaeb7jNd3ht8kt45aItCYKAuDzhIzBjj04QQyw4jpKS5IOtjNRxcy/dP96xNuoK
	lRUYVdfZ2lNnMk7V2Iuwf8shIZtgf2/luP9c18KHXEKMmsPa0yC+ug4F0oR9jov8EtWF09
	yhLfP1b4DXuGUv6htYZogJMK/IeNs0Y=
Received: from mail-oa1-f72.google.com (mail-oa1-f72.google.com
 [209.85.160.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-354-u05i0vOWNXuLGvDluxyiUg-1; Tue, 29 Oct 2024 11:43:56 -0400
X-MC-Unique: u05i0vOWNXuLGvDluxyiUg-1
Received: by mail-oa1-f72.google.com with SMTP id 586e51a60fabf-286efde9783so5964047fac.0
        for <linux-tegra@vger.kernel.org>; Tue, 29 Oct 2024 08:43:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730216635; x=1730821435;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wLzrPWzlgkFiUziotVGT3esj9crGq7+1ihwfkLHXWiQ=;
        b=UOOQl+hr5NXMVq9yxPnLREzQ34PNk9M3il3SJuOz4IDOBGHWXEPwrH52+MafgR690y
         ua2funAj3UOo2x2IwJS1JQ/siwZbVEx4LIQGqxalnlrGWYSmJ+ATHe0D3B03FzRE2UsB
         T+Yd/exXyvKpdy1kVlxc8SUl1rK4S2a7UNdFcAoqpLMBJtK+xey5JTIkSgIawLYpbEQR
         MuOR5BUYYI9uervxciPh7bMSesDRqwOlTbikvJVxS3ocp9YAgOgz3JqeB8Nq4udNOuQ2
         WlsELIGjWMZOv0wafSvdq5aBw1VuSJDRCpiYkohZn3GssExudpvfDyojxIMNNlCxxyFu
         Llkg==
X-Forwarded-Encrypted: i=1; AJvYcCUt7k2JcU9EHtygqkh7D5rZ7jxB5xvq9f1JuaIbj9qLY42R11NGs/vEmMWG+5AkGJwwxvSqK5sn5W/c4Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YyrqrCEEK3tKAZ5K+V5F5WoXea8uh/oWhFsPYNUhPx1kw9DhRT1
	3rhr5eg/u9la9P4SIAsu2Lsotqmy+MDekKgnOXGtHqP4wS1AOAy9dykATenWjpM2FbK7s74kRmX
	Xw5kpCyFmAWWUQrx9BziXUZa0srYoLLM7UJw/we5FItVP5iLpx6vhKapZ/a8hyPj0fYiIOewqM3
	rH7q3USy0xfUHtJNKj43jwV3mQG4RI2Y8d4WI=
X-Received: by 2002:a05:6870:c0cc:b0:268:2efa:2de0 with SMTP id 586e51a60fabf-29051b7d295mr10756361fac.13.1730216635501;
        Tue, 29 Oct 2024 08:43:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHTdBdezoJ7VG3vDcy5K8pvqtBHt690NWETS+sPu3lYdLD78vt8pfHXNLZWYN26LTrmH4wgdkvUV70KRX6avfM=
X-Received: by 2002:a05:6870:c0cc:b0:268:2efa:2de0 with SMTP id
 586e51a60fabf-29051b7d295mr10756341fac.13.1730216635261; Tue, 29 Oct 2024
 08:43:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAASaF6zxBr2J_-eESQQXCRxOgy4RsuxG0te7d-wOz9d2YXj5Fw@mail.gmail.com>
 <525593F0-1AA8-4BCB-9B6D-630505C49F10@nvidia.com>
In-Reply-To: <525593F0-1AA8-4BCB-9B6D-630505C49F10@nvidia.com>
From: Jan Stancek <jstancek@redhat.com>
Date: Tue, 29 Oct 2024 16:43:39 +0100
Message-ID: <CAASaF6z7PtNFs1YwohT6N+AXdKx0+h87wiimx18Pod1vDfaBYQ@mail.gmail.com>
Subject: Re: [bug] aarch64 host no longer boots after 767507654c22
 ("arch_numa: switch over to numa_memblks")
To: Zi Yan <ziy@nvidia.com>
Cc: rppt@kernel.org, linux-mm@kvack.org, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, Jonathan.Cameron@huawei.com, 
	dan.j.williams@intel.com, David Hildenbrand <david@redhat.com>, linux-tegra@vger.kernel.org, 
	Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 29, 2024 at 4:07=E2=80=AFPM Zi Yan <ziy@nvidia.com> wrote:
>
> +tegra mailing list and maintainers
>
> On 29 Oct 2024, at 8:47, Jan Stancek wrote:
>
> > Hi,
> >
> > I'm seeing a regression on Nvidia IGX system, which no longer boots.
> >
> > bisect points at commit 767507654c22 ("arch_numa: switch over to numa_m=
emblks").
> > It hangs very early, with 4k or 64k pages, with no kernel messages prin=
ted:
> >
> > EFI stub: Booting Linux Kernel...
> > EFI stub: Using DTB from configuration table
> > EFI stub: Exiting boot services...
> > <hangs here>
> >
>
> Is it possible to have earlycon output? It is hard to debug without any
> information except kernel fails to boot.

I know it was a long shot, so far I haven't had luck getting it to work.

>
> Since the previous commit boots and I assume both kernels are compiled
> with the same gcc toolchain, this should not be caused by the binuils
> bug in 2.42[1]. Is your binutils version 2.42?

Yes, both are compiled locally, with binutils 2.41

>
> Thanks.
>
>
> [1] https://sourceware.org/bugzilla/show_bug.cgi?id=3D31924
>
> > Here's a log from successful boot with previous commit:
> > https://people.redhat.com/jstancek/aarch64_numa_boot/console-log-good.t=
xt
> > and config: https://people.redhat.com/jstancek/aarch64_numa_boot/config
> >
> > # lscpu
> > Architecture:             aarch64
> >   CPU op-mode(s):         32-bit, 64-bit
> >   Byte Order:             Little Endian
> > CPU(s):                   12
> >   On-line CPU(s) list:    0-11
> > Vendor ID:                ARM
> >   BIOS Vendor ID:         NVIDIA
> >   Model name:             Cortex-A78AE
> >     BIOS Model name:      Not Specified Not Specified CPU @ 0.0GHz
> >     BIOS CPU family:      257
> >     Model:                1
> >     Thread(s) per core:   1
> >     Core(s) per cluster:  12
> >     Socket(s):            1
> >     Cluster(s):           1
> >     Stepping:             r0p1
> >     CPU(s) scaling MHz:   100%
> >     CPU max MHz:          1971.2000
> >     CPU min MHz:          115.2000
> >     BogoMIPS:             62.50
> >     Flags:                fp asimd evtstrm aes pmull sha1 sha2 crc32
> > atomics fphp asimdhp cpuid asimdrdm lrcpc dcpop asimddp uscat ilrcpc
> > flagm paca pacg
> > Caches (sum of all):
> >   L1d:                    768 KiB (12 instances)
> >   L1i:                    768 KiB (12 instances)
> >   L2:                     3 MiB (12 instances)
> >   L3:                     6 MiB (3 instances)
> > NUMA:
> >   NUMA node(s):           1
> >   NUMA node0 CPU(s):      0-11
> > Vulnerabilities:
> >   Gather data sampling:   Not affected
> >   Itlb multihit:          Not affected
> >   L1tf:                   Not affected
> >   Mds:                    Not affected
> >   Meltdown:               Not affected
> >   Mmio stale data:        Not affected
> >   Reg file data sampling: Not affected
> >   Retbleed:               Not affected
> >   Spec rstack overflow:   Not affected
> >   Spec store bypass:      Mitigation; Speculative Store Bypass
> > disabled via prctl
> >   Spectre v1:             Mitigation; __user pointer sanitization
> >   Spectre v2:             Mitigation; CSV2, BHB
> >   Srbds:                  Not affected
> >   Tsx async abort:        Not affected
> >
> > Regards,
> > Jan
>
>
> Best Regards,
> Yan, Zi
>

