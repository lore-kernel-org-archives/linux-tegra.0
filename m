Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3F5B3126A0
	for <linux-tegra@vger.kernel.org>; Wed, 26 Aug 2026 07:35:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787729755; cv=none; b=ueGwdWV0c/0HtoAgvwbGRbZvTQhyG7VOiekJrn7RjiArZLleHY+ZZ4JyQterVxbH3oQay8UDtQrV7S6JMfA3Gqrtqc8sCzvCtaPZM008hQPXzcSx7mQe3lfIlXe9f1En49FJtEsMKowoKdN2CtVEh2SzCMby24XvJM6trictjY4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787729755; c=relaxed/simple;
	bh=lAlKIiHaY2We1Eg1pAGcjv+qVL9z4hMibmiKpOQKs2w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VlbeZk4XBSmJOgNmcUqVWhB+iXLXToiUdqsAygzR1ex/tVVnwvjeQnKGSyKuhwuaYtK1Szjn62J23t5R9u0O8HlcJjyR8RK51aD0zyKSe5YwxGK4QSCTHM/QHo0kjiybMHqVApEo0QTLvE6Bj3mDn671iFMfrKeTBuBDe6jO5cY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=DBaRqaQt; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="DBaRqaQt"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-69c600f76ccso971592a12.0
        for <linux-tegra@vger.kernel.org>; Wed, 26 Aug 2026 00:35:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1787729752; x=1788334552; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+o2OHs7EVw7RDxE23MpGrAyGtipLg/M6rWi6a9Pf3sE=;
        b=DBaRqaQtSIu/2KHO73pd6EH0+cfbfU32mvCqwa+FwnvGwv2IZD0Sezre8NNj6dtevK
         yBUkOmulGmkpNHWo+OOI/UjijZ5+fO2y42IEOVrH72HKmzuO8Pb3xcUWrKzf5hIe0GqC
         SEP5IS9Ep7rRvPsfzCXAfiOhao4V/KmG8KCWH2Cqq3kzTtZ3ArcZttxwcBqW/Yu012TP
         Ga48vaKh7SzLDcKmNg48QaTBEqa705ETizfe3+IO0y0aJUsQQv11Fn8KWEAOho96JphZ
         Rj+bNXOpVNERL031QTDij+cmcqzs3AKsmdy3S/BNUsbcfNxu0ZjSRdzjt5Y18ij6tt34
         EwkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787729752; x=1788334552;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+o2OHs7EVw7RDxE23MpGrAyGtipLg/M6rWi6a9Pf3sE=;
        b=dP/Kl5FbuifN0gciwAJfkdE9aj7SY4IncMrCXM4D1a/WBkBtlGEVR/tuOetq/noR/N
         BmZR6FKKY6s+hie6GgGXItXnkmM9TCihZQG7fkuyO5+zjwgY0jcCXUN4oUz5gqeG+e3o
         EyldaNwIpijc/HKWkjCbAnyKdsK61EV/OWlEd0cRfzKh7jaBUal4STNTpqyvznrEJq86
         ZgBR6IRowXMKcVgo3Kj/dclQTFjDZSP1H8VmZcHVVKsavsc8UyYcLSRvI9nVnssb6YbG
         zZkeHQQ5BZ55e+BWL+KAEEovlTUJmULvq//0Qenst2cnMPoPHftaai6G31FpCMDQdmc+
         F9Lw==
X-Forwarded-Encrypted: i=1; AHgh+RrYjg/K5PA+f7YpB7b8oWXxxImWv5afrfoFk0nwqx2lqSTaFidr9+VqcvIHBiCY2o42fomREQEKSX0PRA==@vger.kernel.org
X-Gm-Message-State: AFuF++lPjN1Ox+s7FfmcIHD9EKvL1oro9790tqMyQ6sdkWbgv9FhLiBj
	jBTpjydX/7GqBD0Y+jsySveWRbWPGT53RvVq1PaAHwzhqskJ1lbOTPVNt48kum/lfOU=
X-Gm-Gg: AR+sD12fzwKCEecWYDITYkN9ypRaJLys7eg8XKoPX2MpdaDzI6/LtAKyKxNhrDn3Ncj
	D2Ckz8GW/BWcmf9vW1KMrzVi3+9EJ15hOjioZJ9IqRu64cdZp4aYx9UyzKkTgVh0x9LO3YVfse+
	43mjxdeyjw9JWqszs3RfnU+C7ZEtN6BxXFs/0Cyua+sFINHnNXH3BMbuGszY4+GD9F0/G6Lp9xQ
	YhZbeOsaRA5FbYz+cZ64V0KoBTbbx/Fe2EW8KERK0gyfI4euiwyAvgdoR9XK0hwgOuD+E9BA7CB
	XQZxEAftFL2G8qMRxW5qEEDbyya/mPa8fOCSnJx0l+WLZzzOv8LtbuUjTJ4Pc73DL+Kn/zYLSfi
	Er/P1bfHJ9xgZIn1NudSaR2M8hZnZNDZvinSUjCMjis4bPW8WMLtWhsg0LnZughQ6No4NbFy8RF
	vT8yD1CEBofcXCcgrC3GKTPScRHeO5YZhHscLvNmiN4GHk5312YodZT3vUzv8NpA==
X-Received: by 2002:a17:906:fe4a:b0:c25:5d2:acf0 with SMTP id a640c23a62f3a-c250bb53e86mr564960866b.8.1787729752072;
        Wed, 26 Aug 2026 00:35:52 -0700 (PDT)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c250a88aa0asm399790766b.35.2026.08.26.00.35.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 00:35:51 -0700 (PDT)
