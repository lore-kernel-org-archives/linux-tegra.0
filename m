Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9AD92144B9;
	Tue,  8 Apr 2025 05:49:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744091357; cv=none; b=WOudLksvQu6nCGmfAdILNVRNgFcKmwUdMJZODemnbyUXIZB61Urm4HS45BhPTnjyo2nuC2vny3N4FGLq6CwamHovBOfU0/4CMFVXZZJ+yRGEQ4u5WRs22ad671z0/AkndzyFT/EgdSkd7Mm0h04Kyv9txLaVmNePKbQOb7etUu4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744091357; c=relaxed/simple;
	bh=QDAOU3+1YPCyYINXq8T7zByLuyUyaKA/5mhVWuZRgsQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=k8k8xw85AFl6xEioqoR2pSH2Xd8k+H+ABHCatjCKYTfqpYKZQYcuj6TYV/IrkDKMT5skXKzV6VHYGciv4RsGcQejP+u1SMNn8puR9w7lWq6DWZd+APi8kW+qIsZd/9d4MfAXhC38bJeZSdPc6nWTnfCiiNsTOBV22Ytx2QJ4vx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JxM0ilkw; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JxM0ilkw"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-39c1ef4acf2so3018236f8f.0;
        Mon, 07 Apr 2025 22:49:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744091354; x=1744696154; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QDAOU3+1YPCyYINXq8T7zByLuyUyaKA/5mhVWuZRgsQ=;
        b=JxM0ilkwPW+cEr5zh8kEiHZpHcm9/CpQE0rHAjp26ngJegpAI4s3aL8T96CnY7qP4c
         SCbSduPkfRK9pi1RrwK5qw1z1pR/5Q6c3gBU2TJa02scgwhhi1sYRW+/qE7wHxsd47Fv
         n+Nz+7ys46ljSsOzZ0aHNwZBg+EQF46wub+uiVbgC9P51uxmP4N1jj7bnIrZTJZ9ZeaQ
         rEIsKMLnD+RIVc1VrvE0J3KksTkTxxb8WGpD5DRZLl0LQEpUC77+/YJl8KuuyBVzCfUr
         z1uD4XCIsqF6NSHijd+p4AenO9D61CUOhzQJwUd4GkxVEmk3wESwqkcc/lkmRU/08raa
         Bgtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744091354; x=1744696154;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QDAOU3+1YPCyYINXq8T7zByLuyUyaKA/5mhVWuZRgsQ=;
        b=tbQ0IzK/8Ud4DnhQ1YjnU1m11+e3z9dB6SanbhFHrow9BdgAoKYLXMN43XWTNTvFht
         IY4lphO9v1tlHIlb6atiWyh/Q2tpmzVC/4Zzt7TtVgQj5oLGXkMw7Gq6IMLxsmIT2x+g
         vDE9UcFaZv2rzEtDToY5rGGLC0X9r/L8mfzE3EX7wrwqN/VCOOHMxM1kjEFbrIB+ct4b
         pF79fz05+XtFA6+o0vdvXlPwLVQ5T1nCm+e5y7hadv+DBflxPDnluM+o1w4oS/soDpoB
         8dC7B+rw1DctVtlcio7jeDCYo1ewqSOvxn66AT8fJ1rZo6x/i1o+0+hDg3CXXZq1tj3H
         ciKQ==
