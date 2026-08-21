Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2740938AC64
	for <linux-tegra@vger.kernel.org>; Fri, 21 Aug 2026 11:45:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787312709; cv=none; b=YSDb0xeGXLkbN3RgXbhqNF4U3+5uJd7v+o3qVKJmuLqNcGd4bpwhXBbEOwdbcsUUB5T7dwomOLFqPjdQV2a1wj4TyqMxYEupXCQRxS/TRDIOKH9Sddz7XwMocI+Hh39WbERZ8JmGiJLuCc61u5FfarBESZh57MW/+ERWcXTYUTQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787312709; c=relaxed/simple;
	bh=t6UzDLEI5sFGDTGO7Y5vJvN9sIzuySwnVE5VSaZ8VfI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rprcoUwrnEFCIpnDIaqS9ruIrhF+9tamKTjfdb/YbcX5gXt+4S5ELBg0w/y66ilQxYHF0k45eg9Js4OEJNSfDC86gY63zSelNyqQDBkqC984C7N55yN1oIhhXfiX6agRSep5CBoguZhpkNREAQt7+wExqnB+TPeEJMwhg9xaobk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VdgImv2G; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RA+H+oQU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VdgImv2G";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RA+H+oQU"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67L9LwrL2006112
	for <linux-tegra@vger.kernel.org>; Fri, 21 Aug 2026 11:45:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=2dAxTCvnWQHdzet60v9peB5B
	pAu+xzdvRTiBy/vj54k=; b=VdgImv2GIIYlPoA7bawOCdd/z5eOizLUkWtHiKHG
	fMJ8kehGNhTBZ0h8fQUpLmO4aHVb4Mho+58HJbtXJmK7pzA7iwmysMFI9YwLuJLd
	0vJSyyQpP6DmL8TfPIZx52bXvBmaOa490uwxGO8tVnTT5LQPCWLV/uSDteUOUqma
	tE65aj8LOjjW4Z/rx/aq+6zvt9jwn5DM+o8amnjPhmorMlOraz66r8EKsa6q4pa0
	p5Q6NGTAo6FeLQBpnvIZHqRMWgICdneh/tjNO4EQy9HTiegVbpRhgIpeHu85e56G
	ImFfg188wowSrriSTZS6q40qjqQT91C/Gs57w7aUUKPu3Q==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g6gddhbre-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-tegra@vger.kernel.org>; Fri, 21 Aug 2026 11:45:05 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-737d34a0dc8so864467137.1
        for <linux-tegra@vger.kernel.org>; Fri, 21 Aug 2026 04:45:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787312705; x=1787917505; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2dAxTCvnWQHdzet60v9peB5BpAu+xzdvRTiBy/vj54k=;
        b=RA+H+oQUhTPtfVPIqMCkLqZ/KoO821hQwKZL3Ia2QfjU7bLx5l1HOFKt9KRuHJTVz4
         uRMLtqSd+s8bN2SLZqvKbg7QRX1MfhQkFU9O6NzVP9m93WClz198YD4vSpjWY1YP8oX8
         i6xH/JlR/SNZHf+1MZuzC30voWSLJvkGQC7SQWgCM9wxSzuaY49HAe+bb80j2a2Za2Zk
         SQWYloXjKPVQ5XFu1q3pRsgP4E0CcHkgNMFF+Tzvv3wa++dYEVPELjY1r5GceO3FkV0m
         Co4UuBaSb3WdQSXGSeGqaIgB7+CbiwgspLxWerxb0dR+81WshPgaTdyk8PNpqBcDqKXq
         qtHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787312705; x=1787917505;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2dAxTCvnWQHdzet60v9peB5BpAu+xzdvRTiBy/vj54k=;
        b=VnPtjup3Czn+z0ffIa+sB7DcLmO31PP5gI5Qqly3ivrofZwiUyu+bp9sqRcEBTriP+
         jN0uw+08f0iZYKJBJk+qdBuve2k6tKBfc6xURuUgwgPvCgsbDgAubMRhfmbat4I5Ew0h
         mSuosVPEvPlefr/TRtVDcyw6jiJDxXzQ98+tVumiJyvoYfpHcZXgZgPbw446HSZzA8fI
         CWoF9VHqFEUJdPe3DNKve7TwqHlOmS2GBarojrj4YH8WogKTPIQU6kH08CXK7IkIjrxx
         OW/DgIsMhxl/D4OvQmZ1yGQpOyZU518IionPFhNhzRYlAq92eqMRPmyVonSs4JJHc6js
         58Ag==
