Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2D8233E355
	for <linux-tegra@vger.kernel.org>; Tue,  6 Jan 2026 15:07:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767712044; cv=none; b=OAzXyDuIl25PgQSpYvSu+lL2tgKeXIBAW1DAr34yH9HsuEgb4WTM1XaTnzF5Gf7wy0ksZSzv0LhBqlRAJMa2TDwpgbLHNQhcAN8qkcr3RUBckEWN+6V5TJBD36xhmgrXVsUz2wSjtcBF9uqb7Hwv2tBeDsnJrNiVXlinwLr/UHI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767712044; c=relaxed/simple;
	bh=CMjxqxLw/Ci5doH1lPqdeqau4OYfeQieSlVZ2ZdxM50=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=oyX/PJDURVjy9qu6/IsLEKhUCDa+aVZQuLrsUKa6yOzfTAYbtF3CrfJH1xcgzzHFQoS6szZIG0B7xC1qje7NzQtz4PTcClwattWVY1vorfvmOwKb5dVyRkrbp5whH8CVAWjUU/dcsS4aXUh11cSQhKRkl8iM248q0Vw2ZNyEJxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=WEMqJRZ1; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=SNxRBxKz; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="WEMqJRZ1";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="SNxRBxKz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1767712038;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CMjxqxLw/Ci5doH1lPqdeqau4OYfeQieSlVZ2ZdxM50=;
	b=WEMqJRZ1LIeQxSDA7GWT/2UtlEblCgLtJWOIu8l0XSlBuhIKjZkJU0IcXCGVtqRUg2UaY4
	5JVLkA66hvVEaR5StPBEt1apKvokeT4da8Kx9ivsOXupxZX+wWZ//Z5nAxogkGoG2oFkIp
	9+QfvxOBzPIb8I4g7iSDIDiJdtHjiRM=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-576-WFymcHCTPVmziGeS6jj87w-1; Tue, 06 Jan 2026 10:07:17 -0500
X-MC-Unique: WFymcHCTPVmziGeS6jj87w-1
X-Mimecast-MFC-AGG-ID: WFymcHCTPVmziGeS6jj87w_1767712036
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8b24383b680so432958185a.0
        for <linux-tegra@vger.kernel.org>; Tue, 06 Jan 2026 07:07:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1767712036; x=1768316836; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=CMjxqxLw/Ci5doH1lPqdeqau4OYfeQieSlVZ2ZdxM50=;
        b=SNxRBxKzZao3GKZwqI2s21u2bS85MZvsZPTMiTDNw4LAnD/BUxPcY4a9cyBMDv9Oof
         LZ6mMxTawji8T5z6aIHwOxzqQo8uCXPtXcJ3X6YaQqCPv/IlLKQMhuphXQy0ziKBss8X
         S8VtWu0ICra/0lpKfBKRasxCLX1gcFC1NcApnSoLrBfiEDd+nGcyMGiMuz+LkeVidq7j
         CNepagm54ErHoUnLIwAyDRw/3iLzPfwVyhc0hFpSRX4iKN71c/pqDQhHTWZRotfZpLQc
         jz/WVwgybnFNzCYOxQE6GFguK+IDyGo32XE+fIMV+GD8RiIKnIP+THIlYKfciLw/n4Fo
         hBAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767712036; x=1768316836;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CMjxqxLw/Ci5doH1lPqdeqau4OYfeQieSlVZ2ZdxM50=;
        b=b/39dfHi7Yrcxe8LBbFHjAd96Xb0fWbSG2MM7caOROzXa3LrKFfgnvkNh7jXVGOLgY
         GZTemq3wGoyF8k/K7zQ8yDJcozk8m2drA0yeWPpV/NYctATBITFoPCw4moo5bIyvEU60
         PrF9W6DTtwlmAgsLDiiU6hxjhskqjqHaF4ZmAXPOB1R/Y0Mp5vGw2KDIm1hH5ExOaCcT
         6xlMGZadWrJRTnQ+h1iMxtEQ74wBvlHO4Q009FB4rZYxa3ZMR5hVQxCCEY4PuLr4alNL
         e7lEueGt3b6wTtYAbJwaAxBgd6iXFizHmRrgw9EWpBa5Vj+HYGo5Ug0amPx7PLuR5VES
         85cw==
X-Forwarded-Encrypted: i=1; AJvYcCUOwTIKYVYR/4bZ8Afz7PVhq1w0+Q/le8IW/xt/wHfA4cIv/kiSL7nVi9nC8cjK+Ohaat/5xqPdrQ1HVA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwuNksuzULWWjeNqYjBl6r1lwvsKrh4wrTgVCe0q0hNEJKUTXV4
	OswjFy0KztJVpMaC9bocQhX9gOeszGxl0EsYbwn3Hyu2/69y7XbwY8mLERViONN8qbqRGzrOcvX
	pNEdg8uvFOyvEYEmpPE40ail/O8A34IIFBuVYPdn07d6gwJmZ5KOTHmMVdz7KVBl5
