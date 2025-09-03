Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3D272E2845;
	Wed,  3 Sep 2025 08:01:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756886491; cv=none; b=YR0lbNWWCsou/FXvXft9WQw9VivGqDPSqwL/oJAW26BHAKtmAyRS7ZtE2WpOhPVyo7E6cnbCunNwRAEowbWrCfHT/OA7+IMF4Lok/fpDQLNstDo5HyjArLikOswWCLgtkJHA0AhkjGRf4LOkZuJ1H2UdYwBXNjGomlOHqB+BsUM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756886491; c=relaxed/simple;
	bh=5adYNtw8eeCPBlwESfeKES9xQnEhpvXhnoWbYivNGTA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=L6+avpvIcwxb11UwLu9tPBX60ZzJgM3c2qegk2gd0KM+figjfGhs5Cf4bBafXJB39zn/DWX8EwG8jIduJ7JGQB4xgDIln3YupULKtKst5URD8DDJWss2S50enK9rdOWXHUTc8FzKbctbGH7E1mbkeMm92BnJ0rYKTNskvGofaq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OGLfcg+m; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OGLfcg+m"
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-336ce4a894cso28021311fa.1;
        Wed, 03 Sep 2025 01:01:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756886487; x=1757491287; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NZeYwMyzCuzis//8vlsX2RpvnF5aLJyp6/ELWk/TlGY=;
        b=OGLfcg+mTA/AHgW1hHVjAsj4F3EwvzysbUspHyLcQdJNOzcIbAO17IR/MZUjKj171y
         0VZL1MQESYDhfy7cbC2eOhgRFc79ruldiCBbTpQi6jfmoA96xqG9Nkoh8IlofiTK9PaK
         b/jc9TiQwimoqx/zJdbk7NkKKTXg1VZW5DyqaXBt9uEQcTON1vHvtKGdM7bhf3/R+j4i
         mjKbXDu1kTIKmYDvwIfVNjRUgoZRTM2bYap25IZA190wOeyo2LhmsjElehe0EYBYdY46
         /27/SfwQIohgMAtZcKcDEiwpzvszL1/c0XcvatCJzkdC+CIqNvWfe86NAoWHTDDJH122
         sofA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756886487; x=1757491287;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NZeYwMyzCuzis//8vlsX2RpvnF5aLJyp6/ELWk/TlGY=;
        b=MxIcS3AIqWBDk6hAy4bOn7z56YISEBMExgRtwC9R/e8nJsWdYhy0nltXgm3Fq5DESa
         w1/+YqlO4hqRIqnquQ715JsDjkZ/G8baymeVXIMwhxNtMnuf7WqES19Rsd2tMtGXvutl
         vNgGd1eIEl5vX6wJkkAitzNOUfr/NIKXEwnXBG81sPx3IThK+4zElt1A/iIT8P1hMEsM
         7QXdhVMzMm/NFAy6elFXzaDiMQtsWzqR6HdD1tIfUmOZgfGObc24iQfgJEr/y87TU7mq
         VvEaYMoLAt0cP41FuUYqwbyhGlT5peAHH8Sl5qXa5Rb8FzeyRpijFm+UtRUty6BLxWTx
         eRMA==
X-Forwarded-Encrypted: i=1; AJvYcCUQ99UqecZv4dYRTELYCJpaIUMjL0cEPWwn4xBIIGSgiouWv7X/mwn3NWJIuITjYZQLIBwVMw1tIrsR@vger.kernel.org, AJvYcCWVROk+FcVm7i83c7Ix76EN+Fyvh33HZ4uIZK+GLJG27s4cOOJDqON8DH2rY+pKZgQm2JNdTPGmk+q6o6u+@vger.kernel.org, AJvYcCX8JQ7G5eIhdMbMm95+nZoh+Ol10oZrBEATdBxhQ+VfX/kiYD+eqNDB+r9X9UqaWKdKMkyZ5tGEA+O4HAY=@vger.kernel.org, AJvYcCXl+6JYZIk27CH09czBLM/u2rtVYCZBqvOmWWpmoY4vV9ZNrQGVwm+iQYF7t3ew6ZqXpo4O0lM7lTOn@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6P1tHDa71zzCUc6cuDmBjVPBqBGDK44j6OwUmPaymbxXc1vDF
	xO++V9WItwyToB4owc31PEI7J1f09FwF+U+yULOfdS6oYtqNiThaUtmX9B0g+eepS7MzQRiDGG7
	rENEi5kLyAF3T5Ip1hL0PKwMZ/fb+SYo=
X-Gm-Gg: ASbGncu942lJdqSXJYzX/hm/FWbHAN12cw140pA9Fa/4UZ1xQvuN32p8K2WXnEBwMNy
	yfz1pewl3DRaf8E2QFRubmliCdrfhhe5rCthUbixSznubqVTLh+Lt100eEassspRd+jFOv+0Nup
	21uqCTg+G8mbYwbbhkzNmJ1Gyw2eBWjql5UFJBb5EVBEvQo43UX/fBGQeJFSuRiVCl90KzfiAn4
	q2G6d8=
