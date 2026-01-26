Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20A21258EDB
	for <linux-tegra@vger.kernel.org>; Mon, 26 Jan 2026 22:26:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769466413; cv=none; b=mMiwGZLjuO0MJADEMd4PA9NZMjTkrOvztCsgsdxFCJEcbUz8ACH2Ue5EyipvC4X/0MMcpicuFsp1vAJva7258lgQUSiDmoGbRtjmo2Qoc5QMA6aQ5FvuFQcl02ag7v8X0xqkZ1kbd6fMuKsZVSrAagLRSuL/3wS5POxOyQcEiNg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769466413; c=relaxed/simple;
	bh=2mX1cWmGt8Ks1WEyR33TG6bXZsri+b5CFYYtGfOS7k0=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=QY9hMvp/ZY4QrihkTHW5kVaGDrQU2AWM2TVF4hbqtN9NZRQNjMM8pC3aDi0GQEVO/xDOHVzDz+pKAKit/qB0QF8J1PSBA4ZPbrtK63wt+IJZF0iG2dIW2Zg8Odg4BWmqKKk3/pZQlR1qtLomnO9TWFUhuRaXR1yu009HliZKwoA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=DGiaZ8vW; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=owffNDpw; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="DGiaZ8vW";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="owffNDpw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1769466411;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=G+jcQN2bBzkIEmcI+6XiXbVVbmmQ3Up+uCvq5fTtM8c=;
	b=DGiaZ8vWRd4OY8jZdt9nsgN93/up+RHubw1EbT8mCLMr62R9H7dB39b8rUQYUicsU3AXWN
	NqDqe/jIFHCRYPZAJ7VyRDTQxh8M7oGMYysQlAfaAtKwY3Sbg3bj19KVeWHD34iiF+KC+1
	uPme9U9SWfeJROdkbkAV/hdD1Mok0O4=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-318-rdZULprKNG-Qf-zhHAx97w-1; Mon, 26 Jan 2026 17:26:50 -0500
X-MC-Unique: rdZULprKNG-Qf-zhHAx97w-1
X-Mimecast-MFC-AGG-ID: rdZULprKNG-Qf-zhHAx97w_1769466409
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-5014c472ad5so133922301cf.0
        for <linux-tegra@vger.kernel.org>; Mon, 26 Jan 2026 14:26:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1769466409; x=1770071209; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=G+jcQN2bBzkIEmcI+6XiXbVVbmmQ3Up+uCvq5fTtM8c=;
        b=owffNDpwkbfXDISA4KnPNecgYGEvJVCWmIESeLSn+0/HES4xhBP2OTj60z+YbGUuqa
         AjTtqcgoHRfzuaXTfCPzhRhUeEP5ixnMOSkl/FsT87I2/J5aqpbGGLj4/pK18BKcG0TN
         DzRf/ejP80RelRlakXzFpYijNb2lAuGgtPjaB96GVzj9HbOGeWn+bWaYKJfWFVU/pPSQ
         eLUE16eD0IQc17B0C1+hGCZRU+R0hg39V54SoWGJF6cLrt4AKG8wfJ5CbuiDK5cfQ3xt
         JspZCHjzbwkrqvM/wHWRmtkx9e0csPzdfKcPjeurNC0Dd4vgQ15Hb50bFhb2CJbV5v1s
         jolQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769466409; x=1770071209;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=G+jcQN2bBzkIEmcI+6XiXbVVbmmQ3Up+uCvq5fTtM8c=;
        b=I2+L/g9by173Jx9qi8ANbgpY1fl+s/TynjKBER/iCVXCHORRjQzYWk6zttOARuQEVj
         eOP4rl414lxmJpWrh7D/M4gmdDO9hXDzdrH6Dh39/mZpD3l3HGYowMy/b57kXQWwbMsn
         TmzsYmUml+/V9NT024FCjvbXHEX38W05reuTBgyaQSK908pjOCzIHEK+WAX832ych1pw
         dQ2BcNYLWc+K1H8pn314I9JDh5/PKk0Igzvph8x2fLj9AI1/uCeiabzmZu9svr4QvvV9
         +blMVESzier6dEhVOSY73yQuBdCtbdnqueTFCMV8pIufPOr0VhBHjeRnvNCJjcicc+9X
         l6VQ==
