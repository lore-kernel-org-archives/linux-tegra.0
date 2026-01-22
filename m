Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26C6D3A783F
	for <linux-tegra@vger.kernel.org>; Thu, 22 Jan 2026 23:31:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769124673; cv=none; b=JrWiODVj3n7bu5JdlAZv18GfPPXKFWpBQd5vDsiHonlbEAKhmUXM8GhwVX6ZD/l2ORlm86v59a7psQYj9hj6up+E9VnUuNSiIuOycU/fBKej22IcXrHUtjfcTmI41cg2JvmRmDn0bPI4WibxXOOYZcsGMK9WvcFjJFgQYO6yJ2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769124673; c=relaxed/simple;
	bh=5WAixKHmsIvyis6YTtmuBV+gDtWyY2eKW0sd3IU1DQA=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=n+IOt0fXawyhc8Upc45XnA2t8QDJxdnD0EwVTFbH42IIiGDAuxpYZsiHCH4jwAmGeTus/1qs6FBsxmqm/cMcT5qvIWTn3qVtJ2UW9wmaG4YbKKuUB92HsCD+BHSV4LlfCTGFz6UyhxAPYwU3dhLXx7M0KO3C6ElMc6CokYhu1FQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=PVQmR0h4; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=L2AZuhCN; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="PVQmR0h4";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="L2AZuhCN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1769124666;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=q3W7z6eAd14Mjwit6iOIu08lrtGt6c3kP9td1eyShu8=;
	b=PVQmR0h4Zu0FBbqiY0z+e9RrOLpdN8qVtSLXd4Jh+3ZY7B0xGL4Rob8qKHSCWLisaR+/Ui
	EcOuxkjjEDsI9Dpkm/IH66f6C9runfvItV+c7NoG48Ulj0WZLPPGjhES8dEr+m4sGgpjhi
	J05Ed7qtotZ3df0Iv4KpF3CTNju6RZI=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-451-XU-4NIOjN1GFYGZ6lV0pvg-1; Thu, 22 Jan 2026 18:31:05 -0500
X-MC-Unique: XU-4NIOjN1GFYGZ6lV0pvg-1
X-Mimecast-MFC-AGG-ID: XU-4NIOjN1GFYGZ6lV0pvg_1769124665
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c52fd47227so253519185a.2
        for <linux-tegra@vger.kernel.org>; Thu, 22 Jan 2026 15:31:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1769124664; x=1769729464; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=q3W7z6eAd14Mjwit6iOIu08lrtGt6c3kP9td1eyShu8=;
        b=L2AZuhCN/ZfmTliVlYk3OEdq6zx6gMswdnM6+kLyOSYVMQIjipJDBwan1RBJkPTZnh
         hlWQOGwyyj4H36rnlwBn4ShUWYOfDMP+Ln/Azg6023Dtm3puqOKBD66ZBWM64S7iO0Nh
         wNW+sngaPeokbuaC9z7SXHMgkDicw8xS5yuiwgaD/Usg0MStT1+O/RleRv7/lg2eseb8
         zyrI/KQtW14XXEqwvoN6FviA+ywfz28OUjWFhlm3NNlFXHzfih2ksCwJ1s09vx3dEgkW
         d4C3KMrUGNgX3HQR8adoVYMB7YLYKaZPsAjBrsuMXwCJROefihh7ifE9kneVuwh0wwWC
         JIAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769124664; x=1769729464;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=q3W7z6eAd14Mjwit6iOIu08lrtGt6c3kP9td1eyShu8=;
        b=h80HH7oLHeEhMZE0gEDBlrUtSfmvbVnJV78GAsyfK/SNesZt4gPfIrH4YXWZa/bu0p
         78inGL/Q2JoJX7Q9aprwCDSmf2XRnYbOJo7T9nG/9PrVy7sb7e4JMWEgHj6XsKGmyuvZ
         vTIt4P76843RGf+gKsGNSVFkS6ooBL/6y1IsinLL9XF6t1phoaIKMilZkIs1GNH1XpV3
         xIZaQ9Mj8umrlciXRdp2C60RxmJgzHvs2ePK/DQ5EbJyV4y2XiyIjmaZ4en3+qmNUT67
         ZSltpCbXksNdP2aUEI0d5/fdibM/FImQ7ByJJcQfiOoPqVQkEogcVfYTDT231lbjrV/V
         lmag==
