Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B93F51E1C11;
	Wed, 15 Jul 2026 19:46:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784144806; cv=fail; b=dx0Gssiklha+VYQWNztwjJOs/ETaM6SmBYManEysNdEwdkNLxRERlkx4J5grokBjRly5GSRdmsNhAUPeLQW022wwwVWBnNa57Tler2EgUMrDf9d+gp6H8L9vaKlG9K6DaQdgSeJYLiuCWbauet1KDyqHnH9eJZXmhA6jyyHylyc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784144806; c=relaxed/simple;
	bh=a6Xjwim5sIBBVKvKp5b9vbgA3y0QVxhh+llpgzkcntg=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=DzIl8irvokfzY4DG30GOh3qxvhRIeTjyCkIF8Qxu6Pizyr8+NpZG2lMzBOS1PVS07+GU5scbz/gnUnlnMqY9kCIlKUBe1fBIZi9mimGTDJN7Qr7KTPw6WgyCQ80j/vsXv2QLvpKAeTVn3LqvLilXPsrvLZCL2Kn1THl7mx9aAtA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VoZwDapu; arc=fail smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VoZwDapu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784144800; x=1815680800;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=a6Xjwim5sIBBVKvKp5b9vbgA3y0QVxhh+llpgzkcntg=;
  b=VoZwDapugBTxLv/jlqfZcro0Tc9P1sEHbIkiqAxb3L9BNopbr38+eb/p
   ObzvELIKYyVop5y8LlASVYKClEGcwO5Zdtuw8Bb6wJFKzPE1sxFJFNOKH
   0n2FG7j0mgXYmt/sXA2q39s5VDMCPSshSbSCQ2BGXEpeoiq6VF5xkYgs5
   mV/E05kOZ5PQRPiJJhHOlbjuUsBuzvhI9ymATmRrYobrffDsFLgg6nLET
   5EG1gFWiC5LkTvo9FDHL9Ej6ePJp/RqcXgr6q6BOb4xk4XtcDWjhhVrMf
   5WudsO6hYTSWnkMQhBhG18sy3x1ZnIWWoeaNkFM8M1HAY+s1vxRbr6J1W
   Q==;
X-CSE-ConnectionGUID: zjsq38wASUCMG7azDx4A1w==
X-CSE-MsgGUID: xoFeNjKIQUq5Ij5rvNyxTA==
X-IronPort-AV: E=McAfee;i="6800,10657,11847"; a="88702564"
X-IronPort-AV: E=Sophos;i="6.25,166,1779174000"; 
   d="scan'208";a="88702564"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2026 12:46:39 -0700
