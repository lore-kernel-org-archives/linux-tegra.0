Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 685D620FAB7
	for <linux-tegra@vger.kernel.org>; Thu, 23 Jan 2025 14:56:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737644213; cv=none; b=t0XkYpQjdhLh+UauvZ46Eu1Rf2FXuV63/RwcsGydbfeIUMAELUE5iYp9JJ/B10qN5+0jUqnRj+2t2RA+JKbCWP4bDIAjwM0nzTEbJ+1tWtaf7G8vt6pDq33Jl8VqcrLd6MYjAtYEpcNT1xrHmCN7MeWqCEFA/hoI8wImjDMBEWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737644213; c=relaxed/simple;
	bh=mPeEww2aDh9Lfa6WrlRElcyeoSBGRlDAKqVrA7ZgLtA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PeEXSMP6xqG77GeVQN5yypHRe8cjF+Q8TvulnJTiztwOkmQj+mlifc9S6JEw6CMOpqIJOz1KoCM+k5RthauzAez/w1cJ89kvOqkRF+vv9S/DPNmSAnT8wDfDAZySTP+NXyXriIGpnfNgZMvTltUUzbCI0U0E6RmMM+gXvCodIUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bDj46t/+; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bDj46t/+"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-43634b570c1so7435475e9.0
        for <linux-tegra@vger.kernel.org>; Thu, 23 Jan 2025 06:56:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737644210; x=1738249010; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/kKlkfSIKri5TdD1W5+gm1mkbdQr1Quy5Us8nYAfvIk=;
        b=bDj46t/+MzyPmCEplmnYc1hBzwLmM4dXE39lbvg+ZP3nJ5iMlqn2YKY42wKCeOXf0Y
         tqMfeOry+0DvADpSLtuAoHmmelwJcSiwI+uB/vTDOZ4Fc5Yu1kYSvT3vpL+8smcnumWj
         71ojhL2hHHBYXEVdySxtUHNlUZcupfixO7s8rV0oQ3RGDuXu3MXgR+F7HyEMJP1WBq6B
         M+NK0s80FWGrgigotZlwxiYtqFhZsIFUut0IGLAy6hspf9RYQ9ZQxVVxGRMnCSd3BNUF
         uXs+CPm+vMOGh+0pscAZ8YTSpOoN171BWx9cPN9t3rpjj7LjQSg1kTv3VBwOkomsIMAU
         g1Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737644210; x=1738249010;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/kKlkfSIKri5TdD1W5+gm1mkbdQr1Quy5Us8nYAfvIk=;
        b=Ei6ULA+fbuuOfWVxFqSmvTOuF33Es9Hs82nZWA6AqPHf8r8efXs8FuZ3bnpyMvoa/K
         86mWVu8q8x39bkexlEIjB227Hv6QPHSKIueGXal2rqr0Jw0/n78sXGpIzHEqoi74jM1F
         awNgNxR6rwIauSukLsN8OHVLYbYeViTMbhGQIa1iPcFbX9OBinY2xq0CG3FnV4lGSVOk
         CZgEM5Sx77Ll1G6haRVT5H7M6W8DAjZ4scFuxBfSmRUEJH7AnrOIZVv6NF71kfYO7biY
         zBK02SvW9z5D0FhpeGyO/Dt7nqmrk5OO49SIsy/073zPeP0ohLsWUEyVc8VDlGqgTYbZ
         sB9g==
X-Forwarded-Encrypted: i=1; AJvYcCVsVmMKrO0TlzCMbS5Pje8AWawjIY3HQtnXQenv2F7NMSG9IyC6rpgD71hZHmly5AzNe3i9DBvk7j28BA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yybrqpic43ZC1VT8enCBMaz+aqKyOWhXvxEJKUHscs+zsxt5qNZ
	tU+XAnziSKxKGCTd7OnRLIsq+nOpGqONzG6yjbHBItxhBSa98S2xw6zFKEVXjuoj1SWJfPQgm9E
	l
