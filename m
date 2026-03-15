Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 176A537B3F2
	for <linux-tegra@vger.kernel.org>; Sun, 15 Mar 2026 21:49:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773611372; cv=none; b=V3ZkAPmXt4hM6od3N3jyX3IJipIZgtjf64BfHEa1I+H5P4gt0T7DAhutjZjQUie6UyBWkqY8n8SMwUxqC2JMI/rb3j2pTvBT5uUFYB9In58dU7P6u3OMts95Ah0MWseEyBPpIaFGosIF9WKEDUHBOI57MrRutHbrsGZfymPvrJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773611372; c=relaxed/simple;
	bh=Qxv+0hEJYOFZkN5TsZs6luIf1ayGG9y3q6VTgDkvQv4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ijjNLw2eZCFZOMFbP5i543qgbzITivHT5uoagg7NlHi3hFcl/GluAs3/42j9988yldeuMhNYnsMqCHl+4ziXmWi1GIwlwsvVdnqQShefJ3vp/gUJBkn1eHIvXkJltABdHRyn3jNvSFK/lA03W7XA88n9OkRTMb4G2gV5EwqUO68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mVzwuB8S; arc=none smtp.client-ip=74.125.82.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mVzwuB8S"
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-2c0bdf1988cso1042522eec.1
        for <linux-tegra@vger.kernel.org>; Sun, 15 Mar 2026 14:49:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773611370; x=1774216170; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Qxv+0hEJYOFZkN5TsZs6luIf1ayGG9y3q6VTgDkvQv4=;
        b=mVzwuB8S+dTQgYy/Zp0iRtywsi5LWS4zX9W27E3LMGyKzHeleUNOhLGvRobn1mWZZq
         VDr3pbSqRO0Zcdij+WKQcskgLnLxVyb2vYi7YjlAOi31alBw70DahLk7AKO87ark3p70
         Aiw+FnfnRW8VMNVQ68igBuf1ccgOi5HhU/1GfQT82k9SvPRcptirDKE1PBmpvucSUum8
         MFoddB77GDED3swpuK1kHaZvvxVM0pkOGBWkB36yXSGeEFc6wLSHEgT5BdjrPnAzFgkt
         cklfAYwtKJtOokGiUeyLIbIFuPg0cQZHcaMGYhoF/+eVh2GG3+9z2CMlk1jw3VDVx9Pl
         ee4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773611370; x=1774216170;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Qxv+0hEJYOFZkN5TsZs6luIf1ayGG9y3q6VTgDkvQv4=;
        b=qQy5ge4qtCXJjViL2q4cv/DX9N9sGIc2Ulm9M3zjIcNvSLLvyFcK47mL5kA4HrDOmi
         Dg6w7SVNvoc0ltPnIxqQqX/gP56S3+y6Fzpsr0rgJTQ5NwrABFqmW3V+03Pyrq8wUgc0
         u73S6xUT0Yb7BicI3fHbFegsP81lVNs1dQwDUbVYaPmduxDzNCZrM3BWSBUIllrUnWBu
         4y/wRKQl7UCLn6qvTj1VVeOeH+LDjJUBucl34hdge9TzBRPedIeWplYQ39Eo5dQf+0FC
         yzNWXf+xPp6+Z6+Xy0+07hcxnB9gbcgHeK516tLiOoQkvDfxvsppD5qPD6I9HyC15uA2
         Oaxw==
X-Forwarded-Encrypted: i=1; AJvYcCX3zkpKbON6iQXlyAb6OQwzeXPR2Mc58z6upwZrE1+ObfKEULDGJgHZBrYoX5iR1BattpanAxoamK2zOw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyWCaqrKWpJTFifqsX9R8pXd079SzpOSkCb8Cb1z1cWwdxs/R98
	LDuIpWzXDzkSKvYm3wEOaTlUZPJG5sDt6uamQ8t06we4FRP/fD2q2J8c
