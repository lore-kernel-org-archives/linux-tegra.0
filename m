Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6255D1DC06B
	for <linux-tegra@vger.kernel.org>; Tue, 29 Oct 2024 21:04:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730235847; cv=none; b=LBp4emceTeIPSa/WXZw0bZP2NpxuzpGnEIFco4kUMF+8PKBCIEpeB82TE1bEKDVCNlRDY6BQb92LiSQhsEjLBMKetcXdSM9oN600Aj1nEf/RR3ixVzID0xWTgF2V503T+OWMTNRShSlfdLMKFEu40y+zstdtoZ20FidqB6xe9SA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730235847; c=relaxed/simple;
	bh=8D1KR3UObDeidybdHPWCzCpe5e5JtrfcCgEHUIpFr8Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qJFGLbmDxThZwPlsDZb1cdM78dF3stabd2Sn7h5gZ12Uphdph4/8YrqwZqA71DF2AjwqWiOLAsOFMjkUqec8k7ERV+n6upLfGfloznpQVvT2qwcvMxt/uNis7MLcYA4j03fHuxbjjsemptta3+6Mbsup1q2Sgzak1SA1yrnGDls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=F0zxQuxs; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="F0zxQuxs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1730235844;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TfD1DetZzLaBym84XosC3+P3GN+QnX7QF0+o66GGJ4Y=;
	b=F0zxQuxsBP2o3GhwsW7VvXthkjkwHM0ddw/2O8IKR5jVPhr9pYqsCRRGXWhqvazjy6OB/5
	9rqc6lVQNEct5IQlD7VIyk98G/oJjU118tFW9Nwsx96hCKvk0JfMqI/f98shnrDJENF/zF
	AwUhoQx7XtKYdc376zLUL48TtPvqz6g=
