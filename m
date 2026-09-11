Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A13E485939
	for <linux-tegra@vger.kernel.org>; Fri, 11 Sep 2026 18:08:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789150100; cv=pass; b=hrCAj5KCHVygh1CKbD9glVUQOuZJwnLnHexD4MTylkF+S5SOBMRjNUikwwSTF59fzsgJuy+bf0tJqA/9Exlw9jzPBl2FSB8mRie3RXRU9ywahQqTEHDOyTtxBXw1e5t0ukPIzJZmmqePZVCgEY2/gKzL0MYnBlE3FdCphj0r/Wk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789150100; c=relaxed/simple;
	bh=Vhnjxh1HDobVuiEJYIJm79PAu7Y1XNjwuISN/rF7iDk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rnigH2OB6qj+imjtIyUm7AC0ADqVrDBAvEoKsRb9LoLTWPjW7qQSisup82ekVuf2CbPJ3wJa0f6lM7RoEd+NZsy618H+4TlERk1UAVrl7RYnw9xF/dU+uNH9pStEn+ZbT8squzbSZFvwUJ199FiGVr9Jc0RxdQhA7qP4oO4n3ZI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l0qPQ/g/; arc=pass smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l0qPQ/g/"
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-3a5a0703ae7so7524921fa.0
        for <linux-tegra@vger.kernel.org>; Fri, 11 Sep 2026 11:08:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789150096; cv=none;
        d=google.com; s=arc-20260327;
        b=Q0S4i1XX4TLEyLPbEPLc0hKitHhf3KyIhhxRka7xsw71PGkYoPJlfm8AI8Rm11d5Sp
         ymjX/a2T4mczoUOfYKXU3krDTGFlqi3hXtNLnQVZ2vjduXqW6xApS9J3wMlMtAHOCGAD
         vzhggDAJIEZZeuZMoFYO6THVrCMlWjgtnOYk4mf4jukPjgnGo9ZXQqVFND10oJ8BHDTZ
         8L8lEI1+ovbL4QxTzTM5qdkasmNpoY7kbkPYXIfJp5qh9twSqjIqebWPkJ8Zv0xIr1Wr
         gKQb2cRO1jDMZPZzstfVBHlr354uabn01ATfaTF301gSqbajw9eXZFOVr/52CyMCuGZ9
         84Mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ouJPu2UO9j/yOvhcg7Ue0/AOuAhMQTW9jyKxwu22jHE=;
        fh=pCVQVGnh5n/Q3CHvLj69s/AwRZ6+VI6bCF1uEHn42jk=;
        b=SH1GgjiAXRuve0CbvRg/VHxQ30kJFADqjGfFMpVyuY2lGorKPFt63PnpzIBc1DuVO7
         R1a+/s3K9PVTsLm/7GsCDoorsxYcUlxSXfVk+Q+TtGIVahCd2uPjxfnD/H0jPD/qeroz
         zft6A1VSSR/pJaqawZOOWZ02FWg5aGFoid+RVOImLhmjL8/EQIaO6k1Uo2D7TbbLXX57
         F3lIoUfCK+Ij6lrPVscfrfmm9EMHHTe/841gb3L4cDRV3UnpIDB+DKa+RGufptWJ6YvN
         Adsu0cNvF3G2AS29KluLn6djSQOZdJx9Bk0lIFTiXSuGDkO2FooBUTmp0ZVJaajIHmJe
         FuEw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789150096; x=1789754896; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ouJPu2UO9j/yOvhcg7Ue0/AOuAhMQTW9jyKxwu22jHE=;
        b=l0qPQ/g/9zteRf65RiOvlykq67P8LZojf6F7srr+GxW/54c6ya0LMwC+JFGKXATtak
         dN8oRvm2KhXDNlep6q6U5Es6JPOed7l8DGhuD1OUKLtNUFnq9qQhwpqqvf2oSjGdTN0R
         g0TDYyp/3MxYhE+6c82CddRUnOr/350/xZEZAOGMcC3vBWL/YvmVpN9xwfM4UMzs5rQJ
         4om9UOT3SsfQykIIu9lBa5xQWYdAyVuxBSec9m/VFunbJw/GdyaJcg+PVNCCoLe2iRv4
         ZZSejNEFGvBQC8wLkadmN2ms6lL7OzJ47qtgqte+yn8249T3Mu79zqPO370w7p+idzUM
         zUGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789150096; x=1789754896;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ouJPu2UO9j/yOvhcg7Ue0/AOuAhMQTW9jyKxwu22jHE=;
        b=G3t6TYR0a/lM5m1Rg30DhQ2/eBFvmsJ0dHYCNWI1m16XEAHbtQkCX+WBV/2LmVY/DL
         d8UvMz0iFM94YlfsvF/I+W7v0k23V5x+EBY+4xrbwmtB+aKzP8K1NI6+hfEnm0fKkojN
         +9Q48W2hBrp/f320mfe9UdDSl/zvpnQhab8wQ9S4p05kZxaNKwJOXL/jMQzKbE8gSCH2
         OHsfntNfcQigdXmH6FKaBtDtr2g8XSX2sRkBo6YUiYKSXuehMYTu93x9jayMoAOoRUC5
         i48WfuxbgGmGvP1YNzwmgQbdr58xwDw8+52wjfxQ8oLlJ0qN3E2TOtnpCl4d1mcs+8RO
         ZcUg==
