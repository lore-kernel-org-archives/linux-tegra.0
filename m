Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 043F01CACF3;
	Tue, 13 May 2025 22:55:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747176913; cv=none; b=KY2E1yf8vNS2NHRsXK612PYvexs+odcma179eu9L7I8y24uESeMITE+qO0AWePJizTB9QuhsOfmwPChQLv9n63myMmOkgeVYeClAxaYm0lCSmUwdo7so6fMmhgcywdwx15lsTDQF5NYjp0fRWGuxB+A29n4hIDedKEQie8kCgiY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747176913; c=relaxed/simple;
	bh=grB2+CAgoGTwFeCdki92fBSghVYqghIeBU/TCirqWCw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=k5J6uEi5PW1uY6dDA1Y7ceXjUCA/zj/CbFtkKr4MV6xkoI/PVQUTvpgn4UYK5YA4bp0HBfqRtot+SmC7g2y0t8MqATNftoznWgbu2sONKNHEy1mfAF1w1nUKz1NRCO+EHJvdHE9IpUIKqjW6CZPgptfhxHgjXL5W+kZSHbf1vEs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=zV+k1Euo; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=s7H/2Xx6; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="zV+k1Euo";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="s7H/2Xx6"
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1747176909;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ypElEeQjCKHS4G3vu8w5NzqhAnVnK/eTiCY+VgQb8Lw=;
	b=zV+k1EuoeJ3cAV1hgZ6+j1hGpAJRTBKtXkWBsVrC0glUTMYQ4gvznl55PwjhSBg8tdzjU5
	zYSc4+RIsnaxJ1LzkX34wc3AByGcFyZYEBPnOzKuEG9naDbnz0POXzvXgLBBkYtVWWgjY/
	FYUchd78jgRT0q+Dciimn3vJ6zqyp0cbY/4vx1kWKfIBNUHumzIP3kj6rKfDYjlFPPB6qe
	AelbhkvBJMJLORGRnVwVSA/sPV7YGdKwyRO9rUgEQQ3PzL+t/sNSVVu+7WNZPbdz2BKStf
	1n5w93OPMkgm1QLrRZkbb0bciXU9SNNZZhW0bd535Qs7bKbJoGV65f20Da7KSg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1747176909;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ypElEeQjCKHS4G3vu8w5NzqhAnVnK/eTiCY+VgQb8Lw=;
	b=s7H/2Xx6VZUKiACjxY+l5FPOVgHvDhXIWlsE/OXEXS24vutUttjlHs5DBEqdsDJOTe2R75
	ySzCRh+Kro+pDhBA==
To: Jon Hunter <jonathanh@nvidia.com>, Jiri Slaby <jirislaby@kernel.org>,
 LKML <linux-kernel@vger.kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>, "linux-tegra@vger.kernel.org"
 <linux-tegra@vger.kernel.org>
Subject: Re: [patch V2a 35/45] genirq/manage: Rework irq_set_irq_wake()
In-Reply-To: <35f464cf-c264-4f2b-9e0b-fd8a71526aa1@nvidia.com>
References: <20250429065337.117370076@linutronix.de>
 <20250429065422.128859754@linutronix.de>
 <e9a0abc5-7ee0-4ee1-9e19-37d43a5d41de@kernel.org> <87plgtq0qb.ffs@tglx>
 <87ldrhq0hc.ffs@tglx> <35f464cf-c264-4f2b-9e0b-fd8a71526aa1@nvidia.com>
Date: Wed, 14 May 2025 00:55:08 +0200
Message-ID: <87ecwsjf3n.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Tue, May 13 2025 at 18:32, Jon Hunter wrote:
> On 30/04/2025 13:48, Thomas Gleixner wrote:
>> @@ -846,45 +846,40 @@ static int set_irq_wake_real(unsigned in
>>    */
>>   int irq_set_irq_wake(unsigned int irq, unsigned int on)
>>   {
>> -	unsigned long flags;
>> -	struct irq_desc *desc = irq_get_desc_buslock(irq, &flags, IRQ_GET_DESC_CHECK_GLOBAL);
>> -	int ret = 0;
>> +	scoped_irqdesc_get_and_lock(irq, IRQ_GET_DESC_CHECK_GLOBAL) {
>
>
> I noticed a suspend regression on some of our Tegra boards and bisect 
> pointed to this commit. I made the following change and this does appear 
> to fix it ...
>
> diff --git a/kernel/irq/manage.c b/kernel/irq/manage.c
> index 2861e11acf3a..c94837382037 100644
> --- a/kernel/irq/manage.c
> +++ b/kernel/irq/manage.c
> @@ -846,7 +846,7 @@ static int set_irq_wake_real(unsigned int irq, 
> unsigned int on)
>    */
>   int irq_set_irq_wake(unsigned int irq, unsigned int on)
>   {
> -       scoped_irqdesc_get_and_lock(irq, IRQ_GET_DESC_CHECK_GLOBAL) {
> +       scoped_irqdesc_get_and_buslock(irq, IRQ_GET_DESC_CHECK_GLOBAL) {
>                  struct irq_desc *desc = scoped_irqdesc;
>                  int ret = 0;
>
> Hence, I wanted to ask if this should still be using the buslock scope here?

Of course. My bad. Care to send a patch with a proper change log?

Thanks

        tglx