X-CSE-ConnectionGUID: mu/1i0WqQ7eKoZqHsMO0Aw==
X-CSE-MsgGUID: Z6s+hjFSRcugSdNhVWmNFQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,166,1779174000"; 
   d="scan'208";a="260594837"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2026 12:46:39 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Wed, 15 Jul 2026 12:46:38 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Wed, 15 Jul 2026 12:46:38 -0700
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.14) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Wed, 15 Jul 2026 12:46:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BCK8A/5BYx0gRKhgROc8Eb5/WScnGR/g2eihGsNbGRQJ3KwCE7zJDPlDaFjHsOz/fH4qMNASkLgyM+3hxVDIshY9bQDEfKlGor+C4WgzUlYdPt7YZVpFJM7ObXoobYRv2IxjFIE4D13UZJwnRFjVS3ZEGd4Or557niCYfjouhEHz0zouMskeyvfxmwg8wBNem6NME+f1vXk7ZjU6kNKMjrNnOJO0odWIYUf6NZUU4dtiRDPXaXr9A+Nl2W2Q4zbYlWekpDE+GseWiayyBwR58+Sfg2pU5tL4/lf7r+vUV91V7sHhdL+6k35ReD5ZbExOSQVt4XrQfoDX7p43CIBX2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Cyu2IbM0PF1VOGKcwdvXX4JPRjzTYARBssf9EUC0DHM=;
 b=TzWtcfMmBQEo+KXi/GHrEK901yx2jj6pb34xIeMuKR8dvgsqWOvjffQFojZsBFJRLBYtsm18YLJerCW3VnjH7rjaCbs839cpv15z/5i0SSpGgpnj2s5qGY7ARXchu9Q3lys7Id27K4ao/p8LfxzbEKA60p/kEduQ79CRNjOXWMFXCsFHFcbcWwnsRRVFJbjBa+XPrsj1B6IpIC2z1Vhyp46LlQvPc4Q4/jPlxYi6q3jLcZ70GsX97wk3wib2rOtiQlvizWLMSAY+q70YN4xcNBKckmEAXDmJeg+DKcb+l2ZNhmwRDnnPGq80c+b9V2noFcV/hdlV5AViuOKAa5tTtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7381.namprd11.prod.outlook.com (2603:10b6:8:134::14)
 by LVXPR11MB9777.namprd11.prod.outlook.com (2603:10b6:408:387::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.202.18; Wed, 15 Jul
 2026 19:46:36 +0000
Received: from DS0PR11MB7381.namprd11.prod.outlook.com
 ([fe80::4c39:dfe6:d6dc:6f58]) by DS0PR11MB7381.namprd11.prod.outlook.com
 ([fe80::4c39:dfe6:d6dc:6f58%6]) with mapi id 15.21.0223.008; Wed, 15 Jul 2026
 19:46:36 +0000
Message-ID: <e1dd9d7e-6dd7-493f-9b88-7aa92ea1687e@intel.com>
Date: Wed, 15 Jul 2026 12:46:28 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net v3] net: stmmac: enable the MAC on link up for all
 supported speeds
To: vadik likholetov <vadikas@gmail.com>, <netdev@vger.kernel.org>
CC: <maxime.chevallier@bootlin.com>, <andrew@lunn.ch>,
	<andrew+netdev@lunn.ch>, <davem@davemloft.net>, <edumazet@google.com>,
	<kuba@kernel.org>, <pabeni@redhat.com>, <thierry.reding@kernel.org>,
	<jonathanh@nvidia.com>, <vbhadram@nvidia.com>, <linux-tegra@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
References: <20260713074911.30090-1-vadikas@gmail.com>
From: Jacob Keller <jacob.e.keller@intel.com>
Content-Language: en-US
In-Reply-To: <20260713074911.30090-1-vadikas@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4P220CA0019.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:303:115::24) To DS0PR11MB7381.namprd11.prod.outlook.com
 (2603:10b6:8:134::14)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7381:EE_|LVXPR11MB9777:EE_
