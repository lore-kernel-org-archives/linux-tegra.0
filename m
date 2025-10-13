Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05547274FCB
	for <linux-tegra@vger.kernel.org>; Mon, 13 Oct 2025 02:18:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760321933; cv=none; b=DX7DCpj3RBzVDo47PPmfzQULE/N8BtWgeKuSyaSysZs8vMfdpIejbtgccIQOqXsVs/okAMhfg1TUnss0wzzvPUW0xMN48AEcVC5haNkOEfcgOSjYs6aWxGHGbhs8ASWPe1yLXJR/UJsIbMGTWhlAsOE+ykDx5f2xiqaYLqgWOas=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760321933; c=relaxed/simple;
	bh=9PDrTUGmEtHhlWROJVzFemxew+01a7v8V9YahKSqAgw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Aw9SlHImqkq9gISlkO7TYy4g9DMNOgbDIhxnobTyuvRRLULSd8KvG6ykWh4j8i8i1D/VD+hHEEbVpKkzOPyyir2bfqfVfsdJZ3mp6cQzDMiaZ4bSx6qcWnVPRsIgeAK809EblvYcJELyrJbzFZ6EVR5VR2cc0unRypcBC8qWBLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kIPkiHkQ; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kIPkiHkQ"
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-57d5ccd73dfso3720562e87.0
        for <linux-tegra@vger.kernel.org>; Sun, 12 Oct 2025 19:18:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760321930; x=1760926730; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9PDrTUGmEtHhlWROJVzFemxew+01a7v8V9YahKSqAgw=;
        b=kIPkiHkQTsEnp+Hl3dnoCd6vUP3X6XN5l4n9+ixvmJTjJ10hhqgA68j0wmm/5u3iZy
         DPmlmdWEgMAg/VqRQp/p/ConAqk5fkdUET2819ZYBHry+5pXknRSAW27uAeeicslb+py
         uSFPqa0iQelmQbHtwE1yXrgMFoNNDQVey4Oop+cW6puqav33Wji0VVQdqak9JQYuj1xu
         yj2os50x8xGvr62JRi2ylg5fMwBVREj06d6MkOPjzO+PCozaeJbd5Ap3TCzJaAs03pfL
         vndKRRLTb1a1E8/gRyfqwH44AHqf2kx1gcYSCPmwkGiKg3wB/sgs+uLWL/tpQPbsvUbB
         GJlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760321930; x=1760926730;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9PDrTUGmEtHhlWROJVzFemxew+01a7v8V9YahKSqAgw=;
        b=Nz3Z2OF3xNnTvNy05ravDoESoHHTncTvaIJi4exfB6ssVIMR3LH00Bmij9Y6+pMJ5t
         p1XmSmTzdAWdAqGmN2YUReu3pkdNqPNEalNf/SdZl+TkCFUHgclBpYRV1aCy9RezxGMA
         wafqk0vCOm2lRxpANRtQbwQAjAYD0vFzfhZZwKp7fyduUZf/kt4Y53S9aLImKhNRriH+
         EotZs9/gLs/30ovGf+wTZc7rdY1MGZ3vdM9pdX5SNpeMAH0DE1bAL2p5O61UXSCh4fR8
         X4ei0TSaXf5wFKP2zvo0TcbKIEo12AUT5w5ODkfjqFjeMAQ/vH1xEWUw9jjnGciWvwJ/
         NhXg==
X-Forwarded-Encrypted: i=1; AJvYcCWqCCxgcX9619VxvceE97iRXyNyAKycSgaEhRxRYVt7m4Pjd0xID8S0JuPyDcoFLdPrTD7MM4ULxI+DFA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzdSQlhhw05LaQe6JnhqFLyZxGZqBgyN23DfjZcGxMRZ/p7u2hd
	enRClWGFxh9UNx5agKdaLUveh8fBTgfu59Olsr722sRTz26b7o2Bfc4Qouw4TE8HG+2PKWgAm1e
	d+vWgj2EcgFCsN78Epjdf5pz4Wi+RIbo=
X-Gm-Gg: ASbGncueXy1tDY/7FYQgmX8uVM6h5PKz3tiCxpKSGNI0lbLImIGZeuWBZF55hxIG9hP
	Viw+CVIra8CQaXHm7QzCINY3/3nipzIRoygxLheqVaqYwZaL4hFZV1XkpZbsNlV4n0Kf6X5/QfE
	mdzewf/wjUwCmNcIh6pdzS/q56lyWC0UbBqYX+Gr7dqST2b4BdtH//W2YmnOeApmVMhPgPOEPj2
	QeL0IchVeN0MNiZbu1QxaP7vA==
X-Google-Smtp-Source: AGHT+IFiw45hdvimFqGDURQaGtDLi9ENkklrzwLA8phy4Ic6ETpmgrs7KC/3t2Arw0r0YQyBDrm+0eG6CRv5jVYMkRw=
X-Received: by 2002:a05:6512:3082:b0:561:9635:5af5 with SMTP id
 2adb3069b0e04-5906dae7bb0mr5720922e87.48.1760321930016; Sun, 12 Oct 2025
 19:18:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250909-tegra186-icc-v2-0-09413724e781@gmail.com> <5d7491b1-8f9a-4040-b854-ff0b94bfd24e@kernel.org>
In-Reply-To: <5d7491b1-8f9a-4040-b854-ff0b94bfd24e@kernel.org>
From: Aaron Kling <webgeek1234@gmail.com>
Date: Sun, 12 Oct 2025 21:18:38 -0500
X-Gm-Features: AS18NWAIF1xrgNjZf5B4apzT_7FVhvYHWdeOCO6h_dIwtjEyeBNHBiTCRjDDt_8
Message-ID: <CALHNRZ-okVZ8tzKYa=jqudDu3dZ_Yq1CkeErdcvxi5xJEgJFbg@mail.gmail.com>
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

On Wed, Oct 8, 2025 at 7:05=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.org=
> wrote:
>
> On 09/09/2025 15:21, Aaron Kling via B4 Relay wrote:
> > This series borrows the concept used on Tegra234 to scale EMC based on
> > CPU frequency and applies it to Tegra186 and Tegra194. Except that the
> > bpmp on those archs does not support bandwidth manager, so the scaling
> > iteself is handled similar to how Tegra124 currently works.
> >
>
> Nothing improved:
> https://lore.kernel.org/all/20250902-glittering-toucan-of-feminism-95fd9f=
@kuoka/

The dt changes should go last. The cpufreq and memory pieces can go in
either order because the new code won't be used unless the dt pieces
activate them.

Aaron
