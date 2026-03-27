Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7947330330
	for <linux-tegra@vger.kernel.org>; Fri, 27 Mar 2026 15:18:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774624729; cv=none; b=ieyut65xW0oFPnLJhbk70jtcMRVXVfuNG6zHtaeGsGA9RO5lKT6WdeZgJTr8FaPepwMYnQ45Uf7EMdajFxtsXOnJLP2C0D3f2+NKWwCvi4//b0EsoGb6DAG4vZ4pAq7fSlmPn6qE3ZQq2pEH6lHouuRGlCfb1op4+LS7NCoOEQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774624729; c=relaxed/simple;
	bh=fjT2H6gzwBSp87QlI/2gBn1WubDk9flwC+mV3zKQvQY=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=E63hWm5DiCt2LC3O6qpEYwP/LsW9WtAayh2cboYIuZO41U93gIwz7w3HyWjk+YQFA7Pyc/7am3LxYeO/tXD2aLKEp/8/yz0GBOtsIYovqIv8wmP+pAS2G2AIFuD8A/p7PCnIU2UhHKHMDPUB1P4NDhrTVAQrzNn0HTnsUJsXlxs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=el4fZ9gv; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="el4fZ9gv"
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-38c688bdc71so12213031fa.2
        for <linux-tegra@vger.kernel.org>; Fri, 27 Mar 2026 08:18:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774624726; x=1775229526; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Rd+AZ84x5Lizh7vwDeIK1vtXSM5ziqqkEbKt/AVL2kc=;
        b=el4fZ9gvVWBxMxKWtuoBeLnRvQEb5KaPLdCrcg8JZNJikpuP0ugCnUh99PWErCyHf1
         1SM9QW+AhnqFfSmn6tr3nm8VKE14gvZNp6vn80492K9Gpc1MnSPDeEU+ZKHovG0ARHXT
         W+JghGa0xNKDFd4feSBOwlu6xm3CZ6H+q3oCTSF5fXGiFfYwI/d30oAfCKTsYDNAWjxk
         c+IJq7eIN4HD1ZPOozaV2bgLKu6yF9gOoO3B9os+2ABbYZvIsvutP+L1WPtXPpjOXVuX
         G4Yt6zIp3nsIPgGuPuYX1ma5kKGU3WXbWJDi8rcNhTp8/WOa17O6Wqm8rff96M93T/4T
         DMRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774624726; x=1775229526;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Rd+AZ84x5Lizh7vwDeIK1vtXSM5ziqqkEbKt/AVL2kc=;
        b=ZWsmWXiRKwRucdqOQnCBLWvyB5iB+SUvOFLnmcVUPkDHIZVH3fjfYuuXE8bOec/bsW
         COIwwhZXqLwa1YHLNBP+gKZirmOsui6b3uXT/IxYXQ2w5iMUhanruaVw+EZNr3b3BR97
         Yjg4PgJ7YDjVQzCMYw7Ojj3xVbPgTItbtyo1VjELc0AK1Oev7if3XkwiNB5EONNBnPut
         tmUqAjs9ncTivIfUH4tOLyQHY2YLAb5ggSCez11cnbMIvPsCWEC5DT6DsyAuxIdqW2vZ
         XRALcAPg/Rc4vbcvatdTQKI7fCSueTt9DusOTZ282wxbMLu7sSRJfg8p6UCx3H/ziF97
         3Y1A==
X-Forwarded-Encrypted: i=1; AJvYcCWKPB+ht2Dq9KMuWVyCw77r+kWet7MXRudokBfZMGfVH/5E2erB1tgJVXpPy+7NC6q30PuWN24IB3w2+A==@vger.kernel.org
X-Gm-Message-State: AOJu0YyNwo0zluaFCBx7Xh3IOw8dKfik9+nmC79yVWx+7pb8kh5ihqOE
	IpSj+W0z79CeTleNkG2dJTQhuxWMw3ia1sp5phcl0yLqSwjDRkk+IZ5Tbi67CA==
X-Gm-Gg: ATEYQzzwGZB9bI62SikCneUc3F61Ve7iZX8rb+bxja8Qpn7PvdKu8H4vD5sFJk6x6X5
	4DnVETxdNiokA9SMGu8uHig3xHqOr5ph3lywQg7N5fBvIWd2GFxjDNfIZb0ERQD4zP09J1fvyti
	7gDAdXoNthlpuDJ7s2Vu9AfOQfrEl2zbLTzagfae+/iFqN0xvHmmbBeDeycbboR/JO1Inx+u2WL
	FBdAE9rNakqJh4gZdFd61CEy4WHn8UTbTKbyf6d6SWb5Y3bRypeWXhJwj5g7lONcJQiTAZMF5Gd
	fI898O2KM+39Pqui0UD3gjll9CCYXPQu6PxBXoywo05q3zkTbWxL6gYwQyfOUjd7lwMvguErTyi
	ObNoQatVR1ItfX+uS22g8Z82pJzWt8cgfIoQ6Nq9S8BUHejPY3KHuOXMeSEQM7DJLC88kofGFB0
	oxw/PVRC8VWrsk0vwPynAz6LF5OsYlVg1F
X-Received: by 2002:a2e:b894:0:b0:38b:50c7:8239 with SMTP id 38308e7fff4ca-38c73263251mr9097391fa.21.1774624725656;
        Fri, 27 Mar 2026 08:18:45 -0700 (PDT)
