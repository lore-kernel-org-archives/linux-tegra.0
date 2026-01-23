Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F093F27F18B;
	Fri, 23 Jan 2026 19:07:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769195269; cv=none; b=I3Ip5dhE3+z1lJPPT95vvnQJMq5ythTpY9AS5ntCRYX+feksfuej2LEQgkLJUkHxxH3w8E9C/tMqFr2Fau8kXdHYPzaQTtwI95fF+w6Tr9jR4gysnfsbusYst3MQv3qfAe7nY9ukz5aT21syewD0e/17fezzerMXj3tBnRAIKwE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769195269; c=relaxed/simple;
	bh=6cQEuAT5QYGrVN1KkWNZ7IO9TPkmg08lBpk2DkS8ekc=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=iXPzHsKcbrAadIiEiiNT0RIUZPewQdISBJO8kIZyIADsFzKocnma6NMOMFueH+bIt+SkAauU85OkMDTvZ4Crs5WAvWnUYcg/QDkMpDOPaI9O5ifDtJzP7T1OzDTpleZ4bgOdHYlmdEMTU7xJp7T4oOVk7S34mzs1/3rKDP+QERs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=vEFwFVtd; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="vEFwFVtd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85004C2BC87;
	Fri, 23 Jan 2026 19:07:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769195268;
	bh=6cQEuAT5QYGrVN1KkWNZ7IO9TPkmg08lBpk2DkS8ekc=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=vEFwFVtdcuw82OTu93HV1Xihpq3odkia6MgGvdrXZQ6ghfJYCE8SrBxcRF4QQtE69
	 n2XZdTNOwk3gLXGBRXkOsj1VNbFlNscKZEEqAoKxkC5DLHE8LhKJkdRhk5m9W4xF1u
	 827BCDqg6yMgkv/DNpKgP5zDPiiCyrMZz3waGvgBWC2eeuWoYKLAwp9D0bTLCu0+eR
	 nsVwqDzU9vkhfB7P98jJdzAWu4rcEiRvDOOZqaoZzSpKEaKwLxgbGWmST6oMX/iN+X
	 0hfmw2bfEdqbdEMOn7dIOP8kse8Uh0LyFOIlzOu2/lKXEtzx8tOEATYs5Lg4AJChO3
	 Q+0hB9qC+8/cA==
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 23 Jan 2026 20:07:44 +0100
Message-Id: <DFW7DOC56CUG.3PV4UGDTMUYE1@kernel.org>
Subject: Re: [PATCH v5] driver core: enforce device_lock for
 driver_match_device()
Cc: "Jon Hunter" <jonathanh@nvidia.com>, "Marek Szyprowski"
 <m.szyprowski@samsung.com>, "Mark Brown" <broonie@kernel.org>,
 <gregkh@linuxfoundation.org>, <rafael@kernel.org>,
 <linux-kernel@vger.kernel.org>, <baijiaju1990@gmail.com>, "Qiu-ji Chen"
 <chenqiuji666@gmail.com>, <Aishwarya.TCV@arm.com>,
 "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
To: "Gui-Dong Han" <hanguidong02@gmail.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260113162843.12712-1-hanguidong02@gmail.com>
 <7ae38e31-ef31-43ad-9106-7c76ea0e8596@sirena.org.uk>
 <CGME20260120152328eucas1p1024a7488ae10b8b7f2fcb74baee24c75@eucas1p1.samsung.com> <ef37ed64-24ad-4b82-bc6c-d3bc72aaf232@samsung.com> <e32b0819-2c29-4c83-83d5-e28dc4b2b01f@nvidia.com> <DFULF717AOGG.GY8B9ET26KND@kernel.org> <f10007af-3629-4769-b89c-bbf4aa013bf3@nvidia.com> <CALbr=LaE=nS30uMmm_spywEHPYgC_w9qb9L1wFvwBe=PDae1Mw@mail.gmail.com> <DFVBKRQ35CC0.95P329BK5KZA@kernel.org> <956d5d23-6a62-4dba-9c98-83457526f9b6@nvidia.com> <DFVDC5NWTOT4.NA2H05V84CWD@kernel.org> <2b7109c2-2275-4a38-a52f-f4f901a6d182@nvidia.com> <DFW11G0SNME0.3G28YPXH64DOT@kernel.org> <b3b0635c-657f-4869-bc88-06de9287a464@nvidia.com> <DFW4JJYIDC2O.3L1XXBT5MY9SI@kernel.org> <CALbr=LZ4v7N=tO1vgOsyj9AS+XuNbn6kG-QcF+PacdMjSo0iyw@mail.gmail.com>
In-Reply-To: <CALbr=LZ4v7N=tO1vgOsyj9AS+XuNbn6kG-QcF+PacdMjSo0iyw@mail.gmail.com>

On Fri Jan 23, 2026 at 7:53 PM CET, Gui-Dong Han wrote:
> It seems the issue is simpler than a recursive registration deadlock.
> Looking at the logs, tegra_qspi_probe triggers a NULL pointer
> dereference (Oops) while holding the device_lock. The mutex likely
> remains marked as held/orphaned, blocking subsequent driver bindings
> on the same bus.
>
> This likely explains why lockdep was silent. Since this is not a lock
> dependency cycle or a recursive locking violation, but rather a lock
> remaining held by a terminated task, lockdep would not flag it as a
> deadlock pattern.
>
> This is indeed a side effect of enforcing the lock here=E2=80=94it amplif=
ies
> the impact of a crash. However, an Oops while holding the device_lock
> is generally catastrophic regardless.

This makes sense to me; it might indeed be as simple as that.

> Following up on our previous discussion [1], refactoring
> driver_override would resolve this. We could move driver_override to
> struct device and protect it with a dedicated lock (e.g.,
> driver_override_lock). We would then replace driver_set_override with
> dev_set_driver_override and add dev_access_driver_override with
> internal lock assertions. This allows us to remove device_lock from
> the 2 match paths, reducing contention and preventing a single crash
> from stalling the whole bus.
>
> However, this deviates from the current paradigm where device_lock
> protects sysfs attributes (like waiting_for_supplier and
> power/control). If other sysfs attributes are found to share similar
> constraints or would benefit from finer-grained locking (which
> requires further investigation), we might have a stronger argument for
> introducing a more generic sysfs_lock to handle this class of
> attributes. We would also need to carefully verify safety during
> device removal.
>
> Danilo, what are your thoughts on this refactoring plan? I am willing
> to attempt it, but since it touches the driver core, documentation,
> and 10+ bus drivers, and I haven't submitted such a large series
> before, it may take me a few weeks to get an initial version out, and
> additional time to iterate based on review feedback until it is ready
> for merging. If you prefer to handle it yourself to expedite things,
> please let me know so we don't duplicate efforts.

I think moving driver_override to struct device and providing accessors wit=
h
proper lockdep assertions is the correct thing to do. With that, I do not t=
hink
a separate lock is necessary.

Please feel free to follow up on this.
