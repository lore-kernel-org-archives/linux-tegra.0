Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com [209.85.167.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACC5C19C556
	for <linux-tegra@vger.kernel.org>; Thu, 23 Apr 2026 09:54:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776938048; cv=pass; b=Uu2ltTe3l8TuBEpR7VP1T0m2iYULNm65B6TX975fNqSzDIpWByjrtELB5aDjMHrhZ32CcABRUnD8Ju5XH975LdVRBgji+VbX7lnLzXdSKGkJG9+utErlHTppR/jUDnZmfjvDxTznydOcvD726846k/nhw0DHWE95La5ZqG3ubCE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776938048; c=relaxed/simple;
	bh=CPGxXH0S/Bc/wKAfhiZYyXlKlN2ulDQoXNch0A105Sk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gCPPyhfC0a1bQfnHxcJTbWTpKaqQvaS7dX0lNBlxGDuwx/7gROjrXTfgmwNPgmtIon2AoblcVvJoHVUOqda9rmWQ8iFPzorNukAMJiwouRt8ReX1SOqOxeqWDSIfWJ6ymj4rGkOl/1EZ7rT37xE5x2LNK7jcBRMNFvUzReOFaxA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eKfvVr/u; arc=pass smtp.client-ip=209.85.167.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eKfvVr/u"
Received: by mail-oi1-f177.google.com with SMTP id 5614622812f47-463a0e14abfso3244008b6e.2
        for <linux-tegra@vger.kernel.org>; Thu, 23 Apr 2026 02:54:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776938045; cv=none;
        d=google.com; s=arc-20240605;
        b=DFoMqyoBw0MI3jMhFKijImSmK/LlTYqBL0HSBiJ73M3rz925rd/jhULj0fFtH8cVMb
         Mo0tgjB32kf2X4T7GKu44SzpgIOMf0uI4+Qm92pUaoRl6NZnWODNqdgs/5Pp5bFTylzx
         iWNGXkrCmlbZWaqmDloEqDxfc6d2xn+UFukHmocJ1eOUFnqSNYiFIeQAWu31Whv7Lh9r
         jic2a0ZzMZi0rLcnxgeybAlecwKpVP80r4yaHTJ3XcDGqfDTkuGj2nYrHhgorG7EeCbk
         jXK6WNon7y9nY0SAD/OPoRJy3fqr3pJ+9YdmD+GNdtTDw9ZmIhRklBT9YJEQTmUtain4
         N5mA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=CPGxXH0S/Bc/wKAfhiZYyXlKlN2ulDQoXNch0A105Sk=;
        fh=GV26nyEJWnR4vwht/9EPWbwkIKJw5Sx+GmeUxjbufLw=;
        b=dr2UV77TwCBsAPTEyyI17aNh4EYatYZeGc7gJRYzIyfXuV6b4ZsfJD4Sn0aWnVVK25
         oWwEzorhtXbrt/cX92bELv18pcNAh+YBWg8gxKoGEQRaKv5/32oIyhKOzICOCH6bk34b
         uikuy3ia/NNVvC5/1FtLtH3pTNOH8pfZxGRIK0KukMDsD3Sn1xq4UPqBN7iVau8qMXs5
         RnA5xT78GAgc0xsJKDDegiXS/WaKRN0xoyzA+fsi+5qjQZuETJbS1LYjJ20CUJvZGI99
         0jm5+9ZlCx0mSXALuhZvN1JpUmiVj9C1r87YJYdlBWuObcwWKvPI3aZ5Ut69gS24O56N
         B9ww==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776938045; x=1777542845; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CPGxXH0S/Bc/wKAfhiZYyXlKlN2ulDQoXNch0A105Sk=;
        b=eKfvVr/u3U42PWKiqWeXkL7Al2b1Rz2+qaE4qCSFs00RQ/Ociti3Ke7yzB4ymWvb31
         Q7RPJ+eeeD9MhZ3SmDupLjnsDbH61lu/1Z8j6yq+KmdCb78WElPK4Y80oxJqvAkjhAlO
         kUSfVtrlLs7SMgdJ5lVghMqwJgLmOrvJ+NdmxjqCsAnsoar7m/tEuQ1wIZ5B1gN2h4/Q
         wocgHlsLMXlhTQ6SEyntUaCi0Y5Zxv9MMzHJRlDJCiZmCvViz6jkS7XyIK85h7ACqIEg
         /r2HXXfLHHI3h49srMcPbsizVPT7LDBbvkjsfTWZMzg6Zf0QrVedtYSnyfurc+MnnHZC
         qgDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776938045; x=1777542845;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CPGxXH0S/Bc/wKAfhiZYyXlKlN2ulDQoXNch0A105Sk=;
        b=rsQheW1DR8aDdn1vMyJshiQuGxL7zS4KTtNV+TguVkfVqboXtAyGddConQDI1IZnyw
         ids+c0d/SfO6katz0zyChqXpaZf0HJmRnXx8TWBVEAZGJXmKqndCidiRnIfqmFeUvBRF
         y+hnMcPU898nAVnbFO7KCk50M4PnXoPzwpFnt8CAIXU6L+WsIRlc5wYNJWPuK7GltKlB
         g45rIE5ypyhIDyCFjj9yl3VCHZdFVykwbRQ1fwtDxqM1G5r2Rp97aQvYj7eDXj3hdkbI
         spjCVnG4Zh0rD0Q+hxwS4zuEXnHkVhQftRGQfCH2kebhu4Q10vOaDzSnL2zj8K9ygAHl
         SQSw==
X-Forwarded-Encrypted: i=1; AFNElJ/ZWkStrGbOVhXv43zJbRi1S7q+oGSuFjgjvQvhfQ0p3meHJNLOcikEqSOj5rjwn+0F1YUWJLaU2VX6qA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxJrQYC7FfHpxGg2tUIkp9r+l3beiQrXRoHu4hiltlowS75DzOk
	vn9viP7jGnrTQQHYSVIg0exDxQYA+r/KjJVcgbp/urraNhxR+BRSnOLtTYFxAvhKv6TUHW8e+vH
	i9tLv4TPhQ/oJoxON8rQbqMSuvhxXD9c=
X-Gm-Gg: AeBDieuanLvFk2QHhIUM8rqRWdOreD6GAeKhNPbab34XPO0OvigroP4JaI8s8vaBgaF
	z2zxI083mMbgKr8afXZFNFMRb0K5gOiUG5S2wN/UAhYrNAdad6TWSyrPiUhUSSEQCGto1iuRaZZ
	m8gT5a/5hcgEeIcJ9kpM1wv7d0oaAg7Fp1Nr3hR+Rh4I9BoV6rZaRbe1DGSalh0Z7sREcJuB2Ml
	phiooqWRwyvT7R8c7WChklc7s9xg+7XnMnloLaeumZPLOKnr9OBywZG7GWpsWvcf9TDp6BbYfW9
	gkGdjkfK+BzgzsE=
X-Received: by 2002:a05:6808:198e:b0:479:ffcf:52e0 with SMTP id
 5614622812f47-479ffcf5758mr4007159b6e.45.1776938045496; Thu, 23 Apr 2026
 02:54:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260406-t210-actmon-p2-v7-1-91adf535cf8f@gmail.com>
In-Reply-To: <20260406-t210-actmon-p2-v7-1-91adf535cf8f@gmail.com>
From: Nicolas Chauvet <kwizart@gmail.com>
Date: Thu, 23 Apr 2026 11:53:54 +0200
X-Gm-Features: AQROBzB6Ma6rK33kPbC0P8ckfar4CGTiGrMI77fhAE395i1YzgbgIY4-PwQZ2gk
Message-ID: <CABr+WTkGOQJu5z98szBK1qi_w2OhJbG11hBC0B+kB9=-+RJnJQ@mail.gmail.com>
Subject: Re: [PATCH v7] memory: tegra210: Support interconnect framework
To: webgeek1234@gmail.com
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Thierry Reding <thierry.reding@kernel.org>, 
	Jonathan Hunter <jonathanh@nvidia.com>, linux-kernel@vger.kernel.org, 
	linux-tegra@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le lun. 6 avr. 2026 =C3=A0 08:36, Aaron Kling via B4 Relay
<devnull+webgeek1234.gmail.com@kernel.org> a =C3=A9crit :
>
> From: Aaron Kling <webgeek1234@gmail.com>
>
> This makes mc and emc interconnect providers and allows for dynamic
> memory clock scaling.
>
> Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
> ---
> Changes in v7:

I've tried this patch (on top of the memory-controller-drv-7.1 tag
which contains the base-commit mentioned).

