Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F1C82561AE;
	Wed,  3 Sep 2025 06:28:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756880917; cv=none; b=iQWJXnbmWpUHF7uEm4zA2fOnVNei4vogtQn5b2WVt5OGr6bp1Uj5/w/277iWbGneWpneVFQJUp9gh5RinvuPnilKBvKgEnXKPEI2EtYnTEN+WXblPwigsVVQcmpksRmQvgoSkM1J2GwZMwBnNFIemCY1mnbzDztt7M34rAUE+wo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756880917; c=relaxed/simple;
	bh=ij/QXfN1kKwJYwEAT05HHDEgKLuPf+ygQcf6xhSZVLo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=A6RNaVzQa/rYb6uab3Pchwslq6MRSjlAC/zmGoaWtsDMr7ZWkdzakMcFXLsO/35AMhKQh5I9YrmOizTuQzMMMdOtK2h9aRHAcWzMQ28LOoLHAzXySTvlMGbjLECwHdBVRWQ2K/kkMB4E3mcsNA7etJzP5bUfNqbq7clXNDphZ6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JWyEQKEx; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JWyEQKEx"
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-55f69cf4b77so4605999e87.2;
        Tue, 02 Sep 2025 23:28:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756880914; x=1757485714; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3HxYHkd68488h2anRBu62BK4MJ/g3dsFXlJW5VdZ9/A=;
        b=JWyEQKExR8MGz75dNQioKHQNMPSoBGfQwr4NYQKvPSAuWLPoo86n5bHRh1MhYbgqz4
         btoSz+jZIWFqBNg4Pempcee8l4pQ4OnlVjynM/PO4FDnQt3/hSdb53/I2Z8eKhxlRKs5
         iBYAgsXyhvjxhwYjn3FACSepC61xjN6V554HRYdFNMz9b1G8yWh3+dE8yhJVE8PleqtV
         iev/HwIEwDKBAyFl6zepVsXMN+thqL5c0bp78G7rnPPVlJIMcRGIn8ArPLO58jgq5Enr
         aysuJroJ24iJVZbhtp4tPdJoTL553PzAJTUjG357g+/xA9YL6Wlnj2K66hWTCS2nxZ89
         0sLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756880914; x=1757485714;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3HxYHkd68488h2anRBu62BK4MJ/g3dsFXlJW5VdZ9/A=;
        b=ndaD+86US3N9xQj6aR5memOl37WHSOXgQbGfoKCoTJr7xMC+Aoz8BUW+wLZW/qXNT3
         cSuxZl67N7ITiPO8brkjWAP4k0aTwI6QTlgqxusMRsQaYlUYripz2wDzobHhdOeDBknK
         j4vjIdUh2z6omL7e77nuePbu65wD9MIM/uaZGyB4tOYh3m1qE5IsEW9nRLpbZ750K9la
         SrTaFFYs6o73sPO5zg/ks4Hwfl5xDL05DCHUaP1lyqHROfQoYFO5DPs3TN57EgPwCFLq
         xODPlR3NIyCQsGRG+fIVXaXEqP7hiR3OnrkSgn431AF2UHKm7+nPbsVxQB/VUWCcBzho
         8XMg==
X-Forwarded-Encrypted: i=1; AJvYcCVLF9KCDBurAUqSgZjsciKwqT/LzXH0V1lYGISB4vRScwllaaqWiBH0//Rr4A+mbeUIg0jLfpE9tmf4ogGD@vger.kernel.org, AJvYcCWLY8KtKViWIDi3ogIybIgpMZm/7Lo1HPXmmtLX/nt9kqd9a+Qbt3THo683Hjj9TzTdm23Nrc97v3AY@vger.kernel.org, AJvYcCWQRrJnfT3MQNO1CCHL9VaMTuADKGfiVsiGbRX8RAGbrmmYj8sFE3KxJiZq3atLZPR5wPx0IqtLMb0+6c4=@vger.kernel.org, AJvYcCX/1mQrWPUvntQgNbvQShBRxakTeTtU8dFBhr8Cz092HL+PmGFrUjNL0MxI9Az+pvTpqQIFiBgEGuFb@vger.kernel.org
X-Gm-Message-State: AOJu0YxD6l1PyHbZoB2LJph/68rgdt2BwrI2jJYtcIOLf9fk8kWEtQfG
	/IVQxPREe25kbqa4j8jdVRoduS2sR9LbTe1WSVwyeChdEmEaOY0DOy+5Eae5P5U2PS597ImDVjr
	T7BIIBJP3UHth+0lvFolcUn+vgqOLilE=
X-Gm-Gg: ASbGncu2uJNRl0LR5viXgcXScc+JyFzOibLNJB+M/7s85quaZy0vdONg8y/5CfAnroV
	NtEPq7x13ZbH36aavigN4y3rL3ilr+4/Dbh0zcZ8m8butdsFrFuxj6hdWmfZY+Yqr1W6Iz31i4A
	W8Hr+OGxC7pRoUJDfc8z8SEpZmejtIh+f5Zl4fKnmEfwqfucQ6i4LPm1LGCdiSxO+gEOg1fh9RB
	5+ikimmuBWBKTllcNBJ70Z9be7N
