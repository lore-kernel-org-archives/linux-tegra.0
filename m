Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012052.outbound.protection.outlook.com [40.93.195.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6F9D31355F;
	Wed,  7 Jan 2026 11:53:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.195.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767786834; cv=fail; b=rECqjHik/y45f+atiTqS9Yh+gGL3Yv2VWKH+qwEXZXf+KagzTdT+D7UjlLtz8FaUsa8SIKmuWW3/OQfrOq0R2753D6X66eGWKHeIV2VK22vw2hq0I5pVsaLXo93xHpHbXWEy4wJEm5S0LW8pHmYv6Tc9tr2N1AMkulbwaFwec44=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767786834; c=relaxed/simple;
	bh=b5CwkyjAXT5odPg+/K8bJegpuTtZfNcObs1Es7yerN0=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=SFb8hMWG1pcFGPCmm9jTFGdhVwB2k8J9Lze4k938493y1FPYEPIOk0OhHeKocpm4tuOzbGgkxzljb9YodVf83lM1qHRofhpW/ZAl0bUiBmVQrlx37e+1Kaf+9pfKxZT8TpLQhLOgNuEHYNCm5ZKVIuFOIr0oqkJaBEYkdd4P9Io=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=X5iyEkRz; arc=fail smtp.client-ip=40.93.195.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="X5iyEkRz"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Y+0/Bfn686REcviM3mHtwcFmGVCqOMavnuaiutR/LdTddDoLeyVrPV+OGgaNZYnbVVTz9G4unpXPD0JqtOY/TrM2YMhre3FOv3DrUjLvUYmG8N5Wnm9Fmpdrmtvlb0D3yLPvJ0kIhKAxISZ70YGn9RJY4ufYhCFRHXghbUHXMUAbYLyl7UCsXoFT98L9JLMe6h6OR9TXucpJUsm1As5x+zZkrZh8AyHTXGAhZ53dX8TK68Y5MrEUngMfmmwNOC2NLYpxnY4tAdteKsMsNsAG/8x0XiHfmGtbMocq1cL0uLdjIExRTpQmAh0k9qS/wNEqwdACqs6FE/nXNcfkzrWPHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EWoDsH1bGTA8+GlTGWcnYN3oSnag/g40DKCJawHuQZ8=;
 b=AJEEcQafTl9+FGj4yJw/lNigWuy1zegZL/ZVVr9le2a9stOpc+IXni2WETDIMrfvR3wsI2EyM3HxsEpG1HEIgdMIGgevWjOLbGB057RjvnIh9W+i05tGFiLIRnVIKJ5/FuJHndlytZNwW5HGO8IShE+CUNCoMibpIH9vAzsJ3mlmOfUuzVD/g6+Ar+761PPU61DnrCptBpFxBNVPDTtWd9yDzZBvnP8gKiqE2Q3AYCL9EQ6JBY62/xGOgRcV35D8ztS1rJkq+ISbz20cgJXw3D2sIaxC29q3fZFH/q7AMe3GCbRzjcYKauoearRZgE+FLpqVjwD+3xUwbzuUENM6cA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EWoDsH1bGTA8+GlTGWcnYN3oSnag/g40DKCJawHuQZ8=;
 b=X5iyEkRzkt94O9eQ59oOsJEiPrjuFh/Yvm62uJ3Cpbm++ITsfPB5MX5vxNWZZsmx3tOF9AeKvml3PR3LlK2GVIU/Su3F9VkJck2PdMUcnfG2J5OAeBl6FI2TabZcmji7tCiFBQSCZ1CMW9x/8UT/Ng7UUCmg3wHw3lL6Rn4TbAwOw2WQbZuPlKe1TGcizv3MO0kWMQuVqwrO6mbZoQNZcaS+S9iIdZNktyH2TEfq+DilAiH9uZtwYzOPmaEp4jmuzEdXR9Ks4dsdxcwq7argx58UyhyurfN4ulIzUlwF2nHZ6cWeb7qzfeCGQ0o3oOUTg7cRtGX2FmfUsxM9ouCvXA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SJ2PR12MB8784.namprd12.prod.outlook.com (2603:10b6:a03:4d0::11)
 by PH0PR12MB7096.namprd12.prod.outlook.com (2603:10b6:510:21d::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.2; Wed, 7 Jan
 2026 11:53:48 +0000
Received: from SJ2PR12MB8784.namprd12.prod.outlook.com
 ([fe80::1660:3173:eef6:6cd9]) by SJ2PR12MB8784.namprd12.prod.outlook.com
 ([fe80::1660:3173:eef6:6cd9%7]) with mapi id 15.20.9499.002; Wed, 7 Jan 2026
 11:53:48 +0000
Message-ID: <61cf00f8-7f9e-4739-8946-a37c0b18ab02@nvidia.com>
Date: Wed, 7 Jan 2026 11:53:43 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/4] memory: tegra: Group register and fields
To: Ketan Patil <ketanp@nvidia.com>, krzk@kernel.org, thierry.reding@gmail.com
Cc: linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
References: <20251219114354.2727906-1-ketanp@nvidia.com>
 <20251219114354.2727906-3-ketanp@nvidia.com>
From: Jon Hunter <jonathanh@nvidia.com>
Content-Language: en-US
In-Reply-To: <20251219114354.2727906-3-ketanp@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P302CA0037.GBRP302.PROD.OUTLOOK.COM
 (2603:10a6:600:317::9) To SJ2PR12MB8784.namprd12.prod.outlook.com
 (2603:10b6:a03:4d0::11)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB8784:EE_|PH0PR12MB7096:EE_
X-MS-Office365-Filtering-Correlation-Id: 313e2297-b24a-490c-8014-08de4de36b2a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|10070799003|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?YllJcXA0OFlHQndTYzdFNzhacjBzTThTbmo1UFRwaWhqb3duMDV5QzlKWkJT?=
 =?utf-8?B?TmZxSzVCZmJ2b1RMWjRmOGR3TTVtekpGc3c0Q0U2d3YxVUVUd1B3MW5BbTJi?=
 =?utf-8?B?M1p0dGpTN2tCZ2hyQkJQdWRGYkRaNCtyOW1FQm0rMlpZMUVZdWpBQytZRGtn?=
 =?utf-8?B?dENTNldZT3VOMTlFZWM3SUNmaGYzdWJJSTNGdjdwc0xjaDc4N0dlWUJzSjc4?=
 =?utf-8?B?VnpUTXRpNG13Vlp1cnVJdm1VSkdxZGZhNmdNZ0xuNGVGWDlUdVZTVCs1dFVB?=
 =?utf-8?B?VmdmUmVBSUd1bDVSM0FDWDlkZVBQdmRndk8wSWl3cHdZT3RvYWtaQnNYRitF?=
 =?utf-8?B?T2dqdlFRZVJCemdhcWZhMEtYejJYNjFDRDBiWlE2Vnd0OEZMMjhHdEhJTFds?=
 =?utf-8?B?VFF5S2lKa1RwM3YyMzB3ZWx0ak4xeGd3dWlkMkZGT2hSVVNNbFlzSDd6ek1H?=
 =?utf-8?B?TTIrdmtNNXhKZi9CM2M0c09yNFk3WVp0UzlJVkxWWHFsWU9kQkVMVUJrc21z?=
 =?utf-8?B?WUpwVVZCYUVmRVRKcjExZlZVYlZ1Q0IxTWZOdWVVbjdNcDFqMVNZWSs0dXRr?=
 =?utf-8?B?UjIvODZzRHNUTS9OaTIyUHpURGVFVXZERU1ld1dZWkdzcU4vclB4OUdGMlF2?=
 =?utf-8?B?ajdUZTBkYzhXckFlaE9BNVh3Q3VxOU91UXJ6SnRNQkxmbWwzeFV1OU4xMUlQ?=
 =?utf-8?B?SVkwTURlWlBGWEtwTXIwQ0tjYmk2VjMxd1hWQzJuTnR0Q283ZGY2MUZaSzBo?=
 =?utf-8?B?c2ZIdTFtZ0FNWkZHL01sZlltSjNXeXdkYzBGcnFSbzg5VTQ2dHltRDJnNkJS?=
 =?utf-8?B?RExZVzdJNXNvL2JTakZLaUZndTAvSTVYTlorc0FJQk1sbnlUOVhrMFdzL2xN?=
 =?utf-8?B?NmV0WVhlTkNFazJFWUwyVUcvYjdIQlg5Rmg0TkEyTTdqNU1JeDlONFhOd3lp?=
 =?utf-8?B?Ulg2L245VnYvbXZZYnVPckZ3M0JUbTNLd08wMzU0U1Z0UU0xQkZQK1ZLR1FR?=
 =?utf-8?B?T3RuVFJxYkRZdHhyaktmWnhZd1YzKy9nSHdXUlNsSHJ4QlpCMWdjak4yM2NI?=
 =?utf-8?B?b2xDS0dyVGIrN1N2SXAreFVpUnhwOVo4c2luRzl2SmErcWFNSC9OVHRpWm9U?=
 =?utf-8?B?U0VYTndXT2VJS2twdHFzZlZ6dDJyeE0vUmNEejRCL3RheXhhZGhUaXBCSXhR?=
 =?utf-8?B?TjhZcm1IdlZ3Ym1MMnNuUDhWYklqWTVBMmMxdTJqZFFta3REb08weENwL3E1?=
 =?utf-8?B?MHIvaHM1dkVLVk4yZ2VFV0FnWmxOMGZPMzZXSDh4Nk11dnF4Y0tKa1lwWUp2?=
 =?utf-8?B?SGxZNXJLMEJPVHcwZU1XazliUW5wMmlQR0hvVUJ3TE9HTm5NSzFRUWZZbGtR?=
 =?utf-8?B?S1ZaaTRySXJUMndHbndkbkUwcjgrbXF3MWFQdks2WEZTMDZtOUI4TlZZK0Fv?=
 =?utf-8?B?c0hPUnBKQkpzeUFPNks3cDJTNHl5bXYzTlJZSnRnOUJ1VnJtL0ZFcXM1cURt?=
 =?utf-8?B?T1g4cGRJdzNsbHY5ZVRKVjVXSXp6QTJvU084aldwUmFCUWxmT0JkZnJQZEZy?=
 =?utf-8?B?cXRjRHhaTGpEVkk0VEgyZVZNNGoxSUNIeEI0VDFrZldHRzdIb2E0UXJYVFZN?=
 =?utf-8?B?SlVHNFYxUHRSbElaZmdVWmk1ZDkwaXdFTUJYNFhnNU84Slcrd1pmcEhpeTJI?=
 =?utf-8?B?ZzlNNWgrM3RGV0dPdzVERUdjYjNZemx5WDU4UC9hRi9CamExbDMyTWhWdXM5?=
 =?utf-8?B?aWpYYzRyMHNtRERmZUo3SFQ2STFTTER3bERHK0pKNDlmVE9KTElUTXFmS2k4?=
 =?utf-8?B?bGRKRGY2elJDR2prdVoxTXBMckVtS3ByVTB3QzErQk9maHYvbWw2OEpxTmJn?=
 =?utf-8?B?Y3pZajZ1OEFYb2tJcXFleis5MGJRWXRPNmQyTnR5UHY1NWNsZCt4Z2JEZ0xC?=
 =?utf-8?Q?FV52nBzUrErmEwKsFstg6+qNJfXUp3Z3?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB8784.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(10070799003)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VmhJaVBFMWVKcEdTS295TW8xVnlUVUdYaVE1eGFoMHFUclUrQjdUQzNLa09W?=
 =?utf-8?B?Y0YwOGxlZlZHV1BHS2N4VGFjdUoxdG1LeXFCb2h2WmVzRHVzWDVveW9hU1ZN?=
 =?utf-8?B?M29ZbWJCS3dxSys4U2tiRDd1YlJrQmtZUEhlZ1AzbHMzM2Y5NjFtM0xONzhm?=
 =?utf-8?B?YWttYmY5blN0SGNFV0dRTk81ckhJU0lORTZtclVpN3I2YndxVE1NU3NrMHdC?=
 =?utf-8?B?TkR6VDRSdHgwZitUeTFlWjZrWGhjSWh2UGFkUkZnK1NCa1ovS1NhVkVPZ0dl?=
 =?utf-8?B?RCsydGhzTTIwQThhTS80RzVTeStsSW1lOTNvZVdZcnoyTk5Eb3hwN3pka2Zr?=
 =?utf-8?B?NHViOVBuNC9ZdzUyajE5UWRzNFk4QTZLZkNSTTZRcGJXWmZ5TW9UZk50dllQ?=
 =?utf-8?B?MXZJcFQzckEzUUhmVkZpaUF0Y1dSSU1vcDVUS25XV2VHSk1td2hmU2crMWlW?=
 =?utf-8?B?ZUh2TmdCOE4xVmxaOXMrVkVoSGlGK1ZTY0FUYkphR0FLa1REVnE4a2NGdjdI?=
 =?utf-8?B?OElpS1JoeWlrN3hraVFvRmxGZ1FYWUVEUG9ZM1VJcnQrb3ZrbFJkSFBlVGRP?=
 =?utf-8?B?OHVLVWE1VGR6OGFQYnJ5clJzZjhpT3NkTGJnaFVCanEvUzdRaTUvS1BMYnhM?=
 =?utf-8?B?dk9Ibkt6NXVkV2FXbTQ5bkZUVHpST2g5VzlQb0tZY0ZTWThPNjRuNVpWVmNJ?=
 =?utf-8?B?OGpRNVVyOEdQWmt4d0dDYW9oSnRTTllqeWJydkVMTFhSdG9ybU5UeFY4bFhq?=
 =?utf-8?B?NkZtQmRmVXZvTjY1UkhSRmpxS1l4QzJNNVIyWXhpSEMzN1gyNS9lbldtYWQ3?=
 =?utf-8?B?U01qajZmTTBna2tXOHViS1UraThqeGpXM2t3Z2JVMytuQ096bW44OC9BM1RU?=
 =?utf-8?B?VFExaGRkemgvWHEvdTZrMW1hWXlYSG5UZUY3UmJoWko1bFVzNkRWT0xtSi9W?=
 =?utf-8?B?V2RMRnNTa0tkV2VGaVQ4QnVxSUkxeXVDMlMySTNjNUtIaTF4ZThyS2QzYTBo?=
 =?utf-8?B?RjFCaGtRZXNteTlIU0dweDlQOE9CNmpSbVpkM3lXZUdhR0xiSG52ZVUxbEJS?=
 =?utf-8?B?ZjJQMXlSSkxXelRKZ3hrTTVHSXFpSHMxRlVQSEVPV0RpSXNueExGTmxXRjdx?=
 =?utf-8?B?UkVBUnVjU2hZRnNVa2lwdjJVcXE1VThhaHVvdjNPL2xUck9OSDFudGhUeWdy?=
 =?utf-8?B?bzd1UC9RV2xtZlNkMGpHQ0ZJOVJwc2oxd3lWK2N4QmVQdXAzdjNaSnpDNDJu?=
 =?utf-8?B?Y2o3TnZTeTlkc1c5YkVsbHhUZjhJdkpSMnIwUWgvV01FZU9uZkNRUG81dFZN?=
 =?utf-8?B?NzcydEt6MlVYT1NKLy9XTTVQcGFCTWh6dkhLeFA4UHNUTjNOWTc1OXUyUjJw?=
 =?utf-8?B?SXRGM1Zwa0JwbzV0NEd5MzBHdjVuL29rRHlFUnJxUGMxT2p0SytoQmw0NHRD?=
 =?utf-8?B?NUdJd3hhTloyN3BMZHg2OVJiNGFUS2ozN1k0TW1XUXFndGRwT0c2dDNHbGIw?=
 =?utf-8?B?S1dqYVBPaytIMmlFMXRSdUhpMTVhbDhna2V4Uzk1MmFMYXRWRWQ5SUx2Yys5?=
 =?utf-8?B?SFA4YXRQa2VURk9NSUJrb1FlTDZ3TUd6ZmF5Q2RPa3BLalVMUngzZTRQTTZv?=
 =?utf-8?B?b1RXWUFIL1JYWUpoMS9WVzVKMXRsS2psSENBT0VKTHdZQkFOM1dxaytEc2gy?=
 =?utf-8?B?VHlmQU4wbGttWUxNODNXU0diNGo5bFJ6MnhyazZuWXY3bktNYlJ5dHg4SDJ2?=
 =?utf-8?B?YUVmYUxGM3g5TVBGM29vZDl0U21mMjFaakY5RHlWL0oycEpJMzFsRmVKUVpv?=
 =?utf-8?B?NVBwckJpeHNqVEJMbDltQkoza3gzL1U4enp3SGg2VjVTMkRQWC9EeU9leG9P?=
 =?utf-8?B?bktCVDRwMmlmRGRWYmVYNStLV3BiTnJVNnNVRzZUdmk0UFduOHJMdWY1ejEv?=
 =?utf-8?B?TXpOZmhKbVNKT1ZRTndwbndpYk5HTndNQ05uaHhKYXdYbmtjdmpVajMxV05p?=
 =?utf-8?B?bnhmelNBMWFlZXY3a0hNclRJL3hNSTA5T0NMWlpTRzlEWmtnc3BzakNVeGw1?=
 =?utf-8?B?aDVFZnlFTVBtTHRCcW5NeUFCTzZyRXBCd1h3MGd4cGp3eHpHTmdzNEJWUmdR?=
 =?utf-8?B?a3ozZkdyV2R3ajI2OXFNblVBajIvQjIrb24xRnpSbUpLWEhBZko2TThGbEV5?=
 =?utf-8?B?VU5yU2VkS3doWVNGNzJQRjlCR25PSzg1dXF1V2orY1JLSlJKaWhBL0dKbFhS?=
 =?utf-8?B?L1FRSWxVSXdaZmtFd2YxZnl0VU9KTE82M0dpMGpjQjN6NSsyaXNvS2lZVkpV?=
 =?utf-8?B?UEV3ZTZEUEwxVDVHZXNsaXJyN1lGbnQ1cmM0MHBlWWJtZ2hBN3JsT0xGcG5W?=
 =?utf-8?Q?r1Be203ULc6WrQcWaNb7kUhhnhGXfTZD7VIi9MeYpaDB9?=
X-MS-Exchange-AntiSpam-MessageData-1: IALB29oIL0PdAQ==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 313e2297-b24a-490c-8014-08de4de36b2a
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB8784.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2026 11:53:48.6181
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CPhezWv7yB/RRnsGJ8H/9mws6qzVrKxDhCXDoek2uP1c01oUEBIDoaH7VpR4Py7GqChOc7dVq/I5aZ3rmZggBw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7096



On 19/12/2025 11:43, Ketan Patil wrote:
> The current register definitions are not in sorted order. Sort these
> registers according to their address. Put bit fields of the
> corresponding registers below the register definitions to clearly
> identify which fields belongs to which registers.
> 
> Signed-off-by: Ketan Patil <ketanp@nvidia.com>
> ---
>   drivers/memory/tegra/mc.h | 49 +++++++++++++++++++++------------------
>   1 file changed, 27 insertions(+), 22 deletions(-)
> 
> diff --git a/drivers/memory/tegra/mc.h b/drivers/memory/tegra/mc.h
> index a7f20850741f..482f836f7816 100644
> --- a/drivers/memory/tegra/mc.h
> +++ b/drivers/memory/tegra/mc.h
> @@ -13,13 +13,31 @@
>   #include <soc/tegra/mc.h>
>   
>   #define MC_INTSTATUS					0x00
> +/* Bit field of MC_INTSTATUS register */
> +#define MC_INT_DECERR_EMEM				BIT(6)
> +#define MC_INT_INVALID_GART_PAGE			BIT(7)
> +#define MC_INT_SECURITY_VIOLATION			BIT(8)
> +#define MC_INT_ARBITRATION_EMEM				BIT(9)
> +#define MC_INT_INVALID_SMMU_PAGE			BIT(10)
> +#define MC_INT_INVALID_APB_ASID_UPDATE			BIT(11)
> +#define MC_INT_DECERR_VPR				BIT(12)
> +#define MC_INT_SECERR_SEC				BIT(13)
> +#define MC_INT_DECERR_MTS				BIT(16)
> +#define MC_INT_DECERR_GENERALIZED_CARVEOUT		BIT(17)
> +#define MC_INT_DECERR_ROUTE_SANITY			BIT(20)
> +
>   #define MC_INTMASK					0x04
>   #define MC_GART_ERROR_REQ				0x30
>   #define MC_EMEM_ADR_CFG					0x54
> +#define MC_EMEM_ADR_CFG_EMEM_NUMDEV			BIT(0)
> +
>   #define MC_DECERR_EMEM_OTHERS_STATUS			0x58
>   #define MC_SECURITY_VIOLATION_STATUS			0x74
>   #define MC_EMEM_ARB_CFG					0x90
>   #define MC_EMEM_ARB_OUTSTANDING_REQ			0x94
> +#define MC_EMEM_ARB_OUTSTANDING_REQ_HOLDOFF_OVERRIDE	BIT(30)
> +#define MC_EMEM_ARB_OUTSTANDING_REQ_LIMIT_ENABLE	BIT(31)
> +
>   #define MC_EMEM_ARB_TIMING_RCD				0x98
>   #define MC_EMEM_ARB_TIMING_RP				0x9c
>   #define MC_EMEM_ARB_TIMING_RC				0xa0
> @@ -41,44 +59,31 @@
>   #define MC_EMEM_ARB_OVERRIDE				0xe8
>   #define MC_TIMING_CONTROL_DBG				0xf8
>   #define MC_TIMING_CONTROL				0xfc
> +#define MC_TIMING_UPDATE				BIT(0)
> +
>   #define MC_GLOBAL_INTSTATUS				0xf24
>   
> -#define MC_INT_DECERR_ROUTE_SANITY			BIT(20)
> -#define MC_INT_DECERR_GENERALIZED_CARVEOUT		BIT(17)
> -#define MC_INT_DECERR_MTS				BIT(16)
> -#define MC_INT_SECERR_SEC				BIT(13)
> -#define MC_INT_DECERR_VPR				BIT(12)
> -#define MC_INT_INVALID_APB_ASID_UPDATE			BIT(11)
> -#define MC_INT_INVALID_SMMU_PAGE			BIT(10)
> -#define MC_INT_ARBITRATION_EMEM				BIT(9)
> -#define MC_INT_SECURITY_VIOLATION			BIT(8)
> -#define MC_INT_INVALID_GART_PAGE			BIT(7)
> -#define MC_INT_DECERR_EMEM				BIT(6)
> +/* Bit field of MC_ERR_STATUS_0 register */
> +#define MC_ERR_STATUS_RW				BIT(16)
> +#define MC_ERR_STATUS_SECURITY				BIT(17)
> +#define MC_ERR_STATUS_NONSECURE				BIT(25)
> +#define MC_ERR_STATUS_WRITABLE				BIT(26)
> +#define MC_ERR_STATUS_READABLE				BIT(27)
>   
>   #define MC_ERR_STATUS_TYPE_SHIFT			28
>   #define MC_ERR_STATUS_TYPE_INVALID_SMMU_PAGE		(0x6 << 28)
>   #define MC_ERR_STATUS_TYPE_MASK				(0x7 << 28)
> -#define MC_ERR_STATUS_READABLE				BIT(27)
> -#define MC_ERR_STATUS_WRITABLE				BIT(26)
> -#define MC_ERR_STATUS_NONSECURE				BIT(25)
> +
>   #define MC_ERR_STATUS_ADR_HI_SHIFT			20
>   #define MC_ERR_STATUS_ADR_HI_MASK			0x3
> -#define MC_ERR_STATUS_SECURITY				BIT(17)
> -#define MC_ERR_STATUS_RW				BIT(16)
> -
> -#define MC_EMEM_ADR_CFG_EMEM_NUMDEV			BIT(0)
>   
>   #define MC_EMEM_ARB_CFG_CYCLES_PER_UPDATE(x)		((x) & 0x1ff)
>   #define MC_EMEM_ARB_CFG_CYCLES_PER_UPDATE_MASK		0x1ff
>   
>   #define MC_EMEM_ARB_OUTSTANDING_REQ_MAX_MASK		0x1ff

Shouldn't the above masks be moved as well? Typically we put both the 
masks and bits next to the associated registers.

> -#define MC_EMEM_ARB_OUTSTANDING_REQ_HOLDOFF_OVERRIDE	BIT(30)
> -#define MC_EMEM_ARB_OUTSTANDING_REQ_LIMIT_ENABLE	BIT(31)
>   
>   #define MC_EMEM_ARB_OVERRIDE_EACK_MASK			0x3

And this one.

Jon

-- 
nvpublic

