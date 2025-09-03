Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2067.outbound.protection.outlook.com [40.107.223.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B71872D7DFF;
	Wed,  3 Sep 2025 06:40:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.223.67
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756881604; cv=fail; b=c+M4VUl34E/peFAdwZirFc7dANSYy1BI4s/f+Vmtigb7RjKA3WZoC7yig32BDZl/qJdJMHOiF4yxBggBx1MmBXqEI080lqUTg15zFJ3VmtaqvnXqgktQ8j2BNZuAixH0wnt964fznP50wiCz6mZbr/D6pZjQGiyeAtVFoGobB6I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756881604; c=relaxed/simple;
	bh=Oehi6fD8c3W1uB161WC5dkS5QnsE0jKr7uC4LMnnGVM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=IGr89/4NRqFREfgefth/QOLn6zKVaUSzFs74g6eZUCM6DVshP8oxGUsjmhHN0VlvTvO9Gyk7q7tAInuUx+t13BOkc3cw/9mdY2uozQaHPh3tNZjH86WM4oG+7XCIy7Gc82bX/iZuEEchV/NrAz1ulSaicNkfqcm+GysF4v7Oyok=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Tu6ZBWBj; arc=fail smtp.client-ip=40.107.223.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Tu6ZBWBj"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EPSCuqqvES+dtGuCD2DnvShqy4zpFEFedofy7HjqIjW9X9+7j5JsvQIEYoMyVWhIGNDkX4Jcrv6MpXi8+baW7ODnJKRkYM7sMs6qruCODMJGlxrcI8aSzOhXP57Mev7Y6lo3xcviqaRmL/7OeZTZWIERqmBDMCxhpJWgYq/t596a/9Wysu8GQGlaMiedgMzYVFncyrtCZn1uU3RJ2h93YnZ1felopkrsIoq5r41HmajyKUdgEj3/JB+Lmt/terd91I2kjZwS/sAVhcla6qicCubrkeovVwbjlOEsdz6SSzyjIHAuJtlzPvuLKkseq31oRgbh2HmK8Ti6irBxSWk9SA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EkP9eVlnlh25K3ITAdO/TirPthHXuFjEKfyze5Nga1U=;
 b=eQtzOqrfWZrUrAgjQMoQMeP1uuy+GV4UG1Jwh4LD/80lb3y5eke9dgMgJfavBoDvGHuha0UpKUQS6Aece8KXnYcgiyOS0KaOc7ZxI3ZYhXvaKF7F6zDn1gbP4CudyQhNi2ewMuiBrpTp9i+2PY2rCC1gsJZuC6mNBpndnsRcpqvyK3tmNWObgERCuTq88J+BZIzluFBOBkYvTXNXX/V7YMlGmPI5k7SPl0WpQ423O2sFMaErq9Qx/UDoLvdILhG+RSDLsxnN77KknS9Qsqdrx4aWSqVMCDmpXnDky3bRoECE6NlNi1ztVhTWD2tiCd1pHPIfu3MBlpFkd3rQ2cp4aA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EkP9eVlnlh25K3ITAdO/TirPthHXuFjEKfyze5Nga1U=;
 b=Tu6ZBWBj3i4kAtEDhzu2qO1/WWT0lCX+woMeLdAIFp4VGEwieMMbuV+L9cFDT1F4KOrscLvG8gFQo2OcYAgFwdVvgqLps2GsSZI9Ow288qgoWSzl1HmaVhTOZscTNqPip5ftf0/rqkngU8/zV3Jpli7T+hkBuJJTUEIFu8005JtV6A2ulayODe3qBrcrPe8fJksL5/JFRomFtSusl3OyM+nxpthxowxYUjDLEJqFypErmz6fbOEtlgm6MtHCwFV6T0V4xfXDjWkZHxuc/Up2oZsNiywUWa/jVkQov2rp+pcygoHjnFC8knTUgzDL69gI2FuAeiDGKWEh9sdFjoHULA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM4PR12MB6494.namprd12.prod.outlook.com (2603:10b6:8:ba::19) by
 CH3PR12MB8233.namprd12.prod.outlook.com (2603:10b6:610:129::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.27; Wed, 3 Sep
 2025 06:39:59 +0000
Received: from DM4PR12MB6494.namprd12.prod.outlook.com
 ([fe80::346b:2daf:d648:2e11]) by DM4PR12MB6494.namprd12.prod.outlook.com
 ([fe80::346b:2daf:d648:2e11%6]) with mapi id 15.20.9073.026; Wed, 3 Sep 2025
 06:39:58 +0000
From: Mikko Perttunen <mperttunen@nvidia.com>
To: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Joseph Lo <josephl@nvidia.com>,
 Peter De Schrijver <pdeschrijver@nvidia.com>,
 Prashant Gaikwad <pgaikwad@nvidia.com>, webgeek1234@gmail.com
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
 Thierry Reding <treding@nvidia.com>, Aaron Kling <webgeek1234@gmail.com>
Subject: Re: [PATCH 2/5] soc: tegra: fuse: speedo-tegra210: Update speedo ids
Date: Wed, 03 Sep 2025 15:39:55 +0900
Message-ID: <3262472.TLkxdtWsSY@senjougahara>
In-Reply-To: <20250816-tegra210-speedo-v1-2-a981360adc27@gmail.com>
References:
 <20250816-tegra210-speedo-v1-0-a981360adc27@gmail.com>
 <20250816-tegra210-speedo-v1-2-a981360adc27@gmail.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-ClientProxiedBy: TYCP286CA0354.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:7c::17) To DM4PR12MB6494.namprd12.prod.outlook.com
 (2603:10b6:8:ba::19)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB6494:EE_|CH3PR12MB8233:EE_
X-MS-Office365-Filtering-Correlation-Id: 9eb6e392-c75d-4c55-44f6-08ddeab4b3a5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|7416014|10070799003|1800799024|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WUJlWWhjVlc2djltbU9YSitMWWttbWFsV2tTTXgyTWg2Z2F0YWlnZlJjZGlX?=
 =?utf-8?B?bWJrUzZYeHh3ZXpYcFphcmZnYnMwMXpUQ25hVEFNQlYvRERiVXh3c2tjdnF3?=
 =?utf-8?B?SVRPTzJEZmFnc3p0RDdLa1FZUSttajAxWHh5NHNCdTR0b0JDZzAyN2UxNldM?=
 =?utf-8?B?aVh6WEEvcWYxYk03T0Q2ajNpTkwwbzV6WUtiQk5oalJHeTQ3cHlpV2YxK2o3?=
 =?utf-8?B?US9aS0h0dXV3anc1Y2ZsSmtlOG82OFpsUXVtaEtJMW96dnpXQ3JuMWFBekFD?=
 =?utf-8?B?NHB1Z1JsSldONFdFZ0d0T2l0aDJiUThtV2VQSExDem5iRTQzWFBxOU9sLzJC?=
 =?utf-8?B?aHJ6RldzMDAvaXBSUlFGZVdaSk1VNE5pYnY3V2krQ2hHL21lVFVZNWVINkhl?=
 =?utf-8?B?R0pLM3diT3VkdWs0VWdEOVNCeUJmK21uOG9kWDZrS3RlY2h0b0pDaWZ4QWwr?=
 =?utf-8?B?RFlESy9LVU4wRDZtTGJkY2Zub00vNHkzQWxYbmM4ZmIwa2hLbnFtK3hCMUpI?=
 =?utf-8?B?bUtFZEwwbGs3aElUMUI4RXp1S1Z6S1J0bDBJYmF5cVJKMjZmTUk0WnMwRzdF?=
 =?utf-8?B?SmJxd2pXcmlFVjB2cGsrYzd3S2lCUTFLWFRMNnErc0twK1N2OU43UGNNUG56?=
 =?utf-8?B?QzVSL1hKK3FKN3V1Y0J6TVh2QkFOOE9XaG1vR29NdHBMT1pieGk4andMaG1r?=
 =?utf-8?B?TzVoeDByTGxYcVkvYXFyUVFJYlRRM1ZSMmxDWTY1NEpLVzVsZ2dEZzcyZjk5?=
 =?utf-8?B?dTdlSGsvZHBaRDZ5WHp3eGpzTWtwSTBsMkhidy9CRlJnSnN3WmR0MEZmTWNC?=
 =?utf-8?B?U2tzRWpFTEdiSFptM1lyVlhSL2cvVlZFYWRzNUxiajJLQTdsalI2bUtQZEJ6?=
 =?utf-8?B?WjhvMFJSUGY1RzFVcTNqSjlMSkpFdXNCTmd6dU0wMVFPcUJlTzRXZitYdmRl?=
 =?utf-8?B?b0JVQ3Z0MmRsQkY1aUNheW40QW1CZDh6dER4cXNweU1Gb1dLN2VTWkhzdUp6?=
 =?utf-8?B?ek1IN281dDZ0VDNIWGU0NTJJdU1nbktIc1lwWGQva3FuNmU1SmFTTDNSd0Fs?=
 =?utf-8?B?UFVFN295dTdFOWVGQlNkN0kyS3pPVmo3SzZQZDlkcDA5eldXVWpXUmdNYWxX?=
 =?utf-8?B?RXkrUmlkd2xIRUY1R2o3REgyVlJuZHJiWnY2N1NqalZMOHJ1WGt6c2M3TFo3?=
 =?utf-8?B?SE14UEJTVzJ4cXJtNXplYm9lSFZmdVhiKzFvYTBheHMwV2tiekRGc25XMVdR?=
 =?utf-8?B?bTdOQjFBRVVKcmZ4L01zSkJvZWo4YW1xUDhNcG9kMU5vVDJWYy81YlhJQVFs?=
 =?utf-8?B?WEZobWZONXhVUUNTbzh5STFFQVptWUZjeVl6QmloKzhnZENRdnVKMUh6MmIw?=
 =?utf-8?B?alFldUdoVDZlYmplOTBTOGJGNHQ2QnZjYmZkTWpRYVJuUldWZ2g0azdpUVlo?=
 =?utf-8?B?MUgrajVxa3B1WHBBNXN2a2szYVhWY1VtVzdxTnVyZkZBUjRxZEU0ZlBLOTd1?=
 =?utf-8?B?akY4dFliYWNZd2oxSWdjd2JISFdMbEg0aURUMVI5TnBNQUtkZG5WbStleUlx?=
 =?utf-8?B?UCtSdUZnbjNBNXVTMmtmejhlTFBTZHVBWGU5OUhxbFFzVmg0bE81MDFMellH?=
 =?utf-8?B?aVU5eU04OVgvZW9oTFhtL0FlRkRyZkJxVFhWWUJNbEVCYnh3TTRnQ1M4T3pU?=
 =?utf-8?B?Zk1lWERQaUw5d3A2NjdEZmZielNWOGFqdWRJTFV5NDRUMmNaNkV2ZTV1dWJU?=
 =?utf-8?B?VEVtVWhZQ3RxcGpodGVDd1FiOUowcHVvNjQzSHY3Q2ZTTkVlTWQ5N3Y5YlBP?=
 =?utf-8?B?NW1kUWlCNW5RVFhjdVRzeWkvbjVmNVpXK3ZKNHBDZHpDbFl0cDBJTlVpWE42?=
 =?utf-8?B?NCt4djNoaTc2N3RySWFIb3ZhUFV0M1lydVlNOFJnaG4rdy9ORnZHNjVtK1hW?=
 =?utf-8?B?UWdLVkdpUU8rTnNvN2huNWRxN0Rpblg2Y2cyRUR6SmVHdFdRaVlyTnNreTlP?=
 =?utf-8?B?S3MvQTNEVjBnPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB6494.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(10070799003)(1800799024)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YkFwTzhvVzdwMWNqMkMvZ3YxTzQ5dE1zT2hvSmtoLzZKaFRSNmxhNkRhcDVp?=
 =?utf-8?B?a1lSVWdVd042YzZWMTFyMnFJUC9UNVZFRE82R09mT3N6emRYZUdmVi8ycWVu?=
 =?utf-8?B?Y3B3SmFydEg1SzEzRUI5eG9YMmtlTXBUQU5RRldQeG4razltY1VuOG5pVDN4?=
 =?utf-8?B?d2VValZXR1VCZ0h2WE9NblZCdlgzMmZVNFBNK292OW5UUGhZSll5cFlDS0hD?=
 =?utf-8?B?aThnZ2tJd21NZTNVWm8xTUpLeGZTVFliVll2NUdjbHR4UWpuUkFYb0J1VTFU?=
 =?utf-8?B?U3o3TGFkVmtkZ2lLWFdZNlZrY0Z4M0pVdFJTTHFKQ0JXblF1VEVaWFc1aENz?=
 =?utf-8?B?OUFsTU5lMVRwN2JOVEZhSDZBbE01QytGblJnSG80UXFsclNOM0hrNkNobVoz?=
 =?utf-8?B?WGdGQ2ViNlVoTEpiSVUxSVpKYWUrMHhlckZYcCtFWTdFWSs4eU1JQjFkVWZo?=
 =?utf-8?B?c3NueHVJbDRUSTFXZTlaczYwNCtsRVhiSjRiRWpRdGVFV1RodlhmSUpvV2tR?=
 =?utf-8?B?c1Y5QkxpcTFUVUNxUk5EV2hNd2J4VHJ4SjJwVHNJRWdobC8xd05Ta3YyTU1m?=
 =?utf-8?B?Wm9PbzdTOGg4YmM5WW9VOUtDYlZ0MWQ3ZzdBL21EbTZ2Y3J3U3BNVzNkM3ov?=
 =?utf-8?B?ZXRMOVpSQlIwWlJGVlowZTczcFpJK3pLR2xwN003SGpSZUl0RlYvR1pDcmdl?=
 =?utf-8?B?Y1NLL1NacS9GV0h4TVIxNkF1YnFzNm92ME8yN1hBRUVYZEdieGplYnJJYmph?=
 =?utf-8?B?NDN3S0RmWFUyWmJTZzlvNFZOQzZQckpNZ0dnWFU1Y1o2SWx2eGxZeTkwTTBQ?=
 =?utf-8?B?ZWpadVlnR3htSEZXdy9aOTd2RmI2QkVWTExWUWNkUHN0eUl0Sm4xOXJ1bU5n?=
 =?utf-8?B?WG1HbUkySEc2b2k2WE9PWW02UWRybjcxaXlvZDQwZXdWcmh3cEVsRWFTYTND?=
 =?utf-8?B?b3VNdUpZa1RqNnZ0UzlRNlZENU94ZnlWeTRyRDZYVkFOZTZiaENRVmh2UFFu?=
 =?utf-8?B?QURQaytOblQ4cUlEUDZKek5LK1QwdnJ6S0lnVzVLTFhlMW5KeDVwUXhLbExz?=
 =?utf-8?B?STA1Tms3bFkyaTZ2d2NsRGx4alhuZmhHOERhZWc0cnNyb3FxeUFqZGtJUlRE?=
 =?utf-8?B?b0prMUY2T3pPVVRLYlRLcDNNVmV6TldVM3d3TGlSd0U4a0xNdDZrTlZjQ0dt?=
 =?utf-8?B?VGUzV2ZHMmdNNUo5K2hGMTV3VnA0WVlOSzByUWlLUUZDTkxCemZhdjgza0Ix?=
 =?utf-8?B?TFlaaWhhdVBVdW1pUFNRcGh3dXVhbGt5YjVnYjA1ZENIdm5lRyt2dEhCWVlN?=
 =?utf-8?B?MVZ4VFZWcTlGaUIwRXQxbVFqa0VuOEpWdU1hQTVMUUJ4K0RMaWhWV2MzTlhk?=
 =?utf-8?B?YVNuV0tMZWlrblRXYlRMU0FablM2VFNuNXp4VGMvck15T2E5WnA3amhQdDJH?=
 =?utf-8?B?Z3FRMjlQQmZRUThGdWRVR2c4NUxLVGxYVDRyLy9yOU8rSzJJNk5lZytFU0NC?=
 =?utf-8?B?ZHdlUVUwNG05emJSR2NhWW1EQWZrMHJqVmQ5YkNZU1JOTnoxQ2RseE4zUk5V?=
 =?utf-8?B?MFNIdHh1MmpCNG5hNURLTGRMRmNjM09xRDh2LzZaZGxKZXZpQXRtY1gzYkNh?=
 =?utf-8?B?MHJXNXQzYVF4U2MvTjErelVwRldTTmttS0c4OCtIQm9HbzZXTytCbEpsWlVS?=
 =?utf-8?B?aCtrR0lLWm1pZ2RYa0Ric3pYakJiZElsSXVqRFRTUjhIeFJXS1VHbFdsOEVS?=
 =?utf-8?B?V01EaWRPZnZQblpOZ0F4M045Kzg2UXdzYXBwQnhEdGFrL1hUTmlOdGxyYk8y?=
 =?utf-8?B?Tms5UWRpTVJzemtJc2E0U2MweDYxYitNaGxWVkxYMzRoTU5DNGprcTQ0VnVE?=
 =?utf-8?B?T2xxSjRjUjNtVHM1YnhSSjYrMm5NejdZVHJMMU1KYi9VM21GZGh4b1lqdXRY?=
 =?utf-8?B?c1l3S0hENUxydXR4eXMyYVpzVlZRQWJadW51V3BHYlpDbUVVZzY0REg0WkFT?=
 =?utf-8?B?V254dk5YQ2x5U1RoOTJ4dG91TWxXQjdXVUpxK1RCYllaUFlaYktJTFNMdUQx?=
 =?utf-8?B?Z1p5b1ovT2xmWGNUOTNTc25SYi9ralMxaGJYUjMzVWhrSTdjbGJtUU5UbzdZ?=
 =?utf-8?B?dGFLVlQ3dDliM2s0Uy9CTDFyZExCY2FGQUt3aUsvWnkwYWdIUWU1eThmN0gr?=
 =?utf-8?B?Mk1rNUF4THNsMktOQUFzaDJBb1NieWVRTmhBZzA2NnFmV1dINzZwb01PWHhr?=
 =?utf-8?B?bksraGRJTHZscWw5L0w2QUZPR0J3PT0=?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9eb6e392-c75d-4c55-44f6-08ddeab4b3a5
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB6494.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2025 06:39:58.8883
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mOxc45t7wcWKSJBmpBS5vHO3JaweHszBv1DpVq8muARyN0xGIlrxgzf5ethlSaBffkcO5vWpW15DZCj6chYUsw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8233

On Saturday, August 16, 2025 2:53=E2=80=AFPM Aaron Kling via B4 Relay wrote=
:
> From: Aaron Kling <webgeek1234@gmail.com>
>=20
> Existing code only sets cpu and gpu speedo ids 0 and 1. The cpu dvfs
> code supports 11 ids and nouveau supports 5. This aligns with what the
> downstream vendor kernel supports. Align the existing supported skus
> with the downstream speedo list.
>=20
> The Tegra210 CVB tables were added in the referenced fixes commit. Since
> then, all Tegra210 socs have tried to scale to 1.9 GHz, when the
> supported devkits are only supposed to scale to 1.5 or 1.7 GHZ.
> Overclocking should not be the default state.
>=20
> Fixes: 2b2dbc2f94e5 ("clk: tegra: dfll: add CVB tables for Tegra210")
> Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
> ---
>  drivers/soc/tegra/fuse/speedo-tegra210.c | 31 ++++++++++++++++++++++++--=
-----
>  1 file changed, 24 insertions(+), 7 deletions(-)
>=20
> diff --git a/drivers/soc/tegra/fuse/speedo-tegra210.c b/drivers/soc/tegra=
/fuse/speedo-tegra210.c
> index 695d0b7f9a8abe53c497155603147420cda40b63..909fdf8fcc9d9f5ac936ae322=
e7a73dc720e5ab6 100644
> --- a/drivers/soc/tegra/fuse/speedo-tegra210.c
> +++ b/drivers/soc/tegra/fuse/speedo-tegra210.c
> @@ -68,18 +68,35 @@ static void __init rev_sku_to_speedo_ids(struct tegra=
_sku_info *sku_info,
>  	switch (sku) {
>  	case 0x00: /* Engineering SKU */
>  	case 0x01: /* Engineering SKU */
> +	case 0x13:
> +		if (speedo_rev >=3D 2) {
> +			sku_info->cpu_speedo_id =3D 5;
> +			sku_info->gpu_speedo_id =3D 2;
> +			break;
> +		}
> +
> +		sku_info->gpu_speedo_id =3D 1;
> +		break;
> +
>  	case 0x07:
>  	case 0x17:
> -	case 0x27:
> -		if (speedo_rev >=3D 2)
> -			sku_info->gpu_speedo_id =3D 1;
> +		if (speedo_rev >=3D 2) {
> +			sku_info->cpu_speedo_id =3D 7;
> +			sku_info->gpu_speedo_id =3D 2;
> +			break;
> +		}
> +
> +		sku_info->gpu_speedo_id =3D 1;
>  		break;
> =20
> -	case 0x13:
> -		if (speedo_rev >=3D 2)
> -			sku_info->gpu_speedo_id =3D 1;
> +	case 0x27:
> +		if (speedo_rev >=3D 2) {
> +			sku_info->cpu_speedo_id =3D 1;
> +			sku_info->gpu_speedo_id =3D 2;
> +			break;
> +		}
> =20
> -		sku_info->cpu_speedo_id =3D 1;
> +		sku_info->gpu_speedo_id =3D 1;
>  		break;
> =20
>  	default:
>=20
>=20

This is getting unwieldy, so I think it'd be a good idea to restructure thi=
s to be more readable. Revision 1 chips are simple, so perhaps handle them =
separately -- something like ..

if speedo_rev >=3D 2 {
	switch (sku) {
	...
	}
} else if (sku =3D=3D 0x00 || sku =3D=3D 0x01 || sku =3D=3D 0x07 || sku =3D=
=3D 0x13 || sku =3D=3D 0x17) {
	gpu_speedo_id =3D 1;
} else {
	print error=20
}

We can also add rest of SKUs from downstream. By my count, this patch is mi=
ssing:

	0x1F (same as 0x07, 0x17)
	0x83 (cpu=3D3, gpu=3D3)
	0x87 (cpu=3D2, gpu=3D1)

(all speedo_rev >=3D 2). Plus the 0x8F you're adding in the next patch. I t=
hink that can be merged into this patch as well.

Thanks!
Mikko



