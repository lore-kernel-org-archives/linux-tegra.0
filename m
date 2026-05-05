Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 241F23BF66E;
	Tue,  5 May 2026 06:27:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777962439; cv=none; b=XXsciAdkE4UwJzmSHbsdic9iFvSDNX8wjWHXruGEMMtR/HwH7qUasdkzHFcJJRzR2ofxmHrEpqofat98QjSHfGX9xlzP/36lJyt9sy/Bb2+sOOgPeaSlMmVvIwXjGin32Dk73+1WqAWk/WqJp8hoAmKpkgRUH5IiVnveF6MvCRI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777962439; c=relaxed/simple;
	bh=+KEtOCQsGDRLpQu7nmv9x+S1q2+x8pKajXVJ9gqyYOA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RpqOeC2JJ6nhEHBpuFbF4B+VELODS09f6VvjcMBaL9muRoP0cQZwA6ni5Mc/OhwqDsAwhBPjW+47xUg2TetoteGc0DC0Kh0qeyTbd9VPbB6yb4vGF8GKmPLGJlFXr0QhZ1GLpcaZjhwJMDcBc4igCPkEXIK5nDVcl80JKPRnnAI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=JPllJHKt; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=28Pfh6f5; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="JPllJHKt";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="28Pfh6f5"
Date: Tue, 5 May 2026 08:27:14 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1777962436;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=WSN6Iss074GJAg0Cap5/M8tkIWKay7mbArGgThSND00=;
	b=JPllJHKtmvMQOeBdRxuAPktyEj5370t2b0F4tZvcNvWy0/cJGTjdcqZm3jAIIm4GpD5VZv
	1XFvvH4dHqsQIf42hg+1OwGqjIzup3LZBb2dUDXBvkZIYRwKsL+yf6tsJV7ymhWTvuZCB1
	ArwGsY/Jk2nb6f/IxwAZUJ1AA7gzV02EN24meD9xeMAY+KznJmRCNmFbnSpAhwlpAGOds3
	ydBvrcTzAFDuKpDGEgCPhhgjA5RZ20TtueKUG/S5jZfu+c0zqXto99x9BN+qVrLnc52nU1
	ANLu3l6l0J+pF4XPlupQDWDdkCzNw8tXh5cG+d0QaWfBTzpPdXT4n0ynsWokig==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1777962436;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=WSN6Iss074GJAg0Cap5/M8tkIWKay7mbArGgThSND00=;
	b=28Pfh6f5Pk67M/b8Y6TY2UJ6WRjHPf9OrjJNvIpudObczlWMNbRk8p6AdwQTe1vOS4GBVO
	+G+RCNN+MSGLnVBQ==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Waiman Long <longman@redhat.com>
Cc: Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Clark Williams <clrkwllms@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>, linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-rt-devel@lists.linux.dev,
	jberring@redhat.com
Subject: Re: [PATCH] firmware: tegra: bpmp: Make atomic_tx_lock a raw_spinlock
Message-ID: <20260505062714.jayZOl2t@linutronix.de>
References: <20260504163448.1063474-1-longman@redhat.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260504163448.1063474-1-longman@redhat.com>

On 2026-05-04 12:34:48 [-0400], Waiman Long wrote:
> The atomic_tx_lock was first introduced by commit 1abb081e41a7
> ("firmware: tegra: Simplify channel management") as a spinlock_t. It
> is used only in tegra_bpmp_transfer_atomic() to ensure mutual exclusion.
> 
> Since the merging of PREEMPT_RT support into mainline Linux kernel
> in v6.12, a spinlock becomes a sleeping lock when CONFIG_PREEMPT_RT
> is enabled. As tegra_bpmp_transfer_atomic() is called with interrupt
> disabled, acquiring a sleeping lock will lead to the following bug
> report when booting up a PREEMPT_RT kernel on an tegra based arm64
> system with Boot and Power Management Processor (BPMP).
> 
>   BUG: sleeping function called from invalid context at kernel/locking/spinlock_rt.c:48
>   in_atomic(): 0, irqs_disabled(): 1, non_block: 0, pid: 1, name: swapper/0
>   preempt_count: 0, expected: 0
>   RCU nest depth: 0, expected: 0
>   2 locks held by swapper/0/1:
>    #0: ffff42bda2d5b0f0 (&dev->mutex){....}-{3:3}, at: __driver_attach+0x110/0x2c0
>    #1: ffff42bda4da5138 (&bpmp->atomic_tx_lock){....}-{2:2}, at: tegra_bpmp_transfer_atomic+0x118/0x3c0
> 
> Fix it by changing the type of atomic_tx_lock in the tegra_bpmp structure
> to raw_spinlock_t and use raw_spinlock APIs to access it.

Do you have a backtrace why interrupts are disabled to begin with?

Sebastian
