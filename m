Received: from mail-yx1-f51.google.com (mail-yx1-f51.google.com [74.125.224.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BC4B29BD96
	for <linux-tegra@vger.kernel.org>; Mon, 27 Oct 2025 17:54:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761587671; cv=none; b=WVs2IQnlWfPL342FD7es01TaiqEn15qtZoiconm5dBr/sHUqujzxNgttoIAuTQt5ozpDf6XO082cNWFLuraOK+GUOWYA/OROipUjdxVgo+Tpod4AbBtZpVHFYADywSA5Ozg3+FC0ge7NH1tMZv2i4QWt9RFGB6+32kj6E0ydgrk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761587671; c=relaxed/simple;
	bh=NzZdOY46K/cXCbuZL5mOuRF4mEX+BvP5cuWOMDVMv1E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Zq+Xrc3efenm1JR/2H30A6eeZZsG+BGRYKY4FZRQiZ06vCHmB9fBpubYmk7tsK6csRm+m9wKNN7kmbz7OWfOfwkU5BHiytNIUAp0/bx5/QTQPR2LCBlntWybe/VFkFbOWXOLbveaudAyKr2IZPT0OL0t9HrIviRzCJqswAxyIbk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dW7Ys6fu; arc=none smtp.client-ip=74.125.224.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dW7Ys6fu"
Received: by mail-yx1-f51.google.com with SMTP id 956f58d0204a3-63cd60ca2b2so5409183d50.2
        for <linux-tegra@vger.kernel.org>; Mon, 27 Oct 2025 10:54:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761587669; x=1762192469; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NzZdOY46K/cXCbuZL5mOuRF4mEX+BvP5cuWOMDVMv1E=;
        b=dW7Ys6fuQJ/OfgxrAhGCzTzWb4JnoT/k27bXZtdYc5ORqZrBRH7HQl5vfKxr1U8SIf
         hjL+9BzWEumy9jCScHpXPpGhxWea4+NUvSBB1RwIp8Qaf5sX42DYDgA15xxn3WCYSP3D
         d3UT2OrHEd4OmYJ6RoI/7ThvvEK4DSUDxV3Olmbrtw7lJs3OZPKiHQivyZtGwfuVyomj
         Y/Gs5qNj4Jk/IK2skQXJDOhj0E+VnfYKjEaSKWRkOjLKOQHGXORqIy5nH92j1iDGKQVp
         2ARhW1rHDbAR1voBuv2csYh4qLL1j7cXNCOLOcTcQTHCVdMpFYorzEcR3CLdwb8WKUTy
         TBKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761587669; x=1762192469;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NzZdOY46K/cXCbuZL5mOuRF4mEX+BvP5cuWOMDVMv1E=;
        b=NwPGoNEDxiQnC6t5FRGQQ8TX6IY9N0s+gzEzrxzAYQCJ83Kf9zOYePDYtD7LNQzmPK
         xf43JFb4D3HoHusbCAokc5hMfhyF8Xvn+TH6qYN6RVRvTY4l7dXJhYcTV+LPyF281LpH
         s4u8AgWX4KGzkC3iOIeTF+j+vmuAN6B+ETgJ7Of4B3TxZ3bf40ptQtkegncNZot+Fiqv
         VZs6F9ir3s2MtfpRTOl5hCEOTgJ/YMK77A0UL6UCEnBWxNq+d/ddA9YTHUYlAMn/OEYr
         a7Hp5vDbsdpKiBnf16eY3w6czhgIzNXOuo9iEL9wkmxRmRwWH26dn9cTP9P6ecmcrU1y
         sGxg==
X-Forwarded-Encrypted: i=1; AJvYcCXgotOZyjQ783sEd3Jm5r+P2z4Dta1p5o5D/MlCffX8DUHam3DJwygoWlqbH/GCMaXIjcOcS2sL+hTVhA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxv4Yd/2uLpHvzcZciGeSw/Rgin8PNroXCY9Niu1cQzjIKpNCnO
	a1VkxK6u6mpbFLfRVHKxXcQHWLbH0v99od587PoQcv8TK+Drb45DWdE/DVs76himQO53BwiqTc2
	B7RJGyo3r7oAuT/A+UGDar+vR0COCMKc=
X-Gm-Gg: ASbGncuOkQ1o2VO8svB1IT4fZ9OTn2jgiTy94jLxdVJfI1xMhefDIZ4yAbdv9/oeibM
	sIBE1klIswuGTkJJkRQoNnTxrYk6YxdWxmGFm/ySuBzU1UtFvqYpYq9A1H42O3wQ1/cPACHTRq4
	WAMmKqLTVAB8czewylcqDbzeNi664c6KDcKrKSi8UASrvfCki928qgBVWo/ULVQzxOLlFLNU6Q7
	BzRRa6CmND6wkKQ1V8GP+CtFJdr1p5rphbfCbZ/f2YxGcAkFosAJu2kZfJt
X-Google-Smtp-Source: AGHT+IE2jhHjqCkGDdKGqsiX9am1QsRUA/JalOQk0LiJJJ2IdryQKnnXMaj865zQeSCHfV+PSlsAcghri//T5UAHYaA=
X-Received: by 2002:a53:bf0d:0:b0:63e:2605:ebba with SMTP id
 956f58d0204a3-63f6b95cdcfmr540955d50.24.1761587669045; Mon, 27 Oct 2025
 10:54:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251021-tegra186-icc-p2-v3-0-1a50b526dd40@gmail.com> <c6eb8ad7-acb4-4218-9293-7ee532be56e9@kernel.org>
In-Reply-To: <c6eb8ad7-acb4-4218-9293-7ee532be56e9@kernel.org>
From: Aaron Kling <webgeek1234@gmail.com>
Date: Mon, 27 Oct 2025 12:54:15 -0500
X-Gm-Features: AWmQ_bllUkrPIxLdGkz4quqxBqkw0vRHPN7XriNb1cvYmJGSw_0yDSZvh-TXVqI
Message-ID: <CALHNRZ-6Wp1k9zWg=B5xSt7n_9Fj9XchBq7qniKZtKHkHVouZg@mail.gmail.com>
Subject: Re: [PATCH v3 0/5] memory: tegra: Support EMC dfs on Tegra186/Tegra194
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-tegra@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 27, 2025 at 5:49=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On 22/10/2025 03:09, Aaron Kling via B4 Relay wrote:
> > This series borrows the concept used on Tegra234 to scale EMC based on
> > CPU frequency and applies it to Tegra186 and Tegra194. Except that the
> > bpmp on those archs does not support bandwidth manager, so the scaling
> > iteself is handled similar to how Tegra124 currently works.
> >
> > Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
>
>
> Does not apply, please check, rebase and resend.
>
> Patch failed at 0003 memory: tegra186-emc: Support non-bpmp icc scaling
> error: patch failed: drivers/memory/tegra/tegra186-emc.c:217
> error: drivers/memory/tegra/tegra186-emc.c: patch does not apply

It applies on v6.18-rc3, but not next. Your cleanup series caused the
conflict. I'll rebase on next-20251027 and resend.

Aaron
