Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDFBD370D69
	for <linux-tegra@vger.kernel.org>; Wed, 12 Aug 2026 05:39:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786513164; cv=none; b=WIAdAjWHYks/5Z5gwSXg02cyObjdUMMy1MjKfGRmf6lkgbQnFE+n+EZ1kRiUN6onrTQuDjy7bfO22lvL1K7PyU9hMkCZxPJvgRK74H4P/BS8RDnvTeHKbGqrwqBUXeCQkfWnFJDVOjnrNym1A2hbmIYwIcKQ/aYpOu3wrpuRxSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786513164; c=relaxed/simple;
	bh=rshymzHNkjh9WYmEAoUmyq/eAcpLbkbezQvZS8VArdg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DIaD+6uxXmnyZ9iUdvPwcvDXB5n+RdaqF7N5e1Q0+1vxbE6RQAmUKSIvF+RPQT4v89bkpUHe6415UqPo5gergaAMo/JmKfKss1VcH9I3ZYUhJhhxUb9Wwy+GytXDFX6euySwmhrJWqgev/KyG+sH01AOe04lQ/os96wzA+BMVK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=maticrobots.com; spf=pass smtp.mailfrom=matician.com; dkim=pass (2048-bit key) header.d=maticrobots.com header.i=@maticrobots.com header.b=UHOP4WYk; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=maticrobots.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=matician.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=maticrobots.com header.i=@maticrobots.com header.b="UHOP4WYk"
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-c9cf07d2df6so344561a12.2
        for <linux-tegra@vger.kernel.org>; Tue, 11 Aug 2026 22:39:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=maticrobots.com; s=google; t=1786513162; x=1787117962; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=IIGIocDN60oZirKSz5V0y/eK1WaD8jPpFzqaWatj/vk=;
        b=UHOP4WYk0BPmg+p6vdOAcSssvflwvIaFuY+aZQo9NBB8y25vDatvnkt34R4uoCb1ip
         BkC176M7n+uDj/zuj3L0NPhI50QXzcIhxeBHFxZBrBO1Gm5aAy2Bz5cz8D5U7qer0vPi
         KTYRVSEXKqdJJYt81m/7x08lXOB0mSc7LNgHpedbQQ5nxA6VtDQrPilvReI1fmi7Hepo
         m128YmNJc9NnW1rXAn4nwqfK76jJc5yXPoO+CEW+gziS1hICzmybnea6uT/Zg9JokgvM
         bK5IsJh/7ZstePqq6W+sH8SOy01cc64flxe7Kfam6FkSh7rbOLyemJhTdvu4vf29Fd+R
         1ngA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786513162; x=1787117962;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IIGIocDN60oZirKSz5V0y/eK1WaD8jPpFzqaWatj/vk=;
        b=HhOCQWFxIf+yNpmUERse70TCQAZZk7zI/Q2BxTEWWaQY5XW9l7vGhLqIPF0EDOfiw6
         XNmnPepVgKKJ4lfSJ2zRq6bbV/jHptEMoy9Vqv44GX3JPXDoPQjsfVjPXsjnDnAh+xPd
         lIWp/647iAbNXMsCbeqy2C1BvSgwIJIoMMNc1zQlJl2y82SP5fXx4qUm+9KIGjlabxS4
         oU4M5tZs0A1aIQStpz+4tPQ5HOfIP07i9gLQLOx3QGUR0BUhHUd9CtisfbLcWaqp92ke
         TZkuKkc4PTEftovtmVM1tY0R23BB3DqC37WW54QDzLgjr2f6LT/r65eaA+NlFJE0rlNT
         bNsA==
X-Forwarded-Encrypted: i=1; AHgh+RqrYdWnJvd4TFhczwmd6yWjS9lTEOLw7fF5sylHHXWRrclIch7RMXpWHdlLZax0XDih4SHDKlLypRE4jg==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywe4Y8Cl6EvSV8RgrqbSpL5Y4xQlyE+E+q8SRbqqQ4pVnPwbR1d
	boovvXF+XROwvAL/x6dD8kVrRV3206sFT0Uu6Yt9rIQUcNSpBih35O+BrdPn9gm3wWE=
X-Gm-Gg: AR+sD10We7Kb7D9CagKMX66XBzIlfn1hIDJ+0MIdm4mXu/yAK0QDmHTXobeUEI1WqxX
	4Qj1TEFwxJ9xFCDr1WlI2RWGKqI3HsTQXHbaZtqtn0vCxfn+uOG0261jvu2Qjr2eg2cP/F2Lndk
	gk/WmBQ8cITXlTMC2K6AX76PkMfafpwE7frXqTcBRrXJRKT+Qv5qc/V74W+6lsvZ6HrnnE2w5pH
	Pa0/04OgABipJkXzrHhRdH/A8273YH97wwAfpOxHTIs9w6iNNTl4g94DI8h1r61EhiYo7jxRYsJ
	ASKOrpshFBR9aOX7gbyOGn8uNrKAitmpMVSf4YUfmrf26qtOi9nfCcNWolYR6Dr2i08ZXWIg384
	3WDFOfTUkAVRh+T0Ckk7Q1lWAqr4XSHhK0l27Yj3B/qsHK0RglBu5hc+eN7Wk8telrdj+pYKTIz
	cCZnJ6f+SO54F2wiblYJIrQQ0b/ZNE3nE//wZrL2S4TA5vqJEjq7tyMYKs4GsGeOVd+buyizw99
	tXupcBJRANTs44o2OMS45HCrxvDDv1siZ2rMw==
X-Received: by 2002:a05:6300:6713:b0:3c3:b57b:6459 with SMTP id adf61e73a8af0-3cc3f520551mr2525975637.7.1786513162207;
        Tue, 11 Aug 2026 22:39:22 -0700 (PDT)
Received: from abeMaticDesktop.1020marsh.offices.matician.com ([2600:1700:471:807f:a70a:1a8f:5e73:54fc])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31cf40f9cfbsm5961233eec.13.2026.08.11.22.39.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2026 22:39:21 -0700 (PDT)
From: Abraham Zukor <abe@maticrobots.com>
To: Mikko Perttunen <mperttunen@nvidia.com>
Cc: Abraham Zukor <abe@maticrobots.com>,
	Mark Brown <broonie@kernel.org>,
	Laxman Dewangan <ldewangan@nvidia.com>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	linux-spi@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] spi: tegra114: initialize native chip selects inactive
Date: Tue, 11 Aug 2026 22:38:59 -0700
Message-ID: <20260812053905.70799-1-abe@maticrobots.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <5pH8Hvm9Tn-0PY-swUeCwA@nvidia.com>
References: <20260731030134.4182688-1-abe@maticrobots.com> <5pH8Hvm9Tn-0PY-swUeCwA@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Fri, Jul 31, 2026 at 04:13:31PM +0900, Mikko Perttunen wrote:
> I don't think this is a problem, as the device tree is supposed to
> describe the visible hardware.

Fair, I noticed it when testing, so I figured I should bring it up.

> Why do we need to consider cs-gpios? If a device has a cs-gpio,
> whatever we program here wouldn't reach the device.

To maintain signal for signal backwards compatibility, I kept the
(unused) native CS lines low. Nothing should be using those lines, so I
will drop it in v3 unless you say otherwise.

> The if condition is also very difficult to read -- please use multiple
> if statements and normal error  handling patterns.

Will fix in V3.

Thanks,
Abe
