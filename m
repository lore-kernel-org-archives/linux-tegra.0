Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794322694;
	b=u9eKpjUnBv0mGgA5MQ11v4ac9qPMa06rzWqBNiJeiXqW4DG5WeESVC0puI9RQScZmKfg
	 QJvcvJ5jK5RuTuHaNCtoLj+j4uYzbnNFZK6v2aSpJw1Ws+KdnphK5mjH1lw5Zh9JSAwnf
	 2/Ctgo3WZI8WRx2xH4tLAb/PM0Jk3oJnQj9+vnULrNpxX5+UtHa7CAjwTKizpO7vy2q43
	 attajpVm3Tz+ZE2GOVRkHz58IOrH5nsyTqF/G+dJuh1/gVInuubCJHm3bECv6rLmadS18
	 s6/1D6uDYl1P9HlEdSmHYZEKQqDJBuXgEUfVh8KnTOO/JNnJBqCNyuAo4zRUREXeTzw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794322694;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=WnkJ8LXf/bgZJNIPyQGBBjaA78zgoKgnkLMT97HZ4hM=;
	b=pUxHMDVeXVr8spb94yYLmsDDpxwRJfVKnjD2mVocDvQ6XCUqfWmL2VboGtVlmY2FFPOl
	 WixjUz1+/jQ+aSEQ8WgL+x3UYKZjIeN+ogpc8YBObtuR/ZNSglzt3hYP2Rn0yL/NWZxI8
	 mOsAOivHimtwTpOKEELmb8X74BSu3nmTkj/RxB/g6y7ZrqDOfizWKcEFjocFgqkfuc/Ot
	 AVk2GqEzQyKArs/QeDErQ4vt9bgBTGx/WrigaiKMqUDdATgDuK4/YOsQ/IzXzOKDeZ7O0
	 0Z88eTeHv3OkJE9GUQs5XRcrrKWC5fcV3grsQV1nP96ZN9Vw/gYeVVTkGGxXtYY8hnQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EvPtbBbp;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 610D4606A339
	for <linux-tegra@vger.kernel.org>; Tue, 10 Nov 2026 14:58:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EvPtbBbp
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 108981F00906
	for <linux-tegra@vger.kernel.org>; Tue, 10 Nov 2026 14:58:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794322694;
	bh=WnkJ8LXf/bgZJNIPyQGBBjaA78zgoKgnkLMT97HZ4hM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=EvPtbBbpY0MjDrJNm/qEfHVLVqDPeNiRukmRUFa4wWsRoo6sCSQw+dMYY0H3/TdIo
	 5rGBDNsi9o8CXMflRBCr3XSY0eF6h4mL4dZFLwCe5xGnvbOpH/4YndZsn5IZLaOa/v
	 iSkQ6Pr18uxngCNjGJnx8fe5XPUSAgFwzndWaN99yG0r66WVa89QAHjROZqlQzesFL
	 r9DBjPRvtBZwST8/tzlm/7BHBGo04X2tKXGG+JlIRHGIigH/76hZVR4S8c5eLr/mn8
	 cb7I1uW2JG21uHuTSx4xq5fmw1kzmKwZfpeEni0vRhWxHbjyov7ZyTXy3mat1NnXKT
	 ymgwxGi3mFHHA==
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-3adef977ad9so15439751fa.1
        for <linux-tegra@vger.kernel.org>; Tue, 10 Nov 2026 06:58:13 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErHuaBVU/AQmjXl+51KGpd8p9sq26kITxGC/3InzgdbcDiX0h544M5UktAO3cRYuqA0IZtOQh8o4bTLmig==@vger.kernel.org
X-Gm-Message-State: APuU4Z+e+pjYVanhLWHctV7B1fZY9u6FWuHLHlEBe5jegGnu7bb565XB
	ij9q4ms96WLfXg4kjO4yhfq45GXXoG3J55R8s/NfmYx1tXsfM1BgETEKojVq/wAseqxnC6rt1oj
	f3jE+0oULiLj+0mNMFXF2gfbGzIiVLuQ=