X-Forwarded-Encrypted: i=1; AJvYcCXDRuQzRxI7SkTMadqqZAiEGV8BrLF4DFxbH1gswYnEGi67O6/qCMRQzyMS0L9BqOlM6rg4yjXIRhwLWQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxj0QzdArn8TfEhRVHW6VjWHlod3/l3ZW5Opcv6zYEtIMjD09sh
	7kq7wpFCRHj01iBhqhm+WiWrSQ3o/5LckF67K6zgHSTLD36vQhXLxsIYHLHnSdB+YJEAXL4QQ5+
	1Dqz4Yk7IMxR7sbnGXP0e5p170zGwGX6FGWcG5OeMHnE3Nf+nNa5NS8PQnoStRhao
X-Gm-Gg: AZuq6aLhcbc5Q0x6vrlyUlUWekuVpOObGZQqgrPWpwKQ1oPeFcQfCVzuYclGRC5ZRrF
	Hb/Qi4x9eqQNQkeSdD1+pmmDCft46jIadO77HGq4z2TwKdVCXEu2ZVYj6QhnoMNGcpidFvMp1UX
	DZl/pAI+Z/ODjy0hpp8cyXIzTGLBNem3KLmHsN1Yt7nbjuKAYeRwDWfDWjdGYZxvjXRke/c0FBr
	a0CXgTAMi00NC/tQFPjUUjuebVcAQIkZPWqQLAXSqXuyCfsuKPRGTWXHUGZjndYiZCN7dl6XP6m
	KNKDzhdmbHTLf393vNpCiMcuR+aGcoMXGd5SwvXusUgqCiFitTdjtmADY4w/zej78HY1Rz8JER+
	lvdUy2q/iIGaLOfvLpNbSSPiPnaWxSsg+CIIENZOgbfBtPdUg76J+cL2S39Nae61JnNA4l8/eaL
	fXQg==
X-Received: by 2002:a05:620a:17a8:b0:8c5:390b:6eb4 with SMTP id af79cd13be357-8c6e2e2df7cmr161054385a.42.1769124664511;
        Thu, 22 Jan 2026 15:31:04 -0800 (PST)
X-Received: by 2002:a05:620a:17a8:b0:8c5:390b:6eb4 with SMTP id af79cd13be357-8c6e2e2df7cmr161050285a.42.1769124664062;
        Thu, 22 Jan 2026 15:31:04 -0800 (PST)
Received: from thinkpad-p1.localdomain (pool-174-112-193-187.cpe.net.cable.rogers.com. [174.112.193.187])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c6e37c8fa6sm45616385a.4.2026.01.22.15.31.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jan 2026 15:31:03 -0800 (PST)
Message-ID: <96c9d483f67be02fa1dba736fea465216d0c3269.camel@redhat.com>
Subject: Re: [PATCH v3 3/3] PCI: dwc: Enable MSI affinity support
From: Radu Rendec <rrendec@redhat.com>
To: Jon Hunter <jonathanh@nvidia.com>, Thomas Gleixner <tglx@linutronix.de>,
  Manivannan Sadhasivam	 <mani@kernel.org>
Cc: Daniel Tsai <danielsftsai@google.com>, Marek =?ISO-8859-1?Q?Beh=FAn?=	
 <kabel@kernel.org>, Krishna Chaitanya Chundru <quic_krichai@quicinc.com>, 
 Bjorn Helgaas <bhelgaas@google.com>, Rob Herring <robh@kernel.org>,
 Krzysztof =?UTF-8?Q?Wilczy=C5=84ski?=	 <kwilczynski@kernel.org>, Lorenzo
 Pieralisi <lpieralisi@kernel.org>, Jingoo Han	 <jingoohan1@gmail.com>,
 Brian Masney <bmasney@redhat.com>, Eric Chanudet	 <echanude@redhat.com>,
 Alessandro Carminati <acarmina@redhat.com>, Jared Kangas	
 <jkangas@redhat.com>, linux-pci@vger.kernel.org,
 linux-kernel@vger.kernel.org,  "linux-tegra@vger.kernel.org"	
 <linux-tegra@vger.kernel.org>
