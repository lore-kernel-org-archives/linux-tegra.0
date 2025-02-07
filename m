Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F7DE537E9;
	Fri,  7 Feb 2025 02:15:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=210.61.82.184
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738894523; cv=fail; b=qBqRLXR70O/mbzAiq+bLGLuZwAGBXC2CBw3MtzU7mGaOBnyctiHc/9F40wPaAS9FnE9iVY02g3ldUJSj5hu9W7IOte5OcrgF+1pzsspsQLeJmQESBor1GhgWSLMxqWTQ6Fu8ty+LF8GCvr4R5r3sGGPWZ/+v8EO4xiXAf/ohUM8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738894523; c=relaxed/simple;
	bh=vg8WFbyMJiNO5AAeHrQuZxOqAvtJbm1ZvmpUw5hxxEU=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=NET8n1K0TSOT4HS/p3DPQL/TxS5CYIaP37tiblmHjsBz/aRCf8mEdDlq4ZuI1twDwa/0dXwRL0xo+Y/D2VKiCagB8fApxnXLRil64ubYq+dhAf9zqweRgnANJggY8c63hGtc4Y5RyyTzlzgOYM+on0gogkQWuYwPLiAoLnM+7Hk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=NjzQ9r5C; dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b=fRoUqnq/; arc=fail smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="NjzQ9r5C";
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="fRoUqnq/"
X-UUID: 5dcb8a04e4f911efbd192953cf12861f-20250207
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=vg8WFbyMJiNO5AAeHrQuZxOqAvtJbm1ZvmpUw5hxxEU=;
	b=NjzQ9r5C5KFURb2jOKDfXSbtLDD0rTHV1aGFLQ1KkJVRVcwYTHeT9N5sxrUx6Sra+0VOUkcNddDBIdRUlwfA1Pc8Bd6LbLyhxBGgQIjXdXb3BrJeNhDMIqWqZ4guwk5AkkFPcxkxVab+v/RV8PWByNhrofegq2u99Exuf8eI2rk=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.46,REQID:3ba34866-7d4e-4fc3-ae64-23ec09f322a3,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:60aa074,CLOUDID:21822b3e-da39-4471-8a46-23da908abe46,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102,TC:nil,Content:0|50,
	EDM:-3,IP:nil,URL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0
	,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: 5dcb8a04e4f911efbd192953cf12861f-20250207
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw02.mediatek.com
	(envelope-from <ck.hu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1576576578; Fri, 07 Feb 2025 10:15:14 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Fri, 7 Feb 2025 10:15:12 +0800
Received: from APC01-PSA-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.1258.28 via Frontend Transport; Fri, 7 Feb 2025 10:15:12 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ABKJgX1gBS8sEsgWOiziAADdpw1zNZ0JYhx6QiYHBC5pCSip7v0TwGT8RdIuneMYvr2z0XuwSnImyv0XgoGHOq2hrT0mMEZiCKb+3KZBWhUUaKxWWy4pezgFAck5EIruakDa9VzZYZo1UnbQ7+MnmaN3XtZuI9qfFHRaz25Gc/JLZD0F4GEPxv+l76P9NrA+rpAFEzWmA3opJtzwLmtgfRPIJwhbeV5jRQlw/G/p9RRVPusdxk6PSYux7PaK89oWiWek+A10FTk+wGXNxmQwHjavNSq3bfyvWgwqyBei7J4iEhfQJkQsOkh9m4RgVRlwSWxZx+M+xP/jchaw7sBV8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vg8WFbyMJiNO5AAeHrQuZxOqAvtJbm1ZvmpUw5hxxEU=;
 b=IYOum4Up1prAjhR5IScbS3zGKefNDIu/eoOWVyRZvKTMJVlrUM5rglKHoYQjeJX5BgTHleRHMd0MsXLtTtqliJxnZqDFj6Fuxs9xk2oqKzBVNb5NnJeKqjW9NKJGW5vUv0mbnirXfHtbiRPKADfoNoCuY44jVeu0J17rtt33yjOFwVO7Bu4fnwwLMUzifW0IV9lX0yJU3lAFOtjHjWkYfdj3YNNmyEB8kZUXHDY96B0zQKo8CSO1y4ugYavP4Idm63765PAxNUkp4ftyFEzIxXM6UOOEtflYT3tTGW10rpQZzlJlxC/iogMc04AF5uRBGnDktWkQgTOpPOou8X3MTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vg8WFbyMJiNO5AAeHrQuZxOqAvtJbm1ZvmpUw5hxxEU=;
 b=fRoUqnq/tTXyjZQp3ZrHZSdmO+xQCDwrmOZDGp/jFu16/0ZhkvqDn+rZ0EqQ34g1sC1tmnP+XDdMT+nfe2J1czXvprKMXQQk7LRsRMqvaE8/mx3YixgM9zfGskpznpkMnSOC8xa2BgTOOjsI0CTP5mE1TaJDLLKJlPEOJ9o0W0o=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by TYZPR03MB8728.apcprd03.prod.outlook.com (2603:1096:405:66::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.11; Fri, 7 Feb
 2025 02:15:10 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54%4]) with mapi id 15.20.8398.021; Fri, 7 Feb 2025
 02:15:07 +0000
