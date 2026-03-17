Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011049.outbound.protection.outlook.com [40.107.74.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E23636494D;
	Tue, 17 Mar 2026 23:02:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773788575; cv=fail; b=j8ZyyAsxnk4Ls+4HwUbKPERwpGIgIyHPLo08cINLOlSYBQ2g65wXtrtyE78njE7y2NJLgOiu+bHXXZqdKFVYKaIONo1pxDXVeT9M7cJZA3Kxa/MM6LQRsgINIkP5SzwycttBpO6ETjpiYKw6AHIQjWoVfTSJIk5lS9Z7uJJDpxs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773788575; c=relaxed/simple;
	bh=pxXnEF7Jmnp2dJEI21gOaq4nk4WJxiJHXwuH9wesZnA=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=kWnZ1lzE7k9YcLO6YuWEsyCVoXXQZF+v+K8Jco/T+KDvauC9kEvzudB8XE98vKMNRkutWizzEcPsTxquhFvyOSW3h8TIfWMb/pVYj/gcTfsjbIdxOD2+YVG4/mDh00IUj/r0COmtjgXtbhY8GPe/XySyujsCXwN4RPSK9wv1Sjo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=Viy7kg4M; arc=fail smtp.client-ip=40.107.74.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="Viy7kg4M"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QyLJ0aqzZW7GXW2CL0ZbyL5o6xf38fWUO8ExS5K2YFo+hoHObYd4i+suS20l7LuIkW53XJUoLgK7dGH6mUG9lCNjqv8DoA7nNQMBrSGYw6FRGuZJNIc4aCwSQfjwbPg89SaWn/oLWmuf5QqYTrgStw7B9cRTDCOxx+PukGPvUey6Y3m+szNzYcCoZd5IzZic72fGoIlyAwpNNdIvnTpuOQ5D0/AxEXg91PDqzTgb37sYhC8BchNWQvz9kJXNwnmkUJtxiVI3TaM+ypfNKNxpdw6hC/staCo9ROyeAXOM4Z9CbF9vh8Fgd1ju1ilAR9XV9wHW/P+/f/eFJYb33bPKhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5PrnhXeKf845kHr1cFVUWoyHQuzf6xx/4Y1LoLanido=;
 b=sz8TnY3VZ8k8tuENoETZSKqCwryUT2rQsbeMzGaFdIj21V6/1TNTN2HZtETT4RlFvOH/R2tE/o723hS/5ETe/oYGfShJEA+fd4I2so89uNvoOB8wnZv9x6m4Xxj4KaxF52LdC+IxFImTIgkGqf97Z/zdREbJ6+OQJr3qF60YFPafso2KiGtMrGMgAu/9gDaQoK5g8uTLagAxr/NIqqtwb5TBm7aBxV7aN8B8ZGnX29E2UFewtQ3VXPIhtd6TJ9UK6TpnzUbEKcFD9UobYBKHynaM80xOIRkmOk5pmoJEleNFg7aMvxTatn9DodoTbQTP6+KVbTEG1nsGGl2a882BDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5PrnhXeKf845kHr1cFVUWoyHQuzf6xx/4Y1LoLanido=;
 b=Viy7kg4MqDFBNWtxG8t3+kzVLxLBoHtHOLvFRyl5aL5Ve7TrhBPqqgCuYpwFtJIINmh7SNQXtJQs1q7Usc06qmGpbcw4CZ9WiXE9rtArsIz2V6hZ0XKDtiEX9IJ1YQGeKjbaa6GRvodVSo2WjLBdV6RxVeTokKu5tRAwAEjIxO8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by OS9PR01MB15493.jpnprd01.prod.outlook.com (2603:1096:604:3bf::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.22; Tue, 17 Mar
 2026 23:02:50 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%4]) with mapi id 15.20.9700.024; Tue, 17 Mar 2026
 23:02:32 +0000
Message-ID: <87cy12hxeu.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Mark Brown <broonie@kernel.org>
Cc: Sheetal <sheetal@nvidia.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Mohan Kumar <mkumard@nvidia.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-tegra@vger.kernel.org
Subject: Re: [PATCH 1/2] ASoC: simple-card-utils: add ignore_zero_sysclk flag
In-Reply-To: <ac95d92e-7304-49e7-9582-666eac386102@sirena.org.uk>
References: <20260317094910.1582011-1-sheetal@nvidia.com>
	<20260317094910.1582011-2-sheetal@nvidia.com>
	<ac95d92e-7304-49e7-9582-666eac386102@sirena.org.uk>
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 17 Mar 2026 23:02:31 +0000
X-ClientProxiedBy: OS0PR01CA0123.jpnprd01.prod.outlook.com
 (2603:1096:604:9b::22) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|OS9PR01MB15493:EE_