X-Forwarded-Encrypted: i=1; AJvYcCVjh7R8qfWx0T8xRt5l2a9sfd6a++QviB7KtfN6D0ALMgEwkCkxUUS1pp1SsT2E2ENne4K6Dg2HAgvGcQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwE9HXE3eiv2/JGqa9oQ9c/6bJ9d3H46S8YeJkaJSRQ66FrSmUK
	of4LvcXyi5suGo1nvaZR3iUzaD47utWd9tjemU9uDI6IjaeEQHjgcNBdrnA7uy3snX/NkQvFRAH
	cBZy+7nV599fHtU+g0v0UJkqQwEYBiD7bSFVg06jtKBDEsPfPJknSAWdx9Lq1c8hJ
X-Gm-Gg: AZuq6aI+O391tMIptBGbv9YktU8q4OCVjpx1eDjtdtI7eK24u/p5Lz/qSbJazJ6Ub0c
	fMh5w3qCGjbj9MxvMc9nFhkVTujXCBq2pc4T0dWkxzt1mNMAoVa+K4WdUyM+L/zW+0CtksFiXw0
	MW7JKXOby7iX7hdH8hAURsyYmO4umbgdq6DP/fkq3EA6r9+hglV4C6YVTmLxEolZILXSCSg1ATX
	kE94tX02t6h0w+PEUwqOgNdlEquZXqfsSik+YI1lAD5rOTUcQ+PjucW1NbPDsc87MJWbzjV+DFj
	vYQzz9AhI0ZVksFfZowaM0EAPQWuaFaspiPgpiDi0AzJFH5xXNnFowlb+pVBD/+jUXrerdmTIFJ
	ZC9ckFxX3JwqJN+9dKm6qRAa8Uy2tOgowwojv/7kYOJR5SrxQe74IrJF/H7tm+U5/65V9pcvA8K
	2Wsg==
X-Received: by 2002:a05:622a:389:b0:501:f6f7:d979 with SMTP id d75a77b69052e-50314cdc7b8mr71285381cf.73.1769466409420;
        Mon, 26 Jan 2026 14:26:49 -0800 (PST)
X-Received: by 2002:a05:622a:389:b0:501:f6f7:d979 with SMTP id d75a77b69052e-50314cdc7b8mr71284991cf.73.1769466408937;
        Mon, 26 Jan 2026 14:26:48 -0800 (PST)
Received: from thinkpad-p1.localdomain (pool-174-112-193-187.cpe.net.cable.rogers.com. [174.112.193.187])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c6e37c8fa6sm1124018185a.4.2026.01.26.14.26.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jan 2026 14:26:48 -0800 (PST)
Message-ID: <221f6dadb6d8ce06f30a24baaa2777e90d75b130.camel@redhat.com>
Subject: Re: [PATCH v3 3/3] PCI: dwc: Enable MSI affinity support
From: Radu Rendec <rrendec@redhat.com>
To: Jon Hunter <jonathanh@nvidia.com>, Thomas Gleixner <tglx@kernel.org>, 
 Manivannan Sadhasivam
	 <mani@kernel.org>
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
Date: Mon, 26 Jan 2026 17:26:47 -0500
In-Reply-To: <255713ca-bf91-4f7e-8df2-33b7b614a1bb@nvidia.com>
References: <20251128212055.1409093-1-rrendec@redhat.com>
	 <20251128212055.1409093-4-rrendec@redhat.com>
	 <4e5b349c-6599-4871-9e3b-e10352ae0ca0@nvidia.com>
	 <a8d841e870d6dbbabef7eadb774f2a58a96c57c7.camel@redhat.com>
	 <cfe44924-3419-4f31-8ab3-87b769d21a5b@nvidia.com>
	 <96c9d483f67be02fa1dba736fea465216d0c3269.camel@redhat.com>
	 <87sebsdcte.ffs@tglx> <255713ca-bf91-4f7e-8df2-33b7b614a1bb@nvidia.com>
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

