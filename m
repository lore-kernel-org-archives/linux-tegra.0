Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013040.outbound.protection.outlook.com [40.107.201.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84A511624C0;
	Tue, 13 Jan 2026 14:48:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.201.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768315726; cv=fail; b=rjxcjZ1wQjd4XHvAjzhRJ/O4fg9mBVR7Jf6JAiQAjMgGZqWfBKvmcFnMbrufFuh+A6h7I6Fys8+3LuJ/hEhBIG7nMiEd/t3CO/29J7g6e4pEnbWzjyziabt4WnqDtL5h0agNPlNqiNrXz1NCOXMigPTud2kaStkkpFWkJJcKQm4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768315726; c=relaxed/simple;
	bh=19iEUVBm5tfLeA/i13OdBcZErB+91zlTeyJL3GBtSJ4=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Q737Itc3Pz+BFeXn+Ay71ZSC0FBrv5HCfS8cNJs/O4FWkAJcmzAa1EeJyZc7leR15+7fDceeoj7hxbQWp1Pte8AGdNWBctzPANPF2ADLr0XQrnnG/B5znLp/k4RcQn5wHKBUWxdFU/GMR6vFGN8yCAEX8YDUjrmTZgQ3VpOdJ84=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=N/8fEwCf; arc=fail smtp.client-ip=40.107.201.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="N/8fEwCf"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Q9IM5L/3kQ+p8dDgz/OqspvAu/y7RGlONMqn9ibY4OQWPtyyBvCTCUIuUC7z2IPEg27HgIzCbEj7piKQiEUGZGqGd9zO28+kaylu2LKHNPCc7vyuY7WOtJQf4N8ljRI4I4K5Yt5AA75+KIchUaWVYBQVkb5jWYymYPyAZIPBJH7RZr1O3uqiTA+DUG0Ms7V1mYRfYHZcwIPWTp6s7YBtZePaWcL5mDNO8OgE88FBOpQjro3IotrnAoFmKRdOR8vA5FftO18wp1Z6LmMulfsaTCq3DiLc0qPuhzdasCUpsqLHyRZFuc/IiHJr5C1tsgrpjXDgNkhejRhQjM6wv3OnpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FANrG9/sGCu0jg/MH/U0Bu+9ErjM2YcMoYeRhyKdmig=;
 b=WHnG3eZePyuVleP3TDpxdMFxw1FW7aQGu+GIKI26kdRWmyne20vbTZGubf1vLdvNLcirUX9+zXHJJQMnqDIjTpT377GwTwvsj7fqqg4Hj++CmIfFiyUCKxa4MII59oRFtXEyDHejziRta8Kqp36OBrf3Ux8o426MhKnh/fBq74x4ykgZVvshIYIQFIL7F/A2BphbXOeUzn3/EESO7QSXiCgn1KfQs+UwlBf+u60o0Gw+wV/ES8k9BitZadVvvxpmtMaljbI3LAlg/d7fpDhIavYZFEkLFk71B67/An83LRmzJ0adDcIWm2dZKDnkm0uHM0JYe+y6nEZk+1I9ivss7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FANrG9/sGCu0jg/MH/U0Bu+9ErjM2YcMoYeRhyKdmig=;
 b=N/8fEwCfGKXhYRLRpA6nkRieEWlGn+tfD9U+wWfi6sF7LSTh15BGc/VAEMFntUeAe8QoD/VNjJ+s6B8J9mjXvtBaToQoFxtSdsH+Lmnm2t4q7lzGSyONhU8W/fucU5Td06lVfzr1pGyCtjNTiaz6xrzSQi64ZKBQCT8fRPoK7qV1qcAoi0IPLKdJOWjxvLwVQwtYOW2TsJnHruVA02oGhcaHoR89n/TTOyBoa0vD7gWgQFsgqsi/pS6sl4OWk6tZDi5befhuhZ0zO2uw1Z9eu8lcO0Mpn2Yl8o7yK9q4fvFM4h6DzaPi+HwxnAUiYleHBFBvXF5Yk476pJyI3GOPyA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS2PR12MB9750.namprd12.prod.outlook.com (2603:10b6:8:2b0::12)
 by SJ0PR12MB6943.namprd12.prod.outlook.com (2603:10b6:a03:44b::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Tue, 13 Jan
 2026 14:48:40 +0000
Received: from DS2PR12MB9750.namprd12.prod.outlook.com
 ([fe80::56a8:d6bf:e24c:b391]) by DS2PR12MB9750.namprd12.prod.outlook.com
 ([fe80::56a8:d6bf:e24c:b391%5]) with mapi id 15.20.9499.005; Tue, 13 Jan 2026
 14:48:40 +0000
Message-ID: <703a470d-87fc-4580-a743-952e422984d4@nvidia.com>
Date: Tue, 13 Jan 2026 14:48:36 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] phy: tegra: xusb: Fix ordering issue when switching
 roles on USB2 ports
To: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>,
 Mathias Nyman <mathias.nyman@intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Thierry Reding <thierry.reding@gmail.com>, JC Kuo <jckuo@nvidia.com>,
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-usb@vger.kernel.org, linux-tegra@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
 devicetree@vger.kernel.org
References: <20251204-diogo-tegra_phy-v1-0-51a2016d0be8@tecnico.ulisboa.pt>
 <20251204-diogo-tegra_phy-v1-3-51a2016d0be8@tecnico.ulisboa.pt>
 <86cd3ff0-1609-44cb-911c-f0e97652ca1b@nvidia.com>
 <ae36f759-e889-4371-8c08-b8ffd1b69250@tecnico.ulisboa.pt>
From: Jon Hunter <jonathanh@nvidia.com>
Content-Language: en-US
In-Reply-To: <ae36f759-e889-4371-8c08-b8ffd1b69250@tecnico.ulisboa.pt>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: CH0PR13CA0033.namprd13.prod.outlook.com
 (2603:10b6:610:b2::8) To DS2PR12MB9750.namprd12.prod.outlook.com
 (2603:10b6:8:2b0::12)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PR12MB9750:EE_|SJ0PR12MB6943:EE_
X-MS-Office365-Filtering-Correlation-Id: 89f26695-c5ea-4f3f-b594-08de52b2d77f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|366016|7053199007|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NHkraG1zQXl5Q09KMll1OVdPN3FrSXdXSENSbE40K3BmaUpYdzR1UGxKc0cz?=
 =?utf-8?B?VDdoUlZuUTJNYXdnWFVpcCtEOWtic3NYRDdTUjF6a29kcGlmTFgxYWliTmxu?=
 =?utf-8?B?dFRacUtXaWRZcTJIV0dmOGJGSEJiVkpZR2RENFpLM1pQUVIxVjJpVFAvak95?=
 =?utf-8?B?cE1DVW53QXJuUDVobGZBNTNpQnFBdDd0bWdVRGoyME94NzN5ZW1XU3VRQ0lG?=
 =?utf-8?B?cFR6amRwa3FHOHJtVW52TlNYRVh0OW9TQ0tkV0RuSnErclRuTGcvMFh2cU5K?=
 =?utf-8?B?R05MMmxQd1FkUStqRzhQMUFBM0lIbjdZNTFha3pwK21pcFZzSE9IQUN0emNq?=
 =?utf-8?B?N0lVemh3TW56TkhxZm9HbXZEeXJkcE02a2NBU3I0eWh6SkxIeUdRaktQWHVm?=
 =?utf-8?B?RkFseFlGZUcyaVJ2ZHN5d2dnYWdrS2V5ZjZyS1p0bk1uejBjektzbkhsR1BE?=
 =?utf-8?B?cmF6bTVxdlMwQlk1Q1dla1FHWUtpRDY0QVhXbXMxaDVMVG96SU1nN1JPclJD?=
 =?utf-8?B?NTZsOFBmY3NZSXVPMkJaZVo2a09hT2M0ZkN4S2p5ZkFhUU1JRlRuRVhHd2x2?=
 =?utf-8?B?RTF2dWM3UHN0eEZaSmlVRko2Zm1LakFRYzl5N1JwMEh6M2JuOUQ2UXl4UzVo?=
 =?utf-8?B?Y3BPdmFsU2x6ZVZJT3VjS3hlT29tOUt5bkZDTmliS3Nrc1VmSHR3L3Vwb0M2?=
 =?utf-8?B?ayt1SXY5cFYxcHpnUXIxOW1vc0IzTkVnTEpoODBheVZKRTdyODJsR0hiWUtJ?=
 =?utf-8?B?OURxNXoyZ1JDWG8wRzl1emNEN0J1N2wySjZkbTZ5aUdNTkZkSVo1T0YycTNL?=
 =?utf-8?B?Q09Zam11dkhnR250U2NzVVNZeWQ1aW1sMnVUMC9HT0ptVTdoVVkzR25BZFl5?=
 =?utf-8?B?ZWJoY1R5S3NDTXdReFByQld1bVVkU0FMMjNXb25CWjN3YnNDNU82ZHRqbG5E?=
 =?utf-8?B?WVJ6T0h0Tm5WVkZ6ZmNGMHF6NzBmYzVQVVBNdlJicUQ1VFNRYmJzenB5aGdn?=
 =?utf-8?B?Y0RWNVFaN1pOQlpwdU0vdE0xbDcwTC9HQVp6SWZSeEhXZTNncnlEckg2MVg4?=
 =?utf-8?B?OFpoVjdzRmhRSHlrdStBZHdnbytTbm1nTVE4dG1kQkgxbWFDUWhFRnFoeE5D?=
 =?utf-8?B?ZndNVGZ0WXUzY3o0Q2J2OWpQSlNOY0hJYS85Rk5ETkh0alBsVU5yUUQvU0kw?=
 =?utf-8?B?VE5tSVI5Rk9RTnVPUnNOeEF1ZXk3RXlxMW9DRURPNWptV2ppejVuVGRDWG1G?=
 =?utf-8?B?cThVOEllcHNhNUlwZlNXM3dycDFLczV0S05aRTBVT1NMY3g4cjUxemNlWG1C?=
 =?utf-8?B?OWNWQzYrWmdZNDZuZFdlS2FlOHA2V0Q0N0ZlaEFhUnlGUFZOQUlET0ZkMzg4?=
 =?utf-8?B?YVUxRjY3c3VJa1dOOFU2VndXNXdMTGppYnY1Vko1eWZjN2liOXVvSGlPUDI1?=
 =?utf-8?B?MVIvZmdXOUVrL3RMMXZKcGFzelhCVm1pbVQ0L0NsZ04rNjFMUEI4ZXIwbzBk?=
 =?utf-8?B?SE91cWZBbVVTaHQ2TmFTai84bEZWYktwVmVNQjZmVTNiaU14VU9qdDRuYUxi?=
 =?utf-8?B?d1U5UExZWkd1SlBuZmpqWG93U2J0NjVhcWpVMlVGaHJlNENOTDFMOGx5NkdB?=
 =?utf-8?B?Mmp2NlBzZ1Jwc1pFYVVCTEZDd3d5ejI4ZHRxMUZ1eFZHbkROcG1FL0gxcGtp?=
 =?utf-8?B?K1V2cnBGMjcxZ2RBd1lWK2JjTEVwMWtTQ09ybFhTT0FweVBHRzlyNWwrdlVF?=
 =?utf-8?B?bVUwb09haVJLOG40UGFuNDdDZEVWNjFkOFZCUk41WFVQNjRlMTJ2TG9HMHpE?=
 =?utf-8?B?c05UZkg4bzRhUE5MbnYyRlE4UGV1MWQ4aWJ5a3RwdThHSzJOSVV4YktaQzd0?=
 =?utf-8?B?U1laQ3phaHFYYzBRZDBGSnBCNzA4WU5BQlM0T3pJTGtVR1lORkdJRkNTWmpl?=
 =?utf-8?B?Ym5LQ2l3K3ZHZFhNZWVCclJUV1NDSWpmNWI3M0FKZnp5OW5RdVNacDgyVUNG?=
 =?utf-8?Q?94j2jKOeY114nsvVKBpiw/0ltgWUK0=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS2PR12MB9750.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(7053199007)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?S2svQk9VeHV1dWpJYmFBYUxnT2d1cE9zb2MvaUh2ajlTR0lFWkdOZnRTMUJJ?=
 =?utf-8?B?OEk3MEFqVXB5QU00Rk1FNnhrcjgxenJQSlRnSmJwSU5Fako4b2Q4aHFvaHJj?=
 =?utf-8?B?MHhLNDNzZHlBMmx2RURUcDJKSWJSRWZmM1BRK1ZaT1hudXp6a1VsdVVUUnJr?=
 =?utf-8?B?azJxcTlVRmZOOWl1Z2ozM0JudVlrWXFlWWJzSXRFaHNYVUR4UTlpUEZqTzYv?=
 =?utf-8?B?dlVZRVplZlVWQVNnSHZ2QVFtNDVpaWc0cEcwY0YvbnBmd3kwZ1U5d3hLK0Qy?=
 =?utf-8?B?emh1WDVPWU5wVGY0emhOUFBUSVJxSmtBSkdxUnUreDBmeW9nbWJRRGlpRnNm?=
 =?utf-8?B?b0l6OVlXcEErK0kra0JDVVdsM2RSOFl4L0hiZU9BakFNOXdveXE5bEZOeGJU?=
 =?utf-8?B?c3Zkb2xVZEg5bUg0Nzh2c2lJZzlEbytXcGh2c3k4NUFQVUxWSHkrTzJxOXNl?=
 =?utf-8?B?eW90TlRybFdjYjdQcTJENGVIVmFNd3pkMVk4RnFvSGtSNlJxcmRJLzJvN01h?=
 =?utf-8?B?eG9HV2YzSFZMSTZ5YU1OZjRZZExmZFhuNG4rYlZxTlV0MGN6ZUlRNVREb2FC?=
 =?utf-8?B?ekFnbjRJN3ZqdENjYisxZDA2aXF3Nm5ndUREampVMkp5OEkzTk1rdHhjT1Y3?=
 =?utf-8?B?RDFZbURFdnZQSms3UW9TNW1yMjNkNkFLeXB3c05UUmd2UGxEZ2lzMGRGdjVV?=
 =?utf-8?B?T1gxZDQ5Tko5YUNkUTI3SHVCanUrRnROZnYxYWp2SHF4S2kzRGNubmFzUjhO?=
 =?utf-8?B?cURHUWpCRmxxaXFGRFNUNndMTmlodHA4MEZFUmpxY2FlUU96Y3o0Slg4TDYx?=
 =?utf-8?B?eW0yR2I0dzYzM3NSR0U5Ry9IVXhoRTBMUm16WkRXeFY4SGoxdWRNTVdWZVVy?=
 =?utf-8?B?aDkzdW5QNGxyVXVvYlNJejh0L3ZYMUd5UVl3TERLNmRBOHMrUHg3M1FYeW0v?=
 =?utf-8?B?a283WHYrdVlwc0JNVXJ0TWZlRFNiZTRzZEZ1TlJzeFhPdk9rcTlXemJubWtG?=
 =?utf-8?B?L3Y3MThvY2VvdDhkdG5ZYy8rMzRtTDhoNDMzcnIzTXlNTm1ZQXdoZzE3MTlH?=
 =?utf-8?B?ZHZvOWtyc2dYVXpqeWZhTnlhL2NpZ1ZxSjE0YlRTbDFXSE9COXk0K2pyV0U3?=
 =?utf-8?B?eGllK0s2Yi9saVcxc2Z5ck12eVJ5ZXc3NjI2OWFxOXJjTFpqWk5OUUNwNWkx?=
 =?utf-8?B?SFVIeFFNellZYlFvRUsxMlVzNTROOHFDNmdaVHdPM3ZwR3JLVXU2aGgzdkIz?=
 =?utf-8?B?eDBiQnNIR0dLaHdjWGFBaTQzK0NRb3Z2c0luYVU5c2lXcHNrVVRZazBGeDc4?=
 =?utf-8?B?R2k4RkFrL0lHdUt0bUx4bVZMdlQ3NDJzUHlXMC96RUc4M29Qc0NYTW1BVjQw?=
 =?utf-8?B?dlBuTlUrVS96c3NibHFDTndORFJqUGhyNlI3UWVUSlkxTXlyb2FDK0VMMVM1?=
 =?utf-8?B?YTZqRTJabCs0aWxiVnZXZEViVTRjZFgxVUpmMFlUWjFpWnMrZklSVWdZZkhQ?=
 =?utf-8?B?ZjRmRE0za0toS0pTZzRGWko3ZXhKeWU5cElWVkJxNEhqUGhCblNJd2JYZ2pr?=
 =?utf-8?B?NmRiZnpPb253QnhWeEhXZWVOM1FNMVdRSGxKRVQxaVdvZ2hjTDFCSDhWNUEv?=
 =?utf-8?B?REwveUxJQk52L3RhR0NReXJKWUZpT0Fxc0dFS3l6aW5UakFDcGxmcmt3ZHZX?=
 =?utf-8?B?RXd2eTRUMDJyMEN1THc5UXM2WGtXUVdFNCttd2VuNDBTOFpyMW94RklPVVVN?=
 =?utf-8?B?WG9vSmpvaW1yeVFmS0JSazE4OHJ0alpNd0o1UFo0WWYyTEI5b0NrZ3pEdVNC?=
 =?utf-8?B?V3l2UWlmZnZCa0pqakhMQzh6SjBXRFA4blRRMnQyS3JFRFV2clZ0cmJVOXpJ?=
 =?utf-8?B?eFVFc245OVJRdnV2M2h1QVFkb09VRWJyYk5wV1ZXZS92bTFnb0RhdVNtcjNp?=
 =?utf-8?B?M0pQTmVwZ0kzR1IwK1hUUUxONTdoMlQ2bXY0ZnVPM3JEQUlGVnIwVlBGeXRX?=
 =?utf-8?B?TnQ4MFVPSDcyZXJKcWNBeThscEdvOHJVOUJCVUlZdW1EZi9rdFd5VkhzaDdY?=
 =?utf-8?B?cXZiV0lnSVUrRGVuc3BRbk5ENnlRUXQ3aVF2UXhlZC9qUFdmUTFDNUJ0cVp6?=
 =?utf-8?B?dVBKbXpicFhFZnhiQUREQVVWbEY2VnpXQXhaa09vZnUvbWVwTkNUdlVNMmJw?=
 =?utf-8?B?cVRRRHZSR1ZwdHVkTkdhd1JZUS85RW5WcXloN3NjTlpCaXdFWEF1eEdud3pW?=
 =?utf-8?B?QW5ZeFBGSDgwdU9HTHNKNEkyM2RHckl0S2ZvMTdwbDZkM2V0QTBoRk5UdGZm?=
 =?utf-8?B?VXBFZzBwc0kwSFQyUFhoeUMxd21BVGxNRENTV1FuVEs4WVpPUlpyZz09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 89f26695-c5ea-4f3f-b594-08de52b2d77f
X-MS-Exchange-CrossTenant-AuthSource: DS2PR12MB9750.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2026 14:48:40.7153
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mtY/EOVxJ/LaGG4Jdj1F4g2TPEA+G3L7xDoR9xIKjiyTfa+Ax2zFTMK9arGE41GZjyOCgVHIDFIb7JnypZJwmQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6943


On 13/01/2026 14:05, Diogo Ivo wrote:
> 
> 
> On 1/13/26 11:56, Jon Hunter wrote:
>>
>> On 04/12/2025 21:27, Diogo Ivo wrote:
>>> The current implementation of USB2 role switching on Tegra relies on
>>> whichever the previous USB controller driver was using the PHY to first
>>> "yield" it back to USB_ROLE_NONE before the next controller configures
>>> it for the new role. However, no mechanism to guarantee this ordering
>>> was implemented, and currently, in the general case, the configuration
>>> functions tegra_xhci_id_work() and tegra_xudc_usb_role_sw_work() end up
>>> running in the same order regardless of the transition being HOST- 
>>> >DEVICE
>>> or DEVICE->HOST, leading to one of these transitions ending up in a
>>> non-working state due to the new configuration being clobbered by the
>>> previous controller driver setting USB_ROLE_NONE after the fact.
>>>
>>> Fix this by introducing a helper that waits for the USB2 port’s current
>>> role to become USB_ROLE_NONE and add it in the configuration functions
>>> above before setting the role to either USB_ROLE_HOST or
>>> USB_ROLE_DEVICE. The specific parameters of the helper function are
>>> choices that seem reasonable in my testing and have no other basis.
>>
>> This is no information here about why 6 * 50/60us is deemed to be 
>> sufficient? May be it is, but a comment would be nice.
>>
>>> This was tested on a Tegra210 platform (Smaug). However, due to the 
>>> similar
>>> approach in Tegra186 it is likely that not only this problem exists 
>>> there
>>> but that this patch also fixes it.
>>>
>>> Signed-off-by: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
>>> ---
>>>   drivers/phy/tegra/xusb.c            | 23 +++++++++++++++++++++++
>>>   drivers/usb/gadget/udc/tegra-xudc.c |  4 ++++
>>>   drivers/usb/host/xhci-tegra.c       | 15 ++++++++++-----
>>>   include/linux/phy/tegra/xusb.h      |  1 +
>>>   4 files changed, 38 insertions(+), 5 deletions(-)
>>>
>>> diff --git a/drivers/phy/tegra/xusb.c b/drivers/phy/tegra/xusb.c
>>> index c89df95aa6ca..e05c3f2d1421 100644
>>> --- a/drivers/phy/tegra/xusb.c
>>> +++ b/drivers/phy/tegra/xusb.c
>>> @@ -740,6 +740,29 @@ static void 
>>> tegra_xusb_parse_usb_role_default_mode(struct tegra_xusb_port *port)
>>>       }
>>>   }
>>> +bool tegra_xusb_usb2_port_wait_role_none(struct tegra_xusb_padctl 
>>> *padctl, int index)
>>> +{
>>> +    struct tegra_xusb_usb2_port *usb2 = 
>>> tegra_xusb_find_usb2_port(padctl,
>>> +                                      index);
>>> +    int retries = 5;
>>> +
>>> +    if (!usb2) {
>>> +        dev_err(&usb2->base.dev, "no port found for USB2 lane %u\n", 
>>> index);
>>
>> This appears to be a bug. If !usb2 then dereference usb2->base anyway.
> 
> It is a bug, will fix in v2.
> 
>>> +        return false;
>>> +    }
>>> +
>>> +    do {
>>> +        if (usb2->role == USB_ROLE_NONE)
>>> +            return true;
>>> +
>>> +        usleep_range(50, 60);
>>> +    } while (retries--);
>>> +
>>> +    dev_err(&usb2->base.dev, "timed out waiting for USB_ROLE_NONE");
>>> +
>>> +    return false;
>>> +}
>>> +
>>>   static int tegra_xusb_usb2_port_parse_dt(struct 
>>> tegra_xusb_usb2_port *usb2)
>>>   {
>>>       struct tegra_xusb_port *port = &usb2->base;
>>> diff --git a/drivers/usb/gadget/udc/tegra-xudc.c b/drivers/usb/ 
>>> gadget/ udc/tegra-xudc.c
>>> index 0c38fc37b6e6..72d725659e5f 100644
>>> --- a/drivers/usb/gadget/udc/tegra-xudc.c
>>> +++ b/drivers/usb/gadget/udc/tegra-xudc.c
>>> @@ -698,8 +698,12 @@ static void tegra_xudc_restore_port_speed(struct 
>>> tegra_xudc *xudc)
>>>   static void tegra_xudc_device_mode_on(struct tegra_xudc *xudc)
>>>   {
>>> +    int port = tegra_xusb_padctl_get_port_number(xudc->curr_utmi_phy);
>>>       int err;
>>> +    if (!tegra_xusb_usb2_port_wait_role_none(xudc->padctl, port))
>>> +        return;
>>> +
>>>       pm_runtime_get_sync(xudc->dev);
>>>       tegra_phy_xusb_utmi_pad_power_on(xudc->curr_utmi_phy);
>>> diff --git a/drivers/usb/host/xhci-tegra.c b/drivers/usb/host/xhci- 
>>> tegra.c
>>> index 9c69fccdc6e8..9944593166a3 100644
>>> --- a/drivers/usb/host/xhci-tegra.c
>>> +++ b/drivers/usb/host/xhci-tegra.c
>>> @@ -1352,18 +1352,23 @@ static void tegra_xhci_id_work(struct 
>>> work_struct *work)
>>>       struct tegra_xusb_mbox_msg msg;
>>>       struct phy *phy = tegra_xusb_get_phy(tegra, "usb2",
>>>                               tegra->otg_usb2_port);
>>> +    enum usb_role role = USB_ROLE_NONE;
>>>       u32 status;
>>>       int ret;
>>>       dev_dbg(tegra->dev, "host mode %s\n", str_on_off(tegra- 
>>> >host_mode));
>>> -    mutex_lock(&tegra->lock);
>>
>> Extra blank line here.
> 
> Will fix in v2.
> 
>>> -    if (tegra->host_mode)
>>> -        phy_set_mode_ext(phy, PHY_MODE_USB_OTG, USB_ROLE_HOST);
>>> -    else
>>> -        phy_set_mode_ext(phy, PHY_MODE_USB_OTG, USB_ROLE_NONE);
>>> +    if (tegra->host_mode) {
>>> +        if (!tegra_xusb_usb2_port_wait_role_none(tegra->padctl,
>>> +                             tegra->otg_usb2_port))
>>> +            return;
>>> +        role = USB_ROLE_HOST;
>>> +    }
>>> +
>>> +    mutex_lock(&tegra->lock);
>>> +    phy_set_mode_ext(phy, PHY_MODE_USB_OTG, role);
>>>       mutex_unlock(&tegra->lock);
>>
>> I am trying to understand why you opted to implement it this way 
>> around and not add the wait loop after setting to the mode to 
>> USB_ROLE_NONE in the original code all within the context of the mutex?
> 
> I did that to minimize the amount of time we wait while holding the
> mutex, as we can now possibly wait a significant amount of time for the
> role switch. Is this an unneccessary optimization?

Do you mean it will be longer than a few 100us?

Jon

-- 
nvpublic