X-Google-Smtp-Source: AGHT+IHCmhofwlum7RFsnzuG4SHG4MeClK25bYbk2c4ht0BmcwZGzCXnbngPnfN9hvzdP6/iledHLIE7saArquEgICo=
X-Received: by 2002:a05:6512:3b9e:b0:55c:e95e:cd63 with SMTP id
 2adb3069b0e04-55f708ecf1dmr4037546e87.30.1756880913401; Tue, 02 Sep 2025
 23:28:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250816-tegra210-speedo-v1-0-a981360adc27@gmail.com>
 <20250816-tegra210-speedo-v1-5-a981360adc27@gmail.com> <7006329.Sb9uPGUboI@senjougahara>
In-Reply-To: <7006329.Sb9uPGUboI@senjougahara>
From: Aaron Kling <webgeek1234@gmail.com>
Date: Wed, 3 Sep 2025 01:28:22 -0500
X-Gm-Features: Ac12FXw2NcR6-NwMJb8C9rmUUCR9BBm4abWT_dAL6lr3X3AYd7Jjy0NyEvmTgdU
Message-ID: <CALHNRZ8pn9shfq6PdeVe+CEzbq9wu-Vv6UDvD19=MsFrZQsBKg@mail.gmail.com>
Subject: Re: [PATCH 5/5] arm64: tegra: Limit max cpu frequency on P3450
To: Mikko Perttunen <mperttunen@nvidia.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Joseph Lo <josephl@nvidia.com>, Peter De Schrijver <pdeschrijver@nvidia.com>, 
	Prashant Gaikwad <pgaikwad@nvidia.com>, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Thierry Reding <treding@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 3, 2025 at 12:50=E2=80=AFAM Mikko Perttunen <mperttunen@nvidia.=
com> wrote:
>
> On Saturday, August 16, 2025 2:53=E2=80=AFPM Aaron Kling via B4 Relay wro=
te:
> > From: Aaron Kling <webgeek1234@gmail.com>
> >
> > P3450's cpu is only rated for 1.4 GHz while the CVB table it uses tries
> > to scale to 1.5 GHz. Set an appropriate limit on the maximum scaling
> > frequency.
>
> Looking at downstream, from what I can tell, the CPU's maximum frequency =
is indeed 1.55GHz under normal conditions. However, at temperatures over 90=
C, its voltage is limited to 1090mV. Reference:
>
> static struct dvfs_therm_limits
> tegra210_core_therm_caps_ucm2[MAX_THERMAL_LIMITS] =3D {
>         {86, 1090},
>         {0, 0},
> };
> (rel-32 kernel-4.9/drivers/soc/tegra/tegra210-dvfs.c)
>
> Here the throttling is set at 86C, I suppose to give some margin.
>
> 1090mV perfectly matches the 1.479GHz operating point defined in the upst=
ream kernel. So it seems to me that rather than setting a maximum frequency=
, we would need temperature dependent DVFS. Or, at least as a first step, w=
e could have the driver just always limit the maximum frequency so it fits =
under the thermal cap voltage -- the temperature limit is rather high, afte=
r all.
>
> If you have other information, please do tell.

I am basing on this line in the downstream porg dt repo:

nvidia,dfll-max-freq-khz =3D <1479000>;
(tegra-l4t-r32.7.6_good kernel-dts/tegra210-porg-p3448-common.dtsi)

Which in the downstream dfll driver limits the max frequency it will use:

        max_freq =3D fcpu_data->cpu_max_freq_table[speedo_id];
        if (!of_property_read_u32(pdev->dev.of_node, "nvidia,dfll-max-freq-=
khz",
                                  &f))
                max_freq =3D min(max_freq, f * 1000UL);
(tegra-l4t-r32.7.6_good drivers/clk/tegra/clk-tegra124-dfll-fcpu.c)

If I read the commit history correctly, it does appear that this limit
was set because the always-on use case was failing thermal tests. I
couldn't say if it was intentional that this throttling was applied to
all use cases or not, but that is what appears to have happened. Hence
trying to replicate here in an effort to squash stability issues.

> Incidentally, some of the CVB tables in the upstream kernel seem to ignor=
e speedo (I assume they are conservative) while rel-32 has different tables=
. So the upstream kernel is probably running at slightly unnecessarily high=
 voltages.

This is worrying as well, though most of those tables cannot currently
be used as the fuse driver never assigns those cpu speedo ids. All I
checked in this series was that the correct cpu speedo id was picked
and the appropriate CVB table was applied to p2371-2180, p3450-0000,
and p3541-0000. I haven't yet researched what the speedo values mean
and do. There's many other sku's missing as well. Such as the one's
used by the shield tv's. I have as of yet been unable to boot to
userspace on p2571-0930/1 or p2894-0050, so I haven't determined which
sku(s) are used by those to add them here. I'm in the process of
getting uart access to continue that endeavour.

Aaron
