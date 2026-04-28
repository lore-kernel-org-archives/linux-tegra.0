Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCFC0311C2F
	for <linux-tegra@vger.kernel.org>; Tue, 28 Apr 2026 22:15:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777414561; cv=none; b=rpHmXr2ezpNAlD4V07aXugu2XhYcgB2yYCJEk6G8nqk/RNcOdq4+TrLGj1vMM2Rb9s7FSJevq8Ia9yed8RmqFRbqYCICSspE8SUQBl6MjCd2cjw7wKEJP3FfHX6sGbPKngRRCY0SIxRTBblnGHHwjvTiRLvAHXpE7Iaj1nDGDCo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777414561; c=relaxed/simple;
	bh=YRXa3SqUBnSgR/YtBhUZuZAmwoEQPel0vDrvl4dz9MA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=R7kjZah38E9WQZ7WbuWixEj96YsZv03lMPV7sgdFckdvBdE8yOoxWfviTEXlK99GiUFLTxOhvAoPYt+Q0KvI8VQLjscVBWDD6boPJxpFrbBevS0MkbYx+CaHSkAI9YkmuXrUOXT8SXGvb4/lxFbtipKyj8ynwhuCT0GRVzASWwU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=d+Y0enTr; arc=none smtp.client-ip=74.125.82.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="d+Y0enTr"
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-2e221a71e19so12019708eec.0
        for <linux-tegra@vger.kernel.org>; Tue, 28 Apr 2026 15:15:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1777414559; x=1778019359; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=IRuOpUnKlyxobyVU18RBjJjL20LQKeUc7Tn5BEfMoeM=;
        b=d+Y0enTrpOWWO4xe6U18GjzzSoS5d9ADQxWLx11uyITMLza3yHptDlg2sE56m8dVYy
         317JgmmSPSDR7cKxiClEijzpIBcWaCGgtktww5s9izwLd5o+5QgZCHaoWR9vVxxS/38L
         PoBaaYo9p32j6CN00g6p2Cq4ctKqOJDZODjPA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777414559; x=1778019359;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IRuOpUnKlyxobyVU18RBjJjL20LQKeUc7Tn5BEfMoeM=;
        b=f/Ei0X4RFJtTxJR5drvUirbbv69KucHzH0azUskR99qY3H86KjnPMeEUz6mwUY2LIy
         dRRkn9U//yVQGRbzNJBIcw5r97BKukyVvUy67WrwmBrtaJ0jhXpuxd5g3+6awmW1M9gw
         RaKMggyrfg26QS172wViyVmOMoUi6BxeHNA48X2BnS1H+3gQD2a6vCBBJfdNPb4snJJw
         ZS/CIYAG8/5v0do51MyJHyI15GvtCq2a8NNRBOAEbkTX7e8MjPRl7PIJgJnFgNR/gG/j
         uT8xsMKJDTqZvzrLijBNbvTPI8Zac4PViDnKwvx4mV7AeDOSEhlGE4XFZj2mK0zLiSeb
         gKKA==
X-Forwarded-Encrypted: i=1; AFNElJ/xQMZ5Qb3yvuP0XgXQQ/cmoju86Q30CAEF9yhPBYFfOn61/0A3JrTESqT9QpMqElQNEYhAAkzOtpVdKQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+kHzZy08tXGQA6mZTglSSy+N+o7xUmg3H4aGPusTYZjGJ0KNQ
	PBOLVUBumOnwpwG7aoNeZUyz880USqKOyIo/UmRu/FLWru6q1ZX3pGGgd94gwR7ROQ==
X-Gm-Gg: AeBDieubo7uN1KTP5jBWyPKthLYBzxheGbyQL+oBSA9RTR+NYIxlB0UpT55okEyfcie
	C9ubZXp2i5GMj8BMvMybabiqwJHexztzFxsACWvHue2/jr+9Azb5PBUsw2yKT2WmAUOIrpBpM5S
	M69A2EAnXivMhk7tRN/zD5wQ7O6/XGrlZ94AnRPU9uExdYBT//5F24PxixXWv9n3KAA1LmM3s/5
	5Te+5BceY3lvR2/4+SE8XjQO+QUgjaD3Rzo82bYTQQMvXUxnK7cChN6hPq3JntXPYPtI9rMMbyp
	IVBBHDUvhBDR8sO9R5fLdqnksJmskLOjliu0gxSXU2jx/fwKB12/VDgCr1ysUQpPaMsB9Krspjq
	jQaQM3ZhHQSDXxW3NlLCTX2HHE9xMCTDjG2EUFmQ0y9EcHs9f7ccrI/AlqHHG5ft7DJunXafL99
	UKJRoUptey2WTuSk9/dQL07+DtqwmJ9OtMHEYyitCXQEcv3veNaWKjz+SnihL4+ZTrGWc75vcz
X-Received: by 2002:a05:7301:fa10:b0:2ed:75d:fe40 with SMTP id 5a478bee46e88-2ed0a084038mr2613645eec.15.1777414558981;
        Tue, 28 Apr 2026 15:15:58 -0700 (PDT)
Received: from localhost ([2a00:79e0:2e7c:8:4ff5:9607:c7e5:48f3])
        by smtp.gmail.com with UTF8SMTPSA id 5a478bee46e88-2ed1c070523sm162156eec.19.2026.04.28.15.15.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Apr 2026 15:15:58 -0700 (PDT)
Date: Tue, 28 Apr 2026 15:15:55 -0700
From: Brian Norris <briannorris@chromium.org>
To: Julius Werner <jwerner@chromium.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>, devicetree@vger.kernel.org,
	Doug Anderson <dianders@chromium.org>,
	linux-arm-kernel@lists.infradead.org,
	Tzung-Bi Shih <tzungbi@kernel.org>, chrome-platform@lists.linux.dev,
	linux-rockchip@lists.infradead.org,
	Alim Akhtar <alim.akhtar@samsung.com>,
	cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
	linux-tegra@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/7] dts: Add /firmware/#{address,size}-cells to
 Chromium-based DTs
Message-ID: <afExm9HeB-FMmP4P@google.com>
References: <20260428200712.2660635-1-briannorris@chromium.org>
 <CAODwPW-YuhQxyGSeahp8+i-bz_hAvPQQCNWxaZCjrbvkHOQa7A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAODwPW-YuhQxyGSeahp8+i-bz_hAvPQQCNWxaZCjrbvkHOQa7A@mail.gmail.com>

On Tue, Apr 28, 2026 at 02:43:21PM -0700, Julius Werner wrote:
> > I reviewed Depthcharge code history and found that this problematic
> > bootloader behavior dates back to at least 2014, with the Tegra/Nyan
> > device. Older devices may have similar DTB structures, but I'm not sure
> > if they have the same address-cells problems. In any case, these changes
> > shouldn't hurt even if a device was not affected.
> 
> I can confirm that Nyan was the first Arm device shipping with
> depthcharge. Note that the Exynos devices are all older and shipped
> with an old fork of U-Boot that probably handled this very differently
> (I believe they had `/firmware/chromeos` but not `/firmware/coreboot`,
> so they wouldn't have had a `reg` node and should need no `ranges`).

OK, so that makes patch 4 unnecessary:

  [PATCH 4/7] ARM: dts: samsung: Add #{address,size}-cells to Chromium-based /firmware

If I respin this, I can drop it. Or if it otherwise looks good,
presumably folks can just skip patch 4.

Thanks,
Brian
