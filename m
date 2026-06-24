Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE6563B0AEF
	for <linux-tegra@vger.kernel.org>; Wed, 24 Jun 2026 13:20:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782307248; cv=none; b=XVOhvW08buR/HhvcbKkUOG2AAQLEcZcxvxiefyzVKxmyLQDKSMWGSvdMYXdWZDHpN5saxL0D+Cql2PpU2EapjuOXh3xSUHw9NMc0gsKZsK4xuV7XSEuzPH4Y1uiiaa5fzFIHREqBbtnMkft/4R2A8FXYtwsz59tbMDr148rx+Ok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782307248; c=relaxed/simple;
	bh=8DHaxbNgIIQW1uUIJPmwfiBlnxrtvO2JWgpaOXClAms=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Kqtafu/6FEoImtwmVeELh/TudZWIDGIsvk/bGYO1uVHjTuIQezcdIt8gaWogwjdo+eZtpD+4QZz9ogDq31OluyTcM5mVYpiMJ5BTnKaQyknbbIfgWRqVqzPKanirsVbkdvf+j9iI/Sl+0Bbi9/aLGn7j26vxUagNv89E6DivN0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jiuew09A; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jiuew09A"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D8F71F0155B
	for <linux-tegra@vger.kernel.org>; Wed, 24 Jun 2026 13:20:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782307247;
	bh=6fbW+TrtaaiIQKs4Ca0srDSkiFnyZR7Y2v/8HFN2cUY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=jiuew09A8So+7oq9KSxnUYPCbXYS6LkejJF29Mmia/Y7+TC/kn/U2gTfb3syJp41R
	 a858bciIsq1q6lxCTtoARCs31k6Lsg+tME+v4IZhHaoBaDMj37Asg7CdC4TMYdbjo/
	 8UTaWqx0tz7A4hLpyMd8/tEiW8UKKe7dtD7rxJMNnjy0QYfUWKXTvSTwolIityC1nR
	 R3j5Kf4nr8nOANIvWUipJjoexxIqI6esEqMJpWTIRQFcRMRNcwF1tvSHqmxYhubK4a
	 VpHN3YUrJZCtzzFV1BuBgZL8ba1T9IGtHf6IwmgTp+BQumtoArVP2kldbjT4aSRY+d
	 BMr4ZfFaJpQrg==
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5aa68d9dc18so1157614e87.2
        for <linux-tegra@vger.kernel.org>; Wed, 24 Jun 2026 06:20:47 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RrI+Vmn/3U3y4eJzLV2RgCx5i7AGbueruX9UwY6shvWtYFlZhN2O0sZi+oyoJMspZoJJOM0XLrq/A0vkA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzv4OAZ9mE1hQ0iVylopXdnsnmEg4Th2rbmAkIy0myNOcnld64k
	GoXxc6SVsLQ8rQuZh+pFZZQsKFK+h/bVZzS4gAtEMzQbLmabgXjoEEnv/jWiaX4VMaNDyAHLqzT
	xRsgM2fUtmTKuLO0NfPPN7jGskMhmrmg=
X-Received: by 2002:a05:6512:1598:b0:5ad:5017:607b with SMTP id
 2adb3069b0e04-5addb81cef5mr2114864e87.16.1782307245989; Wed, 24 Jun 2026
 06:20:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260623095403.3407436-1-sumitg@nvidia.com> <CAJZ5v0jvkNfx-1XChRCsGHJAcY7W4j41P+Xug6+TpPge7tHF7Q@mail.gmail.com>
 <de03b23f-18a3-4e99-a15a-5044463ac484@nvidia.com>
In-Reply-To: <de03b23f-18a3-4e99-a15a-5044463ac484@nvidia.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Wed, 24 Jun 2026 15:20:31 +0200
X-Gmail-Original-Message-ID: <CAJZ5v0h+Fhj8+xLC=TAqx43+tQCPDUj-eP9YMW=BwKzn8CPUDw@mail.gmail.com>
X-Gm-Features: AVVi8CcfwsbEPu4KJVmHRtDZ3Ns4YbY0dbagT4ehDXRu8LtT1ctdUEYbwy9jWpQ
Message-ID: <CAJZ5v0h+Fhj8+xLC=TAqx43+tQCPDUj-eP9YMW=BwKzn8CPUDw@mail.gmail.com>
Subject: Re: [PATCH] cpufreq: CPPC: Preserve OSPM-set registers across hotplug
 and unload
To: Sumit Gupta <sumitg@nvidia.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, viresh.kumar@linaro.org, pierre.gondois@arm.com, 
	ionela.voinescu@arm.com, zhenglifeng1@huawei.com, zhanjie9@hisilicon.com, 
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
	linux-tegra@vger.kernel.org, treding@nvidia.com, jonathanh@nvidia.com, 
	vsethi@nvidia.com, ksitaraman@nvidia.com, sanjayc@nvidia.com, 
	mochs@nvidia.com, bbasu@nvidia.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 24, 2026 at 2:56=E2=80=AFPM Sumit Gupta <sumitg@nvidia.com> wro=
te:
>
> Hi Rafael,
>
>
> On 23/06/26 16:30, Rafael J. Wysocki wrote:
> > External email: Use caution opening links or attachments
> >
> >
> > On Tue, Jun 23, 2026 at 11:54=E2=80=AFAM Sumit Gupta <sumitg@nvidia.com=
> wrote:
> >> Values written to OSPM-set CPPC registers (via sysfs or the autonomous
> >> boot parameter) can be lost in two ways:
> >>
> >>    - Across CPU hotplug: the platform may reset a CPU's registers when=
 it
> >>      is offlined.
> >>    - On driver unload: the value the driver wrote is left in the regis=
ter
> >>      instead of returning to its pre-driver state.
> >>
> >> Add a small table-driven mechanism that handles both:
> >>
> >>    - Capture each register's firmware value when a CPU is first seen a=
nd
> >>      restore it on driver unload.
> >>    - Record the last value the driver set and reapply it from ->init()
> >>      when the policy is reactivated after CPU hotplug.
> > I'm not sure if this is a good idea TBH.
> >
> > The overall system state when the CPU goes online may be completely
> > different from the system state when the CPU was online last time, so
> > there is no reason to restore its settings from before offline, at
> > least in principle.
>
> These are values userspace deliberately set, more like a frequency QoS
> request that persists until userspace changes it than transient state.
> It's platform dependent though, as the platform I test on preserves them
> across hotplug, but where the platform resets the register on offline
> the value is silently lost. Should the kernel re-apply it on online,
> or is that better left to userspace? If so, I will drop the hotplug reapp=
ly
> and keep only the restore on driver unload.
>
> intel_pstate and amd-pstate already re-sync these on CPU online, as they
> keep the policy across hotplug via ->online()/->offline(). So for them
> it's re-syncing the hardware, not restoring state from before offline.
>
> cppc_cpufreq has no ->online()/->offline() today, so it fully tears the
> policy down and rebuilds it, which is why this reads as "restoring
> settings from before offline".
> Would adding ->online()/->offline() be acceptable, with policy preserved
> and ->online() just re-syncing the registers the platform reset?

That would be a better approach IMV.