From: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
To: "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
	"raphael.gallais-pou@foss.st.com" <raphael.gallais-pou@foss.st.com>,
	"mcoquelin.stm32@gmail.com" <mcoquelin.stm32@gmail.com>,
	"zhang.lyra@gmail.com" <zhang.lyra@gmail.com>, "andy.yan@rock-chips.com"
	<andy.yan@rock-chips.com>, "chunkuang.hu@kernel.org"
	<chunkuang.hu@kernel.org>, "kong.kongxinwei@hisilicon.com"
	<kong.kongxinwei@hisilicon.com>, "alexandre.torgue@foss.st.com"
	<alexandre.torgue@foss.st.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, "mripard@kernel.org"
	<mripard@kernel.org>, "andrew@codeconstruct.com.au"
	<andrew@codeconstruct.com.au>, "heiko@sntech.de" <heiko@sntech.de>,
	"jonathanh@nvidia.com" <jonathanh@nvidia.com>, "shawnguo@kernel.org"
	<shawnguo@kernel.org>, "asrivats@redhat.com" <asrivats@redhat.com>,
	"philippe.cornu@foss.st.com" <philippe.cornu@foss.st.com>, "stefan@agner.ch"
	<stefan@agner.ch>, "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
	"abrodkin@synopsys.com" <abrodkin@synopsys.com>, "sumit.semwal@linaro.org"
	<sumit.semwal@linaro.org>, "corbet@lwn.net" <corbet@lwn.net>,
	"kernel-list@raspberrypi.com" <kernel-list@raspberrypi.com>,
	"p.zabel@pengutronix.de" <p.zabel@pengutronix.de>, "mcanal@igalia.com"
	<mcanal@igalia.com>, "tiantao6@hisilicon.com" <tiantao6@hisilicon.com>,
	"jstultz@google.com" <jstultz@google.com>, "mperttunen@nvidia.com"
	<mperttunen@nvidia.com>, "thierry.reding@gmail.com"
	<thierry.reding@gmail.com>, "yannick.fertre@foss.st.com"
	<yannick.fertre@foss.st.com>, "baolin.wang@linux.alibaba.com"
	<baolin.wang@linux.alibaba.com>, "simona@ffwll.ch" <simona@ffwll.ch>,
	"airlied@gmail.com" <airlied@gmail.com>, "kernel@pengutronix.de"
	<kernel@pengutronix.de>, "orsonzhai@gmail.com" <orsonzhai@gmail.com>,
	"alison.wang@nxp.com" <alison.wang@nxp.com>, "marex@denx.de" <marex@denx.de>,
	"xinliang.liu@linaro.org" <xinliang.liu@linaro.org>, "joel@jms.id.au"
	<joel@jms.id.au>, "rgallaispou@gmail.com" <rgallaispou@gmail.com>,
	"festevam@gmail.com" <festevam@gmail.com>, "dave.stevenson@raspberrypi.com"
	<dave.stevenson@raspberrypi.com>, "yongqin.liu@linaro.org"
	<yongqin.liu@linaro.org>, "maarten.lankhorst@linux.intel.com"
	<maarten.lankhorst@linux.intel.com>, "alain.volmat@foss.st.com"
	<alain.volmat@foss.st.com>, "hjc@rock-chips.com" <hjc@rock-chips.com>,
	"tzimmermann@suse.de" <tzimmermann@suse.de>
CC: "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
	"linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	"linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>,
	"linux-stm32@st-md-mailman.stormreply.com"
	<linux-stm32@st-md-mailman.stormreply.com>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-rockchip@lists.infradead.org" <linux-rockchip@lists.infradead.org>
Subject: Re: [PATCH 04/12] drm/mediatek: move to
 devm_platform_ioremap_resource() usage
Thread-Topic: [PATCH 04/12] drm/mediatek: move to
 devm_platform_ioremap_resource() usage
Thread-Index: AQHbeAokuR1OaQhj1kmu6VdGHYolabM7HCAA
Date: Fri, 7 Feb 2025 02:15:07 +0000
Message-ID: <456d92e10e8fd8d58cd524878902790fbc789850.camel@mediatek.com>
References: <20250205-mem-cocci-newapi-v1-0-aebf2b0e2300@redhat.com>
	 <20250205-mem-cocci-newapi-v1-4-aebf2b0e2300@redhat.com>