Received: from mail-oa1-f71.google.com (mail-oa1-f71.google.com
 [209.85.160.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-653-tW2zEua5Mwu48B9kWWWlkw-1; Tue, 29 Oct 2024 17:04:03 -0400
X-MC-Unique: tW2zEua5Mwu48B9kWWWlkw-1
Received: by mail-oa1-f71.google.com with SMTP id 586e51a60fabf-28c65d3a0e9so286397fac.0
        for <linux-tegra@vger.kernel.org>; Tue, 29 Oct 2024 14:04:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730235839; x=1730840639;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TfD1DetZzLaBym84XosC3+P3GN+QnX7QF0+o66GGJ4Y=;
        b=AF8z5A1wpTbp75mNyvj2B8S0wcWNfDBiEy4xoRYxm2TM/gbo7uqaD0uexhA+PwmIF8
         Sw6sg5EZnNLn0gpc4UTMGT1ckm96B/pqUHrYz87PBOzObHsp9aAfKgQVGL4UA470Rv7H
         gg0LZy8zAWxz6xA9EGGd5Oh9GhgBrWIf0RroRUy81OQYZ4tZX4kw2csQp3plTgZhse+O
         m6DB4Xb5Y4BeYs8IASv5XEZ1DQ/VpbMnT6if/06szCCbSUPWU6p5Pq0oY0nFgHvOVcZ9
         E8d81v4d+1HNPfxOXoUW1fqXZbul0clHSj/G4hIU3qWFhUo9QHOQpb4iJjQgvDJ3DaNx
         FzYg==
X-Forwarded-Encrypted: i=1; AJvYcCWgdbcQzwqUrITMdTxLr/5r/XhhTIt20gafIIU38HTiub93f+O/8e6hRWk9UO/MT4AIbfcDZx0NFepa8A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2B7EzCO5xUd9JJzlDloedE3YXy02BlqnKPz5LpPaJRbIU0Qm7
	qXwyC+7mOjvq6VR+6La2ow3qo8EfDFFn2r3oYprGc9RlgiEKWwg5C8Vaoh2RB57H5HIr0weUmrt
	u2G4WlxRmZ1kUDkaYL60fgGTYksuRBQ+4GC4rLBusU9ipHfSMHOJ9JSjsEYgp1pGwnv/yZLoYei
	qidDW8dZx3gJ/tMm1lsbadLgv00nArAV3n0BM=
X-Received: by 2002:a05:6870:170e:b0:254:b337:eeb5 with SMTP id 586e51a60fabf-291046e55e9mr2141498fac.18.1730235839609;
        Tue, 29 Oct 2024 14:03:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF0FaW9744QqAdp6tEpgnXEx1lws0uvXXj2TggY33DwbU5PmIv1EIXwfn9y+mGEbsu/hkZQkYALRP7zpxZl5Xc=
X-Received: by 2002:a05:6870:170e:b0:254:b337:eeb5 with SMTP id
 586e51a60fabf-291046e55e9mr2141481fac.18.1730235839304; Tue, 29 Oct 2024
 14:03:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAASaF6zxBr2J_-eESQQXCRxOgy4RsuxG0te7d-wOz9d2YXj5Fw@mail.gmail.com>
 <525593F0-1AA8-4BCB-9B6D-630505C49F10@nvidia.com> <CAASaF6z7PtNFs1YwohT6N+AXdKx0+h87wiimx18Pod1vDfaBYQ@mail.gmail.com>
 <ZyELRjoDLmHeVvSR@kernel.org>
In-Reply-To: <ZyELRjoDLmHeVvSR@kernel.org>
From: Jan Stancek <jstancek@redhat.com>
Date: Tue, 29 Oct 2024 22:03:31 +0100
Message-ID: <CAASaF6x8cMJUTYpm0dedkh9boXgVaL9WvxaG-r+aHY+6QOpw6Q@mail.gmail.com>
Subject: Re: [bug] aarch64 host no longer boots after 767507654c22
 ("arch_numa: switch over to numa_memblks")
To: Mike Rapoport <rppt@kernel.org>
Cc: Zi Yan <ziy@nvidia.com>, linux-mm@kvack.org, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, Jonathan.Cameron@huawei.com, 
	dan.j.williams@intel.com, David Hildenbrand <david@redhat.com>, linux-tegra@vger.kernel.org, 
	Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 29, 2024 at 5:24=E2=80=AFPM Mike Rapoport <rppt@kernel.org> wro=
te:
>
> On Tue, Oct 29, 2024 at 04:43:39PM +0100, Jan Stancek wrote:
> > On Tue, Oct 29, 2024 at 4:07=E2=80=AFPM Zi Yan <ziy@nvidia.com> wrote:
> > >
> > > +tegra mailing list and maintainers
> > >
> > > On 29 Oct 2024, at 8:47, Jan Stancek wrote:
> > >
> > > > Hi,
> > > >
> > > > I'm seeing a regression on Nvidia IGX system, which no longer boots=
.
> > > >
> > > > bisect points at commit 767507654c22 ("arch_numa: switch over to nu=
ma_memblks").
> > > > It hangs very early, with 4k or 64k pages, with no kernel messages =
printed:
> > > >
> > > > EFI stub: Booting Linux Kernel...
> > > > EFI stub: Using DTB from configuration table
> > > > EFI stub: Exiting boot services...
> > > > <hangs here>
> > > >
> > >
> > > Is it possible to have earlycon output? It is hard to debug without a=
ny
> > > information except kernel fails to boot.
> >
> > I know it was a long shot, so far I haven't had luck getting it to work=
.
>
> Does it boot with numa=3Doff and numa=3Dfake?

No, it doesn't.

>
> In the log from successful boot it seems there is no NUMA information in
> the device tree, can you send the device tree as well please?

https://people.redhat.com/jstancek/aarch64_numa_boot/device_tree

Regards,
Jan




>
> > > Since the previous commit boots and I assume both kernels are compile=
d
> > > with the same gcc toolchain, this should not be caused by the binuils
> > > bug in 2.42[1]. Is your binutils version 2.42?
> >
> > Yes, both are compiled locally, with binutils 2.41
> >
> > >
> > > Thanks.
> > >
> > >
> > > [1] https://sourceware.org/bugzilla/show_bug.cgi?id=3D31924
> > >
> > > > Here's a log from successful boot with previous commit:
> > > > https://people.redhat.com/jstancek/aarch64_numa_boot/console-log-go=
od.txt
> > > > and config: https://people.redhat.com/jstancek/aarch64_numa_boot/co=
nfig
> > > >
> > > > # lscpu
> > > > Architecture:             aarch64
> > > >   CPU op-mode(s):         32-bit, 64-bit
> > > >   Byte Order:             Little Endian
> > > > CPU(s):                   12
> > > >   On-line CPU(s) list:    0-11
> > > > Vendor ID:                ARM
> > > >   BIOS Vendor ID:         NVIDIA
> > > >   Model name:             Cortex-A78AE
> > > >     BIOS Model name:      Not Specified Not Specified CPU @ 0.0GHz
> > > >     BIOS CPU family:      257
> > > >     Model:                1
> > > >     Thread(s) per core:   1
> > > >     Core(s) per cluster:  12
> > > >     Socket(s):            1
> > > >     Cluster(s):           1
> > > >     Stepping:             r0p1
> > > >     CPU(s) scaling MHz:   100%
> > > >     CPU max MHz:          1971.2000
> > > >     CPU min MHz:          115.2000
> > > >     BogoMIPS:             62.50
> > > >     Flags:                fp asimd evtstrm aes pmull sha1 sha2 crc3=
2
> > > > atomics fphp asimdhp cpuid asimdrdm lrcpc dcpop asimddp uscat ilrcp=
c
> > > > flagm paca pacg
> > > > Caches (sum of all):
> > > >   L1d:                    768 KiB (12 instances)
> > > >   L1i:                    768 KiB (12 instances)
> > > >   L2:                     3 MiB (12 instances)
> > > >   L3:                     6 MiB (3 instances)
> > > > NUMA:
> > > >   NUMA node(s):           1
> > > >   NUMA node0 CPU(s):      0-11
> > > > Vulnerabilities:
> > > >   Gather data sampling:   Not affected
> > > >   Itlb multihit:          Not affected
> > > >   L1tf:                   Not affected
> > > >   Mds:                    Not affected
> > > >   Meltdown:               Not affected
> > > >   Mmio stale data:        Not affected
> > > >   Reg file data sampling: Not affected
> > > >   Retbleed:               Not affected
> > > >   Spec rstack overflow:   Not affected
> > > >   Spec store bypass:      Mitigation; Speculative Store Bypass
> > > > disabled via prctl
> > > >   Spectre v1:             Mitigation; __user pointer sanitization
> > > >   Spectre v2:             Mitigation; CSV2, BHB
> > > >   Srbds:                  Not affected
> > > >   Tsx async abort:        Not affected
> > > >
> > > > Regards,
> > > > Jan
> > >
> > >
> > > Best Regards,
> > > Yan, Zi
> > >
> >
>
> --
> Sincerely yours,
> Mike.
>

