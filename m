Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.182
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792764910;
	b=bo2vN1IrTx6VfXKiYPtTabeKYM8ixdcIoytmxGKOBVUl6rsWistatQaMjqOt9stBHkL/
	 LCQBQi8fGk2bA9N4nrr+ULYjlagi2JZKTtWjle+E6tph27PFyWYD2TsC2/S8mrazqPsyB
	 vM6vjG+uC3bh5635OTOzSV0rvZqWhQBdkOhf76RPVEn0ZPDKFtqczMxflCPvfJMqKT1zd
	 oUA8tCCVbFelLrJ309K4wrP2ERn9YzSaGYKz/1OFkT294WLkqxoaF5SvDEFfXGgEqdX+z
	 VQ6yjKmuN6Pa7ZqvijmPFcHjtdpT1n4Bi26Kzl/nWqJsaRDPA1lBxnU2r5JHZ1KZB9Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792764910;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=ssHEzjzfcY3y99EaZ6IT5t5Uq+N8qOcZuAF48Ej6bak=;
	b=oJ8LX9i7z8c949ox4aGramS5SIdHmV5VwlPL56ETl9nF4a96G3wgPca/67iGSeZATVF8
	 VJX5zBTLkpWdDGCgCcauKg4G3Umou+Xe5C2ptubVDnovJlLRphS2USlkDJAF30Hy+fU/x
	 2Kx1srW93w6VamSxrFFj0a50fcZpDgoCghku7g4N6w1ufmUnfg12XivtTelfEqtqoKQov
	 BGMDw0bjcYQcySaXWBjroB93TbGnPa02JmykdZrePgWLr4FrGyGiqU7JmLxyWz2Bsaumk
	 HKWErwsjURtOuXJkwXXsMGTIY5/eKUlCumDZnk+7y1GNzkMplfjDvQrU6LdTdyObhlw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=AhdXrNWn;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.182
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1F95606A329
	for <linux-tegra@vger.kernel.org>; Fri, 23 Oct 2026 14:15:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E1F95606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=AhdXrNWn
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-35ef6b49813so1327970eec.0
        for <linux-tegra@vger.kernel.org>; Fri, 23 Oct 2026 07:15:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792764909; cv=none;
        d=google.com; s=arc-20260327;
        b=q9HqnHtEH5eMI8Ny04zY2FTCJyJVtRbvyN/t05iVxgmniDaktcopItxyO6aBtoWtRY
         Pk1UQseVqfn1NqchXo/y118L628kqdi9rbFSjgACdVj8Z67G8ojRyXDsDW4N+QXH9dB5
         yRER1QB4t1o8qG3OProZ2vrovl+/rZtl9Py1JIT2R2U2DqKUfOm78IuBLLOl0Ey7AITm
         YVJPJtWVhnnEQGF+tIqHhmLz67rl1yatrl47GnTeG28pwkdXJ2QoYS823WNmidYsy1gh
         fqqkWYRcYup+c+3dCfPsrQuAvlSRMmCfN+7BMB0LUULw7VMqfrZgHQzHGqfJ5iK+jgVK
         niTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ssHEzjzfcY3y99EaZ6IT5t5Uq+N8qOcZuAF48Ej6bak=;
        fh=6SwdHQ8lFRP+kV7gXMXLdgQ/ES5W34o9IIO/qfrfDeQ=;
        b=eYNo543K0JnTPqkP1+ykZfIRpvAtEdBEyaRF7lmL343YbcVJxC/eAme9ah2ZISZO7g
         K4eX89uWoHXiEGT5dFxczq+PDBHShPDfEMnAkE17RyKWJOP4WbWzty81IPqQ7PDVwWp9
         B5y4EU5WUoGfdeWeMTquP4HU60Fj/g2gpyqikkcp8AxA+CVRBxw/rAd7SRaoaaKINieu
         5LNlTdpvIOCh79KSYO3Gj+J/QUMwdpPlJ60Oy9ipvOPp+JFGfWg//udyGLbepoGU4UW9
         YvsZO57Peh37bLoxv+RrVWF0h9tVRqaOJWky91mQc8MAWRS1YZ0StV2O4z2m6qC3EfaB
         JT+g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792764909; x=1793369709; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ssHEzjzfcY3y99EaZ6IT5t5Uq+N8qOcZuAF48Ej6bak=;
        b=AhdXrNWnrU3mrt1MMRe/e6VxIevvuFIEP5rhfHlfuMzUxqtoIouvMJRuzKDBd2weYm
         l/dBG+LuBgyps93XvGFRFcHWMTOIAMzKJFCtjzFXTPBWFcKlqAMJXJP3Vetqp+pbR13Q
         dv6FtJluW3yMZ8spVdkU5AKtqKrAJ7klobwSKhZcEIaRzeTZloIeRxrOUwuEtWgujkNO
         XTW6xQ7AaHjrQkvEH4eSpLrmE+89zS0D1ddzkdo9GreFLLhSb6ilCUqWX/YP5hIHLtiF
         iAS8MM0fRa351wkUsBzTAIlLET80YjYHUlJx5JF9dgDGgSMoKrw3khS1TnI/ztRJ192k
         lOFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792764909; x=1793369709;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ssHEzjzfcY3y99EaZ6IT5t5Uq+N8qOcZuAF48Ej6bak=;
        b=LQ+ZPUO+Vwbcvb1DkY1TWgDHTUyosUFNwUhJdYdgeSFmKQDatFBoaaO/VPp9+KYZ9K
         lkcy0zvvG0K0uuUTSNKwtliK/n/F5lSwOTYMy4T1+vPSPJGtaw7234Qr6AVD6O/mUPlz
         23UyM6vdHqztPdIPS9VANPvU8UAI0xbrk7UeLJigS8lRudHc2lVgsxNBnUr0iZRInvyN
         gZ5RT88OXkM1lfC0/dWqrRbNHvLafpj9r+kV6LoEIrih3s5a7DYsS3TMBuPmgjyFASsO
         GjsWOZFY49pfoeAirl+3JWQbQFDjnQOliXGREk2jW8Poqdlw5bg3Nh6odXZkrJroP6Gt
         fwUg==
