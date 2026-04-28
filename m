Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9A923BFE3A
	for <linux-tegra@vger.kernel.org>; Tue, 28 Apr 2026 21:43:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777412617; cv=pass; b=GICBv831uTwdpfihnp1twSxoJiGqc7BitlvcRpCsB10OVSSfK3Cwihv3ZETCGzWPwYaS2OhtTu/T4hBGEgKYrVnycngy4m3AtKW90OpjAj8NPbnp+/bHgeIeQv70WIgz53vwIANysvJ6XIvhDBoyqdVbeMhmzHohTYbk0RfrGuw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777412617; c=relaxed/simple;
	bh=cUgK2Kfj5omPDpTxVPnIw7yYPrhwYT39UaRAh23oDLI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iz3e+OObemmXR4jvzEk/r+SxQX0Mm2XZ5xG7RS55F7Rt7GrATtNp2FR5l3c6UqIaLHLvKF55rpCkLz4elNs4dVQYlmC+KKmtFNsRAMNtlMvz5hYqx2PDXV/WQ+m3BTUgWNzjNtqmEseo7kS2Seu1r3h28a25mYpjLQnQ7f0thM0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=google.com; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=RtM7H2al; arc=pass smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="RtM7H2al"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-488940ccfa6so5185e9.1
        for <linux-tegra@vger.kernel.org>; Tue, 28 Apr 2026 14:43:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777412614; cv=none;
        d=google.com; s=arc-20240605;
        b=BWMkYKY7RWXNmMZnfahBWRfClb2H5v6S+c4F8uisIOWU1tkqApJAGpF++8K9Lh+8Mg
         jdmgABdAgyU7n5ut8LwkMmDJtL8yPrAzWdgYwjdGxMvunUoMjsM/1PebjwE1X/t9kTrY
         qJO4JaduNTMbGyr/DvwLtTZunVtMhNwBgBKE/Yiwt/6BMFZPLbqxBGbCll3sUmY9aDAF
         6G/Smk5urUTA6+fRt8JdJtOghDAgIpzTveD+FNqyGY7qHs3MN8/XhnBgE48Iq03VgU4X
         fSZPVq9BKm5WIBSe2GkXBbzx1p/ETXnwWfOCu0KSzSzvqAbp2BOUaY2LEbnYVZPZbKQo
         uaNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=cUgK2Kfj5omPDpTxVPnIw7yYPrhwYT39UaRAh23oDLI=;
        fh=7fHxu4/Jo/xmlpP0vZGT8xXZJWTPaD93MsqbYZLuRxA=;
        b=MX809Xo7NESbjImd3ovuizLdfavwYz70GLQf5tl1RPHsATe/tWioEHJkGHsJKeUMxC
         JK/Ep96hE1Vf3dJIZsP5zc/DdE/qWwmh2qJut27zfTuswbiUfaMwjmsM3zLIwC8lAWZ2
         6bLs00MgfIKMxtBjazIsRMW/y5OhvwMyYKfjioO/oATy7NlqM345LyaF+HD0DQyU7NkB
         u5GWRjcBZuyWAt59lvnzFCYl6IZ2UV25OyJKhZlBg6cWJy8FtE4ffFNwpqxN7g6sieHV
         7YIfCPdlZvJmv7FFG72lWjpq7iolacuwfqQPJJg+cMOFQZFcJ3Fw0UUwXTaAzgayOCeG
         BQtw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1777412614; x=1778017414; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=cUgK2Kfj5omPDpTxVPnIw7yYPrhwYT39UaRAh23oDLI=;
        b=RtM7H2alnCMVAaGDmjy59M8Gwp7eHD+fQMMsYihCog4+AGXfK+HEf1d9LmCx8gykeo
         +/gs4xjnFFUbOndufNdp/L7rxB22zO6/iacal+Nr09pUF0lPUltc1YOd/d5VJ6Wqr34L
         D3cjV4KEF/F3SUm7t5OOUIBIDgK9rMqH6Dys0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777412614; x=1778017414;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cUgK2Kfj5omPDpTxVPnIw7yYPrhwYT39UaRAh23oDLI=;
        b=g6iTo2LXKn2kBs32N+fIp49nP7vt/C4cTsvt2f6OvS+ehC1p1NvxB9zA+RWa6YxNr3
         z7kGFP7DKi28hHfpFT9Tke6h+Guz6X+p3LWj+xmQgO0DFre22Y61itUsJkf921Soy1Hx
         mluLTmwmxaQnOOOvIj4nlsJhfZVDPKrL5Vvc6ClUv6Bdilg+IRvtW9NYeAL4L0wgjcfm
         yaEF6rEakFCrEj928OTF9Pm8EaJnjMY9PepCLXbRuiEQnQm9yaARhfH4ZhNNA6HoFlmS
         +DxGCIq3q1PM/xz4Im46Q9uGI+KQciOsFUd/xYf7+vnUu8hhEsUu7jWGsMSe5J6IOhl6
         Kgzg==
