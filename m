Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A22AB345ED8
	for <linux-tegra@vger.kernel.org>; Fri, 31 Jul 2026 03:11:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785467480; cv=none; b=smtOYLkclMnbGDJLByg4mp73kPEt0mszzgRWYCcCAt7zJsIIXR/vgEXOT9L2pdcpeZ50I7GuVEFl5Nc1XcTyZI0WuM/jOQIlB4YSBd/DKU4pRdR2PJlmhuptNgyfXm2XuFnkSvPYBCjQ5L/6B19wxtCfnsB0rPaVOi8ejqjWvrA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785467480; c=relaxed/simple;
	bh=GWIkI1eD5Bk27NjXEiBgjczmLe76dOHKjqJoukzr3qM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=if8qlgmn7Hgl4Mv3W3hkdYlUDGuVxHUb24jUlTtIvWmtVVtaCCg6owEHqUR6+yTmLocsxTCAtrPFjbrATfp3Vxyg8jCnOO+KPlEnG8RQT9ZMwb3t4h2q7J/lrEp4B2aOJlqgZd+nCMX4zGmPWwQQe8yrvTh4paBg+1YUgRGORDQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=maticrobots.com; spf=pass smtp.mailfrom=matician.com; dkim=pass (2048-bit key) header.d=maticrobots.com header.i=@maticrobots.com header.b=Dnxwnknn; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=maticrobots.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=matician.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=maticrobots.com header.i=@maticrobots.com header.b="Dnxwnknn"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2cc7ef7ec27so5887715ad.1
        for <linux-tegra@vger.kernel.org>; Thu, 30 Jul 2026 20:11:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=maticrobots.com; s=google; t=1785467479; x=1786072279; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+jDUeV37G5tAArJc87hK+jR2T1SQGY2xbZAynKmfam4=;
        b=Dnxwnknn8WmYsztDCENlyfdapOUfYUPHAuieOdhBbVXJZowXPaE/b60CFOhDeTqxym
         iCFB9CXkdBLP2tJu6U7/s1NnEpuzPbyH2GzfN+pMvACdpjB4XeRnKWS/kH7rJt57zHcm
         1wjqLeYEOLvArXnJxOyjm/m7LjydNH5x3NqgatE698uj5nDTUmJL/vwSwDQ+QhU4q+qc
         eCzYIaEp1jQa8ygKxW3fIsamkCuZI/Eie6JeJCYTuMYOZreOJiqlIxN1gxtvdx5slUpu
         vJYn8bs6jSdt0TsfDggi3B45mUtCEoqdeb1gfm5p3NWxGuDuyG52vBr6B63s1EMwK9AD
         ktJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785467479; x=1786072279;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+jDUeV37G5tAArJc87hK+jR2T1SQGY2xbZAynKmfam4=;
        b=RXUPmmbo7CeM/o0AbxlvsMMFgPJQog5w42rP6qrOpuSRpz6K2uFEdjPOwQXoExD8zf
         61rhdEf0ILyAblQIadOagJHC5bBXGU5DWnCkOhSbFE+MYm9ZjpCD2ikBnYXpwVoP46LT
         a9yf8Z6Qmppc0+UZduCtd+pO44369eq7rTG7FNys50N3uIM/+yF+KwvV8ghn/TWOV4vG
         9n1YQqSq9U8n61bNkxrQ99MM//rNjWL/2TlYaYMJFf9O/WEet86yJ4J78pUD+eTNBiXU
         8t+JY0MMft2NDxtOctlVgz6S7tIGu5JLocJL5Hatmu/Ch6uBSVKnYkbykXG/3JS/9Rut
         ydLg==
X-Forwarded-Encrypted: i=1; AHgh+RoSsp1CUX95TaOq7u+aScj4Ecjnr3doZht0Sq/0U/HC5Wm0fBTunxao8Q8msgN1wh+P4BauAbOoZQQN6Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YxwnF+uWKuh4//ydxgMBbwLN5mmjl32DPR+2iCsjA6qB85wkcD/
	4gfU9e+97RsZ5bREiNvK2qi3yKmTXKQtGBUYa9ecZeNSY8clcfbYdFz39vUJIEwnojo=
