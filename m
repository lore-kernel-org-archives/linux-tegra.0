Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.52
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794556616;
	b=xuS50NJ/bNz9KQ3a7myW+uw/6dVsVFEgJCwFw08DZVmfBD8XfNd288Gd1wdZW4RhlwHs
	 JwV1+mmaTt+lG9eGzot+Jsw1kTMJ79dtk74Lt/B26sbNtIDCG542RDWh+mMOdoyU4ZkRk
	 nbEeWZ5cFTtbW3OEOY6rNgozVEbTB9Hfc/Rqo8Zm0H19bxOKv8ucYEjFrxDx2AtOQE483
	 Kgyx9ZCoSV9EA80Us+AWOlKlPBWi4/+T0XeF5N7gfgPaeof6muf448udYG8vnb5VOdbna
	 sx2pBPeJiS1UEb1D/lkbODjbv7UdUogVggO+k6RS1Ufay4yUQGuCDq25iuUmUooq48Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794556616;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=QeSYZZBSKoLuliFiah1nYjHZ50+xCIiYrRcjsFJbOlU=;
	b=zklbVcy1I3K8nPoinXt0tVHfkCYhHWHmnYxdmHgT/Q1LHZpmKHWQVEIYH8GIplv+0PxB
	 s/vYm8pqB+DtscreR0YDxwZ4IcVfp8RdikC4kelwmwBU2BuVrzPXONWaMdMcnNBTL4BF9
	 I3sH23ra/8KZYGnmlNMop3/fdhtiEgY2H66wBek0F+7czQtU/4xQiwWLUc2RtEkBnBVdx
	 /50J/22axc9gfQ5thgiXwrdaU9FG2DIzp1tq55BeuvyirP7pJ2XrZLBaWo+uT5Kn4OpyK
	 uKATj2C0iDtzBpO/sO+MZ4N7zMxrJvQA1Mbu9+/2gTsdpDqTA9K9dSx8YapKxFXNG0A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CBJr7R2y;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.52
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E57D606A321
	for <linux-tegra@vger.kernel.org>; Fri, 13 Nov 2026 07:56:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4E57D606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CBJr7R2y
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5c00c727a21so63704e87.1
        for <linux-tegra@vger.kernel.org>; Thu, 12 Nov 2026 23:56:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794556614; cv=none;
        d=google.com; s=arc-20260327;
        b=MnW3co4e3075PO+xOJseCMRmV2cMzMPHuaxDyhAPsgLpJKFn5rczhUB6azA0AVb1RR
         4ZJ4aS9Xkh4yiFY8+DW5ZSRJoCRJQrfqTyrwb6q7lj5lLW8SDkFpVtz97WGbOMHwf5iJ
         QcW1eU4W+WFuKuyFQqQg/FYcbS1qEzEg2lrr+p+NmYiT0lc81Bylb/bW/gFSuJzfBeFW
         YUmGjtXHMwumfp5ygPoLKZqUgMXu9PbSYtuA2YImDhAo/8LXIA8Km/ScOIpbSgKjjD0h
         phzbAAPPkZyC97XDi1cv6fo/eU5xO1WAeyjewm9jRwEpLOtPiA9aevPCYgO5K+coY1S9
         g9aQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=QeSYZZBSKoLuliFiah1nYjHZ50+xCIiYrRcjsFJbOlU=;
        fh=nubVew9dnkoovZe+99V4iTwkitkCEGL2n7z//xnwoNc=;
        b=I6jZ0WbXD/ZgjvilX7CzNia0w8KL0oMs1lMWjlUY6hsWkYEI6Wlu16h2YHP8KmL/dX
         SxHrFN2ChptOJmMddfaTrd8MV0SE89M2slBg6vZ2756Q6Jr5PZ0H2p5I1hTG2i/PKp+c
         rL7RNqVS/+skQgU4p0RgNBsYh8F0NQY0A5RPYcAvhUrstAhzdSUoszXpqLCkS5RhlM2R
         28TXwEH8W7rupzA0zHHhwhbsNKwYYIThoX4/y2UQBOEUZgd4LNQQEFdhSE1VLhXkVfZI
         kLYhOBLaM5s/oScB6ftBdGAPZScCHwA/1ArPIFntJ/8+9NnDPPUioGo9sKTAqlFZfQiH
         W2dw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794556614; x=1795161414; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QeSYZZBSKoLuliFiah1nYjHZ50+xCIiYrRcjsFJbOlU=;
        b=CBJr7R2yumTXlwKpm3buCCEXKSx4vvzEG+tobO474AayJFPLRrUgSgnirLigWOMWi3
         IrhHMsBLA2/rREUCo+VW1hhcGyAHhWEYaFUPTBiwyNSiyLUQvXe1beWuFclCM8lsH258
         kDmTpl1kbGIhCr9iepM9MV4xUMcMi1kue6HgYfPp5fsvHF6p5/TRmlK5RMtC/CXcxIEv
         pwmqBVDCiwOEZZZ7YVVXcaSJwEa3wl68DNM/IGWDCR5N4Y567OhzFA0NoE85EiL9BER3
         n8QTqsUvz/N6ojrAtvT++5KxQBtI6V8Bc/Jmt4K3XepdgmuKGOaZT4FluTdlCfNszfhE
         wZmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794556614; x=1795161414;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=QeSYZZBSKoLuliFiah1nYjHZ50+xCIiYrRcjsFJbOlU=;
        b=mjGABF6qll12xgGJm8W2u42a9nsfAV6Q2jeyQJLhMwsE9tqSAZgjkftknYKhwIgobp
         VT3Uf6tjhqD89WPjve2+BENgRblR6MACc+dJZezHFW3mworUBFqspKNehrQdP+pN/wVk
         guNSQg1uD9BkLPFKm2pw4LRgj/m7AsJSvgbmJLStGWI2sUAahLIbNde0GP1ziXmBxMtu
         aIyGzqyBeyt58WseeF8ennUzK6VQ/EvAZ8aaQOHVFFzPS8gSlUmthYjJaXxXVyP8WJYP
         xC75T0Fq84wtk3n0ObuwPEhNxD0FNGjS9veEqjotJgIgzLuUOxjQODHkPBLaOLzTYoFK
         ry8g==
