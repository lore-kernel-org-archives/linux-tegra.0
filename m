Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7E5751D509
	for <linux-tegra@vger.kernel.org>; Fri, 18 Sep 2026 18:30:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.227.141
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789756260; cv=pass; b=h03tTXwxRLJ+SNBUyXe9atM6xAKdKsxkpCx+mSzmY6u94dDFUiT0HHatnxzOPmMRC3B5/+syqNDKYxKgTfi1aYbldcbTDHXf1qecvMdv1TWRgl69jUZTmt4RrhiVjQd6+mKpWiZAY6uHnhdR1RZGwXd3QdRJuzG+QBBp2tP7pu0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789756260; c=relaxed/simple;
	bh=Z3GCDadB22nJ3H8dlp8oFEKsrJ7JLQwFPKhgk/HwR1E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hjZtUbtuqN9FeXB6p/apPC20g3wUSyzdQg/iJlLURtncWfBMphQjwCEh60U54vxqrwMQc91pqWSk6C2zNsoe2ZiroZhcRRDNFnOzQSp6g2E3QlJNE73t+5wvo1Juf4d6P8Yy7fzo67ux09RlxVuSe4Zgd2/RbTTUq1naTIK75QM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C7pXUP8g; arc=pass smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C7pXUP8g"
Received: by mail-pj2-f13.google.com with SMTP id 98e67ed59e1d1-396ccd5cef0so826935a91.0
        for <linux-tegra@vger.kernel.org>; Fri, 18 Sep 2026 11:30:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789756253; cv=none;
        d=google.com; s=arc-20260327;
        b=G/K8MKZfaubKEVUv+1X2eikVdaY6kFSqLr8BceCTLXOInXNJENyM2B7aPtjqpqxc5f
         pHcekxdkLoSE51bqW3WlYSFxKSuqRlrUkwEHwZ+4T9b22Bs/zKq1hwWJblRR17MBSNQO
         UM1PAb8nUu02nHKJajtd5c3vyi55lOc2xsPXR0r8AOAvDilWzOe7y0Kopwp/jPUGSL1l
         XlJkIFfkRDovoqxFJmQUgzozjbkwVzmjcaScDBuY2BHAUwbVQSj/q+4e37LHIcxmOVbD
         JgkLHa4dDX6Em+bOImOfKv1GmNXQOKd3gDi+/yV2df6B/+1khUsjhbnjRuc2N0NRQINH
         RisQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=UthLOTqsgx1H7Ky6X1sMBpSJ/ushOzRSeE2EVOIQouM=;
        fh=1bDgw1tCTt7sk3UBVEDjXY4+rYDTB2fDJvOmML9mdXo=;
        b=pYJMi0VKOUwN/KOqWGqBJB1gPHh0zmS9K98zlvIu4wA2uduXQ/yGtky54x6hrnE2FW
         eyrRYjv1MpbWc1gTSyqGkzHXncLloEviZIHu9n0seg7cWXQOhJbJARJac3IePTWaKx9e
         qellON+W9hs7ZZXMK8XgHylxV9FwprzDVaH+LgJABjNEKRKTF7UdAnWW5MItZOaneCfK
         OqzFkrDT+NW2f7zw2VLrcjFkwYbUWiR0hj8/aWEaIQARQtKdbMYsCcJG6+2/3xdz3v8G
         DYZO20IQQm/9/WSKxJDgrYxXh5v4Z2wz5hZbtiGaQXGfzIeRf54xyzFB19RF6ttOuaPh
         4EOg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789756253; x=1790361053; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UthLOTqsgx1H7Ky6X1sMBpSJ/ushOzRSeE2EVOIQouM=;
        b=C7pXUP8gPhskr6JrmaOqzZbQFyo1KCY0eWKQkzc1OTFuEgVNYdOOrYRvHXw4nvnV9X
         mBJPmUNTK38gMHYRi6phSIKGl4On4aHQGIrh/tv15tmpYc/TdZdWJidlJ3FLVoSdZv3A
         FMoXWk0qCpi8QwmMIh9pp8LuAIMuI+NYcr6bn5YVg8vUm4kSXDfisDdtDWvcU+0buAPa
         GATSG9GzrWjt6/EwRXvdqd5nItW2XnjP5ciEFJ4zvwfY4YLLtuNpZ/+47iKZdFBt2F+a
         GbejvzsiPaxFvUyr4smI7t8qM4KBpFVHBG175O6AcfOs0HAmLG3eoKCS1AFnL6nqubHI
         npyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789756253; x=1790361053;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UthLOTqsgx1H7Ky6X1sMBpSJ/ushOzRSeE2EVOIQouM=;
        b=cxWOpwDGzU/GI+l6A2+PpKZ9XzFAJc7AhxwtKFJ6rVxfPKrU8g+rJlgIurJYhGjwd0
         p2Nmbk/d2+OGEEC4vDNxkfgSXy1zgme3G4fgaE88GGBSf5zJ7TxFBWBSIeRkRICo4Y2l
         eGlll4c7MkUvU8H/BuxY+LnQwo6jMkN+22NrIDJgJitqZFm8hramioY/QL6dSEcR1ND8
         pMhX4F9g+VSLXAaJT0yLrRwXmH3q1v4d75DZ+R34YnG32xC6I2TLkh13zWRNrFi9l9GP
         GfDqX1LbH7VSS1KlpwvU/6tad9LZ5DQs0fWaJ3odZZdwPvtOVEazvHYo8OuvbfK1wiOB
         7qcA==
