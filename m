Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794953734;
	b=s9ir8OpDeIgt68anpP28xVsf+/9oEg4yV0cvo4W9OidOHYHpoBnTlmP+iy0vxfAeuntZ
	 +LoSVVGIVGdz2r7xkqAGB6gzfYL6lmToZondI+aXfX8sFd6DIOf4Cn8lOUH5Qx+npZZka
	 RBNJObivKTaaygZxabdFWWG17sFUGYWwSrtuhJEYxyHj1WcJTqpJ8zG8sdEnNtKFyL4cf
	 aIjLBYOHZYzVM3Xdu3iAmo8rh6GD1uFpyvFcb3gGuz3V20+QuAxU/HvPljzBE6UfXgNyS
	 966D5GoOcu/dRhqKVf/jEYVcPdWf6zBjr3ouiNg5mCo7m1BCfopNpPQpqNvQhMYK6tQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794953734;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=AFP+oprX2JfHEH4/+I3VRIaXxkKhreRWUhH9rG04Zmo=;
	b=Uki25xW98ifqntzffW4+XM6yT9x8fuwuoBqybaylzD3AwZ1AwJTSxnUTxx7mPt4wvzpM
	 cWpUXZvlzzO3HHVfXaTD+daVtssdLfllgXruJP3S4GKaE3MLOTfeDrGmRsKGwiu18FX/c
	 ytqwvq3qecc1XDBeS1g/OU3Bn+blpEMtl0E/YlhjtM/8Bi8+7SrU28Knpxxab/TP1UEfq
	 hIwtu2n6C7NCnGSBUpE3GFJkufSc/o+KwKsyWslDi9aVqt21GsumkPS5ZXTPdaYL0mOX8
	 d9NYnRTZ2U569W/cRv3X8qcvF5ZHKiflgG0+/vpKzIm54f+Tnu87oilz96VBMeZT/rg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YlofpBdx;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F1B5606A31C
	for <linux-tegra@vger.kernel.org>; Tue, 17 Nov 2026 22:15:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4F1B5606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YlofpBdx
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4bb64ef5a00so2551875e9.3
        for <linux-tegra@vger.kernel.org>; Tue, 17 Nov 2026 14:15:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794953733; x=1795558533; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=AFP+oprX2JfHEH4/+I3VRIaXxkKhreRWUhH9rG04Zmo=;
        b=YlofpBdxcRIXvu5cJ/kkVBkDOJ7x6iCSTMHuNVHP14QSPtUPXkfJOLBtKAG2vYvKHm
         FKWooWNn4U+Dm9hxOxobcBNiu5Ap2+m/ZIMjWDMeJ3j5+j0t2v5Q0rEpkElqlduz7tJu
         UHtZvrPa0EPYEo8OanDAubeBaOZsSK1kdZFstCfuNkA4kRzIXoowloKMC8jv+rLFj75z
         2PdwO1nVZ7+BdkzwSzG32d25RAzNVyOWkrDv61rYSZ1wn+jZu66rXIlKTo2SLm1uQLfj
         U4UNt27YC3Eh8G2ivlLGyi7lEAD9oay6fFH96Yo/J2n/MECh3a8LdAuZZNPMcKscap6e
         K4fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794953733; x=1795558533;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AFP+oprX2JfHEH4/+I3VRIaXxkKhreRWUhH9rG04Zmo=;
        b=GrwmDBfCEZCrvXeJs9GvPLHyjgJZCmECtqF9rG+2kUe7/CeQflSBvT+RfRvHa9Smmz
         sGyl9CsHYwH3l8p5KEEjt8O0o4YJtPPJq4cPEZmQLtAMRx+ywnqetd4OikPQVeZUbDer
         fMW2eXdJu0H8WelfVLo0cUSOWpxMchvO/izadmBAIOAoTci8Nrr0e5SwyudAIfji1KGm
         CZS3CXFSF0UGcTdJ09/X2sw5w7PMl1BOIBeK2YNkGG8V1QzY6ujayYXRkfIIuZEOVh+I
         AMHbqbeGyD1pa0NDJRn2zAaXhrYI+2gemJf6t25BvLu2ih7hybJp4ZdlKOrmpxRj7kzb
         iOqQ==
X-Forwarded-Encrypted: i=1; AL+hErE9W6fxWoVw+ol0I573AVs1MC59IvPWMbWLP48JdRvouNwjJZQIKqr0BCL5EtvbFN/4CasFTb+EYHwsCA==@vger.kernel.org
X-Gm-Message-State: APuU4Z9eNc1eD4EY64iKLOM4Hi19SY//zrYqnUw04Ahc4HYSoC2fianU
	9AkHKrPzFR6tnwWaf0DK70JG10n+gFeadSdEPMNYpLIm29bwxe4urgB8
