Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D4333009C3;
	Thu, 22 Jan 2026 18:12:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769105549; cv=none; b=WWWvGQG8oQ8HoNLGucad+WNTmC3p6SSY1Rwgl0fy35vTJBDeH5UiDmFS7p05P8FruwkEAcrrM6k84/mrZSVB8OciEM+AFOYLDb4AWYhf5JgjY1yB/ngiADJBURU15WKTmjgT1KY93ELw4XkX6rF92U04MQib8dXHiXdaxRiE8cY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769105549; c=relaxed/simple;
	bh=BF5XkT2Ne8udKQZehtPqy7h7TXyXnvBJpU6eGLCqHc0=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=IZYQmqEVJ0j2OiUi3d1dJODPT8c1jVxzsIQO5ojJkqtFOM/1ZRs07TddGe+cE4XLrpqbnkFTLGQkeVuQtfPHRNajfD198YSn/rJGfOABg/H3cwl2NCjmDR/NkBAoSk+pGzjWpgqz5eUg+JUb9ntJy+I0MooWgVgMh0e6voGv2Wg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Sl5sVRS0; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Sl5sVRS0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4A6EC116C6;
	Thu, 22 Jan 2026 18:12:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769105548;
	bh=BF5XkT2Ne8udKQZehtPqy7h7TXyXnvBJpU6eGLCqHc0=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=Sl5sVRS039iOpnSXIwAEp5PWtUfnWifRyqEMWiuI8j27EPQhghynqN0RSwcjApXKA
	 fscfLWgkbY+n+2j96dSRyLyLEwSQpDT38E6+kX4mFHjb2MYxuV2U6vKQzm4ZZLsYyc
	 OUhrzwopzNKGx7dUmMfkgdDq15VDwcquRF/dU34xxAZy50dbYDF7OVKM/CpJfVLrD0
	 Sp2fgaL1wSABzpzKW2U91zFp7j14v25g9uIKC3h9nCPW3caHPoqoz28TnAwdXaeIHW
	 oMHkIEPpCST3t+6UJCSS2ubCBGsOhqNIoEZBrQRXjEGxCeYYmWr0R3Oazbwz1wxM72
	 YL3KxwCA2/xbw==
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 22 Jan 2026 19:12:25 +0100
Message-Id: <DFVBKRQ35CC0.95P329BK5KZA@kernel.org>
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
 <CGME20260120152328eucas1p1024a7488ae10b8b7f2fcb74baee24c75@eucas1p1.samsung.com> <ef37ed64-24ad-4b82-bc6c-d3bc72aaf232@samsung.com> <e32b0819-2c29-4c83-83d5-e28dc4b2b01f@nvidia.com> <DFULF717AOGG.GY8B9ET26KND@kernel.org> <f10007af-3629-4769-b89c-bbf4aa013bf3@nvidia.com> <CALbr=LaE=nS30uMmm_spywEHPYgC_w9qb9L1wFvwBe=PDae1Mw@mail.gmail.com>
In-Reply-To: <CALbr=LaE=nS30uMmm_spywEHPYgC_w9qb9L1wFvwBe=PDae1Mw@mail.gmail.com>

On Thu Jan 22, 2026 at 6:55 PM CET, Gui-Dong Han wrote:
> On Fri, Jan 23, 2026 at 1:28=E2=80=AFAM Jon Hunter <jonathanh@nvidia.com>=
 wrote:
>>
>> Hi Danilo,
>>
>> On 21/01/2026 21:42, Danilo Krummrich wrote:
>> > On Wed Jan 21, 2026 at 9:00 PM CET, Jon Hunter wrote:
>> >> It is odd because it only appears to impact the Tegra194 Jetson Xavie=
r
>> >> NX board (tegra194-p3509-0000+p3668-0000.dts).
>> >>
>> >> It appears to boot enough so the test can SSH into the device, but th=
e
>> >> kernel log does not show the us getting to the console prompt. It als=
o
>> >> appears that a lot of drivers are not bound as expected. I would need=
 to
>> >> check if those are all modules or not.
>> >
>> > The other reports were fixed by [1], but the issue in arm-smmu-qcom sh=
ouldn't be
>> > related in this case.
>> >
>> > I quickyl checked all drivers with "tegra194" in their compatible stri=
ng, but
>> > didn't see anything odd.
>> >
>> > Can you please try to enable CONFIG_LOCKDEP, CONFIG_PROVE_LOCKING,
>> > CONFIG_DEBUG_MUTEXES and see if you get a lockdep splat using the foll=
owing
>> > diff?
>> >
>> > (You will see a lockdep warning in faux_bus_init(), it's harmless and =
can be
>> > ignored.)
>>
>> Thanks. I do the lockdep warning in faux_bus_init() but that's the only
>> one. I have verified that all these CONFIGs are correctly enabled in the
>> build. The device boots fine with the below diff, but I am guessing that
>> that is expected?

Yes, that's expected, we not actually taking the lock, but assert to lockde=
p
that we did. The fact that we use a dynamic lock class key for each device =
mutex
to avoid false positives should also be fine.

>> Any other thoughts?

With this diff, if I intentionally create a deadlock condition on my machin=
e, I
do see a lockdep splat as expected.

Anyways, another option would be to attach a hardware debugger (I assume yo=
u
have TRACE32 or something available?) and then get a backtrace from the CPU
affected of the deadlock.

> Can you please try applying the following commit?
>
> https://git.kernel.org/pub/scm/linux/kernel/git/driver-core/driver-core.g=
it/commit/?h=3Ddriver-core-linus&id=3Ded1ac3c977dd6b119405fa36dd41f7151bd5b=
4de
>
> Robin Murphy confirmed that the qcom specific issue might actually
> impact other hardware platforms (provided ARM_SMMU_QCOM/ARCH_QCOM is
> enabled), as the implementation init code is still executed:
>
> https://lore.kernel.org/driver-core/d2ddbb72-30a8-44da-b761-876b2d37567e@=
arm.com/
>
> So, this patch might fix the issue on Tegra as well.

I thought of that as well, but looking at the code in arm_smmu_impl_init(),=
 it
seems that can't happen?

	if (of_device_is_compatible(np, "nvidia,tegra234-smmu") ||
	    of_device_is_compatible(np, "nvidia,tegra194-smmu") ||
	    of_device_is_compatible(np, "nvidia,tegra186-smmu"))
		return nvidia_smmu_impl_init(smmu);
=09
	if (IS_ENABLED(CONFIG_ARM_SMMU_QCOM))
		smmu =3D qcom_smmu_impl_init(smmu);

But maybe there is some odd case where the first if condition does not eval=
uate
to true on tegra194, so maybe worth a try.
