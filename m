Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013066.outbound.protection.outlook.com [40.107.201.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D725113B293;
	Tue, 17 Feb 2026 04:01:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.201.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771300890; cv=fail; b=EMhRdUq45uA4BWg3OCCCr9LazW+BucBq/jUw796uZAk8zSi+lqb1LROvlkcV4nnWJAI2dYB2tnsD721uSiwoumEOSFmAywO21ed9RDIN0IOqJqGynSZYhL1/vsreH+7wC8bdSI2nVghTIb9oke4IhMmZ8fulFY4Dg1s6Ry9dTuo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771300890; c=relaxed/simple;
	bh=vLfNxg122faIReD7Xyq8h922IQfucEh9Gu0P8aNz9OU=;
	h=From:Date:Subject:Content-Type:Message-Id:To:Cc:MIME-Version; b=TtAhk/8+n76ztu7z/nJw+EIggbzgxSnp1LVYq7Nd3GJD9fbdkgUFX06W2UCP6Wvj5eyQ8vBlJazH2rPZz0Z8UjUqP9H+BIAdhii23ip+nZKNZ+VO3qzCzv1K+JT5wzt1ZjrsealDST3Aa3rfXEQMKS/g1I0QwmQ+uiCeaQGVUXA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=km9j608n; arc=fail smtp.client-ip=40.107.201.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="km9j608n"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UkCH/mzg/UHMw/OtB70uSrheA5bnaLy5BwJ9H/9K7WrZoIhmVLTJI8TZVjAjoEnougSRdHgPF4jVGZRXLXln7to+/s4lGbyq+bwOPAauxE711AlzvvpieA6qZi8aE2IFsMfcysx5LhcVkiF0YKU/bpj4hhQzyb2/JCA1u+d70M2khqFUIxR7K9C3hyD+MkrjOdhAJanNveExe79XQsirJPreMDYGmfWY6YEwwZf6r9N37Lnbw0wpiQ6jMfY41nIBrahy4/AkltfGneQEpGaiaSHv5VU5BXDP5ssntadBjWOE8fTM2657uy5Mf+YcNFRg5fzO2kpS3WVRBWbFEyTA7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KUpB7jDaI+uNokYbyomlJ1PyokdVlpRSqv3GxE8W4jc=;
 b=NXqcb7k1dxivs8lNM1BlKSW0jVf5xGjUvcORRNYmYrwg5p/mKLr8yVeLWUQb+VQtaJZfMmoKRMOnUSXiFh9oZ3aBvIifOzg4y73PEJTOpscv2GOxLqwRauT8Uq4OoVIM4fk/Od0/M2SZiSG6a4yTYFAq6EahL9UvqVN8Yd58q/biLoyTwc0WlLXz3Vhcjm/Gna7Ejzlw7L7dXoZxvT6tD3XNOz8/zdN1sWHWteEyyrBw9zWwS2cIDGVqQNPFHV1wur2EdbFQA+ACrqSYOFmJOuRRlCX1Gnl1BQXQvHVYynSHlzbu1HlAwCLPkL5hxYIqqakPHa48dGxKvVmzX9ZICw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KUpB7jDaI+uNokYbyomlJ1PyokdVlpRSqv3GxE8W4jc=;
 b=km9j608nNOgohlA93sPXVvAeEjUzMZ2rHcIjtmus+VggmQ5OrDviAsxYp4D92Sjqcpao7KTyYvttbNVzI0rwnoRtI0SzBZPSfg2nxuis9XXLw7sF4ZxTllUC2JWEzaVtRf4KLPub+C4CjaruCJXhbT07/eZV6Ax0mvrlp5MeR15M7CMbrIb2phJBwwGUJeE7AqXLC6wAe2QA2eobhe8nlb00Y9KPiLrjtL64UuFi/+3a4NLTCPZiyo0QMEy+pW4ADbSpToP+b0hXfS2WEo8wBKnAnPik+vCZitTlB14MfKQ9U1+gDKTn8ie0e2qFHch5tQ/VPQqYa98t+gsGEhqCJg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SJ2PR12MB9161.namprd12.prod.outlook.com (2603:10b6:a03:566::20)
 by PH8PR12MB6723.namprd12.prod.outlook.com (2603:10b6:510:1ce::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.16; Tue, 17 Feb
 2026 04:01:24 +0000
Received: from SJ2PR12MB9161.namprd12.prod.outlook.com
 ([fe80::d9d1:8c49:a703:b017]) by SJ2PR12MB9161.namprd12.prod.outlook.com
 ([fe80::d9d1:8c49:a703:b017%4]) with mapi id 15.20.9611.013; Tue, 17 Feb 2026
 04:01:24 +0000
From: Mikko Perttunen <mperttunen@nvidia.com>
Date: Tue, 17 Feb 2026 13:00:31 +0900
Subject: [PATCH v2] i2c: tegra: Don't mark devices with pins as IRQ safe
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260217-i2c-dpaux-irqsafe-v2-1-635a4c43b1a7@nvidia.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/32NQQ7CIBBFr9LM2jFAaouuvIfpgsLUzkKooKSm4
 e5iD+DmJ+8n//0NEkWmBJdmg0iZEwdfQR0asLPxd0J2lUEJ1YkayMqiW8x7RY7PZCZCcla0ndJ
 jKyTU3RJp4nV33obKM6dXiJ/9Istf+8+WJUo8jVK3PenRnvurz+zYHG14wFBK+QKLGeXEswAAA
 A==
X-Change-ID: 20260202-i2c-dpaux-irqsafe-edc04628b401
To: Dmitry Osipenko <digetx@gmail.com>, Andi Shyti <andi.shyti@kernel.org>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>
Cc: linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Mikko Perttunen <mperttunen@nvidia.com>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: TYCPR01CA0149.jpnprd01.prod.outlook.com
 (2603:1096:400:2b7::9) To SJ2PR12MB9161.namprd12.prod.outlook.com
 (2603:10b6:a03:566::20)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB9161:EE_|PH8PR12MB6723:EE_
X-MS-Office365-Filtering-Correlation-Id: 936a082b-3b5b-4e44-bc9c-08de6dd93743
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|10070799003;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?N2M0VjY5eWRPRmRJam9hWGI2NTFUUXZSTFhiVHJnQjJMNXpJL01RVFo2MTdh?=
 =?utf-8?B?SFBwMUdTWVdSKzhNbHl1WVNDVThLYXkvNVAzUERsc0oySFB3amlFOGdTVHlR?=
 =?utf-8?B?TG5pNURYN2FoY3BSQnRFT1RlOGR0M1A5USttOWVqVmV5VjlMUmpZUDhWcjIy?=
 =?utf-8?B?cHp1a2VPNndxZEZVYmRPb3E4VERiTmloVmN2cWI4VTRTejQ0STVPZTV6NEtH?=
 =?utf-8?B?UUZ3WTJpYXRYcERibS9uc0hiWE9EbWR0MXJJQXNFajdkVldLbEJZdHZzT2RI?=
 =?utf-8?B?ZHZiUXdFZGtaaEk2Z2tBMkJOckxLY1N4cWpwL0laRTMvcTgwcDVkMjh0ZmJr?=
 =?utf-8?B?SVJIdXV0a2hBUk1Fcm4xaVVqTUpqaGJJaDlxRHJna3VncXV2c0RIM3AyQTE5?=
 =?utf-8?B?QnZ2V0drUVZlYzk0MzJWVzFGQStPbHpWT2c5ZkFZVkFzbWljK00vQStOditw?=
 =?utf-8?B?a2k3TjdoVEV4MVloTkdpNk5WVUFwTlFMQjBteXJOT0k3a1VkV1VNQzRDZUg5?=
 =?utf-8?B?cEVqMXp1NnM2eWpjK0E4d095bHZlSXNRdFRpTFIyL1NBWGxidllieWVLM1Bl?=
 =?utf-8?B?SmNFWERmM056Zi94akl6dHlrMjRCa3h1SXBVcDVkSm1uTGM0Y2RIdWNTbG8w?=
 =?utf-8?B?YjNhZFpVemVwUkhpQ2lHMCs0eUZ2VEdIOFFMaFplR054WjhQNmRldGxTTXFI?=
 =?utf-8?B?WmQ5YjdZODlHMXpJOFdlUEh5WDc1QnZ3cTV1Vmhvbm5UaVIrbEFsVHRWS1JJ?=
 =?utf-8?B?TVc1OVpVZ25TYzlWMlRXbGkwNkF6TmpXdzJiRytYb0FKZjFMUmR1clFtTFFq?=
 =?utf-8?B?VUpaYXpsZ3dmRnBIQWlNS3hzY0svcnBId3FNTFZvaG9HNENwdWc3WDFiN0xu?=
 =?utf-8?B?S2dHVHpDU0JIUGpBMUhGZkJXUVhpNmZNVFA4NkZLYXljbktnaHNPalBFaEpM?=
 =?utf-8?B?T2p0dmpSOXVXOCthZzJIU3VGblgzMURHLy9VQjBOakdPNEZJdXVub3RzSWRE?=
 =?utf-8?B?U2p1MnY2eDI1ZEhUQTNIemFRUHlBN1RTR2JHZ0c4TDRuZHVsenl6aXcwVTZi?=
 =?utf-8?B?R2lTS2R3L2Ftb0JvR3Nxd0pMVFBTbzkyc3NUUGtxaDJjRjJNRmw3Q0xVZXBp?=
 =?utf-8?B?bk4vdktYZUYyWW9XaHF2WG5UYmxkU0JKWU51M0RzZFFEWUV1T2ZHUkR2dEEr?=
 =?utf-8?B?VmdWeUhrdlZXZnYrWlBSN2t6S0lTK1FIejVWNEpib0hLVGQraWd6aFo4aVdl?=
 =?utf-8?B?anN2QmkxTU9Hd1ZlSjVVUXVyODJRVFAraGFPUmtWTkZnVkZFK3NjYnAyc3gz?=
 =?utf-8?B?ck9QVERISUxzSkNaL0JXV09SVnExSmZPK1R1dmw4ZDZtY3RmQmdkbzV1VDlP?=
 =?utf-8?B?RjJmTnhZa3Z1VHBXU3lMekNaVHhRSUtsY0JOUmlxMzJ0OUJOR3E3aGhLMWJm?=
 =?utf-8?B?ZVhldFd0dldhYi94TUE1dW1Ob2kwTXF0UWhEaE5HV0NmVkhNeklJV0xyR3lQ?=
 =?utf-8?B?ZGdDY0xLQmphMEE4ZlNnY2NYV2FZa0NIWWFZYU9uMHpMNFhIWTR1bWg0akYw?=
 =?utf-8?B?TGRrRFBIUDFGWUVKRExvVFJCTjFTNW1va3c4UVFWWDAwamR2RkFCcVF1RVlK?=
 =?utf-8?B?MVArSXNSRlFBOUlNcWpxRGxvSjY5NTdYUUw4UDVlTi9TTERTcGlGdjc3enRy?=
 =?utf-8?B?bUt0djY3UW9nSHZZWXRuYUdJZWJFeVJVdWRPTG1JMFQ4ZmVIWXdyM3NSTnBn?=
 =?utf-8?B?b0pFdlIvY0RXdk4wVWVCWjlJb2dNNGxlSUdkWDhmWjh4YUZJb2ZBZDVzcmRZ?=
 =?utf-8?B?TnVLVlRoeFlwT0hLVUtzNDMvSWpEa1pjVUNUWHJjcGZ1NXpxa1k0Y2lGSDh0?=
 =?utf-8?B?QXJiL1NKbmFlU0grMnZRODNhckhWcXAvV1ZRcmlzR0tVR3YvWnR3S3JmM0Zq?=
 =?utf-8?B?RkpDamtzVGZyQUJIakZpeWhEazhnY29hQnJvWlB6anArVk9Va1pRNTNNN3F3?=
 =?utf-8?B?bTNrdmxRc29BWnFLc3ZORDIzeU10ZW9DL0lXMEtMaEphZGYzTnU0R09nMG5L?=
 =?utf-8?B?aTZaVUt0ZmFnMnQzbU5xSHlXNXVxY3lQNkZhZFYwaHo2MDRHaTJpZlg4SVFv?=
 =?utf-8?Q?vUWY=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB9161.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(10070799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Q3RwNWZGSDNVNnhoK0V6RE1uQ2NWZjUyeVU3UlJSeVpBMFphbE44U1dIbmJP?=
 =?utf-8?B?K1Z3MUIvbm9HTS9KTGF3Zk9UdEY4TW9NOXVWR0lXNzRqS0tUNG9VMHVMQnA3?=
 =?utf-8?B?NFdLS2tPNjBpcU9xcTlCTTNqUno0clFjOU9ubHlJTjlGZGQ3OHc2TURHMXht?=
 =?utf-8?B?MzRaaURjZHQ1aDFSRWE4bnh2RkFaTFF6NEdHSGZDaTRJaVNLNXlCVkU1OHJ0?=
 =?utf-8?B?NnRrdHhJRElEbjJKKzRIZFY2YnhQeWJ4aFVKRlhrUHR5ck1FWDF4V3h5eE5O?=
 =?utf-8?B?SVhDZFNud1VzVDVQRHBpcW94VVFVU3B4RVpLczB6ajN4OTFQMEY3elVaSWVz?=
 =?utf-8?B?Y1I3ZG9UNlNzb2NIVURPVjFVaGdIVU1DYUNVZ3kwWkIyOGxQekxEbGNadUt1?=
 =?utf-8?B?SWpWaHZ1dFF6OFVmU1dGTHhsaWZLRmpDRUpMYWJqZGVCY2hoWHdCTWpsUG1y?=
 =?utf-8?B?QUU4OFRUSVEzZ2hUTU1uNGVrWFc2eEdGVXpIZkFJc0t1c1poTFcwNUJiNzJP?=
 =?utf-8?B?U09QazMrYkVPcFZKV2NiZGNaRGRrVEk5ZzZvWTY2cXpWMytjbVJsaDNScDNn?=
 =?utf-8?B?dy9QMEhiZWpKMmEwTEdXbDl4UHk1N082Y1BMMlh0ZEZmQ1U5NFVvQStHUVlX?=
 =?utf-8?B?V1lyQTh5OTZHZkk0YndadGRpdm1ZYUFhaVkxTWxRZUlpWTRtM1NFdk5teFNn?=
 =?utf-8?B?c1JPL3dIeVBlb3ExeFVIMHNtMS9ZT3hBV1dHS2ozNVBaK0RqUFZYNUZSb3JN?=
 =?utf-8?B?WjB4aTlWMDloOG1pckdkbVFwdUZ4WmFOdUdqSkZUQ25TWEI1SDA1TnJRV0ps?=
 =?utf-8?B?RG15a3BaUU13WXVrZzBqYThQbi9tZGdsZnZIMDlVUnNMNjRXUWs4bjlMekpN?=
 =?utf-8?B?ckFhSlVQcm9NL2pMK09QaStWVjhKcWxkeFlMUGJKdG1Ja21TNUtDZ200dzRN?=
 =?utf-8?B?dndOLzQ5cUppdE5YNmJQb3BialloR1g0Sm90WHIybnlhWlFzaENCTHlmZVl2?=
 =?utf-8?B?c0E3TUo2czdqQkpTQVNqbVRiZXdiZDdYVUxPWWtOOG5oWE9SOE1zNER6M1ZU?=
 =?utf-8?B?MjQzQ1lLQzlxOXQ5TnAxc21TdTlDUTFHYUlMUzUxQW0zaDZOU1pUYnE3RWhh?=
 =?utf-8?B?bjB2MHVjSEM0VE52c1VHeWNwbVFZUlVDcE9uYnliNEhjQW1OYTc2V2ZtVkZM?=
 =?utf-8?B?dVpEd0dNZnZyVk9ySjh2aGx0UElkS2dpeG9YbjBpQTVlUHYvQjhKc2cveHNK?=
 =?utf-8?B?a1ByMDFsWEdOa3M5eFVYbkpIOFhvbUFHVmY5UGI0TEVRcDFpeHVkb1FRV1JS?=
 =?utf-8?B?WHVjcmJEK24wL1VRRUtaUStLV01HS1VQVWlSTW9rcnBQeDBqc3REeTVxZWRh?=
 =?utf-8?B?VFhUQTdXenFQQnJ6UllJVUptdXh0aWVNMURvL1o1bXA4eTYwbWh4SHdmNmJD?=
 =?utf-8?B?ck9hYXN1UjVCdVBhNXkrL1d2M1lHemdiM2RYM0FTdXVxdFZwd2FJcDdYWFo3?=
 =?utf-8?B?Uk4rWElxaHZhc3VrQytZbElacXpqcFNDRmMzeWF5MHBsZWJ2dGNWSGxRZzJq?=
 =?utf-8?B?N0haamtucTlyOGVnQk9UczRUMFdVMS92SkdXdXAvYk0yRU4rSytjU3lvZ0w2?=
 =?utf-8?B?ekt2WWVTOEV3MXU1YzQybEFnSGNNRHBRL21IRG5YcG5VeFI3ZUNUaklJYjd1?=
 =?utf-8?B?R1I0bUdrTlo1OEZKL0U4NkRrV2xDaDJGSzlSUnNONTB0RkZpaXpMTDFsMm1K?=
 =?utf-8?B?WVVhNDhhU0IrVnpMOEZmQkozNnhpUE9HckZlSHcvVzJybndiVHM0K3craXBO?=
 =?utf-8?B?MzNpa0lXNHVZYk80cU5qRnZjVTZWRjc4VU1IMmFBTnM2b0hYVGU0MzM5NmlJ?=
 =?utf-8?B?YUpqNitHVmVlcDVxT2szNHRtS2tYRk5aV2ZUNnFwbW1yQ2UxTUZMaXNxRzM1?=
 =?utf-8?B?UlFQQy9LdWRNaVIxZzd6aW1SdjJEbHRFQWZ5VHhpWk45NTV6dnVqd3RPNC9B?=
 =?utf-8?B?QmhjSW9lbkVqb0RVTVRtb2JuMVJWeExZUEdRS2RHRHB6SWpiS1A3b3RKNFFs?=
 =?utf-8?B?VUdQSUo2eTRpQnI3RldLZTA3WFR1WSs3cU9JU0hUdWpjSHo1eDNORjYycTE2?=
 =?utf-8?B?VlkrM0hnSDRsOHI2TlpKMlNILytNVWZBN3FQNTVtMW83TTYzTkgyMzZMNlh1?=
 =?utf-8?B?WndISkhScEdBekZBdjNMR040b20vTTFmcHhTTzBQQ2lNTnhOSStxb3huR29r?=
 =?utf-8?B?V1JrSktCTjZZeis4RGg1YXFmRWNOT21LdzdoVjd1czBER2Q4aU5xS3NueVMr?=
 =?utf-8?B?bW9nNUVuQjM5MkZYWnJWU3BqTUx2eWNsVmV6TmNmVGp0OThlVXovb1pSRFd2?=
 =?utf-8?Q?nEDq3HcOZjkfiFsQBpOfRhJRVuXIAEaouryVG7PlIJjqK?=
X-MS-Exchange-AntiSpam-MessageData-1: WVyqbuVdg5UEqg==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 936a082b-3b5b-4e44-bc9c-08de6dd93743
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB9161.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2026 04:01:24.1729
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gDyZ+rq6/4qoWNs4c9O5IVu6sHsFR0rODPSqVYLE/1zmk9geCsyUP4iN3tRqwRfDboNBs2DfJL8RJo198DcVMw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6723

I2C devices with associated pinctrl states (DPAUX I2C controllers)
will change pinctrl state during runtime PM. This requires taking
a mutex, so these devices cannot be marked as IRQ safe.

Add PINCTRL as requirement for COMPILE_TEST to avoid build errors.

Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
---
Changes in v2:
- Removed incorrect reference to lockdep in commit message.
- Added PINCTRL dependency when building for COMPILE_TEST.
  Tegra platforms already globally select PINCTRL, but COMPILE_TEST
  configurations may not.
- Link to v1: https://lore.kernel.org/r/20260202-i2c-dpaux-irqsafe-v1-1-5b1847e8bc97@nvidia.com
---
 drivers/i2c/busses/Kconfig     | 2 +-
 drivers/i2c/busses/i2c-tegra.c | 5 ++++-
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfig
index e11d50750e63..09152088b79f 100644
--- a/drivers/i2c/busses/Kconfig
+++ b/drivers/i2c/busses/Kconfig
@@ -1211,7 +1211,7 @@ config I2C_SYNQUACER
 
 config I2C_TEGRA
 	tristate "NVIDIA Tegra internal I2C controller"
-	depends on ARCH_TEGRA || (COMPILE_TEST && (ARC || ARM || ARM64 || M68K || RISCV || SUPERH || SPARC))
+	depends on ARCH_TEGRA || (COMPILE_TEST && (ARC || ARM || ARM64 || M68K || RISCV || SUPERH || SPARC) && PINCTRL)
 	# COMPILE_TEST needs architectures with readsX()/writesX() primitives
 	help
 	  If you say yes to this option, support will be included for the
diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index bec619b9af4e..4eaeb395d5db 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -2047,8 +2047,11 @@ static int tegra_i2c_probe(struct platform_device *pdev)
 	 *
 	 * VI I2C device shouldn't be marked as IRQ-safe because VI I2C won't
 	 * be used for atomic transfers. ACPI device is not IRQ safe also.
+	 *
+	 * Devices with pinctrl states cannot be marked IRQ-safe as the pinctrl
+	 * state transitions during runtime PM require mutexes.
 	 */
-	if (!IS_VI(i2c_dev) && !has_acpi_companion(i2c_dev->dev))
+	if (!IS_VI(i2c_dev) && !has_acpi_companion(i2c_dev->dev) && !i2c_dev->dev->pins)
 		pm_runtime_irq_safe(i2c_dev->dev);
 
 	pm_runtime_enable(i2c_dev->dev);

---
base-commit: 4f938c7d3b25d87b356af4106c2682caf8c835a2
change-id: 20260202-i2c-dpaux-irqsafe-edc04628b401

