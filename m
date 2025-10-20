Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64B592C0268
	for <linux-tegra@vger.kernel.org>; Mon, 20 Oct 2025 19:28:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760988519; cv=none; b=YfaFyYHc2unTUe/E/9atpD9pv2dYzzxdD+h546quJbsfBVz/927/yODbEHaWyz90d+u1TH96TY+OSl8OSsgOdkg2SiiY6SUvJHblyFPVtUK9rk5OuhxYWZFg/4ZH1H5utZS/JoKvkdOPd1D9TjipHqqnA5VI4CnudtXF8IYhXeg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760988519; c=relaxed/simple;
	bh=p7xYeF0WlMh71JeISQYSQHf2LpPiKT+ylBcdVGC2AqU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AGSSU4l0Sgm5ag/Si8hADQbgwwlI+MLdkqZPOOfYuJRUmCgiJqeoffn5QhiEOZ1ru6IxzgyA6cftI3la7c7zJXJDMpz0tp6kYUmaSzMORUJgB+WPkrOxeBfCRuqhtNFWE4SNw9CfEKM0T2fokaYK2Rm6pZVfskyG1uHTTHD1z5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TJGO/Lg/; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TJGO/Lg/"
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-579363a4602so4757825e87.0
        for <linux-tegra@vger.kernel.org>; Mon, 20 Oct 2025 12:28:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760988515; x=1761593315; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mMg83nd2YrTgwcvW3RZ6bW/OIA8b6kbsYQV4BXY32dU=;
        b=TJGO/Lg/3ZI93Doa2cyBSYdG6jGqWq5DvF/eqVzDpPPyMRBa6AD0YhzNX6Jd4wcAfA
         vsCuM3uiNUVCwqVJDiG8onEnDMq3gnhXC3i7sJuGv/JQ61TVrUcnRPyBvEy2hAmJyRwV
         ygZD2Ep/HAgDkZWgN8pIeclFa8whL6MXt9cCH9gAmXxoOOzETXTG2dfr3NkQfN17hrA8
         P2oIWCCVoPU4Fgq06zo5DNzQhUcg5Zyl7DzUMNqyzsaCSLXmjcE2kxIkczEjobnlHxaW
         WPImJXTGIUmsPXISTMrgoO7xZKATCaEDgVSn/GrsQWhBBoDaeB0PhYtbwynLVgt4nGvJ
         V39A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760988515; x=1761593315;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mMg83nd2YrTgwcvW3RZ6bW/OIA8b6kbsYQV4BXY32dU=;
        b=EfutnVvek3+naQGR5wZX9RuPg0lyip5HO1WWMYuOHtF9qM8GyinomMkUFypYCoLVhv
         d863QmYW5PSsK/hFfXX7IugzJXbeo+2jy87hhb6u/+msBDaUcEDtV4u0VHtQ9IpwQY1P
         b0smCW6J/nwCZpoB5VLNORpDhhI7IR+9vip6aIMAnnLPQ4HckgjjN3h3jjK/Xbs3Ebcy
         Fsu9nyfmT7/X1SwKYY1bwICGl64puepdQE4+Sj31M+5zStVBjbtq6zCfQ72cYNomiQsU
         T7MeJl2prM+IWAf+AYju5ibKBMKuZlPHrhH9MWQqcdRsekG9oLvq9kWFut5uBxq7cgUn
         2BVg==
X-Forwarded-Encrypted: i=1; AJvYcCXgJem4wVpLzU81ECts3NlMBwu6Adb5wjTTEYgqXWjR1nck3thQ8zEfNapCvVsM24Cv++mTX8P1CnlOXw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxqQsA77BTDhekA6aqXPbVZSXaaPB02Ln+731r53yYFqKcFGgl5
	RSq7OvFGCJ/spUjvp4U8a9OO8ojwZ5iDulmhMBPUVqpLlLAI6w/EKm5KIEKaAitJ/j1gX7t1S4H
	bzzZLHSfZ0V+aijBEIegiC53afqAoFsI=
X-Gm-Gg: ASbGncsj4sV0qesiIL77/kXNNxPdAbCmx4ys2kCojEi0NouuEgKqVgxc27Y8AQJbIaS
	n4TX671iN0QdWYUhmiqQUAGfSgA1saHiAbY/PpbC4dy8oJ3/QCgvceuByO3SsZJVp49JpYPnvUX
	fqjxFzSABILm84/HFz8cMmXM+x4Zu2hqwpB97d3goKutv5Vj6KspaYyAw9EwmnqevcC9YOivO0t
	jyjNQdRmouOm9iNTQCJPW9OPrT2clhhwwYyS7WRBCouIhApHlRdALH50BnEh8OHHNV6T9OnKntO
	tVyOLkEvgQYyEDPjAw==
X-Google-Smtp-Source: AGHT+IGBoVkVev7OLhVh5KiRwW/MZskLumEnnwL6WLxBkk2eAfCxIeEvBR17BmPX3b8GgUCopYGwgBk2P/JNXv/x5+E=
X-Received: by 2002:a05:6512:1307:b0:57e:b9a:9c82 with SMTP id
 2adb3069b0e04-591d85836e7mr4364166e87.39.1760988515325; Mon, 20 Oct 2025
 12:28:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250803-p3450-mts-bug-v2-0-6307125408c3@gmail.com>
In-Reply-To: <20250803-p3450-mts-bug-v2-0-6307125408c3@gmail.com>
From: Aaron Kling <webgeek1234@gmail.com>
Date: Mon, 20 Oct 2025 14:28:22 -0500
X-Gm-Features: AS18NWBlNKt3MmTfiejt6ZGCRffbefMOPo_ko_DLqTSSs5UW2n7AtLASjfzoSFc
Message-ID: <CALHNRZ8ycMNA-OLx=hWNmetqxioDSbt2mRH=_NXr2zLu_pbJoA@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] arm64: tegra: Add reserved-memory node to L4T
 Tegra210 devices
To: webgeek1234@gmail.com
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, devicetree@vger.kernel.org, 
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 3, 2025 at 10:14=E2=80=AFPM Aaron Kling via B4 Relay
<devnull+webgeek1234.gmail.com@kernel.org> wrote:
>
> Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
> ---
> Changes in v2:
> - Add patch for P2180
> - Link to v1: https://lore.kernel.org/r/20250526-p3450-mts-bug-v1-1-78500=
613f02c@gmail.com
>
> ---
> Aaron Kling (2):
>       arm64: tegra: Add reserved-memory node for P3450
>       arm64: tegra: Add reserved-memory node for P2180
>
>  arch/arm64/boot/dts/nvidia/tegra210-p2180.dtsi     | 6 ++++++
>  arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts | 6 ++++++
>  2 files changed, 12 insertions(+)
> ---
> base-commit: 0ff41df1cb268fc69e703a08a57ee14ae967d0ca
> change-id: 20250526-p3450-mts-bug-02394af31f0a
>
> Best regards,
> --
> Aaron Kling <webgeek1234@gmail.com>

Reminder to review or pick up this series.

Aaron