X-Forwarded-Encrypted: i=1; AHgh+RrZcUIiCkVrCwNR4p5Mj6Gz0zanCiSlUeYnIxyXsTLfRHnWwzNOEYx0ypwzfUXv1r8A/QDALYl9dNR1qw==@vger.kernel.org
X-Gm-Message-State: AFuF++kt6FC07ztI0LbPyx4h9U8VowA6YoBbFK7ljg8gGu2MEfkDQkHR
	+4f8LQsSxYVhpJyJDz01ndSSyqsZIoyQmZ9FAMWdUsuN9mLBaVpWHvhveCSKZZ1i0fHhXJR7qUk
	rFylhGH1wwyM5eAv0DF0lH4pTL5dtow0yB2myMqQroxPeFcxXzDp4gFBtXLQ3DRUebw==
X-Gm-Gg: AR+sD10UAL9PgkBqtyjZtSNAs7yr8YuN1ontYJLkEpoq3neEOQ6l8iftKzD+OGiM0bE
	lyUSynjapUz97tZmr9vl7utvYvCj+Gyl9hHZeQJ3fZ0me9FRb+8lYEGzEHOZ9AVdDJz7M3wRRXq
	awbA9DYtuFbPOiIVIiT9QOBs/DQTiUJp//7P5sSlH2gzCsc8J5En5KIuUKEtGqn9pIwLDbMIAgv
	Fs+iv5Mkcu2P91bgSOkOhVqE6IMIU0ySlpAC3BaQAbjZN0980eS6dgEozq3gaasXw4hWG00VHEY
	QLEb12Z2y/d9uEuOCW7c8NvYzCO+PAV5bSsH9x3O6he+PGQddPrN1iZIBfZqsths+wvP3C3CifS
	Y9Xw6JMUswLBY+EA=
X-Received: by 2002:a05:6102:8083:b0:77b:63e3:6555 with SMTP id ada2fe7eead31-77b63e3c773mr239218137.12.1787312705063;
        Fri, 21 Aug 2026 04:45:05 -0700 (PDT)
X-Received: by 2002:a05:6102:8083:b0:77b:63e3:6555 with SMTP id ada2fe7eead31-77b63e3c773mr239156137.12.1787312704554;
        Fri, 21 Aug 2026 04:45:04 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.240])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a3feec9d52sm6458300a12.2.2026.08.21.04.44.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 04:45:03 -0700 (PDT)
Date: Fri, 21 Aug 2026 14:44:57 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Ryan Chen <ryan_chen@aspeedtech.com>, Joel Stanley <joel@jms.id.au>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Andrew Jeffery <andrew@codeconstruct.com.au>,
        Billy Tsai <billy_tsai@aspeedtech.com>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Claudiu Beznea <claudiu.beznea@tuxon.dev>, Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
        Taichi Sugaya <sugaya.taichi@socionext.com>,
        Takao Orito <orito.takao@socionext.com>,
        Linus Walleij <linusw@kernel.org>,
        Avi Fishman <avifishman70@gmail.com>,
        Tomer Maimon <tmaimon77@gmail.com>, Tali Perry <tali.perry1@gmail.com>,
        Patrick Venture <venture@google.com>, Nancy Yuen <yuenn@google.com>,
        Benjamin Fair <benjaminfair@google.com>,
        Sudeep Holla <sudeep.holla@kernel.org>,
        Cristian Marussi <cristian.marussi@arm.com>,
        David Lechner <david@lechnology.com>, Abel Vesa <abelvesa@kernel.org>,
        Peng Fan <peng.fan@nxp.com>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Paul Cercueil <paul@crapouillou.net>,
        Santosh Shilimkar <ssantosh@kernel.org>, Andrew Lunn <andrew@lunn.ch>,
        Gregory Clement <gregory.clement@bootlin.com>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        Vladimir Zapolskiy <vz@mleia.com>, Heiko Stuebner <heiko@sntech.de>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Peter Griffin <peter.griffin@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Dinh Nguyen <dinguyen@kernel.org>, Viresh Kumar <vireshk@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Emilio =?utf-8?B?TMOzcGV6?= <emilio@elopez.com.ar>,
        Chen-Yu Tsai <wens@kernel.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>,
        Prashant Gaikwad <pgaikwad@nvidia.com>,
        Thierry Reding <thierry.reding@kernel.org>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
        Masami Hiramatsu <mhiramat@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        Liviu Dudau <liviu.dudau@arm.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Michal Simek <michal.simek@amd.com>,
        Matthias Brugger <matthias.bgg@gmail.com>, linux-clk@vger.kernel.org,
        linux-aspeed@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org,
        arm-scmi@vger.kernel.org, imx@lists.linux.dev,
        linux-mips@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-rockchip@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
        soc@lists.linux.dev, linux-stm32@st-md-mailman.stormreply.com,
        linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org,
        linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 13/45] clk: imx: Make sure clk_init_data is fully
 initialized
