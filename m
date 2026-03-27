Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013067.outbound.protection.outlook.com [40.93.201.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDB693290D0;
	Fri, 27 Mar 2026 17:46:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.201.67
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774633621; cv=fail; b=q9zddEy++n0Sr3PeyqE+AT0+moGijxiBEOZvix4eC40uuwu5aRQG7371h1NmbhJniLTKeCXpMyjJc8JwFoj98VNJSvE5EEHa2Y1bBjija8K9qaHd8NxZhq8DqjskaPRVdmkVeypdrefw7W/GEqwjuBo+/Da5MXTQGwvTGyqR1aQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774633621; c=relaxed/simple;
	bh=KNjtfC5l9leeOno7vm3j8PyPC7K19/Gk/sDbFRyhDgQ=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=VWOT9joFb+tjty06Ay9Ch15agBJ2tuqIXTTcAY7bXOkzhxn8ARljFpkGPU0HESmIfjA54X6sO2sF+GNugK5VqVO/IfI+5xE7k3XD1CApHpWcD3FzE+E4BweIrD8UBHvWpuHLcV8JJoD8KctV9zMPxCTJhYqNwfWf3kWuwibdWt8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=YQHnIS0p; arc=fail smtp.client-ip=40.93.201.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="YQHnIS0p"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Utae8hEvp2Hh8fzuQU3GO4oewebUnJE9zstU0r0wy75Tf6tWkxZdnHjnQpUCa1Tna5nxb88/4JpiVS/GvMSqK2atS9EAB1ZNGLHZwLkjDyOdgkDDR29Mg/veXIDmCmz0ieuKcJvr0r5zxH4YS4/hAYxUCTkWww8OrmM/l6kyuk9+smHsTuiE3QWUpzhb0Bu+Yi1s8DrwElcr09/MTm2acThBdR9NYVcMohoiCFIPDhGe2ZKbtl6bQDZ+irG4l6LJ3z81m6PtYAzUAczyKvt/AdyG1FpULr1fjO/Ol60l0/e8TMy5BKt9NyKQM52uVjIno80QE/UhyCOMK7dRE1JTLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RGDPv+l1rHcXMwRWs5JzBa6A/qEWV051GBVi5x7SbZc=;
 b=J1xIkbkYRH+Fob1/OH712hRV40ZEHs+p4IQwYBSdWbMgWVuglD7APQvjtZx8W+oz2oSX90qEvP2JujGINydOen/tMSh/8g0IbnPfRTMg3OreAJ+tIOLZe6arxfeH6dDYUl+9JxJqmvMRmUiyUEK3LZ8/uccRAjV54x+rjoaPL5AxAbsw8IvoJ8t74Z2j5avg84diYd+loRTxwAdXrPUiBkgUDzfQx2nApeMv0KAaPLgcmyLzVIQmYzS7ZIU4xc9L6SDS4OS35cfkh3UZyWU+ZGmwHENYmTFP2uvY6aUv/4Zsr6JpFmQTyCK+Yo4ch5KeMy06xmL4LkyvTAqZ2szalw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RGDPv+l1rHcXMwRWs5JzBa6A/qEWV051GBVi5x7SbZc=;
 b=YQHnIS0pIDBvhPdu9De+8+WCVixqt4AFpjEy9lr+JXmDSc5OI4+WBGLzqvbXr0/tEpRdoEx84pUVFgoGNmr7k0Rq5BxdCiecTahG/TQIBnVAwvBbYerCntw+3ibk64qnkBqMMptrJ1ITDbVVb56PgS7DtoA5BajdANEu3BAW+De3RgmNTRNx+ZuIejG/kLU/PI3OaVjUvhtjcUiaxlybwMlJm03dx/YNhxTxS/Pg6IsviD77LJUkzTl0Xoovqi+lFEMY7X1hl/60ObrJdrrUaBJVitgfoepE6a12Ltal/En0zLXoYbGCS5FK6OAytJXO1ce6IODj3oStbXUittDUxQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS2PR12MB9750.namprd12.prod.outlook.com (2603:10b6:8:2b0::12)
 by MN2PR12MB4191.namprd12.prod.outlook.com (2603:10b6:208:1d3::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.10; Fri, 27 Mar
 2026 17:46:55 +0000
Received: from DS2PR12MB9750.namprd12.prod.outlook.com
 ([fe80::56a8:d6bf:e24c:b391]) by DS2PR12MB9750.namprd12.prod.outlook.com
 ([fe80::56a8:d6bf:e24c:b391%6]) with mapi id 15.20.9769.009; Fri, 27 Mar 2026
 17:46:55 +0000
Message-ID: <708f6104-f907-43e3-ad0a-0d124338362b@nvidia.com>
Date: Fri, 27 Mar 2026 17:46:49 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/6] phy: tegra: xusb: Move T186 .set_mode() to common
 implementation
To: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>,
 Mathias Nyman <mathias.nyman@intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Thierry Reding <thierry.reding@gmail.com>, JC Kuo <jckuo@nvidia.com>,
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-usb@vger.kernel.org, linux-tegra@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
 devicetree@vger.kernel.org
References: <20260127-diogo-tegra_phy-v2-0-787b9eed3ed5@tecnico.ulisboa.pt>
 <20260127-diogo-tegra_phy-v2-6-787b9eed3ed5@tecnico.ulisboa.pt>
 <af04fc85-1ed4-4046-86ee-1ffcec8c44cd@nvidia.com>
 <5a5397c8-cc32-4d6b-86a4-76f924ae6d75@tecnico.ulisboa.pt>
 <7a6f8967-c635-4d84-bbab-9e019ff79134@nvidia.com>
 <2c7fa782-f7f1-43c6-bda4-296fa7ab88c2@tecnico.ulisboa.pt>
From: Jon Hunter <jonathanh@nvidia.com>
Content-Language: en-US
In-Reply-To: <2c7fa782-f7f1-43c6-bda4-296fa7ab88c2@tecnico.ulisboa.pt>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0241.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a7::12) To DS2PR12MB9750.namprd12.prod.outlook.com
 (2603:10b6:8:2b0::12)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PR12MB9750:EE_|MN2PR12MB4191:EE_
