Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90F9134C140
	for <linux-tegra@vger.kernel.org>; Tue, 21 Oct 2025 19:20:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761074405; cv=none; b=a+Ojl28j6V43MP9K7nnIWTLD7RCSulPcJrBmWuwlRa6rUuPEzpEIKmXZextt/9Ix//4L8KvbJn8dKxuT3vEvpentSjYBvo526LpjHOe0GC59wWCjg40ytjXOKrOcIIXNSb/bf0J7Z4ywpvZTSD9/2VTXaV+lSNanK8SbrTVWOzY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761074405; c=relaxed/simple;
	bh=XF8lCN147t5Xy+RNN4uA2G5rBZdwuSV7eZQQMLT017w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tXysBh0kOrI3H8cvgtUJ6zuE6i+tkueFBamy9b4MmWF4aETmlJXiQ2yhIcz2sA/wVRJo36QprHWIxP3PF964ELgam44I1z3xX8y96mvS2GIFUhZRszO+sRSSgWJ4fxpbdCL7FZ5/ip6/oH9yjYqszgtEY0+4+holdHEPQedcF9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KJzp5mEe; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KJzp5mEe"
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-59093864727so7120614e87.3
        for <linux-tegra@vger.kernel.org>; Tue, 21 Oct 2025 12:20:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761074402; x=1761679202; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XF8lCN147t5Xy+RNN4uA2G5rBZdwuSV7eZQQMLT017w=;
        b=KJzp5mEeYdJzzxlbjsQEUTFlebHJG8X9iqasxhpDiJjOyHQVv8yr6M5jC19Ug90/jF
         8QVJxqseckDiji0y3dB9+X7jsZTWWWCgSW+ZicH+YxC97GT6Aw+CJ4KY9IH2v2RtsznM
         HlQD5njAaUEaRmRk/e99i/t5Qi6Ghu9YlQ07AvI34/W7gy4uTsa17BItBcOUvcU7j5wp
         dh90R6vrw+OHPNcXGEk358SGpOsV0+usztbhfaR7UJWVEL1ieaNlHc6YrAxWc18ia3L1
         erQMtyHcq9805U0nCintbV5EiXyVKfP9OeUccXUUWTsTp/4t5RfpjWIZ9chAKE0JTyng
         BIUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761074402; x=1761679202;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XF8lCN147t5Xy+RNN4uA2G5rBZdwuSV7eZQQMLT017w=;
        b=YmWaqwPKIPzGvtp+LNSLPNe/LvpIn6ALwSa4QRr6iEQfdKHM0iVoWPPk5LUV+cBQFr
         NmqfmfxDfVfeQZSTDbTYNz21Hd45XjPZI6K/45Ig9PZhaBQRgOmC3ES1+sXmWDuXuyWS
         vI6ihE2mOyLEcHNQngkg1/2t7i1XluAoJK8TrF3p12WIrBAPvjaSW2JQ697u4Q4YZ3ye
         O4bXNvhkQOPBqDW7dC2lZkZrTxnsrOYjJHs+fq7eZGbgjnAEomTFVt2nNgZzosd3iXbB
         rvOBkX0WdUETjSv/s9omJhs3Vt538Eg/xi7lo/dwafcmL4rFcovPREvDeZSwVqXHa/th
         ZMDQ==
X-Forwarded-Encrypted: i=1; AJvYcCULTp0WXUUEcx8OyVlPJq8BhVDYn/SnSqc0OArgOvd0KGn1e0etuosLzwSPLJm3k8au2ZgaQu7MQSSHTw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxob6k9ZKP+yuRUFYhyeRz96Yud/um+EHuip67Fkx+2Fi1lW6P0
	HqMSlPgry+pqX4CVXfOpt+4twSA4I+SmAnkran2Vy2Tru7JLYbx+dyrPkZJIli8rgxJvwjdM9wI
	aclU/SZgrjzeT98ueVqIATav3OEAdZQQ=
X-Gm-Gg: ASbGncsKqkdF2i57ed4s6bitCD/eyYLMFVmW/WuiyfExbu6hRq75iqq51nZDXKNMLMJ
	xlAOLf+keA0amTXLq4NPIMu7PIWTco0+IAXFpbpJX3K9zL3VSP5sWJeOWWvzZ8+wBUfxSs16Jos
	g6WTKFWJ5VCQRtUd3owNCQI3UBsu5Pce77HjyDJsHbW75eRM1HVogDx9tqWEchWdk8DidrouGEE
	W1m83S4xAaRRKKPWswBOJjjG72g2ErGDQA/ehOnvsLHBR4nN5G2+MdlClcv
X-Google-Smtp-Source: AGHT+IHwT8B0R5exz7jadTBxGXmtid9llIfQluzOLS1CeZTO457I56feeO6M9WQOY+sC87UPLBULcwRCSiIfs5oVYqw=
X-Received: by 2002:a05:6512:ac9:b0:57e:6aef:3ffc with SMTP id
 2adb3069b0e04-591d84e3c8emr6604351e87.4.1761074401398; Tue, 21 Oct 2025
 12:20:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251021-tegra186-icc-p2-v1-0-39d53bdc9aab@gmail.com> <ee6b80a7-4505-466e-a433-5f186d747945@kernel.org>
In-Reply-To: <ee6b80a7-4505-466e-a433-5f186d747945@kernel.org>
From: Aaron Kling <webgeek1234@gmail.com>
Date: Tue, 21 Oct 2025 14:19:49 -0500
X-Gm-Features: AS18NWBtcweEvCq46SenFYFanpeRQLBTS4t1fv5OY1UgDaihsUSCmyvFCcSEBGM
Message-ID: <CALHNRZ9nXYRgjmpbR5KiQpsSf4hu4=qcgoh8F9_5b9yXF_5Btw@mail.gmail.com>
Subject: Re: [PATCH 0/5] memory: tegra: Support EMC dfs on Tegra186/Tegra194
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-tegra@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 21, 2025 at 2:11=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On 21/10/2025 20:29, Aaron Kling via B4 Relay wrote:
> > This series borrows the concept used on Tegra234 to scale EMC based on
> > CPU frequency and applies it to Tegra186 and Tegra194. Except that the
> > bpmp on those archs does not support bandwidth manager, so the scaling
> > iteself is handled similar to how Tegra124 currently works.
> >
> > This was originally part of a larger series [0], but it was requested t=
o
> > be split into smaller series.
> >
> > [0] https://lore.kernel.org/r/20250909-tegra186-icc-v2-0-09413724e781@g=
mail.com
>
> Please keep correct versioning and changelog in the future. Try yourself:
>
> b4 diff '<20251021-tegra186-icc-p2-v1-0-39d53bdc9aab@gmail.com>'
> Grabbing thread from
> lore.kernel.org/all/20251021-tegra186-icc-p2-v1-0-39d53bdc9aab@gmail.com/=
t.mbox.gz
> ---
> Analyzing 6 messages in the thread
> Could not find lower series to compare against.
>
> I think I emphasized last time how important is to make it readable and
> easy for maintainers.

You said to split it, which I don't see how that means anything other
than 'make new series'. How am I supposed to keep versioning when I
had to make three entirely new series?

Aaron
