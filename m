Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=85.13.135.14
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795340750;
	b=LoRgRi+AEbC4/n8Gtw1tFqS37XCNG1snE9+b+eDSWNJFeI9F4vrS/N55LI6/Yvn2CNxq
	 Ls4eai+txko/pj+qkrszqrVV+YCWGYv0dLzLbr88OxQRaJrOfFTjYmBWSeDZpU82jk+IR
	 6YBLPchhFJekmAKbeLS+uzkTMb3vP25GnOjPuaRUBhW0Y0WWQPhQ0QzrXktN5yqzbM03h
	 SgJ51kwHjvn6k4HiRV4+RboW7Z1lndbejCUB5WkOD2Q5esg1UWp0u2/hmkTA3FUWP7O3b
	 TzJ4FOw+QGx0V8BWUy2IujWulpSVscR+m/uCjqe3XnsSmGjRKNe+v5CUr+gNrkk33jQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795340750;
	h=DMARC-Filter:DKIM-Signature:X-KAS-Sym:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding:X-Spamd-Bar;
	bh=NUqWKWOOcDbRS46duJP/8iCCJcgyCaOIJmw0ptFYYqc=;
	b=kLqqi5uE6aG+D0+PmtQYuEzEI1bLbfu9ysTidAqL6ZsJ4TRTDTbU89IDOee4CtfiOwnw
	 KVo/59Y7cmoAh6G+pITRt3RbtblB//ykUsRn641oCldEZBQKIV9h7s/0AkmNDKl+Iz6PD
	 oaJQiwg2ya3AGcHXdlzq+2URoldxLKYHUliEErWUzgTqKk95n5399eSzA208p8vNPXelf
	 yk6DgnconFcI5QAn/qWhD9RJjSA6E7U6AAkFT0wKLYUqCy9/3jmjh9Jeg36R9UPJdEY4m
	 xmlk3g1nsAYdcSPKCrX1aoeGfJVfULKBXWxZOXbkAztMDOMKUP1gMok5HrAfcPDR8Cw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=tsv-stahl-riesa.de;
	spf=pass smtp.mailfrom=tsv-stahl-riesa.de;
	dkim=pass header.d=tsv-stahl-riesa.de header.i=@tsv-stahl-riesa.de header.a=rsa-sha256 header.s=kas202608160020 header.b=EeUeGrHk;
	arc=none smtp.remote-ip=85.13.135.14
Received: from dd13108.kasserver.com (dd13108.kasserver.com [85.13.135.14])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5455606A32A;
	Sun, 22 Nov 2026 09:45:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D5455606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tsv-stahl-riesa.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tsv-stahl-riesa.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tsv-stahl-riesa.de header.i=@tsv-stahl-riesa.de header.a=rsa-sha256 header.s=kas202608160020 header.b=EeUeGrHk
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tsv-stahl-riesa.de;
	s=kas202608160020; t=1795340748;
	bh=NUqWKWOOcDbRS46duJP/8iCCJcgyCaOIJmw0ptFYYqc=;
	h=Date:Subject:To:Cc:From:In-Reply-To:From;
	b=EeUeGrHkbqorCKa0YSaMnTKGoxaNQ4q0D4WGxHDXSf1xcqfF4ocGLsdwEDIqKsdIP
	 qcul9513YWya2RRw+jZB6uqAfsxZQu+1xf8XKQ/GdlOTN4Gc2wlZ0UliuNdJLUMVyw
	 dnH29I/bJBlW5rmbqEYm/FU5805UK7tRLJnOrBvsT/5cYpXSGoDBdOeMjgMLwFhxFJ
	 kI2WkAxsa6gC76KFm8mYBSeGAWffjOJ2wkko4T8g+plAG+/jAUrolYD/owsgWLoV2F
	 hA+/7vUbQcTQodR6kMoIDahjRv7SE0aHlG6N2vXe028RGBQsRzNi3oW9SVp3p6kpvq
	 wgQ7WYEzqliCA==
