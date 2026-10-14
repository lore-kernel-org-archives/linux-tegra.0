Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25E171E5018
	for <linux-tegra@vger.kernel.org>; Wed, 14 Oct 2026 02:22:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791944553; cv=pass; b=WndzlcD04Ko9GSu8D+ZBtAPwSGPDwgTndHx05HlPWpM8Zb8CQL8Ww/xyQZcpBobh2CtpxsFUE7Po6ztFRCB+DnIvY6mXPxA4JFU1f8LORmYLHrVp0F59QWpxZwnIeL0o493GSW8ttuIr6QnLysAVFhVp2WDoANMYO8/M1/n8X/U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791944553; c=relaxed/simple;
	bh=KqbPDHN6YdzyiKMmIDyDQnrpTH06Mt4Ih2MF0snoOxA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iHbwX4aveEbTvF8VU1oig2O3fM7m+sfO2euEMPCvEj8ZjXe4z0x8s8RLfad+keRW1t0iUCnyPfwnbs89uC6F/fdoyxjnZJOkXiLaURnt5S2FLAQmIWCMRu5ffJMvNle6lE7Nc/7cBFCbEkZWsFlpxD1v4DEEccnAWRJvYnQ7tPw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=acr3poyi; arc=pass smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="acr3poyi"
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5ba41ea31ccso4080957e87.0
        for <linux-tegra@vger.kernel.org>; Tue, 13 Oct 2026 19:22:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791944550; cv=none;
        d=google.com; s=arc-20260327;
        b=G4juGpUTdikk5uZ5PxY2XVEZSJd4fAoPc9484K5V5LlkASSObSeSQmfYHPyLk6ito1
         pBqQTsdxrr627fgmy1kpTgWjf0nfXscZR37sdmL09sI9LXvJhXgR23bzZQ1uK0+xg2s6
         pkmvcbBq72bZjFYqrMk1maQYHGtb48tJ9qqU0EVlLWy1ytclHIOBLigxg91cyMoc0/1J
         Aoc11AYRvtcVIBabioJVIKx/mfHpM1WEFmi8Zs94RUzWKIOs0GsKeJ8UZyLcmIQlnPRK
         mvp3BgZInWGQAlLNHV68ohwcC1z6z+xaIFiLztFXik63rgC9HnWCx6rPmiqUHgkM692v
         sWYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=uR6LzQI4dyAnk+9+CQvzUY4D1It975ps1tZNRpR3a0U=;
        fh=B5elvslszSiU/44Ove2pn02XDOcuV+mUE4hpqx1/o+0=;
        b=J/Q84qxYLN5A5LBDAnR8TE8XUxS/4CRw4MJgAJ43PC1JVRaXpxFZpKGvQlRvatbxP5
         kIfxsE7C8jaUodV4MByf8RxG00ob02AZX61NP8AiziJNmDPLqAbpeYq+kkxspy9ePcLC
         pXesLmZ6o0nPeGHC8Ww6hGpugkEzjG71EJ2PkKk6qrYqCrmfnE3oz9+VwQg0Mg/j0Vjl
         uwmxEnm3ic9jq6TH1tpUDOMXmkhEJy83OoJwXaxnGtGSd+hTuMYmeRpTfj9+QAyqttRt
         /ZW2ZYCOGyEaXqquoQ1zgCcvHDAjHeC4zmxanVKipsvmM1Lc4z1XHTLY1qMrdvEdPVPB
         RhQA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791944550; x=1792549350; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=uR6LzQI4dyAnk+9+CQvzUY4D1It975ps1tZNRpR3a0U=;
        b=acr3poyixjN7LIw8cYOqWxwY2nyp5pzz8ZXyaN38LSN1Ku5HCuKSc0ylBKbF508Otb
         C4QgVATTN2tnObx7GjA6a0PakoCqg/sY/8jSAmmGZ5BaRrt7oIm8bdgEteV9iCFQUKLz
         3sGwPifyTuvnAirxpqkocd6XCQzokK+mF0/4Lg1w9vnflrBNHc4A7idDLIpxShID3JOe
         /tWWtKnZrsjU7lYvJtGlglmZ+A+lZmUp3GFH292b5v0s8R9EURVbJSqdt4QBINi1g5ZU
         PXfBHGk4ITpry6uBOz4zh/x+s+lb68laXfGpOZBg9TJc5D7DS/uL0jkLjbYP7oBHHdF5
         zZ0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791944550; x=1792549350;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uR6LzQI4dyAnk+9+CQvzUY4D1It975ps1tZNRpR3a0U=;
        b=DBaUoY7zgn2hLT5CEjQwasBi/VfDgnWOKT5HWVW+1nSikvuDRdUTjc/evJLP3soBA+
         AvBraNPtF6vS+L/B4rc857LTmFPgnc0ApQp8yjSeWYasTKfCmKd4L/HeNEJHKvDvXH+k
         VMc0nPlvwrtgloTDlk3lxlVD6UIP8Ijv+eFa0Ge9+gDMcZhPH/RZjrGuRmqGHCsQ/Fhf
         TVx8kgloq/ojaHDpEiGqjPx79BXdtaX4877PEiTZPg1/oCmccnwgjcMJqa6u0WnCsNWA
         HMaKsQNJAxsL5JJrCO3w5t/MEmtA3s+DNW27X99/7ZEaRAe3pbionum0CR1BeP5Qknmd
         m9rg==
