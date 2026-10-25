Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.173
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792956208;
	b=LCJPlFDip0M021JMN2VHKuInn2OziYCqWhOlpGpjq/w1YsPTbTYOA6ueTxq2mOnOJdKD
	 +ACqXzWT18EecivLa/88bBxwWd75n5wA7+pmbxQXyd5Yai/IMLg2DNta4yyaKzZCBHHTO
	 hxAjQH/7+hgc2SLgT7VrRZlA5aMRVzhUY3lGGljnQuFA/EyhwPVGLT6GQbMhvCMVHFDUm
	 h2FxuO7anPhdBri/MsFWIV3TK6plOIcss1wo/rnyHnHLDyblhiA0zaLLz0S9LoUIDLDRV
	 zeqIITHxMpt+iNwSEahpXoQp0SDyaTkojP5ToRvysYmXLoE9kDDZKqO4a49dtQ80uHA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792956208;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=dEEx0Z8e0R8jOgmV0CzML93QklpW+Wd99NpO3WBEWOI=;
	b=40YXrpsUVfh2z/p9XavgSICkndBNZKRooGhJRbexlHZ+HagWAkocvm5BZNqxvFLB2FIX
	 FQBgweQaX6ki5yBdmIvxrPqSIpYnQUue+SSyV9SWyawpPMg/wPBDCJNq56o/X4SiZn2ED
	 aU0Rn2KeAqTE0L8KT2Mm/DvvkVjffqCjwBw3op5gUcRI74+3km3uxrLzqhoUPgjwkJJ6U
	 9zOzPlqakUlOyWFqZUq3pY5WOrlK7mHt/tZOlxmsOOaOn+QOUfrRb8eyv0R7Lsd7zu/PX
	 cMcjGkkwB991OSdO5pzmJevICU4WmX2ZD18WfKWLsyRpLb/fSRHntBadJi5gVD02JWg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=QPCc7BEq;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.173
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2390606A32A
	for <linux-tegra@vger.kernel.org>; Sun, 25 Oct 2026 19:23:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E2390606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=QPCc7BEq
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-3550c917fd3so3572175eec.0
        for <linux-tegra@vger.kernel.org>; Sun, 25 Oct 2026 12:23:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792956207; cv=none;
        d=google.com; s=arc-20260327;
        b=mc1MUKKWRKsdmi4XkyuljWanSin86VMPdqKgLdBp6vuv4Caq4Krdj1ZqS0lf+QNSYX
         t3aESHkdJwC47JhavrkVn0IrC7idWtlCHyVxz0nwNPxVYpbqEK97/pPGxSQzPt3eaYWK
         R5/euKIwkOLAX7HXO22kUxHNRLUkZIBJ9p1wGakpcLRJPvp2yMa5n03/zq8jacqn6qHk
         NdU5BjEDIpojzudlJqtdikizI8OhjHq52KYjwfOUVmw5UKzfINme+gxC9LJijHbWrcQS
         3Tei1Z/mtU7pw1A5hjxs1VRkjli5thMGpekIUP++uxCMoAS1Noe3tMiK0w7s9lST8D3w
         4feQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=dEEx0Z8e0R8jOgmV0CzML93QklpW+Wd99NpO3WBEWOI=;
        fh=EzpnUdnmJa1qNNSj3n5a2SuvN6oo8xqEwVDjpsVZj2k=;
        b=U3V7u+9UsCzESTufALAe7udO+OlRsi1zZ9jO5aWYnhol+ZPY9N8Tb6K5fFVvGIcHdT
         MMzdCzIb77RoP9A+YPxpmxsLmH1jVUjVs1goXJ++CXHog2AhN+KRbKY6QYscgnDh1HV3
         hELSN/C6trmAaiclK54BiV8aNwSzbFD4aklA4HAEqjMb76J0B3dPU0CPubR3tBwtuYeP
         5GounFCSreg/CWjCRzJNFgH02X5QwC8Mc75bayjgCU02YiqFO4bQE35pls1IbrX/CpGK
         UOyWjFADKga79vdb7OXCppqYMDBAd9ng0PadPtqJMJRAqrdnV5aqBVASWI1JhEqwUpMz
         uWVw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792956207; x=1793561007; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dEEx0Z8e0R8jOgmV0CzML93QklpW+Wd99NpO3WBEWOI=;
        b=QPCc7BEq9KXx2y/RIsLKfcRLZMdo3brn6SPmqADoaghTlwyYv67/UtolSB7jN/kEr4
         SA+2K6yxCogZR1KfJ+V0Gp3NdHOsFH2ZDZbvyrpfFmjFe9j1cBYG6okCnw6ai/zZO+Og
         zoN2Vr7pNicuXETdyO5ubLqU3VBQsF/8Zer7/bzH4lzljsnso2cRqUyAhiqkBsYz6KwH
         oVG0pvppS6H2Pt+/jKjUz0yWp7y1ZF/mNzRa2QWclXnTqWT4BxyBa/TWteQycrzvvNbk
         OAjToHiZDnmqJTLgdtf45FfBcGoK1VTbRDN6PAHGswtWfjqTlVTT3Zchrdj1PspfS6yV
         bpXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792956207; x=1793561007;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dEEx0Z8e0R8jOgmV0CzML93QklpW+Wd99NpO3WBEWOI=;
        b=aTIk3+sjYMD6YkWHi3suDIqzhJmRDhApwla/wAuJwcuCp60A4e5DNncNrUbHX65uoQ
         z4x7qOB1ep6DIpHQYjl8iEYyFkMgnpKGsSXxLPFVG+flrzZ0dhHYc28Yn1yuzfcASw53
         xBvZPGonRvNc4PWxpFyIlL2wCgRQ+ulwhmQoXBjD3QrmPUSNVSuhZk/elLTm0svaFhIM
         yG2UXqqYsfP6jbU1brxeBOwRXPz153hhrP5uHLXru6prHjS2SSMbetZ/yYoV2WeLQjVL
         AZ/cPmAFNloo7vP+Swy0p5FQT6p0ZL5CpVQI+yTLSPCYbyH4iYFSntZ/nPMIJHMB4tTY
         f6RQ==