X-Gm-Gg: ASbGncsRNxf4uaS1pO9Ik/BMdYUNlCKpOTUU0/vXNxDu2w+EHps1MPGR3cxvDULrN7v
	Q7S0r8gEu2K9AFVW14B4fjRp5M1gByBqoPa7cBTjCA50ZVoVsvnw0a0fcLD17MZ2Jy2VYhlmw+y
	fmlGA82LzirLp7qT5PLKnBNwkVrg7wa3IjA2spa7IoT1T2jrWGVqqvO5BCu9z327N82NCGhtRlG
	d9Pw/eLPsFbFw5Anxo/yROhY56E8gLeSQRTXsFVC4AOJfrHb4edcFvaaCewwBXFZAKjCKmDs4lO
	QsvRTMye/H5L5nA9aTtp
X-Google-Smtp-Source: AGHT+IGC4rqbvYh8QmcGnHxQ03UDMkvyOOl3/dYk8eGkxND7AQR2Fl7VjdeNq+62ZUDQSmwUUR/CIA==
X-Received: by 2002:a05:600c:4713:b0:434:fb65:ebbb with SMTP id 5b1f17b1804b1-438913f1654mr257750195e9.17.1737644209563;
        Thu, 23 Jan 2025 06:56:49 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438b318c004sm65137935e9.4.2025.01.23.06.56.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jan 2025 06:56:48 -0800 (PST)
Date: Thu, 23 Jan 2025 17:56:44 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Jon Hunter <jonathanh@nvidia.com>
Cc: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
	=?utf-8?B?6IOh6L+e5Yuk?= <hulianqin@vivo.com>,
	Prashanth K <quic_prashk@quicinc.com>,
	"mwalle@kernel.org" <mwalle@kernel.org>,
	"quic_jjohnson@quicinc.com" <quic_jjohnson@quicinc.com>,
	David Brownell <dbrownell@users.sourceforge.net>,
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"opensource.kernel" <opensource.kernel@vivo.com>,
	"linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
	Brad Griffis <bgriffis@nvidia.com>,
	Harshit Mogalapalli <harshit.m.mogalapalli@gmail.com>
Subject: Re: [PATCH v3] usb: gadget: u_serial: Disable ep before setting port
 to null to fix the crash caused by port being null
Message-ID: <0fa6c6db-fd75-4a09-b4fa-d6a98bb8afac@stanley.mountain>
References: <TYUPR06MB621733B5AC690DBDF80A0DCCD2042@TYUPR06MB6217.apcprd06.prod.outlook.com>
 <1037c1ad-9230-4181-b9c3-167dbaa47644@nvidia.com>
 <2025011633-cavity-earthworm-2b5e@gregkh>
 <3d9db530-a0b7-4f18-9ad4-233356dfe68c@nvidia.com>
 <e3a457d6-092b-4b7a-9032-50daddab6f1f@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e3a457d6-092b-4b7a-9032-50daddab6f1f@nvidia.com>