I have the following error at boot:
---
OF: /actmon@6000c800: could not get #interconnect-cells for
/memory-controller@70019000
of: _read_bw: Mismatch between opp-peak-kBps and paths (1 0)
tegra-devfreq 6000c800.actmon: _opp_add_static_v2: opp key field not found
tegra-devfreq 6000c800.actmon: _of_add_opp_table_v2: Failed to add OPP, -22
tegra-devfreq 6000c800.actmon: Failed to add OPP table: -22
tegra-devfreq 6000c800.actmon: probe with driver tegra-devfreq failed
with error -22
---
But then, I can still have a usable display IIRC. Also worth noting
that I add explicitly loaded tegra30-devfreq.

If I add the next-patch that enables only interconnect-cells for MC
and EMC (without the interconnect lines on dc0 and dc1),
then in this case I'm experiencing some freeze at boot and the display
does not work. (display stays black with some flickering while I
should have a text console prompt).
Nothing obvious from logs.

Using the original patch that enabled the interconnect in (and
emc-tables passed from bootloader).
https://lore.kernel.org/linux-tegra/20251021-t210-actmon-p4-v5-2-4a4dbc49fb=
c8@gmail.com/
This patch sometimes works, but I have some random behavior that
sometimes prevents booting to userspace
I'm suspecting some module load ordering issue, or maybe a state that
isn't properly re-initialized on cold boot...

When the system boots, the emc scaling seems to provide good results
under gnome (no more flickering display with mesa-25.1.9).
glmark2-wayland provided good results (except for one scene that
breaks, as previously).
So this looks promising...

I will test again with 7.1-rc1+ and with a lower patch list. hopefully
by the end of May.
