Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BAC413C695;
	Thu,  4 Sep 2025 01:55:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756950929; cv=none; b=rn3BwDXZio24umEJ+DnSuiUB2lCDFJBWylaDpIiUOgyRj60519FhBdfj2RjQnro5elOArmov1OFuFgzl/I0idtlSGaeiFhZvN7UgTTVowGuoxkaGSQLHI8KrctmATt35zJ2ouZeffulrU7jT9zaKvqeX+FkxHY4pSQZOq0B/3A4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756950929; c=relaxed/simple;
	bh=z1CwDMrW/wZw91lPM0+5CsrDOfUzBV77U9GCkhvrhsk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lXE9i/LW5JOlGGtA9llsi4BiTmWyuwJJO0owmO3c//OYtGSXDEaxEsI2QaNvzgWxROsOURj+x+3D9xOxH1r1I7XIiFvhqzcrgUJ4ckbxVxkmjjUXNb514gPfEYM6LcNHMMiKB4iviAtn/6xDmdOoHwLbyJfpEK6QlGkCX8o4WrE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aL/IhOv0; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aL/IhOv0"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-55f69cf4b77so558214e87.2;
        Wed, 03 Sep 2025 18:55:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756950925; x=1757555725; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HLG0DSgHB2AINxOoZVWx4bl4S5WlCeyWoCbSypykd+g=;
        b=aL/IhOv0cXwQuLLTztfwHYALL9C7fyUTZn0+ff8lKvICoOV7ZUA7MDM/Y0t1fsAEKR
         eFjfUBlD81xSz7JNignvxKUuV0urWyP4hwpXmdo8caNywGz0ICufaByg3n/C5ECwuqMB
         K3MTtlZJa8577xU9Qxg8ZUF8wmgpR1PM30Qxmof+UtlgdTNyPPHBNcli3Z5CGkMcR32v
         347aYcMzxIG3+obVVDSzVp0WcgwTT8Jj6yFip72/GM2MO3n2Jrt44XWuxN9TvuwnseJ0
         R0HdR4II5YFZ9vRwfldpcDHmDA3RYDKXXR6OYDE+U+SSs6Ecl9+mut3PtT1+qQNewZPX
         RVew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756950925; x=1757555725;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HLG0DSgHB2AINxOoZVWx4bl4S5WlCeyWoCbSypykd+g=;
        b=jRHxm6jLwLWps2ldAyRAFCLFEq8rUTXBhx6IFnfHtLHYAiPr4JySgpwMA7Eh0oXby2
         J10toR6eJVfNzsplmF7OrPX6SFwZHRPw4mr/FAPJCuHvCJ3DT1ptAGwuQNeO3toPPHbQ
         5UozRFlQnfhZMCPieAS2kxX7kERBWsm5Beq4uJP7VubaznPNTtOsjWabupXEugXcqdAe
         nIoZzII0ZBK+XDGSucsp8jvwNbxxzDFPb0UCLZqpX6w5sDclA417TY56Nb3h9fULu++h
         Z1PHQ0As5LroNEgLvjbEtlKORcXy1GnPL/EfROZrcFTTB73WwAUWeo3BppphKp8n+mLs
         +iLA==
X-Forwarded-Encrypted: i=1; AJvYcCVNk2i8mQFEBu8Mm4bJ//555D8/GjjKZONkgbSkH5dt/OWcRGRUDo4l02Ye6ck9LyjHbQxeRqsKg4/b@vger.kernel.org, AJvYcCVTSXttzgzBdcq8R2LBbe+HdxEJSVlcw1Qm5beoACseyPuES6XBVpsnPrJF8xAnA9iIlWEJWT+uIYpb@vger.kernel.org, AJvYcCWJKNGF+6iMk91xnalwX2gRqTRt5HpPbqD9DB0rBcDDeL1+nCdd94VVWyHugtjuTbAlDIs00Sp3/WQy2O5l@vger.kernel.org, AJvYcCWsxvn4RqEBneYj6L9XMrzKl8oBK4CCUtBZrJmt5hNDd6OGPtfs9yaAusvWRCQxSHnxHNpIZVg9DsKtTu0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+nYtz5WhRg1phZmwaXtqpv4atR7bHxEZI1L5A4X/rwI4CxoAE
	5HF3JPOUS7sDIqLr8yEM0RA+Gof7/Hu/AEwCmJJnDHN/plIrgWDW16VjudRraBtUjfk7SEGngJE
	+P6XFPcQ5VgfDe7G/87OupVLizNyiAxw=
