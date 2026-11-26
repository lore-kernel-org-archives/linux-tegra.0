Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795714833;
	b=tJxNVcnCo+EbmbQnHFlq0B7n9WD6wXZdrNoXWhnksb3+UwJ0GTALIIC3Q15uqtfPBIo+
	 LxhP/06Y9SuwpS+YB/bQ6q2FUQxGxVWV2u4cI4Y7sNJGStz4T4eeckpN7ZMKVYNgFFjix
	 hnKjQlToKbIa5pXs56LX2rdN4RbnDf6pBMXlp80YcSIHYGdN62kaG0ivVR8+vKskvWgeQ
	 07+fOqRqz5D3ZjhubLFOOWuANb36CGD3hJdalrhJtAcB0J9z5rKe9lmX9RmJ86AeeahAq
	 nFv7z74Xa8oITFCqcFQdOhBf3ub6cGgIzZOupMe9bJFdsQoAobtiVelThz3j6/gfcrA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795714833;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=WnUI0hkBPpSkdO9GvSJqBbk00QrZu2iiDVFhG7JTP+o=;
	b=fP+qIP6FsTzWfH7WlZNhcKRWQonZ34V2Lxby6JFcdJ4dkgjXtlNkXLMGCZoGQS0DLAz9
	 CG4wplF7gl+p0kajEFHpu1xWBygxtE6ftnJoT7wRpwH6yfs6L37DgVZT3YPcN0hYYrCP9
	 BmcMOIqX42frjlbl4ufmJWxC3GQCC88wKnHocpiHP+Wn/x83MQfV11DTXBQ/mPAZ1SM9X
	 stwLudbjRMAjCsiQJzIZvh8qkdMk86+k9rKdR2wKoTRwI+TaOxg/YjjOPPfG1vhYEqyAG
	 3/vv9MMKmX3SV/Rf/Il3kQ0VjIHI1Bl8Gzjj+50NJUENna5oXZD5B+01IAPUcHARY4w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=thegoodpenguin.co.uk;
	spf=pass smtp.mailfrom=thegoodpenguin.co.uk;
	dkim=pass header.d=thegoodpenguin-co-uk.20260707.gappssmtp.com header.i=@thegoodpenguin-co-uk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=koJgtQ0K;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.42
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C003F606A32D
	for <linux-tegra@vger.kernel.org>; Thu, 26 Nov 2026 17:40:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C003F606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thegoodpenguin.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thegoodpenguin.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=thegoodpenguin-co-uk.20260707.gappssmtp.com header.i=@thegoodpenguin-co-uk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=koJgtQ0K
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-92107df3f13so68474336d6.3
        for <linux-tegra@vger.kernel.org>; Thu, 26 Nov 2026 09:40:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795714832; cv=none;
        d=google.com; s=arc-20260327;
        b=qwCCaJkYb2ckDNsiH8oBBLbFUfItOtf52PA6QbxnlgcJWneGUzzuaSvdIVc+xBs0qP
         9pjXlq3PXf0To+PZXHY7B3l+uR4xmoZhum4Gi6obuNoeDiJagBXocr+LBhQqwe2BmxUZ
         2YV4nx/ZIVhjz1YUNQGpg095gooNi+XXC4vGDeMu1lRbo7sPoq4oChBa9SL4b20XvG39
         lgci2/VN+DHbnvKq1B7WHZElHDMdIoj8fmMk+F9bE3sd8EZ+F+dZx3Cq6hvarMD4i0vL
         8yA0hkA38mAIFWuFCwVWm4X/iEOAv+2rwCXyu6loHSTCHofUFaKMGe/hD679QeZNBF88
         oJJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=WnUI0hkBPpSkdO9GvSJqBbk00QrZu2iiDVFhG7JTP+o=;
        fh=tmazXeTHunS8QDftkd/+CIxAXH6aHtgLeyg0hNb6wEQ=;
        b=qtpGxQcu0e7CelIfs2kA1Gh8uwi1wz55HcuMYXqpWYNK1iiwGlpA9yaneyhxYXReC/
         lu2yKL7Z4TkD1wm8qRhFlIjzpW/i2MS6eRZZpT7RVt/2JBRjink7n2HJZj/I28SHKRYb
         5NSEjTRf3LATtUo0kJ+g4NAa6pUF9Gwp9TAIHbtHx38N5mCGRwpF3LlFM59Iufmk53xv
         5nbozB9qYraTfupmlWEjZcFrfVEYuGlOdyf1LQGkDOqaXjvNBFOSHNAVi0LcQJbjJgXV
         49K+lYqQm/A5fP4wTNNJuVDK/lg43WNALGyLu3cfEp3q+98zMqLUYfOywqoL2H5+YSZw
         1Ghw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thegoodpenguin-co-uk.20260707.gappssmtp.com; s=20260707; t=1795714832; x=1796319632; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WnUI0hkBPpSkdO9GvSJqBbk00QrZu2iiDVFhG7JTP+o=;
        b=koJgtQ0KLWRudibXdRD3TYnXWWnPf7e0C8y5LTWdUuaKVIfZqQoTaOdUn1Q0V76OEc
         E3aYd1F2yhIuzNlsvoWrs6e/LPwSAbflsD6MAzyPXGkPGcTXl26Rt952VWmm3H06B5K9
         buCKiCA7oBahEH6yVxnaY8L+g6mcbdys0Kr4faC4ajE/s0HZLcM0U2m3U5ndNylxobp3
         3LYeL4V5xVaJ/edeh9xQ7/OMq6rU6mJZd/KyInScBCCzq8vV/RTojclmchkwYwXz32F7
         G8pPnhgThJNOd9AtGm4q71iInfNGJMfgp9Xx2ihWTPfcThxxatadk2gNQV6VvMhVuJNS
         0Fqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795714832; x=1796319632;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=WnUI0hkBPpSkdO9GvSJqBbk00QrZu2iiDVFhG7JTP+o=;
        b=m3IQEEe7dcBuaTuccNLGyhSmgMtLYRv2ngK3O7ui04Aar5pNla7W+aFcLBlo4U5F+q
         WBqyA69Tck5j/oFSIS/u+FTVTJs1Y3ZMaZEaYSWC9gbsCfpOCVnoedM3uzIaXpLQ8BMA
         wp98h1XBKHRitVkln0zmpAuddFN0dZLj6RrqqcAEsRVidhgNSkQrtarpnUZbPWe7MDH9
         2utXBmmL062Z3cIOeN/RmLdFYLXsMWfijlVhZHNYdB8zvjEFOvepFIXSG6CzjgRsyIX6
         Kup/zbfPA9hBZ0kO+af9VT5BfAjdo4HowXhXQXsGo66tLo4BabLpFt6T7y4Zgm97l1LG
         aP+A==