On Mon, 2026-01-26 at 22:07 +0000, Jon Hunter wrote:
> On 26/01/2026 07:59, Thomas Gleixner wrote:
> > On Thu, Jan 22 2026 at 18:31, Radu Rendec wrote:
> > > The CPUs are taken offline one by one, starting with CPU 7. The code =
in
> > > question runs on the dying CPU, and with hardware interrupts disabled
> > > on all CPUs. The (simplified) call stack looks like this:
> > >=20
> > > irq_migrate_all_off_this_cpu
> > > =C2=A0=C2=A0 for_each_active_irq
> > > =C2=A0=C2=A0=C2=A0=C2=A0 migrate_one_irq
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 irq_do_set_affinity
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 irq_chip_redirect_se=
t_affinity (via chip->irq_set_affinity)
> > >=20
> > > The debug patch I gave you adds:
> > > =C2=A0 * a printk to irq_chip_redirect_set_affinity (which is very sm=
all)
> > > =C2=A0 * a printk at the beginning of migrate_one_irq
> > >=20
> > > Also, the call to irq_do_set_affinity is almost the last thing that
> > > happens in migrate_one_irq, and that for_each_active_irq loop is quit=
e
> > > small too. So, there isn't much happening between the printk in
> > > irq_chip_redirect_set_affinity for the msi irq (which we do see in th=
e
> > > log) and the printk in migrate_one_irq for the next irq (which we don=
't
> > > see).
> >=20
> > This doesn't make any sense at all. irq_chip_redirect_set_affinity() is
> > only accessing interrupt descriptor associated memory and the new
> > redirection CPU is the same as the previous one as the mask changes fro=
m
> > 0xff to 0x7f and therefore cpumask_first() yields 0 in both cases.
> >=20
> > According to the provided dmesg, this happens on linux-next.
> >=20
> > Jon, can you please validate that this happens as well on
> >=20
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 git://git.kernel.org/pub/scm/linux/kerne=
l/git/tip/tip.git irq/msi
>=20
>=20
> I tried this branch and I see suspend failing with that branch too. If I=
=20
> revert this change on top of your branch or -next, I don't see any=20
> problems.

The closest hardware I have access to is Jetson Xavier NX, and you
already mentioned you couldn't reproduce the issue there (and it looks
like I can't even get a hold of that board anyway). So I'm going to ask
you to test a few more things for me.

Can you please apply the patch below on top of the previous one I sent?
The suspect is the spinlock lock in irq_migrate_all_off_this_cpu(),
although I can't think of any reason why it shouldn't be free. But I
don't have any better idea, and I would like to narrow down the spot
where hotplug gets stuck.

diff --git a/kernel/irq/cpuhotplug.c b/kernel/irq/cpuhotplug.c
index d8c62547f9d06..69c44da68e3a9 100644
--- a/kernel/irq/cpuhotplug.c
+++ b/kernel/irq/cpuhotplug.c
@@ -178,9 +178,11 @@ void irq_migrate_all_off_this_cpu(void)
 	for_each_active_irq(irq) {
 		bool affinity_broken;
=20
+		pr_info("%s: irq %u\n", __func__, irq);
 		desc =3D irq_to_desc(irq);
 		scoped_guard(raw_spinlock, &desc->lock) {
 			affinity_broken =3D migrate_one_irq(desc);
+			pr_info("%s: migrate_one_irq -> %u\n", __func__, affinity_broken);
 			if (affinity_broken && desc->affinity_notify)
 				irq_affinity_schedule_notify_work(desc);
 		}

--=20
Thanks,
Radu

