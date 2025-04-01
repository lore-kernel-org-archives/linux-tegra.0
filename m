Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E3CB1F0E50
	for <linux-tegra@vger.kernel.org>; Tue,  1 Apr 2025 10:35:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743503725; cv=none; b=dKGxwy9auibZr3xwjYf2HDQmWqU2R4lOWVpF7BpUpKB8ajD5UWTZ3pK2Phb5c9fV2p33z4krxpuEjCCtBG3WzDGSr2ahqvbwetgD498M23AIZ4eAijPC6jr+8xwmy6td+np0+bLPrh9wJp+Y5UGVFD5XVCy2BI4cFF0k8dLUp/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743503725; c=relaxed/simple;
	bh=bB0Q88NaQ1z3A+sAKvbKfweAcqrwjXi0SB3rHqKzM6Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=C3PJ1d0BUa+Lz8XUvK9cXqcFol3ky59q4EGwfRUugC/KGIXP7UeTRJPu8Tn5eSF2ajvcXStMhbfbFCxXi8nmDJ+LqBF/Pf9Dh/Cg2eRlGH4OanChZP/SQkLwDCWh+e9nNo8E/LZhSx+louNrI0UuFasI5idY020xqvYihFm8QYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yZ1uhco5; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yZ1uhco5"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-43690d4605dso36725095e9.0
        for <linux-tegra@vger.kernel.org>; Tue, 01 Apr 2025 03:35:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743503722; x=1744108522; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=094SZ9fz+o6eVY5ZaePMpljZ6ZXESAEN9w/PXff7gsU=;
        b=yZ1uhco5TGtEt2sLKCs3eIpdEgSFHue7Jj+dZdYa7Rt1xGwOKaWeP1mP8396IbKqwv
         A+D6SPh4U0lihS14ZhRUH6gzU9XXq45ErLmXw5Jwcf4mHP4G0RyU7FWP89TiBXhCwF8N
         ZuRPDTBsY5fP0ut1l3A3os0q6Vi2x6DQ375hbaOwcrFs4oojYius9WU/5yh+7Hf1s8bb
         sFWHjRFicJvwoSQNX7wMERcj3BxIGUzylimyxNWxiXQHqFK6j2UuZ/R9g1TtHzfavJff
         whXSpypw8SWzmbLOn3KvRPfHhSClzeelxNSNYWJ8GHCP3z/wRGUzO7HIXsBUV3LcqWD4
         mxfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743503722; x=1744108522;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=094SZ9fz+o6eVY5ZaePMpljZ6ZXESAEN9w/PXff7gsU=;
        b=Fa8QXZ5PS0oOEWVsHnYNmyAylgCLap56EJhjWUX2tXXWgrbqqoad0Dgr6WbXMNTWrS
         GsPaW4wC87SaTRCk07eU9lVMdk6RwuN+hq+snXC1ET1SOjrArZfsLjpkQmDSuieLoyTR
         BKqOmVvMOEWpj/6CFn2dTrGr2Kc9vEPUv/eFKIH/TEXJRHWYvump+BGgsEZdrP5ttU7R
         kzYKsPSJrBJc845lnSDGXVYlypvitdhKownGSkUinw2OSNH9U4Krp88R5O3LXKj+mGyZ
         +wIOntdt/qCIxBix24nbP7LNHa0WWQzgEuLJPiX2SWm//sLPUyWUtMLGVBlxiymJK0qz
         s6LQ==
X-Forwarded-Encrypted: i=1; AJvYcCU1yqdmubvOwn5x2TDwriG7P95m2hkgLdnTDJJWv5j6HEayGHJUDa43r/YbKNxZfKh5hvr+VQnprvoXvw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwMNxm/0a+SejXaqR1TApxsvb4lYIabVb/LzHKTwEqVN6NukRmp
	g9nx6J9k5m9pv9VNEqvM9S5S9N7UaQasD8lWwca4U2pdXMxIUUTlWLCxiWoCffQ=