X-Gm-Gg: ASbGncupKd/joF8KFLDJL5pnwnU+Y1c5YBD5WUa2bDwQfiuwZpzVQ8HlGdmXCoCACGy
	RaeZTI3KD2j+RMj8brLYTaR2CQ3Hi8KbvyJ7ZwamKUbYeNCf0+QKOwMSk9U98TQNZgPpYDzGd7+
	28GnjVBJC99uQ/7YLlqoaUDqqjN0RUOY2+dv5XHd8G8QIg51l/CMva4XukCBu8SyoomUnrRbcJH
	gxCR8FgzkhHLqqs6g==
X-Google-Smtp-Source: AGHT+IGz1wtV+gVZ44/7zWYiZepuh0kLYJU7upNdtxprFKlXRf79bTKOD6aQgFkhooo9LOubQDnW3P4JtM6aNPVl4CA=
X-Received: by 2002:a05:6512:1417:b0:560:8c58:6cd7 with SMTP id
 2adb3069b0e04-5608c587036mr1348684e87.5.1756950925157; Wed, 03 Sep 2025
 18:55:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250816-tegra210-speedo-v1-0-a981360adc27@gmail.com>
 <26156028.ouqheUzb2q@senjougahara> <CALHNRZ894WcNaAuLFoDLwJ8mXDRM8PzdqRFzcyYUMPy+0q0nMw@mail.gmail.com>
 <8194755.G0QQBjFxQf@senjougahara>
In-Reply-To: <8194755.G0QQBjFxQf@senjougahara>
From: Aaron Kling <webgeek1234@gmail.com>
Date: Wed, 3 Sep 2025 20:55:14 -0500
X-Gm-Features: Ac12FXxLT_e5MU2fnTigOv2SVdMZCKSueXgLw3o0A0mxrhqQ6JHy32mW3xL3eNo
Message-ID: <CALHNRZ-59esnHPeQ6XD3CUAOFUMB4gAF6XxikrQ+iwsPWObfYA@mail.gmail.com>
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

On Wed, Sep 3, 2025 at 7:56=E2=80=AFPM Mikko Perttunen <mperttunen@nvidia.c=
om> wrote:
>
> On Wednesday, September 3, 2025 5:01=E2=80=AFPM Aaron Kling wrote:
> > On Wed, Sep 3, 2025 at 2:29=E2=80=AFAM Mikko Perttunen <mperttunen@nvid=
ia.com> wrote:
> > >
> > > On Wednesday, September 3, 2025 3:28=E2=80=AFPM Aaron Kling wrote:
> > > > On Wed, Sep 3, 2025 at 12:50=E2=80=AFAM Mikko Perttunen <mperttunen=
@nvidia.com> wrote:
> > > > >
> > > > > On Saturday, August 16, 2025 2:53=E2=80=AFPM Aaron Kling via B4 R=
elay wrote:
> > > > > > From: Aaron Kling <webgeek1234@gmail.com>
> > > > > >
> > > > > > P3450's cpu is only rated for 1.4 GHz while the CVB table it us=
es tries
> > > > > > to scale to 1.5 GHz. Set an appropriate limit on the maximum sc=
aling
> > > > > > frequency.
> > > > >
> > > > > Looking at downstream, from what I can tell, the CPU's maximum fr=
equency is indeed 1.55GHz under normal conditions. However, at temperatures=
 over 90C, its voltage is limited to 1090mV. Reference:
