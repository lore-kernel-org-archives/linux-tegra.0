Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.46
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793276029;
	b=U8L0d4aRTVjnbCecXyV3NjXOJ9ff8OUlxZK9oDe8/4ViRiLa5l21TN0sFJ5lgcw7y3Rf
	 aPdYlHpqoA8eH1G9KYMYsUheMGw2c7eYbVTGWhMprTKHuxftm7hnRq93lgqNCSjVplpHX
	 mnH6GnK0iM0WLy2JN/kVHZIt9enS61c3kTCpTqSwxoYv4CbpLxdLJhj+la/ag0zBp5lP5
	 DD8O6j3MxRKAxa6I7AObg5INYniiU4yqReqXE7cwhBQSVEZacFGqbctH/tPtgluB7QzdP
	 XZCCjzah4xcpsou7tbaDCJwmFWB12nTN41g8Yf1BG1fupu33PDCqF191tJU59sY1ZLg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793276029;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=r256phbedMQpLM7Pol3bN39JG8XwqfFdaxgjo+KREnw=;
	b=l5GNgMR/EmDuCgugmiOwz/IZq3uwP0n1Go7lwlf/VPfokmPJyBEXtLlrVup0MjuxHpeB
	 1o8QLRrJbsDTSeTxlRdFpdZ9MzbShtsnmG3AbSJdSsZohx3rRZmeISIBfOlIHFg3soVaf
	 HxfsBBpZrWUmg37RBZC05OwtZHbsi/mOK+1cVW9nbjkwDLAOBLKAyYj8BfJ5/OiJgUbbN
	 yPtLg+TWW528eZjjSOllY3tB3qX8LrjZhahNl5r6YrfthiR/49nrXDJqvjJ7zUNk8Nx1M
	 tgOet+ePD9NUzvVVMMAdzPV8MVpyX9UqUYCtMA5ZezlIXS1a3a44oSXUmZnvHcraTCw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SdjNoLtW;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.46
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 172B7606A31E
	for <linux-tegra@vger.kernel.org>; Thu, 29 Oct 2026 12:13:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 172B7606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SdjNoLtW
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5bfc9154ceaso1714606e87.2
        for <linux-tegra@vger.kernel.org>; Thu, 29 Oct 2026 05:13:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793276027; cv=none;
        d=google.com; s=arc-20260327;
        b=V1HeSHsExF+UbejiFqj0hTP6Uf52YyjT4u1sqxIGmujeRb4QnWoj/HHbKXS3a5mmmR
         QUYbKAS7RTnmLAsLD8A4z5StFcabv7v5MlXb/whUaovBgac7L9o0RNgUhM+XigunBH+o
         j645HZ4KFSKAOl6VpD26cZTf9yZ1Nl/c7cYhnayReQuuUb6bgH2RTN4p1VUZthRpRlLN
         skDbRujBpysWysAzYh4n6E51gmzoewi8Jglc2eRFNeET0BSwzfQCqE459XVKcv4Gb066
         YFQI4TQ+23QixYlGfe3gba3NLDqCeD7AUA0InupJvZ5lTnvXfNn4J5cjLV54oy1S6Fgu
         FDRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=r256phbedMQpLM7Pol3bN39JG8XwqfFdaxgjo+KREnw=;
        fh=LFwROp9JMWMIBeroJItSQzYjMu2Ykr/Q5KFiNYsyy64=;
        b=g0KtPJkkYP/U/5uunFErYFrCCkF4FHZ7w95lePA+7IOTJYd85Q0VRMtfsVGq4Ovk/u
         ZJtwVzhGTji9FGyeh+h//731T/x2ejLOe/AFeSCQmI9rfRozxEEfRrzKgHGJasryCVga
         KL+tcPt6Q+hzFij4/ohYbd7HD4XvB7LhQliq5uX9pALk0hwgYoTUS9tiOwPOXxCxI5F7
         gWR8QUCpf5RW4tiROQibNSfZwM+n4SWK+XBg8wwS20ehCKKV9QdkkGPMBD6bwUM+nyIp
         dWADmOjoDhZQO2MWAQ8DFXiihuYKOGPBMMeoOo+ggrOwU4n8uv8kpe071hL5/Z5o9DrG
         EYJA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793276027; x=1793880827; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=r256phbedMQpLM7Pol3bN39JG8XwqfFdaxgjo+KREnw=;
        b=SdjNoLtW9qanoocdo8XfaenLx7jG1vntJFcC8DkLO+gh6BZGq+GtSu/nUUaUUAYTV6
         2zn+32xB2BovX6Y27RtIK/EOCo683DTCuzzCkh1N3PXsFycx0m5ifziqVf6DIcldaxjb
         xFeM6ZZLoJ4TY2/2Z18WlvenLwcZiahgNKalU76tqMfRGU/srBmlyawiUjXoi2bjolO7
         4GarBiynJMxY7rC17kv2QulQqG8X9H8zkpNGO8MErSx+sneTtM9vL705EE0XGqM6Lp1n
         sxShBlDR4AcyaoIZLOQXPB6Pc2aChpyKoUsoA1iN6gOHBP6Xmg9sukVA3i5IM8zab+dl
         uQXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793276027; x=1793880827;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=r256phbedMQpLM7Pol3bN39JG8XwqfFdaxgjo+KREnw=;
        b=VijI/TvKCRzOA5BefwmKYW8k51I7q/9H/XJLpTZ6lG25as+Z2Dotgo+/56zAqoKtwb
         bIAoa31pjEabFGy4KtMvduoihdaI9hMXwCPpgd5CpO8OFTqyVIUOAvhN2IUYwC6P0kPj
         QB8mJYxLx+V/s3sj7SC2i7hf8MHskBNdMKDz/7rklFzDxgXMvCkG3CxxUae5vhfcmpIL
         6UJ26aQkEosk3FrabnKvg6pxZjE/KR1bwKSbxFJPHAr05l+UWcpEuxJUKCldgx7ihw6P
         DtLDrktwBnXU3qJ6GoQT5MSZZUzIB68/fBdOuERteKFBIPcrIPUEcQZjkHEXtNZLolj0
         I3gQ==
