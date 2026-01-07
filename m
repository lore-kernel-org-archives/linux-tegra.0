Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB9F1287253
	for <linux-tegra@vger.kernel.org>; Wed,  7 Jan 2026 01:13:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767748422; cv=none; b=YEZ5q/eWvfbS4hGyMEiXbMM5/MDsLeEMUsm+VQ8Q5p5NGgo41tYZKg1clFeozPLUMNGmQwzn04fpTzjiLCtKE+h9vR72l2dcRKhmMhW5q3GGIG5oOEiVmqyjlWDZysec65e/LTrU+cd227mDzonVxcQx4cMnDi8cm1Pio4TieRw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767748422; c=relaxed/simple;
	bh=Rl+RVB635jDWTyz3WbQdh8xirqGQS1j4dySJG+WcogQ=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=a0J5CmUmX+4E3gllJolwjZnvqRz1aGKGiEbXmp7K5yWoKolAq8+7sOmGax7ES4+QG8NVw54S+s+V4zaAn5ESlLg5sCo3HSTAriQy5/5VU19/u9uUfu+CTFmxBLu0pI/INwsDEbzh9KxUg82lyeAEzeQ9j1jd7S4GNEpfoecjHAI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=d3s/PvWn; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=PBdvF3+r; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="d3s/PvWn";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="PBdvF3+r"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1767748419;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jGEm6SrfIkQBXCBDJsmfWgmej6ZHwdAiFj4oBQ8yV/4=;
	b=d3s/PvWnYRUfZqeF8voDnXRR6PVW0jXlh567bj4vlzKPoU9XihP8dNJyiARvJMkAt+yxoq
	lR/ZkostmfpzbQc4zj3CCgN3T/cYsrBwA6JVOzb7wGz6l2kkrgJhbEUzOWhf1Lh5W0mQLs
	1JHnBEhZtHVq2fPBd2BY1gsaaOxMET8=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-632-dQSzNQ6EOxSKytfzXGPNow-1; Tue, 06 Jan 2026 20:13:38 -0500
X-MC-Unique: dQSzNQ6EOxSKytfzXGPNow-1
X-Mimecast-MFC-AGG-ID: dQSzNQ6EOxSKytfzXGPNow_1767748418
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4ed79dd4a47so34965891cf.3
        for <linux-tegra@vger.kernel.org>; Tue, 06 Jan 2026 17:13:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1767748418; x=1768353218; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=jGEm6SrfIkQBXCBDJsmfWgmej6ZHwdAiFj4oBQ8yV/4=;
        b=PBdvF3+rC8a6QbF17pOkEP74ZCpb0RqbvqNs6X1+S1ntZyf2QhFb1UHXSef5FNb1M4
         nUXnJrGWLocTqz5KdkdLo/0TBiwyTTffhI8hcQUGIiF0Nze1y8+jCz0T2hHhAEk6rMR1
         lCAmA09jJBIP0DZ6Boef1FooNDsmBOpjC7Uz65hoAUs6cnvn/myrw5K5dw1GAsjEjNCf
         cFR+a7Lrx/NP8PGd8MZJyb2Wi1bGimZ8fOWRK30wzI6LtAz59/AtufBIoU2mzq5f5Rdy
         UU12GV0IYSIl9QDVa3A6ivli/y+qrH9c/FHnlE7dENu6iDcIBl+G3Ay8McUeMC4W/mYS
         4Bbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767748418; x=1768353218;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jGEm6SrfIkQBXCBDJsmfWgmej6ZHwdAiFj4oBQ8yV/4=;
        b=qdYj59B37alBg1q4SG9o11zdsU88yo9UlHnM5zcrMjB02+ty1qzQ1/iRqWOt5e09iL
         UczUIf3T8ttnLldESD7kl02ivXqAAZZkH2PQj6Z5xMoM2U9i6dHFaRDc695rSzJRhAB5
         iPp7qKTKVJzOAOIiYDwxJ5DXbwseukobWx6aqWItRjMMQWuVrYPd+wo/78iniHooENWT
         6IqjiYa3eRnwcajT8Krqj1Nx8vsCF/46EAtI6kaHZki7dQpLJVrZtvqD4LSzgJCOwxYu
         ecSxBW2fF8omLEM2SbyfW9Yrpoh5NbhpCIigcB0ySmmyN6CrwVFnejO6KTA1QMqo800x
         sU7Q==
