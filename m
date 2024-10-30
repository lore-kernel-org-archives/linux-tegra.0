Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C11121BD9E8
	for <linux-tegra@vger.kernel.org>; Wed, 30 Oct 2024 21:50:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730325046; cv=none; b=qC3QrIVOCGc3X0H1RLOdaHHwA6M8RjwuYdHtGn5ceQ4ggwJmOnv9/k36lD077JvCPgIon7iNqML2RxrghOzJbRAFTM3PpPmkp/jIwR3fkxELOTUQyMmcFYHe6uKXEZvkh60GQMVTlFaCm+3Y1Nx+mCcbw+eNJHrGcj1rZgZyFpw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730325046; c=relaxed/simple;
	bh=GUWOyc2+VA+j7fVuDS9r8cTqpyGqEZHb2HZIq5jjl14=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dSEkMBJDhRhE/RiFrS4Ytb8AtjnyKl+sCUB33+Ri8KQ3fk1fywJw0JFDStmEvG+9xNscyTlsIZfnUL2LgphYKLTEARpWfyrepsHjiNuxs2gVpKVFAcAthPVYc8MJlXVHR3hOcC70ARqBEFFqWeqlDxBe8zcCh7uu7HGVBZYMTyc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=DuvFsl7r; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="DuvFsl7r"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1730325042;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GUWOyc2+VA+j7fVuDS9r8cTqpyGqEZHb2HZIq5jjl14=;
	b=DuvFsl7r/gzsiRrQFsfZmHSk4aF6SIL1eXbmZJdAXz6Tg1vT1j87RmMtVddu7XMK3ZuU3l
	surNuceaKPrwInqdQm98AZ1lphnPMdeBirwmUjYlwG3Y/zHL0iGcaBRcrr5G67Bv0MpNH9
	TtquqrMPhIfyFRKkEvCtN3IEAaEv3fI=
