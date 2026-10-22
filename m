Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792677776;
	b=aji4ilzr/dGOy1xTLblQwG5M+2av6uiuxJLLXXSQO17SriG/psh3FdfdRu2uFv0No2Yz
	 zdD2dPFkVYSwAmC4QLzkgIfrcmSJb9QrySplMT+EJado6qEx25jlGbHXaLV5MJTq8VDLa
	 Uol5fmF0mkB7Ch4PQhoDHsCnLe4eMowcT+PRQvLZvgpI/+gGA5jjplUcb+nXkInNRUGdG
	 VJqcXTB7sJvGcwcstFkhnsZueIRMzpmyj3agWRKPne5REKBduvdoFDln65JYZpCLflzpa
	 3QVf2GmgKqKUnmHVRz6c1EF28Efj8eOrXmM3UgfGGeWHjflwoMQCM0bT65nsxI5d48A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792677776;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=89oFWpy7/fXqqbrfoJkdUcmDMlD4RYJFfDd35c+oJhg=;
	b=zKFcjVCvd6spI0XEMWHlLuGpzZV9HWfedjoZtHalpFWFenMbweJtRWQDNM9UAyeo00Mn
	 lPL0/t2rmHZDWiHLfColXyS4Oea//2d8IjuM3llBgO60ep3SQy7TomQiQoj53d28RmQ+r
	 RIuuoQ8NhwJyT7J7b3Je+2oMZiLKDg6qmUD1KavIE9o1+ajcQtbErtN0aaH5+4faoFFD7
	 o2BolKZEp0JGvaboVyXeKr7miKvZvyXLz+qPTeTJBx/fdOAgD2Hfa9nfxkNXDPqMbgzjq
	 p9dX3PGv8nQCecZe0cP4/CXZbzxCKWPqL9XDIo1p/3CD1xx9+w8v8J1kFRz8CgE8xFg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JgE1FJhG;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB1A3606A31D
	for <linux-tegra@vger.kernel.org>; Thu, 22 Oct 2026 14:02:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JgE1FJhG
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67CAA1F000C3
	for <linux-tegra@vger.kernel.org>; Thu, 22 Oct 2026 14:02:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792677770;
	bh=89oFWpy7/fXqqbrfoJkdUcmDMlD4RYJFfDd35c+oJhg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=JgE1FJhGZy2aDKaJ0gRpV8e6diMaQy+ymqNl1hxg4Veesrqdj9MG88vGrWP/w7Lni
	 gxtqGd7yTFX9TubnCDOA1wGdRXThlRDaf6PfFFVVwYW/Qt+dfgCAdy0HIYcPQvvHOa
	 HBZEofbWDI7GiWKPq09NCMjoS7Vaql37BGLw87JVj3AlemrEZrNfyHfG3pREOw8FIu
	 9h9skjbTqfzI/0g5fdEb+XjR65yeOnSZS6hoVEFJRXvmJJCwhO9pTD85zCDAk2ITiV
	 EFjw0RV1cY1m2vgZ0bHbjFWI0rC0lStqVQmhwFCHgnFQN1qDBK2C6QumDLiqszJrn/
	 YhyHqnB6faQhw==
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5be4d648aacso1534651e87.3
        for <linux-tegra@vger.kernel.org>; Thu, 22 Oct 2026 07:02:50 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByk6YGog3E/4IqlA9ht1XfuHP3j5QA2WsPQb6X5f9LPEVT/F2heGFLd501Ggc8OYtZ6dMJfUZfXqHbMaw==@vger.kernel.org
X-Gm-Message-State: AFq9FYLdkkY14UMHNydSK73RAaTxBhIrw6tDiKzCsAIf5AqkUZFyBjim
	upXAT5zfj2C09L4MArWecN9dPSVQYFGioQzm9tuvn50dBh0hIfhNn4oLPEXb5WS/RW3jKEOFWRm
	Fs+2rJoqLapD+r9vtWcDidPfBu8nHMiA=
X-Received: by 2002:a05:6512:31cd:b0:5be:42c0:6ce4 with SMTP id
 2adb3069b0e04-5bfa1be92b4mr2034800e87.17.1792677768810; Thu, 22 Oct 2026
 07:02:48 -0700 (PDT)
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Post: <mailto:linux-tegra@vger.kernel.org>
List-Help: <mailto:linux-tegra+help@vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-tegra+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261020121846.691218-1-sumitg@nvidia.com> <20261020121846.691218-5-sumitg@nvidia.com>
 <cf4e3153-ff80-4d0d-94f7-572a26f369c1@arm.com> <51747329-abe1-406a-aeae-94ebb7a35bf4@nvidia.com>
 <85da866f-4fbb-4cf2-9376-3f7405e049ef@arm.com>