X-Forwarded-Encrypted: i=1; AKwUvBw8X+miXNRK4kJVvjrLFP9Uqo9J2Wj4pDsduAVOLbJX1UsOjH8lLxEzcfayynIIJardbw227wJjTDDJEA==@vger.kernel.org
X-Gm-Message-State: AFq9FYKyLkdiqkItcW2tCgqy3UGO0+CGAHT6pggccb3DoHHzS1STrO92
	ehJEfzWFODNhXty+X25AM8Say4arjZdo+AwXYltHeexDlHqlWoymijDjrVdtuE6LWDa2iHskMJo
	eISyo2JEx+ooSIFYpaF0KJ4rHnT3TZgE=
X-Gm-Gg: AYBFou3Btg0dmSCWYOhdMlydiAfMhFatZoC04WlaKEgd0v3iJcAmvDH7Smsz0mCkjFw
	7mLTRvls55ggR1mWkTJDSmxPIDb3HeNpk1Fyr72alOvQEGaWJdakhcoDPfbSSzeVP45HksgEjzW
	XjQpHHpD6BXVLBJ0e3IOt8GbhdWjsI9IlVjC5bl0+QYs5Cu1fBPUrqgUcLzPcBTX4ZdirMkbiV2
	Gl9FoKixRMeiuT+y0Ov1lIW5pskYMIkgnQWR/QusaN/hhfaDN1u9d8EDDY+CmvRBQFIbJsgVj8P
	8namrt8uz/OJq29fibCfTHFYpheXqflqY+w5yEluyOxUK9Zb49QglQVX7Amyb5aFJqd54JhQ+9V
	6sBg9zAI6s1Be7ch0Iqcuj12fHDFCCRqUkXE94qN9M3DFO3bnBLw05WeapOGY4IU8gFcGddA54o
	cSpM6vemTdwYnDAfi+fX+HZf8=