X-Forwarded-Encrypted: i=1; AKwUvByF4Sf22fJ4wNVBGvfZQoOfS+Ufv1RNq1PZJ+zhvGT3/cBRlKfeSX4qPN4Ldi6u9HE8wYgbuKwk0qMOvg==@vger.kernel.org
X-Gm-Message-State: AFq9FYIBl1I4iV0es8z3+pnqzKZrEaXkVidiIAbGRxZlM5AH2jg/htKw
	0OJtVoE8gSZ4q912TPOkg1sFNkNgN6qTXlRxC4Ss8gZGjYGVkZ/cTAqkJs0P2+insGkKaGHvRfa
	+OPtcKa8fHYQPMyiyyyyUKhsciud/mmk=
X-Gm-Gg: AYBFou1f2vceqCc4KUH0ULUABzYCSEkXq0Xp/s9GUuWiE1Y0AlGUDqpLoQmt6rQaAWr
	EucqEKQiufi1Vmfv7sTrqLroFzQ4woQHjsF9sr3fSuYULG8+7VlYk3dZTD76xdoRktV4bUH8tuF
	fRVL/lVn7jtujZw5iRKq470TAawg1hrGCeA/GOhsjLpUXpvyLL+bInQCTklsawJuIyxVDuZe4cr
	vHJyxQvRN96/DMEkmYTB48YJV6EcCa018LH5TeqHMeMGfagTu1rTD8CAQcRyhKEGqCKHX8F6xK8
	ipq7uujsr20zIO/Dvxf+5ATspDiHSeApS7YThacNRUjl0y4OzYOo95nD9uUrGo7iY8Ld9zRzTDS
	Tr4/+WRAT24b+bRhTBltw5u8l3xzMXoIDdAgPHWC54uxPzBW75tGppUzvkJT7cv65phQE9Q==
