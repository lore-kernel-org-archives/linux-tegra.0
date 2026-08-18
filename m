Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE3CD3FDBE8
	for <linux-tegra@vger.kernel.org>; Tue, 18 Aug 2026 07:51:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787039515; cv=none; b=W7ZwF6ddPLYP/q88ZicLhYBf58Sq7AzxRTSXNI26BvLdezzoyzN8PzinaPCpZ3JpgrkFmDv0GSNo+izilKOuk+NAdo+x86CZJPVpZQSW5436QmtFObybz660D6x14eTyYvjiVfr0wHPBBB6yWcyZCxmdSTJLj2IJjU47FNu2iTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787039515; c=relaxed/simple;
	bh=+TL5RIW1sQcLdmF+sEaMUOxeOhPPrZWABcWxG3wJ7Ww=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tTjz6Bx6fKR8TThw2IbOYXoT85S7CwwbIeiMBO4fXGT2OKJ0lKIlBJYha9nRLz8tYPwZwcpPykw95tMyZHSgbWLw5itaNH1E3ddAU1snazFjDbdtVGuc29uuI3ywd8SGRbJZG34ErVW3y4BrUPDDPb2gjw45WTGfG3+ToC6SL8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=A5OVMKRN; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="A5OVMKRN"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4954a32cf1eso22016835e9.3
        for <linux-tegra@vger.kernel.org>; Tue, 18 Aug 2026 00:51:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1787039511; x=1787644311; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ytGWt1YRdjzr+JNfsHCwKEMc0toTnk6HqTBPGuje0Qk=;
        b=A5OVMKRNR3xo1amzcd6bPhweBWXyhU3+TCk7p8AjVbXW2ZL3UL3Ft6BFOetny3kJW3
         xige7m5BAZ9xjk3xaUQOfrUik3KIQ8Md7JWzUUSo7vZUAIGNDZ08HLxAxhBmBy4J3M83
         D/Wk7Ed9Bp1x8rQJqDSjt/9pw9b46qSmwkLgOe4WhmVPXZNAtuJJ3lbWGuoJqS5Df8+i
         A+Nol7l7a5DxUhwYRSuVbmyvIqEPnKq5D1xIKpzxUzDHOfgt5HWLi644X5nYNs5Nb/jB
         Eu3FR3CgxS/OQYD6xxFDnHMlAJYq0spDvchewJVbbQSEbKVFaJJpNY4fldhPfDkGy0Qm
         bMrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787039511; x=1787644311;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ytGWt1YRdjzr+JNfsHCwKEMc0toTnk6HqTBPGuje0Qk=;
        b=jbnGa/9xDgsK8lJUTG1LS+nanbb5gX5uDv37luVY8/s6JGfQVvfzxya+WI59aHE6Io
         qLBrIcWWF8k0HcC2yI/U/l9fk4hOgodz9ifVY/EA+RiFDCuBN0nz31tEUkStZXlwGiJk
         B6lBtucdaNXRRyx9L9gbPlyQszqflMHO9Oi3SmEUtHsmubyzkH+7ujCD1tgjRILadOCM
         N+HW1dwCHY8osmRvSQ8s4y2p+yjwP2cRpARtvlPpiTKRoKMXe7wjkKg6BLAbGeSNpPRu
         0YTNd03nZ18yHUo/V0FLVJCcPpnAiA5sqHSaPvPPWiN79cILI18x0kqUu6HPH+ZgdZux
         iIQQ==
X-Forwarded-Encrypted: i=1; AHgh+RosFt9dE5940fOUSxkS4s+QtR/MjSSMLj/rFrOJnwWYzWYgtU1XsAA8V6WEtPhZtneCbAEeS1zQIs5DwA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzeyG11Q/E4+DaxxAgRPSTXEt3bgWBU9VrvwMvvclZwqAWwJuCX
	pugciCypDtSDMYWcgU9Nmsbl7Ftj4gfAUiOA8iPnTs2Lh3VcrItkA81wue3ZwKStVS8=