X-Received: by 2002:a05:6512:3d86:b0:5bf:b5a1:3c09 with SMTP id
 2adb3069b0e04-5bfcaddbde4mr1985707e87.31.1793276026925; Thu, 29 Oct 2026
 05:13:46 -0700 (PDT)
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Post: <mailto:linux-tegra@vger.kernel.org>
List-Help: <mailto:linux-tegra+help@vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-tegra+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261027-submit-mtk-uart-dma-synchronize-v1-v3-0-aad7a6b3c62e@gmail.com>
 <20261027-submit-mtk-uart-dma-synchronize-v1-v3-1-aad7a6b3c62e@gmail.com>
In-Reply-To: <20261027-submit-mtk-uart-dma-synchronize-v1-v3-1-aad7a6b3c62e@gmail.com>
From: Keguang Zhang <keguang.zhang@gmail.com>
Date: Thu, 29 Oct 2026 20:13:08 +0800
X-Gm-Features: AclHuK_9NKjNXktxauulycDv6ofwBJPad2Bl9GVrdKZysKXzXdts0yEdkZdQ85I
Message-ID: <CAJhJPsVQjajTzOwXyqUkdTT+Cw8wEX7-0NOS63S9cByvDSYLng@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] dmaengine: virt-dma: share the DMAengine
 synchronization callback
To: James Hilliard <james.hilliard1@gmail.com>
Cc: Sean Wang <sean.wang@mediatek.com>, Vinod Koul <vkoul@kernel.org>, 
	Frank Li <Frank.Li@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Basavaraj Natikar <Basavaraj.Natikar@amd.com>, Jacky Huang <ychuang3@nuvoton.com>, 
	Shan-Chun Hung <schung@nuvoton.com>, Florian Fainelli <florian.fainelli@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, Lars-Peter Clausen <lars@metafoo.de>, 
	Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>, Zhou Wang <wangzhou1@hisilicon.com>, 
	Longfang Liu <liulongfang@huawei.com>, Andy Shevchenko <andy@kernel.org>, 
	Binbin Zhou <zhoubinbin@loongson.cn>, Taichi Sugaya <sugaya.taichi@socionext.com>, 
	Takao Orito <orito.takao@socionext.com>, 
	=?UTF-8?Q?Am=C3=A9lie_Delaunay?= <amelie.delaunay@foss.st.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Laxman Dewangan <ldewangan@nvidia.com>, Jon Hunter <jonathanh@nvidia.com>, 
	Thierry Reding <thierry.reding@kernel.org>, Vignesh Raghavendra <vigneshr@ti.com>, 
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, Masami Hiramatsu <mhiramat@kernel.org>, 
	dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-rpi-kernel@lists.infradead.org, imx@lists.linux.dev, 
	linux-mips@vger.kernel.org, linux-tegra@vger.kernel.org, 
	Frank Li <Frank.li@oss.nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 28, 2026 at 2:43=E2=80=AFAM James Hilliard
<james.hilliard1@gmail.com> wrote:
>
> Several virt-dma drivers implement device_synchronize with a wrapper that
> only converts the DMA channel and calls vchan_synchronize(). Provide
> vchan_dma_synchronize() with the DMAengine callback signature so these
> drivers can assign it directly.
>
> Document the requirement to stop the channel and prevent new callbacks
> before synchronization, and the context in which the callback wait may
> run. Replace the equivalent wrappers in the existing drivers with the
> shared helper, preserving their callback-wait and descriptor-cleanup
> behavior.
>
> Suggested-by: Frank Li <Frank.li@oss.nxp.com>
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ...
>  drivers/dma/loongson/loongson1-apb-dma.c       |  7 +------

Reviewed-by: Keguang Zhang <keguang.zhang@gmail.com> # loongson1, virt-dma

--=20
Best regards,

Keguang Zhang