On Tue, Jan 21, 2025 at 12:19:37PM +0000, Jon Hunter wrote:
> > > > [   59.918177] tegra-xudc 3550000.usb: ep 3 disabled
> > > > [   59.923097] tegra-xudc 3550000.usb: ep 2 disabled
> > > > [   59.927955] tegra-xudc 3550000.usb: ep 5 disabled
> > > > [   80.911432] rcu: INFO: rcu_preempt self-detected stall on CPU
> > > > [   80.917354] rcu:     6-....: (5248 ticks this GP)
> > > > idle=ec24/1/0x4000000000000000 softirq=1213/1213 fqs=2623
> > > > [   80.927146] rcu:     (t=5253 jiffies g=3781 q=1490 ncpus=12)
> > > > [   80.932704] Sending NMI from CPU 6 to CPUs 2:
> > > > [   90.981555] CPU: 6 UID: 0 PID: 18 Comm: rcu_exp_gp_kthr Not
> > > > tainted 6.13.0-rc7-00043-g619f0b6fad52 #1
> > > > [   90.981558] Hardware name: NVIDIA NVIDIA Jetson AGX Orin
> > > > Developer Kit/Jetson, BIOS 00.0.0-dev-main_92e5ae_88fd1_296de
> > > > 12/16/2024
> > > > [   90.981559] pstate: 80400009 (Nzcv daif +PAN -UAO -TCO -DIT
> > > > -SSBS BTYPE=--)
> > > > [   90.981562] pc : smp_call_function_single+0xdc/0x1a0
> > > > [   90.981574] lr : __sync_rcu_exp_select_node_cpus+0x228/0x3c0
> > > > [   90.981578] sp : ffff800082eb3cd0
> > > > [   90.981579] x29: ffff800082eb3cd0 x28: 0000000000000010 x27:
> > > > ffff0000802933c0
> > > > [   90.981582] x26: ffff0007a8a1d700 x25: ffff800082895500 x24:
> > > > ffff800080132018
> > > > [   90.981584] x23: 0000000000000014 x22: ffff800081fb7700 x21:
> > > > ffff80008280d970
> > > > [   90.981586] x20: 0000000000000feb x19: ffff800082eb3d00 x18:
> > > > 0000000000000000
> > > > [   90.981588] x17: 0000000000000000 x16: 0000000000000000 x15:
> > > > 0000000000000000
> > > > [   90.981590] x14: ffff000080293440 x13: 0000000000000001 x12:
> > > > 0000000000000000
> > > > [   90.981591] x11: ffff800081fb2388 x10: ffff0000802933c0 x9 :
> > > > 0000000000000001
> > > > [   90.981593] x8 : 0000000000000040 x7 : 0000000000017068 x6 :
> > > > ffff800080132018
> > > > [   90.981595] x5 : 0000000000000000 x4 : ffff0007a8a4f9c8 x3 :
> > > > 0000000000000001
> > > > [   90.981597] x2 : 0000000000000000 x1 : ffff0007a8a4f9c0 x0 :
> > > > 0000000000000004
> > > > [   90.981599] Call trace:
> > > > [   90.981601]  smp_call_function_single+0xdc/0x1a0 (P)
> > > > [   90.981605]  __sync_rcu_exp_select_node_cpus+0x228/0x3c0
> > > > [   90.981607]  sync_rcu_exp_select_cpus+0x13c/0x2a0
> > > > [   90.981609]  wait_rcu_exp_gp+0x18/0x30
> > > > [   90.981611]  kthread_worker_fn+0xd0/0x188
> > > > [   90.981614]  kthread+0x118/0x11c
> > > > [   90.981619]  ret_from_fork+0x10/0x20
> > > > [  101.416347] sched: DL replenish lagged too much
> > > > 
> > > 
> > > Odd, you have a usb-serial gadget device in this system that is
> > > disconnecting somehow?  That oops doesn't point to anything in the usb
> > > gadget codebase, "all" we have done is move the call to shutdown the
> > > endpoints to earlier in the disconnect function.
> > 
> > Yes the board starts usb-serial and usb-ethernet gadget and on reboot
> > when tearing it down I am seeing the above. As soon as it disables the
> > tegra-xudc endpoints (as seen above) the board appears to stall.
> > 
> > > I'm glad to revert this, but it feels really odd that this is causing
> > > you an rcu stall issue.
> > 
> > Thanks. I can't say I understand it either, but I am certain it is
> > caused by this change.
> > 
> > Happy to run any tests to narrow this down a bit.
> 
> 
> I did a bit more looking at this and I see that we setup a USB gadget device
> via the configfs as described in this doc [0]. The RCU stall occurs when we
> attempt to disable the gadget on shutdown by ...
> 
>  $ echo "" > /path/to/UDC
> 
> Jon
> 
> [0] https://docs.kernel.org/usb/gadget_configfs.html

It's an RCU stall so it's probably a locking bug.  The original code
dropped the port->port_lock, called usb_ep_disable() then took the
lock again.  There must have been a reason to drop the lock although
I haven't found it yet.  The new code moved the usb_ep_disable() under
the lock.

  1431          port->suspended = false;
  1432          spin_unlock(&port->port_lock);
  1433          spin_unlock_irqrestore(&serial_port_lock, flags);
  1434  
  1435          /* disable endpoints, aborting down any active I/O */
  1436          usb_ep_disable(gser->out);
  1437          usb_ep_disable(gser->in);
  1438  
  1439          /* finally, free any unused/unusable I/O buffers */
  1440          spin_lock_irqsave(&port->port_lock, flags);
  1441          if (port->port.count == 0)
  1442                  kfifo_free(&port->port_write_buf);


It might help to try testing again with lockdep enabled.

regards,
dan carpenter