X-Forwarded-Encrypted: i=1; AKwUvBzoMXivqnrHVlWTzPd2Ibw0eiyuKcWvk0SFWPifWifZOHJ0VPm/nIORIsvI0rh+uJhLlw6Hb4DRhQsWGw==@vger.kernel.org
X-Gm-Message-State: AFq9FYKdxddQHk1pFHGPYVKVv1n+sAh6Cs21kWr7YmuWpxQ3WY5LGD9y
	NsUI404mURn3bm0TmrMLKNjhISEk8gP43OlSL3gQmW7RXIrv2k8hLvsrCcRYAsocuHDjB+Q6w1E
	QNLTh0YxB/a4hMs26SPXtLRgtdTrTV7E=
X-Gm-Gg: AYBFou2ZxWErk1KOssu6szx3a81ZiFq9EKJ2sUDv4eBeYY0KQQBpCenltxdQeCkBebu
	eOodYp+GYIzHmL5tZYkcZH+7LesoSebrtFQHtgsdvedP/xX6JH5AjY68QHK6x1SnjJ9dbg0QSD2
	KoDl1QeAPgSrhMKG5HpSY8cNeMBTN2pc3qGWuun+zmw65I+26hBS4Iz4+4dEcP0pgN5NMm3plOH
	ADrvvhJRcJelY/rRqi7dDUi+WhGGm3BN+5pDHVWzAJ5hwTGq2zrUgg/6Yi1dG4rLZjUz4uaVqkH
	It9fDoPEDiF8rc/H7wQpDRUvtkdw14yI6EFt2G6VQbgEaLKZHG0QAbQq1BkgeUzW8xrZSummK8o
	3XAhWzCjyeT619bC83Ppty/aZpTyK2JX21orBXCApHCp3UfSqJNuVZkKhPltBkKV7eMK7pQ==
X-Received: by 2002:a05:7301:6507:b0:358:8f02:e0ca with SMTP id
 5a478bee46e88-369d96e0ad5mr4018525eec.9.1792764908756; Fri, 23 Oct 2026
 07:15:08 -0700 (PDT)
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Post: <mailto:linux-tegra@vger.kernel.org>
List-Help: <mailto:linux-tegra+help@vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-tegra+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261022132259.240717-1-clamor95@gmail.com> <20261022132259.240717-8-clamor95@gmail.com>
 <Ot5qxntOTJ2QgFh6uZ0riA@nvidia.com> <CAPVz0n3Vrzb96iR5ZW8zvmruZ4aK0hKGKpJ2T9Ys+bSPCtLWHw@mail.gmail.com>
In-Reply-To: <CAPVz0n3Vrzb96iR5ZW8zvmruZ4aK0hKGKpJ2T9Ys+bSPCtLWHw@mail.gmail.com>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Fri, 23 Oct 2026 17:14:57 +0300
X-Gm-Features: AclHuK8iWdYJNcYZY57a5wy5nSa1L6Um7fXs3cPnETk89r87jtgd5ZLBghEmEmU
Message-ID: <CAPVz0n3gzV+gAu_gzp3oTG9VOu-YiNSiQA0SdCFApKsi0dGjKQ@mail.gmail.com>
Subject: Re: [PATCH v4 7/7] drm/tegra: Add support for 8-bit CPU interface
To: Mikko Perttunen <mperttunen@nvidia.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Jessica Zhang <jesszhan0024@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Thierry Reding <thierry.reding@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, 
	devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=BF=D1=82, 23 =D0=B6=D0=BE=D0=B2=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 11:2=
6 Svyatoslav Ryhel <clamor95@gmail.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> =D0=BF=D1=82, 23 =D0=B6=D0=BE=D0=B2=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 10=
:53 Mikko Perttunen <mperttunen@nvidia.com> =D0=BF=D0=B8=D1=88=D0=B5:
> >
...
> > > +MODULE_ALIAS("platform:tegra-dbi");
> > > +MODULE_AUTHOR("Svyatoslav Ryhel <clamor95@gmail.com>");
> > > +MODULE_DESCRIPTION("Nvidia Tegra20/30 MIPI-DBI Type B driver");
> > > +MODULE_LICENSE("GPL");
> >
> > No separate platform driver or device. If a separate struct device is
> > needed for some technical purpose, we need to create a minimal separate
> > virtual device, but unless there is a strong reason to have that we
> > should be fine with just the dc device.
> >
> > Thank you
> > Mikko
> >
>
> ATM, I use bridge framework to describe interface and I am attaching
> it to RGB since it basically uses RGB to transfer video data. It works
> pretty nice so far.
>
> You propose to replicate how RGB works just for DBI?
>

One of the reasons I used separate pdev was to be able get mipi_dbi
from it using dev_get_drvdata() from patent (dbi bridge in this case).
DBI framework seems to not have a way to pass it in any other way,
unless you know smth I don't.