X-Gm-Gg: AR+sD13V9GViolLvJFtBGREmlsMOju3g5ksu/N++PTTCuOll6lMlg7244GXSp8D50tA
	pOtq4mGFVCI5mxNgyKAB9hXM3TqbhRgCX02bu8zYHP0AUIx7N2f7/Bwi6UyGbtFGTcEKk88j9jz
	J+X16CgEABiHd6nKoBLJeNSxBwvlD7sFcGJfnDcRRvaZow+D8AhRkagSEOgG/12Pp1QT0oxM0dx
	yeSnuuIZNF5wPU9akPiO5ukt48gqVcfgIZACy/plf0Sa5tLQUNrtfQGLNLh1hVPQ9Pgv9icNwMR
	jAxqqXdeERXtEORyiEbPGoIAW+z0e5Hh/3XjPVUAYN7VU9igGYddb/XZJ9XIqNekK1pjXsxsqWf
	0GPp0+yeinPK2RAf1Ogt/qIGvP2z1gKY/hiAcC9mHKmMiaB8j4xxXfa8pf+I5v17MMJ9Yy8bZrC
	lWCOIb1NxxowBUPtoTf+wykWTgXH2wGatdkVcuCeiG+4ntBppXwB2dawPAsZkr5K+LRbZ00YyZe
	YQl+nzZgR4f/dfcXEauwSy3oSxGLnuewqF9Hg==
X-Received: by 2002:a05:6a21:730b:b0:3c3:83e6:c705 with SMTP id adf61e73a8af0-3c91b346a1dmr164358637.35.1785467479007;
        Thu, 30 Jul 2026 20:11:19 -0700 (PDT)
Received: from abeMaticDesktop.1020marsh.offices.matician.com ([2600:1700:471:807f:4328:dce4:fe00:16d4])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3153dd4f0f0sm1287eec.2.2026.07.30.20.11.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 20:11:18 -0700 (PDT)
From: Abraham Zukor <abe@maticrobots.com>
To: Jon Hunter <jonathanh@nvidia.com>,
	Mark Brown <broonie@kernel.org>,
	Laxman Dewangan <ldewangan@nvidia.com>
Cc: Abraham Zukor <abe@maticrobots.com>,
	Thierry Reding <thierry.reding@kernel.org>,
	linux-spi@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] spi: tegra114: initialize native chip selects inactive
Date: Thu, 30 Jul 2026 20:11:11 -0700
Message-ID: <20260731030827.4186208-1-abe@maticrobots.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <0513a557-762e-4390-b5f3-84ac26a38de4@nvidia.com>
References: <20260725042944.1204409-1-abe@maticrobots.com> <b2a3d65c-d3ef-499d-b56a-82018804f4d3@nvidia.com> <20260728025503.162543-1-abe@maticrobots.com> <9c196ab1-1945-49fc-a89a-5588d1e50046@nvidia.com> <20260728200316.1363536-1-abe@maticrobots.com> <0513a557-762e-4390-b5f3-84ac26a38de4@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 28/07/2026 22:09, Jon Hunter wrote:
> I am a bit reluctant to make this change after 10+ years of this driver
> being around.

That is fair, and v1 deserved it. I have sent a v2 that only touches
chip selects the device tree describes:

  https://lore.kernel.org/r/20260731030134.4182688-1-abe@maticrobots.com/

The steady state is unchanged - tegra_spi_setup() already programs these
bits for each device, so only the window before that runs changes, and
only for active-low devices. Nothing the device tree does not describe is
touched at all.

> Right. Although this patch is specific to Tegra, I am guessing that
> other devices could also face similar issues and therefore, it would
> seem that having a generic facility to scan the devices would be ideal.

The window exists because __spi_add_device() calls __spi_setup() and then
device_add() per child, so of_register_spi_devices() runs setup(0),
add(0), setup(1), add(1) - device 0's driver can transfer before device
1's chip select has been configured. The comment above that __spi_setup()
call already notes that devices using SPI_CS_HIGH "can't coexist well
otherwise".

Splitting __spi_add_device() into a prepare half and a publish half, and
having of_register_spi_devices() prepare every child before publishing
any, would close it for every controller with a programmable chip select
idle level. The awkward part is that the duplicate chip select check
uses bus_for_each_dev(), so it only sees published devices and would
need to consider the pending ones too.

That is a larger change than I want to put in front of a fix, and it
would not help a chip select that never gets an spi_device at all, such
as a disabled node. So I do not think the two are alternatives - the core
change would subsume the declared sibling half of this patch and leave
the rest.

Thanks,
Abe