> > > > >
> > > > > static struct dvfs_therm_limits
> > > > > tegra210_core_therm_caps_ucm2[MAX_THERMAL_LIMITS] =3D {
> > > > >         {86, 1090},
> > > > >         {0, 0},
> > > > > };
> > > > > (rel-32 kernel-4.9/drivers/soc/tegra/tegra210-dvfs.c)
> > > > >
> > > > > Here the throttling is set at 86C, I suppose to give some margin.
> > > > >
> > > > > 1090mV perfectly matches the 1.479GHz operating point defined in =
the upstream kernel. So it seems to me that rather than setting a maximum f=
requency, we would need temperature dependent DVFS. Or, at least as a first=
 step, we could have the driver just always limit the maximum frequency so =
it fits under the thermal cap voltage -- the temperature limit is rather hi=
gh, after all.
> > > > >
> > > > > If you have other information, please do tell.
> > > >
> > > > I am basing on this line in the downstream porg dt repo:
> > > >
> > > > nvidia,dfll-max-freq-khz =3D <1479000>;
> > > > (tegra-l4t-r32.7.6_good kernel-dts/tegra210-porg-p3448-common.dtsi)
> > > >
> > > > Which in the downstream dfll driver limits the max frequency it wil=
l use:
> > > >
> > > >         max_freq =3D fcpu_data->cpu_max_freq_table[speedo_id];
> > > >         if (!of_property_read_u32(pdev->dev.of_node, "nvidia,dfll-m=
ax-freq-khz",
> > > >                                   &f))
> > > >                 max_freq =3D min(max_freq, f * 1000UL);
> > > > (tegra-l4t-r32.7.6_good drivers/clk/tegra/clk-tegra124-dfll-fcpu.c)
> > > >
> > > > If I read the commit history correctly, it does appear that this li=
mit
> > > > was set because the always-on use case was failing thermal tests. I
> > > > couldn't say if it was intentional that this throttling was applied=
 to
> > > > all use cases or not, but that is what appears to have happened. He=
nce
> > > > trying to replicate here in an effort to squash stability issues.
> > >
> > > I can't see any reference to failing thermal tests. Can to point to t=
he commit?
> >
> > In the porg dt repo, commit hash d1326f08, which adds the
> > nvidia,dfll-max-freq-khz property, the message body states: "Set
> > CPU/GPU Fmax limit for 24x7 105C UCM." I read that to mean that the
> > 24x7 always-on use case model was failing to stay under 105C unless
> > the cpu and gpu frequencies were limited. Is that an incorrect
> > reading? 105C is kind of a crazy number anyways, beyond the soctherm
> > critical shutdown temperature.
>
> What that's (trying) to say is that it sets the CPU's Fmax to the limit s=
pecified by the 24x7 105C UCM profile, which is the 1090mV i.e. 1.4GHz limi=
t. The profile is called that because it's normally used for the 90C-105C t=
emperature range.
>
> >
> > > I looked into why this was added for porg -- it does not seem to be r=
elated to reliability, but more so consistency of performance. I don't thin=
k that's a huge concern for upstream -- though in any case we should be cap=
ping the frequency in the DFLL driver for now since we don't support dynami=
c thermal capping.
> >
> > So the whole conversation winds around to: The change is valid, but
> > the commit message needs better justification?
>
> In my opinion, there is no need to add the device tree property in upstre=
am. The CPU is designed to work at 1.5GHz under 90C, and 1.4GHz between 90C=
 to 105C. I think this is a bit of a downstream-ism and not something we sh=
ould add in upstream. If the user wants to underclock, then that should be =
through the cpufreq governor or such mechanism.

Ah, alright. I'll drop property handling and send a new revision.
Which reduces this to only the speedo-tegra210 patch.

Aaron
