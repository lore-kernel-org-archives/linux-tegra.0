Received: from APC01-PSA-obe.outbound.protection.outlook.com (mail-psaapc01on2042.outbound.protection.outlook.com [40.107.255.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB1E22AC17;
	Thu,  6 Feb 2025 02:36:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.255.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738809398; cv=fail; b=NqE0YM/0jLCBbEqUaGk8uVsvhOoQsmBMtySfVDrowt3dSvA4O74SnDKmv5L20mtW9p3TQad3tU8yqn2pbO+gI0qFVsA1zgo50UlU9gm0HU7njbkuIC9zeCSwRt5D89dCpYT2474djLJ8g0sL4WJt0dFJ/dH2GOUNk+C4auG9zQg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738809398; c=relaxed/simple;
	bh=+5QA07VIDZOBlQ3Q1RIi6f2T82gCJ5GeqH8tty12Ge4=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=gs3pwzh1luMB+InAj3BIz5mHBuIAWlZgLSfauOcRengSz22n/vE/RytCS5uejp0GD6ZNKoUp/7RQBy7wxa1/JeoHQ9ayEUbORZOaLvlUbVtqmEAMKYTiDOohn83Hia6sBE8cSz8LCTZVcod6UgUfbOWmsBuX4tBOVVm1lQlrSh4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com; spf=pass smtp.mailfrom=vivo.com; dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b=N2eZTUU4; arc=fail smtp.client-ip=40.107.255.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b="N2eZTUU4"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zDhE+iOJtkPVriYewgoA176s99KnHZsz/i0mpGKj1YadmBe+Pm8w71TZa52oVc1/bV9m2GEbrZmW6hpMcu++QeOBMIxB9WLvmFGWT+OmWLt2k5XBY3wms7IJf5HmTcOypK15jSj02fNftUOxAqN8kyAYc/gI9x0EWuBEWLjNDHOlp/GPHWrT9TU64+MT8DSHlgrD2FCO1N2aSVF7zpX+rr1lSX2VYyGWm9uPpeOqpgOVt+8HJF9o/n8NCY8DfbQBPYeKrV8BlX2X0nJPVvI488xd178f5ABQgNwFPuqVkexxxgUfVqqN2qXQAa+1SiR8h+btgcMLePNaMdeJDG+XWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+5QA07VIDZOBlQ3Q1RIi6f2T82gCJ5GeqH8tty12Ge4=;
 b=oYOfBKyT+Yk5pXhfeIrSMRy1eYxG4aouO+pAZ6DdMN5UzQR2SFrG0uso1u6uK/FFgq4px1R49wvYAf72qkhbuWtyDOA2HRs9SoRXFy9VAQkrAB5xO/etDR8QpSsYveEI0vAl8SI40XUwPToFtfjvtf9WeBha1fvv0GTzxo6s8Zc6eQ6QZDt6NDhTKJaJigy3zKfI1sPb7HLU7iroL+8vi0abCjmQQ0ohmLu4P7RuWE2YvwC6mw4eE3zYPienkCOFI4msJhE3nm97NjFvjmcqXqXIun/Gt+223UrJvEC26wBng2+N6P70s/kcFo1R37T1qEjPdujVnwjn6hKcDxvI4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+5QA07VIDZOBlQ3Q1RIi6f2T82gCJ5GeqH8tty12Ge4=;
 b=N2eZTUU4h/4M29CHWSZGVwHwZUkyQfabUX5vZTsuwNngvd5asvlZLhYdK/6Txn3Mms6ME7B7dbATmbzG7D0R/z4U6xhXq/gdzSxiy3pbpk/cG/rCVSYWL2weS621A/kddA5dU2vky+BdYsV6RwS6npQFu/vhJZY2EepNHDMS+tVEw+y7x1u8G/YgMGgqSS01qsm1LdonjXL4+sAF/PkiyPNu7NxT2yrnOP045zopoiNiR7AUJylD/cLYIdhh9FqgA5zi10WxKV7NeUwNvxm1OyF1/wDlYEh1yjb59TRl7tMCsz6kojBHu/uh59Q8IzslM0F/OFcQcaivWjHlfH6Prw==
Received: from TYUPR06MB6217.apcprd06.prod.outlook.com (2603:1096:400:358::7)
 by OSQPR06MB7129.apcprd06.prod.outlook.com (2603:1096:604:29d::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.6; Thu, 6 Feb
 2025 02:36:31 +0000
Received: from TYUPR06MB6217.apcprd06.prod.outlook.com
 ([fe80::c18d:f7c6:7590:64fe]) by TYUPR06MB6217.apcprd06.prod.outlook.com
 ([fe80::c18d:f7c6:7590:64fe%6]) with mapi id 15.20.8422.005; Thu, 6 Feb 2025
 02:36:31 +0000
From: =?gb2312?B?uvrBrMfa?= <hulianqin@vivo.com>
To: Pelle Windestam <pelle@windestam.se>, "gregkh@linuxfoundation.org"
	<gregkh@linuxfoundation.org>, Dan Carpenter <dan.carpenter@linaro.org>, Jon
 Hunter <jonathanh@nvidia.com>
CC: Prashanth K <quic_prashk@quicinc.com>, "mwalle@kernel.org"
	<mwalle@kernel.org>, "quic_jjohnson@quicinc.com" <quic_jjohnson@quicinc.com>,
	David Brownell <dbrownell@users.sourceforge.net>, "linux-usb@vger.kernel.org"
	<linux-usb@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, opensource.kernel
	<opensource.kernel@vivo.com>, "linux-tegra@vger.kernel.org"
	<linux-tegra@vger.kernel.org>, Brad Griffis <bgriffis@nvidia.com>, Harshit
 Mogalapalli <harshit.m.mogalapalli@gmail.com>
Subject:
 =?gb2312?B?tPC4tDogtPC4tDogW1BBVENIIHYzXSB1c2I6IGdhZGdldDogdV9zZXJpYWw6?=
 =?gb2312?B?IERpc2FibGUgZXAgYmVmb3JlIHNldHRpbmcgcG9ydCB0byBudWxsIHRvIGZp?=
 =?gb2312?Q?x_the_crash_caused_by_port_being_null?=
Thread-Topic:
 =?gb2312?B?tPC4tDogW1BBVENIIHYzXSB1c2I6IGdhZGdldDogdV9zZXJpYWw6IERpc2Fi?=
 =?gb2312?B?bGUgZXAgYmVmb3JlIHNldHRpbmcgcG9ydCB0byBudWxsIHRvIGZpeCB0aGUg?=
 =?gb2312?Q?crash_caused_by_port_being_null?=
Thread-Index:
 AdtQVu3p636G49OMSa2yDMmE+bdUDgXwT3UAAACXZQAAA0EggAD1y7uAAGoR8AACe8P7MAAbi/4AAA6lbPA=
Date: Thu, 6 Feb 2025 02:36:31 +0000
Message-ID:
 <TYUPR06MB6217BC31BF97CC1E276BF26AD2F62@TYUPR06MB6217.apcprd06.prod.outlook.com>
References:
 <TYUPR06MB621733B5AC690DBDF80A0DCCD2042@TYUPR06MB6217.apcprd06.prod.outlook.com>
 <1037c1ad-9230-4181-b9c3-167dbaa47644@nvidia.com>
 <2025011633-cavity-earthworm-2b5e@gregkh>
 <3d9db530-a0b7-4f18-9ad4-233356dfe68c@nvidia.com>
 <e3a457d6-092b-4b7a-9032-50daddab6f1f@nvidia.com>
 <0fa6c6db-fd75-4a09-b4fa-d6a98bb8afac@stanley.mountain>
 <TYUPR06MB621712E6A082791B397088BFD2F72@TYUPR06MB6217.apcprd06.prod.outlook.com>
 <f264888e-6100-4812-9661-ffad174f45af@windestam.se>
In-Reply-To: <f264888e-6100-4812-9661-ffad174f45af@windestam.se>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYUPR06MB6217:EE_|OSQPR06MB7129:EE_
x-ms-office365-filtering-correlation-id: 614857e5-096d-42f8-200a-08dd465710b5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|7416014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?gb2312?B?QURCclpPb0NxMVZ3cHRKcDMzZ1hmUmZLbE9COTRTdmdyT21hUzc2Q0FBRHp2?=
 =?gb2312?B?YkpKelFtdWJHaDRPNi9BaFdPSWl6WGxkVmpna1N4TkRneFVaSWc3cmttQ2ha?=
 =?gb2312?B?WDFacG9icVY0SU10REhUbFNuU2Y4SFUreDdweFRhc2pKa1FiMTY4a0c0K1Ro?=
 =?gb2312?B?a2RKNjJHb2VvdC9sdVRyclR4WVl3dUc0R2pWbXI1UmF3ckVyUHU5cmZWZStS?=
 =?gb2312?B?VjY1TytXYThSbko4TGJjUEJSUEJTQmlXbU1vL3ViZkdOLzY1bmg0cnpWd2RT?=
 =?gb2312?B?MkdlYUVxeUovM3pmWkprdklEdFRDd3pmOFBXVUtvbGp5Uis0QkhhTmZKSzBJ?=
 =?gb2312?B?RFBxUlJreXBnZGU4S0FtNzF6WklTTnJBdGtieUlSVmdYZjJ2dHNoQlBrd1N3?=
 =?gb2312?B?NnRmU0EvWU96N0FWNXhDNzVMWC8vWDhOZS8xUTRnN2VMbExtZWY0aVdtajJY?=
 =?gb2312?B?ajhlU1dqQW9uUjQycURzYWxQSVNWeWxrdVlTRGh0OGtwM09BdWdhZjNObXJp?=
 =?gb2312?B?M1pBb0Z2MDF0SWkxNmJHTUR1SzBGM3FISGV0dE4yaGM0K2c2VlVFN0RZbmlP?=
 =?gb2312?B?NXFVTjZTeGljQzl1ZmJ1V3FhUVFsL1NZazBCeDd5dTA4aGhGZ2Ryd21SdHQ4?=
 =?gb2312?B?YUNDNU9sWnpKR3VWZ3I2QXlKYkFndGRwWHdWSW5abUJzandyUU1IbEVtMVho?=
 =?gb2312?B?U0t2TGI2eE9tQ2RKMDZLbnpZUW5RYVYrSU9pQnhyekZmcGhwOStnaFFUTk4r?=
 =?gb2312?B?aGwzTmgwVHl5a0d5clBvcW5jNEl1Z0QxakJQZnZ2dGF2cXNWYldzSm8wdEk5?=
 =?gb2312?B?YWtLOEpUK0MvaC9XdHZWYVpIU1dScUlQODUwUU9YM2g4UHgrblBWeC9paE1K?=
 =?gb2312?B?RlRnRmQ0c2xSWHVqVHZrcTlab2QwL1VIMFJ1L3FCcUdQMWltRXk0czFvd1RX?=
 =?gb2312?B?bGlId01vRHRhOENGSGVwanRNOTY3bnZNM040S0NWeUpJNUdNRC9OYnpXZFli?=
 =?gb2312?B?WlRKQURab2V4T2tvSUdLMlQ1QWVPcSs3dHcrT1hDRmEwMlJxRHFjMUZvV2g1?=
 =?gb2312?B?cTVYWVQyc05JTjE2b1dNb2VBQzVORUVuNjZsQm1jdktoYjY1Z3NtR1lQZWtw?=
 =?gb2312?B?dGdOUjhmb0huVnJld2dweVZESVRFRThaUzhkWlpDRFVaamVJb2svaDl0MzV4?=
 =?gb2312?B?cnI1TXdlNlJSRWYwU1lHTGJKd1FJaFFHMVFzOHpET2xMUXpxQWdhWHIya2pX?=
 =?gb2312?B?cVRJOUNGMy9lb1hTZjM1Um5FbytObWRZQ29WcEtSU1A0a1drZytrV09Xa0VK?=
 =?gb2312?B?eHM2WUdXdmVzbTVNT09jcmZ5MU51MHk5WDZsM0NMWEhlY3c1Zi9sWWVTNVVT?=
 =?gb2312?B?WVlvRUZMV2owcG12K2xWK28xemowbVorMGQydWVVckZreFZrN2ZzczlDMkxK?=
 =?gb2312?B?VTlNc0R4UElZbmpUMVlFbzg4dXVrdGRVaTRCak13VTZZQnZaQU15M2dNL1hZ?=
 =?gb2312?B?STAxQ3c0Qlgwam95OTV1RHBwQ1ExWnFHMlVCcjN5M0tIQkFSYVEyNmZWVUlh?=
 =?gb2312?B?SStZelp6K0RaYWxLSGxITEFSMnM4UkJZcUtRTTArOUpia2N6R0ZIalQzanJZ?=
 =?gb2312?B?NWYrcHhzUDZMTzRMbGl5Sk43QzZhUWZXdFlkK0xDUFZqZVVNRnN2cXlOa0xz?=
 =?gb2312?B?NEtPc3RCOWJpWmU0WGhGajNlODlrU1NhQkN4ZmorK3FPTlpwVWNTeHFFRk5x?=
 =?gb2312?B?V0o4YUp6TmFvMENYMHZLRmFtNzFVYVRHVFlNMEhHTzNMNURDSWNJemRjSDVN?=
 =?gb2312?B?U2VTWkZVL1h1SUdTV2lDSk1hVURPbTFEc013SVRRUTdPWGZpZDA1TjRkNFhC?=
 =?gb2312?B?Y1FyNEI3aC9hTXVTaE9sQ2tsK3FMYUtJNWplNitGaG1adWIzSEo3VThucUNG?=
 =?gb2312?Q?Q5Wj8WXjjTXwCNSwqmW7AHeM/Hyz3uH+?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYUPR06MB6217.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?gb2312?B?cFNMT29sZ0s3Qld1SFc2YWpubkQ4ejNlSDkyNTdpQTVQdmNROHV4YkxoeHF6?=
 =?gb2312?B?WTRuMlovc3JYUURVM1lXT3J6RWlVb0E1Vkx6SFp2QkhqcTJySHI4eS9iTisw?=
 =?gb2312?B?c1pPaitKa1hMcUFiWjNZNmZ3Qm4vQWZ3anhDTGYzak1IcWRNTnFHdWhuQkdw?=
 =?gb2312?B?dEdmL3dGbzVPSjlXUFdyWGRXZkE0am54Vm1vVUo4Nks3MG1SWmw0c2VybFQr?=
 =?gb2312?B?elZNU2pKZC9VU3NZSjV4QnNlYmFhYnVOYWFqcWc1VHFMZDQ2TVUranJ5Z3Vp?=
 =?gb2312?B?TDVJQW15M0p3TTNNbDFraVQvdFV0Vlg4LzgwQVhGMXFISStxYkxqWHBjbUg5?=
 =?gb2312?B?L0lodXd4ME9LSUlVWGxKcGFDWnJjeFBKNWNyVS9aNXkzditkVHNoRWJ3bnRr?=
 =?gb2312?B?MmRVbkt3eTJ5VFNqOEkwRndvQURJbVUxWkhtNFhMS29UYnhTOWgvME1DU20v?=
 =?gb2312?B?MUtPWkxWelJaUWZhdlpTRUd5UnkwcmlBY2IvK3pJRTlzL0JJRWxMek9jZUlG?=
 =?gb2312?B?OUM3YzRaV3hrMlZVZWh3STBIYmJSYkg3ZEhUVkdtVkJackFoQWR0RkIzQmtJ?=
 =?gb2312?B?NW1vOGc0ZU5iTUJ1dW9WZFZLRWYwUFdna0JWc0htQllRTXR0MFBNbm9CZmJI?=
 =?gb2312?B?cXFqZk96eStrYnVBQ21tcGl4UEdmNlVia04vY2dnWFo5bXNBM1UrdnZwMU0y?=
 =?gb2312?B?RkxodGF5NWQvR2RleklBeGVDK2ppZTFoc0tQaDQ3N2UrZE1RdjgvUU9zWFpx?=
 =?gb2312?B?NlZzbFUvdjlRejE0eEtNbHNYdi9TVmtqN3RLSE02aFFVMFU3OW83WnlZOFk4?=
 =?gb2312?B?UTFwU1AwTmN3c3EvMzFXNnFLUkR5VjhtekFNMm83UUhqUElvY2U3SlJxWnVH?=
 =?gb2312?B?MmxPSmNhektDcjJIOWZaMlA2KzE3eTN0YWZMYnA5YnlhWlB5aGRiV3F6WnNw?=
 =?gb2312?B?dVVsTGRObnVoanp3U1pTdUN5Nnk2SlM0akwwbUVDOFQ3dWRleWJJejZWNTds?=
 =?gb2312?B?SGF4ejR6dEoxWG5qY3FueXBwdG1jbmZLVVFYZHZOOHV6U3hNYUptUVV3Nkwx?=
 =?gb2312?B?dEdUMjh5ZTY1YUJSRUFteGVaUUF0U1hwa0MyMTZVS29XUTJOYTlReXFodGZO?=
 =?gb2312?B?c1V6NFhBSWpzRGdLZ2ZsdGdJZFFtVWxkVm12UFRNRlVHQ09WbnZObnJITlFq?=
 =?gb2312?B?RHcwV29YUHdTa2tvZWdEQWhhY2ZFeVFLOHZBK0EwcUFyTy9oMitoaVRjeFVJ?=
 =?gb2312?B?Vml4WU05Qld4MytwcXJ3Z3hmMXUzbWU3MytFSlUyNzg4SzF4aURCT2hUYTR6?=
 =?gb2312?B?TC9oZWpvOS9lSmFDam1zVFY1UXZLa0VkQlRJNGVveFB3djdqeUt0a3oxWVN1?=
 =?gb2312?B?WnA3L2FhKzFla2dDTG9TaVZCcHNnOWtmd05Ydk1ZZjMzZUxDWWtCdkJZbHJ3?=
 =?gb2312?B?cnRpVW9sZmRxQm9RSVc5bXEwcVVrMWpXdEM2OU1meCsrSW1KaThmV1Zxd2l1?=
 =?gb2312?B?bXF3bGJtelFJbDZteUIvM1NLc1J6M2tqYzRqRVNEb2NNZVdlZndLb1d6YkN2?=
 =?gb2312?B?V09iN2pvakJia3FSYUU4aGVZWkYzYmFxVmhDZ0JYVjdXUkZYOG5SS2taZFJh?=
 =?gb2312?B?U29nT1VIQmZMVnVpZ2JhZzFvcEFXT2hXdXBwS3NFc3VJbW1ha1JjWGZoemNE?=
 =?gb2312?B?Um1TbFowVXQ1WlhPd1M0Q3loejl2NGFOcGtzOGVoWE1PWVNVOUN1ZUZSMUY5?=
 =?gb2312?B?VTdKaW1XL1JqZ1ZMcVZBNFlySU5Ld1kyMjIvL0JJMjRpM21YdmVnYUgweVdj?=
 =?gb2312?B?OXIyOEErcHZSTU1seEhoV1VxRzlwMHVYUjcxRVl5and6cnYxc2Q5bFJVaSs4?=
 =?gb2312?B?N29jTFF4WC92SEU0M0ZHRjhEUjFaNlpvNFg1VmJiNWZGRzQ1d0tHUUZLb2Vn?=
 =?gb2312?B?OGFzWHdsUWVMbHRsSUEzOU5KS1JPYThRMXpmeU5hZGJLdzd3aUZ4eDRQS2Q2?=
 =?gb2312?B?WUVhQXVjOStkZnQ1OSt5dHJBMFR5RGNBa0MydC8wcTNUS3gzVzRmY3Vmak56?=
 =?gb2312?B?ODNrWEh6S0s3Mk5RRHUxNlo3eHdmZmFnMGVrcG4zYTRuNXZsbUNoZS9qaHFi?=
 =?gb2312?Q?8zM8=3D?=
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYUPR06MB6217.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 614857e5-096d-42f8-200a-08dd465710b5
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Feb 2025 02:36:31.2256
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XJnFiyOCaWsPeCZaE88PDUsKPFkUkWydbgR5NkhL6JmZIkkdCwh+YjQ5u3CQaNC4vzRj1rejpnb0j65BiLn36Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSQPR06MB7129

SGkgIFBlbGxlIFdpbmRlc3RhbToNCiANCj4gPj4+Pj4gT2RkLCB5b3UgaGF2ZSBhIHVzYi1zZXJp
YWwgZ2FkZ2V0IGRldmljZSBpbiB0aGlzIHN5c3RlbSB0aGF0IGlzDQo+ID4+Pj4+IGRpc2Nvbm5l
Y3Rpbmcgc29tZWhvdz8gIFRoYXQgb29wcyBkb2Vzbid0IHBvaW50IHRvIGFueXRoaW5nIGluIHRo
ZQ0KPiA+Pj4+PiB1c2IgZ2FkZ2V0IGNvZGViYXNlLCAiYWxsIiB3ZSBoYXZlIGRvbmUgaXMgbW92
ZSB0aGUgY2FsbCB0bw0KPiA+Pj4+PiBzaHV0ZG93biB0aGUgZW5kcG9pbnRzIHRvIGVhcmxpZXIg
aW4gdGhlIGRpc2Nvbm5lY3QgZnVuY3Rpb24uDQo+ID4+Pj4NCj4gPj4+PiBZZXMgdGhlIGJvYXJk
IHN0YXJ0cyB1c2Itc2VyaWFsIGFuZCB1c2ItZXRoZXJuZXQgZ2FkZ2V0IGFuZCBvbg0KPiA+Pj4+
IHJlYm9vdCB3aGVuIHRlYXJpbmcgaXQgZG93biBJIGFtIHNlZWluZyB0aGUgYWJvdmUuIEFzIHNv
b24gYXMgaXQNCj4gPj4+PiBkaXNhYmxlcyB0aGUgdGVncmEteHVkYyBlbmRwb2ludHMgKGFzIHNl
ZW4gYWJvdmUpIHRoZSBib2FyZCBhcHBlYXJzDQo+ID4+Pj4gdG8NCj4gPj4gc3RhbGwuDQo+ID4+
Pj4NCj4gPj4+Pj4gSSdtIGdsYWQgdG8gcmV2ZXJ0IHRoaXMsIGJ1dCBpdCBmZWVscyByZWFsbHkg
b2RkIHRoYXQgdGhpcyBpcw0KPiA+Pj4+PiBjYXVzaW5nIHlvdSBhbiByY3Ugc3RhbGwgaXNzdWUu
DQo+ID4+Pj4NCj4gPj4+PiBUaGFua3MuIEkgY2FuJ3Qgc2F5IEkgdW5kZXJzdGFuZCBpdCBlaXRo
ZXIsIGJ1dCBJIGFtIGNlcnRhaW4gaXQgaXMNCj4gPj4+PiBjYXVzZWQgYnkgdGhpcyBjaGFuZ2Uu
DQo+ID4+Pj4NCj4gDQo+IEkgZG8gbm90IGhhdmUgbXVjaCB0byBhZGQgaW4gdGVybXMgb2Ygc29s
dXRpb25zIGJ1dCB3YW50IHRvIGNoaW1lIGluIHRoYXQgdGhlDQo+IHNhbWUgaXNzdWUgaGFwcGVu
ZWQgdG8gbWUgdGhlIG90aGVyIGRheSB3aGVuIEkgdXBncmFkZWQgbXkga2VybmVsLiBJdA0KPiBt
YW5pZmVzdHMgaXRzZWxmIHdpdGggdGhlIHJjdSBzdGFsbCB3aGVuZXZlciBJIHRyeSB0byByZWJv
b3QgbXkgZGV2aWNlIHdpdGggdGhlDQo+IFVTQi1jYWJsZSBjb25uZWN0ZWQgKGl0IGlzIGEgdXNi
LXNlcmlhbCBnYWRnZXQgZGV2aWNlKS4gTW92aW5nIHRoZQ0KPiB1c2JfZXBfZGlzYWJsZSgpIGNh
bGxzIHRvIG91dHNpZGUgdGhlIGxvY2sgKHdoZXJlIHRoZXkgd2VyZSBiZWZvcmUgdGhlDQo+IHBh
dGNoKSBzb2x2ZXMgaXQuDQoNCkkgYXBvbG9naXplIGFnYWluLiBJIGRpZG4ndCBjb25zaWRlciBp
dCBjb21wcmVoZW5zaXZlbHkuIFRoZSBtb2RpZmljYXRpb24gcGxhbiBoYXMgaW50cm9kdWNlZCBz
ZXJpb3VzIG5lZ2F0aXZlIHByb2JsZW1zIGZvciB5b3UuDQpUaGUgbWFpbiBsaW5lIG9mIHRoZSBw
YXRjaCBoYXMgYmVlbiByb2xsZWQgYmFjay4NCg0KaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxs
LzIwMjUwMTE3MTEteWlwcGVlLWZldmVyLWE3MzdAZ3JlZ2toLw0KDQpUaGFua3MNCg==