X-Forwarded-Encrypted: i=1; AL+hErE3S6BTnGiREiV3qovPzniRLFupKf05P5/uywyrECxgVrL9PiuKlum0W1GfPxDuo9myYL+yvoy5Yfnm8Q==@vger.kernel.org
X-Gm-Message-State: APuU4Z8nn14d+0wTa/rraYMqLhkGSEUriXK4SHZvpgO3nvu+ebESINc+
	EltxwFxEFkoRPOcojGcNQiVpFxMnp0CT2NwhiGhtrTKwLUI7S17aNH35qkgALCfINjXZEM+rUJA
	oXp3qc/6r1R9xnHM74D8wA4gufmA+758KLsl27DcjPw==
X-Gm-Gg: AZFdTZcwwj2O0vkASfAkYQCuP6W6ikuuzg/TxtslNAaH1PLhH0kvgS+btWWIBNqGkrc
	KnbEAfjpyzwVEEwOOagkiGFElipg3qya1yzPqIxrXg3kzuj7bxvNPxdo8D+iYAuerxciIms0nbS
	zNX5DwsTLQU8yNcRtk+kTHk61ee5yv/myefkHuqztufaAn0e5MgFYdGwRU2eBhR0uCcn7SzJWLJ
	jeHFV6V7/J7QimWfLLLPGOkWINF25VbBVLwDSVIjKYUg5/zM0WHaNQaD1GpEIjeCIk1WPE2rx78
	t92fIDJyycl07CEbBapBnYpn5Kjn/lEc7nhvRY1pFFmcfnl1eJnQm/jIuO9pMwFEHpJ7fr8u5kX
	0r6CVVtEm2Nn9APWdyhtHLY9knY/6qTFeHZv9P83hfreZRfL8fSFgd6kyZLR0X62035pHjhQ=
