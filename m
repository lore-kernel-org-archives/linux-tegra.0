Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00A162E1F0D
	for <linux-tegra@vger.kernel.org>; Wed, 17 Sep 2025 04:09:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758082161; cv=none; b=ZgyaNVoM0zqalIMbKq6ciWjPb21w5r8Km41WJCfPplBUEB11poYiXI3Ym/VF1uKX+zQEHQIP/UPHtarRzpI6oGbIWj986rvbd55lCyVTY7sLyjiNEBoy7GQRtsr4Q+fEl1txo2j3ByiSZW5hI03flcrar9d+wcaiqAINP4bBJzg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758082161; c=relaxed/simple;
	bh=2bvp36KmupZNMGpps/OrSOzUI8/fL5Jg26VYq8D4SCQ=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=rigkoQxg2yHnsymEhHTu+wmG8ZDdisYwmJnOeHC3L9BnRjZ0C2rQsYDOXVPIEchp8ccfyIrlMVVZnt7mj1ace148r0EAtqGhpX9tYNiRr2voVm0wBwMrgn4ZWlEpFffRbaNDX7DVo8esHVfXlZM3Ch7GPLSSid9amd2koPIcuC8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j3ALYzd+; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j3ALYzd+"
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-55f753ec672so6829566e87.2
        for <linux-tegra@vger.kernel.org>; Tue, 16 Sep 2025 21:09:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758082158; x=1758686958; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Q/acXbEK2et4Won7Kyik166aN82Qa/n/alnFQdbkk5E=;
        b=j3ALYzd+Jcb9vvj7AyWTJ00G8UlU9HrlgBa4J8x/3solwanhEssZRyKJYc3nBeF/+a
         8jQAY8PGqU2hBhpSHGtC6ip19/zFTANpoxOLkHHNSMAmHMPB1YwnZa9nWkEYKhqrWszo
         nzdIMlj7w0m89rnVhWkqCdxCRXqaMRg9oQn7Vpl9twvScDN2AfYCDFQd62Y5l8mrZBAW
         99qW2dEDM5nq/RP/pEpGiOLtsg4kwoo6cnevr6wBwKVlukIyt/A/4TGB+FPDUN2JrkBi
         U7fGRSCNXlY1Qan4oKsbLrCo8AKwSy05uUBmX75SP2hOW+KFa4NFSPSzB2kJ3eM4vLo1
         soFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758082158; x=1758686958;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Q/acXbEK2et4Won7Kyik166aN82Qa/n/alnFQdbkk5E=;
        b=Kv2XRrUlEQnmUMCL40nW/dK03V0tYFHpj49k8JZpgBtBiZW5WsVWWq1dTBNHmWozgr
         qE3EjX43HZrrO13smqc14fDH29wkdUZYD4HieLzKfmOw5Ow2seAN3Xdk4C2aebI1cENm
         aMrk4KphNyrBSn5chKJla0pRpUCmahy4UKHHM0kpM9rS8yCjalQjsj8LQWP9q/4Xmgcj
         uwYVeiSDc0F7FhhvWlpWc66dumL9wvJokLq3RclyHvw0niHpW3NvAaQXNTVTcfg6AnxI
         szzL9PyTCjC5vJqPrT/68EQfKH0BQ8SpiPQVeE7qAJmQuj14myvMPSympPm0udypGw83
         xDsw==
X-Forwarded-Encrypted: i=1; AJvYcCXObztW4MYU7vSLAJlwChO6dRsKdvpyVBbnhjzlqM5DE2dT8nYGmFWzx17VldLezkU7kK3skWrn9TQKtQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxkZJkp95DU+Ox8mrU5Vnm71N5MUfLXjIbRbJIzyILT3W6N20EL
	mYdJXdtqV+mSuIyXHw8RUSrPHVQuBVne9bA8nkjEiglYAg5+bAdVwn6o