X-Gm-Gg: ASbGncu9FaV0x5wLiX3yO8NtvePBPRE9XSb4Ke6L0uBEYQcpNPgCf3SH03ATqC0S6sF
	QilcEMh0hf6HrFk15kQWkVHwe8kXEfD+S+g0Qxd0CDbZQ2FJPSXRK6J4Go+yOwGW6ktStGxgfNj
	9V0uhgSjHwp3PJiK25cFXQbDWnLQTpfhBUvghDiRRZx+O0n3Nkl7TkxW2eDpTGT7aEjimnH+tLl
	JbDn8/EWlJdLN1uemTmpoRMT/e2N8XQCLhtpqWm302Vy0ZzhOyest/W6bGu1Pl1gK+ELUySJYEX
	O2exZbNG6fP2+Urdf386V0ClSDhf1EEzlmFc3n4Rt28=
X-Google-Smtp-Source: AGHT+IH0MYFlI+kNZ16n6YuowDwZDpAgl0lcpbfUtl1S5hYwQqcUs9sspCA+WvoevEZPVnDHgpx5gw==
X-Received: by 2002:a05:600c:4e87:b0:43d:8ea:8d80 with SMTP id 5b1f17b1804b1-43db61d5fd2mr102696825e9.5.1743503721639;
        Tue, 01 Apr 2025 03:35:21 -0700 (PDT)
Received: from myrica ([2.221.137.100])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c0b658c87sm13912049f8f.9.2025.04.01.03.35.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Apr 2025 03:35:21 -0700 (PDT)
Date: Tue, 1 Apr 2025 11:35:19 +0100
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: Joel Granados <joel.granados@kernel.org>
Cc: iommu@lists.linux.dev, David Woodhouse <dwmw2@infradead.org>,
	Jason Gunthorpe <jgg@nvidia.com>, Joerg Roedel <joro@8bytes.org>,
	Kevin Tian <kevin.tian@intel.com>,
	Lu Baolu <baolu.lu@linux.intel.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Matthew Rosato <mjrosato@linux.ibm.com>,
	Niklas Schnelle <schnelle@linux.ibm.com>,
	Rob Clark <robdclark@gmail.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Tomasz Jeznach <tjeznach@rivosinc.com>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Will Deacon <will@kernel.org>, Yong Wu <yong.wu@mediatek.com>,
	virtualization@lists.linux.dev, linux-arm-msm@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
	linux-tegra@vger.kernel.org, pierrick.bouvier@linaro.org
Subject: Re: RFC iommutests_: Testing software for everything IOMMU
Message-ID: <20250401103519.GC2424925@myrica>
References: <5zoh5r6eovbpijic22htkqik6mvyfbma5w7kjzcpz7kgbjufd2@yw6ymwy2a54s>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5zoh5r6eovbpijic22htkqik6mvyfbma5w7kjzcpz7kgbjufd2@yw6ymwy2a54s>

On Fri, Mar 28, 2025 at 10:11:13AM +0100, Joel Granados wrote:
> Custom qemu device: pci-ats-testdev
> -------------------------------------
> To support IOMMU testing under qemu, the pci-ats-testdev [10]
> (different from pci-testdev [11]) was used to emulate DMA transactions.
> It is a full fledged pci device capable of executing emulated DMA
> accesses. It was originally intended to test Linux kernel interactions
> with devices that had a working Address Translation Cache (ATC) but can
> become a platform capable of testing anything PCI/IOMMU related if
> needed.

Yes please!  Maybe "pcie-testdev" rather than "pci-ats-testdev"?  There
are other PCIe features that are poorly tested at the moment, for example
PASID and PRI. The programming model of devices that actually implement
those can get too complex so we need something simpler to precisely stress
the IOMMU driver infrastructure. Driver unit-tests alone aren't good
enough for exercising TLB invalidation (DMA after removing a mapping must
crash), tricky cleanup paths (eg. killing a process bound to a device
that's issuing page requests), runtime PM, MSIs etc. I'm guessing testing
newer/future features like TDISP would also benefit from a simple device.

Some time back I needed a device like that to reproduce some tricky races
but never got round to implementing extra PCIe features. Although this one
[1] is based on virtio any programming interface should work as long as it
can instruct the device to send precise DMA transactions, ideally many in
parallel.

Thanks,
Jean

[1] https://jpbrucker.net/git/linux/log/?h=virtio-dmatest/latest
    https://jpbrucker.net/git/qemu/log/?h=virtio-dmatest/latest
