Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01E6C1A2C0B
	for <linux-tegra@vger.kernel.org>; Mon, 13 Oct 2025 02:31:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760322691; cv=none; b=L9MgUHDlsb0a4Aa2WnNilzTCUxn2U2Ofw9v8lGA5r/8JR1Fbs4e8g4xFbu8YiCafneULne5ZvsaxxwvEhn0LjJo3BLeJVEpf/qmDRO3E0ANnng0ODp1OEt+h4HNpc73hbNCTpuHiJ5IbG5/AWZLkPcBQvz9sZbAsvSR6mn8NYSU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760322691; c=relaxed/simple;
	bh=8LMX8B/zIcsHqXsG/2JSe1Mh/g4Ma3Sm+j6Lsj6JgVE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mNbrIuI+vrtPHSeGsSiAyB+HJBMqnas28m/E0OuPNogGmRnVdlOlN77jP6UIgeh3R1wFdcOeZzWYOnF6cXmhzqVIsgYkLWO/jpW5uLMr+zoXfzeM9dHkEBg2PIgZIlOtZXwvsLPTTLR2H1tMtI51rfhGdBvG01WvJMNhuRrxBic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S9yOBkAR; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S9yOBkAR"
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-3696f1d5102so35560671fa.3
        for <linux-tegra@vger.kernel.org>; Sun, 12 Oct 2025 19:31:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760322688; x=1760927488; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8LMX8B/zIcsHqXsG/2JSe1Mh/g4Ma3Sm+j6Lsj6JgVE=;
        b=S9yOBkARB90zWhXVdUXOA3ECg7PjU3IjvUxAbx3eMNiINbs8nYix0HMwCWIlpttgp5
         ZLK6UujfF+N0TG9+uqiyfNS573PA+ArgmzW3C8H4uAUe7BBqHt9AxbtKDEOIgzLS0WFp
         2dip7WiiL3tDeF3EE7N9eytRpyKRwhrFqcCN4+Cg/k+2MFHTUn4v6XUc/h+y2JExDyTE
         fWrQwk31KDnaMgrpvt0+upk7uqx6dqD4385KTPmA9h9BhkfPtIiPvNOGA57cZbRauc2t
         pYOl/5oB7i0isyS88oJ5SeaUg94P7GJ4bZOdzpzJnjbNT6HutFM4m10R0So9UP/5UklN
         MHmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760322688; x=1760927488;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8LMX8B/zIcsHqXsG/2JSe1Mh/g4Ma3Sm+j6Lsj6JgVE=;
        b=ecNeuzrytmCCnIfG/nw3m8ysT01hdigkoIEoFBIpV6EN4Qg8KLpQpITqwEBE1P/+2O
         ZBN3n1SQa0ZiBu0t18vY3YZZOT/VRjdD/Q39Xr/KukoxC0srQOEjn6rd6DwrmvcMhyca
         Jt2s7FzePeVZXplciC9wvoTt0PIcJogCDb4u4ECwVYpxzenES91pRw0sy/s8Yf+Tvo5i
         0ngoi+vfm2WGwQrd8g9a5UtYQF9A2vHvhu67uPTEb81ytELHCf2+TqL00GOaOWFXOorN
         UPlCp2f2bp2T/FOV+G/xCQKR16ipIKM8cbOl155arD8yhssMZk6mzMfufy95hKGrFCdV
         aSbg==
X-Forwarded-Encrypted: i=1; AJvYcCWuBfG2VNNNAvVCePBuO979qO/W5syvWEDXxc5cvW4FQJzURYhTgoL1CPiv0gBV3yFikdIYOXPAom7heA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwXcvJ+NpuK72uIjPEcoCb4BHztbw/SfTNTHrRWqMTJplPu+/Up
	woWust9ikzEHNL2p9fC/UoftKq5NMUeX/68OhWoEnjsHpiR3de2zWuOZX1v5j+m1aXwhp6E+CmM
	VNePlIJqQiaGHytZQLPU8B964KWJVWKA=
X-Gm-Gg: ASbGncthO5cc5GdZjyrbque0oNhG4+ssGy/5PX1nRnxclTw4647bkIrfKN+5TDiGdLc
	9YTgJsQRVsJmAvsKLWzcUKiaRPJvIamb7quYKkXwt8AAhrA8vMjbQ4ggqUqqJqLUKRGZrX4KraD
	qOebC8Y55sxLf9Dd5Tw2yA+wOfe5i5jvdaP7mXGXajONKYutH/8FekFCWRsaiK/40OoIitJcaDu
	3bLk/xoPiakYE/N2HmmNM3X2A==
X-Google-Smtp-Source: AGHT+IFRT685XkwUNzk5PhXFn6GMYMylCx2gOKDiRDewwcWZ5qj+WmimYT/Kd+PA+8NnMbbozb9K9GIPVdUVubwUVNw=
X-Received: by 2002:a2e:bc8c:0:b0:32b:35e6:bbe8 with SMTP id
 38308e7fff4ca-37609e0bf49mr56094441fa.21.1760322687901; Sun, 12 Oct 2025
 19:31:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250909-tegra186-icc-v2-0-09413724e781@gmail.com>
 <5d7491b1-8f9a-4040-b854-ff0b94bfd24e@kernel.org> <CALHNRZ-okVZ8tzKYa=jqudDu3dZ_Yq1CkeErdcvxi5xJEgJFbg@mail.gmail.com>
 <113725e3-3e82-4921-b045-8d5be3fed8bf@kernel.org>
In-Reply-To: <113725e3-3e82-4921-b045-8d5be3fed8bf@kernel.org>
From: Aaron Kling <webgeek1234@gmail.com>
Date: Sun, 12 Oct 2025 21:31:16 -0500
X-Gm-Features: AS18NWAQiJg9z3LG2V5OdhoyC_61Fi6TbvtfpQle0_MdoVmLu8cof-HknUSef78
Message-ID: <CALHNRZ8r_bg-Pm1ZCoJT9sk++zQcq85R=8N6enL_Vcq=VziNwA@mail.gmail.com>
Subject: Re: [PATCH v2 0/8] Support dynamic EMC frequency scaling on Tegra186/Tegra194
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Viresh Kumar <viresh.kumar@linaro.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, 
	linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 12, 2025 at 9:25=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On 13/10/2025 04:18, Aaron Kling wrote:
> > On Wed, Oct 8, 2025 at 7:05=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel=
.org> wrote:
> >>
> >> On 09/09/2025 15:21, Aaron Kling via B4 Relay wrote:
> >>> This series borrows the concept used on Tegra234 to scale EMC based o=
n
> >>> CPU frequency and applies it to Tegra186 and Tegra194. Except that th=
e
> >>> bpmp on those archs does not support bandwidth manager, so the scalin=
g
> >>> iteself is handled similar to how Tegra124 currently works.
> >>>
> >>
> >> Nothing improved:
> >> https://lore.kernel.org/all/20250902-glittering-toucan-of-feminism-95f=
d9f@kuoka/
> >
> > The dt changes should go last. The cpufreq and memory pieces can go in
> > either order because the new code won't be used unless the dt pieces
> > activate them.
>
>
> Then cpufreq and memory should never have been part of same patchset.
> Instead of simple command to apply it, maintainers need multiple steps.
> Really, when you send patches, think how this should be handled and how
> much effort this needs on maintainer side.

To be honest, I was expecting all of these to go through the tegra
tree, since all the drivers I touch are owned by the tegra
maintainers. But getting stuff moved through that tree has been like
pulling teeth recently. So Krzysztof, what's the alternative you're
suggesting here?

Aaron
