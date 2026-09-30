Received: from mail-dl2-f33.google.com (mail-dl2-f33.google.com [74.125.229.161])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98D0A3F23CC
	for <linux-tegra@vger.kernel.org>; Wed, 30 Sep 2026 06:48:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.161
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790750933; cv=pass; b=MdwWOSB78SJ3saSAiAfzB3IciJOz6Etx9uAUMAfRTfsLfYMIBjOrLx+Lc2BRUbIRdY4z3OM44lGUMhAy/IWl1Qg4iPrGxmsJOJrMY3LN1wUCathK00PtxXEdu2lxwtdiTKVpT/rFA2N4FlPYSQYGDa0/uj0XQtFGVVe0AD0pre8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790750933; c=relaxed/simple;
	bh=POsdw8DAXZp9P24GbQy3+qEg0KQpZiuwyetUPJ9VFEE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=R4itNo2GAoB63yemXYlK7Q/tmtncGDgnXESTrHo84NRR1XMCbtM42WbUeqOzp38LkCHKEmR+BIm3OLXRKxbrSl6iSW/md+2cOpaZf/nSNd1xr/9T3BXD/YIwjQ6mrqJXzhfyEn/OC0alL0ncQrTSkFVdAadnlja97L/dFYPJhlc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cptktljN; arc=pass smtp.client-ip=74.125.229.161
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cptktljN"
Received: by mail-dl2-f33.google.com with SMTP id a92af1059eb24-1438e88300cso4848386c88.0
        for <linux-tegra@vger.kernel.org>; Tue, 29 Sep 2026 23:48:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790750923; cv=none;
        d=google.com; s=arc-20260327;
        b=lO9bAUgTqTv/m2pDQCeR9fzCjYVX2cy5qxYJz08f+Hm/Kjpj32olgfCtWZtzKwQCRT
         084Xaba6qAq+4799H02uSPJ1s7Bnk1jp7T7wyUr6zoDjSzlx+JRpHGMzch6MPBLAFYOS
         ZOt7GYNtGAhIQtDt/o7+C3nV+zuR/ac0lZu7XvxnTfRYNnY1nUylVQJ7MiVcf6xQMiV3
         EDdTjAyvUM6PUsIFMdbiLyVQQNzRf9qXBlrJNOzXHkAtQE9bL8bGb2Ua7kzj+A+6Swx6
         HEJvOQ1Pa5mmvZwZ9Dehk9C68CNii8XvAxiqDEUhI968iRu6sNKN4++nrJyd+O7n8oTu
         wp8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=X1t6xV4OxZYPdZ6oDbVsMlrNR1plVN1+LMd+89a6Pg0=;
        fh=T41FlkOEzJpKpdm0aiuP8UzV+ZRPeGnppDzRBl1OSaI=;
        b=FHR9f7dT4/l++LoOff/94KcSVaiE/J2FXNY8s0RbDf3XeNb/4tUkNXBJSaGKKBIwfF
         zihgBmiIMO8A+uNu1POk9DEn/ZVwViU7KSnjQSgAQQgN68Kevk827huf6Aie00I/wMi6
         7vbVgjxJ2lrU1bS513iCYBy+BwEXjHeVGjxOSmzyFVQMm3cRaMjVovZy5/v9J2+aqzb1
         aZlhnxsrruKLGc672ICxi9w05v7kzyRO1p2joQ3/dN9YLlaDd3TCPrqY5wQzzX/6Cl+g
         clVpmiIAWcTbdllmgs3CFWuvTGR3LP+4zxueKUMOb/k3Rg+r/uiu4k4o2XXpzQtQ/HeM
         J/BA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790750923; x=1791355723; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=X1t6xV4OxZYPdZ6oDbVsMlrNR1plVN1+LMd+89a6Pg0=;
        b=cptktljNQWMPFuJCNZJCkD0VCVQK8thkhVYiu6u696VirmK2DkKI+uYBMOYJA6beLx
         akkFJNzYMOFehH4so7ta0elTCy1P2JLde8PyvxPCqpIgGZ5AyhBj/TuaAnOit6C8nXrr
         2Pr0OFqlnEdPCcAFyJm1h5N8AmRbYgz3jeu/4hufEznZ100BKxVyoy5Q40P4CBEO4His
         K5iF4TVmI45p+6JultrXSEh/JS+FxmZS/MbP1GU78Wlzl/TcdXFAK52qGU45nfapgZej
         wGgPuU1ToLmUe/xos0mdKaf1fctpC0Fggf4o0FgdwKx1V9Pv3SAQH9aJOKUrHviaJ18Y
         lWyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790750923; x=1791355723;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=X1t6xV4OxZYPdZ6oDbVsMlrNR1plVN1+LMd+89a6Pg0=;
        b=QdICTlRd/vMBrzq/FroNeVlnfWdVW/MBPYQDuozRQXIisLfm3899I4VkqfKFkcY9oB
         efVYihotGtJh6cYvv1cqH+jx8lnbpiBIGn24eKLGokM+nkMtJAudelKhKH4TJdqHRUog
         ADQiTo7W1CtaHDEK9lAKSDZCGRZSqIIy3bXUM3gY7ya5kURjMQ9QDg7PhOhK89/tmInq
         4dxIKOYWkuYBsMT2JH9+wIhAtiNuwkMg41F8x8eRr5y+4AxEJb8Uu7P1TuEERcgFhm1Z
         gR/wvb6ZohI/cDS2BJNJ8y1Xt4sSH9z9hMufw7Irw4FgAvWwqJUoqdrYvjA4wJ0waLBg
         /cMQ==