X-Gm-Gg: ATEYQzzJBlkSB9qPvvQaxVjZyXdIv/WjT+wSgl793crDravguSjY5Wl4yjLHJD0/6KG
	kE9H1+kGQ9rKKGweDwK3ZtD7enulLK7CbQYqEYbxAOClq9dS3sBjFeQ82vT/boMcD3hoyNGQySn
	FvnggHS7HPGRfO63ijgITg+pdczYcANLN52Ae6IrjA+q2IsL8VCHt69IdOMM4OL31PnALf5ZqHr
	PR5X7ArYgqHfWPslyFpTyrmBJ380hPU6lh/uYfSRAVHR9T8Dp32FyKnWImCabeVv+aNjg7MkDyc
	OADaZqnqyzcyFOU8f8E1KTVKNhm+X/kzwhul0NbxivrIuPoNr+dmTYz4C7bRZ9jMwbWk4LOPNwB
	ACGHoIdZejqEznLFEYwH/t49iiZxuQPyB9Jtc9N70zh6IzspFCxTTK+iO1n/yEaDsjR8vw1bdpA
	YVFz8XngPgtSIio6KqYXUL2VdyRHiEFxjPdjpn5D5bZwBhKGGJMKTYk/5XCg==
X-Received: by 2002:a05:7301:2f9b:b0:2be:171c:503b with SMTP id 5a478bee46e88-2bea547de61mr5131000eec.16.1773611370199;
        Sun, 15 Mar 2026 14:49:30 -0700 (PDT)
Received: from unix.my.domain (191-217-32-216.user3p.v-tal.net.br. [191.217.32.216])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c0b1fc876csm6441974eec.29.2026.03.15.14.49.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Mar 2026 14:49:29 -0700 (PDT)
From: Gustavo Arantes <dev.gustavoa@gmail.com>
To: marvin24@gmx.de
Cc: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	ac100@lists.launchpad.net,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Gustavo Arantes <dev.gustavoa@gmail.com>
Subject: Re: [PATCH 0/2] staging: nvec_power: quiesce EC queries for system suspend
Date: Sun, 15 Mar 2026 18:48:51 -0300
Message-ID: <20260315214851.15008-1-dev.gustavoa@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <233329fb-0ea9-d784-b56c-f078a329d370@gmx.de>
References: <233329fb-0ea9-d784-b56c-f078a329d370@gmx.de>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hello Marc,=0D
=0D
thanks for reviewing.=0D
=0D
On Sun, 15 Mar 2026, Marc Dietrich wrote:=0D
> Reading out the battery info during boot takes some time as far as I=0D
> remember, but I haven't tested your patches yet. Is the use of sync=0D
> writes really required in order to realize a clean suspend?=0D
=0D
You're right, I worked out some math on this, and I agree that the sync=0D
conversion isn't strictly necessary.=0D
=0D
The worst case with async writes during suspend is a reply arriving=0D
after work has been cancelled. That reply would just be lost, and since=0D
the poller refreshes everything on resume, there's no corruption or=0D
crash =E2=80=94 just one missed update.=0D
=0D
The sync approach does avoid that window, but the cost is structural:=0D
the battery metadata init serializes N queries, so the boot-time wall=0D
time goes from roughly one EC round-trip to N * T_rt. With N =3D 3=0D
(MANUFACTURER, MODEL, TYPE), the relative overhead is always 2x=0D
regardless of how fast the EC is. Without hardware to measure T_rt=0D
I can't tell whether that's 100ms or 2s of added latency, but either=0D
way it's a cost with no real safety benefit.=0D
=0D
> Are you able to test the change on real hardware?=0D
=0D
Unfortunately I don't have access to Tegra 2 hardware, so this has=0D
only been build-tested and reviewed by inspection. I'd appreciate it=0D
if you or someone on the ac100 list could validate the v2 on a real=0D
device.=0D
=0D
If you think the lost-reply window during suspend is benign, I'd=0D
prefer to drop patch 1 and send a v2 with just the PM hooks on top=0D
of the existing async flow. Otherwise, I'm happy to keep the sync=0D
conversion as-is.=0D
=0D
=0D
Best regards,=0D
Gustavo Arantes=0D