X-Forwarded-Encrypted: i=1; AJvYcCUjqYn9+wFBbo7UIqa1SqcEy3qRjGVjZhRTgrv8ebfAHamrdHJbDnM+gaECPmH7M1tzZkNkHltMLxJ/C0Vk@vger.kernel.org, AJvYcCUmU8U2spsr6npQXSHfz2gAThJA6uuVIyJUfcMxMuD4x1eH+6mLpvs6fsNQaULsfbBHUqyb4ebh2vRs@vger.kernel.org, AJvYcCVUQlJAUalJ9OiyQrqqmjbLFt5S/XC+X2BLbDPakrOBr1C+CCZTJJ8CE+7DQLppJ/eK40j7V3IEjlUYrxQ=@vger.kernel.org, AJvYcCWlYV/K2zahSGKkK273YqIjY/5wm3MLFkdMw7/OpIAn6b2la5Er8fM3V29v/CDLmap1D0iHmUxG8+Q0@vger.kernel.org
X-Gm-Message-State: AOJu0YzNQowHi9p+GcuU6zzw0VAexxLgyFbeqyjwGTGMxIuaRYSHnV59
	dBclBYrFWHdSoEacFU9mlCI20sJ31Bp+RSoC9VOwC4rYG/3PC0ztAW4avj/FX9H/Cyr4xqOGRfp
	BMXZzrvbACg1POGOGbi2o96Rzom4=
X-Gm-Gg: ASbGncssvJ8B28XNtbQtnQcVx9pk8KJO8qVTEod8czDv91AgaXS+tF+pRtVUHcm30Za
	B4kfwcocUH+Q3Oq3xT8i48ZAZW5lgrKF/CNEHEJrGui3uEEN8dpVx2phMwiQafrInsZPdObKLoS
	juCzGuDZdpeSyXRrO1iCXjOC/9oQI=
X-Google-Smtp-Source: AGHT+IHIminUi+Nj1fO9kBwePvxNB6j/mIgIBiaCvcyNIAd+9AXFIl8Gxy/bJzMpdOf336tTiicf+18vVnfGI5W0eLI=
X-Received: by 2002:a05:6000:1a8d:b0:391:3b70:2dab with SMTP id
 ffacd0b85a97d-39d0de16c11mr12691797f8f.17.1744091353870; Mon, 07 Apr 2025
 22:49:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250225143501.68966-1-clamor95@gmail.com> <CAPVz0n29m5CrKMW_j8Q0Zz2pCBdYLmMn-3waSZx7ooJZG6ZTOQ@mail.gmail.com>
 <5241e944-18ae-4100-9c08-e3ef4de306ab@kernel.org>
In-Reply-To: <5241e944-18ae-4100-9c08-e3ef4de306ab@kernel.org>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Tue, 8 Apr 2025 08:49:02 +0300
X-Gm-Features: ATxdqUFH8Hf69UjuFkXZ3QY-DTt1tJENdgBXOESHLqyEAZrs20TN1CNYJKeb-N4
Message-ID: <CAPVz0n1rY3_0DPMQDX92UBpGnagwy7B8NAqbZGmpFrZ-FsA30w@mail.gmail.com>
Subject: Re: [PATCH v1 0/9] Tegra114: implement EMC support
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Peter De Schrijver <pdeschrijver@nvidia.com>, Prashant Gaikwad <pgaikwad@nvidia.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Jonathan Cameron <Jonathan.Cameron@huawei.com>, Georgi Djakov <djakov@kernel.org>, 
	Dmitry Osipenko <digetx@gmail.com>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-tegra@vger.kernel.org, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=B2=D1=82, 8 =D0=BA=D0=B2=D1=96=D1=82. 2025=E2=80=AF=D1=80. =D0=BE 08:47=
 Krzysztof Kozlowski <krzk@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On 08/04/2025 07:43, Svyatoslav Ryhel wrote:
> >>
> >
> > These patches had no activity/feedback from tegra maintainers for a
> > while, so, in case they got lost in the depths of email box, this is a
> > friendly reminder that they are still relevant and I would like them
> > to move on.
> Huh? So you just ignore the review?
>
> I am not going to consider picking these up if you are not going to
> implement the review. What's more, your waiting 1.5 months after the
> review to ping is just inappropriate.
>

Don't get me wrong, I would like to hear feedback from Tegra
maintainers and I have specified that in my message. Don't be so mean.

> Best regards,
> Krzysztof
