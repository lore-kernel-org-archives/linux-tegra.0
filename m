Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F6E63AB285
	for <linux-tegra@vger.kernel.org>; Mon, 11 May 2026 07:51:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778485879; cv=pass; b=qtw33XrRmzt1eiJh9jYmfFie7rmiJ4Y5esGQYFhi5W+l1jYbTdKY0few0TEdcvRfNIySwUnF6VWyzuw70ZnlCqDzuYKnqhYcxKTdAcJxFdpuyEyjXhP4lGbLdrf0gRHYeg+G0/2dvvdSNY0s+DZwHzLB921gwUeM7ScFYzgFBEM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778485879; c=relaxed/simple;
	bh=i/U9A7yRPAY4kDdt2TZne5uXtp7WyfA5K5kW1M/+YpQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nutgQYXSaKmtsafnTinuZswrvmvw6JLZ51RaHTUOenLgT9OT3xfxWnLumGaZhUoUhPMkD7mYcMW59dbqrqhBTTjwnYAtEdInleQPodX+3E1eMfFYdTv59G1sdTb6pB/QqxgJhMO/XrGM5VNqxKRrjUC7ni6q8qXeJ1MY1cT/yKk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qGFi15LR; arc=pass smtp.client-ip=74.125.82.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qGFi15LR"
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-2f30a4601bbso4055823eec.1
        for <linux-tegra@vger.kernel.org>; Mon, 11 May 2026 00:51:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778485865; cv=none;
        d=google.com; s=arc-20240605;
        b=XzPpTZT3Ep6+0K6+xjbEtZGqCesPsV2qSt6QzDZ2laDAX579N6S+JYxU8e7AYKOkRs
         rI29yvCkrg4Thmje6FI5slZDKDGkNQxg1rr/Okm30QkKXgrpMpkxq1j1NFy2X9TjX9dd
         MnxRO9stA3meyf1Jt4sQGiZN7tbWjmz2kajBXyxcceojB+YjmBig7Wem6iovVGwQyNop
         dKhFCHBuzSoD4bYDiPcl09O9ByI72R3B7uHygriNRWCPLszNaf8U3LNc91+lpgOrWxsh
         PbxYkjio/Q4KPIgqM7ItLUwZOPpjcyJ2DOhdcNzuthkPa/vs31KDoB9d88josiM/zvCZ
         9MnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=wyh/IqoMoqEVIxAkKMD1Hz6bqVnL8MjKRcdCkUg4L5k=;
        fh=RRSqGKbBsh8325BAGQ3TE2Zs7MxNrHJcEpZrB9AYTqo=;
        b=MQrkKFL1K0kIciMiY3V2LvcAvUQETQ1wFZzENZ3j1LCBZhfRO4jJW+6//LoDsaN4wo
         BbMukZULI44wdYyxq0TZlXLkLgKrO90mLCN8GMj96nlDxx40VuhQtR62N+6D3iewsKCX
         w2M5LbgEIOnXebB5Lfh42xQ8QRoMLSb8bUG4869sjxY9zdp03R7MF3g0NaFRhYvL4dDC
         xYIaIRbS/ygG0d0JdhyQLPiOdtScOTs9Z5WkGrRye3I3j2JkFraLY+WSnYO8P/JDRPPa
         MkTE87BV5hD4lt3aL+wUy/y6JQ8FaVkn1yXJ0sgI7+EErEcVeHRjwXkPVuzEBmZlz4i9
         dsqA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778485865; x=1779090665; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wyh/IqoMoqEVIxAkKMD1Hz6bqVnL8MjKRcdCkUg4L5k=;
        b=qGFi15LRem2TdiiH5zMNnwmfYPs/ON22DWSGJ8WPG/m2Gdabgy1a7fXEv4x3ZNqC+b
         VG6AqmIEFSxWTs04GFJYJVxs+mPF+ejHVGN2Jr4n/bWagphOTrOwJyBSomsv4LUNpCr9
         yK5G/tAS7ZyyQZmmgrJOZEKJtPckhUEoEeKdA618Jr2f1LrptJYio13mvydWZv4l/2no
         4LtwX1yzpqvI7LJP1E9dDavcI78PbNbLm3HrDPyckM6yhf79p2CRL9XIoTdcsa3zH28w
         BshQYLCuv9eLX0oLWn48SbQJ+0g2m5Xmmf5bg/EfTOsBEkHmF+LhJQXtsWHLYYQHPo43
         rIdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778485865; x=1779090665;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wyh/IqoMoqEVIxAkKMD1Hz6bqVnL8MjKRcdCkUg4L5k=;
        b=FUMGWjGsmfde6k/mt/Q/Y5jmXKieBnfnbsUF5wE7eWEt0U6tmUtBM14gp2j2W+orGQ
         PqEV3QCliM+Efr71ToNQDHvfS9fFrAdxg0NuUxqlLsvT5Ru2f5hk9Rv6cDsjhSelSRUE
         3J6mHYTSLF3R5KPQ4FM0sFHunnxMWjkLFjEFFy5l8qdilSQt/T+8jIGdICFFhsLmV1GH
         bwK7aU1+jWRVb9wLHS603w7cTg56WLg6jsi06lYJAf41aGDam79nBO48ovRpdMGl5FGy
         LxkfjcFLm2tjE3mebbROlRb6i1N5FIAyVV7jROzrlrnQ9BhqxSYsKaZVh0R+RByiwAPT
         nofw==
