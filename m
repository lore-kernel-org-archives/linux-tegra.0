Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAF9F36C9D5
	for <linux-tegra@vger.kernel.org>; Mon, 27 Apr 2026 06:22:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777270960; cv=pass; b=dA80KmEsmYb9b3z5HIoA7FIeJP0gXXQLqL/VF/yUE8E7oNo8FmUvS9qsogGE4wPSKH5fe4sZsPX8y4IQz9tIfheifNHF9sUlRsM68bJd58mWE7DUgUK0tXdLHezP4e4gUQ0UOSO2vJE75D41N0TFhcOOusQwRuiREc4d7fq6PXo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777270960; c=relaxed/simple;
	bh=cCNQpvDhxGL3/coshEsXRMmxK3+a5HT0KF4sY1Umzn4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OKoDx2riFFT9dKN5UCLTn6CZXukKadfwR9wpa7DPCJdlFM/+G0PIJfQILOsWARlVbYqc52/tujNRvZM8rESlfDLv5j6m4JhuKKL/e1gw+i+Vvot4lqI2I1wC4/6hRCwuGowaL3QxhVmSDRZakC5bhX6Ihd8CcnWFay5KJY4IG5U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UIML4qYK; arc=pass smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UIML4qYK"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-43d74086e5bso9421327f8f.0
        for <linux-tegra@vger.kernel.org>; Sun, 26 Apr 2026 23:22:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777270957; cv=none;
        d=google.com; s=arc-20240605;
        b=hR86B3C4DOn+BaqrIVDeuNVq71wBf6mG+BsOFYsnTQS2GrvcCUEPU5Q0tnFdpc/4/v
         9+1/JUVr4bLuCQS4cVjDIlrghPEjWlBh+dftB3HHK15aloh4SHqITopgm0xnbsGvFpvC
         lo8oLX+oA/CTY1kewMKt3cCjlyo8MVpq6dipFN3j+5Va03X3iDydQDa80hL+cBAbzWJT
         TnuzPU7m5KkdfbeU+SVL6uMTPt5oS3hKjEBZkIGZNEyq4yGxA3xY6W6+h6ssUARSN3aO
         spkQB2/sm+mVc7Q5t9Rwu8BkFJNe95eQPiEielRnuaKycrjWlmUwYnJ5s/cMjDy7k8aC
         wr5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=TAPUtgLCeg2rPN5wb/LbwTrSRKf1znENF+kSWITCphI=;
        fh=8nIjvWJZ6QBqa080I08lGzWuYO4xwdLNcCJvCj3YHRs=;
        b=g0pCjRLSvfSWbNrfv2J7E1Ys1KJnSbtNNwkruX7Iysvo84gNvWf8wBfrKA7I4GRU6O
         HH6qeL09RVxNFwFT02Pjf4ydfC0IaEuhabvZ8wbEMxbWC94tLkANlIfDtP4RAXYJ0z6Z
         Wtcn8qvEH9AVoiOyXZUJPexKAHS4BTyT7psa87aWJGXlVL3smCptmdvv7SGnRa5kR1Xp
         lpad79u26NYrrI0+bWVMp1Txw0w+Gd1cefapsfTKrDrGZA0TNJorYsJEQSn9xlepyzu1
         6DRM2fxWDGfakxfYTTur3tx5dSzXsO+cOYLA0vxK8JwFAIXczSFrbrcZ+CthmndWaW2L
         g0lw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777270957; x=1777875757; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TAPUtgLCeg2rPN5wb/LbwTrSRKf1znENF+kSWITCphI=;
        b=UIML4qYKM+np6FXBGkjEYG47hJigkAzP7srbHpieF1wjoa3LW8b7mhJ6bJebkGjhpZ
         afm29hy0VaYEVVWabc3PAE6vR6eJvYuWUySKh8SnrtxkjJUvPDzNhY9oKk/iatXKm7OH
         /kW9lb4C7wu2HirK9POowd2kMsXHfsMFxvQba9JRbqr+8EMpzSom9h4GW+mlpM48u0e+
         ASm3wLkvjLRRsh46pYk6Ln/eOn0RDtqqfAVP1i+MJd/6F8Ce3hyq97hmKcJMcjZEzAzj
         +nsSbKx/Kwa/FArgVtKUL5lARR9dGwvGVpily1hH5lqAzejOiFsDuCXiv1Qqbz4uA7MK
         sevQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777270957; x=1777875757;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=TAPUtgLCeg2rPN5wb/LbwTrSRKf1znENF+kSWITCphI=;
        b=NenS4g+n/g0QqcmvwaNehOQZjUS8EfDktcIs/1f/ebKcK1PFbLQxz28kLReRPOVDGb
         biryQ+HLYVAIm4h4qre7WAk1360vSIkQVGPkDf6x5WMS3nBj7F3DttBJYOh8zC5Xv8ds
         idLoxtVhIPeVP9l1ocqefot0Ga2gaIxGI988MP4k9krZVg3pcfZA6wTh24JK67lD21jH
         yzEunnacjk/A1pTulQ0b3yaY9E1ie+2Ain40Iq9O8ks+SVmKnQ08Gcp0C97VfM3fIMg1
         NNZPTqL35PgE7d5ctvwHsgXJSNAQw2+QKmjYtXRUkFDn0GVsJbSEXl7k6tie8C1Mwgeo
         FZ4w==