In-Reply-To: <20250205-mem-cocci-newapi-v1-4-aebf2b0e2300@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.52.3-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|TYZPR03MB8728:EE_
x-ms-office365-filtering-correlation-id: c19c93c2-cfd7-42d1-41d0-08dd471d3dd9
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014|38070700018|921020;
x-microsoft-antispam-message-info: =?utf-8?B?L0t4dE02K0RuT0d4dFl3M2NHVWRtZnMvb0JmbzczM2JSOFFXelBJRkNpL2ZG?=
 =?utf-8?B?RFJ1N0IxMmkvR09KUG1UZ2NUTWd2d0Jpai93ZW5oS1ZUN2txT3BoQjkzeUR4?=
 =?utf-8?B?RU1maElLMy84MkxteDRRV3Z3bEN3ZW5HeEk1L3BLR2pRb2lXT1JrZXk2ZElo?=
 =?utf-8?B?NnBocEVpaS9EWEhYV3JFL0kwUVFNL3pNZmdYenFPVyt0Zm0waVdDYzV0WWRZ?=
 =?utf-8?B?akFuYVZwa0M0bFBmek1RbEl1dnBCUlBON2NEODZ2QVQ5NGQvUXdqQlRKOTUw?=
 =?utf-8?B?SXp1MEJ1MGpETm1mMDVFODYxRDJPQ3Z5TmdlRUk4YTJORVdJUytmeWJDbzA5?=
 =?utf-8?B?ekRwZm1DYzVtcjN2V1k5UGlUVSs1VkdaV2hUbURQR0duUU4wMGhaa2gvSC9y?=
 =?utf-8?B?L1Fjbm8xeW5oUE9qbXJtV3VnaU1zVlNtblZWWXVKdjhOeHR0enBEY1crbmJV?=
 =?utf-8?B?VmRFanFHTndld2h2QjdHSWFMZTIvRkU3ekxFMmhOeEZIWWU2amt3a3VHWisv?=
 =?utf-8?B?Nld0YVNhdSs0N3djTWltb2VYWjMyL1ZpdWlxYU93cGFndGZ1L1VRQkFaN0RX?=
 =?utf-8?B?Mm10UmhieGc5dGhNOUNPOGRIVUxpbHFYRXRBbFQ1OEM0Yi9pNDJ4TFY0a3lU?=
 =?utf-8?B?ZEk1ZnFvL3VSdlNlYjZQSnFiOGJjYzB6MGxYU0ZKbk1wdE5OZTZmK2dhbm0v?=
 =?utf-8?B?Z2RjNFZ5SG5YYU9Ib2hnM3lBcmtObUxyVnVrdlJwZ2ptV2FRdnBjN2N6cUFu?=
 =?utf-8?B?bWtaTVBiclp3YStxQ21lY1NQNnFmYWFjcEc0YlVHTzFEUFhuOStGd3ppZ3NE?=
 =?utf-8?B?bmFpc0JQcXNvTkxGUU9sUjFySFNXaGxkd0hvV0dVTitmQkZrNTZ4L21IaDRj?=
 =?utf-8?B?c1daZ3BPTm9lY0NSR25yQVN2dWJ4ams3S2NzUGVQend0Q0V1d0doWktWWWRz?=
 =?utf-8?B?M2ZwTHJ0dTFPS0Y4NFQra1BuVUg5SFpzMVZ0M0VrUG56K1crclVTN1g3YXVZ?=
 =?utf-8?B?VWpNam5kSXd6VFRRaVdmTHdzdXZJUEdXOUh5Y0hPNkdxbGI4WHZ3SndNTWNS?=
 =?utf-8?B?UHZ6NktlNVVOR3MvYVBrcjJ6clVnMFZnY0FHSUNhaTI3YlNVbGdKaTdLcEhR?=
 =?utf-8?B?bWI2WVBmNGx1MCtINCtpeTBBVnJzMm91TkVCQWxxV3VXbDNmenlGWGlWOEJV?=
 =?utf-8?B?SEVmelpQSGVkUnowVC9laDZ4NDNzMU0yWVJVaC84dnRGdytYQmZNSEdMeFhk?=
 =?utf-8?B?QUlKTVNLcVVUSzliVDJpaitDMGhuSWNoRjNSMXVobStOaXQxNWpmaGt1RWx3?=
 =?utf-8?B?T2JVUEkzdy9sQnBFaENXT1FXMi8vekRXVitvYjh3RXhQOWlxTkQvMG9YU2tl?=
 =?utf-8?B?MXQzc3pNY0RsaloxbVg4RExaVlRFL0EwSnlHMExVQUtqRlVuQ3BnbG41em45?=
 =?utf-8?B?eVYrVGtmU090T3ZvSEhZYzNNZzlNbjQ2eU9yR1l3QmRlYkNicW11NWFoemZw?=
 =?utf-8?B?Tk10YTQ5TkU0dTc0Z3o2RHYrUEpxZ1JkcE1rbURRbVo4VTMrUERrUUtwUm9T?=
 =?utf-8?B?OWhHYUFoT002amFkWTVHVHB6Y3dJQms0QksvUGZjUFE3M1pRV0hIaWFCU3g4?=
 =?utf-8?B?T3cxUmZuWUdMM2ZJM2RjMW9uNCsvVkVJWDBDYWF1V0dwTXd3cTFsc3o4RnlF?=
 =?utf-8?B?cWtZczJDOTloZDlHMHdFVXhqajJ0a2hqN0xWa0ZKS05hM3IrdXMrV2Zqd3Zq?=
 =?utf-8?B?NHFwdHJNbHkzWUVLd0xWM3kvd3lIOHJyc2cxL2ozeXV1UmM1dGRualhtU0ln?=
 =?utf-8?B?Y1dGemxabzFtWlYwSHpVSDhwYVRxTmRVM2lBd2lHcys5a0NFOFA3ZjVmTFpU?=
 =?utf-8?B?UUpoWk1yZ0s0TFNmWG5PYjduVGxVZmEvREdwejFtek4wSTNBcVZIbEdjQ3Bl?=
 =?utf-8?B?eVZkK2JkUVcvVHl6bVFtQ0ROV2VuaWIvK05ic2YyVUI0TkUxbW5ocG1oRUp5?=
 =?utf-8?B?VWZVck4xaFhRPT0=?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6624.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(38070700018)(921020);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TlY5VHpXS2UzL2thZ1gvRmc3UGg5Q25CTlFNTkdpWHlVaGZyMHJuVjczSXdt?=
 =?utf-8?B?UTdsZjBaTDN3Y3JIMXMwZjBSbE9pS1FteHkybkplZ1RFM1ZmVUpkR0prNzFx?=
 =?utf-8?B?M1h4U25HUXVBQm1xTFFvTVV4bTQySHg4UWxuaW01WFN2TzJ6RTkycUFoKytk?=
 =?utf-8?B?RGVFT1UyNkNhOXYyY2xDOGpWNGU5Mk93R1pUK3Bha2h2UlJQTGxGM1JUZURN?=
 =?utf-8?B?Y3NuRlk2VHNUdEZvNUdoeUNJVUpLRW9iVTFFNEZzWGZBZHNlak84SGVNak1X?=
 =?utf-8?B?V2NrNUhRdTVnNmVhUWh3ZStta3hqcEgxV1JMck8razlwMjBHQUxSZmkzWE9a?=
 =?utf-8?B?RXVYc3BBZUc2NmI4cVpwNnVOWk1XOFBveTZYK01BRVhrTmlZV2dPVnZHd1NN?=
 =?utf-8?B?SEZGZnJXYU9iR0xqYnk1emNESkJZVldwaHBQbitkdGNLaUJUd3JoZllTR1FB?=
 =?utf-8?B?NVZLa2F2UjZpcW5TMjRUYktGSEhzZFoxODg1UXptRnpCV0VBWUQ0aG0rRjRi?=
 =?utf-8?B?UklQWUpSZElLNGZaL1Y2MjhYc2FMaXhYMklJSVRza2E5eXFVWXloSjZTVTV1?=
 =?utf-8?B?dlhMelhsRmd4VlFtd1NZN01HbW5xMTk3KzZnKzBxNmRXRkZMSCtNUHFUTnNk?=
 =?utf-8?B?N21KU2JtMWZZZDQwVERKOWhYSExCNDlqTGdHRkZjVzZzYVZwdmtobk1ueGIz?=
 =?utf-8?B?Zk1yK3ZHL3BUZUNhRUFxbVZWS1JYY3M5ZlFYMC9zT0toVlhpcWxaeVpLck5M?=
 =?utf-8?B?a1lwTURQZklrV3dEenZEdVVKdWZXclVtZTlGZTdpRUczSGtZUktEcXNQZzlQ?=
 =?utf-8?B?Y2JLL1ZpRHdNRjVRZ254ai8yMmIreFdVWHRkUjBIaHJLR2RqRWIyME84TXpz?=
 =?utf-8?B?SGlJUi9Ra2x5amdsa2ZNdlVSbXhtR0ZOOHFzRGFEdWJmenJrNUdhd0orUTF3?=
 =?utf-8?B?aFFMTEN0YVhVaFNNMUZySCsraGdCMTNRV0h2RHcyUE16cU5iVi9Sa2FhbXRu?=
 =?utf-8?B?NVZOVm95S1FFbHhNY2NiY2xKS0U5NnhuK0lOTTRhZCt5NWgzVm5pZ2lwM0lB?=
 =?utf-8?B?MEdrQjBzWlR3K01MYVRkV1JwSmEwa3F6RjRGd3VSbWttaTdhcjVDaFNYYWZM?=
 =?utf-8?B?UTlEL0ViaE1VWGg1SlVqVVhtazRWb2NRb0tGejlmdWFFVXVtci9jYzlRQ1Z3?=
 =?utf-8?B?anR4MXpJdjBzb2xGd1poSzlXQmJicERRT3lRNnluRHpMRExoRzZ4QmJucW9G?=
 =?utf-8?B?S3U2WFNlYm5yQXBzNXFNNzNyeHlDNEdjUTk1UzdMNC85a1daUFN1dnNQUWF0?=
 =?utf-8?B?ZXJQTUZHQ2JjOTcyMHRIeWVUSWJhNDNZbndLdFlKN1gvYlBKdzNKeW5wTnE5?=
 =?utf-8?B?V3p1eE5xdVB4OUZpU2xPekdJSnZINDNhRG1icElkTVU3Z0RJVjZycTJFVm1k?=
 =?utf-8?B?RXBuTzhHbk9rVGZxRzFhYkF2NzZNOEcwc3NMNkd5YWNLR09GbjRNUFhZM21j?=
 =?utf-8?B?Ykl1S3RkT1d6Sk1HWUdjemdwT2F4V0lISzRyeFNGeENFR3VhbWdKTFQ0K3c4?=
 =?utf-8?B?RVdKTkVwL1gwWUtENklUdjJxNDRYdVRCWEs1ckhGZUNpRHNRSFNlamVEQ0tv?=
 =?utf-8?B?elRpZ0ZIVEh3TFRQNjMxZ1dOOURCeC9CUmJwdnhRSWNpbTNtZDJjK0lRa2ZV?=
 =?utf-8?B?N25QWmk0L1h1c3VzL1Y2U0QvSmRSNCtFb2NnaHhYWll1UkNrYXkxYUVlRTU5?=
 =?utf-8?B?SFVvRHhJZ2YxcEpQeGRaNVBwQXJneTFyS1dBaDJYVzBjWVpFbno5NXN5ZVF2?=
 =?utf-8?B?MnkvbzZxZE1odFF0cmljRUVrNVVaalNwZWZyZ1pESGRDMWp2Y1oyZGhhemxt?=
 =?utf-8?B?WDJ0c3BMWHdySmZoZjFkQytOL3dKNnJSZkRjSVp1dm8rRk9yQ2ZVNmx3L1ll?=
 =?utf-8?B?LzNEc3BIQm9ycFBIdURULzlIUzRsVitQNGpPSnVZdkFmcXVheUhaMmgwaU5H?=
 =?utf-8?B?TENxR3c0MlV6MUpoZWtNYnJIbStXWE1QUStpSXNYMXpNOGhJbWxoaVNDQ0ZS?=
 =?utf-8?B?SEl5TUR1Wlh6TWtoNlZqekpUTFJUSE9JRmhqOXZaY2hmMXBUbkNNMjBHMjRt?=
 =?utf-8?Q?ZksaDtJYTTgLGQRP7nJSdA9Y5?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <672C8B7BA19CF545B892CCF90EDEF8D3@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c19c93c2-cfd7-42d1-41d0-08dd471d3dd9
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Feb 2025 02:15:07.3458
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: O1xgYn2rvpEtCuy7I1YzeHDRQvTb/KQXzvtI69ZSIuCY1Lht6EQZj37pgdLpxxIPtpNCwEre0J2pyOjN0WKfDA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR03MB8728