X-Forwarded-Encrypted: i=1; AFNElJ9aZkLFFOveogDOoSm7CXJmeSZ8F/qotRyQfr+xaxbh9NM/WqF1y1wgjJK+YHBt7J+1/hrd63Nreg8ojQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxAdSFwjGC4N8QE1yKV34kELAGkyw0v47oFN8Rp4TL2Qz6jksj8
	AHFgoC7jxkn2ga8C+S474P65wyNzrm6aqYiDDO6GRK7iTZAWqk9vS8VyfxSBxUFDPtofRxgTsvF
	VwbzfJylxfUYdYyZa7MRSE2TfwUd3i1s=
X-Gm-Gg: Acq92OFEYKLzQJOf3xqqVPbKNGTCJBQFKN29j05sLfOitpKm52t+cH8KwZrY4RR2Yiw
	pSNOiArm/kGfahihiKErBzBZwXra81LnBamdtydtq2jp5bJ0HfdFW6jvcNETG6TdGOhP8B7n1Q9
	Itc1SsZLKOlxpZ/o6/51qdLNNuToySYWW98T0JXSEwrrmi3+mzyscg5SxXELzBMsdlfi6aAQVyN
	judyLAHr5Rn5+WlginpkEyYwZIpOUeGe/Xu0Bpb0uqEC5I3JEoxtMG5OV71syAviYaUpCIupHFE
	UmYNqy36
X-Received: by 2002:a05:7300:fd09:b0:2d9:cfa6:3d34 with SMTP id
 5a478bee46e88-2f54de847b2mr10437683eec.23.1778485865218; Mon, 11 May 2026
 00:51:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260511074752.24745-1-clamor95@gmail.com> <20260511074752.24745-2-clamor95@gmail.com>
In-Reply-To: <20260511074752.24745-2-clamor95@gmail.com>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Mon, 11 May 2026 10:50:54 +0300
X-Gm-Features: AVHnY4IKwqYhBV3GVgfTQtAGxo1bElvhJtqAavzaJZ8v6EPFk7busgpraB9ajZA
Message-ID: <CAPVz0n3i9vvDoQJvQ7914EH9QfguBf9LJusuyTXM01ccoEgK4A@mail.gmail.com>
Subject: Re: [PATCH v1 1/5] dt-bindings: display: tegra: document MIPI
 calibration for Tegra20/Tegra30
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Thierry Reding <thierry.reding@kernel.org>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Svyatoslav Ryhel <clamor95@gmail.com>, Ion Agorria <ion@agorria.com>, 
	=?UTF-8?Q?Jonas_Schw=C3=B6bel?= <jonasschwoebel@yahoo.de>
Cc: devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=BF=D0=BD, 11 =D1=82=D1=80=D0=B0=D0=B2. 2026=E2=80=AF=D1=80. =D0=BE 10:4=
8 Svyatoslav Ryhel <clamor95@gmail.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> Adjust Tegra114 MIPI calibration schema to include Tegra20/Tegra30 MIPI
> calibration logic.
>
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> ---
>  .../display/tegra/nvidia,tegra114-mipi.yaml   | 41 ++++++++++++++++---
>  1 file changed, 36 insertions(+), 5 deletions(-)
>

Please ignore this. This patch was send by mistake. Sorry for inconvenience=
.
