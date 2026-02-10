Received: from mail-lf1-f66.google.com (mail-lf1-f66.google.com [209.85.167.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 791CD2DECA8
	for <linux-tegra@vger.kernel.org>; Tue, 10 Feb 2026 06:55:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770706535; cv=none; b=fAOygj82Pm9WInxyOSQ/+45d3IKF0+zjaG1esXQ8Xe9vVaYmfW7RjN3ZMQ4pW/gwnbWh1sSxvjjzPqR1bzdUCKWCrV2HJka0GtdFq9mzNM5XiP4/RBlrKiRmu1xIh2qWznMsKpZj75wRTn5I4giR0a9WdOWGVb7cyD7+wopjfdU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770706535; c=relaxed/simple;
	bh=35j7QCKr7CjNoYrKsWuIp3cK/z8O6HH27ymSrJiQpvs=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=OsqlaKC4o26WhqizVEcKaYSuz/e7TitDZ41tN9pXOGJnOfPDTBAgGVZulRY7LXL/dnlxU1flDGi76aj+VU6Bqef/9iVYmkMMfazCrAG7tK3o9bAnHp90I1vq8OL3lPQUpxYLeciFjfBXNe9O8310qV/YBJxOIZmLdukk5MwMK9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UUpxDA4F; arc=none smtp.client-ip=209.85.167.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UUpxDA4F"
Received: by mail-lf1-f66.google.com with SMTP id 2adb3069b0e04-59dd7bfeb8aso6297077e87.0
        for <linux-tegra@vger.kernel.org>; Mon, 09 Feb 2026 22:55:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770706533; x=1771311333; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=6UuS3rFdbmBg/Ac9hnd/FWadZClcyql0U6id5zi3Xzc=;
        b=UUpxDA4FOGlTnP7R+Hxn2Cdir5piH1950PPRlCQigXEUQzwDPCzTq0YpT/UDdnIrHR
         Ktg+9DqSr7KqdDAWWzIs1CpbY+RJZttCOjSjdO6WzRIBB/aVx+KvP3WTizYSFUhg5Pkr
         8bfyir8Q8QUl14WSJ9Afrj7g4NmdZ2zyLl+XR+6Y6jggk6rWBVo+bc+SkklET28SxZZy
         8+BgyyQVHb+Qb2ZHDgcur2jfp/KawAJNCOopzzMR/gyyUpFpA49h+nptzAksqIv1+C+m
         8Ziq4Rj60OQICk0WRK7QQIhLq3Rzo89lQusODJN/pQjU5Qumj/axFVZgVTJIjig0Lkre
         f/Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770706533; x=1771311333;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6UuS3rFdbmBg/Ac9hnd/FWadZClcyql0U6id5zi3Xzc=;
        b=gMh4ufyVUqggVEKgfFiafnFCp6jgfXvlEjspPSan0p0YjGuOlOn8g/y/g1ZWDakBZR
         PSnU3DKkKQ/39bTx19i515SclxRz3FAdyUOh97Q+rgOJ2A8kfrFD0E6fL26XJsYu5Tex
         Mikk96IzaLEwrSWCVd/ZsJeEi3GzOCe2Ri98hsqhy66KUUvPDeCnjCSCk35oibD6WdjT
         PloN6ipggA8U9jQVCZodnfQtxC0M+Rh2gqrOFaP7V4r6kiq7VDy6FFVz7XegHVJWOTqP
         yvDJSncszrUmKRrpe5bQMtDj1ZdTpmFzpXxogaFe5rGRuFraaMUY9rafELtRKaZReK/4
         lMmg==
X-Forwarded-Encrypted: i=1; AJvYcCWG65/tLr4Rl3aWAt11e7rk1UKHh/lwVM/5k7ra599+G0uAeHHL05Pxz2dj2wg1w80UwYXjHVAHsfKorQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywpmcsqj7Gh+pmJ7z4OuDK5y2XWoBDvE9aH9EeaSJzRrjIYm2q0
	zEF0BPGotDG5NQEOiF7Lh4B6QmmWb2SV+ok5+jpHV5qw44YdNzFkSVv1OleLU3ii
X-Gm-Gg: AZuq6aIv5ZfidqKO4Z1oNu4OfePerH+cz7aVVDH5a6V6IaPeeHGG0bioxkoCinNM4Tg
	CIkWMD3Cd3vz3bv5PvupLs3J9wMaFzEO9dKvSqp6UhXaJRa7Mq2GMl1QKJYQKrQ7I/7g9hFlqEu
	HR3NbKwe39x/dwwYfQipfm+UONX6yFdySrJeS4IsklP/K/vgkSCe+ZA/PlK6rqlSOYi9G+7qlom
	KFTZnGTL5GFkczGlAVZzTRKCnwUIYEsVz3NRVUxRdnrczPfzfbswe+utu062zlUplnGpEY9khYS
	06r4/mrYfQ2ZP5sa9ZSDcX6AjoRdF1a27+Xr2EgjgP9HlQr/OmNgzCLhkl19O8ZdHUaiCZLjRyH
	Q/yadintIi5OnCTswyBYr3OjJSSaex5mXn5VLJ3NOq5LtLL+ZUV3eIEr775VwF6BL7Jv7vrZSnn
	Q6Jsz0C74s222kZodQYE/9mFoEiw2Ledg6h4O3jZMb8w==
X-Received: by 2002:a05:6512:b16:b0:59e:387f:bf97 with SMTP id 2adb3069b0e04-59e55b9e424mr258253e87.21.1770700139219;
        Mon, 09 Feb 2026 21:08:59 -0800 (PST)
Received: from ehlo.thunderbird.net ([178.137.233.16])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59e44cf6f67sm3033446e87.13.2026.02.09.21.08.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Feb 2026 21:08:58 -0800 (PST)
Date: Tue, 10 Feb 2026 07:08:58 +0200
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
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v2_1/5=5D_ASoC=3A_dt-bindings=3A_n?=
 =?US-ASCII?Q?vidia=2Ctegra-audio=3A_document_CPCAP_CODEC?=
User-Agent: K-9 Mail for Android
In-Reply-To: <20260210024619.GA2374304-robh@kernel.org>
References: <20260206173423.145954-1-clamor95@gmail.com> <20260206173423.145954-2-clamor95@gmail.com> <20260210024619.GA2374304-robh@kernel.org>
Message-ID: <35B721E4-F950-4425-AFF8-D6DBF54F513F@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable



10 =D0=BB=D1=8E=D1=82=D0=BE=D0=B3=D0=BE 2026=E2=80=AF=D1=80=2E 04:46:19 GM=
T+02:00, Rob Herring <robh@kernel=2Eorg> =D0=BF=D0=B8=D1=88=D0=B5:
>On Fri, Feb 06, 2026 at 07:34:18PM +0200, Svyatoslav Ryhel wrote:
>> Add dt-binding for CPCAP CODEC=2E
>>=20
>> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail=2Ecom>
>> ---
>>  =2E=2E=2E/sound/nvidia,tegra-audio-cpcap=2Eyaml       | 90 +++++++++++=
++++++++
>>  1 file changed, 90 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/sound/nvidia,tegr=
a-audio-cpcap=2Eyaml
>>=20
>> diff --git a/Documentation/devicetree/bindings/sound/nvidia,tegra-audio=
-cpcap=2Eyaml b/Documentation/devicetree/bindings/sound/nvidia,tegra-audio-=
cpcap=2Eyaml
>> new file mode 100644
>> index 000000000000=2E=2E5335fa56fb3c
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/sound/nvidia,tegra-audio-cpcap=
=2Eyaml
>> @@ -0,0 +1,90 @@
>> +# SPDX-License-Identifier: (GPL-2=2E0-only OR BSD-2-Clause)
>> +%YAML 1=2E2
>> +---
>> +$id: http://devicetree=2Eorg/schemas/sound/nvidia,tegra-audio-cpcap=2E=
yaml#
>> +$schema: http://devicetree=2Eorg/meta-schemas/core=2Eyaml#
>> +
>> +title: NVIDIA Tegra audio complex with CPCAP CODEC
>> +
>> +maintainers:
>> +  - Svyatoslav Ryhel <clamor95@gmail=2Ecom>
>> +
>> +allOf:
>> +  - $ref: nvidia,tegra-audio-common=2Eyaml#
>> +
>> +properties:
>> +  compatible:
>> +    items:
>> +      - pattern: '^[a-z0-9]+,tegra-audio-cpcap(-[a-z0-9]+)+$'
>
>Expecting a lot of devices and differences? I would assume all known h/w=
=20
>is well known and any differences are known by now=2E Perhaps even just=
=20
>the fallback is sufficient?
>

From=203 to 5, maybe more=2E Hard to trach different variations=2E Having no=
 full schematic does not help either=2E

>> +      - const: nvidia,tegra-audio-cpcap
>> +
>
>> +  - |
>> +    #include <dt-bindings/clock/tegra20-car=2Eh>
>> +    #include <dt-bindings/soc/tegra-pmc=2Eh>
>> +    sound {
>> +        compatible =3D "motorola,tegra-audio-cpcap-mot",
>
>Why do we need motorola twice?
>

"Motorola" is the vendor, "mot" is the board name=2E Same name you have re=
cently seen in the CPCAP schema patches I have sent=2E

>> +                     "nvidia,tegra-audio-cpcap";
>> +        nvidia,model =3D "Motorola Atrix 4G (MB860) CPCAP";
>> +
>> +        nvidia,audio-routing =3D
>> +                "Headphones", "HSR",
>> +                "Headphones", "HSL",
>> +                "Int Spk", "SPKR",
>> +                "Int Spk", "SPKL",
>> +                "Earpiece", "EP",
>> +                "HSMIC", "Mic Jack",
>> +                "MICR", "Internal Mic 1",
>> +                "MICL", "Internal Mic 2";
>> +
>> +        nvidia,i2s-controller =3D <&tegra_i2s1>;
>> +        nvidia,audio-codec =3D <&cpcap_audio>;
>> +
>> +        clocks =3D <&tegra_car TEGRA20_CLK_PLL_A>,
>> +                 <&tegra_car TEGRA20_CLK_PLL_A_OUT0>,
>> +                 <&tegra_car TEGRA20_CLK_CDEV1>;
>> +        clock-names =3D "pll_a", "pll_a_out0", "mclk";
>> +    };
>> --=20
>> 2=2E51=2E0
>>=20
