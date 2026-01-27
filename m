Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 207EB33C19F;
	Tue, 27 Jan 2026 15:18:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769527103; cv=none; b=Ni3qU1ho/B4HiQyYaJvpHF5N5wuWjCxaV0rLb8qgYILDv3+4XfWxcy8J2Gc0A/RZ+e/+8EtnI97a+sQjaoXpe24vOpscUnAjlLFjR8CoX6YNdCtxPvdUch8TkhRLiW4Jey+EM47Sdhl3gxjUPPhqrHCNeysisAM8+tMtucuxfhk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769527103; c=relaxed/simple;
	bh=Ckka8JwzICpP7JutBki8yKuOkh9JsUPq0MR8eY4dP80=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:Subject:Cc:To:
	 References:In-Reply-To; b=gFRkasqXKNiic2Ecty/HGduSP1+vnTKT7JnmOmaVQiZ0Y3DScEbrjQUy2217UGti1/zDj6jRSqpy/+q0GNRgEVEWke0nBftUq67gmYoAP8ARG1Wjt+04M6tXPEGIcxOKtkqcxyJF3sfVD2jJaTTlg50/vD2fGFmNX5eLMpk7nfQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HyRliWaL; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HyRliWaL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99660C116C6;
	Tue, 27 Jan 2026 15:18:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769527102;
	bh=Ckka8JwzICpP7JutBki8yKuOkh9JsUPq0MR8eY4dP80=;
	h=Date:From:Subject:Cc:To:References:In-Reply-To:From;
	b=HyRliWaLYab/VDVFe476ZZ5EcNOoUUIMIGc8eWrqR4oseEdm6EHCL5QsRRB+FxJ6p
	 FLT/K9x6WnzZAWb6xrHLUmX6rIFHAf26uPtWS/7RYBg0/oXbyNYfmKMC84f0aiVhpF
	 nX0ERre1FL+fY2b1McLEWil51AdyIN/ATjjBIDN4Dsg/FcHafacudapLpy4uIAvgCj
	 ofJis3nQ7cK+PwkB33hB8haRmDfAROiPdFWvFdIok7Ya++9k9kVkbVz24KssrIPgOP
	 1x07xxC36s754FXPvrGv+UvFlWVeEhhs9ovH1PU4aTVBHwKCtiOw/8XOJtJsGVb6zd
	 jgy4uzfaRVkUg==
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 27 Jan 2026 16:18:18 +0100
Message-Id: <DFZH06V25YY8.3JBBYQLTWBUKN@kernel.org>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH v5] driver core: enforce device_lock for
 driver_match_device()
Cc: "Gui-Dong Han" <hanguidong02@gmail.com>, "Marek Szyprowski"
 <m.szyprowski@samsung.com>, "Mark Brown" <broonie@kernel.org>,
 <gregkh@linuxfoundation.org>, <rafael@kernel.org>,
 <linux-kernel@vger.kernel.org>, <baijiaju1990@gmail.com>, "Qiu-ji Chen"
 <chenqiuji666@gmail.com>, <Aishwarya.TCV@arm.com>,
 "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
To: "Jon Hunter" <jonathanh@nvidia.com>
References: <20260113162843.12712-1-hanguidong02@gmail.com>
 <7ae38e31-ef31-43ad-9106-7c76ea0e8596@sirena.org.uk>
 <CGME20260120152328eucas1p1024a7488ae10b8b7f2fcb74baee24c75@eucas1p1.samsung.com> <ef37ed64-24ad-4b82-bc6c-d3bc72aaf232@samsung.com> <e32b0819-2c29-4c83-83d5-e28dc4b2b01f@nvidia.com> <DFULF717AOGG.GY8B9ET26KND@kernel.org> <f10007af-3629-4769-b89c-bbf4aa013bf3@nvidia.com> <CALbr=LaE=nS30uMmm_spywEHPYgC_w9qb9L1wFvwBe=PDae1Mw@mail.gmail.com> <DFVBKRQ35CC0.95P329BK5KZA@kernel.org> <956d5d23-6a62-4dba-9c98-83457526f9b6@nvidia.com> <DFVDC5NWTOT4.NA2H05V84CWD@kernel.org> <2b7109c2-2275-4a38-a52f-f4f901a6d182@nvidia.com> <DFW11G0SNME0.3G28YPXH64DOT@kernel.org> <b3b0635c-657f-4869-bc88-06de9287a464@nvidia.com> <DFW4JJYIDC2O.3L1XXBT5MY9SI@kernel.org> <CALbr=LZ4v7N=tO1vgOsyj9AS+XuNbn6kG-QcF+PacdMjSo0iyw@mail.gmail.com> <DFW7DOC56CUG.3PV4UGDTMUYE1@kernel.org> <80129399-2aee-4be8-ad85-3b973c1cef94@nvidia.com>
In-Reply-To: <80129399-2aee-4be8-ad85-3b973c1cef94@nvidia.com>

On Tue Jan 27, 2026 at 3:58 PM CET, Jon Hunter wrote:
>
> On 23/01/2026 19:07, Danilo Krummrich wrote:
>> On Fri Jan 23, 2026 at 7:53 PM CET, Gui-Dong Han wrote:
>>> It seems the issue is simpler than a recursive registration deadlock.
>>> Looking at the logs, tegra_qspi_probe triggers a NULL pointer
>>> dereference (Oops) while holding the device_lock. The mutex likely
>>> remains marked as held/orphaned, blocking subsequent driver bindings
>>> on the same bus.
>>>
>>> This likely explains why lockdep was silent. Since this is not a lock
>>> dependency cycle or a recursive locking violation, but rather a lock
>>> remaining held by a terminated task, lockdep would not flag it as a
>>> deadlock pattern.
>>>
>>> This is indeed a side effect of enforcing the lock here=E2=80=94it ampl=
ifies
>>> the impact of a crash. However, an Oops while holding the device_lock
>>> is generally catastrophic regardless.
>>=20
>> This makes sense to me; it might indeed be as simple as that.
>
> Yes I believe that this is the case too.
>
> BTW, if I apply the SPI series from Breno [0], which fixes crash in the=
=20
> SPI driver, then everything works fine.

Thanks for confirming!

- Danilo