X-Forwarded-Encrypted: i=1; AL+hErEuBP3n3AvEimKbUH8jP5QZLG0tGgkgO7oQexUSMlHtf6tNUj6kcYERygvSKKUXIinYg7g87OXqDMlh+g==@vger.kernel.org
X-Gm-Message-State: APuU4Z/evs/1DaUCNriuXjRP9wjVM/swReiAYURmInnjXa9BjYV/+v2j
	I09p8r2ftsiPvYL549LLsx5alHcpooWBNzejBheYlqKBZaCqrknjdvWGprblVvkYURM28cX0AWi
	5odn22CzKCGChO1bgH58BVmeGG01QWXU=
X-Gm-Gg: AYBFou3njJtrde2+ZVTH58r2Y0YpJg/esL64w9HvYcCxag/CzpfcOVhxKDunU+CNCF5
	zmg3ieojyOy0H8HxLf2z/ASMaSB+oF+N+qAF3Bru96G96wOtGQqNbrUXU9O1NzMFQBlbUtwobzg
	i70YE3cn8RqwbjobljcorSz868LG9O0CuFR98kfIF3Unwf+R2U/ffpffX4MF5PVJxcydwMaCBOE
	APo2lFF8P0O7ctcRe9UUVRjK6jyyGAvJtEfmaD9/i4dPHn6qmROwetnWWBmvwD4XU5/3IUNi4O2
	vaYuR8x+zj66SnzAKkZR3niUQKVFDfsgrCg/W4qNwIdtM03o6IjTUD+aILYkfriaLrsam64tfnL
	6pAUkAAdCmtC7pmpb8g0YlKjxZ8EqpgO5n93nsw4l7uVrf6QmOkFNKlYyXx635KipY7xmaAU=
X-Received: by 2002:a05:6512:39d4:b0:5bf:a48b:7827 with SMTP id
 2adb3069b0e04-5c1705f074amr884635e87.2.1794556614399; Thu, 12 Nov 2026
 23:56:54 -0800 (PST)
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Post: <mailto:linux-tegra@vger.kernel.org>
List-Help: <mailto:linux-tegra+help@vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-tegra+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261112-smmu-cmdqv-leak-v1-1-7ea8e34277ea@gmail.com> <avXBEbkBJ1ZMZ00B@google.com>
In-Reply-To: <avXBEbkBJ1ZMZ00B@google.com>
From: Arun Iyengar <aiyengar1990@gmail.com>
Date: Thu, 12 Nov 2026 23:56:42 -0800
X-Gm-Features: AclHuK9R-O6Gj916v_Gk9doDaM56nfSpW5aT6J15ATtqrTQAWDgJ4XngFSKQD_c
Message-ID: <CAEy9hNX8j9FUrZBOBo3aU41RSif3_MvtSQaq=eY2yXTK2yxJnA@mail.gmail.com>
Subject: Re: [PATCH] iommu/arm-smmu-v3: Don't leak the CMDQV device on a bad #iommu-cells
To: Mostafa Saleh <smostafa@google.com>
Cc: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
	"Joerg Roedel (AMD)" <joro@8bytes.org>, Ashish Mhetre <amhetre@nvidia.com>, Jon Hunter <jonathanh@nvidia.com>, 
	Nicolin Chen <nicolinc@nvidia.com>, linux-arm-kernel@lists.infradead.org, 
	iommu@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-tegra@vger.kernel.org, Thierry Reding <thierry.reding@kernel.org>
Content-Type: text/plain; charset="UTF-8"

> IMHO, it shouldn't be worth it
> to fix as the FW can do many other harmful stuff to the kernel

Agreed that it only matters with a broken DT, and it is a small leak.
I'll leave it to you guys as to whether you want it.

Arun
