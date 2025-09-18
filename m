Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B49EF248F75
	for <linux-tegra@vger.kernel.org>; Thu, 18 Sep 2025 17:20:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758216011; cv=none; b=EF+WoAFzLaxeraGn4YMX9sP+tAAHUWvkfWviGqXrUQ7L0Wd7acPHsrHExT3WFqenYNr75LdH9E2trfCpUEeGdFamQWjEsEGb0GurWoHshfUBS/KJxh4kTIKq5ctrLs20pWFYkti/XssY9ZwEYdj65TH7Q8xhvIprvzVx/tHe1vg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758216011; c=relaxed/simple;
	bh=nVGCJuiI7kWF9V3S5fkMQr27m9yi9NsvtbuKKTw2jCw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PZ+iwyaLwun8j3QlxwxXC9H6qvEpA0uvqk5slwr0OBQASXZU8Dbtbfa26t4teeYuI+Nqca4E5ChfgCtXBLf9PKGGMGbsPQvrBtqGBnXzJCcb2oj2VoWU0ATXNCGXj2ytKo6VECL2FQeSHJho0DrAAKdyZn1/1WqL3/QtyAR5DXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fOxoy+fe; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fOxoy+fe"
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-3618e9ef33bso10232911fa.0
        for <linux-tegra@vger.kernel.org>; Thu, 18 Sep 2025 10:20:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758216008; x=1758820808; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nVGCJuiI7kWF9V3S5fkMQr27m9yi9NsvtbuKKTw2jCw=;
        b=fOxoy+feg4MoTyOy5LVonTifeT6b3V3bfqnweshtJnLhixTwNK2jsWoSmmoAxcm/ac
         Fzj46Tic/BYVSKAf//6yfaRu9KjsEUKMmLB9nEuzy4QwxHRP5CyjFJXUiF1q/PFK5mwJ
         owayB5snqLa3QhLB+ti8Nj7Qgh/W5c7V25f5hsK+t0K+McCccLRtf4n0pI/oTXXBKlm5
         /62z1QtreBNAHUA9ZIeQhq5WV55ph78/hSD3HOBd6D7HrROIdbRyoWcrgvHPpz7qHy3n
         o6bucDCM6GEAa0FplwwPSENUP04FJe9FOL2KEzzWuD1mi4MQBCAcl77vuY7P5hIo65YQ
         Mh1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758216008; x=1758820808;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nVGCJuiI7kWF9V3S5fkMQr27m9yi9NsvtbuKKTw2jCw=;
        b=GLMIj+Nls3nT83RLVnu8EJ27y7udbntWt1mfY4cxeZNnyvhY3PoqywttFb2WZ6uwSJ
         jX5H2NwXWlqPZ4pb2KbeIvw8V/COlW/T3Q5WGPcECOvOH5m3G0DmTZXDv1l+po+BWtY2
         WPT0j75f+XY1ktmz13AfwpbaPiqQgG7ELvWTw9oQs8NxIc9uewhEHBYLk5NxoYxLlhhz
         HpjsybpOSfOrFyRBs4+l6NNUb2u1ZEJ/lKxQT7vR2g7zE9SPExIV54gNyD0nfM8HoLj2
         wPxDzS31KqotAxmlNLsfabeF61GAfXIEde3K2vDXn90/RsdKJmtQCLhxRR7HQMSY10Mh
         dPKA==
X-Forwarded-Encrypted: i=1; AJvYcCUV95zzrGrXraUixIzT1aDYO8P4tQFOHUA+8bdeo9/uTN57C+8hfLFuAIdegLTFgNb3pNmGE+Na6yCvoA==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywj8k1z0jiqpB1PxWYxHEvDZVcU2aAhVUCiNdDOWP57Bmc2jwOw
	HEPB3vJeCYMSK6Z6F1ndwnNQKHqrB8dfrzvVezQFO18ulw4ZtXvJPl/Ebybiq2ni6U2Mm/DQT2V
	7U8YXxYQmQhRDu2w3SFB/SOEdeK/FwHo=
X-Gm-Gg: ASbGncvYUVBaKdcs0JBL5fcJ/MI1n0YfJzewm7hIXxWem9Cto6Rz9zMqVoJmjORGWKQ
	Gv087YFMFvNW2nTSQ4GLvHH/lBJW8xX4PP3NCdnXrF0+Jwt87Usj9MuyeGfe0pdbm3YykLgZ41R
	ANLldrtvPzBylpYj1TH0ye/AHieJWhTxcRy7Zo8aPznYQU863KnebOvenGMUJZbWvcklWLQ+Ej9
	QeiaZoZPt8rdowCcJ3k/gYEjw==
X-Google-Smtp-Source: AGHT+IGsIMA9swyx5/zWtjl/zZOSDGKe0YrS/kNvQp55Iis2DzEKSwclp889Q1ZA6XMNg9nE5KiyMXN2dgIaNVjYHas=
X-Received: by 2002:a05:651c:41d5:b0:342:668:5ca9 with SMTP id
 38308e7fff4ca-3616c674211mr12382181fa.13.1758216007545; Thu, 18 Sep 2025
 10:20:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250903-tegra210-speedo-v3-1-73e09e0fbb36@gmail.com> <2334a545-9a06-42d9-8282-674b94fdcb2f@nvidia.com>
In-Reply-To: <2334a545-9a06-42d9-8282-674b94fdcb2f@nvidia.com>
From: Aaron Kling <webgeek1234@gmail.com>
Date: Thu, 18 Sep 2025 12:19:55 -0500
X-Gm-Features: AS18NWCY1imc6qMzII1HoMutNUeV-pu2L1O1O90Qvl84fUfbKYm-mB0fESR_s5g
Message-ID: <CALHNRZ_gNzCEOzcYBY4o5Hz-efS5b52K4uZqmw5ps5zEfKoOEw@mail.gmail.com>
Subject: Re: [PATCH v3] soc: tegra: fuse: speedo-tegra210: Update speedo ids
To: Jon Hunter <jonathanh@nvidia.com>
Cc: Thierry Reding <thierry.reding@gmail.com>, Joseph Lo <josephl@nvidia.com>, 
	Stephen Boyd <sboyd@kernel.org>, Thierry Reding <treding@nvidia.com>, linux-tegra@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 18, 2025 at 4:45=E2=80=AFAM Jon Hunter <jonathanh@nvidia.com> w=
rote:
>
>
> On 04/09/2025 02:58, Aaron Kling via B4 Relay wrote:
> > From: Aaron Kling <webgeek1234@gmail.com>
> >
> > Existing code only sets cpu and gpu speedo ids 0 and 1. The cpu dvfs
> > code supports 11 ids and nouveau supports 5. This aligns with what the
> > downstream vendor kernel supports. Align skus with the downstream list.
>
> Do you have a reference for the downstream kernel change you are
> referring to? I have found this change [0]. However, this does not quite
> align with what you have in this patch.

This is based on L4T r32.7.6 [0], which builds up the list over
several commits, so I can't link to just one. The first revision only
added sku's that I had specifically verified. Mikko suggested to just
import everything from downstream and to simplify the conditionals.
And that's this revision.

>
> Jon
>
> [0]
> https://nv-tegra.nvidia.com/r/plugins/gitiles/linux-5.10/+/2a8660e3d1e4f7=
5ba4390b72991744174237b025%5E%21/#F0
>
> --
> nvpublic
>

Aaron

[0] https://nv-tegra.nvidia.com/r/plugins/gitiles/linux-4.9/+/refs/tags/teg=
ra-l4t-r32.7.6_good/drivers/soc/tegra/fuse/speedo-tegra210.c#72