X-MS-Office365-Filtering-Correlation-Id: ff12ed98-c56d-4f4f-526c-08de8c28d5fd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|7416014|376014|10070799003|921020|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	koA0ctnZi53cw4oVPcYyqowBj2c5cVb4/UjYzysOD7Z0co/oVQ/PvwY9B8CZfUknnDgLuDW2mX8PJiI84rF9bHIu1O6wkzDDyqD9bjo2hOY+ke4mayIIMYvtuD37vSNeztoVg2rjL7UjF/XMweo+PWpK54lGXsZnMmMCtk6mcK676RA9RPOPQR1aFzsVcGPx2iSKjgsUvkTkjffKn2FaRZEsWLSbtBsBlTnDefV4Lph8ogMtJ8vHxyjqHNmEeb7hHBzdjw6GjxXt/pj8bMZb3pAfx+QQhaZ2sjUORgsjaBRC51RaUEHDFJoHT88dDxm01wfHmiSYj8NNdzUgFpFBHOAMj6ho4+dLOhrLc07fv57FmF2RqrS9br132dViQtISlPaNXbH4IcwuHiTi0u1Rp07Pq3KUeQ3edkf91qhhseuraYn8I4+jTdi08QY0a1+SrMcjE36ANEeLul/3Ad8m8edfEDoKTKHurG7x4YigVFGo8LRbR8H/2uAizoPL10lsGGkVPMDuY8iLIEboTBxi1l7VRKZ7d/b7CzqHvd6EidXaSQ+cbNRsSypeTCUvJP6KLLX3YPlD6F6PhX9ZMsCwhfqm7p5qn2SyqDeeEc95duD4bV582WKWJLuplu2ksbh55CITPCJHK9lNarry9Ulct20e+VfBt3z3d7tB4g/hB5Z6X28ccpvXBcCQm/5d/WPLuLT2yhlUQy/7cHA2JpdCkmQLfSzTO8mcWqhX62hKspGCE4SCh9jkngLL8SC2iR/2z5B7/9JEmFNEQ9zbpZAEyA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS2PR12MB9750.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(10070799003)(921020)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MnRTajJKTnEwbno0TElGYi9WUENSamRHRm1IQ1Rrc3BhclhRS2NjUm0zYS9D?=
 =?utf-8?B?NTVBcEFIUWtqeFlVUTF5VXpSVGk1d2Vic0xKZkZGdXNVbXRTVE1hOEtxMFdP?=
 =?utf-8?B?UlNjU28weWVjaitqUjdnSzhMd2FSUFl5MVgwOUJ1VDZ6aXBuelZTUFkzQ1B4?=
 =?utf-8?B?UU4xakRuWTcreks4dU1qRDJBeEJTcUFPRUNWWlRkOTQyNnU4dTR0OXFwTFVi?=
 =?utf-8?B?WDkzV0tFNkxwTElVYkdXcWM3NFJId21qSHZCd3h0NjFQT2psTGNPbDRNR2o5?=
 =?utf-8?B?QnVzMWlMdVl0bVVZcStQU1IvR013QXlKL2ZoT0FtRm9vRkszUFVsUG1jRFZM?=
 =?utf-8?B?M2FoU1ZzTWI0dDljVVVmQ1lDVzFDK3F2R0Y0YlduVGptZFVIbysrTHZHNGpB?=
 =?utf-8?B?ZzBwalFMWXQ3dG5EVFRpQzJCNkN0d0JIUVhtNUJpeDBBM1NpaVNFcFNMcVhj?=
 =?utf-8?B?LzZXUDJKc1R4YlcyZEo1UEZXekUwL0dXeVRqV2VRa3hNVlh2dXJPeERBdkVn?=
 =?utf-8?B?LzNEd0h5SlA1MmRaK3VLa3ZHWjdNU21mREs0bm5kenNTSEx1MnczS3pYUVd3?=
 =?utf-8?B?MklaeFJmNW9vOGFrdENHZkdBbXQyZlFOOUl1RVZ1MmdaT0gxdVBqVy9pT0Fq?=
 =?utf-8?B?UVlPWUFsUmMxVmo2WEtkSytCbEZBN2puUUovUTN0em5XSGozaDRaOWYvOE9C?=
 =?utf-8?B?aEJJSlNTUldTMTl5N01RNFZmMkNLNlg4bXJwdm5WcTBKUHJ0SmhrYXlNTTMy?=
 =?utf-8?B?OG9QK1ZKaEVJZzdDTVAvV2tVT3ZSR3pWMWpva1laYzJZajIrbjJkam8zWkc4?=
 =?utf-8?B?ZWdKZnZoc2R4eitYc0lySnhVUUlVWnczd2w0SXU2NjJ4aFM1dWZFVTEwcTIv?=
 =?utf-8?B?UzZZbjZJVWx1aDA3M2lLbjVIVVZOcE0xdkhHRTkyWjZ0VWVLbWp5SmpFWEFn?=
 =?utf-8?B?ZVV1aU1DdnljQjI1QTdaSnM5ZHEzdU44ODVCRnNTM3laeDlWNXQ5Um1XMU92?=
 =?utf-8?B?bmhoaHZTdWx3a0pPWk8zTi96MDRNRWcxc2xhWnFMczhpQkRZZWZ5NUs1eExx?=
 =?utf-8?B?L1BvQ1RhWmp5b0tHK2ZHaHgxMzhROS9jMGRDQ25JemFkU1NYRjlrZXZlYk9r?=
 =?utf-8?B?Yjc0czJpY2hyQW5LQnQ1V3B2Rk9ZUm5IRFdrdDY4b2loM0RRbUp0Vi8vMEIz?=
 =?utf-8?B?QkFPek1xRWMwN0JKQ012TVdYYnFvUXNIc1hKU2ZVazE1RFYxL0w3YjlaaTZJ?=
 =?utf-8?B?OCtHSFk1TnhVZmxRVldSRXJyWDRHNXp4YUhtTmFZellncFgxTitmalc5NXYr?=
 =?utf-8?B?RjJSR2MrbklZcmd6UW9uRjdvU1dCSUFBQndFOC9BaE5FcVpxVHNsSk5nR1M3?=
 =?utf-8?B?VDZhL2N5d3UxKzlSU0pReHRHL2NzazBnWllGZGNjM0g1SlF4UWNlTWxHM1FO?=
 =?utf-8?B?Z0hFRjEzdVE3NU9YbFRGYW5LQlo2eHIyZnRmMkRETHlkdWs2eWZzSE9lUE5q?=
 =?utf-8?B?VzZla2NBWmx4NW5HVVVhWUJVaHh4RTJVUkQ3cXRQOW4rY0owRUZhNzhuSGdR?=
 =?utf-8?B?NERXSVpob0F3em1xRmt4eGtaSmxMSGpsTHdEUnJ0dnZHR0JlZllsTmRLOUdV?=
 =?utf-8?B?ZnZ6SlhwR2ZXcGp4ekNwZVpFdWp1MkI4QUpJcTJBVTBiTXRsVHVpbnVnWDZs?=
 =?utf-8?B?TzdnbHY1QnlpNXRGYzlLbCs2aG5wS3ViZnd6aWJ1TUFScjF6Z3hVK1FtTWdy?=
 =?utf-8?B?UTEvUjdnMDIvNmJ0c0RPVld6d1RaSmYrMWZ0UFJPQnpTdHVJQmFIQXMvTjdj?=
 =?utf-8?B?SExEdE1BbC90V2ExNEsvQ3dTV2JCbGRrWmVpdFdqN05Mc1p4eUtJRzVnOGoz?=
 =?utf-8?B?T0t4Q0lGT3RKeEdyWmRvaXlCSlRJYjNIbmlYdUxKUEwyanhtOUthbDRUNnQ1?=
 =?utf-8?B?SVZuUVJnTlZKdjlpOFRuYUpPZ2R5dTcyZEJ5MzdsRTJmcmJyT29uelVGR2Ny?=
 =?utf-8?B?dDUwMzh6d1RLU2c0eUZIL1NYczZjYjkvUWpMcXNxSzVhOUM4UEYwTHZhaXdT?=
 =?utf-8?B?SXVIMmFvYzJpK2xwR1FTZTVTR24vNHFsZDJjQzhHL1RYREdwbUVYYXJPYWNH?=
 =?utf-8?B?azVZS040eHp3d21xUHhrOHl3bEthWU92dTRheVV1amhwZ3BmLyt0N1VyMlFa?=
 =?utf-8?B?SE9qb3F6aERKQmNIOEdOZXpPZ2N4MTdrQysxUlJEczMxQXJBVzdkTTJSUUow?=
 =?utf-8?B?NFgvbWgzbVcvYVExRzQyZ3VqaTl1OFpDL1EyL2pacjhjZUlIcmpqcXA5TVdh?=
 =?utf-8?B?d0JIakxTVnVJYmMvdmsxRGNqNjFlNUZOQ3FWZ2E3QVRPL3p1ajk0ZXZsSWtG?=
 =?utf-8?Q?DTXoGpkpsX+SDnT54Vr2JjwiLN2KdFdZ0n2c/Uek8puY/?=