X-Forwarded-Encrypted: i=1; AFNElJ/nKoLHKDheLRKi4SKo+YQ5ipm6HqSNI+yhGGlFWt5s1Dj4kSn6mwBXpntCVc2tmcCiQL7tVmRhAYWUXQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxoUU1nndz1BgV9wvRCkr0Zb/9QsuQAAUellhCGAKLok0Hl6tc0
	TW+9ScsMdzxmlzyQWWBA3eluPOMh8xfKoIK/XWwrR63FIKc+0GbIl1R1QCz19joSbzk4b+PaP/M
	1iR0505VFo/dGBMb1SY+jNFabSggpbKp3mJp2pc3K
X-Gm-Gg: AeBDietxOqlGzVxfnCHmnDF2mxZEnuZ25+XTr0QA2i08VouUp9tyOE4Shj9Ba23ZYb2
	O8Srf2mxnbDKNuyqwry5Me5/Yq1YJEV8m5g+jMd21bOYvnbZf14G6UMBHlcWutgCJFq7RwmdEdb
	Q/0w9+F0QFf7QAJ7vLqfz+NrXuSSh86QMokKcjfBKejReZQVdZxN9qa8Idt+ZmZe5U3Pj6H05lJ
	ivdDkz/6X5iACqT0zaY46pDpWfcfc5iUxihOBJvujYQACmQfO8vEZJZPlKjgWjizaGJIPlVDJmO
	xIGYPfLgpaZxdmmbn0+cPIr3pbFRM++n06fF0p9LtMKCAFVRkkDGoEcqTQ==
X-Received: by 2002:a05:600c:530c:b0:48a:5f32:62d0 with SMTP id
 5b1f17b1804b1-48a7ba07d5dmr322355e9.12.1777412613805; Tue, 28 Apr 2026
 14:43:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260428200712.2660635-1-briannorris@chromium.org>
In-Reply-To: <20260428200712.2660635-1-briannorris@chromium.org>
From: Julius Werner <jwerner@chromium.org>
Date: Tue, 28 Apr 2026 14:43:21 -0700
X-Gm-Features: AVHnY4LgrR9BMoyPVl-dbhODH2S76f3l5WcQRNgpXekO-MzmQp39W8EwHdrUnso
Message-ID: <CAODwPW-YuhQxyGSeahp8+i-bz_hAvPQQCNWxaZCjrbvkHOQa7A@mail.gmail.com>
Subject: Re: [PATCH 0/7] dts: Add /firmware/#{address,size}-cells to
 Chromium-based DTs
To: Brian Norris <briannorris@chromium.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Thierry Reding <thierry.reding@kernel.org>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Heiko Stuebner <heiko@sntech.de>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	devicetree@vger.kernel.org, Doug Anderson <dianders@chromium.org>, 
	linux-arm-kernel@lists.infradead.org, Tzung-Bi Shih <tzungbi@kernel.org>, 
	chrome-platform@lists.linux.dev, linux-rockchip@lists.infradead.org, 
	Julius Werner <jwerner@chromium.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org, 
	linux-tegra@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> I reviewed Depthcharge code history and found that this problematic
> bootloader behavior dates back to at least 2014, with the Tegra/Nyan
> device. Older devices may have similar DTB structures, but I'm not sure
> if they have the same address-cells problems. In any case, these changes
> shouldn't hurt even if a device was not affected.

I can confirm that Nyan was the first Arm device shipping with
depthcharge. Note that the Exynos devices are all older and shipped
with an old fork of U-Boot that probably handled this very differently
(I believe they had `/firmware/chromeos` but not `/firmware/coreboot`,
so they wouldn't have had a `reg` node and should need no `ranges`).