SGksIEFudXNoYToNCg0KT24gV2VkLCAyMDI1LTAyLTA1IGF0IDE1OjA4IC0wNTAwLCBBbnVzaGEg
U3JpdmF0c2Egd3JvdGU6DQo+IEV4dGVybmFsIGVtYWlsIDogUGxlYXNlIGRvIG5vdCBjbGljayBs
aW5rcyBvciBvcGVuIGF0dGFjaG1lbnRzIHVudGlsIHlvdSBoYXZlIHZlcmlmaWVkIHRoZSBzZW5k
ZXIgb3IgdGhlIGNvbnRlbnQuDQo+IA0KPiANCj4gUmVwbGFjZSBwbGF0Zm9ybV9nZXRfcmVzb3Vy
Y2UgKyBkZXZtX2lvcmVtYXBfcmVzb3VyY2UNCj4gd2l0aCBqdXN0IGRldm1fcGxhdGZvcm1faW9y
ZW1hcF9yZXNvdXJjZSgpDQo+IA0KPiBVc2VkIENvY2NpbmVsbGUgdG8gZG8gdGhpcyBjaGFuZ2Uu
IFNtUGwgcGF0Y2g6DQo+IEBydWxlXzFADQo+IGlkZW50aWZpZXIgcmVzOw0KPiBleHByZXNzaW9u
IGlvcmVtYXBfcmVzOw0KPiBpZGVudGlmaWVyIHBkZXY7DQo+IEBADQo+IC1zdHJ1Y3QgcmVzb3Vy
Y2UgKnJlczsNCj4gLi4uDQo+IC1yZXMgPSBwbGF0Zm9ybV9nZXRfcmVzb3VyY2UocGRldiwuLi4p
Ow0KPiAtaW9yZW1hcF9yZXMgPSBkZXZtX2lvcmVtYXBfcmVzb3VyY2UoLi4uKTsNCj4gK2lvcmVt
YXBfcmVzID0gZGV2bV9wbGF0Zm9ybV9pb3JlbWFwX3Jlc291cmNlKHBkZXYsMCk7DQoNClJldmll
d2VkLWJ5OiBDSyBIdSA8Y2suaHVAbWVkaWF0ZWsuY29tPg0KDQo+IA0KPiBDYzogQ2h1bi1LdWFu
ZyBIdSA8Y2h1bmt1YW5nLmh1QGtlcm5lbC5vcmc+DQo+IENjOiBQaGlsaXBwIFphYmVsIDxwLnph
YmVsQHBlbmd1dHJvbml4LmRlPg0KPiBTaWduZWQtb2ZmLWJ5OiBBbnVzaGEgU3JpdmF0c2EgPGFz
cml2YXRzQHJlZGhhdC5jb20+DQo+IC0tLQ0KPiAgZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210
a19kaXNwX2NvbG9yLmMgfCA0ICstLS0NCj4gIGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtf
ZGlzcF9nYW1tYS5jIHwgNCArLS0tDQo+ICBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2Rp
c3BfbWVyZ2UuYyB8IDQgKy0tLQ0KPiAgZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kaXNw
X292bC5jICAgfCA0ICstLS0NCj4gIGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZGlzcF9y
ZG1hLmMgIHwgNCArLS0tDQo+ICBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RzaS5jICAg
ICAgICB8IDQgKy0tLQ0KPiAgZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19oZG1pLmMgICAg
ICAgfCA0ICstLS0NCj4gIGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfbWRwX3JkbWEuYyAg
IHwgNCArLS0tDQo+ICA4IGZpbGVzIGNoYW5nZWQsIDggaW5zZXJ0aW9ucygrKSwgMjQgZGVsZXRp
b25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19k
aXNwX2NvbG9yLmMgYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2Rpc3BfY29sb3IuYw0K
PiBpbmRleCBkZDg0MzNhMzgyODJhOWJhMWJjYzNhNGRkZDAxZGQ4OTczOGNjYjYwLi4zOWM3ZGU0
Y2RjYzE2YjU2YTVhMWQwNDZhYWFiYWY1NTgwMjI3ZWQyIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJz
L2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2Rpc3BfY29sb3IuYw0KPiArKysgYi9kcml2ZXJzL2dwdS9k
cm0vbWVkaWF0ZWsvbXRrX2Rpc3BfY29sb3IuYw0KPiBAQCAtOTYsNyArOTYsNiBAQCBzdGF0aWMg
aW50IG10a19kaXNwX2NvbG9yX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpDQo+
ICB7DQo+ICAgICAgICAgc3RydWN0IGRldmljZSAqZGV2ID0gJnBkZXYtPmRldjsNCj4gICAgICAg
ICBzdHJ1Y3QgbXRrX2Rpc3BfY29sb3IgKnByaXY7DQo+IC0gICAgICAgc3RydWN0IHJlc291cmNl
ICpyZXM7DQo+ICAgICAgICAgaW50IHJldDsNCj4gDQo+ICAgICAgICAgcHJpdiA9IGRldm1fa3ph
bGxvYyhkZXYsIHNpemVvZigqcHJpdiksIEdGUF9LRVJORUwpOw0KPiBAQCAtMTA4LDggKzEwNyw3
IEBAIHN0YXRpYyBpbnQgbXRrX2Rpc3BfY29sb3JfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2Rldmlj
ZSAqcGRldikNCj4gICAgICAgICAgICAgICAgIHJldHVybiBkZXZfZXJyX3Byb2JlKGRldiwgUFRS
X0VSUihwcml2LT5jbGspLA0KPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ImZhaWxlZCB0byBnZXQgY29sb3IgY2xrXG4iKTsNCj4gDQo+IC0gICAgICAgcmVzID0gcGxhdGZv
cm1fZ2V0X3Jlc291cmNlKHBkZXYsIElPUkVTT1VSQ0VfTUVNLCAwKTsNCj4gLSAgICAgICBwcml2
LT5yZWdzID0gZGV2bV9pb3JlbWFwX3Jlc291cmNlKGRldiwgcmVzKTsNCj4gKyAgICAgICBwcml2
LT5yZWdzID0gZGV2bV9wbGF0Zm9ybV9pb3JlbWFwX3Jlc291cmNlKHBkZXYsIDApOw0KPiAgICAg
ICAgIGlmIChJU19FUlIocHJpdi0+cmVncykpDQo+ICAgICAgICAgICAgICAgICByZXR1cm4gZGV2
X2Vycl9wcm9iZShkZXYsIFBUUl9FUlIocHJpdi0+cmVncyksDQo+ICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAiZmFpbGVkIHRvIGlvcmVtYXAgY29sb3JcbiIpOw0KPiBkaWZm
IC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kaXNwX2dhbW1hLmMgYi9kcml2
ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2Rpc3BfZ2FtbWEuYw0KPiBpbmRleCBiMTdiMTFkOTM4
NDZmMjAxOWQ4YzRhZmIyOTQzNzUzMzNlMjJkYzQyLi44YWZkMTUwMDZkZjJhMjFmM2Y1MmZlMDBl
Y2EzYzU1MDFmNGZiNzZhIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsv
bXRrX2Rpc3BfZ2FtbWEuYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2Rp
c3BfZ2FtbWEuYw0KPiBAQCAtMjU2LDcgKzI1Niw2IEBAIHN0YXRpYyBpbnQgbXRrX2Rpc3BfZ2Ft
bWFfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikNCj4gIHsNCj4gICAgICAgICBz
dHJ1Y3QgZGV2aWNlICpkZXYgPSAmcGRldi0+ZGV2Ow0KPiAgICAgICAgIHN0cnVjdCBtdGtfZGlz
cF9nYW1tYSAqcHJpdjsNCj4gLSAgICAgICBzdHJ1Y3QgcmVzb3VyY2UgKnJlczsNCj4gICAgICAg
ICBpbnQgcmV0Ow0KPiANCj4gICAgICAgICBwcml2ID0gZGV2bV9remFsbG9jKGRldiwgc2l6ZW9m
KCpwcml2KSwgR0ZQX0tFUk5FTCk7DQo+IEBAIC0yNjgsOCArMjY3LDcgQEAgc3RhdGljIGludCBt
dGtfZGlzcF9nYW1tYV9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQ0KPiAgICAg
ICAgICAgICAgICAgcmV0dXJuIGRldl9lcnJfcHJvYmUoZGV2LCBQVFJfRVJSKHByaXYtPmNsayks
DQo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAiZmFpbGVkIHRvIGdldCBn
YW1tYSBjbGtcbiIpOw0KPiANCj4gLSAgICAgICByZXMgPSBwbGF0Zm9ybV9nZXRfcmVzb3VyY2Uo
cGRldiwgSU9SRVNPVVJDRV9NRU0sIDApOw0KPiAtICAgICAgIHByaXYtPnJlZ3MgPSBkZXZtX2lv
cmVtYXBfcmVzb3VyY2UoZGV2LCByZXMpOw0KPiArICAgICAgIHByaXYtPnJlZ3MgPSBkZXZtX3Bs
YXRmb3JtX2lvcmVtYXBfcmVzb3VyY2UocGRldiwgMCk7DQo+ICAgICAgICAgaWYgKElTX0VSUihw
cml2LT5yZWdzKSkNCj4gICAgICAgICAgICAgICAgIHJldHVybiBkZXZfZXJyX3Byb2JlKGRldiwg
UFRSX0VSUihwcml2LT5yZWdzKSwNCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICJmYWlsZWQgdG8gaW9yZW1hcCBnYW1tYVxuIik7DQo+IGRpZmYgLS1naXQgYS9kcml2ZXJz
L2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2Rpc3BfbWVyZ2UuYyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRp
YXRlay9tdGtfZGlzcF9tZXJnZS5jDQo+IGluZGV4IDU2M2IxYjI0OGZiYmIzOGVmMDNiYjNlM2Nl
ZWNkZDI2NTk2MWRmNjAuLmIxNzRkZGEwOTFkM2ZiZDE2Nzk2ZThlMTI4YjAzMGZjY2Y1YjkwMmMg
MTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZGlzcF9tZXJnZS5j
DQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZGlzcF9tZXJnZS5jDQo+IEBA
IC0zMDYsNyArMzA2LDYgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBjb21wb25lbnRfb3BzIG10a19k
aXNwX21lcmdlX2NvbXBvbmVudF9vcHMgPSB7DQo+ICBzdGF0aWMgaW50IG10a19kaXNwX21lcmdl
X3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpDQo+ICB7DQo+ICAgICAgICAgc3Ry
dWN0IGRldmljZSAqZGV2ID0gJnBkZXYtPmRldjsNCj4gLSAgICAgICBzdHJ1Y3QgcmVzb3VyY2Ug
KnJlczsNCj4gICAgICAgICBzdHJ1Y3QgbXRrX2Rpc3BfbWVyZ2UgKnByaXY7DQo+ICAgICAgICAg
aW50IHJldDsNCj4gDQo+IEBAIC0zMTQsOCArMzEzLDcgQEAgc3RhdGljIGludCBtdGtfZGlzcF9t
ZXJnZV9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQ0KPiAgICAgICAgIGlmICgh
cHJpdikNCj4gICAgICAgICAgICAgICAgIHJldHVybiAtRU5PTUVNOw0KPiANCj4gLSAgICAgICBy
ZXMgPSBwbGF0Zm9ybV9nZXRfcmVzb3VyY2UocGRldiwgSU9SRVNPVVJDRV9NRU0sIDApOw0KPiAt
ICAgICAgIHByaXYtPnJlZ3MgPSBkZXZtX2lvcmVtYXBfcmVzb3VyY2UoZGV2LCByZXMpOw0KPiAr
ICAgICAgIHByaXYtPnJlZ3MgPSBkZXZtX3BsYXRmb3JtX2lvcmVtYXBfcmVzb3VyY2UocGRldiwg
MCk7DQo+ICAgICAgICAgaWYgKElTX0VSUihwcml2LT5yZWdzKSkNCj4gICAgICAgICAgICAgICAg
IHJldHVybiBkZXZfZXJyX3Byb2JlKGRldiwgUFRSX0VSUihwcml2LT5yZWdzKSwNCj4gICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICJmYWlsZWQgdG8gaW9yZW1hcCBtZXJnZVxu
Iik7DQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2Rpc3Bfb3Zs
LmMgYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2Rpc3Bfb3ZsLmMNCj4gaW5kZXggZGY4
MmNlYTRiYjc5YzQ3MmFjYmI2NmUwZGYyN2ZiYWQzZTcwYmQyMC4uZDA1ODFjNGUzYzk5OWNmODY1
ZmRkMGFhZjRjMmYzOGRkNDA0OTI2ZSAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL21l
ZGlhdGVrL210a19kaXNwX292bC5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9t
dGtfZGlzcF9vdmwuYw0KPiBAQCAtNjA0LDcgKzYwNCw2IEBAIHN0YXRpYyBpbnQgbXRrX2Rpc3Bf
b3ZsX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpDQo+ICB7DQo+ICAgICAgICAg
c3RydWN0IGRldmljZSAqZGV2ID0gJnBkZXYtPmRldjsNCj4gICAgICAgICBzdHJ1Y3QgbXRrX2Rp
c3Bfb3ZsICpwcml2Ow0KPiAtICAgICAgIHN0cnVjdCByZXNvdXJjZSAqcmVzOw0KPiAgICAgICAg
IGludCBpcnE7DQo+ICAgICAgICAgaW50IHJldDsNCj4gDQo+IEBAIC02MjEsOCArNjIwLDcgQEAg
c3RhdGljIGludCBtdGtfZGlzcF9vdmxfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRl
dikNCj4gICAgICAgICAgICAgICAgIHJldHVybiBkZXZfZXJyX3Byb2JlKGRldiwgUFRSX0VSUihw
cml2LT5jbGspLA0KPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgImZhaWxl
ZCB0byBnZXQgb3ZsIGNsa1xuIik7DQo+IA0KPiAtICAgICAgIHJlcyA9IHBsYXRmb3JtX2dldF9y
ZXNvdXJjZShwZGV2LCBJT1JFU09VUkNFX01FTSwgMCk7DQo+IC0gICAgICAgcHJpdi0+cmVncyA9
IGRldm1faW9yZW1hcF9yZXNvdXJjZShkZXYsIHJlcyk7DQo+ICsgICAgICAgcHJpdi0+cmVncyA9
IGRldm1fcGxhdGZvcm1faW9yZW1hcF9yZXNvdXJjZShwZGV2LCAwKTsNCj4gICAgICAgICBpZiAo
SVNfRVJSKHByaXYtPnJlZ3MpKQ0KPiAgICAgICAgICAgICAgICAgcmV0dXJuIGRldl9lcnJfcHJv
YmUoZGV2LCBQVFJfRVJSKHByaXYtPnJlZ3MpLA0KPiAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgImZhaWxlZCB0byBpb3JlbWFwIG92bFxuIik7DQo+IGRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2Rpc3BfcmRtYS5jIGIvZHJpdmVycy9ncHUvZHJt
L21lZGlhdGVrL210a19kaXNwX3JkbWEuYw0KPiBpbmRleCBiZjQ3NzkwZTRkNmJlNWQ2MDA3MGM2
M2MxNWM3NWZhMjAxY2M0YjI3Li5jOWQ0MWQ3NWU3ZjJhM2FmNTgyMDkyMWI3ZTU2M2RhMzc3Y2U4
ZDBkIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2Rpc3BfcmRt
YS5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZGlzcF9yZG1hLmMNCj4g
QEAgLTMxMyw3ICszMTMsNiBAQCBzdGF0aWMgaW50IG10a19kaXNwX3JkbWFfcHJvYmUoc3RydWN0
IHBsYXRmb3JtX2RldmljZSAqcGRldikNCj4gIHsNCj4gICAgICAgICBzdHJ1Y3QgZGV2aWNlICpk
ZXYgPSAmcGRldi0+ZGV2Ow0KPiAgICAgICAgIHN0cnVjdCBtdGtfZGlzcF9yZG1hICpwcml2Ow0K
PiAtICAgICAgIHN0cnVjdCByZXNvdXJjZSAqcmVzOw0KPiAgICAgICAgIGludCBpcnE7DQo+ICAg
ICAgICAgaW50IHJldDsNCj4gDQo+IEBAIC0zMzAsOCArMzI5LDcgQEAgc3RhdGljIGludCBtdGtf
ZGlzcF9yZG1hX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpDQo+ICAgICAgICAg
ICAgICAgICByZXR1cm4gZGV2X2Vycl9wcm9iZShkZXYsIFBUUl9FUlIocHJpdi0+Y2xrKSwNCj4g
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICJmYWlsZWQgdG8gZ2V0IHJkbWEg
Y2xrXG4iKTsNCj4gDQo+IC0gICAgICAgcmVzID0gcGxhdGZvcm1fZ2V0X3Jlc291cmNlKHBkZXYs
IElPUkVTT1VSQ0VfTUVNLCAwKTsNCj4gLSAgICAgICBwcml2LT5yZWdzID0gZGV2bV9pb3JlbWFw
X3Jlc291cmNlKGRldiwgcmVzKTsNCj4gKyAgICAgICBwcml2LT5yZWdzID0gZGV2bV9wbGF0Zm9y
bV9pb3JlbWFwX3Jlc291cmNlKHBkZXYsIDApOw0KPiAgICAgICAgIGlmIChJU19FUlIocHJpdi0+
cmVncykpDQo+ICAgICAgICAgICAgICAgICByZXR1cm4gZGV2X2Vycl9wcm9iZShkZXYsIFBUUl9F
UlIocHJpdi0+cmVncyksDQo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAi
ZmFpbGVkIHRvIGlvcmVtYXAgcmRtYVxuIik7DQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9k
cm0vbWVkaWF0ZWsvbXRrX2RzaS5jIGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kc2ku
Yw0KPiBpbmRleCA0MDc1MmYyMzIwNTQ4ZmJmNmM3ZGU5NmIxOGU4YTYzNmFjOWMzMWJlLi5mMjk4
MjkzNDcxZGU0OTQ3M2RkMDU5NzMzODNkYzIyZjdkM2I2YzIzIDEwMDY0NA0KPiAtLS0gYS9kcml2
ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RzaS5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9t
ZWRpYXRlay9tdGtfZHNpLmMNCj4gQEAgLTExOTIsNyArMTE5Miw2IEBAIHN0YXRpYyBpbnQgbXRr
X2RzaV9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQ0KPiAgew0KPiAgICAgICAg
IHN0cnVjdCBtdGtfZHNpICpkc2k7DQo+ICAgICAgICAgc3RydWN0IGRldmljZSAqZGV2ID0gJnBk
ZXYtPmRldjsNCj4gLSAgICAgICBzdHJ1Y3QgcmVzb3VyY2UgKnJlZ3M7DQo+ICAgICAgICAgaW50
IGlycV9udW07DQo+ICAgICAgICAgaW50IHJldDsNCj4gDQo+IEBAIC0xMjE3LDggKzEyMTYsNyBA
QCBzdGF0aWMgaW50IG10a19kc2lfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikN
Cj4gICAgICAgICBpZiAoSVNfRVJSKGRzaS0+aHNfY2xrKSkNCj4gICAgICAgICAgICAgICAgIHJl
dHVybiBkZXZfZXJyX3Byb2JlKGRldiwgUFRSX0VSUihkc2ktPmhzX2NsayksICJGYWlsZWQgdG8g
Z2V0IGhzIGNsb2NrXG4iKTsNCj4gDQo+IC0gICAgICAgcmVncyA9IHBsYXRmb3JtX2dldF9yZXNv
dXJjZShwZGV2LCBJT1JFU09VUkNFX01FTSwgMCk7DQo+IC0gICAgICAgZHNpLT5yZWdzID0gZGV2
bV9pb3JlbWFwX3Jlc291cmNlKGRldiwgcmVncyk7DQo+ICsgICAgICAgZHNpLT5yZWdzID0gZGV2
bV9wbGF0Zm9ybV9pb3JlbWFwX3Jlc291cmNlKHBkZXYsIDApOw0KPiAgICAgICAgIGlmIChJU19F
UlIoZHNpLT5yZWdzKSkNCj4gICAgICAgICAgICAgICAgIHJldHVybiBkZXZfZXJyX3Byb2JlKGRl
diwgUFRSX0VSUihkc2ktPnJlZ3MpLCAiRmFpbGVkIHRvIGlvcmVtYXAgbWVtb3J5XG4iKTsNCj4g
DQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2hkbWkuYyBiL2Ry
aXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfaGRtaS5jDQo+IGluZGV4IGNhODJiYzgyOWNiOTY0
NDZkNGQzNGVlZWY0NTg0OGRmMDNiZDcxNmIuLmQ3MjljMTM1OTBjYjVlYzE3NmYxNWI2ODBjMjYy
YTI2YjY3N2U2YWEgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtf
aGRtaS5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfaGRtaS5jDQo+IEBA
IC0xNDI1LDcgKzE0MjUsNiBAQCBzdGF0aWMgaW50IG10a19oZG1pX2R0X3BhcnNlX3BkYXRhKHN0
cnVjdCBtdGtfaGRtaSAqaGRtaSwNCj4gICAgICAgICBzdHJ1Y3QgZGV2aWNlX25vZGUgKmNlY19u
cCwgKnJlbW90ZSwgKmkyY19ucDsNCj4gICAgICAgICBzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpj
ZWNfcGRldjsNCj4gICAgICAgICBzdHJ1Y3QgcmVnbWFwICpyZWdtYXA7DQo+IC0gICAgICAgc3Ry
dWN0IHJlc291cmNlICptZW07DQo+ICAgICAgICAgaW50IHJldDsNCj4gDQo+ICAgICAgICAgcmV0
ID0gbXRrX2hkbWlfZ2V0X2FsbF9jbGsoaGRtaSwgbnApOw0KPiBAQCAtMTQ3MSw4ICsxNDcwLDcg
QEAgc3RhdGljIGludCBtdGtfaGRtaV9kdF9wYXJzZV9wZGF0YShzdHJ1Y3QgbXRrX2hkbWkgKmhk
bWksDQo+ICAgICAgICAgfQ0KPiAgICAgICAgIGhkbWktPnN5c19yZWdtYXAgPSByZWdtYXA7DQo+
IA0KPiAtICAgICAgIG1lbSA9IHBsYXRmb3JtX2dldF9yZXNvdXJjZShwZGV2LCBJT1JFU09VUkNF
X01FTSwgMCk7DQo+IC0gICAgICAgaGRtaS0+cmVncyA9IGRldm1faW9yZW1hcF9yZXNvdXJjZShk
ZXYsIG1lbSk7DQo+ICsgICAgICAgaGRtaS0+cmVncyA9IGRldm1fcGxhdGZvcm1faW9yZW1hcF9y
ZXNvdXJjZShwZGV2LCAwKTsNCj4gICAgICAgICBpZiAoSVNfRVJSKGhkbWktPnJlZ3MpKSB7DQo+
ICAgICAgICAgICAgICAgICByZXQgPSBQVFJfRVJSKGhkbWktPnJlZ3MpOw0KPiAgICAgICAgICAg
ICAgICAgZ290byBwdXRfZGV2aWNlOw0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL21l
ZGlhdGVrL210a19tZHBfcmRtYS5jIGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19tZHBf
cmRtYS5jDQo+IGluZGV4IGZjNjllZTM4Y2U3ZDZhMjQ1YTc0NjBjZmRlOGRlNDI2ZTgzYjJlODAu
Ljc5ODI3ODhhZTlkZjUxZjFhMzc4ZDhkNTM4NzM3ZjM4YWY3Mjk5ZjIgMTAwNjQ0DQo+IC0tLSBh
L2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfbWRwX3JkbWEuYw0KPiArKysgYi9kcml2ZXJz
L2dwdS9kcm0vbWVkaWF0ZWsvbXRrX21kcF9yZG1hLmMNCj4gQEAgLTI5MSw3ICsyOTEsNiBAQCBz
dGF0aWMgY29uc3Qgc3RydWN0IGNvbXBvbmVudF9vcHMgbXRrX21kcF9yZG1hX2NvbXBvbmVudF9v
cHMgPSB7DQo+ICBzdGF0aWMgaW50IG10a19tZHBfcmRtYV9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1f
ZGV2aWNlICpwZGV2KQ0KPiAgew0KPiAgICAgICAgIHN0cnVjdCBkZXZpY2UgKmRldiA9ICZwZGV2
LT5kZXY7DQo+IC0gICAgICAgc3RydWN0IHJlc291cmNlICpyZXM7DQo+ICAgICAgICAgc3RydWN0
IG10a19tZHBfcmRtYSAqcHJpdjsNCj4gICAgICAgICBpbnQgcmV0ID0gMDsNCj4gDQo+IEBAIC0y
OTksOCArMjk4LDcgQEAgc3RhdGljIGludCBtdGtfbWRwX3JkbWFfcHJvYmUoc3RydWN0IHBsYXRm
b3JtX2RldmljZSAqcGRldikNCj4gICAgICAgICBpZiAoIXByaXYpDQo+ICAgICAgICAgICAgICAg
ICByZXR1cm4gLUVOT01FTTsNCj4gDQo+IC0gICAgICAgcmVzID0gcGxhdGZvcm1fZ2V0X3Jlc291
cmNlKHBkZXYsIElPUkVTT1VSQ0VfTUVNLCAwKTsNCj4gLSAgICAgICBwcml2LT5yZWdzID0gZGV2
bV9pb3JlbWFwX3Jlc291cmNlKGRldiwgcmVzKTsNCj4gKyAgICAgICBwcml2LT5yZWdzID0gZGV2
bV9wbGF0Zm9ybV9pb3JlbWFwX3Jlc291cmNlKHBkZXYsIDApOw0KPiAgICAgICAgIGlmIChJU19F
UlIocHJpdi0+cmVncykpDQo+ICAgICAgICAgICAgICAgICByZXR1cm4gZGV2X2Vycl9wcm9iZShk
ZXYsIFBUUl9FUlIocHJpdi0+cmVncyksDQo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAiZmFpbGVkIHRvIGlvcmVtYXAgcmRtYVxuIik7DQo+IA0KPiAtLQ0KPiAyLjQ3LjAN
Cj4gDQo+IA0KDQo=
