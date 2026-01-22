Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FB01330B27;
	Thu, 22 Jan 2026 19:35:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769110518; cv=none; b=gC74vRRqwC31/7v4i4yTwCzlPP0QANpsvJOziQD1MtU6YM5O+ON+tLEyPmLv9oXNM8gQe5zjNw8w29OeZD4L/7pRr0o3LsAdf3WyMWUOec6Wsyi/qqgDy6haXS36SDoMykktW+yTEIOoIpmUYpkCRQr+AVkER3KQQq4MLPDD5o4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769110518; c=relaxed/simple;
	bh=3whBI1MX2uHj34azyrxvApGPIcpwchGjdTuZ14Ng/R4=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:From:Subject:Cc:
	 References:In-Reply-To; b=HTQTMznEm4bILEMZ5E/Sr8a14+hgUoosL8F2eT/NZl/2ko2JOwi1A2D5ysvlXbIDBMb62k2o5XlHWkgUJPewnCUZNT+2EitJ7A7qFYEQWri654h4yu7qyrQmdusDtErSynfyr00bjdKbSCW30sA8wqCHgP0pMb/LTEZxMbaXjOs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TxNavxpp; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TxNavxpp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19471C116D0;
	Thu, 22 Jan 2026 19:35:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769110516;
	bh=3whBI1MX2uHj34azyrxvApGPIcpwchGjdTuZ14Ng/R4=;
	h=Date:To:From:Subject:Cc:References:In-Reply-To:From;
	b=TxNavxpp+ego/6ws1+9IS5Vm7+KMPsdybkl6MDdGnjrnpkqBxcDGZ2sPcq0TFzNGQ
	 GjEvT5wZ9Noz8GhXnkXykAVKtHm6OtnmZWqYH+UWVMuuRIk20OZ+pO6kORzHw9LYxI
	 jY7sizKhJgJDw2kqiTsxENXjQ9bTJHIu+N7rjlSbtKyG2SU4O6GfbBi+mgeidwI3s7
	 5f1+QswuNlpYAotFCO7hMbBiyJNQQwqxpZu8xOZGNJ3qef6JprXGx+2kwx0mp1jY/I
	 vgTjPmoOhesDxVuGf6nvlE08xKUFdJzj/23HELYvU6yM1GteWB0a6YEAbrDKghLWPr
	 k27uxjiFw7Yig==
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 22 Jan 2026 20:35:12 +0100
Message-Id: <DFVDC5NWTOT4.NA2H05V84CWD@kernel.org>
To: "Jon Hunter" <jonathanh@nvidia.com>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH v5] driver core: enforce device_lock for
 driver_match_device()
Cc: "Gui-Dong Han" <hanguidong02@gmail.com>, "Marek Szyprowski"
 <m.szyprowski@samsung.com>, "Mark Brown" <broonie@kernel.org>,
 <gregkh@linuxfoundation.org>, <rafael@kernel.org>,
 <linux-kernel@vger.kernel.org>, <baijiaju1990@gmail.com>, "Qiu-ji Chen"
 <chenqiuji666@gmail.com>, <Aishwarya.TCV@arm.com>,
 "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
References: <20260113162843.12712-1-hanguidong02@gmail.com>
 <7ae38e31-ef31-43ad-9106-7c76ea0e8596@sirena.org.uk>
 <CGME20260120152328eucas1p1024a7488ae10b8b7f2fcb74baee24c75@eucas1p1.samsung.com> <ef37ed64-24ad-4b82-bc6c-d3bc72aaf232@samsung.com> <e32b0819-2c29-4c83-83d5-e28dc4b2b01f@nvidia.com> <DFULF717AOGG.GY8B9ET26KND@kernel.org> <f10007af-3629-4769-b89c-bbf4aa013bf3@nvidia.com> <CALbr=LaE=nS30uMmm_spywEHPYgC_w9qb9L1wFvwBe=PDae1Mw@mail.gmail.com> <DFVBKRQ35CC0.95P329BK5KZA@kernel.org> <956d5d23-6a62-4dba-9c98-83457526f9b6@nvidia.com>
In-Reply-To: <956d5d23-6a62-4dba-9c98-83457526f9b6@nvidia.com>

On Thu Jan 22, 2026 at 7:58 PM CET, Jon Hunter wrote:
> On 22/01/2026 18:12, Danilo Krummrich wrote:
>> With this diff, if I intentionally create a deadlock condition on my mac=
hine, I
>> do see a lockdep splat as expected.
>>=20
>> Anyways, another option would be to attach a hardware debugger (I assume=
 you
>> have TRACE32 or something available?) and then get a backtrace from the =
CPU
>> affected of the deadlock.
>
> Unfortunately, these days I don't have such tools available so that's=20
> not an option.

Hm..slowly running out of options. :)

I remember you previously said that you can still SSH into the machine? If =
so,
can you please share the the first output of

	echo l > /proc/sysrq-trigger

directly after booting?

Subsequently, can you please also run

	echo w > /proc/sysrq-trigger

and

	echo t > /proc/sysrq-trigger

If the output of the last shows a task in D state, you can also run

	cat /proc/$PID/stack

Also, are there any OOT modules loaded?

Thanks,
Danilo
