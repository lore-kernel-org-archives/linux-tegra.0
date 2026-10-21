Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792553655;
	b=PqFN02EgpY0lopTaKx9kpKq1TINdKahYXzeFlh99HZ1AIAkCuZmSsvDefwKSmzVOHbHD
	 BjH+6TFFPMkxyk3Oa3cNDYzHsMgHzGmEa+AVr5XGiG8Fs+JD7J3Sy9svOFfpyyubbsrr3
	 I4z8r61QMAKZhPPVvqolsYIZM7qaa8EX48XBMjH8Ja8JSB2qCawRwyb7LORYK20DT4mOL
	 1TaXn0VmbUJwcgmpylG4o5gkBtaMOKiyuckbjsOhCpWtVhaxmhD7yOX1dl9IeXmjwGJqG
	 qLob5I6udSQMdCuon9GP7CFBhNnGWnYC+uacsjUkP2ZDqTvTokfdfHrl0iOrkQLctJw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792553655;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=fBgq8YPzeOh+YWrJzl8R4hGpHpUYFyaTH8GPM980OrE=;
	b=hFDUd8H9lcURbKo7ewfYHua1VHLYA2MReH8rlSIjkSoUyHLvWXFA8kbZEh3r0QHEyzEf
	 mEg/QQ2Y/56T4Qf8fOjnTWIZAJbB22Mjn9wya6ys+pI5y5jSq/DZdBhGU7q28bmDoATIx
	 8UDe05OjgO9CpZP/AKXL67zJGU/pd9C+MEkrOohhbC4NCQhoukM4gpHqtrPJBM4N81n3A
	 cEYBcyVN1T/Hm8hy/rtfHSRKWvr/a1E8pLbwfdGONVjhnWqUNO5pp5Y8oyH0IYiMAsmvg
	 4kGHMa0h65G+PqBaRl4ubdgBKJI90Ohv3h+qpS1rtNSpxqCESBZkL3YVNMNbBlquZ6w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cUsdlhl9;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AEAF606A319;
	Wed, 21 Oct 2026 03:34:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cUsdlhl9
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 822AB1F000C9;
	Wed, 21 Oct 2026 03:34:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792553654;
	bh=fBgq8YPzeOh+YWrJzl8R4hGpHpUYFyaTH8GPM980OrE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=cUsdlhl9FgTXfrJZYINKtBIYqcQeBnsXcnj+pRK4w7NAL4VhRhJOxLQYnLpb47a6x
	 vNFKte8GS4L23Ls1g5XsJwmEnXP5RIM15PCHakh7ApDuaVxLjglkCaPmdCT05RHVNV
	 NHWrxThiMLiXTDjpDY1z+NkrTxIP7PAoi9/H3+B6JPXA16JvZKOKHwZ3o1WmFIIwx3
	 6+JeGjxFEMD3YmR1a8SQ7ml/HknAgACi/zJ4SjJUHLdDjt+D8RjOy57AWeP6ifgdX7
	 y9IAO5tToyuzgc89N6xSUDhpNLMkFmtGKTR71SCV6CnAqlzugzvLb/8q6orTDzoJv5
	 ycNO9GlAmt14Q==
Date: Tue, 20 Oct 2026 22:34:13 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Jessica Zhang <jesszhan0024@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Thierry Reding <thierry.reding@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	linux-kernel@vger.kernel.org,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-tegra@vger.kernel.org,
	Simona Vetter <simona@ffwll.ch>, Maxime Ripard <mripard@kernel.org>,
	David Airlie <airlied@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>, devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v3 5/7] dt-bindings: display: panel: Document Hitachi
 TX10D07VM0BAA and LG LH400WV3 panels
Message-ID: <179255365330.4070918.16011606066649236356.robh@kernel.org>
References: <20261019095705.91062-1-clamor95@gmail.com>
 <20261019095705.91062-6-clamor95@gmail.com>
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Post: <mailto:linux-tegra@vger.kernel.org>
List-Help: <mailto:linux-tegra+help@vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-tegra+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261019095705.91062-6-clamor95@gmail.com>


On Mon, 19 Oct 2026 12:57:03 +0300, Svyatoslav Ryhel wrote:
> Document Hitachi TX10D07VM0BAA and LG LH400WV3 MIPI DBI 4" WVGA panels
> found in LG Optimus 2X P990.
> 
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> ---
>  .../display/panel/hit,tx10d07vm0baa.yaml      | 58 +++++++++++++++++++
>  1 file changed, 58 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/panel/hit,tx10d07vm0baa.yaml
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

