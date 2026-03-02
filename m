Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E2281F2B88
	for <linux-tegra@vger.kernel.org>; Mon,  2 Mar 2026 08:05:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772438723; cv=pass; b=Z/PmsfpYAMrlf0fH2jrSIDrytQyCO2BcnqlajOJZ80IxCWs3zB9+THnnXzIoXOegAKLHtYu3OUOHirrEAmbkxVvTq2F4VwlPoS/gYVWpOC8GULerxJmQUMumx/Vu/L8zqA71OhWIdr83aqmXL0Q2HxOTV86qFrwugTNsvVlgNic=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772438723; c=relaxed/simple;
	bh=uY/rLn7MxqPwGi+m5ZQtM3qjDoRsnCBjHmzawfcVFy4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NqPJZWAj1CFIFZy8VmV9TOQigPQV/YGz6jL1Y17z+CmOpxTHJDX1eUtyFA0kLsrxMwkzLhqw6QAdw6KT+MrY+ZOv9/0CKoEzsNUUCWJSXi+FwLyuPah1OejNKdcy2t86ABAVSDxH6mwzPkSWnMYW4vk/lVWUgyKP9fUnrpHachU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YATXMO89; arc=pass smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YATXMO89"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4806ce0f97bso35190675e9.0
        for <linux-tegra@vger.kernel.org>; Mon, 02 Mar 2026 00:05:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772438720; cv=none;
        d=google.com; s=arc-20240605;
        b=X9ErjOahsEgfacEM+QJhjtdIZlA2wqqOyi5yjh9WvZ7rDlaU7Y6wRnazsbOVpUVX/x
         mJ4p/Li/ix8k5x4257vb/VRXodBKcNfgrfcdXLZ0IKJBSg16FV5deb5dwLWddlfini+h
         p53HXmUQDdDSzj1aRUUUdmhfEslSA4n/zjJ8icT37yo89CrkHLQDkrXQGGkj2a2P66Yn
         CjPwaRkbWlOZi1eCCXADBGHcG9oZXCTSARAT+2+2XFEf/saURtl2z+xLhs2C3sCv3JxQ
         Cr2zUIkV98lMUFax1w3yIit7/IQXBgih512/I0+NN8j3SZcQsaolUT9IHvp3yegqzEwF
         nfOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=dCYuDzhjJBNoZbXZeQzRxSVRy99nSlDkX+Pj2ZFikhM=;
        fh=6ZTa3ANbILlP08tA+jR1gVpEvLy+Vn3oqKmmd8jgn3Y=;
        b=h87vfP459l8RTisXAK+KZLJWHIzWXME/UMPCZQZXZPi39ofLPzJ3WE4prOv2787hnC
         QRtay0LzXlHmB4txp/R6aP4qpLGJxHl5TN7ZdJmmN6G2QzNleD/lm3pJEO+D5mOpsT7G
         TeexkHkF8fTVlDgy80QY3di+CrZoMCl6PMIWVJtmz5xDzSkBqNVckCT0M1vZ4D256Dwh
         mOKjVbUOvNw/zbxBY8lDQaQyyar8Vt4MhLtzIK7OoWcW12+PYm9uN0V0qXwprgxFh3Ji
         dO4HF76+6UK1GjudBkFkNai4ttc8mf8dMszLa0P3YzlGKk9Gmc9L7tbsuNLJYyCAA932
         bumA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772438720; x=1773043520; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dCYuDzhjJBNoZbXZeQzRxSVRy99nSlDkX+Pj2ZFikhM=;
        b=YATXMO895j6TWsy8ZbNPwqb/mIAh39kpqi5isveOWmk1z4ikfBjAEPBqeA13pyGIT5
         jLkyV+X183OvDXHKvdnjxXfts0VcSU76HrtAYr0C/77qkNb+VscCWuAFAJqrSsUdOinI
         3zgIKNs1Z5eXi7uHyAkGwiDVeyAx6J8kOIQ3kDKRqJv8mfRmc4/tmhXUpZ8oc1ese5uB
         4WMm76q7/bpwQx0eZinWi6eUr4CgVNnudN73kLyRk6wb4fk69QnacT26UfcG+z/jdBem
         Hq9SPChRcFwsfPX3qcoAvH3Od5cX0JW4yHWHc7O00NVxW4GE5ouqfLWNIPjSXlYltaBN
         wHpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772438720; x=1773043520;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=dCYuDzhjJBNoZbXZeQzRxSVRy99nSlDkX+Pj2ZFikhM=;
        b=Dx7cjArJOIQ4xoNF73an/qx5EVpvZIczigP5JtG0AramxpYJeaID6+eGlBsOP/m/r8
         xXhr0z3sNZazUz9czLkWW2XywIwVtG9fc+/bCjTw1Lw1xIP1llli9Lh9hs9vHNSZ0Pco
         M5YlxKPA21T0ZdSPxXW9UgXXWSt4s49xc6TsQg4aCO4RVggUsNflGw3RizPOtYM8kwdX
         1Taewnr0YaOM+NfvOXnBYgQ1NJkeFu/AbYpoSXubB08N97OEbhNOJ0/8I8fuRCtrFkcC
         1+xwAOH2t4QeF6ZSYEtzSUzBu2/2G5Oo30VLuTUz1oxYNHYTg7VSTqeieMWxmrasMFjO
         27pw==