X-Forwarded-Encrypted: i=1; AFNElJ/CuXMdgGM47IfZi8mzW030ffQSdHGmUehcQQ9fTw4HYQZgfYlIBnEuCapjU1ai0B36/YGUfRCC0Q/4iw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4Damwz4rVEoKkYa6iA3I84js8TCegep2yLDtRHfKFF2kc5mS4
	EcDGMVoETdWXnTvXen39gApYEQ7OF4HcfFEuV5uWyFbid7nigfrT9p5Ys4p30l9TK9Jkp7iHUOa
	Qd3ylitS2pDlq5RXXv5ZMD66ICgX4e70=
X-Gm-Gg: AeBDieu95rlu1zaZ6KY4WF/19ERg9H7FQyRbd5edtlQM7HaVWZP/Li8Vxrg87Jw5aYw
	u2l10JZ8cLih3Ku576xFYq1ZCObg+d3a+cOGc4s6CmzHRCo8rpRm3nvyh6VoG6r/BdVLSHQsxrM
	VqruMxeC/gyWzycGhvGQ3rxRUwdFSN7GMnU9mbPtJ10ah5vLZYR7uP5cH6q1w2EsRAAd6GticRR
	mvl+np+ySsf7VI3PaTHldgmJxlk0Ahn9jdi3JjOz43lIJ9pA64OfyGepcD5vMR69tNjf4h06q/U
	Q68nY9mhEKIqqc9LCkc=
X-Received: by 2002:a5d:5f82:0:b0:437:711c:8754 with SMTP id
 ffacd0b85a97d-43fe3dc842bmr65390987f8f.7.1777270956678; Sun, 26 Apr 2026
 23:22:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260309075248.47730-1-clamor95@gmail.com>
In-Reply-To: <20260309075248.47730-1-clamor95@gmail.com>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Mon, 27 Apr 2026 09:22:24 +0300
X-Gm-Features: AVHnY4LHLsGKQKTddU9Ol3ClWnqsWYnQ5Yf01s4atQPUjMHbboFRlCT-xHbdbow
Message-ID: <CAPVz0n2rc5M4FRxiCK5cJ6usQxsfPhWjMCEpFucoZEuTfY7Pvg@mail.gmail.com>
Subject: Re: [PATCH v4 0/2] gpu/drm: tegra: add DSI support for Tegra20/Tegra30
To: Thierry Reding <thierry.reding@gmail.com>, Mikko Perttunen <mperttunen@nvidia.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>, 
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=BF=D0=BD, 9 =D0=B1=D0=B5=D1=80. 2026=E2=80=AF=D1=80. =D0=BE 09:53 Svyat=
oslav Ryhel <clamor95@gmail.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> Tegra20/Tegra30 DSI is quite similar to Tegra114+ apart MIPI calibration
> logic and clocks. With a few minor tweaks, existing tegra DSI driver
> should work on Tegra20/Tegra30 devices just fine. Tested on
> Motorola Atrix 4G (T20) and ASUS VivoTab RT TF600T (T30).
>
> This patchset depends on Tegra20/Tegra30 CSI bringup since both share
> MIPI calibration logic. Ideally these patches should be picked after
> CSI bringup but they will not break anything even if picked before
> CSI patches.
>
> ---
> Changes in v2:
> - removed all MIPI calibration, it is handled within CSI bringup
> - added per-soc structures into of_match
> - added fix for hang caused by register access with uninited hw
>
> Changes in v3:
> - switched from version DSI to boolean flags
> - added comment regarding Tegra30 clock configuration
> - commits were picked:
>   "clk: tegra20: reparent dsi clock to pll_d_out0"
>   "ARM: tegra: adjust DSI nodes for Tegra20/Tegra30"
> - commit adapted to recent DSI changes:
>   "gpu/drm: tegra: dsi: move prepare function at the top of encoder
>     enable" > "gpu/drm: tegra: dsi: re-add clear enable register if
>     DSI was powered by bootloader"
>
> Changes in v4:
> - switched to device_get_match_data and added check
> - added comment regarding Tegra124+ quirk
> - adjusted commit titles and message formatting
> ---
>
> Svyatoslav Ryhel (2):
>   drm/tegra: dsi: add support for Tegra20/Tegra30
>   drm/tegra: dsi: re-add clear enable register if DSI was powered by
>     bootloader
>
>  drivers/gpu/drm/tegra/drm.c |   2 +
>  drivers/gpu/drm/tegra/dsi.c | 126 +++++++++++++++++++++++++++---------
>  drivers/gpu/drm/tegra/dsi.h |  10 +++
>  3 files changed, 107 insertions(+), 31 deletions(-)
>
> --
> 2.51.0
>

Hello Thierry!

May you please pick these patch if you are fine with them when you
have some spare time? It is ok if they end up in the next.

Best regards,
Svyatoslav R.
