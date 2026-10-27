Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.152.168
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793095521;
	b=uE0W4OQFMFraucEjyBPUv43egoFuxhwqNpKz4mxzYVjYYjXfKsY8XiIYN7eZnnTB9hCm
	 kEewrhIgDQRkB44QICxFYLb+fQs4AyTd8mn+6LzwsMOf6I++c+4ytzG3tV57CV/2Sb1Pq
	 TfChyUnf7LKKiBUtluxsKZYcv/nqXLtaf4jfiPhXibAhrA2MooSvhdfTv0m0a5BtP4sVg
	 n80RVbfCKNSzU+6WTCsJm8d9UB8iAga2tvGZtCaAGgAhUabQ2Vs/kahzJ+PfKw+suynKm
	 SXWSq8ygtbC4ehtUfoJ0j6VOwV41tQYu/yiEAzlsFBl0VoHZdzKiJc/gmS88ip6le/w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793095521;
	h=DMARC-Filter:Received:DKIM-Signature:Received:DKIM-Signature:
	 Received:Received:X-MS-Exchange-Authentication-Results:Received-SPF:
	 Received:Received:Received:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To:X-EOPAttributedMessage:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-Exchange-RoutingPolicyChecked:
	 X-OriginatorOrg:X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthAs:X-MS-Exchange-CrossTenant-AuthSource:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Reason;
	bh=gX6MWrUmiJmQvFODZ/dCsUvf+S4EXlCVDs713zfiE1s=;
	b=mMnOb4wWGv4qGRbFIGH3NstAcSZKfT0hL7hQGpVCV5T53N0N4XfZaDC50It6LySJISZH
	 TIZNl2dV6cx7lyR0Y/mQ/gB5d7InNZ5NAbibEptROP8uYeaDZNPWftphcsIKMKpOH4N9H
	 psy9cXw0dFd8i6NqU7oX7eE+0S+SfTeQxDydSAE7z6hoZJH2lFEsiMtAUcM0T2AV0hrYS
	 sKwkPC3Q6FU757/RY8+KhEL7pX/CMFJ4Kgpk24twbUwml//WMPeXkhQXVwni6RGR0Vn3y
	 6U3tBNFUPVHNMNX0Wf0yJ9kzdCUDbtao2EYpU4J60arnSWwpMAxW3g1pWIj50+Eg7tw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=opensource.cirrus.com;
	spf=pass smtp.mailfrom=opensource.cirrus.com;
	dkim=pass header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=iIgOaQo3;
	dkim=pass header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=ZUkHuptm;
	arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.152.168
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B06C3606A31B;
	Tue, 27 Oct 2026 10:05:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B06C3606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=iIgOaQo3;
	dkim=pass (1024-bit key, unprotected) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=ZUkHuptm
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69R4G8Bo4028162;
	Tue, 27 Oct 2026 05:04:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=gX6MWrUmiJmQvFODZ/dCsUvf+S4EXlCVDs713zfiE1s=; b=
	iIgOaQo3oDo7Cx6sy+zW2y1AQmQMxjBE+9spXNTe7GMROuqOuQRAflVUiKB+gdht
	6AYucQqmoxYUemkGflFrFWvGK2lmb+ZBROB6BqBiig0JZFcVqB1XGcuRIhsXdF6c
	dxp/x/loisQzUef8Ff53rExtaCLekwv9H1/ROPln2+bSBkgRLxH3ToKKuaZ2CSMN
	V7rsdCWctT+Jmf1DffsbtwxO649DCRaATIFeqDogLlfgMyHcOTFGVyU9kDQuPil2
	h7/Bv/oxEMmrswyzafvnm5LOfQW3QcF1ROzJPAAutuN3AJKmpp6AP6cJInjZzPCv
	DK3ZA9TYviUHJJhAD0xjXw==