X-Gm-Gg: AR+sD13q/A9dzBxRvtYxuM4TdZ8L8LIOMTgGJxRs7IYSSeiaw6q1mDRrHMB5Ku7wKlp
	0Vx9EVWDp7SnnjX4tZN3wTxy2TBtPR7DAI6p8G7di1EWz4GVnasDsDrH/CEdxCvuCytyj+GTb00
	AsaNu7tGaBPBP/7YNH318rKIF2rXw+XFKigV8MlM5M4ed+giVso23jwFDhMkVsZgqk6ceUKpNPm
	ub9DYTSlTbD/sRnS+mAYjDbITFbkAD/hGRWVmMMuUkZ4kF36A4nPKlMdLC5x7YS4/xrBSdXSoJT
	y7NgS9OmrlZHSWIiJ1MJOa4+9onk0bqFKQFSGxCyN0qNkjYb1J/6ONKJirGDeDlSB2yUPEc6MEM
	kbwkmKBuK38FvDnMmHaTSCxXWvqYI9yizfZERvO8MQFPvNrJOi10hZ1WsbFSgAEqGrXGGNBvLsu
	iH0ijU2agb+nuFOt1lSXYH0f6lFDMQLlKElDIMdl1hlH/y0Pk+l+CczM8HcUy7aw==
X-Received: by 2002:a05:600c:628c:b0:499:87f3:a2a3 with SMTP id 5b1f17b1804b1-49987f3a33emr537700105e9.15.1787039511205;
        Tue, 18 Aug 2026 00:51:51 -0700 (PDT)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482a5b77f41sm9298971f8f.27.2026.08.18.00.51.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Aug 2026 00:51:50 -0700 (PDT)
Date: Tue, 18 Aug 2026 09:51:48 +0200
From: Petr Mladek <pmladek@suse.com>
To: Jon Hunter <jonathanh@nvidia.com>
Cc: John Ogness <john.ogness@linutronix.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Andy Shevchenko <andy.shevchenko@gmail.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
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
Message-ID: <aoQPFC7d8mSuNZMh@pathway.suse.cz>
References: <20260729120439.281252-1-john.ogness@linutronix.de>
 <20260729120439.281252-2-john.ogness@linutronix.de>
 <f3757a75-0ba1-4558-bf57-f19ab7e59a4c@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f3757a75-0ba1-4558-bf57-f19ab7e59a4c@nvidia.com>

On Tue 2026-08-18 07:25:13, Jon Hunter wrote:
> Hi John,
> 
> On 29/07/2026 13:04, John Ogness wrote:
> > Implement the necessary callbacks to switch the 8250 console driver
> > to perform as an nbcon console.
> > 
> > Add implementations for the nbcon console callbacks:
> > 
> >    ->write_atomic()
> >    ->write_thread()
> >    ->device_lock()
> >    ->device_unlock()
> > 
> > and add CON_NBCON to the initial @flags.
> > 
> > All hardware access in the callbacks is within unsafe sections.
> > The ->write_atomic() and ->write_thread() callbacks allow safe
> > handover/takeover per byte and add a preceding newline if they
> > take over from another context mid-line.
> > 
> > For the ->write_atomic() callback, a new irq_work is used to defer
> > modem control since it may be called from a context that does not
> > allow waking up tasks. During suspend/resume the irq_work is not
> > used as this has been shown to cause suspend problems for some
> > hardware. Upon resume, any pending modem control is performed.
> > 
> > Note: A new __serial8250_clear_IER() is introduced for direct
> > clearing of UART_IER during console writing (which will not be
> > holding the port lock for atomic printing or KDB/KGDB). This
> > allows restoring a lockdep check to serial8250_clear_IER() in
> > a follow-up commit.
> > 
> > Signed-off-by: John Ogness <john.ogness@linutronix.de>
> 
> I accidently responded to V9, but responding here with the same report for
> completeness.
> 
> This change is causing a boot regression for our Tegra20 and Tegra30
> platforms. Reverting this on top of -next fixes the issue. Previously with
> V5 I did not see a boot issue only an issue in suspend. So far I have not
> had chance to dig any further.

Interesting.

Another clue, mentioned in the v9 thread [1], is that the boot
regression does not happen with v11 when "keep_bootcon" option
is used.

The "keep_bootcon" option causes that the boot console driver stays
registered even when the full featured driver gets registered
later.

The most important effect is that the printk kthreads can't
be used as long as any boot console driver is registered.
All drivers need to be called in the legacy loop in this case.
There are two reasons for this:

  1. Boot console drivers are synchronized only by
     the legacy console_lock (console_sem). port->lock
     is available only for the full featured driver.

  2. There is no easy way to match boot console and
     full featured console drivers working on the same
     HW.

So, the regression seems to happen when the printk kthreads
start being used.

Jon, could you please share the full log when "keep_bootcon"
is used?

[1] https://lore.kernel.org/all/20260724103654.133654-1-john.ogness@linutronix.de/

Best Regards,
Petr
