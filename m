Received: from mail-yx1-f48.google.com (mail-yx1-f48.google.com [74.125.224.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C9D0388E6E
	for <linux-tegra@vger.kernel.org>; Mon, 20 Apr 2026 09:05:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776675941; cv=pass; b=PSqbtpceOhwd9VTMQY/NyR0o56Pc7MjsuwWQJIJCKSc8MKCarBoop7//QRPlY1VF/hCPqItvC3+CGAUlfw4S+iciQmTncGtaFfRZ4gib1z3rMJhl9dmcCBqQm4PXCLSZHL6bHHDStvrY+mDWGwkXW0e6q2ynIF2I1m8MTT/33C0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776675941; c=relaxed/simple;
	bh=5egZAP/oNduQWeGQjV2YZI+IrIA6g6E/EegiGcc0lT0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JoiQdxBTHEZ/opNLCrjh0DMFtEWLNvP4HmPhQTuUPJj5Lqkdp6StABlBDZWFZyeONfu/23kcrO8IEwGvT8yv6iKR1tuxL+h0xS0TLc1xtOpbOq2aHozBWFVbh/6/oAOxLTnq+i3Cop7fWuOvkTR1wide+1Jrh0E43E2EN9Mb6R8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FEQkMYQW; arc=pass smtp.client-ip=74.125.224.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FEQkMYQW"
Received: by mail-yx1-f48.google.com with SMTP id 956f58d0204a3-651c366f7efso2872235d50.1
        for <linux-tegra@vger.kernel.org>; Mon, 20 Apr 2026 02:05:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776675939; cv=none;
        d=google.com; s=arc-20240605;
        b=XpQFO7utSooP50Aix5I5pJlvGcVcoEli3m2vLNXKqBRInV0LQecUFWSD8viTnmw9bw
         2F34ASfKERLiJdbAdgBfBJoWaoTVoriKL7O6dYHSmJ7Y6A5KuqWHnRCvW7MJ+UVU2wYe
         qd60+QwkbXVjKO6MIwaxSFZgAWqiyXs9Ms7+n5cguH4iTsxZEjJEP2DXTzfSMHyf3KRa
         V5jfc6JhwfzMdtC8aizRE5nyWNVvLaW94pk533u7YC5rj+lt3Gjf8wZ2sVT6JLGjjB+j
         d2RScCcMW4QPRo205qxA5xf/oeN1MxfZfBlQIOV7gROP9GXGoHf6jRKF+fmOAeD1gVwv
         W2pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=5egZAP/oNduQWeGQjV2YZI+IrIA6g6E/EegiGcc0lT0=;
        fh=2PbuKVZ42diOI+KNl7RA0LiK2jl25FvWheWGprxGF4s=;
        b=O1AfIftA40nSP2NK57txEHJ1D44qVNu/fD8YBUaMbhUtnSqW7UljxvEpZlN7qpHjnL
         YH1pupupxvDisSkdYHh/3Lxjb4NIDbCOoqEs1xQbgQdpIgJ3eqt3Zr7O9ajuJS4IRrQ9
         wil0rIl7WCYtazIVpiuaFnybQdmqdOf7NgA6PleUDo6gR6C31KAIlgP0+qK8zBzh/kTP
         mQkUEuTB2tBrjKWRvNZdpj5MDHMxQSqkouLmqHBVGvUPEW4K6Obot6ZgXIxLbeBm8nVx
         p14UKNXSDbmlhw9N3lN39HjkyId22N3/gvZ5znMbtQE+phB8oZrgmP5dwFhVWxZt7oj3
         GQIw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776675939; x=1777280739; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=5egZAP/oNduQWeGQjV2YZI+IrIA6g6E/EegiGcc0lT0=;
        b=FEQkMYQW5BYd29unTrxxNz/A47+4x5XcJGrTO7SYI64ToOKLClrnmu7ujGqXxH84Wq
         SRLpRsZyRyEfWWgFVMQqcB1VIPNgpAcZ37pIeG2LVe8GlInb8XLpeY4gNs0BViv4E0Yi
         7iVxchv/yvYCBn7pFknVkrKvfkxItPDR6IfJ+SKk4a3QW66CuExXcNPO7JZRCYx+hZLr
         6Lyou/YMLPOzOfD9hGgIJ3jzsMTVK2q2V2Qh7wqT/k/hbh/LglLu/V/hGYpCXTD0dE2B
         15ti88cLGF5VhJDlRK8V6KerBVOFVoKhKLPrpy6+i8da7vcnGs8xRwvj5yvuHl1NpLGX
         UtlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776675939; x=1777280739;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5egZAP/oNduQWeGQjV2YZI+IrIA6g6E/EegiGcc0lT0=;
        b=qz9g5KZ+HTUZUtaQlE2VqVRrFX2IWHXRKuRFulMDrDw4Q6XBS88Ud8R9eAIByO2xPb
         4dsXg/qtWu+fIF51QYkrsMiON5Y27+BoJ6b4f6MEmHJsrxrv+SgaVyt4IoAw2Ns6DQS3
         AvfACxBTKMplGwKMY35/ZSgyO5YKoDGqKORG04Aci8wfdKqN/pC5bWcrmf+e6UaghAOM
         unQMLP5fZw5AEa1TNAIF3QgZDNTKT53aUuOCFWu8sowVjEN63eHY1T8RFWQ0sukbHMAW
         NQa6SyHbSU7z0m3UcqLUTDRrY4gYgQ6iIprZ6Sjp6O6gHSpm70n3d9xcK/FDc/JA5JPX
         OJzQ==
X-Forwarded-Encrypted: i=1; AFNElJ+qGfLLd5zDxGAmw4qX3QKBvIqFgWRI7b+SNiUe8x+ivs83yegAjHN3ACiJ5TUkRB45xWADmKgrYyVeNg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwtmN9OX+WfpfG4XBr4/nnVKG7entgd1Mv2LUtXexuQYS5RqlRF
	2YzWbsGbEgNMv6gCRIJNZ2SiUeHSC7BSBjthrQ99RAIcvax04RFXbr9t8hADCGJc7z6ssViVFqm
	oSOlCVa02FJ1BDKyj8Avzn82FZHMxrvE=
X-Gm-Gg: AeBDietOaVFbEH4sOVjFXmx9fVyL9nfzujeReH+IsYJWDQtl3vrcHOCgTU8VLBT0LOy
	i5f6K0q0o5SocGcf7+pQIcUksswdQh0tb5TLB3fdOI7lO7b6Tebd+kcBrCDoOI2McYawowgtegS
	oVVTKej89HcApNRoi1xUnrA5FOG9wzS2WZ8MhezIikY4CQ84xUBBZWIKO2bCkT7zYVFlfNqQr1n
	Wpf6VT70KWwrDh3p1nNEPkvHqizKjVLFfbHjMbhNlK+QEtNl6pxrgfWBPXWTsNGfGo/ubSdIMv7
	B3aSy5MrAHOays9CKoQ+6b+faDJxlIM=
X-Received: by 2002:a05:690e:e8b:b0:654:1261:8b57 with SMTP id
 956f58d0204a3-654126195a1mr7903049d50.6.1776675939331; Mon, 20 Apr 2026
 02:05:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260413141328.2954939-1-lgs201920130244@gmail.com> <q6Ni253ETr-zY8OZRWnm4g@nvidia.com>
In-Reply-To: <q6Ni253ETr-zY8OZRWnm4g@nvidia.com>
From: Guangshuo Li <lgs201920130244@gmail.com>
Date: Mon, 20 Apr 2026 17:05:28 +0800
X-Gm-Features: AQROBzCv0ouH9dGitvJnxiCUbB4xuHu4ZEpCCDhZWL301SP8_3uH_VxP4dq4Cy8
Message-ID: <CANUHTR9khFiwfyAWFKBuzM5opBRLtuOPTWNZyuaoP_Rxmxk+1g@mail.gmail.com>
Subject: Re: [PATCH v2] gpu: host1x: Fix device reference leak in device_add()
 error path
To: Mikko Perttunen <mperttunen@nvidia.com>
Cc: Thierry Reding <thierry.reding@gmail.com>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Vamsee Vardhan Thummala <vthummala@nvidia.com>, linux-kernel@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Mikko,

Thanks for reviewing.

On Mon, 20 Apr 2026 at 15:19, Mikko Perttunen <mperttunen@nvidia.com> wrote:
>
> Unrelated ..
>
Sorry about the unrelated change in drivers/firmware/edd.c. It was
included by mistake due to my carelessness when doing git add.

> This isn't a leak -- if device_add fails, the device is still on the
> device list, though in a "stuck" state, and will get cleaned up through
> host1x_device_del.
>
You're right. I misunderstood this path: if device_add() fails here,
the device remains on host1x->devices and can still be cleaned up
later via host1x_device_del(), so this is not a real leak.

I'll drop this host1x change.

Best regards,
Guangshuo