X-Received: by 2002:a2e:a9a5:0:b0:3ab:4f5e:3edc with SMTP id
 38308e7fff4ca-3ae09632513mr5987871fa.15.1794322692389; Tue, 10 Nov 2026
 06:58:12 -0800 (PST)
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Post: <mailto:linux-tegra@vger.kernel.org>
List-Help: <mailto:linux-tegra+help@vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-tegra+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261110101246.3665797-1-sumitg@nvidia.com> <09209b48-a469-4bd9-8d43-845f709353ca@arm.com>
In-Reply-To: <09209b48-a469-4bd9-8d43-845f709353ca@arm.com>
From: "Rafael J. Wysocki (Intel)" <rafael@kernel.org>
Date: Tue, 10 Nov 2026 15:58:00 +0100
X-Gmail-Original-Message-ID: <CAJZ5v0jgUnFO5FsDU64bE9ArzTQaGcU=2ocRJ2QpsJb_octG8w@mail.gmail.com>
X-Gm-Features: AclHuK8X5hMi8jD3gHPYYnsPSCyrp4PzOzFf8JJiGs5yNkckX-k7Tw8xtv2KRhU
Message-ID: <CAJZ5v0jgUnFO5FsDU64bE9ArzTQaGcU=2ocRJ2QpsJb_octG8w@mail.gmail.com>
Subject: Re: [PATCH v2] cpufreq: CPPC: Set CPPC Enable register in cpu_init
To: Christian Loehle <christian.loehle@arm.com>, Sumit Gupta <sumitg@nvidia.com>
Cc: viresh.kumar@linaro.org, zhanjie9@hisilicon.com, zhenglifeng1@huawei.com, 
	jbenc@redhat.com, linux-pm@vger.kernel.org, linux-tegra@vger.kernel.org, 
	linux-kernel@vger.kernel.org, treding@nvidia.com, jonathanh@nvidia.com, 
	vsethi@nvidia.com, ksitaraman@nvidia.com, sanjayc@nvidia.com, 
	mochs@nvidia.com, bbasu@nvidia.com, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 10, 2026 at 11:58=E2=80=AFAM Christian Loehle
<christian.loehle@arm.com> wrote:
>
> On 11/10/26 10:12, Sumit Gupta wrote:
> > As per ACPI 6.x s8.4.6.1.4 (CPPC Enable Register):
> >   "If supported by the platform, OSPM writes a one to this register
> >    to enable CPPC on this processor. If not implemented, OSPM assumes
> >    the platform always has CPPC enabled."
> >
> > The driver never writes this register. CPPC therefore stays disabled
> > on platforms such as NVIDIA GB10 that wait for OSPM to enable it.
> >
> > Call cppc_set_enable() in cppc_cpufreq_cpu_init(). Fail init if
> > enabling CPPC fails. If init fails after CPPC is enabled, disable it
> > again. The register is optional, so -EOPNOTSUPP is not an error.
> >
> > This relies on commit ab482f1bac6b ("ACPI: CPPC: Refactor register
> > value get and set ABIs") from v6.16. Before it, cppc_set_enable()
> > returned -EFAULT instead of -EOPNOTSUPP when the Enable register is
> > not implemented. On an older kernel this change would make init fail
> > on every platform without the register, so the stable range starts
> > at v6.16.
> >
> > Fixes: 5477fb3bd1e8 ("ACPI / CPPC: Add a CPUFreq driver for use with CP=
PC")
> > Cc: stable@vger.kernel.org # v6.16+
> > Signed-off-by: Sumit Gupta <sumitg@nvidia.com>
>
> Reviewed-by: Christian Loehle <christian.loehle@arm.com>

Applied as 7.4-rc material, thanks!

> > ---
> > v1 -> v2:
> > - Fail init if enabling CPPC fails and disable CPPC again if init
> >   fails after enabling it (Christian).
> > - Move enable after the policy->shared_type check, so cppc_set_perf()
> >   is the only failure after it.
> > - Mention NVIDIA GB10 in the commit message (Christian).
> >
> > v1: https://lore.kernel.org/lkml/20261105123244.3132560-1-sumitg@nvidia=
.com/
> >
> >  drivers/cpufreq/cppc_cpufreq.c | 14 +++++++++++++-
> >  1 file changed, 13 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/cpufreq/cppc_cpufreq.c b/drivers/cpufreq/cppc_cpuf=
req.c
> > index 957fa7775260..b2af24ae5008 100644
> > --- a/drivers/cpufreq/cppc_cpufreq.c
> > +++ b/drivers/cpufreq/cppc_cpufreq.c
> > @@ -714,7 +714,17 @@ static int cppc_cpufreq_cpu_init(struct cpufreq_po=
licy *policy)
> >               pr_debug("Unsupported CPU co-ord type: %d\n",
> >                        policy->shared_type);
> >               ret =3D -EFAULT;
> > -             goto out;
> > +             goto out_put;
> > +     }
> > +
> > +     /*
> > +      * Enable CPPC. The Enable register is optional - some platforms
> > +      * may not support it.
> > +      */
> > +     ret =3D cppc_set_enable(cpu, true);
> > +     if (ret && ret !=3D -EOPNOTSUPP) {
> > +             pr_err("Failed to enable CPPC for CPU%u (%d)\n", cpu, ret=
);
> > +             goto out_put;
> >       }
> >
> >       policy->fast_switch_possible =3D cppc_allow_fast_switch(policy->c=
pus);
> > @@ -742,6 +752,8 @@ static int cppc_cpufreq_cpu_init(struct cpufreq_pol=
icy *policy)
> >       return 0;
> >
> >  out:
> > +     cppc_set_enable(cpu, false);
> > +out_put:
> >       cppc_cpufreq_put_cpu_data(policy);
> >       return ret;
> >  }
>