X-Forwarded-Encrypted: i=1; AKwUvBzcO7IBS+7XpKBlX5mUkd04e6N4ewQdCCc8QMSmB7ehVezzLetgxn6qosO8zt0fo2bBw/Mva15mz6dqZg==@vger.kernel.org
X-Gm-Message-State: AFuF++nX9TQCmRywGwNPMg6hlCj/RCpofGl2wmOpNgOe3MXGHYXB3StY
	+wkDaHnu72hNEqseoWGV/OdPcNKwF57gvVJYIFfcSNveWD5KTbFcvv+fBlI4aJVwSmdGdvDg65X
	iVye2NSUmnlOeffjtuc4mtcfVQ0frwtY=
X-Gm-Gg: AYBFou29dqX/H3HusmVhW9AqOGAKdm0vS5iYamQm83BzV6kk6Ly5dkeL4VPbsgQ9wOg
	l5VJp2EDLdMjXoGDCOSj7dkHSDjovwJABh5M44CeDl6l1+n7VDh2jvBd/Dew2wqL/I+WtbeHYU4
	HTH0khWnW/rUs7T0lU6OGNvjVIprPFakQN7iPF9p8be00A1ZigHAJtUDCA91wV7xf13YzCGpT4j
	pl3hMapRD4eAp6NWqvIjUlq27uwPsFxyewf6G9yXH1n5NWI9qK3wLLxmKVeNTOUh+u1LqlWexkq
	EYRvYXnXkO9ona7qd7h7kAbkA3VYNfVJ3vnqbalD4vmVR5j4ReMoiGnvoOa4+1Pjhh6QiLJo6pN
	S9NPk5y0NgpBc
X-Received: by 2002:a05:701b:4559:20b0:137:5b9d:cf87 with SMTP id
 a92af1059eb24-14d2d8b87c5mr350558c88.0.1790750923534; Tue, 29 Sep 2026
 23:48:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260930-dalmore-fixes-core-supply-v1-1-4bd87fd70b0d@nvidia.com>
In-Reply-To: <20260930-dalmore-fixes-core-supply-v1-1-4bd87fd70b0d@nvidia.com>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Wed, 30 Sep 2026 09:48:30 +0300
X-Gm-Features: AclHuK8RGEIMLDdvt3o3LTWf4pTCoSeW_y63rIuDyjNVFqdJQJDqKc5Xp-ebQUA
Message-ID: <CAPVz0n02==Zq3sZvW3p_pPs7RUASvP0koWNjsAZY289gqnNxxw@mail.gmail.com>
Subject: Re: [PATCH] ARM: tegra: Add core supply for Tegra114 boards
To: Mikko Perttunen <mperttunen@nvidia.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Thierry Reding <thierry.reding@kernel.org>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Thierry Reding <treding@nvidia.com>, devicetree@vger.kernel.org, 
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D1=81=D1=80, 30 =D0=B2=D0=B5=D1=80. 2026=E2=80=AF=D1=80. =D0=BE 07:11 Mikk=
o Perttunen <mperttunen@nvidia.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> After commit 4cc90d4c043e ("ARM: tegra: Configure Tegra114 power
> domains"), a core-supply property is required in the PMC node.
> Label the core regulator on Dalmore, NVIDIA SHIELD and Tegra Note 7
> and add the property.
>
> Fixes: 4cc90d4c043e ("ARM: tegra: Configure Tegra114 power domains")
> Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
> ---
> This skips TF701T since there is already a patch on the mailing list for
> it. Tested on Dalmore, but not on TN7 or SHIELD Portable.
> ---
>  arch/arm/boot/dts/nvidia/tegra114-dalmore.dts | 4 +++-
>  arch/arm/boot/dts/nvidia/tegra114-roth.dts    | 4 +++-
>  arch/arm/boot/dts/nvidia/tegra114-tn7.dts     | 4 +++-
>  3 files changed, 9 insertions(+), 3 deletions(-)
>

Thank you for catching this!

Tested-by: Svyatoslav Ryhel <clamor95@gmail.com> # Tegratab/TN7
Reviewed-by: Svyatoslav Ryhel <clamor95@gmail.com>