In-Reply-To: <85da866f-4fbb-4cf2-9376-3f7405e049ef@arm.com>
From: "Rafael J. Wysocki (Intel)" <rafael@kernel.org>
Date: Thu, 22 Oct 2026 16:00:28 +0200
X-Gmail-Original-Message-ID: <CAJZ5v0iXip_5Ywk3EkrGL_u2w_hOcGKA1XvrubLPb3diWHx5Lw@mail.gmail.com>
X-Gm-Features: AclHuK-vTfvlIZ3lOGv_EwwgmPMlFSmRAOWiMov9GEuALAEDP0Pgfx35UBoLgu8
Message-ID: <CAJZ5v0iXip_5Ywk3EkrGL_u2w_hOcGKA1XvrubLPb3diWHx5Lw@mail.gmail.com>
Subject: Re: [PATCH v6 4/5] cpufreq: CPPC: Preserve OSPM-set registers across
 hotplug and unload
To: Christian Loehle <christian.loehle@arm.com>, Sumit Gupta <sumitg@nvidia.com>
Cc: viresh.kumar@linaro.org, pierre.gondois@arm.com, ionela.voinescu@arm.com, 
	zhenglifeng1@huawei.com, zhanjie9@hisilicon.com, ray.huang@amd.com, 
	mario.limonciello@amd.com, perry.yuan@amd.com, kprateek.nayak@amd.com, 
	maciej.wieczor-retman@intel.com, pawel.chmielewski@intel.com, 
	linux-pm@vger.kernel.org, linux-acpi@vger.kernel.org, 
	acpica-devel@lists.linux.dev, linux-tegra@vger.kernel.org, treding@nvidia.com, 
	jonathanh@nvidia.com, vsethi@nvidia.com, ksitaraman@nvidia.com, 
	sanjayc@nvidia.com, mochs@nvidia.com, bbasu@nvidia.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 22, 2026 at 3:23=E2=80=AFPM Christian Loehle
<christian.loehle@arm.com> wrote:
>
> On 10/22/26 11:10, Sumit Gupta wrote:
> > Hi Christian,
> >
> >
> > On 20/10/26 21:41, Christian Loehle wrote:
> >> External email: Use caution opening links or attachments
> >>
> >>
> >> On 10/20/26 13:18, Sumit Gupta wrote:
> >>> Values written to OSPM-set CPPC registers via sysfs can be lost in tw=
o
> >>> ways:
> >>>
> >>>    - Across CPU hotplug: the platform may reset a CPU's registers whi=
le it
> >>>      is offline.
> >>>    - On driver unload: the value the driver wrote is left in the regi=
ster
> >>>      instead of returning to its pre-driver state.
> >>>
> >>> Add a small table-driven mechanism that handles both:
> >>>
> >>>    - On init(), capture each register's firmware value before the
> >>>      driver programs anything.
> >>>    - On offline(), read back each register's current value (whatever =
was
> >>>      last set via sysfs) so it can be reapplied, then restore the fir=
mware
> >>>      value.
> >>
> >> Sorry for the late suggestion, but all the ospm-set registers I think =
we can
> >> save ourselves some headache by just saving these at sysfs_store (and =
not deal
> >> with potential read-errors during offline/suspend (which actually may =
happen!).
> >>
> >
> > v1 [1] saved the values at store time. In v2 I switched to reading
> > them in offline(), following the flow discussed in [2]. One read there
> > covers every store handler and the pending boot parameter series.
>
> Ah right!
>
> >
> > But a read error in offline() or suspend() drops the request. A failed
> > reapply in online() can also leave the register at its firmware or rese=
t
> > value, which the next offline() or suspend() then saves over the
> > request. Saving at store time keeps the request in both cases.
>
> Yup, that's more reasonable IMO

Yes, please!

Cache stuff at store time.

> >
> > We could combine the two. Keep the policy across hotplug and the
> > firmware restore in offline() from v2, and save the requested values
> > at store time as in v1:
> >  - init() saves the firmware values and uses them as the initial
> >    requested values.
>
> Yes, I guess if we cannot read the initial values at init() (or first
> autosel enable?) there's no point in letting the driver initialize
> (or allowing autosel=3D1 respectively)?
>
> >  - Each sysfs store updates the requested value after it succeeds.
>    The boot parameter series will do the same.
> >  - offline() and suspend() restore the firmware values without
> >    reading the registers.
> >  - online() and resume() reapply the requested values. If that fails,
> >    the request is kept for a later online().
> >
> > Does this sound fine and keep the intent of the earlier discussion?
> > I will respin accordingly.
>
>
> To me it does,

+1

Thanks!