Received: from bn8pr05cu002.outbound.protection.outlook.com (mail-eastus2azon11021084.outbound.protection.outlook.com [52.101.57.84])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4hgs3jbk1k-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 27 Oct 2026 05:04:48 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p++OaFXt8AaazBt9YNZoSqhmjhJXAdtV4/GNtCCOlFWSe6MAJAnLVqwiNRieP0rvUpxqLreLvudDRdaaGXl3e9T6R9kPQ1PKDNy4TF97h5eUcTYCZhrfZMbeKrjq8S0ug0QqEtNED7Vz8VjoJ1u5Dv0dsXs77VcUgh8FiuFU7vK7dEwsHQCftYtI/ltsw7tAtrnuTL1LKctiId9xplU1Yoibbwz+l6UyhOrzgp1apkqC5VyNScJi1ImyW+uk7bLV66GXJuHV+FtwJaGNGc7SISIxDBWezbmhy+/XMBtMbuDpWGVn1eokxQGTjd2FFFmYrvk3P+vbrQMphDFvadUTxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gX6MWrUmiJmQvFODZ/dCsUvf+S4EXlCVDs713zfiE1s=;
 b=lxuCLG15fXjgFddM8Im3AAzch8F01OZt/pr4I5XxqM/fkHDj+NI2TjFzgkJcx7T609a6UFgC9ar9AGblnjCiEipdrQdl4b0o7S35h+ke2cPLQj2aYPj2f+/bGRtHIn2AiE9oz/uSV5I7QgV2+BcjK+FG5kC+JRcSuQpaB1R4t4agigOuZITP1wq5hmZBwaniJgqZqfRjI2ICTuCWCyPI1RJF+L0oktp3DZloK31Kahw4mM2/sRBvSF889lVRqmiGRKoPHJoyKcib6k2nLdwDCLB20iCZS43yWa7FPEk6P51xRddSPvz5aCoVdtved+IVZ02povoV2q61pkxgCP6o9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=asmblr.net
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gX6MWrUmiJmQvFODZ/dCsUvf+S4EXlCVDs713zfiE1s=;
 b=ZUkHuptm6ZBYQagNl/Bcyr42xuoUXlHt0jN5S9TwJOcNa5xuSC7YWAvCsVFF9vjsqouWcp66AfgdbRn9mllfczh4LH7DTa7WevuPCzp5W7xt7YJ5uJPE9ABNMaGhT9YctT4UcqF1IkB5KqyHOwWo/1nidcdW3hfe6FZ9Md0K/Hs=
