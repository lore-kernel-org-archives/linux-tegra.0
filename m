Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2079.outbound.protection.outlook.com [40.107.93.79])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4637F10E0;
	Thu,  4 Sep 2025 00:56:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.93.79
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756947369; cv=fail; b=D5eisZhLj7aXWppQr8CpZq4cIFyt1EXFz8+OcOOi4Xq9sg+wyvqFYvMRWRtfgZXvll6W7iM7yNRlPE6DQKg83OfA0PM81ozFzhmNpemg/KUK8Kc3p4oKPtuWNsrsEBu0pUEOF8+5SkN2BJkNSA9H2mo8/2MLHmmhNOFckk8iRek=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756947369; c=relaxed/simple;
	bh=BQAdBN1LO4Z0kkFD14yG6cf+QKMhkYnTLzCUBS0B3k0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=YIMeGUCkE4M6cxY9IWlcXKCkHMSbaEEJKD4ZgO+bgwGGl/AUvju6Y0pyk1atVrdG+IKUCaJ73spJwtu9WIKW7CtcTXDcXB1KhvRwYhTBtAl7U3Gr3MtQPWT7ly7LDzngfQEJVpATXHqwHSg3z10pVyWOBV3oAMqTPqGoYNoU4Dw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=a4n2fcDt; arc=fail smtp.client-ip=40.107.93.79
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="a4n2fcDt"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N3tFiWC237y3TafUQAeI4+jTaFMenKGib45X7t7LlWtnP+0fNX3PJVH7e2P9ium9v9JLz/RwAy5HQoL3UJALDBQeH+sSXVk98Ihsko9U1sqnXxCOiEPRicsZJJ/6Xi7u5UDssKTgF5ELHnHchNh9IvB7+T6BJcAWQbW5xLwusUJBYEht2mwAr9abVi/zLwOKx4xffMLcWwVQ+713CP4JmNtWf4qmVqEDimknilzkNYI+jfJcLJQK3QZjATV1Fawyhu6jFBBsLfSQ53tjSn4AV4COyU7g8OVOvX4pWUHQ+2PJRBFnaK8jpM1VNAd7m2R5/uUo2MWGjqUPE0UtQlqHMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Nl2urJ7z/y3x10Wx33ohZwgw1bM5a5aD2SSR6EYnOn8=;
 b=J9sZHzWN4dHHZyVn0f0OMqoP7pAn7tuwXi+2mhum4n7W0NB0JG3jtEAPwEy2DhY0zWp1oZshHylk6oySbRmDvvMjLr7Am3ZpkrHuunvbFXVJmU2R7nmHh7PX/9hW3mhtGnBLM4Kgrio/6Eo4h5fL3FGT83sIilC07m41elynh+x4YzrKvn6ytAz1hf1A9WYRNDX04zt6LWbYA6K+J1OE+qXspU12HhubP7l0iwQiEtzGTMVahHNf4snoTi3agcr8ooDX82kDrQiUNSRfsnjQQmEqFRgBbqhYnroLZA40yZHUmeuUoPhOCWfsCRzehIkLWwKYHdkuvtE/32ipfAYWmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Nl2urJ7z/y3x10Wx33ohZwgw1bM5a5aD2SSR6EYnOn8=;
 b=a4n2fcDt+ZwAK3K3gr8T6RVBwOWbFvFFBffJfYIB4bCs+JlJRdJ/LhgbyDMJ5TbRrnm+ezv/leQfkxf1zyjr+EP6s+tg9OLaucGUWfKwha1eMb4sNiaP5SwfJl3czU6B6AOt9av4RYUOsizo/TERdYf+QIKPNtrboii4XfkgQhkdgCR6tO4W1sv6b18qNFqngjkz0T763uxuM/rWUCD3ud8xqUSD2erHWqHJLMQangz26Y2SNCXbtQQr8xC5PYkWgAC90ejsQrj34KzPjTxVzFI1LF8G9Y2j+Z+Ll0+sB9h4js754lfpNmw9fBGaw1dUgsJib3AgAuP4Z74b6CjBMg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM4PR12MB6494.namprd12.prod.outlook.com (2603:10b6:8:ba::19) by
 PH7PR12MB7872.namprd12.prod.outlook.com (2603:10b6:510:27c::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.16; Thu, 4 Sep
 2025 00:56:03 +0000
Received: from DM4PR12MB6494.namprd12.prod.outlook.com
 ([fe80::346b:2daf:d648:2e11]) by DM4PR12MB6494.namprd12.prod.outlook.com
 ([fe80::346b:2daf:d648:2e11%6]) with mapi id 15.20.9073.026; Thu, 4 Sep 2025
 00:56:02 +0000
From: Mikko Perttunen <mperttunen@nvidia.com>
To: Aaron Kling <webgeek1234@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Joseph Lo <josephl@nvidia.com>,
 Peter De Schrijver <pdeschrijver@nvidia.com>,
 Prashant Gaikwad <pgaikwad@nvidia.com>, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-tegra@vger.kernel.org,
 linux-kernel@vger.kernel.org, Thierry Reding <treding@nvidia.com>
Subject: Re: [PATCH 5/5] arm64: tegra: Limit max cpu frequency on P3450
Date: Thu, 04 Sep 2025 09:55:58 +0900
Message-ID: <8194755.G0QQBjFxQf@senjougahara>
In-Reply-To:
 <CALHNRZ894WcNaAuLFoDLwJ8mXDRM8PzdqRFzcyYUMPy+0q0nMw@mail.gmail.com>
References:
 <20250816-tegra210-speedo-v1-0-a981360adc27@gmail.com>
 <26156028.ouqheUzb2q@senjougahara>
 <CALHNRZ894WcNaAuLFoDLwJ8mXDRM8PzdqRFzcyYUMPy+0q0nMw@mail.gmail.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-ClientProxiedBy: TYWPR01CA0001.jpnprd01.prod.outlook.com
 (2603:1096:400:a9::6) To DM4PR12MB6494.namprd12.prod.outlook.com
 (2603:10b6:8:ba::19)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB6494:EE_|PH7PR12MB7872:EE_
X-MS-Office365-Filtering-Correlation-Id: bc1fe536-2325-49c2-eff7-08ddeb4dd217
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|366016|10070799003|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VnZOU0pkcWZmdjRSRVIzL0x4WGh4bEMvalM3QzNQRk9SRC81aXRMbzMvVEJQ?=
 =?utf-8?B?Q0tBdXVzR056Y1VqNUJYZmR2c2x0WmpjcnZhTHRNRFg5NHZFZ2hlTUlNbU9M?=
 =?utf-8?B?MFV6bXZVT2tsdE00RXRoa29abGl1SlJnTy91QnhiMFdza0JOblA4d0ZkTWdQ?=
 =?utf-8?B?Nm5leG9aYyt1eFFPQWViZjIydEk3VlcxNmF1Y0lOUHN0eUxVcnpYeFp0eFhS?=
 =?utf-8?B?dnFqVGxGeWNZZDl6eEJkK0wxMGFuWGhCUDJveTIrTk1yL3M4Tld6OUg1cUor?=
 =?utf-8?B?TC9wR2IvRFdyek9HQzlVRnM5QkU3SHJNeFNaVWc1QUpTbDY4bmZtcWdMYjhU?=
 =?utf-8?B?NE9NOTZGZ3FwQ3RGNmVwWEMxWnlZbWx5U2RCM1RFTGhGakU2WkpFM3dqV2Iv?=
 =?utf-8?B?NVc5bHFmN1k1SmdqU1lOZ0RpYS9EOHJRemFIVUVGc2I4MEw4U2FPUUk4UXRF?=
 =?utf-8?B?NTRjRG9wMGxnNStLM3dVQWlyeG9DYU5pUktsaERxSzBoSWYxcHdMa3NvSHEx?=
 =?utf-8?B?dTI0YStCRVplUTZ5YWFyK3cvTS9vU2h0bEJMM1F2d3FTb2ltcEVKVi82dzA1?=
 =?utf-8?B?dHBDMFdoUXRJTWNBWGNVdmI1bWgxRHJ5RWUvazBMcWFpemFuM1U4NlZNMHN0?=
 =?utf-8?B?c2hwS05HdlJCOERZRzNMRGw4a3NscEgzSnpjUkdvcndQTW9yTmJqNERMZ1lC?=
 =?utf-8?B?SjZUaTNsc09oVDlkZ1RpcnoxWWdUN2ZueUhvc2t6TkFDTk1HTWx5Y1RvVmgr?=
 =?utf-8?B?Q0MrNERFNTBIVjl4WWw3a0Jwclk3aUN3U0ZtWmpYM3lOb3BFekc2a3VTaU84?=
 =?utf-8?B?MTR1cG4xSzgxKzdJQzdwblpVSFV0OUo2SkNjd1lvd245dFNpVWVLY0Qxdjlq?=
 =?utf-8?B?SUpicW5UWlV6dFNoVVB5aCsvNUNlYkxzQWt4YmJTRGVnOWVRckdQTCtmSS9F?=
 =?utf-8?B?OUhvKzFzODJsR29HT0YreEZZWis2ZVZUdFNhMWEzNEFpZmhxbG1CV0xqWTgz?=
 =?utf-8?B?bHB2OS9NMWpORzhQRVlOcUQyWDhYUWpnaFl5akgxeGEvWUhidUR0OXdtSlpV?=
 =?utf-8?B?c0NJelhBQkMzYkhCcWRzcHk3TkdPOG9vYUZHZ0p1dDlYVWpKeEFJb2liV2ww?=
 =?utf-8?B?ZFB1QW53SkJtV09KQ1dveEZLd082ZENEM0FIRWwzTkZUUmNlMWhsbU5IdE0r?=
 =?utf-8?B?MU1MNndQcXJHb0N1MEJ4aHltNlgxbmFKVEEzTDNVdXhHUXMwM3JDUjluRlEr?=
 =?utf-8?B?NDZTOXB2RkNyamtuTUNNSGNCYnlyMnJUL2xUamJSWWJRcW9KU25SRlRPdnVk?=
 =?utf-8?B?Y05aV2pEeXFnUG5SUzJQZU1vSDJtTkxlZCt4VnYrd29jS3M4ZWt4UGV1YzJq?=
 =?utf-8?B?YWNPbUZxcG9CRzYxaS9ZSitvczdFdkJsOVAvTUx2cy9EU1I1bFlyMUdEVWhG?=
 =?utf-8?B?dm1oNTJibkIwbm9OYUFJMW5MeGVobGhXajBPRzcwWXNOdzMwUEMrVW14aXNw?=
 =?utf-8?B?UUtSWHpVOEY3dzEzRWZKVFhYL0hxS0MvUzJucHlqYUEyY2dEcFNicVBRanJR?=
 =?utf-8?B?a1JkNFVobVorb0NzbXZwQ1FrOURsaDRmaVhaeGxMeHpFc3Vlbkg4SUZHN3dn?=
 =?utf-8?B?aTZLOVJxVXNwN2JJeExUTGtvM29VcVZWREdzMGo1M25HZURIZXdFelF0dEF3?=
 =?utf-8?B?VWVQVTlCZ3JVU3VRUGNmZ2s2TElpREc4ZU56NkVIS09ZRVJiSUk1djhaSlFJ?=
 =?utf-8?B?V0hMU0ZqVjJhekNrYjZsWVVWODQrdk9ZMXZGTWp6SDB4Yk9uWWpDakhNUnZK?=
 =?utf-8?B?L2h4QkVWazlOQS9FV2E4elNSTU5oOWJ3RE9sazU3MnplNTFzWnBCaDlHbE13?=
 =?utf-8?B?Vk5Dd1N0Q3FYZTJtR0FLSVM0NTVpS1kxalRaSS82RWhjd2hGSUM5R0VodjhR?=
 =?utf-8?Q?xSOAiiyjCow=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB6494.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(10070799003)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?N1FLbEl2VXAwR0ppL3JQYkNXRXpvdHR0b2ZyMFVBMmdmdEJ3RzlmNFpKWVFE?=
 =?utf-8?B?SVdXdVhYQk1KakR4U2htL1dFZUJldnZ6L0pXbmVKelVIY203bXJqRWhBQURY?=
 =?utf-8?B?WHczRm96WkIzOENGYzZqOFI2cUhtcnlTcmZwbTM1NFVSWjVlRDhDeXNwKzZr?=
 =?utf-8?B?N2RGOUJaVlR5R1c0Ny9RRzFyUzV0VGhyMFdJTmQyN3VHVW8zSW5FcTdZWThk?=
 =?utf-8?B?OGlJUndWaEpGN1FwUzNQU0QySTYvSjNDcWlIdTFsU2tHMTkvRGF5dFRZZmJ0?=
 =?utf-8?B?bHFITXJzbHdQeElsc0FyaWVjSy9EY2FESzg1STF5ZjB6ZGpMeFB6bCtmTFNY?=
 =?utf-8?B?MXgwREh0OVM2aUE0d3NBQTN3aU1LQlBRK0MwcnBsSDVEMlN3TXFKcUJ3L3hR?=
 =?utf-8?B?MGhXWFdhMk1Sem9qT3lTWVpHd0xxMVlFRmsvSEJKMFd1Z0ZjUFRGZXdKUTlM?=
 =?utf-8?B?MXRJWlloUG52TEtwWnhiRFBMbS9Bc2o4SEYwV0hCQ2NzSjE0c1phaHIydHQ2?=
 =?utf-8?B?V2lXMisvL3JmRkF0TFFscitscEFIT2JNSTJUQTVqdG9YUGtydEJUTWgxcUJq?=
 =?utf-8?B?STFXblphZDBodDhFd0RDNUs1MTJ6SERITlp1ejQ1dnlENXZOSlBwaU9RY0cw?=
 =?utf-8?B?aVVwclAxNm9FMFd6VXBiM296dStzRFZNZXBaeXFBMlRHZzB3YnhHNkhrUFZv?=
 =?utf-8?B?eWFpcEhlU2NyRTE0KzBIbVVWUDZINlBFbXFudVlmZ0JaeWtJRTFoeURMWmdL?=
 =?utf-8?B?UDFxV3lqMUJ6d3JvYlhiR2huY1hxckE4SmJKYWo5YkExemc1ZzJvcExKcXlu?=
 =?utf-8?B?OVZkZUdoaWdmblVTRldKMW5LUHVPTEhaT09hcFpvSVdPc2V6N1k1N0c1VXdN?=
 =?utf-8?B?emFHNTJ5eDhOMVpMNHlZSTZNYnFCY0dwOHRrQWw4elFzbUZsOUNRUGlGUWNF?=
 =?utf-8?B?QnpycmlRMUY5Zk5vNmswTFA5R2ZHVXc4WW44REltNnZQeW94OERVS01tN2JW?=
 =?utf-8?B?QTlxZUUyTU1LS0h4RUc0cE93UXhDbEcyOHRnQlNJenRyMEpnOExXOWdJK2Zw?=
 =?utf-8?B?TTNNblFWTHNlRVFQYmgyNUQzbzV4dis4VnVPRXVLOFRrMU5wbkJFb2l1NUZD?=
 =?utf-8?B?UGVGVC96UHJ0eHM3OHU2WmtzKytmbnhFV0hyN3VzdzlCTW1QNjVqTkd4dHVv?=
 =?utf-8?B?eVNFUitpZHl6L3NJNVJWaFhYNFUxUnk2S3BROEU1aG0rc3dLeC9EVlJ5RHkx?=
 =?utf-8?B?clBzQnIvQ2NQZGhXREpFWjBZMVpnZkphdUo0V1ZIT1M2Y3haU2laZ0dYM3VJ?=
 =?utf-8?B?RUlFczdtOW9mVmN1MjROYzg5cjJ1b2x4enduMEdTV2JBcVRPK1V0UnA2MHI0?=
 =?utf-8?B?ekRlYjBmQ0w0U1JxTHBZZk9xeW5RODJVaTlSa0dFTFZIZ3dDZGgwYUZjVWM1?=
 =?utf-8?B?NTk4cmVMY1ZIN0V6RmhWTURib050RzhKc0JlQ2gzOVNzUmJKWW00WUo0TllZ?=
 =?utf-8?B?NWEzb1huOTRnaG5NditDeU5CNEhRVUZEQ2d5N09xbmhpRytZbXFuLzQ2VVFa?=
 =?utf-8?B?RVk2RklvYmRTdndPamFzS3NxbllCcmR0dlRva1ZTbndZUkJRaXdoTzlOWmpn?=
 =?utf-8?B?ZTEzMkhLQ2M0NUVIVlE5YkVwNlgweFZVTnJTTVJycmtsR2c4cHFLSDhyMDFJ?=
 =?utf-8?B?eFJMN1lueGsyM2NyejhVMmo4VFBocW5sS0JxUHJuUDBiNWJzdHMycVBaaGJl?=
 =?utf-8?B?SUFsQ1U1alF1VTdkTC9JVFBXSlVkekNiVGF6d2x0VFM5c01BTFNNVDNvUW9u?=
 =?utf-8?B?ZGQ5OGQ0SzFnd0IzVk1pNEhUSEEraFo0VVpJM2V0YVFRY1B5cUxPb0tFV01K?=
 =?utf-8?B?V2hDaTl2Q2VveFh6bHBuV1VpREZrWFNoVkM4UDAydUpzMEdmQS9oTXZ2WHpv?=
 =?utf-8?B?STJIYTc0MThVaHpjVXBhTHpGSWdZRmhseE9xWUNlbnE1RlNqcjZNem9rcUp6?=
 =?utf-8?B?TVVxQndhRmk1bjZaT0tlaTlzS2xHd1NMUDQ1NmZwZEwrUkUycmhGTG9HZGlK?=
 =?utf-8?B?N3dNTmdQdHBSTE9vRkFVOExLWmFWSmduUTJXdTkzdU40T3E5TjdhTUwvSVNM?=
 =?utf-8?B?ZjVBRVd2OGhEdGNtTGRFUGtmUjZzam1XajluZGFTSHo1TUxGQ29mWUxIeWRv?=
 =?utf-8?B?ZVI4VVRneFl1akVxbGJyMnh5VHdJVXJDKzdEN21nOVFpRDZET0dDbkZRTUU2?=
 =?utf-8?B?bFIvVkpDaVo1ZXpmdHNSODNBUjZBPT0=?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bc1fe536-2325-49c2-eff7-08ddeb4dd217
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB6494.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2025 00:56:02.8160
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: G3QsHW+8+JbAfEauCLBHys9kcCDz6Dr7CGWD5idhkRa7Y1GKilevvshgxXGNMTYf8DTIAdjMAaAbiPp6OE+40A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7872

On Wednesday, September 3, 2025 5:01=E2=80=AFPM Aaron Kling wrote:
> On Wed, Sep 3, 2025 at 2:29=E2=80=AFAM Mikko Perttunen <mperttunen@nvidia=
.com> wrote:
> >
> > On Wednesday, September 3, 2025 3:28=E2=80=AFPM Aaron Kling wrote:
> > > On Wed, Sep 3, 2025 at 12:50=E2=80=AFAM Mikko Perttunen <mperttunen@n=
vidia.com> wrote:
> > > >
> > > > On Saturday, August 16, 2025 2:53=E2=80=AFPM Aaron Kling via B4 Rel=
ay wrote:
> > > > > From: Aaron Kling <webgeek1234@gmail.com>
> > > > >
> > > > > P3450's cpu is only rated for 1.4 GHz while the CVB table it uses=
 tries
> > > > > to scale to 1.5 GHz. Set an appropriate limit on the maximum scal=
ing
> > > > > frequency.
> > > >
> > > > Looking at downstream, from what I can tell, the CPU's maximum freq=
uency is indeed 1.55GHz under normal conditions. However, at temperatures o=
ver 90C, its voltage is limited to 1090mV. Reference:
> > > >
> > > > static struct dvfs_therm_limits
> > > > tegra210_core_therm_caps_ucm2[MAX_THERMAL_LIMITS] =3D {
> > > >         {86, 1090},
> > > >         {0, 0},
> > > > };
> > > > (rel-32 kernel-4.9/drivers/soc/tegra/tegra210-dvfs.c)
> > > >
> > > > Here the throttling is set at 86C, I suppose to give some margin.
> > > >
> > > > 1090mV perfectly matches the 1.479GHz operating point defined in th=
e upstream kernel. So it seems to me that rather than setting a maximum fre=
quency, we would need temperature dependent DVFS. Or, at least as a first s=
tep, we could have the driver just always limit the maximum frequency so it=
 fits under the thermal cap voltage -- the temperature limit is rather high=
, after all.
> > > >
> > > > If you have other information, please do tell.
> > >
> > > I am basing on this line in the downstream porg dt repo:
> > >
> > > nvidia,dfll-max-freq-khz =3D <1479000>;
> > > (tegra-l4t-r32.7.6_good kernel-dts/tegra210-porg-p3448-common.dtsi)
> > >
> > > Which in the downstream dfll driver limits the max frequency it will =
use:
> > >
> > >         max_freq =3D fcpu_data->cpu_max_freq_table[speedo_id];
> > >         if (!of_property_read_u32(pdev->dev.of_node, "nvidia,dfll-max=
-freq-khz",
> > >                                   &f))
> > >                 max_freq =3D min(max_freq, f * 1000UL);
> > > (tegra-l4t-r32.7.6_good drivers/clk/tegra/clk-tegra124-dfll-fcpu.c)
> > >
> > > If I read the commit history correctly, it does appear that this limi=
t
> > > was set because the always-on use case was failing thermal tests. I
> > > couldn't say if it was intentional that this throttling was applied t=
o
> > > all use cases or not, but that is what appears to have happened. Henc=
e
> > > trying to replicate here in an effort to squash stability issues.
> >
> > I can't see any reference to failing thermal tests. Can to point to the=
 commit?
>=20
> In the porg dt repo, commit hash d1326f08, which adds the
> nvidia,dfll-max-freq-khz property, the message body states: "Set
> CPU/GPU Fmax limit for 24x7 105C UCM." I read that to mean that the
> 24x7 always-on use case model was failing to stay under 105C unless
> the cpu and gpu frequencies were limited. Is that an incorrect
> reading? 105C is kind of a crazy number anyways, beyond the soctherm
> critical shutdown temperature.

What that's (trying) to say is that it sets the CPU's Fmax to the limit spe=
cified by the 24x7 105C UCM profile, which is the 1090mV i.e. 1.4GHz limit.=
 The profile is called that because it's normally used for the 90C-105C tem=
perature range.

>=20
> > I looked into why this was added for porg -- it does not seem to be rel=
ated to reliability, but more so consistency of performance. I don't think =
that's a huge concern for upstream -- though in any case we should be cappi=
ng the frequency in the DFLL driver for now since we don't support dynamic =
thermal capping.
>=20
> So the whole conversation winds around to: The change is valid, but
> the commit message needs better justification?

In my opinion, there is no need to add the device tree property in upstream=
. The CPU is designed to work at 1.5GHz under 90C, and 1.4GHz between 90C t=
o 105C. I think this is a bit of a downstream-ism and not something we shou=
ld add in upstream. If the user wants to underclock, then that should be th=
rough the cpufreq governor or such mechanism.

>=20
> As a side note: I'm still chasing multiple stability issues on various
> t210 devices. Though, the only one I've seen on p3450/p3541 is that
> nouveau intermittently fails to init the gpu. Just hangs on probe and
> eventually something times out, stack traces, and causes a panic
> reboot. Seems to be about a 50/50 chance for me, but works fine if
> probe succeeds. For another dev, it only works once in a blue moon,
> but still dies shortly thereafter even if probe works. I thought it
> might be related to the cpu/gpu getting 'overclocked'. But even after
> this series, the problem persists. So maybe me calling this underclock
> a stability fix is inaccurate. But stability issues still exist.

Good to know. It doesn't strike me as a CPU issue -- I'd put the first plac=
e to look at nouveau's init code itself to see what is failing. There's a l=
ot of potential software issues that can cause intermittencies during GPU b=
oot. If power related, GPU or SOC rail.

Thanks,
Mikko

>=20
> Aaron




