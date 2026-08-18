Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88B373C10B6
	for <linux-tegra@vger.kernel.org>; Tue, 18 Aug 2026 09:24:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787045060; cv=none; b=C0m2AcaZxFhw+X28PAgevoiPrmjTuXbk6wQVITHHDTf8QzOZdSu10rE39XLP9w3LX3rtc2j+7HDHfBkoD5N8mbfwco5jFJrwba352bfoktnJy+JImT3ZRAvCx2hek9fp1u2tyuLtsHE/R+zhqLzEZUnO1QkqqvrWQzbU/TJu8DI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787045060; c=relaxed/simple;
	bh=dz/A7DBzylEAGSyG7gTxIuzN2An790Rz7aBMa8I6z4Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rcj2AwbOZM6hB/Wy3MPI7M9xUNfS6DX0oDPG2BX31t1gAFuY/kGfVXWiJHSxgyr0QdOU86jLTo6F6+CVzviGr/SKRnmtBOqNiCuLZ6wsNBNXSvB4uPzvJv0YVzVifzDOr/6wTwjO0r5gXSEtOoauSwm0AC/nyz0d27jGc/WA/kE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=K0UuXYuY; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="K0UuXYuY"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-496bb7cdf51so54382765e9.2
        for <linux-tegra@vger.kernel.org>; Tue, 18 Aug 2026 02:24:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1787045057; x=1787649857; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZN8kT67g9CXgl7ks6fp9tbVBSbW9FaLs/GYJTjLUZnE=;
        b=K0UuXYuYfDm3HoWkjPmKXIrjhrv16Dw/fZRBttbrJgzqVKiauxoO1UaFbREpcyuR5E
         u8R0bjq/a0ugrl+3Hfj7tP2iulJpX26OU4vgSl0FBNjWxcozrOH88rcTd1/6zXODcc3r
         Ebk1qy6pvVuOp/Fg/ub32f9YCF3zNlex2ndFXvIklaEBzg8o+98k2osmJIzTIaAuF6eD
         JoTVMRmhgeSk7v8SJyBgCiesuYOY2okAwsBOCNmRkoY0Tjfm/6I4FXP/pzpni1TASD3b
         W7qRVSJ2SFqS8QNMHm6PINJPFBXwJ3BJwJRPwaNfFGahwPG6CSyBfbfpThPkr08h752J
         hnLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787045057; x=1787649857;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZN8kT67g9CXgl7ks6fp9tbVBSbW9FaLs/GYJTjLUZnE=;
        b=cm4RQ56oAdy8xXtULqMHyixNIar5XysvD3MKl7o7BS36y1J+dgxyYWPFy62oa/gGSs
         Xl2Y6K6yXXeyvDRBFYUdP1k2hr7iPWCjkDOb8pfz7RLzKy0SvDOkoiX7OYEYlQLG5JV0
         0iBvm+BpnQdP6wPmTPDl5N8GAbvmV5fW4HfblzftLaj+Hxq5ukwGr9nBfgJ6PyRqNQky
         nDa1YGRiNLyyacw100PgXmqMdE28tzUhIx3067OaonozskJ2klDvOfpxCJY62M3taVvb
         xlGEdpLpXEwfsAX3p19i+8b8OznLvi7FBY4fpH63wnR+EnBvY8xkZwPULjFm6Q144Uwa
         ODNw==
X-Forwarded-Encrypted: i=1; AHgh+RqcVXYjhb8P/o1py7/zkoZJOUdgtrbRdHhVt4DGkOfxv2+DLFi169qjNk0QexLZRLVXvNa///Eoa9IVsA==@vger.kernel.org
X-Gm-Message-State: AOJu0YypuFL5SRyLcBo5xfBTNmMBZ+q+Wu8nhaITvHZNnc7AkUxj1SY4
	Bg8bUYtBgVdUHxPwZqxVJjz5IyYNIcAZ5AM/nWwoFKm09LtTAbo4r79C3fUlO2cin9c=
X-Gm-Gg: AR+sD12q7sdc8vhVBpunzemc3XKWCk2wllUtwZgajx4mmLB1qVV4TttaWWj/QAj+mV5
	G7h+gGRpL5INu3fSDnMOSLvjgwcS2vrCikBJ27v+pabqZjMeZGwTk+jggwmtOQUoWOxS6JhZu30
	BoIR75nWTC468UZUE4/BerSdaMZGtBSp7bVLWNH6j1CD/IKOT7QT1JGCzdillp+Ltb1OebC6QEv
	FB/3Ki5By/EZq8WV+bL2kYG6AGN92Gd2N6351gESYFcV+fLd/2Wd/vGXvznPn7AcE4AYKgmnGGS
	/lWQ0ZonL+ZNFmRb4jfO+95NWLqkC3zDPTmHvz3v6CaesMZVLvnRuHdtGOMN5wwxpYtHHI1knMD
	NQ3s0dO3D2zeF8RV/z/XzYDlUIhHGK2HAtEz+Kx+/IcZJdY2TggEbNeYC3JpA8AzdxNB7gpueLE
	z5cBYAr1suIlNhE7kdoKVAqiAF4gtFzqEkVf7ufiAjTi8fMqbEVceC92rdV6O96S5Zetn7ZtEQI
	g==