Received: from MN2PR08CA0017.namprd08.prod.outlook.com (2603:10b6:208:239::22)
 by BLAPR19MB4481.namprd19.prod.outlook.com (2603:10b6:208:292::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Tue, 27 Oct
 2026 10:04:44 +0000
Received: from BN3PEPF0000B371.namprd21.prod.outlook.com
 (2603:10b6:208:239:cafe::24) by MN2PR08CA0017.outlook.office365.com
 (2603:10b6:208:239::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.546.22 via Frontend Transport; Tue,
 27 Oct 2026 10:04:44 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=softfail (sender
 IP is 84.19.233.75) smtp.mailfrom=opensource.cirrus.com; dkim=none (message
 not signed) header.d=none;dmarc=fail action=oreject
 header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BN3PEPF0000B371.mail.protection.outlook.com (10.167.243.168) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.569.0
 via Frontend Transport; Tue, 27 Oct 2026 10:04:43 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id B9877406540;
	Tue, 27 Oct 2026 10:04:42 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 9A3CA82024C;
	Tue, 27 Oct 2026 10:04:42 +0000 (UTC)
Date: Tue, 27 Oct 2026 10:04:41 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Amadeusz =?utf-8?B?U8WCYXdpxYRza2k=?= <amade@asmblr.net>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com, linux-tegra@vger.kernel.org,
        Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Thierry Reding <thierry.reding@kernel.org>,
        Jonathan Hunter <jonathanh@nvidia.com>
Subject: Re: [PATCH 00/12] ASoC: Convert last few codecs to set_jack
Message-ID: <auB3OWLAbq4eXEL7@opensource.cirrus.com>
References: <20261026201915.57184-1-amade@asmblr.net>
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Post: <mailto:linux-tegra@vger.kernel.org>
List-Help: <mailto:linux-tegra+help@vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-tegra+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261026201915.57184-1-amade@asmblr.net>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B371:EE_|BLAPR19MB4481:EE_
X-MS-Office365-Filtering-Correlation-Id: d42866e0-9b8c-4e4a-cf01-08df3411b951
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|23010399003|30052699003|376014|7416014|61400799027|6133799003|22082099003|16102099003|18002099003|56012099006|11063799006|10067099003|261009223027099003|261021121427099003|261026121527099003|261021123027099003;
X-Microsoft-Antispam-Message-Info:
	dE3iHL0VovsPy52dfOegNI+HYocAxKkG3SJH1x6Hm6umKlQydsKeP98kAaBi7qKltMV/oqhqn8wvysZdlnDnd7xr/ExczFL02T19oa7/5pimgENrruEjLTvFRUj9u4e0FZE3DIyIxWsB5x+Hocf3qZKma3qEvNhuuct/n57D48bnrxQ4hOR495pJej7IKzHIJZzfPyXgA9PFf2TpsozKrn3KVSUvCFwQRfsVE0jd45z06Hd8B0J32eexGj6pL9OwxGT3PPdBvWnsCn7NMG9ChKbCnNfVSr/c1FgXKRC2KaQPEGfPQE1+n+7hq1vG/7yVnRgf0JFj0FDK1ScoibE42pVNppiv+IwXzVIoeyAgu1kexXGVS0YAZYDhiQ9cdWD+JEs/b3ZKdk4TRlcu7hi3gLH3quTyeBU0vF3qWoxDiH95r7le6aUo2Uu4oxlnvF6hl1nnvH0zppUHKvzxcGGuU+px185OMwj31jnfqqCw0qKi/MslKFTaXVWMV+6miw1m4f+nGb7sPd9xGB+coSulsacL6Qk68RhCYPFit/LDnP6l1Yh3vpurMuBu+rByu+RrvpwLP0uHGoNxL/Fx9lSyZwCPr/aD3Vfql/I9nkpGfwVFtsJkPLKLZvrujQbd++F6dJu6CXI8695fDbIITbzhnxS3PkpkvRNEvUszXseX33KednaWIBd6funTpZ+5Ijvi6klBFWVfEWi1btFQvNV3vw==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(23010399003)(30052699003)(376014)(7416014)(61400799027)(6133799003)(22082099003)(16102099003)(18002099003)(56012099006)(11063799006)(10067099003)(261009223027099003)(261021121427099003)(261026121527099003)(261021123027099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	dBscpoMOx2W/nraBRmabsP4n1UL4fCsTEkDYwS52/CaYVcxwiNzGHA96IcYiSFZhf5sECDxZvWr3Xa38bkvWjE4tIwh4It6bCvkZFekPfK5KGC9boB/fOtKMJCgpkyXQpkOlKmOAna+l11QGptVceYj/Y4vvKeZSFXw2lv7CcHTV6YXpgSH7x5GsGc0DqfaxopxaPF+6LVvqkduGsJjxAv4eiRl/hAbi/FRWAI539PeXaJZ18rsM8r96DLKph62+RxSbnZ+9iC9KGbvvbGbsAeEQ7P7RtijorpZYM7ODiby/QQum+ByF9kTPeTqWm0RRwNJasRPh9QqP1QyjnQBSoPPt/Jpbw7+8d7q9LygBSGo+aafEbNIowQbVk9V1m7DIR8nuTuMP5gYqRZ/QAWSMZ9A2zbRLuRLCeclJ+7kcMDIncVano3GzBQuV3EehmKNR
X-Exchange-RoutingPolicyChecked:
	bygcFR0C2RsUyDxKRJvANpF3xE6SX/vafV9+pTBucfz1AEUUpiRkvrRpPmIbTVV0ozxZXbsg4No0A9m2nCh7Vrkgypjm1Ms5AsOz3QouEsF9IIj/MQSONC+ZDsq/gpNDHvlVFI7CB6LYFutOOxqq2iB6hHSNvVOtIgP8r2N546m7e2lpdaOz69rohHaAjL6/9oDTkxOR3inPNXpPdxqCB5Dw7kVJhzvQiX5co9tjhUYAya9qimFAxc5I9FTA36Zjnqxb45XurwfZsd1nZw8wfrmn0Sb8X9OpbSNoDgc24k0CZRblHBoT8cUXk1MgFB1K0z3u0zV+999tDiV66SNalw==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2026 10:04:43.6000
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d42866e0-9b8c-4e4a-cf01-08df3411b951
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BN3PEPF0000B371.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR19MB4481
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDAzOSBTYWx0ZWRfX2U51mawJmhuv
 m7g1Sc0NmnjZsKw8mPpxqRbf7Z3LLK68cJ6VqUm9GZlQwENYKDfPStFe2sj8k5tQicxdd0TAqS4
 n/zPeFEjay8NS4pAQo4rDb5A9NLlx4s=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDAzOSBTYWx0ZWRfX0qXR97WjzdZ2
 12Yzt6WfVUrei1Oaq7kkOPOtG81oyFny0hw9KWCzuJSuHDM5jPxaedIpaFCMK0GMgy0nF1yhYL5
 EAWKbIW8h/067tcsNPAkvl3IaKqvPpfPD2M3k6q7/pyeLmrGnzBQKETOdXHeLNWfx0isiGrd6NK
 FivBtd5gI/if9nsCGXe1LTJipbBWJ6UclOfRId8QC3eXZzp6rrBubK0lFSwDATZ4n+3EpRmA9dw
 xb5kwcz8//Dvj59EzGc2YyKyiHylFrjiMHcGiyNgCW6muFeJIXeZcbrcht8VCPD6za4nkJpSQUS
 3CPjjzgnTjao5NMccxwYODKaYBMfDjyjh30lCvq4o1zuHC6xMdlqwxS9dqIDyAdG7IuE9FKVG6L
 Y4xzGHiX/khG2Bw1+qEZUebsJb0lpyDyWTL2vwuvPGqvuwGNExhFEzfqfDVvIVfUT/qi2/NkiV2
 t8UEJzoA/jprjcuZ9xw==
X-Authority-Analysis: v=2.4 cv=dbIVTnXe c=1 sm=1 tr=0 ts=6ae07740 cx=c_pps
 a=UWRz77ybNBoRz3V4z6xh/w==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=w1d2syhTAAAA:8 a=wa2UD3lQxRRDn7Aal6kA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: o8vx8o_3Y9QgAxxnnOOJj6maf7NMSbTC
X-Proofpoint-ORIG-GUID: o8vx8o_3Y9QgAxxnnOOJj6maf7NMSbTC
X-Proofpoint-Spam-Reason: safe

On Mon, Oct 26, 2026 at 09:19:03PM +0100, Amadeusz Sławiński wrote:
> There were still few codecs left using old method of jack detection by
> exporting public *_mic_detect() function. Convert them to .set_jack
> callback.
> 
> First implement the wrapper around *_mic_detect, currently either none
> or just one of the arguments is used, so even if function exposes more,
> wrap it, by accepting only one. (If in the future there is usecase for
> more arguments, it can be easily added, by exposing jack setting struct,
> and passing it by data pointer.)
> 
> Then convert the boards to use standard snd_soc_component_set_jack call.
> 
> And finally remove *_mic_detect() from headers and unexport it.
> 
> Amadeusz Sławiński (12):
>   ASoC: codecs: wm8903: Implement set_jack callback
>   ASoC: codecs: wm8962: Implement set_jack callback
>   ASoC: codecs: wm8994: Implement set_jack callback
>   ASoC: tegra: tegra_wm8903: Use standard callback to set jack
>   ASoC: tegra: tegra_wm8962: Use standard callback to set jack
>   ASoC: tegra: tegra_wm8994: Use standard callback to set jack
>   ASoC: samsung: littlemill: Use standard callback to set jack
>   ASoC: samsung: midas_wm1811: Use standard callback to set jack
>   ASoC: samsung: tobermory: Use standard callback to set jack
>   ASoC: codecs: wm8903: Make wm8903_mic_detect() static
>   ASoC: codecs: wm8962: Make wm8962_mic_detect() static
>   ASoC: codecs: wm8994: Make mic detect functions static
> 
>  sound/soc/codecs/wm8903.c        | 18 +++++++++++++++---
>  sound/soc/codecs/wm8903.h        |  5 -----
>  sound/soc/codecs/wm8962.c        | 10 ++++++++--
>  sound/soc/codecs/wm8962.h        |  2 --
>  sound/soc/codecs/wm8994.c        | 30 +++++++++++++++++++++++-------
>  sound/soc/codecs/wm8994.h        |  6 ------
>  sound/soc/samsung/littlemill.c   |  6 +-----
>  sound/soc/samsung/midas_wm1811.c |  3 +--
>  sound/soc/samsung/tobermory.c    |  2 +-
>  sound/soc/tegra/tegra_wm8903.c   |  5 ++---
>  sound/soc/tegra/tegra_wm8962.c   |  4 ++--
>  sound/soc/tegra/tegra_wm8994.c   |  4 ++--
>  12 files changed, 55 insertions(+), 40 deletions(-)

Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
