Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3891E3101A7;
	Wed,  6 May 2026 06:41:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778049669; cv=none; b=UHnjbPpxDDm+f+ybif5O2qtkI1SvXfxXEAU+nusfZ5541YC8zKwzFyzx3BBJpGR79YHIPa7YySZeWQ9MCk0cupKYNP01I3/qv2eFWb2/LYuHE2YERUsUv9EB4f3dBdWJtufPsfRZQKHAjMnN8oi2HU48jiePpld7R8f/joj58XE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778049669; c=relaxed/simple;
	bh=x7UCgp8b7qknECnRSkXyT1Vd7jQFx6dofShcudHrvzk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YqTp+sr/XdyY2HhhgZssKKieedtpLDDb/Z2m5cIjcggEBh8gicx8QCKsA5Vlpa9PtxkBA5EWI6HaqoGauzCHk2E+st1h6+DuL5f7V1bVRG1Z5AMbGgCLZM732B1K1SIsOybw55YYDpWxVY99Hhi2AWdugzD8OzpdtCyqFHNvPY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=4I4AwYbQ; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=pyeCEy4W; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="4I4AwYbQ";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="pyeCEy4W"
Date: Wed, 6 May 2026 08:41:05 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1778049666;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=x7UCgp8b7qknECnRSkXyT1Vd7jQFx6dofShcudHrvzk=;
	b=4I4AwYbQAZ9tzhfcl9HGOznA+HWoAiAqrUiz1qHflGOZg5bJ1GJkPgn7T5x5EL9GGPC9dC
	BkEIwk7ZU3+3BzjUkJ+3WpxTkfVsPHWz8NwZ0G/jP3AnZQsVPzRiqdCx4ugvCg1WGVJNwL
	stFBGi8JJZVtx50LMYid4kQg6COs6Uej6rJLeBUMLL8Ojmy8MULBtwQewXkT9olyc7oUqv
	RNEfC9fBBAElb0kkTFpXMfj13U8iT+O3A0OIpG9A+fiCm5uRMQ6UjbHDUUXniO48AZKVH4
	MtwzTCQ7Wpn7DS7u5lu76UTRGcFZzYK/Pvqb4c0XQjhYGE/JzwTjYGg6HZbrCA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1778049666;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=x7UCgp8b7qknECnRSkXyT1Vd7jQFx6dofShcudHrvzk=;
	b=pyeCEy4WrMGax2ZI0Do75MWLWWVBnca+/u7SrEgYSoFHRJQdOs6pDECIhQj4ZuoK8rBFFk
	jbIYCPNQVOLTsxAw==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Waiman Long <longman@redhat.com>
Cc: Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Clark Williams <clrkwllms@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>, linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-rt-devel@lists.linux.dev,
	jberring@redhat.com
Subject: Re: [PATCH] firmware: tegra: bpmp: Make atomic_tx_lock a raw_spinlock
Message-ID: <20260506064105.7R4Q7XJP@linutronix.de>
References: <20260504163448.1063474-1-longman@redhat.com>
 <20260505062714.jayZOl2t@linutronix.de>
 <afdb5fc1-f478-4547-aa39-04d477854d64@redhat.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <afdb5fc1-f478-4547-aa39-04d477854d64@redhat.com>

On 2026-05-05 15:47:23 [-0400], Waiman Long wrote:
> =C2=A0__might_resched+0x254/0x330
> =C2=A0rt_spin_lock+0x70/0x140
> =C2=A0tegra_bpmp_transfer_atomic+0x118/0x3c0
> =C2=A0tegra_bpmp_probe+0x564/0x6f0

So this is tegra_bpmp_ping().

> I know that interrupt is disabled becasue of the following code.
>=20
> 346 int tegra_bpmp_transfer_atomic(struct tegra_bpmp *bpmp, 347 struct
> tegra_bpmp_message *msg) 348 { 349 struct tegra_bpmp_channel *channel; 350
> int err; 351 352 if (WARN_ON(!irqs_disabled())) 353 return -EPERM;

Well, yes. It disables interrupts just probably to document the time it
took for the transfer so it can write it then via dev_dbg().
It is hard to tell what the worst-case delay here is but it is probably
not important if this is just boot time/ driver probe. Maybe.
What I am bit more concerned if the actual path of this
tegra_bpmp_transfer_atomic() invocation via i2c driver is actually
invoked with disabled interrupts on PREEMPT_RT. Because that might not
be the case. I've been looking at the i2c call chain and it is not
obvious what the actual call chain is. There is just
i2c_in_atomic_xfer_mode() check. So it may or may not be used in the
end.

> Cheers, Longman

Sebastian