Received: from mail-oo1-f70.google.com (mail-oo1-f70.google.com
 [209.85.161.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-425-KHjfht7rMuuEhM273bdJQg-1; Wed, 30 Oct 2024 17:50:41 -0400
X-MC-Unique: KHjfht7rMuuEhM273bdJQg-1
Received: by mail-oo1-f70.google.com with SMTP id 006d021491bc7-5eb63345233so361703eaf.3
        for <linux-tegra@vger.kernel.org>; Wed, 30 Oct 2024 14:50:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730325040; x=1730929840;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GUWOyc2+VA+j7fVuDS9r8cTqpyGqEZHb2HZIq5jjl14=;
        b=XIGJi9glwKmY6mh6RFRf2vVbG8am/6+tzaabPygliDL98wLX7TFhIwrd8KRkcl7oWp
         cmArvrMxD5Cg+HG9PHtFbPQwlWe+qi0BdVMUKFyDmX2C1nGlpncrxVAmvmIaqPg05MZj
         RV9mfvD1M/TQx/9obb4gmrn9a6HdTUY+5rgTEt/KCwR+R/XR1m1AdXl/Lw1Z2ZXnk18D
         Q5aAGEDIp7ENur/ftojeD/IjaM9u2wFZ4h3ZMlw2JU5q0ZujkXEbu5+jsy0ICVj2MWux
         qxwKWqEXJbxBC80xlYRo6B++Jb9u4Is7HKMdGg8ZcydOcfjXp+3gWH3C7rf8CIlr846E
         d1Ew==
X-Forwarded-Encrypted: i=1; AJvYcCVC5jEAAqvjPp/m0LN9cLTTWtI8/FfZoa3IzP7+qtFDujxx6Qsg0CZJCvhYgMDRBnIRtU2TN2LEz0+oAA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxp2EWX+QGcNv/AgXLDI0iwF+lpZBnOSZk6bDhX9/RbnezCZQAn
	ec52kabUGKk9bNP1nzz9pl5xpJU7/UKGvx7wS91JhkTgkWAhkOaXPHg71nCr3krhVy8gML0Cu9/
	ox0fLTAKGsls1rwAX4U6HBJhaF6JFkzMK4Ib67BUhcy0BeIkm/iUFcmtEXO+YeiW+PWEdBkq1Nu
	j/KremlZsarOrLaOhY+YqBPFAU4V3iV9+ogH0=
X-Received: by 2002:a05:6820:1ca7:b0:5eb:6a67:6255 with SMTP id 006d021491bc7-5ec23809e29mr13769660eaf.1.1730325040640;
        Wed, 30 Oct 2024 14:50:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGE2uD/p2nyIXD+eR1GIhHhe5wbCBe/BhMzZze8dvS/ZMdiztngBVFDGkld4cJXA26nFTUftxz2Ds4m0zMr/lY=
X-Received: by 2002:a05:6820:1ca7:b0:5eb:6a67:6255 with SMTP id
 006d021491bc7-5ec23809e29mr13769651eaf.1.1730325040348; Wed, 30 Oct 2024
 14:50:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAASaF6zxBr2J_-eESQQXCRxOgy4RsuxG0te7d-wOz9d2YXj5Fw@mail.gmail.com>
 <525593F0-1AA8-4BCB-9B6D-630505C49F10@nvidia.com> <CAASaF6z7PtNFs1YwohT6N+AXdKx0+h87wiimx18Pod1vDfaBYQ@mail.gmail.com>
 <ZyELRjoDLmHeVvSR@kernel.org> <CAASaF6x8cMJUTYpm0dedkh9boXgVaL9WvxaG-r+aHY+6QOpw6Q@mail.gmail.com>
 <ZyIvxWghfaK81I4d@kernel.org>
In-Reply-To: <ZyIvxWghfaK81I4d@kernel.org>
From: Jan Stancek <jstancek@redhat.com>
Date: Wed, 30 Oct 2024 22:50:12 +0100
Message-ID: <CAASaF6xU4zbjFNEZkNLsPZz=d2-8dqbKkogU7xH05rgvUE4nhg@mail.gmail.com>
Subject: Re: [bug] aarch64 host no longer boots after 767507654c22
 ("arch_numa: switch over to numa_memblks")
To: Mike Rapoport <rppt@kernel.org>
Cc: Zi Yan <ziy@nvidia.com>, linux-mm@kvack.org, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, Jonathan.Cameron@huawei.com, 
	dan.j.williams@intel.com, David Hildenbrand <david@redhat.com>, linux-tegra@vger.kernel.org, 
	Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 30, 2024 at 2:12=E2=80=AFPM Mike Rapoport <rppt@kernel.org> wro=
te:
>
> On Tue, Oct 29, 2024 at 10:03:31PM +0100, Jan Stancek wrote:
> > On Tue, Oct 29, 2024 at 5:24=E2=80=AFPM Mike Rapoport <rppt@kernel.org>=
 wrote:
> > >
> > > On Tue, Oct 29, 2024 at 04:43:39PM +0100, Jan Stancek wrote:
> > > > On Tue, Oct 29, 2024 at 4:07=E2=80=AFPM Zi Yan <ziy@nvidia.com> wro=
te:
> > > > >
> > > > > +tegra mailing list and maintainers
> > > > >
> > > > > On 29 Oct 2024, at 8:47, Jan Stancek wrote:
> > > > >
> > > > > > Hi,
> > > > > >
> > > > > > I'm seeing a regression on Nvidia IGX system, which no longer b=
oots.
> > > > > >
> > > > > > bisect points at commit 767507654c22 ("arch_numa: switch over t=
o numa_memblks").
> > > > > > It hangs very early, with 4k or 64k pages, with no kernel messa=
ges printed:
> > > > > >
> > > > > > EFI stub: Booting Linux Kernel...
> > > > > > EFI stub: Using DTB from configuration table
> > > > > > EFI stub: Exiting boot services...
> > > > > > <hangs here>
> > > > > >
> > > > >
> > > > > Is it possible to have earlycon output? It is hard to debug witho=
ut any
> > > > > information except kernel fails to boot.
> > > >
> > > > I know it was a long shot, so far I haven't had luck getting it to =
work.
> > >
> > > Does it boot with numa=3Doff and numa=3Dfake?
> >
> > No, it doesn't.
>
> No ideas without the logs, sorry.

With some trial & error I narrowed it down, but as it turns out
the fix has already landed upstream today:
d95fb348f016 ("mm: numa_clear_kernel_node_hotplug: Add NUMA_NO_NODE
check for node id")

Regards,
Jan