X-Forwarded-Encrypted: i=1; AKwUvBzNdbfgedajJbt2g+CjkujUvE0uhCDUEKiBIt34nmaq5y4mrAXZ1vOQ0L6ULvFPSANXJJdwaXgG4lvsaA==@vger.kernel.org
X-Gm-Message-State: AFuF++lnvneh77mgTa2EMFZtsjILlVWIKT//nNFqtDVr4XbF+SQOcsMt
	PkegMGji95cD7IFFpqizrxMk6heMAK4+xlK2F205860bN0KSzoi8o4rZgNcd5O/VK6To6QGqmAw
	VUrpGFinwIFV423PfYW5Tg7oABJl57Vk=
X-Gm-Gg: AYBFou1Q8BBz/Y58FaFQ2fq5T72ezWp+QlehcRoyfYeuAI75iqcWrxZxEvNuVdNtnmS
	93f1eCV4ZsOBXEAU+EnlGkQMdoJRVI88hkhZy+5qAY7j7uzqefC13/a0AUxdqzCGlRloe809jKV
	NuaADHRz6f31F0QRowcoXlzUbPH8Jv0uW0TRgsOhJypJrNleFhVBwS2pkJhTp4QnVBQ8wlW79KO
	EH9z8hk6a4cDTwyQpL2tv2uyrcyhjHOZU2mpqrWhXWUSTqzPwmM8QCWqEcbRbgcQvOdR+y03mar
	W3f7ooO8aSGnKKoziwyqNxcGlsB0FQALyKpKwqyCAeiIWTiPaIAJ90PFF7o7CJpv0qynjX0oB7u
	EXfJ+5FNmF1R3
X-Received: by 2002:a17:90b:2681:b0:39e:6c69:f482 with SMTP id
 98e67ed59e1d1-39e6c69f55fmr655165a91.65.1789756253090; Fri, 18 Sep 2026
 11:30:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260918-kbingham-orientation-v6-0-5e8b1f01be29@ideasonboard.com> <20260918-kbingham-orientation-v6-5-5e8b1f01be29@ideasonboard.com>
In-Reply-To: <20260918-kbingham-orientation-v6-5-5e8b1f01be29@ideasonboard.com>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Fri, 18 Sep 2026 21:30:41 +0300
X-Gm-Features: AcwNN1UUuDTcQsQdT6LSC3YiQR-XJenFcyp7p3MxtUdbO4cYi1dTxigUEDSEcPc
Message-ID: <CAPVz0n2pZukL2tnaJef-N=kRiudVLN7RsTjKJJkTqp9-_k7HwA@mail.gmail.com>
Subject: Re: [PATCH v6 5/6] ARM: tegra: Convert to new media orientation definitions
To: Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jacopo Mondi <jacopo@jmondi.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Jimmy Su <jimmy.su@intel.com>, Matthias Fend <matthias.fend@emfend.at>, 
	Mikhail Rudenko <mike.rudenko@gmail.com>, Daniel Scally <dan.scally@ideasonboard.com>, 
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
	Michael Riesch <michael.riesch@collabora.com>, 
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>, 
	Sylvain Petinot <sylvain.petinot@foss.st.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Paul Elder <paul.elder@ideasonboard.com>, Martin Kepplinger <martin.kepplinger@puri.sm>, 
	Quentin Schulz <quentin.schulz@theobroma-systems.com>, 
	Tommaso Merciai <tomm.merciai@gmail.com>, Richard Acayan <mailingradian@gmail.com>, 
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Heiko Stuebner <heiko@sntech.de>, Thierry Reding <thierry.reding@kernel.org>, 
	Jonathan Hunter <jonathanh@nvidia.com>, linux-media@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux@ew.tq-group.com, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-tegra@vger.kernel.org, 
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=BF=D1=82, 18 =D0=B2=D0=B5=D1=80. 2026=E2=80=AF=D1=80. =D0=BE 13:44 Kier=
an Bingham
<kieran.bingham@ideasonboard.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
>
> The orientation property for video interface devices now has definitions
> to prevent hardcoded integer values for the enum options.
>
> Update the users throughout the nvidia device trees to use the new
> definitions.
>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> ---
> v2:
>  - Fix MEDIA_ORIENTATION_REAR to MEDIA_ORIENTATION_BACK
> ---
>  arch/arm/boot/dts/nvidia/tegra30-asus-nexus7-grouper-common.dtsi | 3 ++-
>  arch/arm/boot/dts/nvidia/tegra30-asus-transformer-common.dtsi    | 3 ++-
>  arch/arm/boot/dts/nvidia/tegra30-lg-p895.dts                     | 4 +++=
-
>  arch/arm/boot/dts/nvidia/tegra30-lg-x3.dtsi                      | 3 ++-
>  4 files changed, 9 insertions(+), 4 deletions(-)
>

Reviewed-by: Svyatoslav Ryhel <clamor95@gmail.com>