Date: Thu, 22 Jan 2026 18:31:01 -0500
In-Reply-To: <cfe44924-3419-4f31-8ab3-87b769d21a5b@nvidia.com>
References: <20251128212055.1409093-1-rrendec@redhat.com>
	 <20251128212055.1409093-4-rrendec@redhat.com>
	 <4e5b349c-6599-4871-9e3b-e10352ae0ca0@nvidia.com>
	 <a8d841e870d6dbbabef7eadb774f2a58a96c57c7.camel@redhat.com>
	 <cfe44924-3419-4f31-8ab3-87b769d21a5b@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2 (3.56.2-2.fc42) 
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi Jon,

On Wed, 2026-01-21 at 14:00 +0000, Jon Hunter wrote:
>=20
> On 20/01/2026 22:30, Radu Rendec wrote:
>=20
> ...
>=20
> > > So it looks like it is hanging when disabling the non-boot CPUs. So f=
ar
> > > it only appears to happen on Tegra194.
> > >=20
> > > Let me know if you have any suggestions.
> >=20
> > Ouch. I'm afraid this is going to be much harder to figure out than the
> > previous one, especially since I can't get access easily to a board to
> > test on. I will try to reserve a board and reproduce the bug.
> >=20
> > Meanwhile, if you (or someone else in your team) can spare a few cycles=
,
> > could you please try to reproduce the bug again with the debug patch
> > below applied, and a few other changes:
> > =C2=A0 * enable debug messages in kernel/irq/cpuhotplug.c;
> > =C2=A0 * save the contents of /proc/interrupts to a file before suspend=
ing;
> > =C2=A0 * add "no_console_suspend" to the kernel command line (although =
it
> > =C2=A0=C2=A0=C2=A0 looks like you already have it).
> >=20
> > It will be much more verbose during suspend but hopefully we can at
> > least figure out how far along it goes and how it's related to the MSI
> > affinity configuration.
>=20
>=20
> Thanks. I have dumped the boot log with the prints here:
>=20
> https://pastebin.com/G8c2ssdt
>=20
> And the dump of /proc/interrupts here:
>=20
> https://pastebin.com/Wqzxw3r6
>=20
> Looks like the last thing I see entering suspend is ...
>=20
> =C2=A0 irq_chip_redirect_set_affinity: irq 162 mask 0x7f
>=20
> That appears to be a PCIe interrupt. Let me know if there are more tests=
=20
> I can run.

Thanks very much for running the test and for the logs. The good news
is good ol' printk debugging seems to be working, and the last message
in the log is indeed related to dw-pci irq affinity control, which is
what the patch touches. So we're on to something. The bad news is I
can't yet figure out what's wrong.

The CPUs are taken offline one by one, starting with CPU 7. The code in
question runs on the dying CPU, and with hardware interrupts disabled
on all CPUs. The (simplified) call stack looks like this:

irq_migrate_all_off_this_cpu
  for_each_active_irq
    migrate_one_irq
      irq_do_set_affinity
        irq_chip_redirect_set_affinity (via chip->irq_set_affinity)

The debug patch I gave you adds:
 * a printk to irq_chip_redirect_set_affinity (which is very small)
 * a printk at the beginning of migrate_one_irq

Also, the call to irq_do_set_affinity is almost the last thing that
happens in migrate_one_irq, and that for_each_active_irq loop is quite
small too. So, there isn't much happening between the printk in
irq_chip_redirect_set_affinity for the msi irq (which we do see in the
log) and the printk in migrate_one_irq for the next irq (which we don't
see).

My first thought is to add more printk's between those two and narrow
down the spot where it gets stuck.

I think the fastest way to debug it is if I can test myself. I tried to
reproduce the issue on a Jetson AGX Orin, and I couldn't. By the way,
how often does it hang? e.g., out of say 10 suspend attempts, how many
fail?

I do have access to a Jetson Xavier NX (in theory) but it looks like
there's a lab issue with that board, which hopefully gets sorted out
tomorrow. If I can't get a hold of that board (or can't reproduce the
problem on it), I may ask you to try a few other things. In any case,
I'll update this thread again either tomorrow or (more likely) early
next week.

--=20
Thanks,
Radu