X-Forwarded-Encrypted: i=1; AKwUvBwtFZCu54sDpxubUzxmWlHfbnV1ruZFxTRttjWAaQ3MGEKKhkVwV4YSa3nxYoa8jWPV3o+ntItQ+xXm7g==@vger.kernel.org
X-Gm-Message-State: AFuF++lBgwApo33nZzBu0+siiDBE7dTy8LjV4I/NIg4F3xnwAJZQFujE
	/fTHwDDcYrqaEA46Bm7oD+Q/oktCHiO5LoX5I32XAIB+9wsYreNL1vB+rHm15tYmaVU+IG2zirS
	1JYBX0rqeFGbdivzFa5MDtgPeuB0X59c=
X-Gm-Gg: AYBFou2GUwzveuZSSUreIwt78tgp7iJEr0ObEXhCqWFPmOJwMFuQMVUbcbivkF57thK
	zcYPMeBSDM7otJzELNn6qpbJHNdSrbNeTz3F5nyf+WGVXMGuQrFeegYRAp269HJoJRQMXHM4qDE
	ajs1GYvmiyA9aAOYhX2fP+3JIZmpzf+/AbfKU+Gcs49Hgtuehy9CDaxTb6aib/HG206u1j7uvTX
	91zD92DxqnnazJW7s364NMNMpddE1p46A3qaaUMjh4aqdYKxfx5OqMN/aJ4bxKL/eCu3ar/rdSl
	nu4sLgF6s7VVBowYC3w9MR+hNnjjOPO3ejPvqfCAVENQyLj+8I9QKFC/011BHcpXm7Sf3FNptkq
	w5/7nWXPS3W9zctD294tDyzf3aMvAKZbeikeF0WX56d2CFsmJzC0sUQ==
X-Received: by 2002:a05:651c:4cb:b0:3a3:3fa3:25a6 with SMTP id
 38308e7fff4ca-3a591060d33mr13539661fa.3.1789150096131; Fri, 11 Sep 2026
 11:08:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260727-t210b01-pmc-v4-0-af68a21cd746@gmail.com>
In-Reply-To: <20260727-t210b01-pmc-v4-0-af68a21cd746@gmail.com>
From: Aaron Kling <webgeek1234@gmail.com>
Date: Fri, 11 Sep 2026 13:08:04 -0500
X-Gm-Features: AcwNN1UL3Y1nd704u2MCWStPUxYAt0AKVH-AFaP-s9fmNKYucXoG44JF7P_CHrE
Message-ID: <CALHNRZ_i+yBeYqGnp8PGfpYdT8cU8ah+8qm3O2vpoTtEmUx-=w@mail.gmail.com>
Subject: Re: [PATCH v4 0/2] soc/tegra: pmc: Add Tegra210B01 support
To: webgeek1234@gmail.com
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Thierry Reding <thierry.reding@kernel.org>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Thierry Reding <thierry.reding@gmail.com>, 
	devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Alexandre Hamamdjian <azkali.limited@gmail.com>, 
	Thomas Makin <halorocker89@gmail.com>, Mikko Perttunen <mperttunen@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 27, 2026 at 9:00=E2=80=AFPM Aaron Kling via B4 Relay
<devnull+webgeek1234.gmail.com@kernel.org> wrote:
>
> This series adds support for the Tegra210B01 SoC to the Tegra PMC driver
> and documents the new compatible.
>
> Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
> ---
> Changes in v4:
> - Add venc to powergate list in patch 2
> - Link to v3: https://lore.kernel.org/r/20260722-t210b01-pmc-v3-0-1c5b970=
788f2@gmail.com
>
> Changes in v3:
> - Update patch 2 commit author and sign-off tag as requested off list by
>   author
> - Update patch 2 commit message to describe the powergate differences
>   compared to t210
> - Drop sata powergate in patch 2
> - Fix has_io_pad_wren value in patch 2
> - Link to v2: https://lore.kernel.org/r/20260720-t210b01-pmc-v2-0-ca5317f=
8507b@gmail.com
>
> Changes in v2:
> - Address sashiko report and drop duplicated structs
> - Link to v1: https://lore.kernel.org/r/20260717-t210b01-pmc-v1-0-bf776be=
8b3a7@gmail.com
>
> ---
> Aaron Kling (1):
>       dt-bindings: soc: tegra: pmc: Document Tegra210B01
>
> Alexandre Hamamdjian (1):
>       soc/tegra: pmc: Add Tegra210B01 support
>
>  .../bindings/soc/tegra/nvidia,tegra20-pmc.yaml     |  5 +-
>  drivers/soc/tegra/pmc.c                            | 62 ++++++++++++++++=
++++++
>  2 files changed, 66 insertions(+), 1 deletion(-)
> ---
> base-commit: 1a1757b76427f6201bfe0bf1bea9f7574f332a93
> change-id: 20260713-t210b01-pmc-1a3f8b908044
>
> Best regards,
> --
> Aaron Kling <webgeek1234@gmail.com>

Thierry,

I see other things going in currently, can you pick up this series please?

Aaron