X-MS-Exchange-AntiSpam-MessageData-1: XDBpYit62In3nQ==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ff12ed98-c56d-4f4f-526c-08de8c28d5fd
X-MS-Exchange-CrossTenant-AuthSource: DS2PR12MB9750.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2026 17:46:55.1584
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: n5IMVxxAJguBopM+vBmag2QaTG07fQh8bxGXtjq1L7nLmRYpXv/ERB+do94Xv9KM3VsoTGwpjAy5d74Ojrp0MQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4191


On 24/03/2026 14:36, Diogo Ivo wrote:

...

> Ok, I can make it common there as well. However I still feel like
> reverting cefc1caee9dd leads to cleaner code since vbus_override() and
> id_override() will look similar and only do exactly what they state in
> their names and the overall logic looks cleaner.

Just so you know that while commit cefc1caee9dd was being prepared for
upstream submission, the following had been proposed for this ...

@@ -825,11 +826,11 @@ static int tegra186_utmi_phy_set_mode(struct phy *phy, enum phy_mode mode,
  			tegra186_xusb_padctl_vbus_override(padctl, true);
  		} else if (submode == USB_ROLE_NONE) {
  			/*
-			 * When port is peripheral only or role transitions to
-			 * USB_ROLE_NONE from USB_ROLE_DEVICE, regulator is not
-			 * enabled.
+			 * The regulator is disabled only when the role transitions
+			 * from USB_ROLE_HOST to USB_ROLE_NONE.
  			 */
-			if (regulator_is_enabled(port->supply))
+			value = padctl_readl(padctl, USB2_VBUS_ID);
+			if (!(value & ID_OVERRIDE_FLOATING))
  				regulator_disable(port->supply);

This shows the relationship between ID override and the regulator and
hence it was moved into id_override(). This is different to your fix
in patch 5/6. So given that we have been using cefc1caee9dd now for
sometime, I don't wish to change the implementation unless there is a
valid reason.

Jon

-- 
nvpublic

