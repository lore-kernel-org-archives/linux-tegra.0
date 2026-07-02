Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013005.outbound.protection.outlook.com [52.101.72.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64E6947DFBF;
	Thu,  2 Jul 2026 13:05:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.5
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782997517; cv=fail; b=U+i8S8ypmYc+xRL29/vtoL5c0w1m/rTXzNH/8vZRNUp4CEVMPr9zOZATLBHDhWGD16DNpC35Y2Jn1AhjiJnB5ysjWfjKEKQvyDg4PLDuO4BlJ2pvkm2slxkxmwM8Lknsf2p2/C1j1l70aaoMfkQ1qwA3pH7lE6b9s3QoZo92oEc=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782997517; c=relaxed/simple;
	bh=/C26JhC64I4b3iD8UyKs4H6GNqfDWDkNSLfEy7vJnK4=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=CaaTaspfo1Ms7O/otzb5Wse6Hnk5rXg7++EKaiKl2Q6/yTf4IsmSTvqYBYoglayGq1aNbUCf8qwXyAyR8eoMTFBUgSkHNXFQ+LzXOhwPf1xQJNgH0yPCFHIE/Qt/NsqkCt/YyF+pa4eqYozdGeDvdjjA0v8c26brP/qnG5HuIhI=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=XNnX8toq; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=XNnX8toq; arc=fail smtp.client-ip=52.101.72.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="XNnX8toq";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="XNnX8toq"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=pwOFLSmCqjEBcTzmrkXoNU01Y62rrHOBTkxWWbGaLa3cl0AqQ0lwFR62aa8FCPtoZowt/mmFIPgW8PF8n/EALNm/EgmLdDtM7xAXzx6rlSdMP+uYMoG1XKCF6ACPPTkQQuxXl0oI+lhCNWIHUaZHTDOjR7Ao8Xy8YOOHwV36fV0uD0CS15aT8f5T0KH1FIfaSV+H+bPdWiYOcR6HwfH4ipA5N6C5B7ICGKsvddIGmfsTC3EzeatmFTIQYpzT9g2d5UQRlMgKLqAsHyxg72Baw3BFlO1mOuGZHYCuBb9Cw2w/AI/CUsptH/GwYaksBdDh75tumeuxWHyDxCqHQTLkwA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Rf/AIP5W1Ml2PF1aiOmBcunLO0rJAoqW5+UcaOZr+KI=;
 b=PzjpnxD+l3N7z1edCK27FPRvmdz1hXZvDDcdJT7CbHmCDGnHKs5dPTkfrST3eLqUTmq8iQso56SJvJ9V/yJvgHyXPIg93Wvgu9gql4F4t7PfCjjHcc4RUF2Fb1jSJRrFmUS6HxHOZNzMr4zqwZHWZDBS54CQRXId8tZneBG3AS4Qv/wrt5+2j3SiC3kNKKba0z7iS0UPkl4m13raXI+zoWB5ZyK9Zcx86NOxwdcp/RKBxjAAnEC35gtGr+4FwjEd/GtYBVqJuGnW38LEAZ0NkPv3neCnuA4zM+0adpTeFziULgwrJVOW0l1OXR1JmiUtDFz91w7uRigWl+7gHgsYsQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=nvidia.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Rf/AIP5W1Ml2PF1aiOmBcunLO0rJAoqW5+UcaOZr+KI=;
 b=XNnX8toqKMwCV1h2UaVRBWW9j/f2VYelSXnc3l7nTuoKPrbx/AYAo3Z0vv/p9dyvrAKqaK1azmX7664PVwVy8lcU396gPe51THNQzxRVVlJG3+l3suO+nEdKB9H5qWT4o7scx6FjQ+lZja+vnbTFczu3qDQnJetoChEvnr7388I=
Received: from AM0P190CA0018.EURP190.PROD.OUTLOOK.COM (2603:10a6:208:190::28)
 by PA4PR08MB6143.eurprd08.prod.outlook.com (2603:10a6:102:ed::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.10; Thu, 2 Jul
 2026 13:05:08 +0000
Received: from AMS1EPF00000090.eurprd05.prod.outlook.com
 (2603:10a6:208:190:cafe::5e) by AM0P190CA0018.outlook.office365.com
 (2603:10a6:208:190::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.181.9 via Frontend Transport; Thu, 2
 Jul 2026 13:05:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AMS1EPF00000090.mail.protection.outlook.com (10.167.242.87) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.181.6
 via Frontend Transport; Thu, 2 Jul 2026 13:05:08 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KTaXarFHJtpmAaoUZn+jy4HxqjWfAxrpyItN5fwbMYSOoVLj5vTsWUZeUv8hoxU8Jm+xONWhCyAnq/Nz2nkdHAAuuNk9PpeYk/7RcfoO5E63dmQDmzMuixgHbtI1WLvHHcmmXxHstP3JfXtMvCrSNaH1fMxfREyGs2yWS9T/FsiDRsWr0+heS8IfRlyrCrwc3KW0GFX5oz+WUVKOh3VcZ3rDjlB0AwjAVFnjp1fGu+z+7bMh8Z0PeI/lxYnRms1S73U7ADuaR50B9QSwWReOxm0+H93ZkEzJCh6rbpExjScjRzNxmiJhJPlT1+WxmzoWvfexDwUr3YJnmturDGMKyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Rf/AIP5W1Ml2PF1aiOmBcunLO0rJAoqW5+UcaOZr+KI=;
 b=gHAWIdy6V4f0udqJd3SYRBqBYQErkOiV/28uu8phxOHOoBAlgt0BnkUCfivq+tCdqfJYiICSiWkrnoywyXzIA97IL+RTt1RFDopX5dVdPQRmEs/3gDNfAk50AZtm4equ1Emz/82/hx10QxAT/+QEJpCGn7QtmdI9Od11X55+saJ9Sa7YdcppTEuFbWgbIDcQvibc6n6RiInf57mUzRl9efJ9UJxTBecgpS/mciwThOiTZxC3kDm1/5FjwSiup7uqQsKlglU7uofwEVUDdGHNb0VsSAHyRiuizTpq/z8YBgrXFBfGCCdTrveRkn9YzEDMk8QCPAL9ENHVaozLzkFRZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Rf/AIP5W1Ml2PF1aiOmBcunLO0rJAoqW5+UcaOZr+KI=;
 b=XNnX8toqKMwCV1h2UaVRBWW9j/f2VYelSXnc3l7nTuoKPrbx/AYAo3Z0vv/p9dyvrAKqaK1azmX7664PVwVy8lcU396gPe51THNQzxRVVlJG3+l3suO+nEdKB9H5qWT4o7scx6FjQ+lZja+vnbTFczu3qDQnJetoChEvnr7388I=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from GV1PR08MB10455.eurprd08.prod.outlook.com
 (2603:10a6:150:16f::10) by DUYPR08MB12013.eurprd08.prod.outlook.com
 (2603:10a6:10:661::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Thu, 2 Jul 2026
 13:04:05 +0000
Received: from GV1PR08MB10455.eurprd08.prod.outlook.com
 ([fe80::af66:6019:a08:d04]) by GV1PR08MB10455.eurprd08.prod.outlook.com
 ([fe80::af66:6019:a08:d04%4]) with mapi id 15.21.0181.009; Thu, 2 Jul 2026
 13:04:04 +0000
Message-ID: <591e7ac9-310e-40f4-ab22-161d6ea8f487@arm.com>
Date: Thu, 2 Jul 2026 15:04:02 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] cache: add SMCCC-backed cache invalidate provider
To: Srirangan Madhavan <smadhavan@nvidia.com>,
 Mark Rutland <mark.rutland@arm.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Sudeep Holla <sudeep.holla@kernel.org>, Conor Dooley <conor@kernel.org>,
 Jonathan Cameron <jic23@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Dan Williams <djbw@kernel.org>, Thierry Reding <treding@nvidia.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-tegra@vger.kernel.org
References: <20260608220709.1300245-1-smadhavan@nvidia.com>
 <20260608220709.1300245-3-smadhavan@nvidia.com>
Content-Language: en-US
From: =?UTF-8?B?QmVuY2UgQ3PDs2vDoXM=?= <bence.csokas@arm.com>
In-Reply-To: <20260608220709.1300245-3-smadhavan@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO6P123CA0031.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:2fe::11) To GV1PR08MB10455.eurprd08.prod.outlook.com
 (2603:10a6:150:16f::10)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	GV1PR08MB10455:EE_|DUYPR08MB12013:EE_|AMS1EPF00000090:EE_|PA4PR08MB6143:EE_
X-MS-Office365-Filtering-Correlation-Id: e80cc0d4-7da2-429e-4823-08ded83a8af5
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|366016|376014|7416014|23010399003|1800799024|11063799006|6133799003|22082099003|18002099003|5023799004|4143699003|56012099006;
X-Microsoft-Antispam-Message-Info-Original:
 KKaTGNVUX345DpLGOJ/64oOCdVIIV45IOSitCXYfewlaSx4v5w0GXDZTahcavbtXI1z6yU2UY/8Xg9nIqOexghkdQ3D79Xf62cGW8KOnqTsw14ysZtlt75ETpJcSbSRCYopSzc+fBAEmXEhAND99dJ+HoPSdDh95G40N5g6m0PRr7G6cd/w8EhYytp4zxPYGOuHtBnwre2qff7kbRpk/wFr31uny+cNdSMMTaNkgsBHff5VGAEZoFvVvuHHZ4KEzdJz56rjfC5WFlBx3ZWN9Swg1ixsov1dGLJS06gOFxn6QLvH4AMimpDdQVZ7hDqutgkMFl/utCmGcoiZnWXkq/nY7gyyNPh2PHyD8SEIJXtnpa6Zxqt4YWABTjdnyVVmrj/K/FDW9/vXKysc81zqi34fCXN2gip6W0Geu+kiFR+zZcBgHykewrK/0cUJ2Gj6Gv/vvEwEWORO3XqfhHc9cWejt+ygw4a7CehFStRQXBItSCTcFDJoYGyFIQYsGnOaeczAf6JbazglIz6ZYoIF/AbmaJ0U9lWlkvLX/QySvGhdhPpVMaWhW2mpOovz52B7dIePQwD435Fe6HI/ccNqqnM23gw1gbDLXRFFhDoz1hjEw/UxC5LozrqpSekGvGgfdI0dCduf1bmFKxhy2jDcft2zwKke3/9ijPNgjGgwzkK0=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR08MB10455.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(23010399003)(1800799024)(11063799006)(6133799003)(22082099003)(18002099003)(5023799004)(4143699003)(56012099006);DIR:OUT;SFP:1101;
X-Exchange-RoutingPolicyChecked:
 iptJ0ue64AawQo+XhJRJHuo1xtNpckqBrDPO5w/eHA/RH/9atOZkTBTpAnU7xMs/dGWj10OcTLLU5ht0KqWphmiq/aNtTAl6RvV1CPews5Ou29R7nA/D8HInFwKXUqd/LnO0ARA/DtnJJcmKAHzhmQpho77caiMCeojLGkKBL0qC9IsRC1tvcBtg49wP1PVFIqM+Wa0Hhx154gRLVJQ3iFBQzvQK4xLoB89G9vcI3lEx0aLSOB4/OThqoPTVxFHyjBiqaSfhWZZ1iUJNEOZwu1KEcgE/WrMSeph923iLrlH80rHPeUgdwtGQ6ROiusDOh8a7yoX8Q/j9C/iUlsaksQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DUYPR08MB12013
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS1EPF00000090.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	2ee107b5-9db1-4d18-1b25-08ded83a64d3
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|35042699022|36860700016|1800799024|82310400026|7416014|376014|14060799003|23010399003|4143699003|11063799006|5023799004|22082099003|18002099003|6133799003|56012099006|13003099007;
X-Microsoft-Antispam-Message-Info:
	wUhrkp1Z+RvjNX66iQrP1GEAYWrNrS4k8vIHOR7V9gwH06hMOPcGtKQJlTBrpI80k+pSjvfH8zZKTF6HLNXqdvxw+Fx2Z0i1Nilc84Vb8EGzHLnBvxdSU2qvc/FedwVTh8WsEhjecTnex4i+jnyiHD2yh9tbiP+OPnG0Wc1MNUcN1+8HWXquTHZ8BN3bJyb4czeXwWbyDSZxCJyPypWxq9ZBiAXs+tv/IYtdWfNQiN4RXvV8hX3VNiiRTDYuN+coPuebUKMogeuM32ntn+w6vtgvFO9pULraXsEHKEIrljDL16Ck04F2mkcLTcIxDkqxb4AEkAWOmpXxKeVX76Eib8EU3WhIj7pBXrsJ34YXNNB/Wd5+L9xJSy7JNZuQ75CQHFMYmmNUtIcq9eYsMspn0feT+WwET8i7My1TtTAEFLzPJIZGLrvPv8Nv/oHwzCVXv9hRzHKwbfIshj4YeqF2FIdCwhnpLgi4uV8C5ighPMC4B8gonL3kWBMqXX9sa+UWPenCB2ADZvbGrav26WQ1fjEgvT1/JuFzFyGA6csicz4jlWfI/t5Ltaxg1Tx0qKiDyUdWxMoRxGynyLeuR0xg+cDcLPH9l6/h/rPbhydJB22hTXYm3Cm+RYuzzjXGbWYYq2iVgOrpNpn0vyWX90AGKHom94ShMSDNdJVMFBW7hZbpoZMGCzk8eg4nPzvo7TOeiVinWnMLu46kW8kQpiAK5w==
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(35042699022)(36860700016)(1800799024)(82310400026)(7416014)(376014)(14060799003)(23010399003)(4143699003)(11063799006)(5023799004)(22082099003)(18002099003)(6133799003)(56012099006)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	4orKJzptPxZKPIjfBCgG+eYA94wmAQG+14xac/4OcJ0nMWJW2LR9ecoIqZ+E6+p+j5TAeECla3S2v6y4VCew+p3QBpXqEVR+/dL+7BsjsbVbAAXsSRQW2RDsP2zc5VhmfJlHoDRF89C9kAoGLT6HxNUKCOiR/AJrkVB7sAR2AtU4zGKMEPpAZC8vWdiL3AebUp0y5tvwqLYUi/OiGiIEekxr2ibdCyZ01uzeSDn+KH01gzSBagg395oL2lgbMYP2GpEXjgIfN+/EO2jdbJAJmfOK1spWBap+zs0xDqSnwp+WhubG0wgcvk/xhWj9i8OQfOmkyJfquDslwpwd4GotK1XZA1r/kTUBuia1v6ay18oeFSPX5QwQwShSCQGURd44aip+dQCGKMA5/uhEGmPsaPD8DbARqxiQDs25s4p5Emwdou6xaPF9eUnxZyjj9yd2
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2026 13:05:08.3129
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e80cc0d4-7da2-429e-4823-08ded83a8af5
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS1EPF00000090.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB6143

Hi,

I'm reading the 1.7 H BET0 [1] version of the spec (released 
2026-04-20), and I see some discrepancies. Not sure if I'm the one 
reading it wrong, or if you had a different version than me.

[1] https://developer.arm.com/documentation/den0028/h/?lang=en

Either way, thanks for posting this patch, I'm also looking forward to 
seeing it get merged!

On 2026. 06. 09. 0:07, Srirangan Madhavan wrote:
> Add a cache maintenance provider for the Arm SMCCC cache clean+invalidate
> interface.
> 
> The provider discovers SMCCC support and attributes at init time,
> serializes firmware calls, handles transient BUSY and RATE_LIMITED
> responses with bounded retries, and registers with the generic cache
> coherency framework used by memregion callers.
> 
> Signed-off-by: Srirangan Madhavan <smadhavan@nvidia.com>
> Reviewed-by: Jonathan Cameron <jic23@kernel.org>
> ---
>   drivers/cache/Kconfig           |  11 +++
>   drivers/cache/Makefile          |   2 +
>   drivers/cache/arm_smccc_cache.c | 157 ++++++++++++++++++++++++++++++++
>   3 files changed, 170 insertions(+)
>   create mode 100644 drivers/cache/arm_smccc_cache.c
> 
> diff --git a/drivers/cache/Kconfig b/drivers/cache/Kconfig
> index 1518449d47b5..57fd1823dec5 100644
> --- a/drivers/cache/Kconfig
> +++ b/drivers/cache/Kconfig
> @@ -42,6 +42,17 @@ menuconfig CACHEMAINT_FOR_HOTPLUG
>   
>   if CACHEMAINT_FOR_HOTPLUG
>   
> +config ARM_SMCCC_CACHE
> +	bool "Arm SMCCC cache maintenance provider"
> +	depends on ARM64 && HAVE_ARM_SMCCC_DISCOVERY
> +	help
> +	  Enable support for the Arm SMCCC cache clean+invalidate
> +	  interface as a provider for memory hotplug-like cache
> +	  maintenance operations.
> +	  The provider registers only when firmware advertises the
> +	  SMCCC calls and attributes, so systems without firmware support
> +	  continue without this registered provider.
> +
>   config HISI_SOC_HHA
>   	tristate "HiSilicon Hydra Home Agent (HHA) device driver"
>   	depends on (ARM64 && ACPI) || COMPILE_TEST
> diff --git a/drivers/cache/Makefile b/drivers/cache/Makefile
> index b3362b15d6c1..55736a032d6f 100644
> --- a/drivers/cache/Makefile
> +++ b/drivers/cache/Makefile
> @@ -4,4 +4,6 @@ obj-$(CONFIG_AX45MP_L2_CACHE)		+= ax45mp_cache.o
>   obj-$(CONFIG_SIFIVE_CCACHE)		+= sifive_ccache.o
>   obj-$(CONFIG_STARFIVE_STARLINK_CACHE)	+= starfive_starlink_cache.o
>   
> +# Providers below depend on CACHEMAINT_FOR_HOTPLUG.
> +obj-$(CONFIG_ARM_SMCCC_CACHE)		+= arm_smccc_cache.o
>   obj-$(CONFIG_HISI_SOC_HHA)		+= hisi_soc_hha.o
> diff --git a/drivers/cache/arm_smccc_cache.c b/drivers/cache/arm_smccc_cache.c
> new file mode 100644
> index 000000000000..82b9efdb190b
> --- /dev/null
> +++ b/drivers/cache/arm_smccc_cache.c
> @@ -0,0 +1,157 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (C) 2026 NVIDIA Corporation
> + *
> + * Arm SMCCC cache maintenance provider using cache clean+invalidate calls.
> + */
> +
> +#include <linux/arm-smccc.h>
> +#include <linux/cache_coherency.h>
> +#include <linux/cleanup.h>
> +#include <linux/delay.h>
> +#include <linux/errno.h>
> +#include <linux/init.h>
> +#include <linux/kernel.h>
> +#include <linux/mutex.h>
> +#include <linux/nmi.h>
> +
> +#define SMCCC_CACHE_MAX_RETRIES		5

Indentation seems off here.

> +#define SMCCC_CACHE_DEFAULT_DELAY_US	1000UL
> +#define SMCCC_CACHE_MAX_DELAY_US	20000UL
> +
> +struct smccc_cache {
> +	/* Must be first member */
> +	struct cache_coherency_ops_inst cci;
> +	struct mutex lock; /* Serializes SMCCC cache maintenance calls. */
> +	u32 latency_us;
> +	u32 rate_limit;
> +};
> +
> +static int smccc_cache_status_to_errno(s32 status)

I could see this being useful in the common smccc.c, not just here.

> +{
> +	switch (status) {
> +	case SMCCC_RET_SUCCESS:
> +		return 0;
> +	case SMCCC_RET_NOT_SUPPORTED:
> +		return -EOPNOTSUPP;
> +	case SMCCC_RET_INVALID_PARAMETER:
> +		return -EINVAL;
> +	case SMCCC_RET_RATE_LIMITED:
> +		return -EAGAIN;
> +	case SMCCC_RET_BUSY:
> +		return -EBUSY;
> +	default:
> +		return -EIO;
> +	}
> +}
> +
> +static unsigned long smccc_cache_delay_us(const struct smccc_cache *cache)
> +{
> +	unsigned long delay_us = 0;
> +
> +	if (cache->rate_limit)
> +		delay_us = DIV_ROUND_UP_ULL(USEC_PER_SEC, cache->rate_limit);
> +
> +	if (cache->latency_us)
> +		delay_us = max(delay_us, (unsigned long)cache->latency_us);
> +
> +	/*
> +	 * Firmware may advertise neither a rate limit nor a latency hint; use
> +	 * a small bounded backoff instead of retrying in a tight loop.
> +	 */
> +	if (!delay_us)
> +		delay_us = SMCCC_CACHE_DEFAULT_DELAY_US;
> +
> +	return min(delay_us, SMCCC_CACHE_MAX_DELAY_US);
> +}
> +
> +static int smccc_cache_wbinv(struct cache_coherency_ops_inst *cci,
> +			     struct cc_inval_params *invp)
> +{
> +	struct smccc_cache *cache = container_of(cci, struct smccc_cache, cci);
> +	struct arm_smccc_res res = {};

I would move this down one, for aesthetics (reverse fir tree).

> +	unsigned long delay_us = smccc_cache_delay_us(cache);
> +	int ret;
> +
> +	if (!invp->size)
> +		return -EINVAL;
> +
> +	/*
> +	 * Serialize the full retry sequence. With the default bounds, a caller
> +	 * may hold the mutex across up to five 20ms backoff sleeps.
> +	 */
> +	guard(mutex)(&cache->lock);
> +
> +	for (unsigned int i = 0; i < SMCCC_CACHE_MAX_RETRIES; i++) {
> +		/* Long firmware operations can trigger watchdog checks. */
> +		touch_nmi_watchdog();
> +
> +		arm_smccc_1_1_invoke(ARM_SMCCC_ARCH_CLEAN_INV_MEMREGION,
> +				     invp->addr, invp->size, 0UL, &res);
> +
> +		ret = smccc_cache_status_to_errno((s32)res.a0);
> +		if (!ret)
> +			return 0;
> +
> +		if (ret != -EBUSY && ret != -EAGAIN)
> +			return ret;
> +
> +		fsleep(delay_us);
> +	}
> +
> +	return -EBUSY;

Minor: I would do `return ret;` so that we get the last error message, 
which could be either EBUSY or EAGAIN (depending on if FW responded BUSY 
or RATE_LIMITED).

> +}
> +
> +static const struct cache_coherency_ops smccc_cache_ops = {
> +	.wbinv = smccc_cache_wbinv,
> +};
> +
> +static int __init smccc_cache_init(void)
> +{
> +	struct smccc_cache *cache;

Again, I would move this line down one.

> +	struct arm_smccc_res res = {};
> +	int ret;
> +
> +	if (arm_smccc_get_version() < ARM_SMCCC_VERSION_1_1)
> +		return -ENODEV;
> +
> +	if (arm_smccc_1_1_get_conduit() == SMCCC_CONDUIT_NONE)
> +		return -ENODEV;
> +
> +	arm_smccc_1_1_invoke(ARM_SMCCC_ARCH_FEATURES_FUNC_ID,
> +			     ARM_SMCCC_ARCH_CLEAN_INV_MEMREGION, &res);
> +	if ((s32)res.a0 < 0)
> +		return -ENODEV;
> +
> +	arm_smccc_1_1_invoke(ARM_SMCCC_ARCH_FEATURES_FUNC_ID,
> +			     ARM_SMCCC_ARCH_CLEAN_INV_MEMREGION_ATTRIBUTES,
> +			     &res);
> +	if ((s32)res.a0 < 0)
> +		return -ENODEV;

7.11.2 states (top of page 47):
   This function must be implemented if SMCCC_ARCH_CLEAN_INV_MEMREGION 
is implemented.

Therefore, this check can be dropped, just checking for INV_MEMREGION's 
existence should be enough.

> +	arm_smccc_1_1_invoke(ARM_SMCCC_ARCH_CLEAN_INV_MEMREGION_ATTRIBUTES,
> +			     &res);
> +	if ((s32)res.a0)
> +		return -ENODEV;
> +
> +	cache = cache_coherency_ops_instance_alloc(&smccc_cache_ops,
> +						   struct smccc_cache, cci);
> +	if (!cache)
> +		return -ENOMEM;
> +
> +	mutex_init(&cache->lock);
> +	cache->latency_us = lower_32_bits(res.a2);
> +	cache->rate_limit = lower_32_bits(res.a3);

The spec only says to truncate X2 to 32 bits, not X3 (chapter 7.11, page 
46).

> +	ret = cache_coherency_ops_instance_register(&cache->cci);
> +	if (ret) {
> +		mutex_destroy(&cache->lock);
> +		cache_coherency_ops_instance_put(&cache->cci);
> +		return ret;
> +	}
> +
> +	pr_info("SMCCC cache clean+invalidate provider registered\n");

Is this log line useful for _production_ environments?

> +	return 0;
> +}
> +arch_initcall(smccc_cache_init);

Bence