X-Received: by 2002:a05:6214:3c9d:b0:91c:9316:f4e8 with SMTP id
 6a1803df08f44-92134baab8amr374316166d6.54.1795714831544; Thu, 26 Nov 2026
 09:40:31 -0800 (PST)
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Post: <mailto:linux-tegra@vger.kernel.org>
List-Help: <mailto:linux-tegra+help@vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-tegra+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261125-acpi-mtd-v1-0-42ad2f645bee@thegoodpenguin.co.uk>
 <awcZcuSbse5g3FWK@monoceros> <87v75jyiw2.fsf@bootlin.com> <awg4ubbFu0FksThB@monoceros>
 <87a4mvwv1b.fsf@bootlin.com>
In-Reply-To: <87a4mvwv1b.fsf@bootlin.com>
From: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
Date: Thu, 26 Nov 2026 17:40:20 +0000
X-Gm-Features: Aa3M54pTYXahjqTv7_MT1I1wEAeHDvmXQpnCEn41MhhclxuSVrfOIbrke1NKz3k
Message-ID: <CAA6zWZKPY-wjq_sbheLBK-k1b6rCdXs353b7j-fTYB6vTGLmGA@mail.gmail.com>
Subject: Re: [PATCH 00/10] mtd: use desginated initializers in *_device_id arrays
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@baylibre.com>, 
	Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Pratyush Yadav <pratyush@kernel.org>, 
	Michael Walle <mwalle@kernel.org>, Takahiro Kuwano <takahiro.kuwano@infineon.com>, 
	Vladimir Zapolskiy <vz@mleia.com>, Robert Jarzmik <robert.jarzmik@free.fr>, 
	Alexander Usyskin <alexander.usyskin@intel.com>, Joern Engel <joern@lazybastard.org>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, 
	"Ritesh Harjani (IBM)" <ritesh.list@gmail.com>, Shrikanth Hegde <sshegde@linux.ibm.com>, 
	Michal Simek <michal.simek@amd.com>, Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Brian Norris <computersforpeace@gmail.com>, Kamal Dasu <kamal.dasu@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	William Zhang <william.zhang@broadcom.com>, Anand Gore <anand.gore@broadcom.com>, 
	Kursad Oney <kursad.oney@broadcom.com>, Florian Fainelli <florian.fainelli@broadcom.com>, 
	=?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, 
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, Han Xu <han.xu@nxp.com>, 
	Paul Cercueil <paul@crapouillou.net>, Harvey Hunt <harveyhuntnexus@gmail.com>, 
	Keguang Zhang <keguang.zhang@gmail.com>, Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>, 
	Liang Yang <liang.yang@amlogic.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Manivannan Sadhasivam <mani@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Stefan Agner <stefan@agner.ch>, Lucas Stach <dev@lynxeye.de>, 
	Thierry Reding <thierry.reding@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Jacky Huang <ychuang3@nuvoton.com>, Shan-Chun Hung <schung@nuvoton.com>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Linus Walleij <linusw@kernel.org>, 
	Kyungmin Park <kyungmin.park@samsung.com>, linux-mtd@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, 
	imx@lists.linux.dev, linux-mips@vger.kernel.org, 
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> Let me know what you intend to do.
I might as well address the nitpick since we are refactoring already,
so please wait for v2.

> Not related but since you were removing the /* sentinel */ comment
> sometimes, when do we get rid of those extra entries entirely?
I don't really know if there are any plans for that, I certainly will
not attempt that anytime soon.

Thanks,
Pawel
