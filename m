Received: from mail-lj1-f196.google.com (mail-lj1-f196.google.com [209.85.208.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28DD836C5A4
	for <linux-tegra@vger.kernel.org>; Tue, 10 Feb 2026 14:28:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770733720; cv=none; b=B5YnzcT/XZCy3RcJvdsoG2RQCxngBQZ/0eepa9oPUI76RExZuDdaWc82D8packj8BN62QOS7bD6dcj8wDM3uzjS+GS6le2iyLLdyU5yCORsaV4u1HBmpMTzb9untV3NLTJCmQlmEt/LFFniJvGb0vS57d9Mhp9XxRor2V/cz168=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770733720; c=relaxed/simple;
	bh=kiTxjuT/LmkrO3n5jH8eFQ4YBGi1FGUJ02CQVFp+/cs=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=AHk8/nTFsAIC24KLyZzW7SaV4oJJBBg8WPDAxlvYTHF64ZH41doxLDcyhgX3zbxPj5/yktqT5psqduCS12dlaKlIU8d7fxknLhcpRr4K0WlGiNyfpIa+XKVAyPS5WKKrqudpAw5v/AkamSjYl7qJQ0yrMLrpAm2z55A2YKRDB4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JMm6AUHL; arc=none smtp.client-ip=209.85.208.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JMm6AUHL"
Received: by mail-lj1-f196.google.com with SMTP id 38308e7fff4ca-382f9211cbfso37989651fa.0
        for <linux-tegra@vger.kernel.org>; Tue, 10 Feb 2026 06:28:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770733717; x=1771338517; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=jJiTIxfPBm25e93CFQ56nmStRzngUVIEZWb2GhG+yqk=;
        b=JMm6AUHLjOULCfQOex4jOeGrObx2/r2kBXk8UdiPtsEU0F5Z1QDK7nIP2vB9jxHjN4
         5/JlCkw6UI5uaPW/FHHxYniSFabnDS1BC1rMhQBsAs1HguLxBkkPHiN13rxerYDWzIM7
         WZfLNuoLSHGyyTUsQ2tcOzm53tEH4C4TGMUTQIWBBgTBmVxz2aISGC7qy75yfHQstlIm
         1GJ7VFM41usiSZ9KePIKIOahYT8fxMwFdgoL5A3HrnphOOVwTesAntIIIsC0skZYhhjr
         4kyYdqHYkmD8+RRMtY0sI1Av7CAaXHzFaWdthUbnfQkzNSM8FeWPGT7hGgco6uCDbzsU
         gCjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770733717; x=1771338517;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jJiTIxfPBm25e93CFQ56nmStRzngUVIEZWb2GhG+yqk=;
        b=Xn7k21B5TWEqYl3SWncKKBOxU3TrFvJAU9584jdnPEIiqm1nW8JpovPhij6MGueJIC
         7nBggNO1La+WJoIl7vxmi5sfMWWndUXg+T/CujYRiXnIkHLBCJT3qFL9WUHwIl+m+Z/8
         EAMDXyugA46ntBp2X7okSe6IPay8Jqv9qZB+NJLvFkHjZ70uxMrbOE1VEiRa9J0Ey4jQ
         f+0ktr9EA5dfW4yf43RHJsoysbD2lhSI38Bm9b8KQr2kzctiPsSc7jrR46nQgupHBy7y
         yyopIEidE+URpks4I9zPIhpmsJYHCMLuslKkwfGBUZLkHzTr5Ik3Fa+bn61F3pcROJdY
         CE2Q==
X-Forwarded-Encrypted: i=1; AJvYcCUp3sSojlOpSzDJWFKGTj3Pm4kjVAfZ1KFlmcAu5Af6NyX8toImmoSzyGuM8Fe7YXOUPkBI2HqkHczi5w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1UcrpDU2DZKsnBEU+tdSD2r5yMRbovwJIK2s0Uhe/s1kcxaM9
	32TPIexzFnEjhcI34brgBSGvckYVWdQlN6f6NMaEfulDeEO0YQ6NPMPJ
X-Gm-Gg: AZuq6aLZTK0ZP1RCW8Da3JAimoKeKV714kUNPM6660oYMZHChA7KmBw99ZZP5ttclhK
	JPm+79Vv/6YUHEkRGycC0IOeWw2ZI9ED9+/uOYYk12dbrliMIY3eM4FZbJBJLf/x5FVCtNlUMKR
	bM7FL3WADupbcXGv8wn9rUTG5VJSpMrNtZVL/lXrVdcGC+ev98JCbXUrKgxKh+nemtpy8wBiEHn
	ik8VH//RppUAleC/2egHq1tzqbBbveTs5Dt3UAFysnHK6ClD5k/xkKCwNtGaRUcgQt/vDmbHqx1
	2BuTOMOrmGCVgvXFJ674SYlefUwJzBS1KuMkT5hL1PUXVzqQRiGVncgb08kTq2wtiUEoEdBMk9d
	2nCjpcHX5cuFon/35QAOXWJEY7ZdYXx80iRXQzPh6MPhEOemp/qnZ5AtUvNLwGQCeXvFAF5++Q7
	Lw1uF6DDhht6x0ONmn6JNoj3AatJGGt2xKLuT5G2gSow==
X-Received: by 2002:a05:651c:3048:b0:383:1737:5ae1 with SMTP id 38308e7fff4ca-386b4ed29e9mr47903091fa.11.1770733716944;
        Tue, 10 Feb 2026 06:28:36 -0800 (PST)
Received: from ehlo.thunderbird.net ([178.137.45.117])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-386fb4662bdsm985391fa.29.2026.02.10.06.28.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Feb 2026 06:28:36 -0800 (PST)
Date: Tue, 10 Feb 2026 16:28:35 +0200
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Rob Herring <robh@kernel.org>
CC: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-tegra@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v1_1/2=5D_dt-bindings=3A_displ?=
 =?US-ASCII?Q?ay=3A_tegra=3A_document_Tegra20_HDMI_port?=
User-Agent: K-9 Mail for Android
In-Reply-To: <20260210141917.GA2659856-robh@kernel.org>
References: <20260210094908.14276-1-clamor95@gmail.com> <20260210094908.14276-2-clamor95@gmail.com> <20260210141917.GA2659856-robh@kernel.org>
Message-ID: <DB13921D-05FC-4A6C-B5D0-D23D5B47063B@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable



10 =D0=BB=D1=8E=D1=82=D0=BE=D0=B3=D0=BE 2026=E2=80=AF=D1=80=2E 16:19:17 GM=
T+02:00, Rob Herring <robh@kernel=2Eorg> =D0=BF=D0=B8=D1=88=D0=B5:
>On Tue, Feb 10, 2026 at 11:49:07AM +0200, Svyatoslav Ryhel wrote:
>> Tegra HDMI can be modeled using an OF graph=2E Reflect this in the bind=
ings=2E
>>=20
>> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail=2Ecom>
>> ---
>>  =2E=2E=2E/bindings/display/tegra/nvidia,tegra20-hdmi=2Eyaml | 13 +++++=
++++++--
>>  1 file changed, 11 insertions(+), 2 deletions(-)
>>=20
>> diff --git a/Documentation/devicetree/bindings/display/tegra/nvidia,teg=
ra20-hdmi=2Eyaml b/Documentation/devicetree/bindings/display/tegra/nvidia,t=
egra20-hdmi=2Eyaml
>> index f77197e4869f=2E=2Ef33b700bf0ee 100644
>> --- a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-hd=
mi=2Eyaml
>> +++ b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-hd=
mi=2Eyaml
>> @@ -82,6 +82,10 @@ properties:
>>      description: phandle of a display panel
>>      $ref: /schemas/types=2Eyaml#/definitions/phandle
>> =20
>> +  port:
>> +    description: connection to controller receiving HDMI signals
>
>Describe this in terms of this block, not what it is connected to=2E It=
=20
>could be an hdmi-connector node or a bridge=2E
>

Isn't the idea of port to provide connection to the remove device=2E How s=
hould I word it: "links HDMI host with the receiver" or "output of HDMI"? I=
 don't quite understand what you mean=2E Maybe I should remove description =
entirely, HDMI has a single port and its function is pretty strait forward=
=2E

>> +    $ref: /schemas/graph=2Eyaml#/properties/port
>> +
>>    "#sound-dai-cells":
>>      const: 0
>> =20
>> @@ -97,8 +101,13 @@ required:
>>    - reset-names
>>    - pll-supply
>>    - vdd-supply
>> -  - nvidia,ddc-i2c-bus
>> -  - nvidia,hpd-gpio
>> +
>> +anyOf:
>> +  - required:
>> +    - nvidia,ddc-i2c-bus
>> +    - nvidia,hpd-gpio
>> +  - required:
>> +    - port
>> =20
>>  examples:
>>    - |
>> --=20
>> 2=2E51=2E0
>>=20