X-KAS-Sym: v3:f51bdf72230551df:BHLVAvXUbecqCx65KAKRaRfSCRJ/RnepLulMBbwPWwteb
	mripFIUpAml7cCtqERpaMGvp6Ak7OV3lE8iPMOqmpySjQJMXBc3GoUaNiOJ3JYVYJ6TKopF46jn
	q4uVWX6C3Ji3T33tnuwTxe3Tg5o4SRtDYVASaC9EWX+SWjXVbz1MzhyHPUZKqWAoEsfJYQOCr3/
	e8Hmx1pjaNOkVRlBEOwew3D70xuqqwYoYiiy7493mCJFAFA1pSDWWiaM9UqR8fM4BH7M4Lf2I7O
	IPBxu8VLsAFMYOTxjDWwPLNwXk+ftVWkLUIsiPpytvLNorB9dwbxDD9FVg92DyAthgqKyJeg==:
	16bJgjnCgJ+hUB5OphVvHOGT568XHSuF5oT6jNqmKTsx8sTceOUry0dQBkrGGAhxHil+oWGK5WH
	VOR2TpmcuOhBlsmqtRfuMKdZ5/rcLWlpaq6gOa+IMInafbIyaU3Ag+4tznT916BAA8uXN23ZohH
	S68T7EtsSePw2GpZtgoVS/m3H9WnipbbHSCsfgQkeuBQA/ZMcn+SZzZYJXXpJsvaM109xOswaKM
	L1mg1k8PB6/jti1+ipgB8Kgs0EvplUf1preDxlrAGPDEEMekX3tsagG6ElPLjn32CgdUC8Cqs7M
	jmVZdlEiPiwlnlOOqiN48b7gNXf4obWlBSwsI3ezGOR3VA/0Zh0/4KQitF8QSzclHRe3GStbIY5
	2KFAt2f0Zix7H2Yoc2pY2CGPUi838YslnVm8K8GT6xszMIPmxYAUfxiao5htXGWpasPNOVjtl9F
	i3fk38zRekmS0ArgT4Hy1OdRdTpQD6Vq7OGpsLJFvrHXwGmRTaZ9W/QzLt/svYsohOUFgvVIH1Z
	KnS6M6pLw71Xh6GYYJWpQmToih6mt49LbPDWhK42ZDZ4xbRjt7JmNprYjLHjt5iX2Y8dwr6CqZP
	f5fWQF6Q6144gCk=
Received: from [192.168.2.174] (dslb-188-098-197-218.188.098.pools.vodafone-ip.de [188.98.197.218])
	by dd13108.kasserver.com (Postfix) with ESMTPSA id B54BC78200C2;
	Sun, 22 Nov 2026 10:45:47 +0100 (CET)
Message-ID: <70952289-159d-4f10-9b41-01387e44633e@tsv-stahl-riesa.de>
Date: Sun, 22 Nov 2026 10:45:47 +0100
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Post: <mailto:linux-tegra@vger.kernel.org>
List-Help: <mailto:linux-tegra+help@vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-tegra+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] gpu: host1x: mipi: Disable clock again after powering
 down the pads
To: Thierry Reding <thierry.reding@kernel.org>,
 Mikko Perttunen <mperttunen@nvidia.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Jonathan Hunter <jonathanh@nvidia.com>
Cc: Thierry Reding <treding@nvidia.com>, dri-devel@lists.freedesktop.org,
 Svyatoslav Ryhel <clamor95@gmail.com>, linux-tegra@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261025-upstream-host1x-mipi-clk-v1-1-6bc6e755b4cb@tsv-stahl-riesa.de>
Content-Language: en-US
From: Patrick Fischer <admin@tsv-stahl-riesa.de>
In-Reply-To: <20261025-upstream-host1x-mipi-clk-v1-1-6bc6e755b4cb@tsv-stahl-riesa.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spamd-Bar: /

Hi Thierry,

gentle ping on this host1x fix. It has Reviewed-by from Mikko and
Svyatoslav and Tested-by from Svyatoslav, and still applies cleanly
to 7.4-rc3.

Thanks,
Patrick