Message-ID: <gj4re27ahv3pusk5coh55xqrtj5dkigywa3sqysnifxpwsf5ch@fl6guu2elgnb>
References: <cover.1787239813.git.geert+renesas@glider.be>
 <7300fde72b6449d2cd7c043e4caec9a6c4171424.1787239813.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7300fde72b6449d2cd7c043e4caec9a6c4171424.1787239813.git.geert+renesas@glider.be>
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIxMDA4OSBTYWx0ZWRfX4ADQMa1Wgk4U
 mNZvOOkp9QzKd96tXUjK3q6fFnLOtNUcCKPocjXiQLybSHSTATYAWhSnow1sLGGqz0+Bn/iv1Up
 gyCXiMa31BHcNL2UIAFQjTbjQB+n7i4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIxMDA4OSBTYWx0ZWRfX3oL/gz+dGDFj
 pLZsiQ/XlvQK4zh1qQpJQSUuWvEHjv5nObNKAnBI0jtQs0A/7CbftHQChmAaG/MoBvBYpoS3NT9
 Ap11D1UVrB6rhEV94UwuwwA5vjGT0jkOwES4azIC4+H1EYoeeK0G3pl6AwAEr5TURMZOSJ8hbYX
 UA3i+g+r5HFvJHPJs5sr8fgEREKkgawbGD3VVdG9YwbcCXhgWd3X0k/qq6eCLkezTmhnkuIyB/v
 svjD2LDLp9fbQ9lIGYczI5zid8Z8bVkHlxWNajSh3ARqcdJAb7gGARcsCdG449fWkN8jE7fZqES
 dQ2G8a36jQO0a9ZGEd+Ijw35w8DR1lxl1BYN+rjgmir2dtw1DpM56+zERwErBZ28xYoWvf7NSw/
 m38eLb0XXzSoc/iFlqmVatjNfAdrOS+IA6TuTFNwmq7z3zGvITUG8GgFa1ZZPQw1jddqF744CDn
 4WvI+GqS6b4UxDKiZLw==
X-Authority-Analysis: v=2.4 cv=ApHeGu9P c=1 sm=1 tr=0 ts=6a883a41 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=wUpz7uCjLrEXi01cjX+DLw==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=yQKkdfHF0SNApnWj8YgA:9 a=CjuIK1q_8ugA:10 a=zZCYzV9kfG8A:10
 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-GUID: NPIphtY1He77muv1LpLhPGQ-XmwzGAYM
X-Proofpoint-ORIG-GUID: NPIphtY1He77muv1LpLhPGQ-XmwzGAYM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-21_03,2026-08-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 bulkscore=0 priorityscore=1501 clxscore=1011
 lowpriorityscore=0 adultscore=0 phishscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608210089

On 26-08-21 10:53:23, Geert Uytterhoeven wrote:
> The clk_init_data structure contains several mutually-exclusive members
> for different methods to specify the possible parents of a clock,
> prompting drivers to initialize only the members they need.  However,
> not initializing all members may cause subtle issues, which are only
> exposed when CONFIG_INIT_STACK_ALL_PATTERN or CONFIG_INIT_STACK_NONE is
> enabled.
> 
> Make sure all members are fully initialized, to avoid such bugs, and to
> prevent future breakage when converting drivers to a different method
> for specifying the parents.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Acked-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