X-MS-Office365-Filtering-Correlation-Id: 5f1228cd-03a9-45cc-f3c9-08de84794525
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|376014|7416014|366016|22082099003|18002099003|56012099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	jiGnETCbHGNr4xVpUddz0FV0MWzAbsRWSDAxJis5z4Daf0tySKQIHtfXvJza+t7WMVS/+iETAjWwIMp6Tl4b9RcfLr6opVa80B6QCDTpxlSszITL+gVAdF54I+1ty3hoBO88rcVRfm73Walp0/cte4jrmIh2O1cNMqVHH+gWoC+rWf2QiZkx3lmhGvDo/B402YaKKRpi8wgL4eSI2Of47NK4h5ayfZzeq4SK6RGUK6gQyQ3LXBKz6SQMDEmPM/W953WIgeSBzduLnew4urkoALnAUBVrLdCRS2xxuhRNCsKj4yBM9g7GHIVyVyv09v3vP5F2glT7/K46bdoayIqz7VT3fSBgSsjCZ7YJtHXE5UjjUkjidYpiyrxKWN996Z/hhaYzUeR1FwHZatQpOdY8PPjVupuZxGtLM8Yl0FPY6Cr4aqcCS+yoOde9TYcxvByEWLYxtJFtgq31aleG+CSXTBeEjNBY73SplVoWxnwvFSV/WZIGrtdG4Sk0WVCM52pRiZKirPTMukuRilpyrNOZKm1DA6w42UaMDmFm0gx5t+9//lFCWrjrqHtlsxbCq+rUk0EwNGK74NJ9NmMw8FyxGFfuyRJ+UuC21kJ1aYfsCS1PAZA6GJY4cJU4+DYJ+qr6CqjVKEann1oqlg1D06CSNpoh/0s3RtGpmeYOEZOLz6hi2urjdFQ9feQtH3ZPs+7rqakk7bEtQh0iqKUZ950hIZn0JnqDAPT0fJN06RrTjj51i3M/JV347GeRCi+ut+ek7jbYwaY1gW66zN28pG+QmVLSZ9ilbUAz95OdL+evTug=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(7416014)(366016)(22082099003)(18002099003)(56012099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Qa2VtgoBhrznkuysfI7P0kaC1lLnfgZX8bNXp+iX7wFp5xk1ze820ToXy927?=
 =?us-ascii?Q?ftAB6xdQI3zG/TwWNd6lbC/2mf0x7tIkTJrV7ZBS+/SRcI8QM1XwBXEoZ1kE?=
 =?us-ascii?Q?IIcVteuaD9grMoXvjxNeUullhtjsj+NKta0Hf7eJLdjkn/XZbDuZaBMl4b9R?=
 =?us-ascii?Q?07aoMwAh+EqIJezjYNhZHtFSpsg76O4gBJnZI1gzFlHE+nTy7cvWisXcY7mr?=
 =?us-ascii?Q?2aJ9fvI3uEF5Y1yN08AOZSmIvFr0Xam2Bus+2DCSj17qqVdasUYT8wb9MpLO?=
 =?us-ascii?Q?+TIFrQeBMYtbahgjL93kNT4zitLH4cxO5SBwDesUo3+o50g4LmTAu34bnnRY?=
 =?us-ascii?Q?IWhUtlT7l2I4vZwkt/2ssmOXH+rgq0+APZnDGlsoai0SZ2ZKo2WAbuT7Wkpy?=
 =?us-ascii?Q?ByzerNlZBzVSCP9NwTstPLPPPaGnr1OXxNsUTaxqNb6kAxEQeKVngoh1u1pK?=
 =?us-ascii?Q?eHu7Wh2HeexD2w2hN/TRO3gx4Tn1g5CHvJNXFWOeCt5+iAAdjIlOMrWJRa1Q?=
 =?us-ascii?Q?BKtzusb2i2BeHySRYrmv8Mkw5yssG1gqbm0xhdDj9XomqReh23jBR+FJzTXq?=
 =?us-ascii?Q?rXZtxFrk6lwJAlHvU3coJ/EFg+1VxcnZ4aBxLnU6tECZprgDcYuAip49vj+t?=
 =?us-ascii?Q?gv8UhJhO1ycdWSCdt9H1WnYv3hCSSI1xZHRn+81zY4om7whpo4wobES/PdJB?=
 =?us-ascii?Q?a3vsKKGWF4kBWek88xQlddTZ7i+tU/iBWxd2UZWEaES9KQUx34iNVefl9+k0?=
 =?us-ascii?Q?ujJSWAOPbljjiXZ/yd3+eC1pKZvfLdUPpovUSfiIPUobSZf50hyQtjpDi5hD?=
 =?us-ascii?Q?ZS9vTbw8w5pAd8hFxUafYM4Cibi31tgeIV329o/z8I6fo54MIqwkuemWrARC?=
 =?us-ascii?Q?mryh9UyZHSITsDHBnNoEsb6ZIgQqTWfgc3wy3a4eyKen0v8PO/Y8Oxk12G52?=
 =?us-ascii?Q?8MgmEQ0DQVX3Alraptn6FZeMzpPqnHqCayKnKrpJXalHl3SPEOOfHVCRbxh1?=
 =?us-ascii?Q?NH1jrXQqQ69E8x0FxfDHJ8q5OVDys0BGbP4F5kvcQde0Ck6H/Gz48UwKGiMy?=
 =?us-ascii?Q?wVAH/LNoHW/rN/1DVF5Dw95gDr+IadBrtpm7dPiBTFWU4T7+oIP5qk0yAk8V?=
 =?us-ascii?Q?+P8qNq8//igStTs6NJu2oNfGrSMQ2lIs87DyMrdKk0BoGqxE2u09TGVz6TVD?=
 =?us-ascii?Q?Q7HVsX+V4ZTZv54ZLLxtntoDmlZaqxfZ7fTWpNAdebBcWjCj96Sx4exIlMEi?=
 =?us-ascii?Q?XEuHp+SHJqEj6VWxysvVBwACxi1TcEnptVNRVfqDXkE/f026FLBGloVn1bb7?=
 =?us-ascii?Q?hcobBXfUh89fG4Fn3oUFr8xAMg4S+J2+M1uEJU/H/SI46v+Gu+82ujoHGV3/?=
 =?us-ascii?Q?gl1zyThf1MCtCn9asK4KLkZgiX525IKPNAya2OBj54+WKgv7E/k8ZPkiR1eZ?=
 =?us-ascii?Q?xFQIqE60pni2tFJ1z7ccRLDkPQw1jK9l8GgsL4VGrfNyatVIoaQgCY9RYhsp?=
 =?us-ascii?Q?gfWc8dIQKAskwCrllC9T5tM/XqaMlmA0Zn71TlP4MRyCnK+JZDA1nMgo+5Qe?=
 =?us-ascii?Q?SXpzWbryrrbElIUn4AOJOTJblDFqUSxmwi8vKLhCVk1B6HdfFA5qHMZ0nCrV?=
 =?us-ascii?Q?nHjn1gZ3D+JyxdkXaX6QkkalICi37FbXlNwKfZEQiUjuprr3+BIVoPiaN7Jh?=
 =?us-ascii?Q?uQB3vkOI1yOne1mm0FrbamE3JHcOISzcIfJDXMFpDm/dJqyvLhh7i5cyy079?=
 =?us-ascii?Q?GITpPxGpajRdwZyo4gBUdQbDDo90CW1ES4rtQzGa/ZFuvLTuVnny?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f1228cd-03a9-45cc-f3c9-08de84794525
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2026 23:02:32.0120
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7nrLXu1bMFehiulaK420v57ujo6SOcdirmjKUueLtpwFGKcJi/eUj//K9t4Jp9yzFgn21RWfVI87x9Ryvr0HbRdAA3zNfMBqSwdg88k03YlvVI6BuYtlpuEc7LsCNyyl
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS9PR01MB15493


Hi

> > Commit 2458adb8f92a ("SoC: simple-card-utils: set 0Hz to
> > sysclk when shutdown") updated the simple-card-util driver to
> > send 0Hz frequency requests during stream shutdown, which can
> > request frequencies lower than a platform may support.
> 
> > Add ignore_zero_sysclk flag to struct simple_util_priv to allow drivers
> > to ignore these 0Hz sysclk requests when they would result in a clock
> > frequency below the hardware's minimum allowed rate.
> 
> If the driver simply can't tolerate disabling the sysclk it seems like
> it would be easier to just have the driver directly ignore attempts to
> do so rather than adding this flag which the driver has to set only to
> get it passed in?

Agree.
I think this commit can help you ?

	1e1a2ef95b571825ca9c0113f6bef51e9cec98b0
	("ASoC: da7213: Avoid setting PLL when closing audio stream")

Thank you for your help !!

Best regards
---
Kuninori Morimoto