X-MS-Office365-Filtering-Correlation-Id: 5c676aea-d654-44e6-52d3-08dee2a9c7d0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|23010399003|1800799024|7416014|376014|11063799006|56012099006|5023799004|18002099003|22082099003|10067099003;
X-Microsoft-Antispam-Message-Info: X5Kne+vwaMolwr1/teaKi9xyX0xCY1ueRrXhHOeu4BMpBuKwKK66GfQ8oK9hGhLcnZ+PGequ9raS/UBJWvGmu3zCcCX4PuJfqXA0d7sGg2ZRHSqmmKPSZFLKVDExs2R9ucWGmWiYTlgDA5Pjw9O1osoL07SzMHQqvBAByB88W9AkigyD2YFjoEF8rULWBQKhDf2v8eMGHFDoyL80tU9RWBtAPHZyxEvveRAL18RyuZ9orTR7i7pLxxe/EdCqeZQFvO2rapiL/pBeOgEtUaBP6s21x5Ik66YGNOseu3bKr5wNrXnlq1xhhjhQSNi9B9vJYRLmUimRyYbV3UI9OIc+uz0AePzLjKZFj/oZYc1Q1/Mn4MA3tjnu3qgC2jep2YCqrB5yLnJhjQFcIRRwDtg88sqnNCHyTawwKUwdkl94ha6/+B1V5a0EIvixW58sWtlRJlwn6dH1RB2GLpYNwsaV0d/IsiMmgF3XEKehNya9pQeouOi3/zicaiDRwOF7tDD0nZlaC4UYzXzVvg+JccPdeAoWzwiLq4iQ0BDVGXBFJpXE1mmvFnP2nBFiVOEPsz9eMVO2ZjeRvvJHZmm7sIYbjvxNzWPtpLtlIEsX6jKYbb7DXcLrb4a2Ie0gQXLG1ZRUS1g5L1cjOhnWPJ3+zMHB2G3aVdQEHr2bz3Iihur1W80=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7381.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(7416014)(376014)(11063799006)(56012099006)(5023799004)(18002099003)(22082099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bHRXMG5nMWxkckVybDB5MlJHZW5RRDdrdjFWQjlyL2VtcjM2SWM1dTZUQUZu?=
 =?utf-8?B?RHZSVWg1THZGTWJDL1lTWlB5T2NUVFhmUTRZRXl6TFlyY2QxM1l4WUQ5VzBx?=
 =?utf-8?B?Q3QzcmV3UUpIVExISTN3SzVWMUs4a2J1V2pvbG9SZ05TajdqblV4cjVRRTRT?=
 =?utf-8?B?UE96NlJOVHUxY1JMcW9uK09WTlJpZmt1VGtNOTJBYkF0a3d0V1lxOFVPRnhQ?=
 =?utf-8?B?ZmxYSVF4bkkraHJhekYwZngxN0dCVHZ5WWoxUCs1d0JqalFUUlZnTzhGYWRN?=
 =?utf-8?B?WjhNMUhPYmlPa0tGQ29uSHRZLzJNKzJkdXB1ZlVRTDJ5eU1RVjJEcUY0NmJs?=
 =?utf-8?B?WjlRQUV6WmlRYVArZ3NMVU85SUtCVWFza3F2WmowQWlFUjVPZVNGcHRzL0Z4?=
 =?utf-8?B?cW1IS2g0OFZqcVIvbitkbjJQYkdPT3RabzdXWnNZbHBhdjRlQU5LNTVnclNj?=
 =?utf-8?B?MU50ekVCcGJRMXkzaWxUV1g5UEJ6bGZnZmU2NG5vQ3RUQmFLOUtqWG5SVjIr?=
 =?utf-8?B?bnJNNXZWcW4zK2wvcDI4aEhJdlRUSTQ1Z0ZUeUJUTnc4VXpBZHM3WHMzR3Za?=
 =?utf-8?B?bVlKcDZ2WjA5cWRCQ2RnNjFhOVI3RS9rNTU0TysrbGF2Z3RIOE16UVZqM1ZB?=
 =?utf-8?B?YlJQVDRCSjhWaTZnQnkxUGxlWkFRWi8xdlpEUmIyeGl0bS9BdkxhNWhUSnRM?=
 =?utf-8?B?d3hKb2Fxc2FuSjJuY003VVJJYmZUcHFGNnR6c3FiM0JsMXpLUE1hZFVwRkZC?=
 =?utf-8?B?bFkrd0lDM2hMT2NrZlp5MFpzOSt6Rm1vbnpZdDY2VUJCQ2NpWGNnTGU0Z2Vi?=
 =?utf-8?B?VlNkZ1ZTNitKeVhWd2R1cUZxUnFHWWhoOWVUSHpZUzhjNlJ6eU5ZR3BaZEd4?=
 =?utf-8?B?NWtTWTdDNWlXb0cvVmRnZis0NDBaTDBqMUM4d1FxNHYzcUdrZnBwNmpLVEdh?=
 =?utf-8?B?MVZIKzZEM0hhcW9rTm5wdEFwUEt3TnJpZENBM0tTZmVxNXZXVDFMbTBFdE5F?=
 =?utf-8?B?Zlh2YytvclZIMHduWFdRaTRzaUJ1WWkycVV1SnpHdUl0ZE1nVWdBSXoyOVRC?=
 =?utf-8?B?ajJCYUUvL2NRNm1oa0JFZXlxRjRWR2s4akdtSlFBQ0dsbzRWSFpDVE1tNGJV?=
 =?utf-8?B?dSsyMWhKMXFOMUFKblBacWZkeFVRQ3JMZXY4bkw2ZW9ENXpheHQ3bk9vV0E2?=
 =?utf-8?B?K2VlYzg5akNiM0pTVFFaOHBBbFNkcC9QU1pibUdFbGxiNDhaWVZwRTJwYmxJ?=
 =?utf-8?B?NzJOUkc2NHVHdUk4enRPd08wUGtOeGZwVlRvK3Vtd2VOVHZKOE8vQWxqandq?=
 =?utf-8?B?TVM5b3hSRDZ2cUZ2bDJQK1pZZW1NOTU3a3pVUXBzUnlSNGtVcndPYWRwQ2h2?=
 =?utf-8?B?SGJHRUFLNU9ST3BDTUdmSGMreGhyQWdBV2ZqcVI3TEJxY0xlcmlBL0thdDgx?=
 =?utf-8?B?Z2pyRDViWVpuRUYyLzNaTEt4NXBsbGFETG05eklrYjlnWWpNc2M5cFd5Yk9T?=
 =?utf-8?B?SkZUTnRPOUpPK0pJRFBVZFFkOXczM3ZEQWNYd05OWmhHd0h2VWlMOXk4Z2xZ?=
 =?utf-8?B?bGdkK0I4YWZmVzJ3YlczOG1DbVQvaDRGd0FLUEJvb056K2luL2RZZXpxa1lK?=
 =?utf-8?B?WkV3eTRNZ1pjTTNieDUzVHVEZGk3My9SU2VBeGxwMjB4eGR0dTZDOC9heklG?=
 =?utf-8?B?eVZjcXRERFJtcDRuRG9vTWUzWkRxMDVnckRPUVVxaGtvNUZjTkVKWVg4SFdE?=
 =?utf-8?B?V2JvL3hrMHNDODZHMXI5aFZ1QVVvcG5tK09mQ25RVUsxaW1tMnUvc08rSFRD?=
 =?utf-8?B?eG1wRTBtSzQraG9aMDROZ1pZU0hmRmdXRFR0Y0wzbWozcVRwVDBDZG1aUG9Y?=
 =?utf-8?B?amZUR0poTEdrYlhsQWpQR1g0NFlsenFiWW1ONDlFRHBxcUxDaWNFQ05xYmRQ?=
 =?utf-8?B?V1pycG5FVmE5SGQ2SEQ3YytmSDhobVlhZ0h3VmNHemMxcTlJeXVMWFBwMmVq?=
 =?utf-8?B?Z3Y1eEN6em9iVXpMc1hqcnJic3FDYjI0ei9VOW41R2I2bW01eUdaTDZpYzI2?=
 =?utf-8?B?SU0vMDN5SjdiVXFVSWYzQ2lzb1l1TDlYOExOZ3pJMEplRWpZS1Zjek5iZ3VZ?=
 =?utf-8?B?SEtEckNTS2w0eVZmUlAzMkllN3U3bUVDalZDRTNTUlg2Y1JKTnhsd09YUlg1?=
 =?utf-8?B?UWQyRTlxNjhXZHE4WEdyUTczNWtGaGhlWGFvQkZicU81V0R2ZzJwRnc5dTBk?=
 =?utf-8?B?QzNYdzVMNmppRHpQanl4bEsyMStSV2FHNnphZkN0YWlHTUVzWFRXVk4rcm5G?=
 =?utf-8?B?bFUzd1Q4UnlYclZZOHFONUlxelVIMVltMDRHL0JmN3VnZ0lVNlRzNGI2aVQx?=
 =?utf-8?Q?h8JEZftUB1KR+KV0=3D?=
X-Exchange-RoutingPolicyChecked: I42WbxnqAYgU4I+ZcsnZHmdJj0mmM19K2+BH+FNNYXTkmluYkJHQsYSZf2ILi2ye18k1Tzlh8zUOQYr7gvkku6RFbvMZnHz84Nb1J8n1lzrpIXlfpxgK1XCzC+m53k7F0MC8CnkC25jxHCvtOzelt0RK019WEgIXT9z1TC4aHGWvyoz2pkYoynUyMMVJCtqBo0YeqS8SyS8of6k9H5oxoHGWIuqWHYHnpdn2PjCrM3x3mw/InR9+y7Ti7olWFR9Hat5G87EE9ziVtxTpHCHsWKJNgiNe868Thu5bcJEHSAEDgz5WX4xIi8DwWB7eaF2qyxE9qpFbVLilHCENGAQa2g==
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c676aea-d654-44e6-52d3-08dee2a9c7d0
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7381.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2026 19:46:36.4247
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ruxJROsfcs2LUDtt1IcqCedS53rFVmSsbAbnPZNKG3kWohVIeGh/DETGPL8b8J25zfk+yyJFy7FB/k+KxwZ223yvGbOqOSS2X7PV0Q398So=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LVXPR11MB9777
X-OriginatorOrg: intel.com

On 7/13/2026 12:49 AM, vadik likholetov wrote:
> stmmac_mac_link_down() clears the MAC's transmit and receive enable bits.
> stmmac_mac_link_up() is expected to set them again through
> stmmac_mac_set(..., true), but it first switches on the negotiated speed
> and returns early for a speed the switch does not list. The MAC is then
> left gated off.
> 
> The speed selection is split into three switches, keyed on the interface.
> The generic branch -- taken for everything that is neither USXGMII nor
> XLGMII, so including PHY_INTERFACE_MODE_10GBASER -- lists only SPEED_2500,
> SPEED_1000, SPEED_100 and SPEED_10.
> 
> MGBE on Tegra234 runs 10GBASE-R into an Aquantia AQR113C. That PHY does
> rate matching, so phylink_link_up() replaces the media speed with the
> MAC-side interface speed before calling into the MAC:
> 
> 	case RATE_MATCH_PAUSE:
> 		speed = phylink_interface_max_speed(link_state.interface);
> 		duplex = DUPLEX_FULL;
> 
> The driver is therefore called as
> 
> 	stmmac_mac_link_up(interface=10GBASER, speed=10000, duplex=1)
> 
> which falls through to "default: return;". The interface stops passing
> traffic after the first link flap.
> 
> The failure is easy to misread. The link still comes up, because the PHY
> is polled over MDIO and needs no MAC, so the interface reports carrier 1
> at the media speed. The DMA is untouched, so its start bits stay set and
> descriptors are still consumed. Only the MAC itself is gated off: the
> receiver counts nothing (mmc_rx_framecount_gb stops advancing, RE is 0)
> and nothing reaches the wire (TE is 0). The interface survives boot only
> because stmmac_hw_setup(), called from ndo_open, enables the MAC
> unconditionally -- so the problem appears only once the cable has been
> unplugged and plugged back in, and "ip link set dev <ethX> down && ip
> link set dev <ethX> up" appears to fix it.
> 
> The interface is not what the speed bits depend on: with the single
> exception of 2.5G, which is selected through the XGMII block on USXGMII
> and through the regular speed bits otherwise, each speed maps to one
> field of struct mac_link. The per-interface switches are speed
> validation, and phylink already validates the speed against
> priv->hw->link.caps. So collapse the three switches into one keyed on the
> speed alone, keeping the interface test only for the 2.5G case. This
> covers 10G on 10GBASE-R, and equally 5G, and 1G/100/10 on USXGMII, all of
> which hit "default: return;" today.
> 
> A core that does not support a speed leaves the corresponding mac_link
> field at 0, and phylink will not offer it that speed in the first place.
> For dwxgmac2 at 10G, link.xgmii.speed10000 is XGMAC_CONFIG_SS_10000,
> which is 0 and is the correct speed selection for a 10GBASE-R MAC: ctrl
> then equals old_ctrl, the register write is skipped, and execution
> reaches stmmac_mac_set(..., true).
> 
> Log an error in the default case, since a speed with no entry here leaves
> the MAC disabled and the symptom does not point at the cause.
> 
> Fixes: d8ca113724e7 ("net: stmmac: tegra: Add MGBE support")
> Suggested-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
> Signed-off-by: vadik likholetov <vadikas@gmail.com>
> ---
> v3:
>  - Use phy_speed_to_str() rather than %d for the speed in the error
>    message (Maxime).
>  - Resend as a standalone thread rather than a reply to v1 (Maxime).
> 
> v2:
>  - Collapse the three per-interface switches into a single switch on the
>    speed, rather than adding SPEED_10000 to the generic branch, which
>    left SPEED_5000 and the USXGMII sub-1G speeds broken (Maxime).
>  - netdev_err() in the default case (Andrew).
> 
> Fixes tag: the missing speeds predate the commit cited above. I picked
> d8ca113724e7 because MGBE is the first in-tree user to reach it -- it
> needs a 10GBASE-R interface driven by a rate-matching PHY, so that
> phylink hands the MAC a 10G speed. Happy to re-target it.
> 
> Verified on an AGX Orin devkit (Tegra234 MGBE0 + AQR113C), before and
> after, on the same board and cable. MAC registers read with `ethtool -d`,
> after a physical unplug and replug:
> 
>   stock		MAC_TX_CONFIG 0x00010000 (TE=0)
> 		MAC_RX_CONFIG 0x3ff022c0 (RE=0)
> 		rx_packets frozen, DHCP lease lost
> 
>   patched	MAC_TX_CONFIG 0x00010001 (TE=1)
> 		MAC_RX_CONFIG 0x3ff022c1 (RE=1)
> 		rx_packets keeps climbing, DHCP lease retained
> 
> Only the 10GBASE-R path is covered by hardware here; the other speeds are
> by inspection. Testing was done with MGBE0 handed to a VM via
> vfio-platform, so the driver ran in a guest; the MAC register evidence
> above is read from the device itself and the code path is not
> virtualisation-specific.
> 
>  .../net/ethernet/stmicro/stmmac/stmmac_main.c | 92 ++++++++-----------
>  1 file changed, 37 insertions(+), 55 deletions(-)
> > diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> index 2a0d7eff8..8d3d87549 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> @@ -1083,63 +1083,45 @@ static void stmmac_mac_link_up(struct phylink_config *config,
>  	old_ctrl = readl(priv->ioaddr + MAC_CTRL_REG);
>  	ctrl = old_ctrl & ~priv->hw->link.speed_mask;
>  
> -	if (interface == PHY_INTERFACE_MODE_USXGMII) {
> -		switch (speed) {
> -		case SPEED_10000:
> -			ctrl |= priv->hw->link.xgmii.speed10000;
> -			break;
> -		case SPEED_5000:
> -			ctrl |= priv->hw->link.xgmii.speed5000;
> -			break;
> -		case SPEED_2500:
> +	switch (speed) {
> +	case SPEED_100000:
> +		ctrl |= priv->hw->link.xlgmii.speed100000;
> +		break;
> +	case SPEED_50000:
> +		ctrl |= priv->hw->link.xlgmii.speed50000;
> +		break;
> +	case SPEED_40000:
> +		ctrl |= priv->hw->link.xlgmii.speed40000;
> +		break;
> +	case SPEED_25000:
> +		ctrl |= priv->hw->link.xlgmii.speed25000;
> +		break;
> +	case SPEED_10000:
> +		ctrl |= priv->hw->link.xgmii.speed10000;
> +		break;
> +	case SPEED_5000:
> +		ctrl |= priv->hw->link.xgmii.speed5000;
> +		break;
> +	case SPEED_2500:
> +		if (interface == PHY_INTERFACE_MODE_USXGMII)
>  			ctrl |= priv->hw->link.xgmii.speed2500;
> -			break;
> -		default:
> -			return;

Ok, so now we set this inside the case SPEED_2500 instead of the inverse
which checked the interface and then the speed. So this is the only
special handling still required as mentioned by the commit message. Ok.

Everything looks good to me. I appreciate the detailed explanation and
walk through of the issue and how it doesn't happen at boot.

Reviewed-by: Jacob Keller <jacob.e.keller@intel.com>