Date: Wed, 26 Aug 2026 09:35:49 +0200
From: Petr Mladek <pmladek@suse.com>
To: John Ogness <john.ogness@linutronix.de>
Cc: Jon Hunter <jonathanh@nvidia.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Jiri Slaby <jirislaby@kernel.org>,
	Andy Shevchenko <andy.shevchenko@gmail.com>,
	linux-kernel@vger.kernel.org,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Hugo Villeneuve <hvilleneuve@dimonoff.com>,
	Kees Cook <kees@kernel.org>, Stepan Ionichev <sozdayvek@gmail.com>,
	Xin Zhao <jackzxcui1989@163.com>,
	Osama Abdelkader <osama.abdelkader@gmail.com>,
	Fushuai Wang <wangfushuai@baidu.com>,
	Marco Felsch <m.felsch@pengutronix.de>,
	linux-serial@vger.kernel.org,
	"linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
Subject: Re: [PATCH tty v11 1/2] serial: 8250: Switch to nbcon console, take 2
Message-ID: <ao6XVfmvV6HjBiEv@pathway.suse.cz>
References: <861247ca-dfd4-40c6-a094-0fbe389f3b67@nvidia.com>
 <aoR_9g7W0qyqWbOj@pathway.suse.cz>
 <fd1802c3-4b38-4127-b988-a9ff059bcebf@nvidia.com>
 <877bll9d91.fsf@jogness.linutronix.de>
 <eb0f2c8b-2c7b-4bfd-9144-6786999c4c31@nvidia.com>
 <875x139eqr.fsf@jogness.linutronix.de>
 <6b46866f-548f-4963-bc41-48ce15ae9012@nvidia.com>
 <877ble714e.fsf@jogness.linutronix.de>
 <d058012e-2be7-4e70-9c10-5e4c00a23b05@nvidia.com>
 <87pkz56epl.fsf@jogness.linutronix.de>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87pkz56epl.fsf@jogness.linutronix.de>

On Wed 2026-08-26 00:08:46, John Ogness wrote:
> On 2026-08-25, Jon Hunter <jonathanh@nvidia.com> wrote:
> >>> With this I see a little more output on the console, but it still
> >>> appears to hang later and never fully boots.
> >>>
> >>> Boot log here: https://pastebin.com/Xe1vmeUj
> >> 
> >> Thanks, this information is helpful. Below is another hack, to be used
> >> on the unmodified linux-next. For whatever reason, I think the queuing
> >> of irqwork is causing problems. Perhaps the irqwork is actually firing
> >> even though interrupts are supposed to be disabled here.
> >> 
> >> The following hack will disable the queuing during the cpuidle. Please
> >> give this a try:
> >> 
> >> ===== BEGIN CPUIDLE HACK =====
> >> diff --git a/drivers/cpuidle/cpuidle-tegra.c b/drivers/cpuidle/cpuidle-tegra.c
> >> index aca907a62bb5d..1dca9d6defbff 100644
> >> --- a/drivers/cpuidle/cpuidle-tegra.c
> >> +++ b/drivers/cpuidle/cpuidle-tegra.c
> >> @@ -226,6 +226,7 @@ static int tegra_cpuidle_adjust_state_index(int index, unsigned int cpu)
> >>   	return index;
> >>   }
> >>   
> >> +extern bool console_irqwork_blocked;
> >>   static __cpuidle int tegra_cpuidle_enter(struct cpuidle_device *dev,
> >>   					 struct cpuidle_driver *drv,
> >>   					 int index)
> >> @@ -238,6 +239,8 @@ static __cpuidle int tegra_cpuidle_enter(struct cpuidle_device *dev,
> >>   	if (dev->states_usage[index].disable)
> >>   		return -1;
> >>   
> >> +	console_irqwork_blocked = true;
> >> +
> >>   	if (index == TEGRA_C1) {
> >>   		if (do_rcu)
> >>   			ct_cpuidle_enter();
> >> @@ -256,6 +259,8 @@ static __cpuidle int tegra_cpuidle_enter(struct cpuidle_device *dev,
> >>   		index = ret;
> >>   	}
> >>   
> >> +	console_irqwork_blocked = false;
> >> +
> >>   	return index;
> >>   }
> >> ===== END CPUIDLE HACK =====
> >
> > Yes that does boot.
> 
> Your results surprise me a bit because in previous attempts it seemed
> you were also getting hangs related to printk's not produced within
> cpuidle. This would lead me to believe that cpuidle is entered while
> irq_work from a directly preceeding printk (from outside cpuidle) was
> pending and caused a problem.
> 
> Does this hack really work reliably, without using keep_bootcon or any
> other patches?
> 
> Also, although this hack will avoid queuing irq_work from within
> cpuidle, it does not prevent the 8250 console driver from queuing
> irq_work for MSR handling during atomic printing. There is no generic
> console callback to deal with that (other than suspending the console).
> 
> I suspect it is a general irq_work problem on tegra regarding
> suspend/cpuidle. Really the problem should be fixed there. But I would
> need hardware to investigate the issue.
> 
> As for this 8250 "switch to nbcon" series, I am uncertain how to
> proceed. Is it really printk's job (and, by extension, the console
> driver's job) to decipher when it is allowed to queue irq_work?

I wonder how other architectures hanle this situation. I wonder
if they just ignore the pending IRQs.

Best Regards,
Petr