X-Gm-Gg: AYBFou2GUw4iZmvHh3S1FUkWyji8UNq8ORSm1b87wLCFCBFOmKnvNGrMjy58+OsGZAu
	hVc5e2Q7Em1wRyUQ0/QhcdAspZpzzbYFuijw8cIpdfEYxXvT4rkmcRgtRr6trei1hGFlxgi56YY
	l0qxsvyO5X5NoXWfifixv6Qse3ImAh4tdQkxk+iR2tUV0FtAjzuuwIEviAzrhDhLj/n2a79si7C
	Sy+OzxCGqz1zzXC8LevoEQsyuVhnYqnAliFp2uFBDxl5PRZDLKmZbsdAKDY5EunfLRgR7xM13q+
	oQ8mR/B2U5MTu72gnFZCvcywhGXfREPwKQScfZVNbV9JtW7oTkMnSkENoGIkJwiML0IMpeROJt0
	XDCP31g0xQhknUu9Dcsvsw/TkA6xYZsw++ul9wGUxb5hWiX9Py3iHQmJczmCx1YOPgo1zSxlMRM
	e/o0hzBgnIBWQs8LwZIl5uJW88hgtc9mDiOcAeEaJVURNkqemssdPMVL4Lt+Mx3RWnK5i9wicA0
	thjz2o5q+5KDNuGznaU+AY5DxaNiUcKz3tlE2JV//4bqaH8XLvjp+BWeeSm17q45jdZx+uitANB
	4tTUhLZd/Uy2tgL2btkVkedxSLTZbepPxMgqW6B7nTZmsNlYffmuheXt5yxFh1NbwQ==
X-Received: by 2002:a05:600c:698d:b0:4bb:6947:3e1d with SMTP id 5b1f17b1804b1-4bb7da2c0a2mr9913865e9.20.1794953732442;
        Tue, 17 Nov 2026 14:15:32 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb783f7eecsm171197495e9.3.2026.11.17.14.15.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 14:15:32 -0800 (PST)
Date: Tue, 17 Nov 2026 22:15:31 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Manikanta Maddireddy <mmaddireddy@nvidia.com>
Cc: <jingoohan1@gmail.com>, <mani@kernel.org>, <lpieralisi@kernel.org>,
 <kwilczynski@kernel.org>, <bhelgaas@google.com>,
 <linux-pci@vger.kernel.org>, <robh@kernel.org>,
 <thierry.reding@kernel.org>, <jonathanh@nvidia.com>, <vidyas@nvidia.com>,
 <cassel@kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-tegra@vger.kernel.org>
Subject: Re: [PATCH v3 1/2] PCI: tegra194: Use FIELD_*() for register fields
Message-ID: <20261117221531.26d6e0d2@pumpkin>
In-Reply-To: <20261102092238.3917883-2-mmaddireddy@nvidia.com>
References: <20261102092238.3917883-1-mmaddireddy@nvidia.com>
	<20261102092238.3917883-2-mmaddireddy@nvidia.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Post: <mailto:linux-tegra@vger.kernel.org>
List-Help: <mailto:linux-tegra+help@vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-tegra+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 2 Nov 2026 14:52:37 +0530
Manikanta Maddireddy <mmaddireddy@nvidia.com> wrote:

> Several Tegra194 APPL and DesignWare register fields are programmed
> with open-coded shifts, which makes the register programming more
> verbose than necessary.
> 
> Use FIELD_PREP(), FIELD_MODIFY() and FIELD_GET() at the Tegra call
> sites where values are shifted into fields. The LTSSM state constants
> are converted from pre-shifted register values to unshifted field
> values for FIELD_GET().
> 
> Suggested-by: Bjorn Helgaas <bhelgaas@google.com>
> Link: https://lore.kernel.org/r/20260515070753.3852840-2-mmaddireddy@nvidia.com
> Signed-off-by: Manikanta Maddireddy <mmaddireddy@nvidia.com>
> ---
>  drivers/pci/controller/dwc/pcie-tegra194.c | 137 ++++++++++-----------
>  1 file changed, 67 insertions(+), 70 deletions(-)
> 
> diff --git a/drivers/pci/controller/dwc/pcie-tegra194.c b/drivers/pci/controller/dwc/pcie-tegra194.c
> index 26e2ac5c5869..62bbfcefe6fe 100644
> --- a/drivers/pci/controller/dwc/pcie-tegra194.c
> +++ b/drivers/pci/controller/dwc/pcie-tegra194.c
> @@ -51,8 +51,7 @@
>  #define APPL_CTRL_SYS_PRE_DET_STATE		BIT(6)
>  #define APPL_CTRL_LTSSM_EN			BIT(7)
>  #define APPL_CTRL_HW_HOT_RST_EN			BIT(20)
> -#define APPL_CTRL_HW_HOT_RST_MODE_MASK		GENMASK(1, 0)
> -#define APPL_CTRL_HW_HOT_RST_MODE_SHIFT		22
> +#define APPL_CTRL_HW_HOT_RST_MODE_MASK		GENMASK(23, 22)

Changing the value of a constant without changing its name
is heading in the direction of a a recipe for disaster.
It doesn't take much (eg a partial backport) for things to go awry.

David