X-Gm-Message-State: AOJu0Yy1Dpbc5uUwnalF2npFEtO99Oc8Qci8cd7Bk+QtcOQglFkuNhZ+
	q2PNeYPPMP6ID9/YeSaHVc0b8t/yg2MRoscHENNGUFT0JbSdKddnQULHNu+xZIDBoBII/awi3SU
	YyIUAzdYcq6SGnmSg1oxDRXklRFrQP+Q=
X-Gm-Gg: ATEYQzyvSmEUc7atuHXv1F4IBQQLjczL8w9VIkb7nm3m6466A7wSRT/RHzXsTN+Zd3H
	3ZNqv2L3BZ3X49cv9tpGFB24OyA9HcDv9roDW7yrsE3uAUAsGyl2OX9SgpuZsY++7p6cPnzEeSN
	jzoMvM+j+mI7+s1I7C6b8FVH1OzqfQobOX6whl3s8mPbUrSlVd6+JYurHU1TmJiFSnXx9fZBa0L
	BCj9DIZ3A/MT1+sVJsJlNKqTlGsXtL4+H53DyJbHmS9j+zG1PcXohfPxastruTz9bjNe3/D5Hpf
	N8nwJpPU8uPbjqAlfbQ=
X-Received: by 2002:a05:600c:8108:b0:477:7ab8:aba with SMTP id
 5b1f17b1804b1-483c9ba5fe4mr184918465e9.1.1772438720300; Mon, 02 Mar 2026
 00:05:20 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260126190206.78270-1-clamor95@gmail.com>
In-Reply-To: <20260126190206.78270-1-clamor95@gmail.com>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Mon, 2 Mar 2026 10:05:08 +0200
X-Gm-Features: AaiRm53xsG5yx8XhFwhx2GRqK9qMlMuaEpIerBA9utjGyDVCekHeYpnJIy04YVs
Message-ID: <CAPVz0n07bbe9pKJirZXxnqE9Nd2Onf001OhbXY9opYrOPnRPnw@mail.gmail.com>
Subject: Re: [PATCH v1 0/1] soc: tegra: common: add Tegra114 support to devm_tegra_core_dev_init_opp_table
To: Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Mikko Perttunen <mperttunen@nvidia.com>, Svyatoslav Ryhel <clamor95@gmail.com>, 
	Dmitry Osipenko <digetx@gmail.com>, Thierry Reding <treding@nvidia.com>
Cc: linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=BF=D0=BD, 26 =D1=81=D1=96=D1=87. 2026=E2=80=AF=D1=80. =D0=BE 21:02 Svya=
toslav Ryhel <clamor95@gmail.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> Determine the Tegra114 hardware version using the SoC Speedo ID bit macro=
,
> mirroring the approach already used for Tegra30 and Tegra124.
>
> Part of previous patchset: https://lore.kernel.org/lkml/20251125120559.15=
8860-1-clamor95@gmail.com/
>
> Svyatoslav Ryhel (1):
>   soc: tegra: common: add Tegra114 support to
>     devm_tegra_core_dev_init_opp_table
>
>  drivers/soc/tegra/common.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>

Hello there!

May this patch be picked if everyone is fine with it?

Best regards,
Svyatoslav R.

> --
> 2.51.0
>