X-Forwarded-Encrypted: i=1; AJvYcCUqQDOoQJm+1ccOc7nnib041jU7LxpbgBzxID8IWVsqbtHIn7dO5jjgccDBe4Y8ByiTcKtqCWfEkrBq7g==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9bjakO6uFrEhctFK203jCf9JwtRMoQwePtP3CVrC4MnnYfoVY
	kW2dGUn9QlOi2u3zfhev3L9f6F3fv1zCuY8G3HRDNv50GH9dh9Q8D6H1zb4XTTr9pNCTJ9p3ank
	D9trNcs1g10Q/k4LhJ9RFAMjM36BcN4Gy+XuY5YZMmx/Mh+1T7cvfzeAOnstLP11s
X-Gm-Gg: AY/fxX46mxhFGcY9HVEUZcY/D+brR3sNtC4B+LHYiF6wsiosgz2/H7xYaoVYT4RPNHc
	C93UGiplVGd/UU2vBltrg2XPUf6KxT/liCAl37Tsvh5fBTHThrbQGHFkAjWFTsCnmd9ywHsFR5N
	/jGP9T6OMU1yh3TCEYtLvDjBMt58NvLaNZzirNQlV1zVSZ5uim4DrOB//IZCEQ/Xwj9lWL/xTJ4
	tXI3BDZ6Rj+leYldzzjMKeeP4XcS9Xnz54/ReoASoFFMVYuffLAiAhBsWtal61x+TvwuY4VRcEG
	DrkKWbVDgwTCWn6GPCbzfaZ0BJkL4U01256gJCwiehvtWfBQITRHf1GxxOaTZzRvqdCWbV2T8ft
	v/yjoBUT9ta6eMruFqQ+8fiVuRRZEO8pRlRwL8eYS4Ee2vSWIIqRPO7QPK8OjWUNu90sJ83GoPH
	VmDg==
X-Received: by 2002:ac8:5810:0:b0:4eb:a192:de99 with SMTP id d75a77b69052e-4ffb4ab80d3mr11772931cf.76.1767748418072;
        Tue, 06 Jan 2026 17:13:38 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHFv+apa0jRruNJjdM2l53yEuFK4YAhqutLPAPVUGPuZp1HG97C4J0qur49aGEfGm4e3uR+Xw==
X-Received: by 2002:ac8:5810:0:b0:4eb:a192:de99 with SMTP id d75a77b69052e-4ffb4ab80d3mr11772701cf.76.1767748417656;
        Tue, 06 Jan 2026 17:13:37 -0800 (PST)
Received: from thinkpad-p1.localdomain (pool-174-112-193-187.cpe.net.cable.rogers.com. [174.112.193.187])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4ffb75d7916sm566541cf.7.2026.01.06.17.13.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jan 2026 17:13:37 -0800 (PST)
Message-ID: <144a39f2d19af30961498acc11d6b7475166ccf5.camel@redhat.com>
Subject: Re: [tip: irq/msi] PCI: dwc: Enable MSI affinity support
From: Radu Rendec <rrendec@redhat.com>
To: Jon Hunter <jonathanh@nvidia.com>, linux-kernel@vger.kernel.org, 
	linux-tip-commits@vger.kernel.org
Cc: Thomas Gleixner <tglx@linutronix.de>, x86@kernel.org, 
 "linux-tegra@vger.kernel.org"
	 <linux-tegra@vger.kernel.org>
Date: Tue, 06 Jan 2026 20:13:36 -0500
In-Reply-To: <9ec6928cd4e7a599d4bbb6ac0258da8997518d3a.camel@redhat.com>
References: <20251128212055.1409093-4-rrendec@redhat.com>
		 <176583448396.510.10427292538118156779.tip-bot2@tip-bot2>
		 <44509520-f29b-4b8a-8986-5eae3e022eb7@nvidia.com>
	 <9ec6928cd4e7a599d4bbb6ac0258da8997518d3a.camel@redhat.com>
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

