Received: from mail-lf1-f68.google.com (mail-lf1-f68.google.com [209.85.167.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7A7E30BBB7
	for <linux-tegra@vger.kernel.org>; Tue, 10 Feb 2026 05:04:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770699900; cv=none; b=HqXayYMhGdwhajFpkmflK18dyOeIcKfDaqWqb8My9z+WRvkjKo7Uv+2WppdxjNo7opdUNsHvV301lpSK06BXKv5HE7+bwoguNCsygGQOXAsKT71LzXPNH3weB7+KLes9DwwCwj7LKsozLNV3oeKLy3PLj7u31v+4wOE+Z5hdev4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770699900; c=relaxed/simple;
	bh=7kr8C/N3CZVrMfJa6+I2EsqoPuIOtVrtV5QgiZixCsM=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=oba/ecj5Z+LhNS+e6Ei9lWoqtABEnf84841GCRvN+FhMMy5so2WX0H0hpmH/MrxXdQgI7OAg7ZSKXHCzuZmWmBq1i+WsPNxUOVJ2wlYqnaetoW5fu9eQc+E0reRUN0CqmREjBrAHE2NGzYSRR/+Kn7mjGWmEH+bYL3S4DZTQVJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RicI7NXW; arc=none smtp.client-ip=209.85.167.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RicI7NXW"
Received: by mail-lf1-f68.google.com with SMTP id 2adb3069b0e04-59dd4bec4ecso455985e87.0
        for <linux-tegra@vger.kernel.org>; Mon, 09 Feb 2026 21:04:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770699896; x=1771304696; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=FVdcfWZz2bzAb8+1BZcSv1OUoO1wFXkBe9mPhTK6GsM=;
        b=RicI7NXWvd6eK1wIHuznIZbnt7AM67DqU7bOGnQ5y2eeLkJiAerehbiSJc5jauq8OP
         3mpk3dybcIdHKdryeXf5EgksAbYCPQUsRXp/UzaY+P12tOiNa9CE/mxVKnhUWvSASFnD
         bB31MuvaIKAjzpiv5vErMgonvAsRTN6jF79IDyePtnn3IcHgby5OLN/o6VXcPy6IoHGe
         q8NXl3hgLUipQMFogk8glVFJ9RsDJ9jnZHWKeR/WQhvH/JA/9oHD+PK5rwD26XWMTZzn
         8fq4tkT0DW3NMhmSXTjUpG/mr7WSGuHYNKJEi/nf6Ithcz4LLzIn3jnIHBJ6eyHczj7Y
         2YSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770699896; x=1771304696;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FVdcfWZz2bzAb8+1BZcSv1OUoO1wFXkBe9mPhTK6GsM=;
        b=pzp5E10IkD0UqOiiOlK07KWbnBCGxLjOKwsJ72UATRG/3IdJbApSzWtdJa/n5hzPi7
         Kji9m9+vCOeJyEZ41NKKUYtD1BhHaAWnlVIDxe2InPJF7qTkT/P6qkTie/CORFzNX5xo
         sfMDIJK5WJ2wu9+Ri3ISfp5idUg7V5T7ZgmpUlhTsNoKhvmkgB9Voda9Y3JeMrxEDDP/
         YjGyd4FdY9BLKWEo5yUQfSEoI39cJLicjW7qJp+yI5R2te61Ht4jDKdnRQHzQT1R1PZB
         LSj71umZkVa0a8M5GYzvytkHa5wu9bVE5QYCdVM5Lz+RySjh08kIrzimcFlw0rSoD7qG
         KBmQ==
X-Forwarded-Encrypted: i=1; AJvYcCV4mNyz1wAaI83uZvfbaZpqslSAjQeEDZcpR2+ny8JtAHjHVSx8vuaea6y2yyH9f59XWHlDj96Yovs3kg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxyWuz1pUzhIH/pznouYWySlLB3dPhzuYOitzRy3ULZBKQc2zpG
	ujgl4tIHo0SRk4IRTPpmsm4oykytM5Aof96jOgaONr509gEvK9wsZmhr
X-Gm-Gg: AZuq6aK1jIFfZM5PXUEqcIZtEKCvP7la36EX7TUCc2bs8a4GdYI+e8WcvyRoZJK9tJj
	n2fXSsu2ZEvqxcoV10g0sxOSjquLkxnPExWIkYfEgByOEWoIY3HcR/zWLkNxiWVRyWlRYs3eGuf
	BMD3blc8f3LWiUVIsFB5jGE5OSA7IOXbCNMk2aWGUhQjbD19c+YnUkUGoUyogtEWDDAxqHSKipo
	nlifocDu3hwXwfQXScVeK7Pe/tyVTNTdA8zs5MXhSVRR+a6DcfLXggkpnHXxJ9V/OTi5uLW8Ica
	fM5fHtbW2OFwqM1m16X/EnFgjLvF3fX1VFKMr0Mw4zuwhhNSoSol4hPODuXWhuO9MV2Dl9DgDq8
	wVHkUGYytRbJUfEKetL6AqP0j8mNQ/pnQC/umZuwSoT4aPwZfYTSDpSdIaTD8zEYLVvKWxELtSF
	tac2RhaLHC/RpWvaMpZenobVchV7oj/QE=
X-Received: by 2002:a05:6512:3da1:b0:59d:f545:f2e0 with SMTP id 2adb3069b0e04-59e45044500mr4242646e87.6.1770699895590;
        Mon, 09 Feb 2026 21:04:55 -0800 (PST)
Received: from ehlo.thunderbird.net ([178.137.233.16])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59e44e21c94sm3038956e87.74.2026.02.09.21.04.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Feb 2026 21:04:55 -0800 (PST)
Date: Tue, 10 Feb 2026 07:04:54 +0200
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Rob Herring <robh@kernel.org>
CC: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>,
 =?ISO-8859-1?Q?Jonas_Schw=F6bel?= <jonasschwoebel@yahoo.de>,
 linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v2_5/5=5D_ASoC=3A_dt-bindings=3A_nvidia=2Cteg?=
 =?US-ASCII?Q?ra-audio-max9808x=3A_document_additional_board_pins?=
User-Agent: K-9 Mail for Android
In-Reply-To: <20260210024846.GA2385273-robh@kernel.org>
References: <20260206173423.145954-1-clamor95@gmail.com> <20260206173423.145954-6-clamor95@gmail.com> <20260210024846.GA2385273-robh@kernel.org>
Message-ID: <7338AB2F-0FEB-4AAC-991D-1FE33E03B32A@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable



10 =D0=BB=D1=8E=D1=82=D0=BE=D0=B3=D0=BE 2026=E2=80=AF=D1=80=2E 04:48:46 GM=
T+02:00, Rob Herring <robh@kernel=2Eorg> =D0=BF=D0=B8=D1=88=D0=B5:
>On Fri, Feb 06, 2026 at 07:34:22PM +0200, Svyatoslav Ryhel wrote:
>> Document additional board pins that may be used in routing=2E
>>=20
>> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail=2Ecom>
>> ---
>>  =2E=2E=2E/bindings/sound/nvidia,tegra-audio-max9808x=2Eyaml          |=
 5 +++++
>>  1 file changed, 5 insertions(+)
>>=20
>> diff --git a/Documentation/devicetree/bindings/sound/nvidia,tegra-audio=
-max9808x=2Eyaml b/Documentation/devicetree/bindings/sound/nvidia,tegra-aud=
io-max9808x=2Eyaml
>> index 241d20f3aad0=2E=2E4957645a8e03 100644
>> --- a/Documentation/devicetree/bindings/sound/nvidia,tegra-audio-max980=
8x=2Eyaml
>> +++ b/Documentation/devicetree/bindings/sound/nvidia,tegra-audio-max980=
8x=2Eyaml
>> @@ -35,10 +35,15 @@ properties:
>>      items:
>>        enum:
>>          # Board Connectors
>> +        - Speakers
>>          - Int Spk
>> +        - Headphone
>> +        - Headphones
>>          - Headphone Jack
>
>Aren't all 3 of these the same thing?
>

From=20Tegra ASoC machine perspective no, it exposes each of these pins and =
each of them can be used=2E

>>          - Earpiece
>>          - Headset Mic
>> +        - Mic Jack
>> +        - Int Mic
>>          - Internal Mic 1
>>          - Internal Mic 2
>> =20
>> --=20
>> 2=2E51=2E0
>>=20