Received: from ehlo.thunderbird.net ([178.137.189.225])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38c5330a952sm12096881fa.37.2026.03.27.08.18.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Mar 2026 08:18:45 -0700 (PDT)
Date: Fri, 27 Mar 2026 17:18:44 +0200
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Thierry Reding <thierry.reding@kernel.org>
CC: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Thierry Reding <treding@nvidia.com>, Jonathan Hunter <jonathanh@nvidia.com>,
 =?ISO-8859-1?Q?Jonas_Schw=F6bel?= <jonasschwoebel@yahoo.de>,
 devicetree@vger.kernel.org, linux-tegra@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/4] ARM: tegra: lg-x3: add missing nodes
User-Agent: K-9 Mail for Android
In-Reply-To: <acacdUaXVNIKHT2O@orome>
References: <20260126101018.24450-1-clamor95@gmail.com> <acacdUaXVNIKHT2O@orome>
Message-ID: <C4901815-931A-4DD0-A12D-6C082B3C1170@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable



27 =D0=B1=D0=B5=D1=80=D0=B5=D0=B7=D0=BD=D1=8F 2026=E2=80=AF=D1=80=2E 17:05=
:34 GMT+02:00, Thierry Reding <thierry=2Ereding@kernel=2Eorg> =D0=BF=D0=B8=
=D1=88=D0=B5:
>On Mon, Jan 26, 2026 at 12:10:14PM +0200, Svyatoslav Ryhel wrote:
>> With the recent kernel updates, Tegra30-based LG smartphones now suppor=
t
>> several additional features, including an RGB-DSI bridge, DSI panels,
>> MUIC, a charger, a battery temperature sensor, OTG mode, and capacitive
>> buttons on the P895=2E Add required nodes to device trees=2E
>>=20
>> ---
>> Changes in v2:
>> - fixed dw9714 and tx13d100vm0eaa nodes
>> - added video device pipes graph
>>=20
>> Regarding CHECK_DTBS output in v2:
>> - nvidia,tegra30-pcie, nvidia,tegra30-gmi, nvidia,tegra30-kbc,
>>   nvidia,tegra20-kbc, nvidia,tegra30-ahub are not documented yet
>> - nvidia,tegra30-vi was adjusted and applied, change did not apper yet
>>   (https://lore=2Ekernel=2Eorg/lkml/176860988748=2E1688420=2E1171712264=
7073678=2Eb4-ty@nvidia=2Ecom/)
>> - st,m24c08 appers undocumented though it seems to be different from
>>   st,24c08, at least they google as separate devices=2E atmel,24c08 is =
not
>>   documented, though it is widey used in linux device trees and is
>>   supported by driver=2E Here is one of examples:
>>   https://git=2Ekernel=2Eorg/pub/scm/linux/kernel/git/next/linux-next=
=2Egit/tree/arch/arm/boot/dts/allwinner/sun7i-a20-linutronix-testbox-v2=2Ed=
ts?h=3Dnext-20260123#n33
>> - onnn,mt9m114 does not have 'orientation' property, though it should
>>   include it since it is generic for camera devices
>> - ti,lp8720 and maxim,max77663 have txt documentation and are not yet
>>   converted to DT schema
>> - backlight in panel nodes was not added since lm3533 has no DT support
>> - missing '#io-channel-cells' in ti,tsc2007 addressed in
>>   https://lore=2Ekernel=2Eorg/lkml/20260122193549=2E29858-2-clamor95@gm=
ail=2Ecom/
>> - missing dsi controller properties of ssd2825 addressed in
>>   https://lore=2Ekernel=2Eorg/lkml/20260123073411=2E7736-2-clamor95@gma=
il=2Ecom/
>> - missing '#io-channel-cells' in generic-adc-thermal was proposed in bu=
t rejected
>>   https://lore=2Ekernel=2Eorg/lkml/20250310075638=2E6979-2-clamor95@gma=
il=2Ecom/
>> ---
>>=20
>> Svyatoslav Ryhel (4):
>>   ARM: tegra: lg-x3: add panel and bridge nodes
>>   ARM: tegra: lg-x3: add USB and power related nodes
>>   ARM: tegra: lg-x3: add node for capacitive buttons
>>   ARM: tegra: lg-x3: complete video device graph
>>=20
>>  arch/arm/boot/dts/nvidia/tegra30-lg-p880=2Edts |  39 +++
>>  arch/arm/boot/dts/nvidia/tegra30-lg-p895=2Edts |  79 +++++
>>  arch/arm/boot/dts/nvidia/tegra30-lg-x3=2Edtsi  | 328 +++++++++++++++++=
+-
>>  3 files changed, 429 insertions(+), 17 deletions(-)
>
>Patches 1-3 applied=2E Patch 4 has checkpatch has checkpatch warnings:
>
>	WARNING: DT compatible string "st,m24c08" appears un-documented -- check=
 =2E/Documentation/devicetree/bindings/
>	#255: FILE: arch/arm/boot/dts/nvidia/tegra30-lg-x3=2Edtsi:1243:
>	+			compatible =3D "st,m24c08", "atmel,24c08";
>
>So I've left it out for now=2E
>

st,m24c08 appers undocumented though it seems to be different from
st,24c08 (in schema) at least they google as separate devices=2E atmel,24c=
08 is not
documented, though it is widey used in linux device trees and is
supported by driver=2E Here is one of examples:
=C2=A0=C2=A0https://git=2Ekernel=2Eorg/pub/scm/linux/kernel/git/next/linux=
-next=2Egit/tree/arch/arm/boot/dts/allwinner/sun7i-a20-linutronix-testbox-v=
2=2Edts?h=3Dnext-20260123#n33

I assume patch 4 should be fine and most likely schema needs to be adjuste=
d to cover this compatible (since it exists and is used)=2E

>Thierry