X-Gm-Gg: AY/fxX4DChWmXxgcjFtRiaERdt9hDeS9yNBtR/iA7546Mdpspq+pUsser1kq3JFlDsJ
	j4wZHqgm5QHCeB3t7fNr5QUXSmLFqiOlqifHC/3pua37BcjHhYThOwKsPGrJPLP1YR1hwBddwW2
	2Ua7vtxDaN6/efJzGQH3vKCS3cAN4tzX7ojEz7/oW3vNenUyldeLoBdWWkG235FRr0KYUV9Bkri
	luhuQ/zu/vmlJouNc7pZUcJZotp+uibgx7hFQxOJW5uMDzOktnVLbu47yoAd/ttDidW/+ZIeo3C
	ZI/nNRz7F3MowYsgnkvR7AcYUeW7dHmX1dqvwdE+jMpcMDc9Vv2s2mV3jHQV6+ctQz2t2HgXE4w
	QGiRvNYgsj2+Gm4JqWBdppHlEJu4EJEr+DQ/uSMDOhAC6FLIEUoTOfl5P7Vy317kD8gHn1KeiTs
	26dQ==
X-Received: by 2002:a05:620a:7107:b0:8c3:528b:1b10 with SMTP id af79cd13be357-8c37ebddb4cmr380388585a.90.1767712035743;
        Tue, 06 Jan 2026 07:07:15 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFiDyi2NMxi0Q7EnkMQjTjzMEV1g2tympMDCJWpCiVD6eHjpDWXm78MFa6DFOXzNiCNQZb8pw==
X-Received: by 2002:a05:620a:7107:b0:8c3:528b:1b10 with SMTP id af79cd13be357-8c37ebddb4cmr380362385a.90.1767712033474;
        Tue, 06 Jan 2026 07:07:13 -0800 (PST)
Received: from thinkpad-p1.localdomain (pool-174-112-193-187.cpe.net.cable.rogers.com. [174.112.193.187])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c37f53129fsm180726485a.44.2026.01.06.07.07.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jan 2026 07:07:13 -0800 (PST)
Message-ID: <9ec6928cd4e7a599d4bbb6ac0258da8997518d3a.camel@redhat.com>
Subject: Re: [tip: irq/msi] PCI: dwc: Enable MSI affinity support
From: Radu Rendec <rrendec@redhat.com>
To: Jon Hunter <jonathanh@nvidia.com>, linux-kernel@vger.kernel.org, 
	linux-tip-commits@vger.kernel.org
Cc: Thomas Gleixner <tglx@linutronix.de>, x86@kernel.org, 
 "linux-tegra@vger.kernel.org"
	 <linux-tegra@vger.kernel.org>
Date: Tue, 06 Jan 2026 10:07:12 -0500
In-Reply-To: <44509520-f29b-4b8a-8986-5eae3e022eb7@nvidia.com>
References: <20251128212055.1409093-4-rrendec@redhat.com>
	 <176583448396.510.10427292538118156779.tip-bot2@tip-bot2>
	 <44509520-f29b-4b8a-8986-5eae3e022eb7@nvidia.com>
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

On Tue, 2026-01-06 at 09:53 +0000, Jon Hunter wrote:
> On 15/12/2025 21:34, tip-bot2 for Radu Rendec wrote:
> > The following commit has been merged into the irq/msi branch of tip:
> >=20
> > Commit-ID:=C2=A0=C2=A0=C2=A0=C2=A0 eaf290c404f7c39f23292e9ce83b8b5b51ab=
598a
> > Gitweb:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 https://git.kernel.or=
g/tip/eaf290c404f7c39f23292e9ce83b8b5b51ab598a
> > Author:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Radu Rendec <rrendec@=
redhat.com>
> > AuthorDate:=C2=A0=C2=A0=C2=A0 Fri, 28 Nov 2025 16:20:55 -05:00
> > Committer:=C2=A0=C2=A0=C2=A0=C2=A0 Thomas Gleixner <tglx@linutronix.de>
> > CommitterDate: Mon, 15 Dec 2025 22:30:48 +01:00
> >=20
> > PCI: dwc: Enable MSI affinity support
> >=20
> > Leverage the interrupt redirection infrastructure to enable CPU affinit=
y
> > support for MSI interrupts. Since the parent interrupt affinity cannot
> > be changed, affinity control for the child interrupt (MSI) is achieved
> > by redirecting the handler to run in IRQ work context on the target CPU=
.
> >=20
> > This patch was originally prepared by Thomas Gleixner (see Link tag bel=
ow)
> > in a patch series that was never submitted as is, and only parts of tha=
t
> > series have made it upstream so far.
> >=20
> > Originally-by: Thomas Gleixner <tglx@linutronix.de>
> > Signed-off-by: Radu Rendec <rrendec@redhat.com>
> > Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
> > Link: https://lore.kernel.org/linux-pci/878qpg4o4t.ffs@tglx/
> > Link: https://patch.msgid.link/20251128212055.1409093-4-rrendec@redhat.=
com
>=20
>=20
> With next-20260105 I am observing the following warning on the Tegra194=
=20
> Jetson AGX platform ...
>=20
> =C2=A0 WARNING KERN genirq: irq_chip DW-PCI-MSI-0001:01:00.0 did not upda=
te
> =C2=A0=C2=A0 eff. affinity mask of irq 171
>=20
> Bisect is point to this commit. This platform is using the driver=20
> drivers/pci/controller/dwc/pcie-tegra194.c. Is there some default=20
> affinity that we should be setting to avoid this warning?

Before that patch, affinity control wasn't even possible for PCI MSIs
exposed by the dw_pci drivers. Without having looked at the code yet,
I suspect it's just because now that affinity control is enabled,
something tries to use it.

I don't think you should set some default affinity. By default, the PCI
MSIs should be affine to all available CPUs, and that warning shouldn't
happen in the first place. Let me test on Jetson AGX and see what's
going on. I'll update the thread with my findings, hopefully later
today.

--=20
Thanks,
Radu