X-Forwarded-Encrypted: i=1; AKwUvByGDXbTKsNCSX5PPcTDPg4CLeJm4Hgd7U857VqwsRSXNHiIcpCTjvdJ8V9qultkYX5ntJaxf704kDBA0A==@vger.kernel.org
X-Gm-Message-State: AFq9FYLm/+eIVEVAkosMp37XvKQjvigIXSkg4XgC5VqP6HeAZm18LOkk
	qcYL7F9XfdGxaJdjlksA1f64XDCoh5ocvhc82JRb+hBh0mIY6CLxpczD8K6i3rs/XdNNqIMTjJu
	XG2T7i+s3E5Qopt3Disn89Pe0HxqInvk=
X-Gm-Gg: AYBFou3pI3qm24sUYYOIhU3IsDWFsgamLRmwPYL2SV4MnAjAeObcCMwvCRAn0ouUtuK
	jQh2vZJcMO5Wrrbcjhycrl6/LViVOhz1N0Y+q6zKHRKP5BmBY6EJ/JmU5/ORRs6WnHwX3XOS/fb
	ATvq0feoBy0D7sAjRjI3hAtIYmLXlNyMeIL5UE8rmE32u+RE1D1QmxeavGXkzWUnM8qXNGGsO7u
	LMqQmv8Qp11ROkZk8IYgxcW4DbtHnOHnjEATaDvrwKWAPMfzFPfDkccfAaep7kgkzO0dsfh/qst
	dpOsa/LxLeZ/QXoZkTkqvbOXb8jh7Xrn5xsJGBUJ+Xp0uJ2yB89z3Md7vkee3V6+Ju1KLuOhtZd
	QVXf3pxHR8Bdze4IbtHnxJm4oCuEUqQ9yG8Jh3fFNCqE=
X-Received: by 2002:a05:6512:224c:b0:5bc:f02e:9b2e with SMTP id
 2adb3069b0e04-5bcf02e9c70mr3265873e87.9.1791944549826; Tue, 13 Oct 2026
 19:22:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261013145210.103565-1-sashal@kernel.org> <as5R_xrDv4eVPdtz@orome>
In-Reply-To: <as5R_xrDv4eVPdtz@orome>
From: Aaron Kling <webgeek1234@gmail.com>
Date: Tue, 13 Oct 2026 21:22:18 -0500
X-Gm-Features: AclHuK887CDwAvm9A-A5lvdpxpUm0jxZaYwqU9DtjoFJ0z65i4nraDiY5z22Q4Y
Message-ID: <CALHNRZ9zhVaz9UeYJTFRph+0JMM8x+5it_Xv7Qhy5f2kh12MDQ@mail.gmail.com>
Subject: Re: [PATCH 1/3] dt-bindings: gpu: nvidia,gk20a: Allow a fuse clock
 after the reference clock
To: Thierry Reding <thierry.reding@kernel.org>
Cc: Sasha Levin <sashal@kernel.org>, Diogo Ivo <diogo.ivo@bootlin.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Lyude Paul <lyude@redhat.com>, 
	Danilo Krummrich <dakr@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, Mikko Perttunen <mperttunen@nvidia.com>, 
	Dmitry Osipenko <dmitry.osipenko@collabora.com>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 13, 2026 at 10:46=E2=80=AFAM Thierry Reding
<thierry.reding@kernel.org> wrote:
>
> On Tue, Oct 13, 2026 at 10:52:08AM -0400, Sasha Levin wrote:
> > GM20B needs both its reference clock and the fuse clock while it is
> > powered, so allow "fuse" as a fourth clock after "ref".
> >
> > Assisted-by: LLM
> > Signed-off-by: Sasha Levin <sashal@kernel.org>
> > ---
> >  Documentation/devicetree/bindings/gpu/nvidia,gk20a.yaml | 2 ++
> >  1 file changed, 2 insertions(+)
>
> Aaron, Diogo,
>
> I'm fairly sure I remember at least one of you mentioning that GM20B
> wasn't always working reliably. Would you mind giving this series a spin
> on your devices to see if it fixes any issues you were seeing, too?

I've got a t210 nano a02 that essentially hasn't been able to load
nouveau since I've started my Android Common Kernel effort over two
years ago. I think it came up like twice when I accidentally left it
boot looping for days and forgot about it, but never when I wanted it
to.

With this series, nouveau loaded properly 3/3 boots. I'll keep this in
my 6.18 kernel fork and see if any of my t210 devices hit the probe
hang and will report back if I find a case this doesn't solve. I will
also point other people I know with units affected by the issue to
this series.

Aaron
