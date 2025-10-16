Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E02E722D4FF;
	Thu, 16 Oct 2025 18:54:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760640844; cv=none; b=DVkDbU8DsWdGFbLq+sAwDEiQ84GFSc28DK7TIZAPK7xy5r9FwXldFx5zXNQYsYKfj49C6r6SKiZGAGx9PZGhjw/G/FEoSm1v072YGxgLig1bbm/fnUgHjkR+/9BK+3jdHQm4qG5+XUs/56OJgCTWnGcYSnS35EkLKO5qq1WNjDg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760640844; c=relaxed/simple;
	bh=oC4Qmh26pfyqGfqAYEuZFDRhfG9AIhUmSYnLHNqUl2Q=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=CG4qEs0lVZAGABaBC5D4aVUy19vWJcY8/VC8BQc3CmuizFDEiWUFYLpbUuD5/M6mnxYxoY+hEXBgoPA9wW5O82eRWLq5woiqCH+s4gbDlBh2WbU3k/rrmAf9D9llUAAj/xbrNFaHg739SzQboa7CpX/UNxCUWloOrTCHEURU/XY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=nGQVX2Qk; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=VfN0Q0lm; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="nGQVX2Qk";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="VfN0Q0lm"
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1760640841;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Cw3pW5LiVDOcN8pDOG3T4cobF3AN3EhzWUWIZj4Jfn0=;
	b=nGQVX2QkQPTCRrQ3BVNkCItQ8edVCSCv+T5F2Qf/zP2coTUp9sAt8aAxm4Ht2INwayVIV8
	RADP6UycoswqT4A6oeZQpAB+bsa27Eg5IvIjszqJB89aSsB19pXQxg+Kz9kH0dm/ueVy+G
	6tdpH8WNg9IsLC7dnL0CMx03hTmlc/pPtdR18iD0yytSPE8627j4MyWKJQEGXrCYpVMhfq
	Jr4KM++28o5bwAeNoKWu6cFIMb3JnAd+gZUE/opBDKWnkoMlAeuK8Bub6mRnWh3JMr92Ra
	GUUxWv69KXu+PQq1M6Bg72OhVgc9LbkOXS3SE7b1mzWVs/txkfKRe2k2eWtFVQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1760640841;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Cw3pW5LiVDOcN8pDOG3T4cobF3AN3EhzWUWIZj4Jfn0=;
	b=VfN0Q0lmGJs/KvetSfYA7RgYqToXfCulGzUCe3r/4KAEMiWwRd1TmbHapQ9XlNL4Jtbzfr
	Fe/1qgwaEUvjpyAQ==
To: Thierry Reding <thierry.reding@gmail.com>, Marc Zyngier <maz@kernel.org>
Cc: linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: IRQ thread timeouts and affinity
In-Reply-To: <j7ikmaazu6hjzsagqqk4o4nnxl5wupsmpcaruoyytsn2ogolyx@mtmhqrkm4gbv>
References: <j7ikmaazu6hjzsagqqk4o4nnxl5wupsmpcaruoyytsn2ogolyx@mtmhqrkm4gbv>
Date: Thu, 16 Oct 2025 20:53:59 +0200
Message-ID: <87cy6m1xvc.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Thu, Oct 09 2025 at 13:38, Thierry Reding wrote:
> We've been running into an issue on some systems (NVIDIA Grace chips)
> where either during boot or at runtime, CPU 0 can be under very high
> load and cause some IRQ thread functions to be delayed to a point where
> we encounter the timeout in the work submission parts of the driver.
>
> Specifically this happens for the Tegra QSPI controller driver found
> in drivers/spi/spi-tegra210-quad.c. This driver uses an IRQ thread to
> wait for and process "transfer ready" interrupts (which need to run
> DMA transfers or copy from the hardware FIFOs using PIO to get the
> SPI transfer data). Under heavy load, we've seen the IRQ thread run
> with up to multiple seconds of delay.

If the interrupt thread which runs with SCHED_FIFO is delayed for
multiple seconds, then there is something seriously wrong to begin with.

You fail to explain how that happens in the first place. Heavy load is
not really a good explanation for that.

> Alternatively, would it be possible (and make sense) to make the IRQ
> core code schedule threads across more CPUs? Is there a particular
> reason that the IRQ thread runs on the same CPU that services the IRQ?

Locality. Also remote wakeups are way more expensive than local wakeups.

Though there is no actual hard requirement to force it onto the same
CPU. What could be done is to have a flag which binds the thread to the
real affinity mask instead of the effective affinity mask so it can be
scheduled freely. Needs some thoughts, but should work.

> Maybe another way would be to "reserve" CPU 0 for the type of core OS
> driver like QSPI (the TPM is connected to this controller) and make sure
> all CPU intensive tasks do not run on that CPU?
>
> I know that things like irqbalance and taskset exist to solve some of
> these problems, but they do not work when we hit these cases at boot
> time.

I'm still completely failing to see how you end up with multiple seconds
delay of that thread especially during boot. What exactly keeps it from
getting scheduled?

Thanks,

        tglx
 