X-Received: by 2002:a05:693c:20c7:20b0:366:83dd:4713 with SMTP id
 5a478bee46e88-369e84a7306mr6781233eec.30.1792956207049; Sun, 25 Oct 2026
 12:23:27 -0700 (PDT)
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Post: <mailto:linux-tegra@vger.kernel.org>
List-Help: <mailto:linux-tegra+help@vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-tegra+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261025-upstream-host1x-mipi-clk-v1-1-6bc6e755b4cb@tsv-stahl-riesa.de>
In-Reply-To: <20261025-upstream-host1x-mipi-clk-v1-1-6bc6e755b4cb@tsv-stahl-riesa.de>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Sun, 25 Oct 2026 21:23:15 +0200
X-Gm-Features: AclHuK-K26bDtKlF8TK70dmoPQF0DUHOztv0f_rqJCZ78HeF95UHjNUfbNmTXk4
Message-ID: <CAPVz0n2+Gbjm21Px-wexG6atRt=Pzi0VJ+fyK_EhKxV88Bj2Ew@mail.gmail.com>
Subject: Re: [PATCH] gpu: host1x: mipi: Disable clock again after powering
 down the pads
To: admin@tsv-stahl-riesa.de
Cc: Thierry Reding <thierry.reding@kernel.org>, Mikko Perttunen <mperttunen@nvidia.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Thierry Reding <treding@nvidia.com>, 
	dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=BD=D0=B4, 25 =D0=B6=D0=BE=D0=B2=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 19:1=
3 Patrick Fischer via B4 Relay
<devnull+admin.tsv-stahl-riesa.de@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> From: Patrick Fischer <admin@tsv-stahl-riesa.de>
>
> tegra114_mipi_power_down() enables the MIPI calibration clock to access
> the bias pad registers but never disables it. Every disable/enable cycle
> of a DSI or CSI user therefore leaks one enable count, and the clock
> stays on for good after the first power down.
>
> Add the missing clk_disable(), matching tegra114_mipi_power_up().
>
> The leak gets more costly with "clk: tegra: Fix Tegra114 MIPI
> calibration clock parent", which makes PLL_P_OUT3 the parent of
> mipi-cal: without this fix PLL_P_OUT3 would then stay on as well.
>
> On a Tegra Note 7 (P1640) the enable count of mipi-cal in clk_summary
> grew by one with each DPMS off/on cycle of the DSI panel. With this
> patch it returns to 0 after each cycle.
>
> Fixes: 15372d4be7f0 ("gpu: host1x: mipi: Power down regulators when unuse=
d")
> Signed-off-by: Patrick Fischer <admin@tsv-stahl-riesa.de>
> ---
> Mikko's "clk: tegra: Fix Tegra114 MIPI calibration clock parent" [1]
> fixes the MIPI calibration timeouts on Tegra114. While testing the same
> change on a Tegra Note 7 (P1640) I noticed that
> tegra114_mipi_power_down() leaks the clock enable it takes. With [1]
> applied that leak keeps PLL_P_OUT3 on after the first DPMS off, so the
> two belong together, although this patch applies and makes sense on
> its own.
>
> [1] https://lore.kernel.org/all/20260930-b4-dalmore-fixes-mipical-clk-v1-=
1-0518be6c7979@nvidia.com/
>
> Tool use (see Documentation/process/generated-content.rst): this patch,
> its changelog and this note were prepared with an LLM coding assistant
> (Claude Code). It traced the clock enable counts from my clk_summary
> dumps and wrote the code change and the texts from my measurements and
> instructions. I reviewed the change and ran the test on the device.
> ---
>  drivers/gpu/host1x/tegra114-mipi.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/gpu/host1x/tegra114-mipi.c b/drivers/gpu/host1x/tegr=
a114-mipi.c
> index c084a09784d1..83a43a5e33af 100644
> --- a/drivers/gpu/host1x/tegra114-mipi.c
> +++ b/drivers/gpu/host1x/tegra114-mipi.c
> @@ -197,6 +197,8 @@ static int tegra114_mipi_power_down(struct tegra_mipi=
 *mipi)
>         value |=3D MIPI_CAL_BIAS_PAD_PDVCLAMP;
>         tegra_mipi_writel(mipi, value, MIPI_CAL_BIAS_PAD_CFG0);
>
> +       clk_disable(mipi->clk);
> +
>         return 0;
>  }
>
>
> ---
> base-commit: 734bef548a96e8774d6eef5dfa2026c6edc4e80b
> change-id: 20261025-upstream-host1x-mipi-clk-867edad177b0
>
> Best regards,
> --
> Patrick Fischer <admin@tsv-stahl-riesa.de>
>

Tested-by: Svyatoslav Ryhel <clamor95@gmail.com> # Tegratab (P1988)
and ASUS TF701T
Reviewed-by: Svyatoslav Ryhel <clamor95@gmail.com>