X-Received: by 2002:a05:600c:1d0c:b0:493:f140:c3fb with SMTP id 5b1f17b1804b1-4999fb3953emr105169815e9.7.1787045056732;
        Tue, 18 Aug 2026 02:24:16 -0700 (PDT)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49987b3a6ddsm26146085e9.1.2026.08.18.02.24.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Aug 2026 02:24:16 -0700 (PDT)
Date: Tue, 18 Aug 2026 11:24:13 +0200
From: Petr Mladek <pmladek@suse.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Jon Hunter <jonathanh@nvidia.com>,
	John Ogness <john.ogness@linutronix.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Andy Shevchenko <andy.shevchenko@gmail.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	linux-kernel@vger.kernel.org,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Hugo Villeneuve <hvilleneuve@dimonoff.com>,
	Fushuai Wang <wangfushuai@baidu.com>, Kees Cook <kees@kernel.org>,
	Stepan Ionichev <sozdayvek@gmail.com>, linux-serial@vger.kernel.org,
	"linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
Subject: Re: [PATCH tty v9 1/2] serial: 8250: Switch to nbcon console, take 2
Message-ID: <aoQkvZc6Tc5rzlzJ@pathway.suse.cz>
References: <20260724103654.133654-1-john.ogness@linutronix.de>
 <20260724103654.133654-2-john.ogness@linutronix.de>
 <3023d7d7-c8ab-48e7-a0e4-e18cc4ea0b9a@nvidia.com>
 <aoP4Wzji7w1XTTpI@ashevche-desk.local>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aoP4Wzji7w1XTTpI@ashevche-desk.local>

On Tue 2026-08-18 09:14:51, Andy Shevchenko wrote:
> On Tue, Aug 18, 2026 at 06:32:12AM +0100, Jon Hunter wrote:
> > On 24/07/2026 11:36, John Ogness wrote:
> > > Implement the necessary callbacks to switch the 8250 console driver
> > > to perform as an nbcon console.
> > > 
> > > Add implementations for the nbcon console callbacks:
> > > 
> > >    ->write_atomic()
> > >    ->write_thread()
> > >    ->device_lock()
> > >    ->device_unlock()
> > > 
> > > and add CON_NBCON to the initial @flags.
> > > 
> > > All hardware access in the callbacks is within unsafe sections.
> > > The ->write_atomic() and ->write_thread() callbacks allow safe
> > > handover/takeover per byte and add a preceding newline if they
> > > take over from another context mid-line.
> > > 
> > > For the ->write_atomic() callback, a new irq_work is used to defer
> > > modem control since it may be called from a context that does not
> > > allow waking up tasks. During suspend/resume the irq_work is not
> > > used as this has been shown to cause suspend problems for some
> > > hardware. Upon resume, any pending modem control is performed.
> > > 
> > > Note: A new __serial8250_clear_IER() is introduced for direct
> > > clearing of UART_IER during console writing (which will not be
> > > holding the port lock for atomic printing or KDB/KGDB). This
> > > allows restoring a lockdep check to serial8250_clear_IER() in
> > > a follow-up commit.
> > 
> > This change is causing a boot regression for our Tegra20 and Tegra30
> > platforms. Reverting this on top of -next fixes the issue. Previously with
> > V5 I did not see a boot issue only an issue in suspend.
> 
> Wasn't v11 applied and not v9?
> 
> > So far the only
> > interesting thing I have observed is that if I add 'keep_bootcon' to the
> > command line the board does boot.
> 
> keep_bootcon defers driver taking over, that's why it works, it uses just
> simple primitives instead of full-featured driver.

It is the other way. The full-featured driver is used even with
keep_bootcon. The option causes that the simple boot driver stays
registered in parallel. You probably see duplicated lines because
of this.

Anyway, the most important effect of "keep_bootcon" is that
boot consoles prevent using the printk kthreads. Even the nbcon
consoles need to be handled in the legacy loop.

There reason is a combination of two things:

  1. Boot consoles are synchronized only using the legacy
     console_lock (console_sem). port->lock does not exist
     at boot time.

  2. There is no simple way how to match boot console drivers
     with the full-featured drivers. They use a different interface
     to access the same HW.

As a result, even the full featured console drivers have to rely
on the legacy console_lock as long as any boot console is used.

The regression seems to be when the uart 8250 port become handled
by the printk kthread.

Best Regards,
Petr

PS: I am not sure whether to continue the discussion here.
    It might be better to move it to v11. see
    https://lore.kernel.org/all/20260729120439.281252-1-john.ogness@linutronix.de/
    I am going to reply there as well.