On Tue, 2026-01-06 at 10:07 -0500, Radu Rendec wrote:
> On Tue, 2026-01-06 at 09:53 +0000, Jon Hunter wrote:
> > On 15/12/2025 21:34, tip-bot2 for Radu Rendec wrote:
> > > The following commit has been merged into the irq/msi branch of tip:
> > >=20
> > > Commit-ID:=C2=A0=C2=A0=C2=A0=C2=A0 eaf290c404f7c39f23292e9ce83b8b5b51=
ab598a
> > > Gitweb:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 https://git.kernel.=
org/tip/eaf290c404f7c39f23292e9ce83b8b5b51ab598a
> > > Author:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Radu Rendec <rrende=
c@redhat.com>
> > > AuthorDate:=C2=A0=C2=A0=C2=A0 Fri, 28 Nov 2025 16:20:55 -05:00
> > > Committer:=C2=A0=C2=A0=C2=A0=C2=A0 Thomas Gleixner <tglx@linutronix.d=
e>
> > > CommitterDate: Mon, 15 Dec 2025 22:30:48 +01:00
> > >=20
> > > PCI: dwc: Enable MSI affinity support
> > >=20
> > > Leverage the interrupt redirection infrastructure to enable CPU affin=
ity
> > > support for MSI interrupts. Since the parent interrupt affinity canno=
t
> > > be changed, affinity control for the child interrupt (MSI) is achieve=
d
> > > by redirecting the handler to run in IRQ work context on the target C=
PU.
> > >=20
> > > This patch was originally prepared by Thomas Gleixner (see Link tag b=
elow)
> > > in a patch series that was never submitted as is, and only parts of t=
hat
> > > series have made it upstream so far.
> > >=20
> > > Originally-by: Thomas Gleixner <tglx@linutronix.de>
> > > Signed-off-by: Radu Rendec <rrendec@redhat.com>
> > > Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
> > > Link: https://lore.kernel.org/linux-pci/878qpg4o4t.ffs@tglx/
> > > Link: https://patch.msgid.link/20251128212055.1409093-4-rrendec@redha=
t.com
> >=20
> >=20
> > With next-20260105 I am observing the following warning on the Tegra194=
=20
> > Jetson AGX platform ...
> >=20
> > =C2=A0 WARNING KERN genirq: irq_chip DW-PCI-MSI-0001:01:00.0 did not up=
date
> > =C2=A0=C2=A0 eff. affinity mask of irq 171
> >=20
> > Bisect is point to this commit. This platform is using the driver=20
> > drivers/pci/controller/dwc/pcie-tegra194.c. Is there some default=20
> > affinity that we should be setting to avoid this warning?
>=20
> Before that patch, affinity control wasn't even possible for PCI MSIs
> exposed by the dw_pci drivers. Without having looked at the code yet,
> I suspect it's just because now that affinity control is enabled,
> something tries to use it.
>=20
> I don't think you should set some default affinity. By default, the PCI
> MSIs should be affine to all available CPUs, and that warning shouldn't
> happen in the first place. Let me test on Jetson AGX and see what's
> going on. I'll update the thread with my findings, hopefully later
> today.

I looked at the code and tested, and the problem is that the effective
affinity mask is not updated for interrupt redirection. The bug is not
in this patch, but the previous one in the series [1], which adds the
interrupt redirection framework.

The warning is actually triggered when the MSI is set up. This is the
top part of the relevant stack trace:
  irq_do_set_affinity+0x28c/0x300 (P)
  irq_setup_affinity+0x130/0x208
  irq_startup+0x118/0x170
  __setup_irq+0x5b0/0x6a0
  request_threaded_irq+0xb8/0x180
  devm_request_threaded_irq+0x88/0x150
  rtw_pci_probe+0x1e8/0x370 [rtw88_pci]

I don't immediately see an easy way to fix it for the generic case
because the affinity of the=C2=A0demultiplexing IRQ (the "parent" IRQ) can
change after the affinity of the demultiplexed IRQ (the "child" IRQ)
has been set up. But since dw_pcie is currently the only user of the
interrupt redirection infrastructure, and it sets up the demultiplexing
IRQ as a chained IRQ, there is no way its affinity can change other
than CPU hot(un)plug. And in this particular case, something as simple
as will work:

diff --git a/kernel/irq/chip.c b/kernel/irq/chip.c
index d5c3f6ee24cc2..036641f9534ae 100644
--- a/kernel/irq/chip.c
+++ b/kernel/irq/chip.c
@@ -1512,8 +1512,11 @@ EXPORT_SYMBOL_GPL(irq_chip_release_resources_parent)=
;
 int irq_chip_redirect_set_affinity(struct irq_data *data, const struct cpu=
mask *dest, bool force)
 {
 	struct irq_redirect *redir =3D &irq_data_to_desc(data)->redirect;
+	unsigned int target_cpu =3D cpumask_first(dest);
+
+	WRITE_ONCE(redir->target_cpu, target_cpu);
+	irq_data_update_effective_affinity(data, cpumask_of(target_cpu));
=20
-	WRITE_ONCE(redir->target_cpu, cpumask_first(dest));
 	return IRQ_SET_MASK_OK;
 }
 EXPORT_SYMBOL_GPL(irq_chip_redirect_set_affinity);

I will send this as a proper patch tomorrow, and it will fix the
immediate problem and buy some time for a more elaborate fix for the
generic case. Meanwhile, thanks a lot for finding/reporting this!

[1] https://lore.kernel.org/all/20251128212055.1409093-2-rrendec@redhat.com=
/

--=20
Best regards,
Radu