X-Google-Smtp-Source: AGHT+IEI3I+GxVBPOF8gc7J4Oqd1/t5YV0Bte28WUjFe0d65Vgbk1ymjWZhh2AJoHnXTXqniFHPbds6D5HMab52iYDU=
X-Received: by 2002:a2e:a54a:0:b0:336:e199:6d87 with SMTP id
 38308e7fff4ca-336e19972ffmr29514141fa.13.1756886486085; Wed, 03 Sep 2025
 01:01:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250816-tegra210-speedo-v1-0-a981360adc27@gmail.com>
 <7006329.Sb9uPGUboI@senjougahara> <CALHNRZ8pn9shfq6PdeVe+CEzbq9wu-Vv6UDvD19=MsFrZQsBKg@mail.gmail.com>
 <26156028.ouqheUzb2q@senjougahara>
In-Reply-To: <26156028.ouqheUzb2q@senjougahara>
From: Aaron Kling <webgeek1234@gmail.com>
Date: Wed, 3 Sep 2025 03:01:14 -0500
X-Gm-Features: Ac12FXxmKZYRO3zLyOtCmaUxx74vfBoK6p_zw0GKyByqvrfdOXN-TWzcf3hp-tk
Message-ID: <CALHNRZ894WcNaAuLFoDLwJ8mXDRM8PzdqRFzcyYUMPy+0q0nMw@mail.gmail.com>
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

On Wed, Sep 3, 2025 at 2:29=E2=80=AFAM Mikko Perttunen <mperttunen@nvidia.c=
om> wrote:
>
> On Wednesday, September 3, 2025 3:28=E2=80=AFPM Aaron Kling wrote:
> > On Wed, Sep 3, 2025 at 12:50=E2=80=AFAM Mikko Perttunen <mperttunen@nvi=
dia.com> wrote:
> > >
> > > On Saturday, August 16, 2025 2:53=E2=80=AFPM Aaron Kling via B4 Relay=
 wrote:
> > > > From: Aaron Kling <webgeek1234@gmail.com>
> > > >
> > > > P3450's cpu is only rated for 1.4 GHz while the CVB table it uses t=
ries
> > > > to scale to 1.5 GHz. Set an appropriate limit on the maximum scalin=
g
> > > > frequency.
> > >
> > > Looking at downstream, from what I can tell, the CPU's maximum freque=
ncy is indeed 1.55GHz under normal conditions. However, at temperatures ove=
r 90C, its voltage is limited to 1090mV. Reference:
> > >
> > > static struct dvfs_therm_limits
> > > tegra210_core_therm_caps_ucm2[MAX_THERMAL_LIMITS] =3D {
> > >         {86, 1090},
> > >         {0, 0},
> > > };
> > > (rel-32 kernel-4.9/drivers/soc/tegra/tegra210-dvfs.c)
> > >
> > > Here the throttling is set at 86C, I suppose to give some margin.
> > >
> > > 1090mV perfectly matches the 1.479GHz operating point defined in the =
upstream kernel. So it seems to me that rather than setting a maximum frequ=
ency, we would need temperature dependent DVFS. Or, at least as a first ste=
p, we could have the driver just always limit the maximum frequency so it f=
its under the thermal cap voltage -- the temperature limit is rather high, =
after all.
> > >
> > > If you have other information, please do tell.
> >
> > I am basing on this line in the downstream porg dt repo:
> >
> > nvidia,dfll-max-freq-khz =3D <1479000>;
> > (tegra-l4t-r32.7.6_good kernel-dts/tegra210-porg-p3448-common.dtsi)
> >
> > Which in the downstream dfll driver limits the max frequency it will us=
e:
> >
> >         max_freq =3D fcpu_data->cpu_max_freq_table[speedo_id];
> >         if (!of_property_read_u32(pdev->dev.of_node, "nvidia,dfll-max-f=
req-khz",
> >                                   &f))
> >                 max_freq =3D min(max_freq, f * 1000UL);
> > (tegra-l4t-r32.7.6_good drivers/clk/tegra/clk-tegra124-dfll-fcpu.c)
> >
> > If I read the commit history correctly, it does appear that this limit
> > was set because the always-on use case was failing thermal tests. I
> > couldn't say if it was intentional that this throttling was applied to
> > all use cases or not, but that is what appears to have happened. Hence
> > trying to replicate here in an effort to squash stability issues.
>
> I can't see any reference to failing thermal tests. Can to point to the c=
ommit?

In the porg dt repo, commit hash d1326f08, which adds the
nvidia,dfll-max-freq-khz property, the message body states: "Set
CPU/GPU Fmax limit for 24x7 105C UCM." I read that to mean that the
24x7 always-on use case model was failing to stay under 105C unless
the cpu and gpu frequencies were limited. Is that an incorrect
reading? 105C is kind of a crazy number anyways, beyond the soctherm
critical shutdown temperature.

> I looked into why this was added for porg -- it does not seem to be relat=
ed to reliability, but more so consistency of performance. I don't think th=
at's a huge concern for upstream -- though in any case we should be capping=
 the frequency in the DFLL driver for now since we don't support dynamic th=
ermal capping.

So the whole conversation winds around to: The change is valid, but
the commit message needs better justification?

As a side note: I'm still chasing multiple stability issues on various
t210 devices. Though, the only one I've seen on p3450/p3541 is that
nouveau intermittently fails to init the gpu. Just hangs on probe and
eventually something times out, stack traces, and causes a panic
reboot. Seems to be about a 50/50 chance for me, but works fine if
probe succeeds. For another dev, it only works once in a blue moon,
but still dies shortly thereafter even if probe works. I thought it
might be related to the cpu/gpu getting 'overclocked'. But even after
this series, the problem persists. So maybe me calling this underclock
a stability fix is inaccurate. But stability issues still exist.

Aaron