X-Gm-Gg: ASbGncs0pjTuUerIVxJ+ZkC5tagtWE+X3+Hwqpf2LHl3gsCkRlqSanNeNWxIHXryGvB
	b0Pw4/ZLzM3sYmMZ0Fh5EKB+TRCawsDrbTyaNkmtanut83m0cnXuL8/Acs3sME7Kj7sgovDHw1u
	yO4XUlsAjrMkkxjT/yjh8Z25sbtpaIK5NVY2W1Kcxz605nPpBpSdUmWyK0bs6Wd3wbTrEFy6ozV
	kFxfwDQ4VTyzizNM/lUsJtXWZU/Z93mTlQhZ96J6XKfayL8hGHxJbX55IcCimdi3HdbelYoWftD
	TA68k25pmQZtRbGctnEhffnIgO3JfZNF8aNz0wZyIk0MM3GVt0PQcPSBgx4pEjV1EAz6zGbhgdB
	ONIVmigiBCkHYABTBa8mj
X-Google-Smtp-Source: AGHT+IEIFuayZdeViGaGheXPYMm/8ps877mpBKcVhq8OkNInnOAYSkaIc1jQt5+Wq4pUfsLEPGLoUg==
X-Received: by 2002:a05:6512:6509:b0:571:1bdc:14d9 with SMTP id 2adb3069b0e04-57798943ce3mr200142e87.24.1758082157893;
        Tue, 16 Sep 2025 21:09:17 -0700 (PDT)
Received: from [127.0.0.1] ([178.137.222.126])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-56e64fa715asm4910278e87.123.2025.09.16.21.09.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Sep 2025 21:09:17 -0700 (PDT)
Date: Wed, 17 Sep 2025 07:09:13 +0300
From: Svyatoslav <clamor95@gmail.com>
To: Mikko Perttunen <mperttunen@nvidia.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Thierry Reding <treding@nvidia.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>
CC: devicetree@vger.kernel.org, linux-tegra@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 2/4] ARM: tegra114: add missing HOST1X device nodes
User-Agent: K-9 Mail for Android
In-Reply-To: <3549625.aeNJFYEL58@senjougahara>
References: <20250827113734.52162-1-clamor95@gmail.com> <20250827113734.52162-3-clamor95@gmail.com> <3549625.aeNJFYEL58@senjougahara>
Message-ID: <FF69608E-EE3A-40E3-A02B-A6BF8FDE4800@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable



17 =D0=B2=D0=B5=D1=80=D0=B5=D1=81=D0=BD=D1=8F 2025=E2=80=AF=D1=80=2E 05:44=
:42 GMT+03:00, Mikko Perttunen <mperttunen@nvidia=2Ecom> =D0=BF=D0=B8=D1=88=
=D0=B5:
>On Wednesday, August 27, 2025 8:37=E2=80=AFPM Svyatoslav Ryhel wrote:
>> Add nodes for devices on the HOST1X bus: VI, EPP, ISP, MSENC and TSEC=
=2E
>>=20
>> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail=2Ecom>
>> ---
>>  arch/arm/boot/dts/nvidia/tegra114=2Edtsi | 64 ++++++++++++++++++++++++=
++
>>  1 file changed, 64 insertions(+)
>>=20
>> diff --git a/arch/arm/boot/dts/nvidia/tegra114=2Edtsi b/arch/arm/boot/d=
ts/nvidia/tegra114=2Edtsi
>> index 4caf2073c556=2E=2E8600a5c52be9 100644
>> --- a/arch/arm/boot/dts/nvidia/tegra114=2Edtsi
>> +++ b/arch/arm/boot/dts/nvidia/tegra114=2Edtsi
>> @@ -47,6 +47,45 @@ host1x@50000000 {
>> =20
>>  		ranges =3D <0x54000000 0x54000000 0x01000000>;
>> =20
>> +		vi@54080000 {
>> +			compatible =3D "nvidia,tegra114-vi";
>> +			reg =3D <0x54080000 0x00040000>;
>> +			interrupts =3D <GIC_SPI 69 IRQ_TYPE_LEVEL_HIGH>;
>> +			clocks =3D <&tegra_car TEGRA114_CLK_VI>;
>> +			resets =3D <&tegra_car 20>;
>> +			reset-names =3D "vi";
>
>You are adding reset-names here, but in the last patch you're removing it=
 where there's only one reset?

I am not "adding" it, it is present in the existing schema and I am making=
 node accordingly=2E I have no intention to touch schema unless it is absol=
utely necessary=2E

>> +
>> +			iommus =3D <&mc TEGRA_SWGROUP_VI>;
>> +
>> +			status =3D "disabled";
>> +		};
>> +
>> +		epp@540c0000 {
>> +			compatible =3D "nvidia,tegra114-epp";
>> +			reg =3D <0x540c0000 0x00040000>;
>> +			interrupts =3D <GIC_SPI 70 IRQ_TYPE_LEVEL_HIGH>;
>> +			clocks =3D <&tegra_car TEGRA114_CLK_EPP>;
>> +			resets =3D <&tegra_car TEGRA114_CLK_EPP>;
>> +			reset-names =3D "epp";
>> +
>> +			iommus =3D <&mc TEGRA_SWGROUP_EPP>;
>> +
>> +			status =3D "disabled";
>> +		};
>> +
>> +		isp@54100000 {
>> +			compatible =3D "nvidia,tegra114-isp";
>> +			reg =3D <0x54100000 0x00040000>;
>> +			interrupts =3D <GIC_SPI 71 IRQ_TYPE_LEVEL_HIGH>;
>> +			clocks =3D <&tegra_car TEGRA114_CLK_ISP>;
>> +			resets =3D <&tegra_car TEGRA114_CLK_ISP>;
>> +			reset-names =3D "isp";
>> +
>> +			iommus =3D <&mc TEGRA_SWGROUP_ISP>;
>> +
>> +			status =3D "disabled";
>> +		};
>> +
>>  		gr2d@54140000 {
>>  			compatible =3D "nvidia,tegra114-gr2d";
>>  			reg =3D <0x54140000 0x00040000>;
>> @@ -149,6 +188,31 @@ dsib: dsi@54400000 {
>>  			#address-cells =3D <1>;
>>  			#size-cells =3D <0>;
>>  		};
>> +
>> +		msenc@544c0000 {
>> +			compatible =3D "nvidia,tegra114-msenc";
>> +			reg =3D <0x544c0000 0x00040000>;
>> +			interrupts =3D <GIC_SPI 68 IRQ_TYPE_LEVEL_HIGH>;
>> +			clocks =3D <&tegra_car TEGRA114_CLK_MSENC>;
>> +			resets =3D <&tegra_car TEGRA114_CLK_MSENC>;
>> +			reset-names =3D "mpe";
>
>FWIW, I think 'msenc' is the appropriate name to use on Tegra114/Tegra124=
=2E I believe MPE is a remnant from older chips, even if some downstream (a=
nd I guess upstreaming) naming still uses it=2E
>

Same here, I am making those according to schema and I will not touch it i=
f not neceserry=2E

>> +
>> +			iommus =3D <&mc TEGRA_SWGROUP_MSENC>;
>> +
>> +			status =3D "disabled";
>> +		};
>> +
>> +		tsec@54500000 {
>> +			compatible =3D "nvidia,tegra114-tsec";
>> +			reg =3D <0x54500000 0x00040000>;
>> +			interrupts =3D <GIC_SPI 50 IRQ_TYPE_LEVEL_HIGH>;
>> +			clocks =3D <&tegra_car TEGRA114_CLK_TSEC>;
>> +			resets =3D <&tegra_car TEGRA114_CLK_TSEC>;
>> +
>> +			iommus =3D <&mc TEGRA_SWGROUP_TSEC>;
>> +
>> +			status =3D "disabled";
>> +		};
>>  	};
>> =20
>>  	gic: interrupt-controller@50041000 {
>>=20
>
>
>
