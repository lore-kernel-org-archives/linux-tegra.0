Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.46.13
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793598009;
	b=XOe5NyM4hdhpZY0sxwsWUYGzhwVcJrOoHtlKKk9CJbwwwlmyHstZ6HmbFl9jL79P/Xo5
	 yWicO8USvKjJSMEqRmqYLipM+oGzZUDVCTcBmHME0vWdyD9CITUR0aJa98hX42kodNE3H
	 Tw3pYkiIR5yqBz4XWCwXtuyGHcJe/nTU4MC7cwlawJIuO5MgoT9WFJ23Mvp+S5IyzmqvF
	 /cgNWfr/XSB2VYiJysW0vyfCj8mOZTIUEekQcXe856wByE8o6RGGTZmWwWkAH8fCjDoDB
	 r7igqD0SZn7VN7VaD1bZrYvFLZIe2xo61u69bqoDHCVGpbd5/F8XWNq9Jw/3V7O2phg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793598009;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:In-Reply-To:References:Content-Transfer-Encoding:
	 Content-Type:X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:
	 X-MS-Exchange-AntiSpam-MessageData-1:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=wKPRY0Fmzx5rZFLsrSxE3jWzNTb9XIRyNaAjKnmeL0s=;
	b=c8KzpZgwm5Dzd5gcabQvhbG3kEJe+Yi4gSO/1A8Cxub1XuRK3c6OcizmXZq/cLJwaJzz
	 IxcfpleTtn6td0BWnukACuuKXMMEWr0uvhEBui7/sVAH7GI8wST5uIUPcUs48uhEQHEGX
	 h8aDANPEH2k4bn1MkC6a83Gx7Qc4+sjBngmIFwXXTFnLOZS4FXqM8ThkiuJ2qHyP6sWdr
	 vGjjfBtp2Y5is5Mj/anpkPcTpzpBNrm+x6r29T70xh+9NKP7qSwydLYDrm0JqT3Wq3e2q
	 C6j4e/KHA1QiQVr4daViHjMrMS+Wi1mI7Z4uq9+pdq5bqg15zveYvvvHvUXKH5xRE+w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=jMsqhiGG;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.46.13
Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11010013.outbound.protection.outlook.com [52.101.46.13])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23FA1606A324;
	Mon,  2 Nov 2026 05:40:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 23FA1606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=jMsqhiGG
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nHixRRa9uey1wLcLgoNjdRAuREtNcB+K7zKowbOpofMRyW6y03dRrawpIW3525SKG/2j5zW4nDrWdTSiEJ7Q2ZDUV7DL0H21A2tZpBVQqBS296pCHORb33AG+U+VNECLTSrltK8Y05rZf8bJy34PTuzzCW5+MO2NH4RS1CF3LgoXaZtGBak+ocJ5GmPYe4aS83mAYEz2n+PYWTCB90ReksPUMMoFWkKKckCS5QiK7j4XGn9xf2Q35TBRoLvbh2gYC3DqP7vgMiX17svOeMlA8eaLWgE7BHYtLtasXnAaTU380VHpr+lDhquCR6gcOlrSk7InLLzV8hRUUno9kwzajA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wKPRY0Fmzx5rZFLsrSxE3jWzNTb9XIRyNaAjKnmeL0s=;
 b=vV+RglgcG+kJigNihKzAX0emXnixzn+q92jlx4R5Xmow9VuwvH9V0yDKTJ6zRfUqgUwhMN5bchwHHNo7kMwKsipt6yfiSvEgKRE5tth5saPqT9a27tlePNSfnJNqngNmHC5V+AX0sda/MAGFS96XBnRKoa3CRu2uTupbYfA9ZY+DgYLVPAPykdJJdnarQth6F/rPrsbTydp/BIC/U/I6kXtUB4yhdcE2Ogk8e9j2Dw46DsZ5axZOHnkAjtvbpim+E8WSK0fbtRH3g0FaYZk6nOeM7zBK5HKbKvuW0c675/jX6oEZoPn6/K2zF9wBcVTSw3SgIHcLR8UwhwcxjZpYCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wKPRY0Fmzx5rZFLsrSxE3jWzNTb9XIRyNaAjKnmeL0s=;
 b=jMsqhiGGPIHfppXgMfLkVJYNrNMwWUGL1gqx2Km3zjpn5dU7DfwuWr0OdV/p1ic+oTJKxncaffYHundx/cbLgf0BeDTaW6uS9KAbk1ob6GQR13/oCBsZPDbfdVEt6U3C/5t1N5oADFnwWCFTXDVWkBqop3A3i9oM+FDU3msdZLZQAcsIXC9spy0WUytPzegzH6sEAAlWHQgWss42G5N8sS8SmzqakSHpc4MifY7pU4nYMC+IyhX0rRQT6ZRWX1yEWnlJ9Bw95Ns6UaefKI9aZg6yc/Fa9JqwcGlaejVseNnzYfDcIZ5z7kDj8fuxNsuhXRX8uodwjyKDKJ7KdKUHtg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SJ2PR12MB9161.namprd12.prod.outlook.com (2603:10b6:a03:566::20)
 by CH2PR12MB4151.namprd12.prod.outlook.com (2603:10b6:610:78::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Mon, 2 Nov
 2026 05:39:59 +0000
Received: from SJ2PR12MB9161.namprd12.prod.outlook.com
 ([fe80::d9d1:8c49:a703:b017]) by SJ2PR12MB9161.namprd12.prod.outlook.com
 ([fe80::d9d1:8c49:a703:b017%5]) with mapi id 15.21.0569.011; Mon, 2 Nov 2026
 05:39:59 +0000
From: Mikko Perttunen <mperttunen@nvidia.com>
To: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Thierry Reding <thierry.reding@kernel.org>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Prashant Gaikwad <pgaikwad@nvidia.com>, webgeek1234@gmail.com
Cc: Thierry Reding <thierry.reding@gmail.com>, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-tegra@vger.kernel.org,
 linux-kernel@vger.kernel.org, Thomas Makin <halorocker89@gmail.com>,
 Aaron Kling <webgeek1234@gmail.com>
Subject: Re: [PATCH 2/2] clk: tegra: Add Tegra210B01 support
Date: Mon, 02 Nov 2026 14:39:51 +0900
Message-ID: <x--IMcHvTq2_B7PIyTR2aQ@nvidia.com>
In-Reply-To: <20261018-t210b01-clocks-v1-2-d9e980925925@gmail.com>
References:
 <20261018-t210b01-clocks-v1-0-d9e980925925@gmail.com>
 <20261018-t210b01-clocks-v1-2-d9e980925925@gmail.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-ClientProxiedBy: TYCPR01CA0153.jpnprd01.prod.outlook.com
 (2603:1096:400:2b1::12) To SJ2PR12MB9161.namprd12.prod.outlook.com
 (2603:10b6:a03:566::20)
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Post: <mailto:linux-tegra@vger.kernel.org>
List-Help: <mailto:linux-tegra+help@vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-tegra+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB9161:EE_|CH2PR12MB4151:EE_
X-MS-Office365-Filtering-Correlation-Id: 7a1f660f-30ee-4cd1-57d0-08df38a3bb85
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|23010399003|376014|10070799003|7416014|921020|260925022911599003|260925021311599003|260925021911599003|11063799006|5023799004|4143699003|56012099006|261009223027099003|261028144727099003|261021121427099003|261021123027099003|261026121527099003|261026140227099003|261022113327099003|261022075727099003|261022105027099003|10067099003|18002099003|22082099003|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info:
	gi3mugplSaqCz8C0yCjHLDugCfBbtEB/ETceHSMLrTSKwYrAbFGTqQORd2kS75wpa9q6L4IrnTIUGjd72OTIOkR8tPuDKbEYIirOP0kf3by+xLWLH5XnURojRWRMiDVYCCLWdJVnpRf1jRTya5cYHOLDirxJ+KKBCAiOsBXhdAjgcHwAywXFJCuHj/tNOjlyOeqrK5zoGwXJNkVDmAEtj/kQurFY+ZNP6uh9Lfj1fY6o4AbQz5hEcd8yTxw68WTlyQ1bljHMDfYclXQANM1pplbfGVOJt5CGuwJGPUTL8dFhhB542/kzB1Biy2NMzzOFUa8O+VJ9L0DNtTT1MBB4W1rkZxp+lWJqzzbLRB7BZof57RuG7i/AZpxIZIdQ4A2IhQD8rDzuu5wsmVCjLjQcpYN+LUwTbPPBqNuaWESq+1Ru3x+lPgIXm+L1Vl0pRxMPtV3IJU9hffyIYCjhI0Nuu97kFVFMW/AbsPGp9QYcnuu1muzmTx3E4Qwpawrc35ZLSrD/+6i5bRuGMqJwrDY5xqPc2Nh5IjBPv7klb5jVQYe5prZ5U5bw5frQUDxGZktu2VPO5f154rI0ZTebpRdt2I+vg06IV7H8RG9o6X5KiQ5V20gn1L22zBPCKH/gDwmSkn4SF+TgE3tjA56yZyXgmWZWLUAdG5/lXs2JIfSigAPaYH56uxgNOjx6XMU0uvulnWvCXChZtiAJkZPweY+4Ew==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB9161.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(10070799003)(7416014)(921020)(260925022911599003)(260925021311599003)(260925021911599003)(11063799006)(5023799004)(4143699003)(56012099006)(261009223027099003)(261028144727099003)(261021121427099003)(261021123027099003)(261026121527099003)(261026140227099003)(261022113327099003)(261022075727099003)(261022105027099003)(10067099003)(18002099003)(22082099003)(6133799003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZHRXeHFPYXIxVjVJamZZY2lCWmtvdzc1V2UxSDZIaWdUeHdEb25KRkk4RHZC?=
 =?utf-8?B?VHdvOWMyYTdSMUxsR1dmNkVORDRyeUkzbXVCamRGUG1GQlA3eXJDQzZMT2lN?=
 =?utf-8?B?eXB1OHQ1ZUNSYkEyZEhqK1NSWXQ0dHZkMzF3TTZUb0pObFp0Y01Ld3IvQUJ4?=
 =?utf-8?B?VEVLS3lFNnVQeDRJVzh5cFlkc09VaXBPN0hVRjhDcVVtdEtxdWJaS0tZeGpm?=
 =?utf-8?B?OGJJQWp1KzhUbWNTbC9VSHo4eHMvdXRvNGFXT2h1ZG5kM0ppYWFlNkE2RHJ4?=
 =?utf-8?B?VFRtR3gxVzZvUlhuUTVSVHpaWStkUE1ZMlU4K2w2ZjBidGZySS9PTWF1OFhH?=
 =?utf-8?B?dzFGN1Nra0IwdEh3VHpaQ3psSUV5OHlIc0F3SUJsMHNISkpPU3ovNXlEVGZZ?=
 =?utf-8?B?d3ZVM3JBNXJZZHNVQks2ZGNnTHlVK3owZjV6R0MyUHR3UFpxMjNueEphTURy?=
 =?utf-8?B?d2tua0dqeTl5YlhhTUI4bUtkbEQ3MG5mbXJtQ05DaFJGRzBqdmthZ2I5Rjly?=
 =?utf-8?B?R2RmbFVLNGlmSG45VVlwanFzcVFERW1ZZ2RwTWo0OHlOTENSYXp0cHhRVkRt?=
 =?utf-8?B?NmVrTUdmVUlOMnJWeityRkRFcURRanRMSlZKNm8veFg2M3R1Z2g0c3hiaUFa?=
 =?utf-8?B?WnZXUUI5d3N5TnExblByaXE5Tkx2eFhhYmhTUnl5bm9qOEZqd3JLVkdiNyto?=
 =?utf-8?B?OVpkdmtzSzRib2IrRUZWakVmc0tOcG52K0xLamhEMWowMzl3RWtOa0lkNGVJ?=
 =?utf-8?B?bkQ4N1RzRnZ6YUZPbkN6cjV1NXo3Q290b2FKZmdYc3pIckh2bTd3aWVVWCtm?=
 =?utf-8?B?K2NMY2RnY1FQY1pzSDNjUWVJOEZmZmFndlFTcGNUbVRSQkRoUU1KZ1RLM1A4?=
 =?utf-8?B?ZEljQjZUZmc2dXRyOUUzVlZxOTFYdFBLcHZpRWNXMUw4Z0NSSzl6YjM3V3F6?=
 =?utf-8?B?N1J5OEliVWVYRTI3ajdZQlBQN253cnQ4QVRHK3Fqd3lGbXE0VEtBQU9zcDJI?=
 =?utf-8?B?ZEkwTStKK2hLYW9jT1lQMk5ENzdCM2gyVHFxRENpVk1WZjZaK0M0KzNsb1pJ?=
 =?utf-8?B?UzBMb1oxMjQvN2FVSkhub1RwcXppL1plRGhTcSt5c21DWGRHRzZDZEszNzJk?=
 =?utf-8?B?bVM2RXRSVHpNbnB1QXV6ci9pV0ttQXN0YlhGczZHT3JzandsOVc2OU5rS3I2?=
 =?utf-8?B?NmQvOTNmQU9DQTVsZm5nOXduaTNwSmpleUl5dVk5ZmtOWk1seUphMmgzdGx0?=
 =?utf-8?B?VTFVWmVsM0t3QVVCeHlqUHF2WERwL0kxbGk5MjFQc1U4aE1sME1qdVg2VUxN?=
 =?utf-8?B?T0dlNjk4OFFtaGNOUi9mN3RXaXE2VURic3Y5VEIwZzJ6VXYySFVNOFd6cDB2?=
 =?utf-8?B?ODJ3d2ViSTN5ckRsdFBOYWRpNDRKMlZFamJDclVjM2haUGwwZFpoNnllVHdr?=
 =?utf-8?B?N0Y3akQrbTZhWUcwVlAyQTJIeEpkM2wvdHdJVkhQUE80Wks0WnVyT0xOR1Ux?=
 =?utf-8?B?K2REVFRMQXdwdy9palV4VlViMXRVRDRYMUNxSUVhMmh4ajFzNlBMZGdUK2hn?=
 =?utf-8?B?SHQvNmpDYlA3TDF2VzdHMFVZRjFCUFRWc1M2SVR6d2krTXVLUjE4VEhFbUNO?=
 =?utf-8?B?Nko4Q2JjRlluOGttWlJwZHlnYXZIZ0wvVkdvRjU1TlVIZmtCZ1JOaDRZQnVu?=
 =?utf-8?B?T24rV244V1lxOGtPblp4Z1Ezck16YUpSUWMzNk9XTGlORzdmdGs5UVNWcis1?=
 =?utf-8?B?QmNub2hmbld1TmQ4Sk83bGFOOXRNL0Erc0pzaDlJdnNwSGlvUnB2SXVXYjRY?=
 =?utf-8?B?UWh5YW9FZHBvWnpjMjZQUWZDRGwyTXZEeGhhK0Q5a2FsckV2d2xDMGZaMzR4?=
 =?utf-8?B?a1JHRVZqWGxNWllHbXlpck5RamVtQnNONWt6M2IvcFk1cnREa3laSWZER2p3?=
 =?utf-8?B?cW5CNmhYa2VIcVNJNjdhekpnTUx5dTBQOTFoeDRiYXNHR2NXdDhDN083aDJm?=
 =?utf-8?B?WUxqOGRxcjZMLzBET1RpWTdPQVFOekJHeGxFeUNRaXBuU2hGUCtaL2tJa2h5?=
 =?utf-8?B?RFdXeG5wYklpQ1BRTW9UVHJaUDJ6ZGtjYkhWeWlUSW0zVWhFY0Y0N1pYTWVE?=
 =?utf-8?B?RmxLYzdpS2xPdFNObjZ4NmhFQWhab1NoTVRKNnV6U2pwNjJ1bElLb3M3dWp4?=
 =?utf-8?B?bkdwN2NLZUlsazFlV2hINFkzOTB5VE96TnlaL1NZMVB6cjBJT3NmZnpMbVA4?=
 =?utf-8?B?ZXhrWVpZS0drQzNxd3ZCZCt6eFFwc1BzMFpBNUIxQlB4RC9tWVlPNmdRVk1Q?=
 =?utf-8?B?ZFRlNE9LeEJrM2Y5UzZEcjB2eE1zc3RoZmpFYWNsODRYcytUVFFvV0Ywa0NM?=
 =?utf-8?Q?fY5zHFvY4LejefPS+lj6bvYhHRO+7jNXuivIBE+xi8Clu?=
X-MS-Exchange-AntiSpam-MessageData-1: oLTKL9G/9Ved8w==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a1f660f-30ee-4cd1-57d0-08df38a3bb85
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB9161.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2026 05:39:59.1506
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XoCODeJlqfYMZEVrpNX91G2Ty4AdU8Yu4FK4T6sHb63kplmYa0Fk2PZZcpcRPrdi46rWl/3bVkBRiMSPzAs9UQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4151

On Monday, October 19, 2026 7:46=E2=80=AFAM Aaron Kling via B4 Relay wrote:
> From: Aaron Kling <webgeek1234@gmail.com>
>=20
> This is based on the downstream Nvidia 5.10 kernel. That version was
> semi-integrated into the Tegra210 clock driver. Looking at the existing
> Tegra210 support, it made more sense to make this a fully independent
> driver, so that is implemented here.
>=20
> Based-on: https://gitlab.com/nvidia/nv-tegra/linux-nvidia/-/blob/7150a919=
12b7e21c5f9f3a83e7b7362a75e52945/drivers/clk/tegra/clk-tegra210b01.c
> Co-developed-by: Thomas Makin <halorocker89@gmail.com>
> Signed-off-by: Thomas Makin <halorocker89@gmail.com>
> Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
> ---
>  drivers/clk/tegra/Makefile           |    1 +
>  drivers/clk/tegra/clk-tegra-periph.c |    3 +
>  drivers/clk/tegra/clk-tegra210b01.c  | 3524 ++++++++++++++++++++++++++++=
++++++
>  drivers/clk/tegra/clk-utils.c        |    5 +-
>  drivers/clk/tegra/clk.c              |   19 +-
>  drivers/clk/tegra/clk.h              |    6 +
>  include/linux/clk/tegra.h            |    4 +
>  7 files changed, 3559 insertions(+), 3 deletions(-)
>=20

Since this is based on the downstream driver, it seems to lack bug fixes=20
/ improvements done in upstream since that. There's also a lot of=20
duplication with the T210 clock driver -- LLM thinks that 35 of 56=20
functions are identical to T210 and some of the other 21 are due to 5.10=20
missing upstream fixes.

Hence, rather than duplicating everything, we should assess the=20
differences in B01 and share code whenever possible.

Cheers
Mikko

> diff --git a/drivers/clk/tegra/Makefile b/drivers/clk/tegra/Makefile
> index a0715cdfc1a4b..5b8bf38d0b2eb 100644
> --- a/drivers/clk/tegra/Makefile
> +++ b/drivers/clk/tegra/Makefile
> @@ -27,6 +27,7 @@ obj-$(CONFIG_TEGRA124_CLK_EMC)		+=3D clk-tegra124-emc.o
>  obj-$(CONFIG_ARCH_TEGRA_132_SOC)	+=3D clk-tegra124.o
>  obj-y					+=3D cvb.o
>  obj-$(CONFIG_ARCH_TEGRA_210_SOC)	+=3D clk-tegra210.o
> +obj-$(CONFIG_ARCH_TEGRA_210_SOC)	+=3D clk-tegra210b01.o
>  obj-$(CONFIG_ARCH_TEGRA_210_SOC)	+=3D clk-tegra210-emc.o
>  obj-$(CONFIG_CLK_TEGRA_BPMP)		+=3D clk-bpmp.o
>  obj-y					+=3D clk-utils.o
> diff --git a/drivers/clk/tegra/clk-tegra-periph.c b/drivers/clk/tegra/clk=
-tegra-periph.c
> index 4dcf7f7cb8a09..12598dcff7f12 100644
> --- a/drivers/clk/tegra/clk-tegra-periph.c
> +++ b/drivers/clk/tegra/clk-tegra-periph.c
> @@ -878,6 +878,9 @@ static void __init periph_clk_init(void __iomem *clk_=
base,
>  		if (!bank)
>  			continue;
> =20
> +		if (tegra_clks[data->clk_id].use_integer_div)
> +			data->periph.divider.flags |=3D TEGRA_DIVIDER_INT;
> +
>  		data->periph.gate.regs =3D bank;
>  		clk =3D tegra_clk_register_periph_data(clk_base, data);
>  		*dt_clk =3D clk;
> diff --git a/drivers/clk/tegra/clk-tegra210b01.c b/drivers/clk/tegra/clk-=
tegra210b01.c
> new file mode 100644
> index 0000000000000..8c03ff913e61b
> --- /dev/null
> +++ b/drivers/clk/tegra/clk-tegra210b01.c
> @@ -0,0 +1,3524 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) 2017-2020 NVIDIA CORPORATION.  All rights reserved.
> + */
> +
> +#include <linux/io.h>
> +#include <linux/clk.h>
> +#include <linux/clk-provider.h>
> +#include <linux/clkdev.h>
> +#include <linux/of.h>
> +#include <linux/of_address.h>
> +#include <linux/syscore_ops.h>
> +#include <linux/delay.h>
> +#include <linux/export.h>
> +#include <linux/clk/tegra.h>
> +#include <dt-bindings/clock/tegra210-car.h>
> +#include <dt-bindings/reset/tegra210-car.h>
> +#include <soc/tegra/pmc.h>
> +
> +#include "clk.h"
> +#include "clk-dfll.h"
> +#include "clk-id.h"
> +
> +/*
> + * TEGRA210_CAR_BANK_COUNT: the number of peripheral clock register
> + * banks present in the Tegra210 CAR IP block.  The banks are
> + * identified by single letters, e.g.: L, H, U, V, W, X, Y.  See
> + * periph_regs[] in drivers/clk/tegra/clk.c
> + */
> +#define TEGRA210_CAR_BANK_COUNT			7
> +
> +#define CLK_SOURCE_CSITE 0x1d4
> +#define CLK_SOURCE_EMC 0x19c
> +#define CLK_SOURCE_SOR1 0x410
> +#define CLK_SOURCE_SOR0 0x414
> +#define CLK_SOURCE_LA 0x1f8
> +#define CLK_SOURCE_SDMMC2 0x154
> +#define CLK_SOURCE_SDMMC4 0x164
> +#define CLK_SOURCE_EMC_DLL 0x664
> +
> +#define PLLE_SS_CTRL 0x68
> +
> +#define PLLC_BASE 0x80
> +#define PLLC_OUT 0x84
> +#define PLLC_MISC0 0x88
> +#define PLLC_MISC1 0x8c
> +#define PLLC_MISC2 0x5d0
> +#define PLLC_MISC3 0x5d4
> +
> +#define PLLC2_BASE 0x4e8
> +#define PLLC2_MISC0 0x4ec
> +#define PLLC2_MISC1 0x4f0
> +#define PLLC2_MISC2 0x4f4
> +#define PLLC2_MISC3 0x4f8
> +
> +#define PLLC3_BASE 0x4fc
> +#define PLLC3_MISC0 0x500
> +#define PLLC3_MISC1 0x504
> +#define PLLC3_MISC2 0x508
> +#define PLLC3_MISC3 0x50c
> +
> +#define PLLM_BASE 0x90
> +#define PLLM_MISC1 0x98
> +#define PLLM_MISC2 0x9c
> +#define PLLP_BASE 0xa0
> +#define PLLP_OUTA 0xa4
> +#define PLLP_OUTB 0xa8
> +#define PLLP_MISC0 0xac
> +#define PLLP_MISC1 0x680
> +#define PLLA_BASE 0xb0
> +#define PLLA_OUT 0xb4
> +#define PLLA_MISC0 0xbc
> +#define PLLA_MISC1 0xb8
> +#define PLLA_MISC2 0x5d8
> +#define PLLD_BASE 0xd0
> +#define PLLD_MISC0 0xdc
> +#define PLLD_MISC1 0xd8
> +#define PLLU_BASE 0xc0
> +#define PLLU_OUTA 0xc4
> +#define PLLU_MISC0 0xcc
> +#define PLLU_MISC1 0xc8
> +#define PLLX_BASE 0xe0
> +#define PLLX_MISC0 0xe4
> +#define PLLX_MISC1 0x510
> +#define PLLX_MISC2 0x514
> +#define PLLX_MISC3 0x518
> +#define PLLX_MISC4 0x5f0
> +#define PLLX_MISC5 0x5f4
> +#define PLLE_BASE 0xe8
> +#define PLLE_MISC0 0xec
> +#define PLLD2_BASE 0x4b8
> +#define PLLD2_MISC0 0x4bc
> +#define PLLD2_MISC1 0x570
> +#define PLLD2_MISC2 0x574
> +#define PLLD2_MISC3 0x578
> +#define PLLD2_MISC4 0x76c
> +#define PLLE_AUX 0x48c
> +#define PLLRE_BASE 0x4c4
> +#define PLLRE_MISC0 0x4c8
> +#define PLLRE_OUT1 0x4cc
> +#define PLLDP_BASE 0x590
> +#define PLLDP_MISC 0x594
> +
> +#define PLLC4_BASE 0x5a4
> +#define PLLC4_MISC0 0x5a8
> +#define PLLC4_OUT 0x5e4
> +#define PLLMB_BASE 0x5e8
> +#define PLLMB_MISC1 0x5ec
> +#define PLLA1_BASE 0x6a4
> +#define PLLA1_MISC0 0x6a8
> +#define PLLA1_MISC1 0x6ac
> +#define PLLA1_MISC2 0x6b0
> +#define PLLA1_MISC3 0x6b4
> +
> +#define CLK_SOURCE_VI 0x148
> +#define CLK_SOURCE_SOR0 0x414
> +#define CLK_SOURCE_SOR1 0x410
> +
> +#define PLLU_IDDQ_BIT 31
> +#define PLLCX_IDDQ_BIT 27
> +#define PLLRE_IDDQ_BIT 24
> +#define PLLA_IDDQ_BIT 25
> +#define PLLD_IDDQ_BIT 20
> +#define PLLSS_IDDQ_BIT 18
> +#define PLLM_IDDQ_BIT 5
> +#define PLLMB_IDDQ_BIT 17
> +#define PLLXP_IDDQ_BIT 3
> +
> +#define PLLCX_RESET_BIT 30
> +
> +#define PLL_BASE_LOCK BIT(27)
> +#define PLLCX_BASE_LOCK BIT(26)
> +#define PLLE_MISC_LOCK BIT(11)
> +#define PLLE_MISC_IDDQ_SW_CTRL BIT(14)
> +#define PLLRE_MISC_LOCK BIT(27)
> +
> +#define PLLE_AUX_USE_LOCKDET BIT(3)
> +#define PLLE_AUX_SS_SEQ_INCLUDE BIT(31)
> +#define PLLE_AUX_ENABLE_SWCTL BIT(4)
> +#define PLLE_AUX_SS_SWCTL BIT(6)
> +#define PLLE_AUX_SEQ_ENABLE BIT(24)
> +
> +#define PLL_MISC_LOCK_ENABLE 18
> +#define PLLC_MISC_LOCK_ENABLE 24
> +#define PLLDU_MISC_LOCK_ENABLE 22
> +#define PLLU_MISC_LOCK_ENABLE 29
> +#define PLLE_MISC_LOCK_ENABLE 9
> +#define PLLRE_MISC_LOCK_ENABLE 30
> +#define PLLSS_MISC_LOCK_ENABLE 30
> +#define PLLP_MISC_LOCK_ENABLE 18
> +#define PLLM_MISC_LOCK_ENABLE 4
> +#define PLLMB_MISC_LOCK_ENABLE 16
> +#define PLLA_MISC_LOCK_ENABLE 28
> +#define PLLU_MISC_LOCK_ENABLE 29
> +#define PLLD_MISC_LOCK_ENABLE 18
> +
> +#define PLLA_SDM_DIN_MASK 0xffff
> +#define PLLA_SDM_EN_MASK BIT(26)
> +
> +#define PLLD_SDM_EN_MASK BIT(16)
> +
> +#define PLLD2_SDM_EN_MASK BIT(31)
> +#define PLLD2_SSC_EN_MASK 0
> +
> +#define PLLDP_SS_CFG	0x598
> +#define PLLDP_SDM_EN_MASK BIT(31)
> +#define PLLDP_SSC_EN_MASK BIT(30)
> +#define PLLDP_SS_CTRL1	0x59c
> +#define PLLDP_SS_CTRL2	0x5a0
> +#define PLLDP_MISC4	0x770
> +
> +#define PMC_PLLM_WB0_OVERRIDE 0x1dc
> +#define PMC_PLLM_WB0_OVERRIDE_2 0x2b0
> +
> +#define UTMIP_PLL_CFG2 0x488
> +#define UTMIP_PLL_CFG2_STABLE_COUNT(x) (((x) & 0xfff) << 6)
> +#define UTMIP_PLL_CFG2_ACTIVE_DLY_COUNT(x) (((x) & 0x3f) << 18)
> +#define UTMIP_PLL_CFG2_FORCE_PD_SAMP_A_POWERDOWN BIT(0)
> +#define UTMIP_PLL_CFG2_FORCE_PD_SAMP_A_POWERUP BIT(1)
> +#define UTMIP_PLL_CFG2_FORCE_PD_SAMP_B_POWERDOWN BIT(2)
> +#define UTMIP_PLL_CFG2_FORCE_PD_SAMP_B_POWERUP BIT(3)
> +#define UTMIP_PLL_CFG2_FORCE_PD_SAMP_C_POWERDOWN BIT(4)
> +#define UTMIP_PLL_CFG2_FORCE_PD_SAMP_C_POWERUP BIT(5)
> +#define UTMIP_PLL_CFG2_FORCE_PD_SAMP_D_POWERDOWN BIT(24)
> +#define UTMIP_PLL_CFG2_FORCE_PD_SAMP_D_POWERUP BIT(25)
> +
> +#define UTMIP_PLL_CFG1 0x484
> +#define UTMIP_PLL_CFG1_ENABLE_DLY_COUNT(x) (((x) & 0x1f) << 27)
> +#define UTMIP_PLL_CFG1_XTAL_FREQ_COUNT(x) (((x) & 0xfff) << 0)
> +#define UTMIP_PLL_CFG1_FORCE_PLLU_POWERUP BIT(17)
> +#define UTMIP_PLL_CFG1_FORCE_PLLU_POWERDOWN BIT(16)
> +#define UTMIP_PLL_CFG1_FORCE_PLL_ENABLE_POWERUP BIT(15)
> +#define UTMIP_PLL_CFG1_FORCE_PLL_ENABLE_POWERDOWN BIT(14)
> +#define UTMIP_PLL_CFG1_FORCE_PLL_ACTIVE_POWERDOWN BIT(12)
> +
> +#define UTMIP_PLL_CFG0 0x480
> +
> +#define SATA_PLL_CFG0				0x490
> +#define SATA_PLL_CFG0_PADPLL_RESET_SWCTL	BIT(0)
> +#define SATA_PLL_CFG0_PADPLL_USE_LOCKDET	BIT(2)
> +#define SATA_PLL_CFG0_SATA_SEQ_IN_SWCTL		BIT(4)
> +#define SATA_PLL_CFG0_SATA_SEQ_RESET_INPUT_VALUE	BIT(5)
> +#define SATA_PLL_CFG0_SATA_SEQ_LANE_PD_INPUT_VALUE	BIT(6)
> +#define SATA_PLL_CFG0_SATA_SEQ_PADPLL_PD_INPUT_VALUE	BIT(7)
> +
> +#define SATA_PLL_CFG0_PADPLL_SLEEP_IDDQ		BIT(13)
> +#define SATA_PLL_CFG0_SEQ_ENABLE		BIT(24)
> +
> +#define XUSBIO_PLL_CFG0				0x51c
> +#define XUSBIO_PLL_CFG0_PADPLL_RESET_SWCTL	BIT(0)
> +#define XUSBIO_PLL_CFG0_CLK_ENABLE_SWCTL	BIT(2)
> +#define XUSBIO_PLL_CFG0_PADPLL_USE_LOCKDET	BIT(6)
> +#define XUSBIO_PLL_CFG0_PADPLL_SLEEP_IDDQ	BIT(13)
> +#define XUSBIO_PLL_CFG0_SEQ_ENABLE		BIT(24)
> +
> +#define UTMIPLL_HW_PWRDN_CFG0			0x52c
> +#define UTMIPLL_HW_PWRDN_CFG0_UTMIPLL_LOCK	BIT(31)
> +#define UTMIPLL_HW_PWRDN_CFG0_SEQ_START_STATE	BIT(25)
> +#define UTMIPLL_HW_PWRDN_CFG0_SEQ_ENABLE	BIT(24)
> +#define UTMIPLL_HW_PWRDN_CFG0_IDDQ_PD_INCLUDE	BIT(7)
> +#define UTMIPLL_HW_PWRDN_CFG0_USE_LOCKDET	BIT(6)
> +#define UTMIPLL_HW_PWRDN_CFG0_SEQ_RESET_INPUT_VALUE	BIT(5)
> +#define UTMIPLL_HW_PWRDN_CFG0_SEQ_IN_SWCTL	BIT(4)
> +#define UTMIPLL_HW_PWRDN_CFG0_CLK_ENABLE_SWCTL	BIT(2)
> +#define UTMIPLL_HW_PWRDN_CFG0_IDDQ_OVERRIDE	BIT(1)
> +#define UTMIPLL_HW_PWRDN_CFG0_IDDQ_SWCTL	BIT(0)
> +
> +#define PLLU_HW_PWRDN_CFG0			0x530
> +#define PLLU_HW_PWRDN_CFG0_IDDQ_PD_INCLUDE	BIT(28)
> +#define PLLU_HW_PWRDN_CFG0_SEQ_ENABLE		BIT(24)
> +#define PLLU_HW_PWRDN_CFG0_USE_SWITCH_DETECT	BIT(7)
> +#define PLLU_HW_PWRDN_CFG0_USE_LOCKDET		BIT(6)
> +#define PLLU_HW_PWRDN_CFG0_CLK_ENABLE_SWCTL	BIT(2)
> +#define PLLU_HW_PWRDN_CFG0_CLK_SWITCH_SWCTL	BIT(0)
> +
> +#define XUSB_PLL_CFG0				0x534
> +#define XUSB_PLL_CFG0_UTMIPLL_LOCK_DLY		0x3ff
> +#define XUSB_PLL_CFG0_PLLU_LOCK_DLY_MASK	(0x3ff << 14)
> +
> +#define SPARE_REG0 0x55c
> +#define CLK_M_DIVISOR_SHIFT 2
> +#define CLK_M_DIVISOR_MASK 0x3
> +
> +/* This register is re-purposed on T210b01 as UPHY management clock divi=
der */
> +#define PEX_SATA_USB_RX_BYP			0x6d0
> +
> +#define CLK_MASK_ARM	0x44
> +#define MISC_CLK_ENB	0x48
> +
> +#define RST_DFLL_DVCO 0x2f4
> +#define DVFS_DFLL_RESET_SHIFT 0
> +
> +#define CLK_RST_CONTROLLER_CLK_OUT_ENB_X_SET	0x284
> +#define CLK_RST_CONTROLLER_CLK_OUT_ENB_X_CLR	0x288
> +#define CLK_OUT_ENB_X_CLK_ENB_EMC_DLL		BIT(14)
> +
> +#define CLK_RST_CONTROLLER_RST_DEV_Y_SET 0x2a8
> +#define CLK_RST_CONTROLLER_RST_DEV_Y_CLR 0x2ac
> +#define CPU_SOFTRST_CTRL 0x380
> +
> +/*
> + * SDM fractional divisor is 16-bit 2's complement signed number within
> + * (-2^12 ... 2^12-1) range. Represented in PLL data structure as unsign=
ed
> + * 16-bit value, with "0" divisor mapped to 0xFFFF. Data "0" is used to
> + * indicate that SDM is disabled.
> + *
> + * Effective ndiv value when SDM is enabled: ndiv + 1/2 + sdm_din/2^13
> + */
> +#define PLL_SDM_COEFF BIT(13)
> +#define sdin_din_to_data(din)	((u16)((din) ? : 0xFFFFU))
> +#define sdin_data_to_din(dat)	(((dat) =3D=3D 0xFFFFU) ? 0 : (s16)dat)
> +/* This macro returns ndiv effective scaled to SDM range */
> +#define sdin_get_n_eff(cfg)	((cfg)->n * PLL_SDM_COEFF + ((cfg)->sdm_data=
 ? \
> +		(PLL_SDM_COEFF/2 + sdin_data_to_din((cfg)->sdm_data)) : 0))
> +
> +/* Tegra CPU clock and reset control regs */
> +#define CLK_RST_CONTROLLER_CPU_CMPLX_STATUS	0x470
> +
> +#ifdef CONFIG_PM_SLEEP
> +static struct cpu_clk_suspend_context {
> +	u32 clk_csite_src;
> +} tegra210_cpu_clk_sctx;
> +#endif
> +
> +static struct clk **clks;
> +
> +static void __iomem *clk_base;
> +static void __iomem *pmc_base;
> +
> +static unsigned long osc_freq;
> +static unsigned long pll_ref_freq;
> +static bool pll_re_use_utmipll;
> +
> +static DEFINE_SPINLOCK(pll_d_lock);
> +static DEFINE_SPINLOCK(pll_e_lock);
> +static DEFINE_SPINLOCK(pll_re_lock);
> +static DEFINE_SPINLOCK(pll_u_lock);
> +static DEFINE_SPINLOCK(pll_p_uphy_lock);
> +static DEFINE_SPINLOCK(sor0_lock);
> +static DEFINE_SPINLOCK(sor1_lock);
> +static DEFINE_SPINLOCK(emc_lock);
> +
> +/* possible OSC frequencies in Hz */
> +static unsigned long tegra210_input_freq[] =3D {
> +	[5] =3D 38400000,
> +	[8] =3D 12000000,
> +};
> +
> +#define PLL_ENABLE			(1 << 30)
> +
> +#define PLLCX_MISC1_IDDQ		(1 << 27)
> +#define PLLCX_MISC0_RESET		(1 << 30)
> +
> +#define PLLCX_MISC0_DEFAULT_VALUE	0x40080000
> +#define PLLCX_MISC0_WRITE_MASK		0x400ffffb
> +#define PLLCX_MISC1_DEFAULT_VALUE	0x08000000
> +#define PLLCX_MISC1_WRITE_MASK		0x38003cff
> +#define PLLCX_MISC2_DEFAULT_VALUE	0x1f720f05
> +#define PLLCX_MISC2_WRITE_MASK		0xffffff17
> +#define PLLCX_MISC3_DEFAULT_VALUE	0x000000c4
> +#define PLLCX_MISC3_WRITE_MASK		0x00ffffff
> +
> +/* PLLA */
> +#define PLLA_BASE_IDDQ			(1 << 25)
> +#define PLLA_BASE_LOCK			(1 << 27)
> +
> +#define PLLA_MISC0_LOCK_ENABLE		(1 << 28)
> +#define PLLA_MISC0_LOCK_OVERRIDE	(1 << 27)
> +
> +#define PLLA_MISC2_EN_SDM		(1 << 26)
> +#define PLLA_MISC2_EN_DYNRAMP		(1 << 25)
> +
> +#define PLLA_MISC0_DEFAULT_VALUE	0x10000000
> +#define PLLA_MISC0_WRITE_MASK		0x7fffffff
> +#define PLLA_MISC2_DEFAULT_VALUE	0x0
> +#define PLLA_MISC2_WRITE_MASK		0x06ffffff
> +
> +#define PLLA_OUT_DEFAULT_VALUE		0x00000000
> +#define PLLA_OUT_VREG_MASK		0xf0000000
> +
> +/* PLLD */
> +#define PLLD_BASE_CSI_CLKSOURCE		(1 << 23)
> +
> +#define PLLD_MISC0_EN_SDM		(1 << 16)
> +#define PLLD_MISC0_LOCK_OVERRIDE	(1 << 17)
> +#define PLLD_MISC0_LOCK_ENABLE		(1 << 18)
> +#define PLLD_MISC0_IDDQ			(1 << 20)
> +#define PLLD_MISC0_DSI_CLKENABLE	(1 << 21)
> +
> +#define PLLD_MISC0_DEFAULT_VALUE	0x00140000
> +#define PLLD_MISC0_WRITE_MASK		0x3ff7ffff
> +#define PLLD_MISC1_DEFAULT_VALUE	0x00000000
> +#define PLLD_MISC1_WRITE_MASK		0xf0ffffff
> +
> +/* PLLD2 and PLLDP  and PLLC4 */
> +#define PLLDSS_BASE_LOCK		(1 << 27)
> +#define PLLDSS_BASE_LOCK_OVERRIDE	(1 << 24)
> +#define PLLDSS_BASE_IDDQ		(1 << 18)
> +#define PLLDSS_BASE_REF_SEL_SHIFT	25
> +#define PLLDSS_BASE_REF_SEL_MASK	(0x3 << PLLDSS_BASE_REF_SEL_SHIFT)
> +
> +#define PLLDSS_MISC0_LOCK_ENABLE	(1 << 30)
> +
> +#define PLLDSS_MISC1_CFG_EN_SDM		(1 << 31)
> +#define PLLDSS_MISC1_CFG_EN_SSC		(1 << 30)
> +
> +#define PLLD2_MISC0_DEFAULT_VALUE	0x40000000
> +#define PLLD2_MISC1_CFG_DEFAULT_VALUE	0x10000000
> +#define PLLD2_MISC2_CTRL1_DEFAULT_VALUE	0x0
> +#define PLLD2_MISC3_CTRL2_DEFAULT_VALUE	0x0
> +#define PLLD2_MISC4_VREG_DEFAULT_VALUE	0x0
> +
> +#define PLLDP_MISC0_DEFAULT_VALUE	0x40000000
> +#define PLLDP_MISC1_CFG_DEFAULT_VALUE	0xc0000000
> +#define PLLDP_MISC2_CTRL1_DEFAULT_VALUE	0xf600f200
> +#define PLLDP_MISC3_CTRL2_DEFAULT_VALUE	0x2005f600
> +#define PLLDP_MISC4_VREG_DEFAULT_VALUE	0x00000000
> +
> +#define PLLDSS_MISC0_WRITE_MASK		0x47ffffff
> +#define PLLDSS_MISC1_CFG_WRITE_MASK	0xf8000000
> +#define PLLDSS_MISC2_CTRL1_WRITE_MASK	0xffffffff
> +#define PLLDSS_MISC3_CTRL2_WRITE_MASK	0xffffffff
> +#define PLLDSS_MISC4_VREG_WRITE_MASK	0xf0000000
> +
> +#define PLLC4_MISC0_DEFAULT_VALUE	0x40000000
> +#define PLLC4_OUT_DEFAULT_VALUE		0x00000000
> +#define PLLC4_OUT_VREG_MASK		0xf0000000
> +
> +/* PLLRE */
> +#define PLLRE_BASE_CLKIN_SEL		(1 << 22)
> +
> +#define PLLRE_MISC0_LOCK_ENABLE		(1 << 30)
> +#define PLLRE_MISC0_LOCK_OVERRIDE	(1 << 29)
> +#define PLLRE_MISC0_LOCK		(1 << 27)
> +#define PLLRE_MISC0_IDDQ		(1 << 24)
> +
> +#define PLLRE_BASE_DEFAULT_VALUE	0x0
> +#define PLLRE_MISC0_DEFAULT_VALUE	0x41000000
> +
> +#define PLLRE_BASE_DEFAULT_MASK		0x1c000000
> +#define PLLRE_MISC0_WRITE_MASK		0x67ffffff
> +
> +#define PLLRE_OUT1_DEFAULT_VALUE	0x00000000
> +#define PLLRE_OUT1_VREG_MASK		0xf0000000
> +
> +/* PLLX */
> +#define PLLX_USE_DYN_RAMP		1
> +#define PLLX_BASE_LOCK			(1 << 27)
> +
> +#define PLLX_MISC0_FO_G_DISABLE		(0x1 << 28)
> +#define PLLX_MISC0_LOCK_ENABLE		(0x1 << 18)
> +
> +#define PLLX_MISC2_DYNRAMP_STEPB_SHIFT	24
> +#define PLLX_MISC2_DYNRAMP_STEPB_MASK	(0xFF << PLLX_MISC2_DYNRAMP_STEPB_=
SHIFT)
> +#define PLLX_MISC2_DYNRAMP_STEPA_SHIFT	16
> +#define PLLX_MISC2_DYNRAMP_STEPA_MASK	(0xFF << PLLX_MISC2_DYNRAMP_STEPA_=
SHIFT)
> +#define PLLX_MISC2_NDIV_NEW_SHIFT	8
> +#define PLLX_MISC2_NDIV_NEW_MASK	(0xFF << PLLX_MISC2_NDIV_NEW_SHIFT)
> +#define PLLX_MISC2_LOCK_OVERRIDE	(0x1 << 4)
> +#define PLLX_MISC2_DYNRAMP_DONE		(0x1 << 2)
> +#define PLLX_MISC2_EN_DYNRAMP		(0x1 << 0)
> +
> +#define PLLX_MISC3_IDDQ			(0x1 << 3)
> +
> +#define PLLX_MISC0_DEFAULT_VALUE	PLLX_MISC0_LOCK_ENABLE
> +#define PLLX_MISC0_WRITE_MASK		0x10c40000
> +#define PLLX_MISC1_DEFAULT_VALUE	0x0
> +#define PLLX_MISC1_WRITE_MASK		0xf0ffffff
> +#define PLLX_MISC2_DEFAULT_VALUE	0x0
> +#define PLLX_MISC2_WRITE_MASK		0xffffff11
> +#define PLLX_MISC3_DEFAULT_VALUE	PLLX_MISC3_IDDQ
> +#define PLLX_MISC3_WRITE_MASK		0x01ff0f0f
> +#define PLLX_MISC4_DEFAULT_VALUE	0x0
> +#define PLLX_MISC4_WRITE_MASK		0x8000ffff
> +#define PLLX_MISC5_DEFAULT_VALUE	0x0
> +#define PLLX_MISC5_WRITE_MASK		0x0000ffff
> +
> +#define PLLX_HW_CTRL_CFG		0x548
> +#define PLLX_HW_CTRL_CFG_SWCTRL		(0x1 << 0)
> +
> +/* PLLMB */
> +#define PLLMB_BASE_LOCK			(1 << 27)
> +
> +#define PLLMB_MISC1_LOCK_OVERRIDE	(1 << 18)
> +#define PLLMB_MISC1_IDDQ		(1 << 17)
> +#define PLLMB_MISC1_LOCK_ENABLE		(1 << 16)
> +
> +#define PLLMB_MISC1_DEFAULT_VALUE	0x00030000
> +#define PLLMB_MISC1_WRITE_MASK		0x0007ffff
> +
> +/* PLLP */
> +#define PLLP_BASE_OVERRIDE		(1 << 28)
> +#define PLLP_BASE_LOCK			(1 << 27)
> +
> +#define PLLP_MISC0_LOCK_ENABLE		(1 << 18)
> +#define PLLP_MISC0_LOCK_OVERRIDE	(1 << 17)
> +#define PLLP_MISC0_IDDQ			(1 << 3)
> +
> +#define PLLP_MISC1_HSIO_EN_SHIFT	29
> +#define PLLP_MISC1_HSIO_EN		(1 << PLLP_MISC1_HSIO_EN_SHIFT)
> +#define PLLP_MISC1_XUSB_EN_SHIFT	28
> +#define PLLP_MISC1_XUSB_EN		(1 << PLLP_MISC1_XUSB_EN_SHIFT)
> +
> +#define PLLP_MISC0_DEFAULT_VALUE	0x00040008
> +#define PLLP_MISC1_DEFAULT_VALUE	0x0
> +
> +#define PLLP_MISC0_WRITE_MASK		0xfdc6000f
> +#define PLLP_MISC1_WRITE_MASK		0x70ffffff
> +
> +/* PLLU */
> +#define PLLU_BASE_LOCK			(1 << 27)
> +#define PLLU_BASE_OVERRIDE		(1 << 24)
> +#define PLLU_BASE_CLKENABLE_USB		(1 << 21)
> +#define PLLU_BASE_CLKENABLE_HSIC	(1 << 22)
> +#define PLLU_BASE_CLKENABLE_ICUSB	(1 << 23)
> +#define PLLU_BASE_CLKENABLE_48M		(1 << 25)
> +#define PLLU_BASE_CLKENABLE_ALL		(PLLU_BASE_CLKENABLE_USB |\
> +					 PLLU_BASE_CLKENABLE_HSIC |\
> +					 PLLU_BASE_CLKENABLE_ICUSB |\
> +					 PLLU_BASE_CLKENABLE_48M)
> +
> +#define PLLU_BASE_MNP_DEFAULT_VALUE	0x00011902
> +
> +#define PLLU_MISC0_IDDQ			(1 << 31)
> +#define PLLU_MISC0_LOCK_ENABLE		(1 << 29)
> +#define PLLU_MISC1_LOCK_OVERRIDE	(1 << 0)
> +
> +#define PLLU_MISC0_DEFAULT_VALUE	0xa0000000
> +#define PLLU_MISC1_DEFAULT_VALUE	0x0
> +
> +#define PLLU_MISC0_WRITE_MASK		0xbfffffff
> +#define PLLU_MISC1_WRITE_MASK		0xf0000007
> +
> +/* UTMIPLL */
> +#define UTMIP_PLL_CFG0_WRITE_MASK	0x1fffffff
> +#define UTMIP_PLL_CFG0_DEFAULT_VALUE	0x00190101
> +
> +/* PLLE */
> +#define PLLE_SS_ENABLE	1
> +#define PLLE_SS_MAX_VAL 0x25
> +#define PLLE_SS_INC_VAL (0x1 << 16)
> +#define PLLE_SS_INCINTRV_VAL (0x20 << 24)
> +#define PLLE_SS_COEFFICIENTS_VAL \
> +	(PLLE_SS_MAX_VAL | PLLE_SS_INC_VAL | PLLE_SS_INCINTRV_VAL)
> +
> +bool tegra210b01_plle_hw_sequence_is_enabled(void)
> +{
> +	u32 value;
> +
> +	value =3D readl_relaxed(clk_base + PLLE_AUX);
> +	if (value & PLLE_AUX_SEQ_ENABLE)
> +		return true;
> +
> +	return false;
> +}
> +EXPORT_SYMBOL_GPL(tegra210b01_plle_hw_sequence_is_enabled);
> +
> +int tegra210b01_plle_hw_sequence_start(void)
> +{
> +	u32 value;
> +
> +	if (tegra210b01_plle_hw_sequence_is_enabled())
> +		return 0;
> +
> +	/* skip if PLLE is not enabled yet */
> +	value =3D readl_relaxed(clk_base + PLLE_MISC0);
> +	if (!(value & PLLE_MISC_LOCK))
> +		return -EIO;
> +
> +	value &=3D ~PLLE_MISC_IDDQ_SW_CTRL;
> +	writel_relaxed(value, clk_base + PLLE_MISC0);
> +
> +	value =3D readl_relaxed(clk_base + PLLE_AUX);
> +	value |=3D (PLLE_AUX_USE_LOCKDET | PLLE_AUX_SS_SEQ_INCLUDE);
> +	value &=3D ~(PLLE_AUX_ENABLE_SWCTL | PLLE_AUX_SS_SWCTL);
> +	writel_relaxed(value, clk_base + PLLE_AUX);
> +
> +	fence_udelay(1, clk_base);
> +
> +	value |=3D PLLE_AUX_SEQ_ENABLE;
> +	writel_relaxed(value, clk_base + PLLE_AUX);
> +
> +	fence_udelay(1, clk_base);
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(tegra210b01_plle_hw_sequence_start);
> +
> +void tegra210b01_xusb_pll_hw_control_enable(void)
> +{
> +	u32 val;
> +
> +	val =3D readl_relaxed(clk_base + XUSBIO_PLL_CFG0);
> +	val &=3D ~(XUSBIO_PLL_CFG0_CLK_ENABLE_SWCTL |
> +		 XUSBIO_PLL_CFG0_PADPLL_RESET_SWCTL);
> +	val |=3D XUSBIO_PLL_CFG0_PADPLL_USE_LOCKDET |
> +	       XUSBIO_PLL_CFG0_PADPLL_SLEEP_IDDQ;
> +	writel_relaxed(val, clk_base + XUSBIO_PLL_CFG0);
> +}
> +EXPORT_SYMBOL_GPL(tegra210b01_xusb_pll_hw_control_enable);
> +
> +void tegra210b01_xusb_pll_hw_sequence_start(void)
> +{
> +	u32 val;
> +
> +	val =3D readl_relaxed(clk_base + XUSBIO_PLL_CFG0);
> +	val |=3D XUSBIO_PLL_CFG0_SEQ_ENABLE;
> +	writel_relaxed(val, clk_base + XUSBIO_PLL_CFG0);
> +}
> +EXPORT_SYMBOL_GPL(tegra210b01_xusb_pll_hw_sequence_start);
> +
> +static inline void _pll_misc_chk_default(void __iomem *base,
> +					struct tegra_clk_pll_params *params,
> +					u8 misc_num, u32 default_val, u32 mask)
> +{
> +	u32 boot_val =3D readl_relaxed(base + params->ext_misc_reg[misc_num]);
> +
> +	boot_val &=3D mask;
> +	default_val &=3D mask;
> +	if (boot_val !=3D default_val) {
> +		pr_warn("boot misc%d 0x%x: expected 0x%x\n",
> +			misc_num, boot_val, default_val);
> +		pr_warn(" (comparison mask =3D 0x%x)\n", mask);
> +		params->defaults_set =3D false;
> +	}
> +}
> +
> +/*
> + * PLLCX: PLLC, PLLC2, PLLC3, PLLA1
> + * Hybrid PLLs with dynamic ramp. Dynamic ramp is allowed for any transi=
tion
> + * that changes NDIV only, while PLL is already locked.
> + */
> +static void pllcx_check_defaults(struct tegra_clk_pll_params *params)
> +{
> +	u32 default_val;
> +
> +	default_val =3D PLLCX_MISC0_DEFAULT_VALUE & (~PLLCX_MISC0_RESET);
> +	_pll_misc_chk_default(clk_base, params, 0, default_val,
> +			PLLCX_MISC0_WRITE_MASK);
> +
> +	default_val =3D PLLCX_MISC1_DEFAULT_VALUE & (~PLLCX_MISC1_IDDQ);
> +	_pll_misc_chk_default(clk_base, params, 1, default_val,
> +			PLLCX_MISC1_WRITE_MASK);
> +
> +	default_val =3D PLLCX_MISC2_DEFAULT_VALUE;
> +	_pll_misc_chk_default(clk_base, params, 2, default_val,
> +			PLLCX_MISC2_WRITE_MASK);
> +
> +	default_val =3D PLLCX_MISC3_DEFAULT_VALUE;
> +	_pll_misc_chk_default(clk_base, params, 3, default_val,
> +			PLLCX_MISC3_WRITE_MASK);
> +}
> +
> +static void tegra210_pllcx_set_defaults(const char *name,
> +					struct tegra_clk_pll *pllcx)
> +{
> +	pllcx->params->defaults_set =3D true;
> +
> +	if (readl_relaxed(clk_base + pllcx->params->base_reg) & PLL_ENABLE &&
> +			!pllcx->params->defaults_set) {
> +		/* PLL is ON: only check if defaults already set */
> +		pllcx_check_defaults(pllcx->params);
> +		if (!pllcx->params->defaults_set)
> +			pr_warn("%s already enabled. Postponing set full defaults\n",
> +				name);
> +		return;
> +	}
> +
> +	/* Defaults assert PLL reset, and set IDDQ */
> +	writel_relaxed(PLLCX_MISC0_DEFAULT_VALUE,
> +			clk_base + pllcx->params->ext_misc_reg[0]);
> +	writel_relaxed(PLLCX_MISC1_DEFAULT_VALUE,
> +			clk_base + pllcx->params->ext_misc_reg[1]);
> +	writel_relaxed(PLLCX_MISC2_DEFAULT_VALUE,
> +			clk_base + pllcx->params->ext_misc_reg[2]);
> +	writel_relaxed(PLLCX_MISC3_DEFAULT_VALUE,
> +			clk_base + pllcx->params->ext_misc_reg[3]);
> +	udelay(1);
> +}
> +
> +static void _pllc_set_defaults(struct tegra_clk_pll *pllcx)
> +{
> +	tegra210_pllcx_set_defaults("PLL_C", pllcx);
> +}
> +
> +static void _pllc2_set_defaults(struct tegra_clk_pll *pllcx)
> +{
> +	tegra210_pllcx_set_defaults("PLL_C2", pllcx);
> +}
> +
> +static void _pllc3_set_defaults(struct tegra_clk_pll *pllcx)
> +{
> +	tegra210_pllcx_set_defaults("PLL_C3", pllcx);
> +}
> +
> +static void _plla1_set_defaults(struct tegra_clk_pll *pllcx)
> +{
> +	tegra210_pllcx_set_defaults("PLL_A1", pllcx);
> +}
> +
> +/*
> + * PLLA
> + * PLL with dynamic ramp and fractional SDM. Dynamic ramp is not used.
> + * Fractional SDM is allowed to provide exact audio rates.
> + */
> +static void tegra210_plla_set_defaults(struct tegra_clk_pll *plla)
> +{
> +	u32 mask;
> +	u32 val =3D readl_relaxed(clk_base + plla->params->base_reg);
> +
> +	plla->params->defaults_set =3D true;
> +
> +	if (val & PLL_ENABLE) {
> +		/*
> +		 * PLL is ON: check if defaults already set, then set those
> +		 * that can be updated in flight.
> +		 */
> +		if (val & PLLA_BASE_IDDQ) {
> +			pr_warn("PLL_A boot enabled with IDDQ set\n");
> +			plla->params->defaults_set =3D false;
> +		}
> +
> +		pr_warn("PLL_A already enabled. Postponing set full defaults\n");
> +
> +		val =3D PLLA_MISC0_DEFAULT_VALUE;	/* ignore lock enable */
> +		mask =3D PLLA_MISC0_LOCK_ENABLE | PLLA_MISC0_LOCK_OVERRIDE;
> +		_pll_misc_chk_default(clk_base, plla->params, 0, val,
> +				~mask & PLLA_MISC0_WRITE_MASK);
> +
> +		val =3D PLLA_MISC2_DEFAULT_VALUE; /* ignore all but control bit */
> +		_pll_misc_chk_default(clk_base, plla->params, 2, val,
> +				PLLA_MISC2_EN_DYNRAMP);
> +
> +		val =3D readl_relaxed(clk_base + PLLA_OUT) & PLLA_OUT_VREG_MASK;
> +		if (val !=3D PLLA_OUT_DEFAULT_VALUE) {
> +			pr_warn("boot PLL_A vreg 0x%x: expected 0x%x\n",
> +				val, PLLA_OUT_DEFAULT_VALUE);
> +			plla->params->defaults_set =3D false;
> +		}
> +
> +		/* Enable lock detect */
> +		val =3D readl_relaxed(clk_base + plla->params->ext_misc_reg[0]);
> +		val &=3D ~mask;
> +		val |=3D PLLA_MISC0_DEFAULT_VALUE & mask;
> +		writel_relaxed(val, clk_base + plla->params->ext_misc_reg[0]);
> +		udelay(1);
> +
> +		if (!plla->params->defaults_set)
> +			pr_warn("PLL_A already enabled. Postponing set full defaults\n");
> +
> +		return;
> +	}
> +
> +	/* set IDDQ, enable lock detect, disable dynamic ramp and SDM */
> +	val |=3D PLLA_BASE_IDDQ;
> +	writel_relaxed(val, clk_base + plla->params->base_reg);
> +	writel_relaxed(PLLA_MISC0_DEFAULT_VALUE,
> +			clk_base + plla->params->ext_misc_reg[0]);
> +	writel_relaxed(PLLA_MISC2_DEFAULT_VALUE,
> +			clk_base + plla->params->ext_misc_reg[2]);
> +	val =3D readl_relaxed(clk_base + PLLA_OUT) & (~PLLA_OUT_VREG_MASK);
> +	writel_relaxed(val | PLLA_OUT_DEFAULT_VALUE, clk_base + PLLA_OUT);
> +	udelay(1);
> +}
> +
> +/*
> + * PLLD
> + * PLL with fractional SDM.
> + */
> +static void tegra210_plld_set_defaults(struct tegra_clk_pll *plld)
> +{
> +	u32 val;
> +	u32 mask =3D 0xffff;
> +
> +	plld->params->defaults_set =3D true;
> +
> +	if (readl_relaxed(clk_base + plld->params->base_reg) &
> +			PLL_ENABLE) {
> +
> +		/*
> +		 * PLL is ON: check if defaults already set, then set those
> +		 * that can be updated in flight.
> +		 */
> +		val =3D PLLD_MISC1_DEFAULT_VALUE;
> +		_pll_misc_chk_default(clk_base, plld->params, 1,
> +				val, PLLD_MISC1_WRITE_MASK);
> +
> +		/* ignore lock, DSI and SDM controls, make sure IDDQ not set */
> +		val =3D PLLD_MISC0_DEFAULT_VALUE & (~PLLD_MISC0_IDDQ);
> +		mask |=3D PLLD_MISC0_DSI_CLKENABLE | PLLD_MISC0_LOCK_ENABLE |
> +			PLLD_MISC0_LOCK_OVERRIDE | PLLD_MISC0_EN_SDM;
> +		_pll_misc_chk_default(clk_base, plld->params, 0, val,
> +				~mask & PLLD_MISC0_WRITE_MASK);
> +
> +		if (!plld->params->defaults_set)
> +			pr_warn("PLL_D already enabled. Postponing set full defaults\n");
> +
> +		/* Enable lock detect */
> +		mask =3D PLLD_MISC0_LOCK_ENABLE | PLLD_MISC0_LOCK_OVERRIDE;
> +		val =3D readl_relaxed(clk_base + plld->params->ext_misc_reg[0]);
> +		val &=3D ~mask;
> +		val |=3D PLLD_MISC0_DEFAULT_VALUE & mask;
> +		writel_relaxed(val, clk_base + plld->params->ext_misc_reg[0]);
> +		udelay(1);
> +
> +		return;
> +	}
> +
> +	val =3D readl_relaxed(clk_base + plld->params->ext_misc_reg[0]);
> +	val &=3D PLLD_MISC0_DSI_CLKENABLE;
> +	val |=3D PLLD_MISC0_DEFAULT_VALUE;
> +	/* set IDDQ, enable lock detect, disable SDM */
> +	writel_relaxed(val, clk_base + plld->params->ext_misc_reg[0]);
> +	writel_relaxed(PLLD_MISC1_DEFAULT_VALUE, clk_base +
> +			plld->params->ext_misc_reg[1]);
> +	udelay(1);
> +}
> +
> +/*
> + * PLLD2, PLLDP
> + * PLL with fractional SDM and Spread Spectrum (SDM is a must if SSC is =
used).
> + */
> +static void plldss_defaults(const char *pll_name, struct tegra_clk_pll *=
plldss,
> +		u32 misc0_val, u32 misc1_val, u32 misc2_val, u32 misc3_val,
> +		u32 misc4_val)
> +{
> +	u32 default_val;
> +	u32 val =3D readl_relaxed(clk_base + plldss->params->base_reg);
> +
> +	plldss->params->defaults_set =3D true;
> +
> +	if (val & PLL_ENABLE) {
> +
> +		/*
> +		 * PLL is ON: check if defaults already set, then set those
> +		 * that can be updated in flight.
> +		 */
> +		if (val & PLLDSS_BASE_IDDQ) {
> +			pr_warn("plldss boot enabled with IDDQ set\n");
> +			plldss->params->defaults_set =3D false;
> +		}
> +
> +		/* ignore lock enable */
> +		default_val =3D misc0_val;
> +		_pll_misc_chk_default(clk_base, plldss->params, 0, default_val,
> +				     PLLDSS_MISC0_WRITE_MASK &
> +				     (~PLLDSS_MISC0_LOCK_ENABLE));
> +
> +		/*
> +		 * If SSC is used, check all settings, otherwise just confirm
> +		 * that SSC is not used on boot as well. Do nothing when using
> +		 * this function for PLLC4 that has only MISC0.
> +		 */
> +		if (plldss->params->ssc_ctrl_en_mask) {
> +			default_val =3D misc1_val;
> +			_pll_misc_chk_default(clk_base, plldss->params, 1,
> +				default_val, PLLDSS_MISC1_CFG_WRITE_MASK);
> +			default_val =3D misc2_val;
> +			_pll_misc_chk_default(clk_base, plldss->params, 2,
> +				default_val, PLLDSS_MISC2_CTRL1_WRITE_MASK);
> +			default_val =3D misc3_val;
> +			_pll_misc_chk_default(clk_base, plldss->params, 3,
> +				default_val, PLLDSS_MISC3_CTRL2_WRITE_MASK);
> +		} else if (plldss->params->ext_misc_reg[1]) {
> +			default_val =3D misc1_val;
> +			_pll_misc_chk_default(clk_base, plldss->params, 1,
> +				default_val, PLLDSS_MISC1_CFG_WRITE_MASK &
> +				(~PLLDSS_MISC1_CFG_EN_SDM));
> +		}
> +
> +		default_val =3D misc4_val;
> +		_pll_misc_chk_default(clk_base, plldss->params, 4,
> +			default_val, PLLDSS_MISC4_VREG_WRITE_MASK);
> +
> +		if (!plldss->params->defaults_set)
> +			pr_warn("%s already enabled. Postponing set full defaults\n",
> +				 pll_name);
> +
> +		/* Enable lock detect */
> +		if (val & PLLDSS_BASE_LOCK_OVERRIDE) {
> +			val &=3D ~PLLDSS_BASE_LOCK_OVERRIDE;
> +			writel_relaxed(val, clk_base +
> +					plldss->params->base_reg);
> +		}
> +
> +		val =3D readl_relaxed(clk_base + plldss->params->ext_misc_reg[0]);
> +		val &=3D ~PLLDSS_MISC0_LOCK_ENABLE;
> +		val |=3D misc0_val & PLLDSS_MISC0_LOCK_ENABLE;
> +		writel_relaxed(val, clk_base + plldss->params->ext_misc_reg[0]);
> +		udelay(1);
> +
> +		return;
> +	}
> +
> +	/* set IDDQ, enable lock detect, configure SDM/SSC  */
> +	val |=3D PLLDSS_BASE_IDDQ;
> +	val &=3D ~PLLDSS_BASE_LOCK_OVERRIDE;
> +	writel_relaxed(val, clk_base + plldss->params->base_reg);
> +
> +	writel_relaxed(misc0_val, clk_base +
> +			plldss->params->ext_misc_reg[0]);
> +	/* if SSC used set by 1st enable */
> +	writel_relaxed(misc1_val & (~PLLDSS_MISC1_CFG_EN_SSC),
> +			clk_base + plldss->params->ext_misc_reg[1]);
> +	writel_relaxed(misc2_val, clk_base + plldss->params->ext_misc_reg[2]);
> +	writel_relaxed(misc3_val, clk_base + plldss->params->ext_misc_reg[3]);
> +	writel_relaxed(misc4_val, clk_base + plldss->params->ext_misc_reg[4]);
> +	udelay(1);
> +}
> +
> +static void tegra210_plld2_set_defaults(struct tegra_clk_pll *plld2)
> +{
> +	plldss_defaults("PLL_D2", plld2, PLLD2_MISC0_DEFAULT_VALUE,
> +			PLLD2_MISC1_CFG_DEFAULT_VALUE,
> +			PLLD2_MISC2_CTRL1_DEFAULT_VALUE,
> +			PLLD2_MISC3_CTRL2_DEFAULT_VALUE,
> +			PLLD2_MISC4_VREG_DEFAULT_VALUE);
> +}
> +
> +static void tegra210_plldp_set_defaults(struct tegra_clk_pll *plldp)
> +{
> +	plldss_defaults("PLL_DP", plldp, PLLDP_MISC0_DEFAULT_VALUE,
> +			PLLDP_MISC1_CFG_DEFAULT_VALUE,
> +			PLLDP_MISC2_CTRL1_DEFAULT_VALUE,
> +			PLLDP_MISC3_CTRL2_DEFAULT_VALUE,
> +			PLLDP_MISC4_VREG_DEFAULT_VALUE);
> +}
> +
> +/*
> + * PLLC4
> + * Base and misc0 layout is the same as PLLD2/PLLDP, but no SDM/SSC supp=
ort.
> + * VCO is exposed to the clock tree via fixed 1/3 and 1/5 dividers.
> + */
> +static void tegra210_pllc4_set_defaults(struct tegra_clk_pll *pllc4)
> +{
> +	u32 default_val;
> +	u32 val =3D readl_relaxed(clk_base + pllc4->params->base_reg);
> +
> +	pllc4->params->defaults_set =3D true;
> +
> +	if (val & PLL_ENABLE) {
> +		/*
> +		 * PLL is ON: check if defaults already set, then set those
> +		 * that can be updated in flight.
> +		 */
> +		if (val & PLLDSS_BASE_IDDQ) {
> +			pr_warn("PLL_C4 boot enabled with IDDQ set\n");
> +			pllc4->params->defaults_set =3D false;
> +		}
> +
> +		/* ignore lock enable */
> +		default_val =3D PLLC4_MISC0_DEFAULT_VALUE;
> +		_pll_misc_chk_default(clk_base, pllc4->params, 0, default_val,
> +				     PLLDSS_MISC0_WRITE_MASK &
> +				     (~PLLDSS_MISC0_LOCK_ENABLE));
> +
> +		val =3D readl_relaxed(clk_base + PLLC4_OUT) & PLLC4_OUT_VREG_MASK;
> +		if (val !=3D PLLC4_OUT_DEFAULT_VALUE) {
> +			pr_warn("boot PLL_C4 vreg 0x%x: expected 0x%x\n",
> +				val, PLLC4_OUT_DEFAULT_VALUE);
> +			pllc4->params->defaults_set =3D false;
> +		}
> +
> +		/* Enable lock detect */
> +		if (val & PLLDSS_BASE_LOCK_OVERRIDE) {
> +			val &=3D ~PLLDSS_BASE_LOCK_OVERRIDE;
> +			writel_relaxed(val, clk_base + pllc4->params->base_reg);
> +		}
> +
> +		val =3D readl_relaxed(clk_base + pllc4->params->ext_misc_reg[0]);
> +		val &=3D ~PLLDSS_MISC0_LOCK_ENABLE;
> +		val |=3D PLLC4_MISC0_DEFAULT_VALUE & PLLDSS_MISC0_LOCK_ENABLE;
> +		writel_relaxed(val, clk_base + pllc4->params->ext_misc_reg[0]);
> +		fence_udelay(1, clk_base);
> +
> +		if (!pllc4->params->defaults_set)
> +			pr_warn("PLL_C4 already enabled. Postponing set full defaults\n");
> +
> +		return;
> +	}
> +
> +	/* set IDDQ, enable lock detect  */
> +	val |=3D PLLDSS_BASE_IDDQ;
> +	val &=3D ~PLLDSS_BASE_LOCK_OVERRIDE;
> +	writel_relaxed(val, clk_base + pllc4->params->base_reg);
> +	writel_relaxed(PLLC4_MISC0_DEFAULT_VALUE,
> +		       clk_base + pllc4->params->ext_misc_reg[0]);
> +	val =3D readl_relaxed(clk_base + PLLC4_OUT) & (~PLLC4_OUT_VREG_MASK);
> +	writel_relaxed(val | PLLC4_OUT_DEFAULT_VALUE, clk_base + PLLC4_OUT);
> +	fence_udelay(1, clk_base);
> +}
> +
> +/*
> + * PLLRE
> + * VCO is exposed to the clock tree directly along with post-divider out=
put
> + */
> +static void tegra210_pllre_set_defaults(struct tegra_clk_pll *pllre)
> +{
> +	u32 mask;
> +	u32 val =3D readl_relaxed(clk_base + pllre->params->base_reg);
> +
> +	pllre->params->defaults_set =3D true;
> +
> +	if (val & PLL_ENABLE) {
> +		/*
> +		 * PLL is ON: check if defaults already set, then set those
> +		 * that can be updated in flight.
> +		 */
> +		val &=3D PLLRE_BASE_DEFAULT_MASK;
> +		if (val !=3D PLLRE_BASE_DEFAULT_VALUE) {
> +			pr_warn("pllre boot base 0x%x : expected 0x%x\n",
> +				val, PLLRE_BASE_DEFAULT_VALUE);
> +			pr_warn("(comparison mask =3D 0x%x)\n",
> +				PLLRE_BASE_DEFAULT_MASK);
> +			pllre->params->defaults_set =3D false;
> +		}
> +
> +		val =3D readl_relaxed(clk_base + PLLRE_OUT1) &
> +			PLLRE_OUT1_VREG_MASK;
> +		if (val !=3D PLLRE_OUT1_DEFAULT_VALUE) {
> +			pr_warn("boot PLLRE vreg 0x%x: expected 0x%x\n",
> +				val, PLLRE_OUT1_DEFAULT_VALUE);
> +			pllre->params->defaults_set =3D false;
> +		}
> +
> +		/* Ignore lock enable */
> +		val =3D PLLRE_MISC0_DEFAULT_VALUE & (~PLLRE_MISC0_IDDQ);
> +		mask =3D PLLRE_MISC0_LOCK_ENABLE | PLLRE_MISC0_LOCK_OVERRIDE;
> +		_pll_misc_chk_default(clk_base, pllre->params, 0, val,
> +				~mask & PLLRE_MISC0_WRITE_MASK);
> +
> +		/* Enable lock detect */
> +		val =3D readl_relaxed(clk_base + pllre->params->ext_misc_reg[0]);
> +		val &=3D ~mask;
> +		val |=3D PLLRE_MISC0_DEFAULT_VALUE & mask;
> +		writel_relaxed(val, clk_base + pllre->params->ext_misc_reg[0]);
> +		val =3D readl_relaxed(clk_base + PLLRE_OUT1) &
> +			(~PLLRE_OUT1_VREG_MASK);
> +		writel_relaxed(val | PLLRE_OUT1_DEFAULT_VALUE,
> +			       clk_base + PLLRE_OUT1);
> +		udelay(1);
> +
> +		if (!pllre->params->defaults_set)
> +			pr_warn("PLL_RE already enabled. Postponing set full defaults\n");
> +
> +		return;
> +	}
> +
> +	/* set IDDQ, enable lock detect */
> +	val &=3D ~PLLRE_BASE_DEFAULT_MASK;
> +	val |=3D PLLRE_BASE_DEFAULT_VALUE & PLLRE_BASE_DEFAULT_MASK;
> +	writel_relaxed(val, clk_base + pllre->params->base_reg);
> +	writel_relaxed(PLLRE_MISC0_DEFAULT_VALUE,
> +			clk_base + pllre->params->ext_misc_reg[0]);
> +	udelay(1);
> +}
> +
> +static void pllx_get_dyn_steps(struct clk_hw *hw, u32 *step_a, u32 *step=
_b)
> +{
> +	unsigned long input_rate;
> +
> +	/* cf rate */
> +	if (!IS_ERR_OR_NULL(hw->clk))
> +		input_rate =3D clk_hw_get_rate(clk_hw_get_parent(hw));
> +	else
> +		input_rate =3D 38400000;
> +
> +	input_rate /=3D tegra_pll_get_fixed_mdiv(hw, input_rate);
> +
> +	switch (input_rate) {
> +	case 12000000:
> +	case 12800000:
> +	case 13000000:
> +		*step_a =3D 0x2B;
> +		*step_b =3D 0x0B;
> +		return;
> +	case 19200000:
> +		*step_a =3D 0x12;
> +		*step_b =3D 0x08;
> +		return;
> +	case 38400000:
> +		*step_a =3D 0x04;
> +		*step_b =3D 0x05;
> +		return;
> +	default:
> +		pr_err("%s: Unexpected reference rate %lu\n",
> +			__func__, input_rate);
> +		BUG();
> +	}
> +}
> +
> +static void pllx_check_defaults(struct tegra_clk_pll *pll)
> +{
> +	u32 default_val;
> +
> +	default_val =3D PLLX_MISC0_DEFAULT_VALUE;
> +	/* ignore lock enable */
> +	_pll_misc_chk_default(clk_base, pll->params, 0, default_val,
> +			PLLX_MISC0_WRITE_MASK & (~PLLX_MISC0_LOCK_ENABLE));
> +
> +	default_val =3D PLLX_MISC1_DEFAULT_VALUE;
> +	_pll_misc_chk_default(clk_base, pll->params, 1, default_val,
> +			PLLX_MISC1_WRITE_MASK);
> +
> +	/* ignore all but control bit */
> +	default_val =3D PLLX_MISC2_DEFAULT_VALUE;
> +	_pll_misc_chk_default(clk_base, pll->params, 2,
> +			default_val, PLLX_MISC2_EN_DYNRAMP);
> +
> +	default_val =3D PLLX_MISC3_DEFAULT_VALUE & (~PLLX_MISC3_IDDQ);
> +	_pll_misc_chk_default(clk_base, pll->params, 3, default_val,
> +			PLLX_MISC3_WRITE_MASK);
> +
> +	default_val =3D PLLX_MISC4_DEFAULT_VALUE;
> +	_pll_misc_chk_default(clk_base, pll->params, 4, default_val,
> +			PLLX_MISC4_WRITE_MASK);
> +
> +	default_val =3D PLLX_MISC5_DEFAULT_VALUE;
> +	_pll_misc_chk_default(clk_base, pll->params, 5, default_val,
> +			PLLX_MISC5_WRITE_MASK);
> +}
> +
> +static void tegra210_pllx_set_defaults(struct tegra_clk_pll *pllx)
> +{
> +	u32 val;
> +	u32 step_a, step_b;
> +
> +	pllx->params->defaults_set =3D true;
> +
> +	/* Get ready dyn ramp state machine settings */
> +	pllx_get_dyn_steps(&pllx->hw, &step_a, &step_b);
> +	val =3D PLLX_MISC2_DEFAULT_VALUE & (~PLLX_MISC2_DYNRAMP_STEPA_MASK) &
> +		(~PLLX_MISC2_DYNRAMP_STEPB_MASK);
> +	val |=3D step_a << PLLX_MISC2_DYNRAMP_STEPA_SHIFT;
> +	val |=3D step_b << PLLX_MISC2_DYNRAMP_STEPB_SHIFT;
> +
> +	if (readl_relaxed(clk_base + pllx->params->base_reg) & PLL_ENABLE) {
> +
> +		/*
> +		 * PLL is ON: check if defaults already set, then set those
> +		 * that can be updated in flight.
> +		 */
> +		pllx_check_defaults(pllx);
> +
> +		if (!pllx->params->defaults_set)
> +			pr_warn("PLL_X already enabled. Postponing set full defaults\n");
> +		/* Configure dyn ramp, disable lock override */
> +		writel_relaxed(val, clk_base + pllx->params->ext_misc_reg[2]);
> +
> +		/* Enable lock detect */
> +		val =3D readl_relaxed(clk_base + pllx->params->ext_misc_reg[0]);
> +		val &=3D ~PLLX_MISC0_LOCK_ENABLE;
> +		val |=3D PLLX_MISC0_DEFAULT_VALUE & PLLX_MISC0_LOCK_ENABLE;
> +		writel_relaxed(val, clk_base + pllx->params->ext_misc_reg[0]);
> +		udelay(1);
> +
> +		return;
> +	}
> +
> +	/* Enable lock detect and CPU output */
> +	writel_relaxed(PLLX_MISC0_DEFAULT_VALUE, clk_base +
> +			pllx->params->ext_misc_reg[0]);
> +
> +	/* Setup */
> +	writel_relaxed(PLLX_MISC1_DEFAULT_VALUE, clk_base +
> +			pllx->params->ext_misc_reg[1]);
> +
> +	/* Configure dyn ramp state machine, disable lock override */
> +	writel_relaxed(val, clk_base + pllx->params->ext_misc_reg[2]);
> +
> +	/* Set IDDQ */
> +	writel_relaxed(PLLX_MISC3_DEFAULT_VALUE, clk_base +
> +			pllx->params->ext_misc_reg[3]);
> +
> +	/* Disable SDM */
> +	writel_relaxed(PLLX_MISC4_DEFAULT_VALUE, clk_base +
> +			pllx->params->ext_misc_reg[4]);
> +	writel_relaxed(PLLX_MISC5_DEFAULT_VALUE, clk_base +
> +			pllx->params->ext_misc_reg[5]);
> +	udelay(1);
> +}
> +
> +/*
> + * PLLP
> + * VCO is exposed to the clock tree directly along with post-divider out=
put.
> + * Both VCO and post-divider output rates are fixed at 408MHz and 204MHz=
,
> + * respectively.
> + */
> +static void pllp_check_defaults(struct tegra_clk_pll *pll, bool enabled)
> +{
> +	u32 val, mask;
> +
> +	/* Ignore lock enable (will be set), make sure not in IDDQ if enabled *=
/
> +	val =3D PLLP_MISC0_DEFAULT_VALUE & (~PLLP_MISC0_IDDQ);
> +	mask =3D PLLP_MISC0_LOCK_ENABLE | PLLP_MISC0_LOCK_OVERRIDE;
> +	if (!enabled)
> +		mask |=3D PLLP_MISC0_IDDQ;
> +	_pll_misc_chk_default(clk_base, pll->params, 0, val,
> +			~mask & PLLP_MISC0_WRITE_MASK);
> +
> +	/* Ignore branch controls */
> +	val =3D PLLP_MISC1_DEFAULT_VALUE;
> +	mask =3D PLLP_MISC1_HSIO_EN | PLLP_MISC1_XUSB_EN;
> +	_pll_misc_chk_default(clk_base, pll->params, 1, val,
> +			~mask & PLLP_MISC1_WRITE_MASK);
> +}
> +
> +static void tegra210_pllp_set_defaults(struct tegra_clk_pll *pllp)
> +{
> +	u32 mask;
> +	u32 val =3D readl_relaxed(clk_base + pllp->params->base_reg);
> +
> +	/* Disable in h/w pll_p_out1 that is not routed to any module */
> +	writel_relaxed(0, clk_base + PLLP_OUTA);
> +
> +	pllp->params->defaults_set =3D true;
> +
> +	if (val & PLL_ENABLE) {
> +
> +		/*
> +		 * PLL is ON: check if defaults already set, then set those
> +		 * that can be updated in flight.
> +		 */
> +		pllp_check_defaults(pllp, true);
> +		if (!pllp->params->defaults_set)
> +			pr_warn("PLL_P already enabled. Postponing set full defaults\n");
> +
> +		/* Enable lock detect */
> +		val =3D readl_relaxed(clk_base + pllp->params->ext_misc_reg[0]);
> +		mask =3D PLLP_MISC0_LOCK_ENABLE | PLLP_MISC0_LOCK_OVERRIDE;
> +		val &=3D ~mask;
> +		val |=3D PLLP_MISC0_DEFAULT_VALUE & mask;
> +		writel_relaxed(val, clk_base + pllp->params->ext_misc_reg[0]);
> +		udelay(1);
> +
> +		return;
> +	}
> +
> +	/* set IDDQ, enable lock detect */
> +	writel_relaxed(PLLP_MISC0_DEFAULT_VALUE,
> +			clk_base + pllp->params->ext_misc_reg[0]);
> +
> +	/* Preserve branch control */
> +	val =3D readl_relaxed(clk_base + pllp->params->ext_misc_reg[1]);
> +	mask =3D PLLP_MISC1_HSIO_EN | PLLP_MISC1_XUSB_EN;
> +	val &=3D mask;
> +	val |=3D ~mask & PLLP_MISC1_DEFAULT_VALUE;
> +	writel_relaxed(val, clk_base + pllp->params->ext_misc_reg[1]);
> +	udelay(1);
> +}
> +
> +/*
> + * PLLU
> + * VCO is exposed to the clock tree directly along with post-divider out=
put.
> + * Both VCO and post-divider output rates are fixed at 480MHz and 240MHz=
,
> + * respectively.
> + */
> +static void pllu_check_defaults(struct tegra_clk_pll_params *params,
> +				bool hw_control)
> +{
> +	u32 val, mask;
> +
> +	/* Ignore lock enable (will be set) and IDDQ if under h/w control */
> +	val =3D PLLU_MISC0_DEFAULT_VALUE & (~PLLU_MISC0_IDDQ);
> +	mask =3D PLLU_MISC0_LOCK_ENABLE | (hw_control ? PLLU_MISC0_IDDQ : 0);
> +	_pll_misc_chk_default(clk_base, params, 0, val,
> +			~mask & PLLU_MISC0_WRITE_MASK);
> +
> +	val =3D PLLU_MISC1_DEFAULT_VALUE;
> +	mask =3D PLLU_MISC1_LOCK_OVERRIDE;
> +	_pll_misc_chk_default(clk_base, params, 1, val,
> +			~mask & PLLU_MISC1_WRITE_MASK);
> +}
> +
> +static void tegra210_pllu_set_defaults(struct tegra_clk_pll_params *pllu=
)
> +{
> +	u32 val =3D readl_relaxed(clk_base + pllu->base_reg);
> +
> +	pllu->defaults_set =3D true;
> +
> +	if (val & PLL_ENABLE) {
> +
> +		/*
> +		 * PLL is ON: check if defaults already set, then set those
> +		 * that can be updated in flight.
> +		 */
> +		pllu_check_defaults(pllu, false);
> +		if (!pllu->defaults_set)
> +			pr_warn("PLL_U already enabled. Postponing set full defaults\n");
> +
> +		/* Enable lock detect */
> +		val =3D readl_relaxed(clk_base + pllu->ext_misc_reg[0]);
> +		val &=3D ~PLLU_MISC0_LOCK_ENABLE;
> +		val |=3D PLLU_MISC0_DEFAULT_VALUE & PLLU_MISC0_LOCK_ENABLE;
> +		writel_relaxed(val, clk_base + pllu->ext_misc_reg[0]);
> +
> +		val =3D readl_relaxed(clk_base + pllu->ext_misc_reg[1]);
> +		val &=3D ~PLLU_MISC1_LOCK_OVERRIDE;
> +		val |=3D PLLU_MISC1_DEFAULT_VALUE & PLLU_MISC1_LOCK_OVERRIDE;
> +		writel_relaxed(val, clk_base + pllu->ext_misc_reg[1]);
> +		udelay(1);
> +
> +		return;
> +	}
> +
> +	/* set IDDQ, enable lock detect */
> +	writel_relaxed(PLLU_MISC0_DEFAULT_VALUE,
> +			clk_base + pllu->ext_misc_reg[0]);
> +	writel_relaxed(PLLU_MISC1_DEFAULT_VALUE,
> +			clk_base + pllu->ext_misc_reg[1]);
> +	udelay(1);
> +}
> +
> +#define mask(w) ((1 << (w)) - 1)
> +#define divm_mask(p) mask(p->params->div_nmp->divm_width)
> +#define divn_mask(p) mask(p->params->div_nmp->divn_width)
> +#define divp_mask(p) mask(p->params->div_nmp->divp_width)
> +
> +#define divm_shift(p) ((p)->params->div_nmp->divm_shift)
> +#define divn_shift(p) ((p)->params->div_nmp->divn_shift)
> +#define divp_shift(p) ((p)->params->div_nmp->divp_shift)
> +
> +#define divm_mask_shifted(p) (divm_mask(p) << divm_shift(p))
> +#define divn_mask_shifted(p) (divn_mask(p) << divn_shift(p))
> +#define divp_mask_shifted(p) (divp_mask(p) << divp_shift(p))
> +
> +#define PLL_LOCKDET_DELAY 2	/* Lock detection safety delays */
> +static int tegra210_wait_for_mask(struct tegra_clk_pll *pll,
> +				  u32 reg, u32 mask)
> +{
> +	int i;
> +	u32 val =3D 0;
> +
> +	for (i =3D 0; i < pll->params->lock_delay / PLL_LOCKDET_DELAY + 1; i++)=
 {
> +		udelay(PLL_LOCKDET_DELAY);
> +		val =3D readl_relaxed(clk_base + reg);
> +		if ((val & mask) =3D=3D mask) {
> +			udelay(PLL_LOCKDET_DELAY);
> +			return 0;
> +		}
> +	}
> +	return -ETIMEDOUT;
> +}
> +
> +static int tegra210_pllx_dyn_ramp(struct tegra_clk_pll *pllx,
> +		struct tegra_clk_pll_freq_table *cfg)
> +{
> +	u32 val, base, ndiv_new_mask;
> +
> +	ndiv_new_mask =3D (divn_mask(pllx) >> pllx->params->div_nmp->divn_shift=
)
> +			 << PLLX_MISC2_NDIV_NEW_SHIFT;
> +
> +	val =3D readl_relaxed(clk_base + pllx->params->ext_misc_reg[2]);
> +	val &=3D (~ndiv_new_mask);
> +	val |=3D cfg->n << PLLX_MISC2_NDIV_NEW_SHIFT;
> +	writel_relaxed(val, clk_base + pllx->params->ext_misc_reg[2]);
> +	udelay(1);
> +
> +	val =3D readl_relaxed(clk_base + pllx->params->ext_misc_reg[2]);
> +	val |=3D PLLX_MISC2_EN_DYNRAMP;
> +	writel_relaxed(val, clk_base + pllx->params->ext_misc_reg[2]);
> +	udelay(1);
> +
> +	tegra210_wait_for_mask(pllx, pllx->params->ext_misc_reg[2],
> +			       PLLX_MISC2_DYNRAMP_DONE);
> +
> +	base =3D readl_relaxed(clk_base + pllx->params->base_reg) &
> +		(~divn_mask_shifted(pllx));
> +	base |=3D cfg->n << pllx->params->div_nmp->divn_shift;
> +	writel_relaxed(base, clk_base + pllx->params->base_reg);
> +	udelay(1);
> +
> +	val &=3D ~PLLX_MISC2_EN_DYNRAMP;
> +	writel_relaxed(val, clk_base + pllx->params->ext_misc_reg[2]);
> +	udelay(1);
> +
> +	pr_debug("%s: dynamic ramp to m =3D %u n =3D %u p =3D %u, Fout =3D %lu =
kHz\n",
> +		 __clk_get_name(pllx->hw.clk), cfg->m, cfg->n, cfg->p,
> +		 cfg->input_rate / cfg->m * cfg->n /
> +		 pllx->params->pdiv_tohw[cfg->p].pdiv / 1000);
> +
> +	return 0;
> +}
> +
> +/*
> + * UTMIPLL
> + * Running at fixed 960MHz rate with fixed 1:2 factor 480MHz output supp=
lied
> + * to USB link (not exposed to clock tree), and fixed 1:16 factor 60MHz =
supplied
> + * to PLL_RE (exposed to clock tree).
> + */
> +static int utmipll_set_defaults(bool locked)
> +{
> +	u32 val =3D readl_relaxed(clk_base + UTMIP_PLL_CFG0);
> +
> +	if (locked)
> +		return (val & UTMIP_PLL_CFG0_WRITE_MASK) =3D=3D
> +			UTMIP_PLL_CFG0_DEFAULT_VALUE ? 0 : -EINVAL;
> +
> +	writel_relaxed(UTMIP_PLL_CFG0_DEFAULT_VALUE,
> +		       clk_base + UTMIP_PLL_CFG0);
> +	fence_udelay(1, clk_base);
> +
> +	return 0;
> +}
> +
> +/*
> + * Common configuration for PLLs with fixed input divider policy:
> + * - always set fixed M-value based on the reference rate
> + * - always set P-value value 1:1 for output rates above VCO minimum, an=
d
> + *   choose minimum necessary P-value for output rates below VCO maximum
> + * - calculate N-value based on selected M and P
> + * - calculate SDM_DIN fractional part
> + */
> +static int tegra210_pll_fixed_mdiv_cfg(struct clk_hw *hw,
> +			       struct tegra_clk_pll_freq_table *cfg,
> +			       unsigned long rate, unsigned long input_rate)
> +{
> +	struct tegra_clk_pll *pll =3D to_clk_pll(hw);
> +	struct tegra_clk_pll_params *params =3D pll->params;
> +	int p;
> +	unsigned long cf, p_rate;
> +	u32 pdiv;
> +
> +	if (!rate)
> +		return -EINVAL;
> +
> +	if (!(params->flags & TEGRA_PLL_VCO_OUT)) {
> +		p =3D DIV_ROUND_UP(params->vco_min, rate);
> +		p =3D params->round_p_to_pdiv(p, &pdiv);
> +	} else {
> +		p =3D rate >=3D params->vco_min ? 1 : -EINVAL;
> +	}
> +
> +	if (p < 0)
> +		return -EINVAL;
> +
> +	cfg->m =3D tegra_pll_get_fixed_mdiv(hw, input_rate);
> +	cfg->p =3D p;
> +
> +	/* Store P as HW value, as that is what is expected */
> +	cfg->p =3D tegra_pll_p_div_to_hw(pll, cfg->p);
> +
> +	p_rate =3D rate * p;
> +	if (p_rate > params->vco_max)
> +		p_rate =3D params->vco_max;
> +	cf =3D input_rate / cfg->m;
> +	cfg->n =3D p_rate / cf;
> +
> +	cfg->sdm_data =3D 0;
> +	cfg->output_rate =3D input_rate;
> +	if (params->sdm_ctrl_reg) {
> +		unsigned long rem =3D p_rate - cf * cfg->n;
> +		/* If ssc is enabled SDM enabled as well, even for integer n */
> +		if (rem || params->ssc_ctrl_reg) {
> +			u64 s =3D rem * PLL_SDM_COEFF;
> +
> +			do_div(s, cf);
> +			s -=3D PLL_SDM_COEFF / 2;
> +			cfg->sdm_data =3D sdin_din_to_data(s);
> +		}
> +		cfg->output_rate *=3D sdin_get_n_eff(cfg);
> +		cfg->output_rate /=3D p * cfg->m * PLL_SDM_COEFF;
> +	} else {
> +		cfg->output_rate *=3D cfg->n;
> +		cfg->output_rate /=3D p * cfg->m;
> +	}
> +
> +	cfg->input_rate =3D input_rate;
> +
> +	return 0;
> +}
> +
> +/*
> + * clk_pll_set_gain - set gain to m, n to calculate correct VCO rate
> + *
> + * @cfg: struct tegra_clk_pll_freq_table * cfg
> + *
> + * For Normal mode:
> + *     Fvco =3D Fref * NDIV / MDIV
> + *
> + * For fractional mode:
> + *     Fvco =3D Fref * (NDIV + 0.5 + SDM_DIN / PLL_SDM_COEFF) / MDIV
> + */
> +static void tegra210_clk_pll_set_gain(struct tegra_clk_pll_freq_table *c=
fg)
> +{
> +	cfg->n =3D sdin_get_n_eff(cfg);
> +	cfg->m *=3D PLL_SDM_COEFF;
> +}
> +
> +static unsigned long
> +tegra210_clk_adjust_vco_min(struct tegra_clk_pll_params *params,
> +			    unsigned long parent_rate)
> +{
> +	unsigned long vco_min =3D params->vco_min;
> +
> +	params->vco_min +=3D DIV_ROUND_UP(parent_rate, PLL_SDM_COEFF);
> +	vco_min =3D min(vco_min, params->vco_min);
> +
> +	return vco_min;
> +}
> +
> +static struct div_nmp pllx_nmp =3D {
> +	.divm_shift =3D 0,
> +	.divm_width =3D 8,
> +	.divn_shift =3D 8,
> +	.divn_width =3D 8,
> +	.divp_shift =3D 20,
> +	.divp_width =3D 5,
> +};
> +/*
> + * PLL post divider maps - two types: quasi-linear and exponential
> + * post divider.
> + */
> +#define PLL_QLIN_PDIV_MAX	16
> +static const struct pdiv_map pll_qlin_pdiv_to_hw[] =3D {
> +	{ .pdiv =3D  1, .hw_val =3D  0 },
> +	{ .pdiv =3D  2, .hw_val =3D  1 },
> +	{ .pdiv =3D  3, .hw_val =3D  2 },
> +	{ .pdiv =3D  4, .hw_val =3D  3 },
> +	{ .pdiv =3D  5, .hw_val =3D  4 },
> +	{ .pdiv =3D  6, .hw_val =3D  5 },
> +	{ .pdiv =3D  8, .hw_val =3D  6 },
> +	{ .pdiv =3D  9, .hw_val =3D  7 },
> +	{ .pdiv =3D 10, .hw_val =3D  8 },
> +	{ .pdiv =3D 12, .hw_val =3D  9 },
> +	{ .pdiv =3D 15, .hw_val =3D 10 },
> +	{ .pdiv =3D 16, .hw_val =3D 11 },
> +	{ .pdiv =3D 18, .hw_val =3D 12 },
> +	{ .pdiv =3D 20, .hw_val =3D 13 },
> +	{ .pdiv =3D 24, .hw_val =3D 14 },
> +	{ .pdiv =3D 30, .hw_val =3D 15 },
> +	{ .pdiv =3D 31, .hw_val =3D 16 },
> +	{ .pdiv =3D  0, },
> +};
> +
> +static u32 pll_qlin_p_to_pdiv(u32 p, u32 *pdiv)
> +{
> +	int i;
> +
> +	if (p) {
> +		for (i =3D 0; i <=3D PLL_QLIN_PDIV_MAX; i++) {
> +			if (p <=3D pll_qlin_pdiv_to_hw[i].pdiv) {
> +				if (pdiv)
> +					*pdiv =3D i;
> +				return pll_qlin_pdiv_to_hw[i].pdiv;
> +			}
> +		}
> +	}
> +
> +	return -EINVAL;
> +}
> +
> +#define PLL_EXPO_PDIV_MAX	7
> +static const struct pdiv_map pll_expo_pdiv_to_hw[] =3D {
> +	{ .pdiv =3D   1, .hw_val =3D 0 },
> +	{ .pdiv =3D   2, .hw_val =3D 1 },
> +	{ .pdiv =3D   4, .hw_val =3D 2 },
> +	{ .pdiv =3D   8, .hw_val =3D 3 },
> +	{ .pdiv =3D  16, .hw_val =3D 4 },
> +	{ .pdiv =3D  32, .hw_val =3D 5 },
> +	{ .pdiv =3D  64, .hw_val =3D 6 },
> +	{ .pdiv =3D 128, .hw_val =3D 7 },
> +	{ .pdiv =3D   0, },
> +};
> +
> +static u32 pll_expo_p_to_pdiv(u32 p, u32 *pdiv)
> +{
> +	if (p) {
> +		u32 i =3D fls(p);
> +
> +		if (i =3D=3D ffs(p))
> +			i--;
> +
> +		if (i <=3D PLL_EXPO_PDIV_MAX) {
> +			if (pdiv)
> +				*pdiv =3D i;
> +			return 1 << i;
> +		}
> +	}
> +	return -EINVAL;
> +}
> +
> +static struct tegra_clk_pll_freq_table pll_x_freq_table[] =3D {
> +	/* 1 GHz */
> +	{ 38400000, 1000000000, 104, 2, 2, 0 }, /* actual: 998.4 MHz */
> +	{        0,          0,   0, 0, 0, 0 },
> +};
> +
> +static struct tegra_clk_pll_params pll_x_params =3D {
> +	.input_min =3D 13500000,
> +	.input_max =3D 800000000,
> +	.cf_min =3D 13500000,
> +	.cf_max =3D 38400000,
> +	.vco_min =3D 1300000000,
> +	.vco_max =3D 3000000000UL,
> +	.base_reg =3D PLLX_BASE,
> +	.misc_reg =3D PLLX_MISC0,
> +	.lock_mask =3D PLL_BASE_LOCK,
> +	.lock_enable_bit_idx =3D PLL_MISC_LOCK_ENABLE,
> +	.lock_delay =3D 300,
> +	.ext_misc_reg[0] =3D PLLX_MISC0,
> +	.ext_misc_reg[1] =3D PLLX_MISC1,
> +	.ext_misc_reg[2] =3D PLLX_MISC2,
> +	.ext_misc_reg[3] =3D PLLX_MISC3,
> +	.ext_misc_reg[4] =3D PLLX_MISC4,
> +	.ext_misc_reg[5] =3D PLLX_MISC5,
> +	.iddq_reg =3D PLLX_MISC3,
> +	.iddq_bit_idx =3D PLLXP_IDDQ_BIT,
> +	.max_p =3D PLL_QLIN_PDIV_MAX,
> +	.mdiv_default =3D 2,
> +	.dyn_ramp_reg =3D PLLX_MISC2,
> +	.stepa_shift =3D 16,
> +	.stepb_shift =3D 24,
> +	.round_p_to_pdiv =3D pll_qlin_p_to_pdiv,
> +	.pdiv_tohw =3D pll_qlin_pdiv_to_hw,
> +	.div_nmp =3D &pllx_nmp,
> +	.freq_table =3D pll_x_freq_table,
> +	.flags =3D TEGRA_PLL_USE_LOCK | TEGRA_PLL_HAS_LOCK_ENABLE,
> +	.dyn_ramp =3D tegra210_pllx_dyn_ramp,
> +	.set_defaults =3D tegra210_pllx_set_defaults,
> +	.calc_rate =3D tegra210_pll_fixed_mdiv_cfg,
> +};
> +
> +static struct div_nmp pllc_nmp =3D {
> +	.divm_shift =3D 0,
> +	.divm_width =3D 8,
> +	.divn_shift =3D 10,
> +	.divn_width =3D 8,
> +	.divp_shift =3D 20,
> +	.divp_width =3D 5,
> +};
> +
> +static struct tegra_clk_pll_freq_table pll_cx_freq_table[] =3D {
> +	{ 38400000, 510000000, 53, 2, 2, 0 }, /* actual: 508.8 MHz */
> +	{        0,         0,  0, 0, 0, 0 },
> +};
> +
> +static struct tegra_clk_pll_params pll_c_params =3D {
> +	.input_min =3D 19200000,
> +	.input_max =3D 700000000,
> +	.cf_min =3D 19200000,
> +	.cf_max =3D 38400000,
> +	.vco_min =3D 600000000,
> +	.vco_max =3D 1200000000,
> +	.base_reg =3D PLLC_BASE,
> +	.misc_reg =3D PLLC_MISC0,
> +	.lock_mask =3D PLL_BASE_LOCK,
> +	.lock_delay =3D 300,
> +	.iddq_reg =3D PLLC_MISC1,
> +	.iddq_bit_idx =3D PLLCX_IDDQ_BIT,
> +	.reset_reg =3D PLLC_MISC0,
> +	.reset_bit_idx =3D PLLCX_RESET_BIT,
> +	.max_p =3D PLL_QLIN_PDIV_MAX,
> +	.ext_misc_reg[0] =3D PLLC_MISC0,
> +	.ext_misc_reg[1] =3D PLLC_MISC1,
> +	.ext_misc_reg[2] =3D PLLC_MISC2,
> +	.ext_misc_reg[3] =3D PLLC_MISC3,
> +	.round_p_to_pdiv =3D pll_qlin_p_to_pdiv,
> +	.pdiv_tohw =3D pll_qlin_pdiv_to_hw,
> +	.mdiv_default =3D 2,
> +	.div_nmp =3D &pllc_nmp,
> +	.freq_table =3D pll_cx_freq_table,
> +	.flags =3D TEGRA_PLL_USE_LOCK,
> +	.set_defaults =3D _pllc_set_defaults,
> +	.calc_rate =3D tegra210_pll_fixed_mdiv_cfg,
> +};
> +
> +static struct div_nmp pllcx_nmp =3D {
> +	.divm_shift =3D 0,
> +	.divm_width =3D 8,
> +	.divn_shift =3D 10,
> +	.divn_width =3D 8,
> +	.divp_shift =3D 20,
> +	.divp_width =3D 5,
> +};
> +
> +static struct tegra_clk_pll_params pll_c2_params =3D {
> +	.input_min =3D 19200000,
> +	.input_max =3D 700000000,
> +	.cf_min =3D 19200000,
> +	.cf_max =3D 38400000,
> +	.vco_min =3D 600000000,
> +	.vco_max =3D 1200000000,
> +	.base_reg =3D PLLC2_BASE,
> +	.misc_reg =3D PLLC2_MISC0,
> +	.iddq_reg =3D PLLC2_MISC1,
> +	.iddq_bit_idx =3D PLLCX_IDDQ_BIT,
> +	.reset_reg =3D PLLC2_MISC0,
> +	.reset_bit_idx =3D PLLCX_RESET_BIT,
> +	.lock_mask =3D PLLCX_BASE_LOCK,
> +	.lock_delay =3D 300,
> +	.round_p_to_pdiv =3D pll_qlin_p_to_pdiv,
> +	.pdiv_tohw =3D pll_qlin_pdiv_to_hw,
> +	.mdiv_default =3D 2,
> +	.div_nmp =3D &pllcx_nmp,
> +	.max_p =3D PLL_QLIN_PDIV_MAX,
> +	.ext_misc_reg[0] =3D PLLC2_MISC0,
> +	.ext_misc_reg[1] =3D PLLC2_MISC1,
> +	.ext_misc_reg[2] =3D PLLC2_MISC2,
> +	.ext_misc_reg[3] =3D PLLC2_MISC3,
> +	.freq_table =3D pll_cx_freq_table,
> +	.flags =3D TEGRA_PLL_USE_LOCK,
> +	.set_defaults =3D _pllc2_set_defaults,
> +	.calc_rate =3D tegra210_pll_fixed_mdiv_cfg,
> +};
> +
> +static struct tegra_clk_pll_params pll_c3_params =3D {
> +	.input_min =3D 19200000,
> +	.input_max =3D 700000000,
> +	.cf_min =3D 19200000,
> +	.cf_max =3D 38400000,
> +	.vco_min =3D 600000000,
> +	.vco_max =3D 1200000000,
> +	.base_reg =3D PLLC3_BASE,
> +	.misc_reg =3D PLLC3_MISC0,
> +	.lock_mask =3D PLLCX_BASE_LOCK,
> +	.lock_delay =3D 300,
> +	.iddq_reg =3D PLLC3_MISC1,
> +	.iddq_bit_idx =3D PLLCX_IDDQ_BIT,
> +	.reset_reg =3D PLLC3_MISC0,
> +	.reset_bit_idx =3D PLLCX_RESET_BIT,
> +	.round_p_to_pdiv =3D pll_qlin_p_to_pdiv,
> +	.pdiv_tohw =3D pll_qlin_pdiv_to_hw,
> +	.mdiv_default =3D 2,
> +	.div_nmp =3D &pllcx_nmp,
> +	.max_p =3D PLL_QLIN_PDIV_MAX,
> +	.ext_misc_reg[0] =3D PLLC3_MISC0,
> +	.ext_misc_reg[1] =3D PLLC3_MISC1,
> +	.ext_misc_reg[2] =3D PLLC3_MISC2,
> +	.ext_misc_reg[3] =3D PLLC3_MISC3,
> +	.freq_table =3D pll_cx_freq_table,
> +	.flags =3D TEGRA_PLL_USE_LOCK,
> +	.set_defaults =3D _pllc3_set_defaults,
> +	.calc_rate =3D tegra210_pll_fixed_mdiv_cfg,
> +};
> +
> +static struct div_nmp pllss_nmp =3D {
> +	.divm_shift =3D 0,
> +	.divm_width =3D 8,
> +	.divn_shift =3D 8,
> +	.divn_width =3D 8,
> +	.divp_shift =3D 19,
> +	.divp_width =3D 5,
> +};
> +
> +static struct tegra_clk_pll_freq_table pll_c4_vco_freq_table[] =3D {
> +	{ 38400000, 998400000, 52, 2, 1, 0 },
> +	{ 38400000, 787200000, 41, 2, 1, 0 },
> +	{        0,         0,  0, 0, 0, 0 },
> +};
> +
> +static const struct clk_div_table pll_vco_post_div_table[] =3D {
> +	{ .val =3D  0, .div =3D  1 },
> +	{ .val =3D  1, .div =3D  2 },
> +	{ .val =3D  2, .div =3D  3 },
> +	{ .val =3D  3, .div =3D  4 },
> +	{ .val =3D  4, .div =3D  5 },
> +	{ .val =3D  5, .div =3D  6 },
> +	{ .val =3D  6, .div =3D  8 },
> +	{ .val =3D  7, .div =3D  9 },
> +	{ .val =3D  8, .div =3D 10 },
> +	{ .val =3D  9, .div =3D 12 },
> +	{ .val =3D 10, .div =3D 15 },
> +	{ .val =3D 11, .div =3D 16 },
> +	{ .val =3D 12, .div =3D 18 },
> +	{ .val =3D 13, .div =3D 20 },
> +	{ .val =3D 14, .div =3D 24 },
> +	{ .val =3D 15, .div =3D 30 },
> +	{ .val =3D 16, .div =3D 31 },
> +	{ .val =3D  0, .div =3D  0 },
> +};
> +
> +static struct tegra_clk_pll_params pll_c4_vco_params =3D {
> +	.input_min =3D 12000000,
> +	.input_max =3D 800000000,
> +	.cf_min =3D 12000000,
> +	.cf_max =3D 38400000,
> +	.vco_min =3D 500000000,
> +	.vco_max =3D 1000000000,
> +	.base_reg =3D PLLC4_BASE,
> +	.misc_reg =3D PLLC4_MISC0,
> +	.lock_mask =3D PLL_BASE_LOCK,
> +	.lock_delay =3D 300,
> +	.max_p =3D PLL_QLIN_PDIV_MAX,
> +	.ext_misc_reg[0] =3D PLLC4_MISC0,
> +	.iddq_reg =3D PLLC4_BASE,
> +	.iddq_bit_idx =3D PLLSS_IDDQ_BIT,
> +	.round_p_to_pdiv =3D pll_qlin_p_to_pdiv,
> +	.pdiv_tohw =3D pll_qlin_pdiv_to_hw,
> +	.mdiv_default =3D 2,
> +	.div_nmp =3D &pllss_nmp,
> +	.freq_table =3D pll_c4_vco_freq_table,
> +	.set_defaults =3D tegra210_pllc4_set_defaults,
> +	.flags =3D TEGRA_PLL_USE_LOCK | TEGRA_PLL_VCO_OUT,
> +	.calc_rate =3D tegra210_pll_fixed_mdiv_cfg,
> +};
> +
> +static struct tegra_clk_pll_freq_table pll_e_freq_table[] =3D {
> +	/* PLLE special case: use cpcon field to store cml divider value */
> +	{  38400000, 100000000, 125,  2, 1, 14 },
> +	{         0,         0,   0,  0, 0,  0 },
> +};
> +
> +static struct div_nmp plle_nmp =3D {
> +	.divm_shift =3D 0,
> +	.divm_width =3D 8,
> +	.divn_shift =3D 8,
> +	.divn_width =3D 8,
> +	.divp_shift =3D 24,
> +	.divp_width =3D 5,
> +};
> +
> +static struct tegra_clk_pll_params pll_e_params =3D {
> +	.input_min =3D 19200000,
> +	.input_max =3D 800000000,
> +	.cf_min =3D 19200000,
> +	.cf_max =3D 38400000,
> +	.vco_min =3D 1250000000,
> +	.vco_max =3D 2500000000U,
> +	.base_reg =3D PLLE_BASE,
> +	.misc_reg =3D PLLE_MISC0,
> +	.aux_reg =3D PLLE_AUX,
> +	.lock_mask =3D PLLE_MISC_LOCK,
> +	.lock_enable_bit_idx =3D PLLE_MISC_LOCK_ENABLE,
> +	.lock_delay =3D 300,
> +	.div_nmp =3D &plle_nmp,
> +	.ssc_ctrl_en_mask =3D PLLE_SS_COEFFICIENTS_VAL,
> +#if PLLE_SS_ENABLE
> +	.ssc_ctrl_reg =3D PLLE_SS_CTRL,
> +#endif
> +	.freq_table =3D pll_e_freq_table,
> +	.flags =3D TEGRA_PLL_FIXED | TEGRA_PLL_LOCK_MISC | TEGRA_PLL_USE_LOCK |
> +		 TEGRA_PLL_HAS_LOCK_ENABLE,
> +	.fixed_rate =3D 100000000,
> +	.calc_rate =3D tegra210_pll_fixed_mdiv_cfg,
> +};
> +
> +static struct tegra_clk_pll_freq_table pll_re_vco_freq_table[] =3D {
> +	{ 38400000, 672000000,  70,  4, 1, 0 },
> +	{ 38400000, 624000000,  65,  4, 1, 0 },
> +	{ 60000000, 625000000, 125, 12, 1, 0 },
> +	{        0,         0,   0,  0, 0, 0 },
> +};
> +
> +static struct div_nmp pllre_nmp =3D {
> +	.divm_shift =3D 0,
> +	.divm_width =3D 8,
> +	.divn_shift =3D 8,
> +	.divn_width =3D 8,
> +	.divp_shift =3D 16,
> +	.divp_width =3D 5,
> +};
> +
> +static struct tegra_clk_pll_params pll_re_vco_params =3D {
> +	.input_min =3D 9600000,
> +	.input_max =3D 800000000,
> +	.cf_min =3D 9600000,
> +	.cf_max =3D 19200000,
> +	.vco_min =3D 350000000,
> +	.vco_max =3D 700000000,
> +	.base_reg =3D PLLRE_BASE,
> +	.misc_reg =3D PLLRE_MISC0,
> +	.lock_mask =3D PLLRE_MISC_LOCK,
> +	.lock_delay =3D 300,
> +	.max_p =3D PLL_QLIN_PDIV_MAX,
> +	.ext_misc_reg[0] =3D PLLRE_MISC0,
> +	.iddq_reg =3D PLLRE_MISC0,
> +	.iddq_bit_idx =3D PLLRE_IDDQ_BIT,
> +	.round_p_to_pdiv =3D pll_qlin_p_to_pdiv,
> +	.pdiv_tohw =3D pll_qlin_pdiv_to_hw,
> +	.div_nmp =3D &pllre_nmp,
> +	.mdiv_default =3D 4,
> +	.freq_table =3D pll_re_vco_freq_table,
> +	.flags =3D TEGRA_PLL_USE_LOCK | TEGRA_PLL_LOCK_MISC | TEGRA_PLL_VCO_OUT=
,
> +	.set_defaults =3D tegra210_pllre_set_defaults,
> +	.calc_rate =3D tegra210_pll_fixed_mdiv_cfg,
> +};
> +
> +static struct div_nmp pllp_nmp =3D {
> +	.divm_shift =3D 0,
> +	.divm_width =3D 8,
> +	.divn_shift =3D 10,
> +	.divn_width =3D 8,
> +	.divp_shift =3D 20,
> +	.divp_width =3D 5,
> +};
> +
> +static struct tegra_clk_pll_freq_table pll_p_freq_table[] =3D {
> +	/* cf =3D 4.8MHz, allowed exception */
> +	{ 38400000, 408000000, 85, 8, 1, 0 },
> +	{        0,         0,  0, 0, 0, 0 },
> +};
> +
> +static struct tegra_clk_pll_params pll_p_params =3D {
> +	.input_min =3D 9600000,
> +	.input_max =3D 800000000,
> +	.cf_min =3D 9600000,
> +	.cf_max =3D 19200000,
> +	.vco_min =3D 350000000,
> +	.vco_max =3D 700000000,
> +	.base_reg =3D PLLP_BASE,
> +	.misc_reg =3D PLLP_MISC0,
> +	.lock_mask =3D PLL_BASE_LOCK,
> +	.lock_delay =3D 300,
> +	.iddq_reg =3D PLLP_MISC0,
> +	.iddq_bit_idx =3D PLLXP_IDDQ_BIT,
> +	.ext_misc_reg[0] =3D PLLP_MISC0,
> +	.ext_misc_reg[1] =3D PLLP_MISC1,
> +	.div_nmp =3D &pllp_nmp,
> +	.freq_table =3D pll_p_freq_table,
> +	.fixed_rate =3D 408000000,
> +	.flags =3D TEGRA_PLL_FIXED | TEGRA_PLL_USE_LOCK | TEGRA_PLL_VCO_OUT,
> +	.mdiv_default =3D 4,
> +	.set_defaults =3D tegra210_pllp_set_defaults,
> +	.calc_rate =3D tegra210_pll_fixed_mdiv_cfg,
> +};
> +
> +static struct tegra_clk_pll_params pll_a1_params =3D {
> +	.input_min =3D 19200000,
> +	.input_max =3D 700000000,
> +	.cf_min =3D 19200000,
> +	.cf_max =3D 38400000,
> +	.vco_min =3D 600000000,
> +	.vco_max =3D 1200000000,
> +	.base_reg =3D PLLA1_BASE,
> +	.misc_reg =3D PLLA1_MISC0,
> +	.lock_mask =3D PLLCX_BASE_LOCK,
> +	.lock_delay =3D 300,
> +	.iddq_reg =3D PLLA1_MISC1,
> +	.iddq_bit_idx =3D PLLCX_IDDQ_BIT,
> +	.reset_reg =3D PLLA1_MISC0,
> +	.reset_bit_idx =3D PLLCX_RESET_BIT,
> +	.round_p_to_pdiv =3D pll_qlin_p_to_pdiv,
> +	.pdiv_tohw =3D pll_qlin_pdiv_to_hw,
> +	.div_nmp =3D &pllcx_nmp,
> +	.ext_misc_reg[0] =3D PLLA1_MISC0,
> +	.ext_misc_reg[1] =3D PLLA1_MISC1,
> +	.ext_misc_reg[2] =3D PLLA1_MISC2,
> +	.ext_misc_reg[3] =3D PLLA1_MISC3,
> +	.freq_table =3D pll_cx_freq_table,
> +	.flags =3D TEGRA_PLL_USE_LOCK,
> +	.mdiv_default =3D 2,
> +	.set_defaults =3D _plla1_set_defaults,
> +	.calc_rate =3D tegra210_pll_fixed_mdiv_cfg,
> +};
> +
> +static struct div_nmp plla_nmp =3D {
> +	.divm_shift =3D 0,
> +	.divm_width =3D 8,
> +	.divn_shift =3D 8,
> +	.divn_width =3D 8,
> +	.divp_shift =3D 20,
> +	.divp_width =3D 5,
> +};
> +
> +static struct tegra_clk_pll_freq_table pll_a_freq_table[] =3D {
> +	{ 38400000, 282240000, 29, 2, 2, 1, 0xfccc }, /* actual: 282239063 */
> +	{ 38400000, 368640000, 38, 2, 2, 1, 0xfccc }, /* actual: 368639063 */
> +	{        0,         0,  0, 0, 0, 0,      0 },
> +};
> +
> +static struct tegra_clk_pll_params pll_a_params =3D {
> +	.input_min =3D 12000000,
> +	.input_max =3D 800000000,
> +	.cf_min =3D 12000000,
> +	.cf_max =3D 38400000,
> +	.vco_min =3D 500000000,
> +	.vco_max =3D 1000000000,
> +	.base_reg =3D PLLA_BASE,
> +	.misc_reg =3D PLLA_MISC0,
> +	.lock_mask =3D PLL_BASE_LOCK,
> +	.lock_delay =3D 300,
> +	.round_p_to_pdiv =3D pll_qlin_p_to_pdiv,
> +	.pdiv_tohw =3D pll_qlin_pdiv_to_hw,
> +	.iddq_reg =3D PLLA_BASE,
> +	.iddq_bit_idx =3D PLLA_IDDQ_BIT,
> +	.div_nmp =3D &plla_nmp,
> +	.sdm_din_reg =3D PLLA_MISC1,
> +	.sdm_din_mask =3D PLLA_SDM_DIN_MASK,
> +	.sdm_ctrl_reg =3D PLLA_MISC2,
> +	.sdm_ctrl_en_mask =3D PLLA_SDM_EN_MASK,
> +	.ext_misc_reg[0] =3D PLLA_MISC0,
> +	.ext_misc_reg[1] =3D PLLA_MISC1,
> +	.ext_misc_reg[2] =3D PLLA_MISC2,
> +	.freq_table =3D pll_a_freq_table,
> +	.flags =3D TEGRA_PLL_USE_LOCK | TEGRA_MDIV_NEW,
> +	.mdiv_default =3D 2,
> +	.set_defaults =3D tegra210_plla_set_defaults,
> +	.calc_rate =3D tegra210_pll_fixed_mdiv_cfg,
> +	.set_gain =3D tegra210_clk_pll_set_gain,
> +	.adjust_vco =3D tegra210_clk_adjust_vco_min,
> +};
> +
> +static struct div_nmp plld_nmp =3D {
> +	.divm_shift =3D 0,
> +	.divm_width =3D 8,
> +	.divn_shift =3D 11,
> +	.divn_width =3D 8,
> +	.divp_shift =3D 20,
> +	.divp_width =3D 3,
> +};
> +
> +static struct tegra_clk_pll_freq_table pll_d_freq_table[] =3D {
> +	{ 38400000, 594000000, 30, 1, 2, 0, 0x0e00 },
> +	{        0,         0,  0, 0, 0, 0,      0 },
> +};
> +
> +static struct tegra_clk_pll_params pll_d_params =3D {
> +	.input_min =3D 13500000,
> +	.input_max =3D 800000000,
> +	.cf_min =3D 13500000,
> +	.cf_max =3D 38400000,
> +	.vco_min =3D 800000000,
> +	.vco_max =3D 1620000000,
> +	.base_reg =3D PLLD_BASE,
> +	.misc_reg =3D PLLD_MISC0,
> +	.lock_mask =3D PLL_BASE_LOCK,
> +	.lock_delay =3D 1000,
> +	.iddq_reg =3D PLLD_MISC0,
> +	.iddq_bit_idx =3D PLLD_IDDQ_BIT,
> +	.round_p_to_pdiv =3D pll_expo_p_to_pdiv,
> +	.pdiv_tohw =3D pll_expo_pdiv_to_hw,
> +	.div_nmp =3D &plld_nmp,
> +	.sdm_din_reg =3D PLLD_MISC0,
> +	.sdm_din_mask =3D PLLA_SDM_DIN_MASK,
> +	.sdm_ctrl_reg =3D PLLD_MISC0,
> +	.sdm_ctrl_en_mask =3D PLLD_SDM_EN_MASK,
> +	.ext_misc_reg[0] =3D PLLD_MISC0,
> +	.ext_misc_reg[1] =3D PLLD_MISC1,
> +	.freq_table =3D pll_d_freq_table,
> +	.flags =3D TEGRA_PLL_USE_LOCK,
> +	.mdiv_default =3D 1,
> +	.set_defaults =3D tegra210_plld_set_defaults,
> +	.calc_rate =3D tegra210_pll_fixed_mdiv_cfg,
> +	.set_gain =3D tegra210_clk_pll_set_gain,
> +	.adjust_vco =3D tegra210_clk_adjust_vco_min,
> +};
> +
> +static struct tegra_clk_pll_freq_table tegra210_pll_d2_freq_table[] =3D =
{
> +	{ 38400000, 594000000, 30, 1, 2, 0, 0x0e00 },
> +	{        0,         0,  0, 0, 0, 0,      0 },
> +};
> +
> +/* s/w policy, always tegra_pll_ref */
> +static struct tegra_clk_pll_params pll_d2_params =3D {
> +	.input_min =3D 13500000,
> +	.input_max =3D 800000000,
> +	.cf_min =3D 13500000,
> +	.cf_max =3D 38400000,
> +	.vco_min =3D 780000000,
> +	.vco_max =3D 1620000000,
> +	.base_reg =3D PLLD2_BASE,
> +	.misc_reg =3D PLLD2_MISC0,
> +	.lock_mask =3D PLL_BASE_LOCK,
> +	.lock_delay =3D 300,
> +	.iddq_reg =3D PLLD2_BASE,
> +	.iddq_bit_idx =3D PLLSS_IDDQ_BIT,
> +	.sdm_din_reg =3D PLLD2_MISC3,
> +	.sdm_din_mask =3D PLLA_SDM_DIN_MASK,
> +	.sdm_ctrl_reg =3D PLLD2_MISC1,
> +	.sdm_ctrl_en_mask =3D PLLD2_SDM_EN_MASK,
> +	.ssc_ctrl_reg =3D PLLD2_MISC1,
> +	.ssc_ctrl_en_mask =3D PLLD2_SSC_EN_MASK,
> +	.round_p_to_pdiv =3D pll_qlin_p_to_pdiv,
> +	.pdiv_tohw =3D pll_qlin_pdiv_to_hw,
> +	.div_nmp =3D &pllss_nmp,
> +	.ext_misc_reg[0] =3D PLLD2_MISC0,
> +	.ext_misc_reg[1] =3D PLLD2_MISC1,
> +	.ext_misc_reg[2] =3D PLLD2_MISC2,
> +	.ext_misc_reg[3] =3D PLLD2_MISC3,
> +	.ext_misc_reg[4] =3D PLLD2_MISC4,
> +	.max_p =3D PLL_QLIN_PDIV_MAX,
> +	.mdiv_default =3D 1,
> +	.freq_table =3D tegra210_pll_d2_freq_table,
> +	.set_defaults =3D tegra210_plld2_set_defaults,
> +	.flags =3D TEGRA_PLL_USE_LOCK,
> +	.calc_rate =3D tegra210_pll_fixed_mdiv_cfg,
> +	.set_gain =3D tegra210_clk_pll_set_gain,
> +	.adjust_vco =3D tegra210_clk_adjust_vco_min,
> +};
> +
> +static struct tegra_clk_pll_freq_table pll_dp_freq_table[] =3D {
> +	{ 38400000, 270000000, 42, 1, 6, 0, 0xf600 },
> +	{        0,         0,  0, 0, 0, 0,      0 },
> +};
> +
> +static struct tegra_clk_pll_params pll_dp_params =3D {
> +	.input_min =3D 13500000,
> +	.input_max =3D 800000000,
> +	.cf_min =3D 13500000,
> +	.cf_max =3D 38400000,
> +	.vco_min =3D 780000000,
> +	.vco_max =3D 1620000000,
> +	.base_reg =3D PLLDP_BASE,
> +	.misc_reg =3D PLLDP_MISC,
> +	.lock_mask =3D PLL_BASE_LOCK,
> +	.lock_delay =3D 300,
> +	.iddq_reg =3D PLLDP_BASE,
> +	.iddq_bit_idx =3D PLLSS_IDDQ_BIT,
> +	.sdm_din_reg =3D PLLDP_SS_CTRL2,
> +	.sdm_din_mask =3D PLLA_SDM_DIN_MASK,
> +	.sdm_ctrl_reg =3D PLLDP_SS_CFG,
> +	.sdm_ctrl_en_mask =3D PLLDP_SDM_EN_MASK,
> +	.ssc_ctrl_reg =3D PLLDP_SS_CFG,
> +	.ssc_ctrl_en_mask =3D PLLDP_SSC_EN_MASK,
> +	.round_p_to_pdiv =3D pll_qlin_p_to_pdiv,
> +	.pdiv_tohw =3D pll_qlin_pdiv_to_hw,
> +	.div_nmp =3D &pllss_nmp,
> +	.ext_misc_reg[0] =3D PLLDP_MISC,
> +	.ext_misc_reg[1] =3D PLLDP_SS_CFG,
> +	.ext_misc_reg[2] =3D PLLDP_SS_CTRL1,
> +	.ext_misc_reg[3] =3D PLLDP_SS_CTRL2,
> +	.ext_misc_reg[4] =3D PLLDP_MISC4,
> +	.max_p =3D PLL_QLIN_PDIV_MAX,
> +	.mdiv_default =3D 1,
> +	.freq_table =3D pll_dp_freq_table,
> +	.set_defaults =3D tegra210_plldp_set_defaults,
> +	.flags =3D TEGRA_PLL_USE_LOCK,
> +	.calc_rate =3D tegra210_pll_fixed_mdiv_cfg,
> +	.set_gain =3D tegra210_clk_pll_set_gain,
> +	.adjust_vco =3D tegra210_clk_adjust_vco_min,
> +};
> +
> +static struct div_nmp pllu_nmp =3D {
> +	.divm_shift =3D 0,
> +	.divm_width =3D 8,
> +	.divn_shift =3D 8,
> +	.divn_width =3D 8,
> +	.divp_shift =3D 16,
> +	.divp_width =3D 5,
> +};
> +
> +static struct tegra_clk_pll_freq_table pll_u_freq_table[] =3D {
> +	{ 38400000, 240000000, 25, 2, 1, 0 },
> +	{        0,         0,  0, 0, 0, 0 },
> +};
> +
> +static struct tegra_clk_pll_params pll_u_vco_params =3D {
> +	.input_min =3D 9600000,
> +	.input_max =3D 800000000,
> +	.cf_min =3D 9600000,
> +	.cf_max =3D 19200000,
> +	.vco_min =3D 350000000,
> +	.vco_max =3D 700000000,
> +	.base_reg =3D PLLU_BASE,
> +	.misc_reg =3D PLLU_MISC0,
> +	.lock_mask =3D PLL_BASE_LOCK,
> +	.lock_delay =3D 1000,
> +	.iddq_reg =3D PLLU_MISC0,
> +	.iddq_bit_idx =3D PLLU_IDDQ_BIT,
> +	.ext_misc_reg[0] =3D PLLU_MISC0,
> +	.ext_misc_reg[1] =3D PLLU_MISC1,
> +	.round_p_to_pdiv =3D pll_qlin_p_to_pdiv,
> +	.pdiv_tohw =3D pll_qlin_pdiv_to_hw,
> +	.div_nmp =3D &pllu_nmp,
> +	.mdiv_default =3D 2,
> +	.freq_table =3D pll_u_freq_table,
> +	.flags =3D TEGRA_PLLU | TEGRA_PLL_USE_LOCK | TEGRA_PLL_VCO_OUT,
> +};
> +
> +struct utmi_clk_param {
> +	/* Oscillator Frequency in KHz */
> +	u32 osc_frequency;
> +	/* UTMIP PLL Enable Delay Count  */
> +	u8 enable_delay_count;
> +	/* UTMIP PLL Stable count */
> +	u16 stable_count;
> +	/*  UTMIP PLL Active delay count */
> +	u8 active_delay_count;
> +	/* UTMIP PLL Xtal frequency count */
> +	u16 xtal_freq_count;
> +};
> +
> +static const struct utmi_clk_param utmi_parameters[] =3D {
> +	{
> +		.osc_frequency =3D 38400000, .enable_delay_count =3D 0x0,
> +		.stable_count =3D 0x0, .active_delay_count =3D 0x6,
> +		.xtal_freq_count =3D 0x80
> +	}, {
> +		.osc_frequency =3D 13000000, .enable_delay_count =3D 0x02,
> +		.stable_count =3D 0x33, .active_delay_count =3D 0x05,
> +		.xtal_freq_count =3D 0x7f
> +	}, {
> +		.osc_frequency =3D 19200000, .enable_delay_count =3D 0x03,
> +		.stable_count =3D 0x4b, .active_delay_count =3D 0x06,
> +		.xtal_freq_count =3D 0xbb
> +	}, {
> +		.osc_frequency =3D 12000000, .enable_delay_count =3D 0x02,
> +		.stable_count =3D 0x2f, .active_delay_count =3D 0x08,
> +		.xtal_freq_count =3D 0x76
> +	}, {
> +		.osc_frequency =3D 26000000, .enable_delay_count =3D 0x04,
> +		.stable_count =3D 0x66, .active_delay_count =3D 0x09,
> +		.xtal_freq_count =3D 0xfe
> +	}, {
> +		.osc_frequency =3D 16800000, .enable_delay_count =3D 0x03,
> +		.stable_count =3D 0x41, .active_delay_count =3D 0x0a,
> +		.xtal_freq_count =3D 0xa4
> +	},
> +};
> +
> +static struct tegra_clk tegra210_clks[tegra_clk_max] __initdata =3D {
> +	[tegra_clk_ispb] =3D { .dt_id =3D TEGRA210_CLK_ISPB, .present =3D true =
},
> +	[tegra_clk_rtc] =3D { .dt_id =3D TEGRA210_CLK_RTC, .present =3D true },
> +	[tegra_clk_timer] =3D { .dt_id =3D TEGRA210_CLK_TIMER, .present =3D tru=
e },
> +	[tegra_clk_uarta_8] =3D { .dt_id =3D TEGRA210_CLK_UARTA, .present =3D t=
rue },
> +	[tegra_clk_i2s1] =3D { .dt_id =3D TEGRA210_CLK_I2S1, .present =3D true =
},
> +	[tegra_clk_i2c1] =3D { .dt_id =3D TEGRA210_CLK_I2C1, .present =3D true =
},
> +	[tegra_clk_sdmmc1_9] =3D { .dt_id =3D TEGRA210_CLK_SDMMC1, .present =3D=
 true },
> +	[tegra_clk_pwm] =3D { .dt_id =3D TEGRA210_CLK_PWM, .present =3D true },
> +	[tegra_clk_i2s2] =3D { .dt_id =3D TEGRA210_CLK_I2S2, .present =3D true =
},
> +	[tegra_clk_usbd] =3D { .dt_id =3D TEGRA210_CLK_USBD, .present =3D true =
},
> +	[tegra_clk_isp_9] =3D { .dt_id =3D TEGRA210_CLK_ISP, .present =3D true =
},
> +	[tegra_clk_disp2_8] =3D { .dt_id =3D TEGRA210_CLK_DISP2, .present =3D t=
rue },
> +	[tegra_clk_disp1_8] =3D { .dt_id =3D TEGRA210_CLK_DISP1, .present =3D t=
rue },
> +	[tegra_clk_host1x_9] =3D { .dt_id =3D TEGRA210_CLK_HOST1X, .present =3D=
 true },
> +	[tegra_clk_i2s0] =3D { .dt_id =3D TEGRA210_CLK_I2S0, .present =3D true =
},
> +	[tegra_clk_apbdma] =3D { .dt_id =3D TEGRA210_CLK_APBDMA, .present =3D t=
rue },
> +	[tegra_clk_kfuse] =3D { .dt_id =3D TEGRA210_CLK_KFUSE, .present =3D tru=
e },
> +	[tegra_clk_sbc1_9] =3D { .dt_id =3D TEGRA210_CLK_SBC1, .present =3D tru=
e },
> +	[tegra_clk_sbc2_9] =3D { .dt_id =3D TEGRA210_CLK_SBC2, .present =3D tru=
e },
> +	[tegra_clk_sbc3_9] =3D { .dt_id =3D TEGRA210_CLK_SBC3, .present =3D tru=
e },
> +	[tegra_clk_i2c5] =3D { .dt_id =3D TEGRA210_CLK_I2C5, .present =3D true =
},
> +	[tegra_clk_csi] =3D { .dt_id =3D TEGRA210_CLK_CSI, .present =3D true },
> +	[tegra_clk_i2c2] =3D { .dt_id =3D TEGRA210_CLK_I2C2, .present =3D true =
},
> +	[tegra_clk_uartc_8] =3D { .dt_id =3D TEGRA210_CLK_UARTC, .present =3D t=
rue },
> +	[tegra_clk_mipi_cal] =3D { .dt_id =3D TEGRA210_CLK_MIPI_CAL, .present =
=3D true },
> +	[tegra_clk_usb2] =3D { .dt_id =3D TEGRA210_CLK_USB2, .present =3D true =
},
> +	[tegra_clk_bsev] =3D { .dt_id =3D TEGRA210_CLK_BSEV, .present =3D true =
},
> +	[tegra_clk_uartd_8] =3D { .dt_id =3D TEGRA210_CLK_UARTD, .present =3D t=
rue },
> +	[tegra_clk_i2c3] =3D { .dt_id =3D TEGRA210_CLK_I2C3, .present =3D true =
},
> +	[tegra_clk_sbc4_9] =3D { .dt_id =3D TEGRA210_CLK_SBC4, .present =3D tru=
e },
> +	[tegra_clk_sdmmc3_9] =3D { .dt_id =3D TEGRA210_CLK_SDMMC3, .present =3D=
 true },
> +	[tegra_clk_pcie] =3D { .dt_id =3D TEGRA210_CLK_PCIE, .present =3D true =
},
> +	[tegra_clk_owr_8] =3D { .dt_id =3D TEGRA210_CLK_OWR, .present =3D true =
},
> +	[tegra_clk_afi] =3D { .dt_id =3D TEGRA210_CLK_AFI, .present =3D true },
> +	[tegra_clk_csite_8] =3D { .dt_id =3D TEGRA210_CLK_CSITE, .present =3D t=
rue },
> +	[tegra_clk_soc_therm_8] =3D { .dt_id =3D TEGRA210_CLK_SOC_THERM, .prese=
nt =3D true },
> +	[tegra_clk_dtv] =3D { .dt_id =3D TEGRA210_CLK_DTV, .present =3D true },
> +	[tegra_clk_i2cslow] =3D { .dt_id =3D TEGRA210_CLK_I2CSLOW, .present =3D=
 true },
> +	[tegra_clk_tsec_8] =3D { .dt_id =3D TEGRA210_CLK_TSEC, .present =3D tru=
e },
> +	[tegra_clk_xusb_host] =3D { .dt_id =3D TEGRA210_CLK_XUSB_HOST, .present=
 =3D true },
> +	[tegra_clk_csus] =3D { .dt_id =3D TEGRA210_CLK_CSUS, .present =3D true =
},
> +	[tegra_clk_mselect] =3D { .dt_id =3D TEGRA210_CLK_MSELECT, .present =3D=
 true },
> +	[tegra_clk_tsensor] =3D { .dt_id =3D TEGRA210_CLK_TSENSOR, .present =3D=
 true },
> +	[tegra_clk_i2s3] =3D { .dt_id =3D TEGRA210_CLK_I2S3, .present =3D true =
},
> +	[tegra_clk_i2s4] =3D { .dt_id =3D TEGRA210_CLK_I2S4, .present =3D true =
},
> +	[tegra_clk_i2c4] =3D { .dt_id =3D TEGRA210_CLK_I2C4, .present =3D true =
},
> +	[tegra_clk_d_audio] =3D { .dt_id =3D TEGRA210_CLK_D_AUDIO, .present =3D=
 true },
> +	[tegra_clk_hda2codec_2x_8] =3D { .dt_id =3D TEGRA210_CLK_HDA2CODEC_2X, =
.present =3D true },
> +	[tegra_clk_spdif_2x] =3D { .dt_id =3D TEGRA210_CLK_SPDIF_2X, .present =
=3D true },
> +	[tegra_clk_actmon] =3D { .dt_id =3D TEGRA210_CLK_ACTMON, .present =3D t=
rue },
> +	[tegra_clk_extern1] =3D { .dt_id =3D TEGRA210_CLK_EXTERN1, .present =3D=
 true },
> +	[tegra_clk_extern2] =3D { .dt_id =3D TEGRA210_CLK_EXTERN2, .present =3D=
 true },
> +	[tegra_clk_extern3] =3D { .dt_id =3D TEGRA210_CLK_EXTERN3, .present =3D=
 true },
> +	[tegra_clk_sata_oob_8] =3D { .dt_id =3D TEGRA210_CLK_SATA_OOB, .present=
 =3D true },
> +	[tegra_clk_sata_8] =3D { .dt_id =3D TEGRA210_CLK_SATA, .present =3D tru=
e },
> +	[tegra_clk_hda_8] =3D { .dt_id =3D TEGRA210_CLK_HDA, .present =3D true =
},
> +	[tegra_clk_hda2hdmi] =3D { .dt_id =3D TEGRA210_CLK_HDA2HDMI, .present =
=3D true },
> +	[tegra_clk_cilab] =3D { .dt_id =3D TEGRA210_CLK_CILAB, .present =3D tru=
e },
> +	[tegra_clk_cilcd] =3D { .dt_id =3D TEGRA210_CLK_CILCD, .present =3D tru=
e },
> +	[tegra_clk_cile] =3D { .dt_id =3D TEGRA210_CLK_CILE, .present =3D true =
},
> +	[tegra_clk_dsialp] =3D { .dt_id =3D TEGRA210_CLK_DSIALP, .present =3D t=
rue },
> +	[tegra_clk_dsiblp] =3D { .dt_id =3D TEGRA210_CLK_DSIBLP, .present =3D t=
rue },
> +	[tegra_clk_entropy_8] =3D { .dt_id =3D TEGRA210_CLK_ENTROPY, .present =
=3D true },
> +	[tegra_clk_xusb_ss] =3D { .dt_id =3D TEGRA210_CLK_XUSB_SS, .present =3D=
 true },
> +	[tegra_clk_i2c6] =3D { .dt_id =3D TEGRA210_CLK_I2C6, .present =3D true =
},
> +	[tegra_clk_vim2_clk] =3D { .dt_id =3D TEGRA210_CLK_VIM2_CLK, .present =
=3D true },
> +	[tegra_clk_clk72Mhz_8] =3D { .dt_id =3D TEGRA210_CLK_CLK72MHZ, .present=
 =3D true },
> +	[tegra_clk_vic03_8] =3D { .dt_id =3D TEGRA210_CLK_VIC03, .present =3D t=
rue },
> +	[tegra_clk_dpaux] =3D { .dt_id =3D TEGRA210_CLK_DPAUX, .present =3D tru=
e },
> +	[tegra_clk_dpaux1] =3D { .dt_id =3D TEGRA210_CLK_DPAUX1, .present =3D t=
rue },
> +	[tegra_clk_sor0] =3D { .dt_id =3D TEGRA210_CLK_SOR0, .present =3D true =
},
> +	[tegra_clk_sor0_out] =3D { .dt_id =3D TEGRA210_CLK_SOR0_OUT, .present =
=3D true },
> +	[tegra_clk_sor1] =3D { .dt_id =3D TEGRA210_CLK_SOR1, .present =3D true =
},
> +	[tegra_clk_sor1_out] =3D { .dt_id =3D TEGRA210_CLK_SOR1_OUT, .present =
=3D true },
> +	[tegra_clk_gpu] =3D { .dt_id =3D TEGRA210_CLK_GPU, .present =3D true },
> +	[tegra_clk_pll_g_ref] =3D { .dt_id =3D TEGRA210_CLK_PLL_G_REF, .present=
 =3D true, },
> +	[tegra_clk_uartb_8] =3D { .dt_id =3D TEGRA210_CLK_UARTB, .present =3D t=
rue },
> +	[tegra_clk_spdif_in_8] =3D { .dt_id =3D TEGRA210_CLK_SPDIF_IN, .present=
 =3D true },
> +	[tegra_clk_spdif_out] =3D { .dt_id =3D TEGRA210_CLK_SPDIF_OUT, .present=
 =3D true },
> +	[tegra_clk_vi_10] =3D { .dt_id =3D TEGRA210_CLK_VI, .present =3D true }=
,
> +	[tegra_clk_vi_sensor_8] =3D { .dt_id =3D TEGRA210_CLK_VI_SENSOR, .prese=
nt =3D true },
> +	[tegra_clk_fuse] =3D { .dt_id =3D TEGRA210_CLK_FUSE, .present =3D true =
},
> +	[tegra_clk_fuse_burn] =3D { .dt_id =3D TEGRA210_CLK_FUSE_BURN, .present=
 =3D true },
> +	[tegra_clk_clk_32k] =3D { .dt_id =3D TEGRA210_CLK_CLK_32K, .present =3D=
 true },
> +	[tegra_clk_clk_m] =3D { .dt_id =3D TEGRA210_CLK_CLK_M, .present =3D tru=
e },
> +	[tegra_clk_osc] =3D { .dt_id =3D TEGRA210_CLK_OSC, .present =3D true },
> +	[tegra_clk_osc_div2] =3D { .dt_id =3D TEGRA210_CLK_OSC_DIV2, .present =
=3D true },
> +	[tegra_clk_osc_div4] =3D { .dt_id =3D TEGRA210_CLK_OSC_DIV4, .present =
=3D true },
> +	[tegra_clk_pll_ref] =3D { .dt_id =3D TEGRA210_CLK_PLL_REF, .present =3D=
 true },
> +	[tegra_clk_pll_c] =3D { .dt_id =3D TEGRA210_CLK_PLL_C, .present =3D tru=
e },
> +	[tegra_clk_pll_c_out1] =3D { .dt_id =3D TEGRA210_CLK_PLL_C_OUT1, .prese=
nt =3D true },
> +	[tegra_clk_pll_c2] =3D { .dt_id =3D TEGRA210_CLK_PLL_C2, .present =3D t=
rue },
> +	[tegra_clk_pll_c3] =3D { .dt_id =3D TEGRA210_CLK_PLL_C3, .present =3D t=
rue },
> +	[tegra_clk_pll_m] =3D { .dt_id =3D TEGRA210_CLK_PLL_M, .present =3D tru=
e },
> +	[tegra_clk_pll_p] =3D { .dt_id =3D TEGRA210_CLK_PLL_P, .present =3D tru=
e },
> +	[tegra_clk_pll_p_out1] =3D { .dt_id =3D TEGRA210_CLK_PLL_P_OUT1, .prese=
nt =3D true },
> +	[tegra_clk_pll_p_out3] =3D { .dt_id =3D TEGRA210_CLK_PLL_P_OUT3, .prese=
nt =3D true },
> +	[tegra_clk_pll_p_out4_cpu] =3D { .dt_id =3D TEGRA210_CLK_PLL_P_OUT4, .p=
resent =3D true },
> +	[tegra_clk_pll_p_out_hsio] =3D { .dt_id =3D TEGRA210_CLK_PLL_P_OUT_HSIO=
, .present =3D true },
> +	[tegra_clk_pll_p_out_xusb] =3D { .dt_id =3D TEGRA210_CLK_PLL_P_OUT_XUSB=
, .present =3D true },
> +	[tegra_clk_pll_p_out_cpu] =3D { .dt_id =3D TEGRA210_CLK_PLL_P_OUT_CPU, =
.present =3D true },
> +	[tegra_clk_pll_p_out_adsp] =3D { .dt_id =3D TEGRA210_CLK_PLL_P_OUT_ADSP=
, .present =3D true },
> +	[tegra_clk_pll_a] =3D { .dt_id =3D TEGRA210_CLK_PLL_A, .present =3D tru=
e },
> +	[tegra_clk_pll_a_out0] =3D { .dt_id =3D TEGRA210_CLK_PLL_A_OUT0, .prese=
nt =3D true },
> +	[tegra_clk_pll_d] =3D { .dt_id =3D TEGRA210_CLK_PLL_D, .present =3D tru=
e },
> +	[tegra_clk_pll_d_out0] =3D { .dt_id =3D TEGRA210_CLK_PLL_D_OUT0, .prese=
nt =3D true },
> +	[tegra_clk_pll_d2] =3D { .dt_id =3D TEGRA210_CLK_PLL_D2, .present =3D t=
rue },
> +	[tegra_clk_pll_d2_out0] =3D { .dt_id =3D TEGRA210_CLK_PLL_D2_OUT0, .pre=
sent =3D true },
> +	[tegra_clk_pll_u] =3D { .dt_id =3D TEGRA210_CLK_PLL_U, .present =3D tru=
e },
> +	[tegra_clk_pll_u_out] =3D { .dt_id =3D TEGRA210_CLK_PLL_U_OUT, .present=
 =3D true },
> +	[tegra_clk_pll_u_out1] =3D { .dt_id =3D TEGRA210_CLK_PLL_U_OUT1, .prese=
nt =3D true },
> +	[tegra_clk_pll_u_out2] =3D { .dt_id =3D TEGRA210_CLK_PLL_U_OUT2, .prese=
nt =3D true },
> +	[tegra_clk_pll_u_480m] =3D { .dt_id =3D TEGRA210_CLK_PLL_U_480M, .prese=
nt =3D true },
> +	[tegra_clk_pll_u_60m] =3D { .dt_id =3D TEGRA210_CLK_PLL_U_60M, .present=
 =3D true },
> +	[tegra_clk_pll_u_48m] =3D { .dt_id =3D TEGRA210_CLK_PLL_U_48M, .present=
 =3D true },
> +	[tegra_clk_pll_x] =3D { .dt_id =3D TEGRA210_CLK_PLL_X, .present =3D tru=
e },
> +	[tegra_clk_pll_x_out0] =3D { .dt_id =3D TEGRA210_CLK_PLL_X_OUT0, .prese=
nt =3D true },
> +	[tegra_clk_pll_re_vco] =3D { .dt_id =3D TEGRA210_CLK_PLL_RE_VCO, .prese=
nt =3D true },
> +	[tegra_clk_pll_re_out] =3D { .dt_id =3D TEGRA210_CLK_PLL_RE_OUT, .prese=
nt =3D true },
> +	[tegra_clk_spdif_in_sync] =3D { .dt_id =3D TEGRA210_CLK_SPDIF_IN_SYNC, =
.present =3D true },
> +	[tegra_clk_i2s0_sync] =3D { .dt_id =3D TEGRA210_CLK_I2S0_SYNC, .present=
 =3D true },
> +	[tegra_clk_i2s1_sync] =3D { .dt_id =3D TEGRA210_CLK_I2S1_SYNC, .present=
 =3D true },
> +	[tegra_clk_i2s2_sync] =3D { .dt_id =3D TEGRA210_CLK_I2S2_SYNC, .present=
 =3D true },
> +	[tegra_clk_i2s3_sync] =3D { .dt_id =3D TEGRA210_CLK_I2S3_SYNC, .present=
 =3D true },
> +	[tegra_clk_i2s4_sync] =3D { .dt_id =3D TEGRA210_CLK_I2S4_SYNC, .present=
 =3D true },
> +	[tegra_clk_vimclk_sync] =3D { .dt_id =3D TEGRA210_CLK_VIMCLK_SYNC, .pre=
sent =3D true },
> +	[tegra_clk_audio0] =3D { .dt_id =3D TEGRA210_CLK_AUDIO0, .present =3D t=
rue },
> +	[tegra_clk_audio1] =3D { .dt_id =3D TEGRA210_CLK_AUDIO1, .present =3D t=
rue },
> +	[tegra_clk_audio2] =3D { .dt_id =3D TEGRA210_CLK_AUDIO2, .present =3D t=
rue },
> +	[tegra_clk_audio3] =3D { .dt_id =3D TEGRA210_CLK_AUDIO3, .present =3D t=
rue },
> +	[tegra_clk_audio4] =3D { .dt_id =3D TEGRA210_CLK_AUDIO4, .present =3D t=
rue },
> +	[tegra_clk_spdif] =3D { .dt_id =3D TEGRA210_CLK_SPDIF, .present =3D tru=
e },
> +	[tegra_clk_xusb_gate] =3D { .dt_id =3D TEGRA210_CLK_XUSB_GATE, .present=
 =3D true },
> +	[tegra_clk_xusb_host_src_8] =3D { .dt_id =3D TEGRA210_CLK_XUSB_HOST_SRC=
, .present =3D true },
> +	[tegra_clk_xusb_falcon_src_8] =3D { .dt_id =3D TEGRA210_CLK_XUSB_FALCON=
_SRC, .present =3D true },
> +	[tegra_clk_xusb_fs_src] =3D { .dt_id =3D TEGRA210_CLK_XUSB_FS_SRC, .pre=
sent =3D true },
> +	[tegra_clk_xusb_ss_src_8] =3D { .dt_id =3D TEGRA210_CLK_XUSB_SS_SRC, .p=
resent =3D true },
> +	[tegra_clk_xusb_ss_div2] =3D { .dt_id =3D TEGRA210_CLK_XUSB_SS_DIV2, .p=
resent =3D true },
> +	[tegra_clk_xusb_dev_src_8] =3D { .dt_id =3D TEGRA210_CLK_XUSB_DEV_SRC, =
.present =3D true },
> +	[tegra_clk_xusb_dev] =3D { .dt_id =3D TEGRA210_CLK_XUSB_DEV, .present =
=3D true },
> +	[tegra_clk_xusb_hs_src_4] =3D { .dt_id =3D TEGRA210_CLK_XUSB_HS_SRC, .p=
resent =3D true },
> +	[tegra_clk_xusb_ssp_src] =3D { .dt_id =3D TEGRA210_CLK_XUSB_SSP_SRC, .p=
resent =3D true },
> +	[tegra_clk_usb2_hsic_trk] =3D { .dt_id =3D TEGRA210_CLK_USB2_HSIC_TRK, =
.present =3D true },
> +	[tegra_clk_hsic_trk] =3D { .dt_id =3D TEGRA210_CLK_HSIC_TRK, .present =
=3D true },
> +	[tegra_clk_usb2_trk] =3D { .dt_id =3D TEGRA210_CLK_USB2_TRK, .present =
=3D true },
> +	[tegra_clk_sclk] =3D { .dt_id =3D TEGRA210_CLK_SCLK, .present =3D true =
},
> +	[tegra_clk_sclk_mux] =3D { .dt_id =3D TEGRA210_CLK_SCLK_MUX, .present =
=3D true },
> +	[tegra_clk_hclk] =3D { .dt_id =3D TEGRA210_CLK_HCLK, .present =3D true =
},
> +	[tegra_clk_pclk] =3D { .dt_id =3D TEGRA210_CLK_PCLK, .present =3D true =
},
> +	[tegra_clk_cclk_g] =3D { .dt_id =3D TEGRA210_CLK_CCLK_G, .present =3D t=
rue },
> +	[tegra_clk_cclk_lp] =3D { .dt_id =3D TEGRA210_CLK_CCLK_LP, .present =3D=
 true },
> +	[tegra_clk_dfll_ref] =3D { .dt_id =3D TEGRA210_CLK_DFLL_REF, .present =
=3D true },
> +	[tegra_clk_dfll_soc] =3D { .dt_id =3D TEGRA210_CLK_DFLL_SOC, .present =
=3D true },
> +	[tegra_clk_vi_sensor2_8] =3D { .dt_id =3D TEGRA210_CLK_VI_SENSOR2, .pre=
sent =3D true },
> +	[tegra_clk_pll_p_out5] =3D { .dt_id =3D TEGRA210_CLK_PLL_P_OUT5, .prese=
nt =3D true },
> +	[tegra_clk_pll_c4] =3D { .dt_id =3D TEGRA210_CLK_PLL_C4, .present =3D t=
rue },
> +	[tegra_clk_pll_dp] =3D { .dt_id =3D TEGRA210_CLK_PLL_DP, .present =3D t=
rue },
> +	[tegra_clk_audio0_mux] =3D { .dt_id =3D TEGRA210_CLK_AUDIO0_MUX, .prese=
nt =3D true },
> +	[tegra_clk_audio1_mux] =3D { .dt_id =3D TEGRA210_CLK_AUDIO1_MUX, .prese=
nt =3D true },
> +	[tegra_clk_audio2_mux] =3D { .dt_id =3D TEGRA210_CLK_AUDIO2_MUX, .prese=
nt =3D true },
> +	[tegra_clk_audio3_mux] =3D { .dt_id =3D TEGRA210_CLK_AUDIO3_MUX, .prese=
nt =3D true },
> +	[tegra_clk_audio4_mux] =3D { .dt_id =3D TEGRA210_CLK_AUDIO4_MUX, .prese=
nt =3D true },
> +	[tegra_clk_spdif_mux] =3D { .dt_id =3D TEGRA210_CLK_SPDIF_MUX, .present=
 =3D true },
> +	[tegra_clk_maud] =3D { .dt_id =3D TEGRA210_CLK_MAUD, .present =3D true =
},
> +	[tegra_clk_mipibif] =3D { .dt_id =3D TEGRA210_CLK_MIPIBIF, .present =3D=
 true },
> +	[tegra_clk_qspi] =3D { .dt_id =3D TEGRA210_CLK_QSPI, .present =3D true =
},
> +	[tegra_clk_sdmmc_legacy] =3D { .dt_id =3D TEGRA210_CLK_SDMMC_LEGACY, .p=
resent =3D true },
> +	[tegra_clk_tsecb] =3D { .dt_id =3D TEGRA210_CLK_TSECB, .present =3D tru=
e },
> +	[tegra_clk_uartape] =3D { .dt_id =3D TEGRA210_CLK_UARTAPE, .present =3D=
 true },
> +	[tegra_clk_vi_i2c] =3D { .dt_id =3D TEGRA210_CLK_VI_I2C, .present =3D t=
rue },
> +	[tegra_clk_ape] =3D { .dt_id =3D TEGRA210_CLK_APE, .present =3D true },
> +	[tegra_clk_dbgapb] =3D { .dt_id =3D TEGRA210_CLK_DBGAPB, .present =3D t=
rue },
> +	[tegra_clk_nvdec] =3D { .dt_id =3D TEGRA210_CLK_NVDEC, .present =3D tru=
e },
> +	[tegra_clk_nvenc] =3D { .dt_id =3D TEGRA210_CLK_NVENC, .present =3D tru=
e },
> +	[tegra_clk_nvjpg] =3D { .dt_id =3D TEGRA210_CLK_NVJPG, .present =3D tru=
e },
> +	[tegra_clk_pll_c4_out0] =3D { .dt_id =3D TEGRA210_CLK_PLL_C4_OUT0, .pre=
sent =3D true },
> +	[tegra_clk_pll_c4_out1] =3D { .dt_id =3D TEGRA210_CLK_PLL_C4_OUT1, .pre=
sent =3D true },
> +	[tegra_clk_pll_c4_out2] =3D { .dt_id =3D TEGRA210_CLK_PLL_C4_OUT2, .pre=
sent =3D true },
> +	[tegra_clk_pll_c4_out3] =3D { .dt_id =3D TEGRA210_CLK_PLL_C4_OUT3, .pre=
sent =3D true },
> +	[tegra_clk_apb2ape] =3D { .dt_id =3D TEGRA210_CLK_APB2APE, .present =3D=
 true },
> +	[tegra_clk_pll_a1] =3D { .dt_id =3D TEGRA210_CLK_PLL_A1, .present =3D t=
rue },
> +	[tegra_clk_ispa] =3D { .dt_id =3D TEGRA210_CLK_ISPA, .present =3D true =
},
> +	[tegra_clk_cec] =3D { .dt_id =3D TEGRA210_CLK_CEC, .present =3D true },
> +	[tegra_clk_dmic1] =3D { .dt_id =3D TEGRA210_CLK_DMIC1, .present =3D tru=
e },
> +	[tegra_clk_dmic2] =3D { .dt_id =3D TEGRA210_CLK_DMIC2, .present =3D tru=
e },
> +	[tegra_clk_dmic3] =3D { .dt_id =3D TEGRA210_CLK_DMIC3, .present =3D tru=
e },
> +	[tegra_clk_dmic1_sync_clk] =3D { .dt_id =3D TEGRA210_CLK_DMIC1_SYNC_CLK=
, .present =3D true },
> +	[tegra_clk_dmic2_sync_clk] =3D { .dt_id =3D TEGRA210_CLK_DMIC2_SYNC_CLK=
, .present =3D true },
> +	[tegra_clk_dmic3_sync_clk] =3D { .dt_id =3D TEGRA210_CLK_DMIC3_SYNC_CLK=
, .present =3D true },
> +	[tegra_clk_dmic1_sync_clk_mux] =3D { .dt_id =3D TEGRA210_CLK_DMIC1_SYNC=
_CLK_MUX, .present =3D true },
> +	[tegra_clk_dmic2_sync_clk_mux] =3D { .dt_id =3D TEGRA210_CLK_DMIC2_SYNC=
_CLK_MUX, .present =3D true },
> +	[tegra_clk_dmic3_sync_clk_mux] =3D { .dt_id =3D TEGRA210_CLK_DMIC3_SYNC=
_CLK_MUX, .present =3D true },
> +	[tegra_clk_dp2] =3D { .dt_id =3D TEGRA210_CLK_DP2, .present =3D true },
> +	[tegra_clk_iqc1] =3D { .dt_id =3D TEGRA210_CLK_IQC1, .present =3D true =
},
> +	[tegra_clk_iqc2] =3D { .dt_id =3D TEGRA210_CLK_IQC2, .present =3D true =
},
> +	[tegra_clk_pll_a_out_adsp] =3D { .dt_id =3D TEGRA210_CLK_PLL_A_OUT_ADSP=
, .present =3D true },
> +	[tegra_clk_pll_a_out0_out_adsp] =3D { .dt_id =3D TEGRA210_CLK_PLL_A_OUT=
0_OUT_ADSP, .present =3D true },
> +	[tegra_clk_adsp] =3D { .dt_id =3D TEGRA210_CLK_ADSP, .present =3D true =
},
> +	[tegra_clk_adsp_neon] =3D { .dt_id =3D TEGRA210_CLK_ADSP_NEON, .present=
 =3D true },
> +};
> +
> +static struct tegra_devclk devclks[] __initdata =3D {
> +	{ .con_id =3D "clk_m", .dt_id =3D TEGRA210_CLK_CLK_M },
> +	{ .con_id =3D "pll_ref", .dt_id =3D TEGRA210_CLK_PLL_REF },
> +	{ .con_id =3D "clk_32k", .dt_id =3D TEGRA210_CLK_CLK_32K },
> +	{ .con_id =3D "osc", .dt_id =3D TEGRA210_CLK_OSC },
> +	{ .con_id =3D "osc_div2", .dt_id =3D TEGRA210_CLK_OSC_DIV2 },
> +	{ .con_id =3D "osc_div4", .dt_id =3D TEGRA210_CLK_OSC_DIV4 },
> +	{ .con_id =3D "pll_c", .dt_id =3D TEGRA210_CLK_PLL_C },
> +	{ .con_id =3D "pll_c_out1", .dt_id =3D TEGRA210_CLK_PLL_C_OUT1 },
> +	{ .con_id =3D "pll_c2", .dt_id =3D TEGRA210_CLK_PLL_C2 },
> +	{ .con_id =3D "pll_c3", .dt_id =3D TEGRA210_CLK_PLL_C3 },
> +	{ .con_id =3D "pll_p", .dt_id =3D TEGRA210_CLK_PLL_P },
> +	{ .con_id =3D "pll_p_out1", .dt_id =3D TEGRA210_CLK_PLL_P_OUT1 },
> +	{ .con_id =3D "pll_p_out2", .dt_id =3D TEGRA210_CLK_PLL_P_OUT2 },
> +	{ .con_id =3D "pll_p_out3", .dt_id =3D TEGRA210_CLK_PLL_P_OUT3 },
> +	{ .con_id =3D "pll_p_out4", .dt_id =3D TEGRA210_CLK_PLL_P_OUT4 },
> +	{ .con_id =3D "pll_m", .dt_id =3D TEGRA210_CLK_PLL_M },
> +	{ .con_id =3D "pll_x", .dt_id =3D TEGRA210_CLK_PLL_X },
> +	{ .con_id =3D "pll_x_out0", .dt_id =3D TEGRA210_CLK_PLL_X_OUT0 },
> +	{ .con_id =3D "pll_u", .dt_id =3D TEGRA210_CLK_PLL_U },
> +	{ .con_id =3D "pll_u_out", .dt_id =3D TEGRA210_CLK_PLL_U_OUT },
> +	{ .con_id =3D "pll_u_out1", .dt_id =3D TEGRA210_CLK_PLL_U_OUT1 },
> +	{ .con_id =3D "pll_u_out2", .dt_id =3D TEGRA210_CLK_PLL_U_OUT2 },
> +	{ .con_id =3D "pll_u_480M", .dt_id =3D TEGRA210_CLK_PLL_U_480M },
> +	{ .con_id =3D "pll_u_60M", .dt_id =3D TEGRA210_CLK_PLL_U_60M },
> +	{ .con_id =3D "pll_u_48M", .dt_id =3D TEGRA210_CLK_PLL_U_48M },
> +	{ .con_id =3D "pll_d", .dt_id =3D TEGRA210_CLK_PLL_D },
> +	{ .con_id =3D "pll_d_out0", .dt_id =3D TEGRA210_CLK_PLL_D_OUT0 },
> +	{ .con_id =3D "pll_d2", .dt_id =3D TEGRA210_CLK_PLL_D2 },
> +	{ .con_id =3D "pll_d2_out0", .dt_id =3D TEGRA210_CLK_PLL_D2_OUT0 },
> +	{ .con_id =3D "pll_a", .dt_id =3D TEGRA210_CLK_PLL_A },
> +	{ .con_id =3D "pll_a_out0", .dt_id =3D TEGRA210_CLK_PLL_A_OUT0 },
> +	{ .con_id =3D "pll_re_vco", .dt_id =3D TEGRA210_CLK_PLL_RE_VCO },
> +	{ .con_id =3D "pll_re_out", .dt_id =3D TEGRA210_CLK_PLL_RE_OUT },
> +	{ .con_id =3D "spdif_in_sync", .dt_id =3D TEGRA210_CLK_SPDIF_IN_SYNC },
> +	{ .con_id =3D "i2s0_sync", .dt_id =3D TEGRA210_CLK_I2S0_SYNC },
> +	{ .con_id =3D "i2s1_sync", .dt_id =3D TEGRA210_CLK_I2S1_SYNC },
> +	{ .con_id =3D "i2s2_sync", .dt_id =3D TEGRA210_CLK_I2S2_SYNC },
> +	{ .con_id =3D "i2s3_sync", .dt_id =3D TEGRA210_CLK_I2S3_SYNC },
> +	{ .con_id =3D "i2s4_sync", .dt_id =3D TEGRA210_CLK_I2S4_SYNC },
> +	{ .con_id =3D "vimclk_sync", .dt_id =3D TEGRA210_CLK_VIMCLK_SYNC },
> +	{ .con_id =3D "audio0", .dt_id =3D TEGRA210_CLK_AUDIO0 },
> +	{ .con_id =3D "audio1", .dt_id =3D TEGRA210_CLK_AUDIO1 },
> +	{ .con_id =3D "audio2", .dt_id =3D TEGRA210_CLK_AUDIO2 },
> +	{ .con_id =3D "audio3", .dt_id =3D TEGRA210_CLK_AUDIO3 },
> +	{ .con_id =3D "audio4", .dt_id =3D TEGRA210_CLK_AUDIO4 },
> +	{ .con_id =3D "spdif", .dt_id =3D TEGRA210_CLK_SPDIF },
> +	{ .con_id =3D "spdif_2x", .dt_id =3D TEGRA210_CLK_SPDIF_2X },
> +	{ .con_id =3D "extern1", .dt_id =3D TEGRA210_CLK_EXTERN1 },
> +	{ .con_id =3D "extern2", .dt_id =3D TEGRA210_CLK_EXTERN2 },
> +	{ .con_id =3D "extern3", .dt_id =3D TEGRA210_CLK_EXTERN3 },
> +	{ .con_id =3D "cclk_g", .dt_id =3D TEGRA210_CLK_CCLK_G },
> +	{ .con_id =3D "cclk_lp", .dt_id =3D TEGRA210_CLK_CCLK_LP },
> +	{ .con_id =3D "sclk", .dt_id =3D TEGRA210_CLK_SCLK },
> +	{ .con_id =3D "hclk", .dt_id =3D TEGRA210_CLK_HCLK },
> +	{ .con_id =3D "pclk", .dt_id =3D TEGRA210_CLK_PCLK },
> +	{ .con_id =3D "fuse", .dt_id =3D TEGRA210_CLK_FUSE },
> +	{ .dev_id =3D "rtc-tegra", .dt_id =3D TEGRA210_CLK_RTC },
> +	{ .dev_id =3D "timer", .dt_id =3D TEGRA210_CLK_TIMER },
> +	{ .con_id =3D "pll_c4_out0", .dt_id =3D TEGRA210_CLK_PLL_C4_OUT0 },
> +	{ .con_id =3D "pll_c4_out1", .dt_id =3D TEGRA210_CLK_PLL_C4_OUT1 },
> +	{ .con_id =3D "pll_c4_out2", .dt_id =3D TEGRA210_CLK_PLL_C4_OUT2 },
> +	{ .con_id =3D "pll_c4_out3", .dt_id =3D TEGRA210_CLK_PLL_C4_OUT3 },
> +	{ .con_id =3D "dpaux", .dt_id =3D TEGRA210_CLK_DPAUX },
> +};
> +
> +static struct tegra_audio_clk_info tegra210_audio_plls[] =3D {
> +	{ "pll_a", &pll_a_params, tegra_clk_pll_a, "pll_ref" },
> +	{ "pll_a1", &pll_a1_params, tegra_clk_pll_a1, "pll_ref" },
> +};
> +
> +static const char * const aclk_parents[] =3D {
> +	"pll_a1", "pll_c", "pll_p", "pll_a_out0", "pll_c2", "pll_c3",
> +	"clk_m"
> +};
> +
> +static void tegra210_utmi_param_configure(void)
> +{
> +	u32 reg;
> +	int i;
> +
> +	for (i =3D 0; i < ARRAY_SIZE(utmi_parameters); i++) {
> +		if (osc_freq =3D=3D utmi_parameters[i].osc_frequency)
> +			break;
> +	}
> +
> +	if (i >=3D ARRAY_SIZE(utmi_parameters)) {
> +		pr_err("%s: Unexpected oscillator freq %lu\n", __func__,
> +			osc_freq);
> +		return;
> +	}
> +
> +	reg =3D readl_relaxed(clk_base + UTMIPLL_HW_PWRDN_CFG0);
> +	reg &=3D ~UTMIPLL_HW_PWRDN_CFG0_IDDQ_OVERRIDE;
> +	writel_relaxed(reg, clk_base + UTMIPLL_HW_PWRDN_CFG0);
> +
> +	udelay(10);
> +
> +	reg =3D readl_relaxed(clk_base + UTMIP_PLL_CFG2);
> +
> +	/* Program UTMIP PLL stable and active counts */
> +	/* [FIXME] arclk_rst.h says WRONG! This should be 1ms -> 0x50 Check! */
> +	reg &=3D ~UTMIP_PLL_CFG2_STABLE_COUNT(~0);
> +	reg |=3D UTMIP_PLL_CFG2_STABLE_COUNT(utmi_parameters[i].stable_count);
> +
> +	reg &=3D ~UTMIP_PLL_CFG2_ACTIVE_DLY_COUNT(~0);
> +	reg |=3D
> +	UTMIP_PLL_CFG2_ACTIVE_DLY_COUNT(utmi_parameters[i].active_delay_count);
> +	writel_relaxed(reg, clk_base + UTMIP_PLL_CFG2);
> +
> +	/* Program UTMIP PLL delay and oscillator frequency counts */
> +	reg =3D readl_relaxed(clk_base + UTMIP_PLL_CFG1);
> +
> +	reg &=3D ~UTMIP_PLL_CFG1_ENABLE_DLY_COUNT(~0);
> +	reg |=3D
> +	UTMIP_PLL_CFG1_ENABLE_DLY_COUNT(utmi_parameters[i].enable_delay_count);
> +
> +	reg &=3D ~UTMIP_PLL_CFG1_XTAL_FREQ_COUNT(~0);
> +	reg |=3D
> +	UTMIP_PLL_CFG1_XTAL_FREQ_COUNT(utmi_parameters[i].xtal_freq_count);
> +
> +	reg |=3D UTMIP_PLL_CFG1_FORCE_PLLU_POWERDOWN;
> +	writel_relaxed(reg, clk_base + UTMIP_PLL_CFG1);
> +
> +	/* Remove power downs from UTMIP PLL control bits */
> +	reg =3D readl_relaxed(clk_base + UTMIP_PLL_CFG1);
> +	reg &=3D ~UTMIP_PLL_CFG1_FORCE_PLL_ENABLE_POWERDOWN;
> +	reg |=3D UTMIP_PLL_CFG1_FORCE_PLL_ENABLE_POWERUP;
> +	writel_relaxed(reg, clk_base + UTMIP_PLL_CFG1);
> +
> +	udelay(20);
> +
> +	/* Enable samplers for SNPS, XUSB_HOST, XUSB_DEV */
> +	reg =3D readl_relaxed(clk_base + UTMIP_PLL_CFG2);
> +	reg |=3D UTMIP_PLL_CFG2_FORCE_PD_SAMP_A_POWERUP;
> +	reg |=3D UTMIP_PLL_CFG2_FORCE_PD_SAMP_B_POWERUP;
> +	reg |=3D UTMIP_PLL_CFG2_FORCE_PD_SAMP_D_POWERUP;
> +	reg &=3D ~UTMIP_PLL_CFG2_FORCE_PD_SAMP_A_POWERDOWN;
> +	reg &=3D ~UTMIP_PLL_CFG2_FORCE_PD_SAMP_B_POWERDOWN;
> +	reg &=3D ~UTMIP_PLL_CFG2_FORCE_PD_SAMP_D_POWERDOWN;
> +	writel_relaxed(reg, clk_base + UTMIP_PLL_CFG2);
> +}
> +
> +static void tegra210_utmi_hw_sequencer_enable(void)
> +{
> +	u32 reg;
> +
> +	/* Setup HW control of UTMIPLL */
> +	reg =3D readl_relaxed(clk_base + UTMIP_PLL_CFG1);
> +	reg &=3D ~UTMIP_PLL_CFG1_FORCE_PLL_ENABLE_POWERDOWN;
> +	reg &=3D ~UTMIP_PLL_CFG1_FORCE_PLL_ENABLE_POWERUP;
> +	writel_relaxed(reg, clk_base + UTMIP_PLL_CFG1);
> +
> +	reg =3D readl_relaxed(clk_base + UTMIPLL_HW_PWRDN_CFG0);
> +	reg |=3D UTMIPLL_HW_PWRDN_CFG0_USE_LOCKDET;
> +	reg &=3D ~UTMIPLL_HW_PWRDN_CFG0_CLK_ENABLE_SWCTL;
> +	writel_relaxed(reg, clk_base + UTMIPLL_HW_PWRDN_CFG0);
> +
> +	udelay(1);
> +
> +	reg =3D readl_relaxed(clk_base + XUSB_PLL_CFG0);
> +	reg &=3D ~XUSB_PLL_CFG0_UTMIPLL_LOCK_DLY;
> +	writel_relaxed(reg, clk_base + XUSB_PLL_CFG0);
> +
> +	udelay(1);
> +
> +	/* Enable HW control UTMIPLL */
> +	reg =3D readl_relaxed(clk_base + UTMIPLL_HW_PWRDN_CFG0);
> +	reg |=3D UTMIPLL_HW_PWRDN_CFG0_SEQ_ENABLE;
> +	writel_relaxed(reg, clk_base + UTMIPLL_HW_PWRDN_CFG0);
> +
> +	udelay(1);
> +}
> +
> +static int tegra210_enable_utmipll(void)
> +{
> +	u32 reg =3D readl_relaxed(clk_base + UTMIPLL_HW_PWRDN_CFG0);
> +	bool hw_on =3D reg & UTMIPLL_HW_PWRDN_CFG0_SEQ_ENABLE;
> +	bool locked =3D reg & UTMIPLL_HW_PWRDN_CFG0_UTMIPLL_LOCK;
> +
> +	pr_info_once("%s: hw %s, lock %s, use_pllre %s\n", __func__,
> +		     hw_on ? "ON" : "OFF", locked ? "1" : "0",
> +		     pll_re_use_utmipll ? "YES" : "NO");
> +
> +	if (hw_on) {
> +		if (pll_re_use_utmipll || utmipll_set_defaults(true)) {
> +			WARN(1, "UTMIP PLL: hw is ON with invalid %s\n",
> +			     pll_re_use_utmipll ? "PLLRE usage" : "M/N values");
> +			return -EINVAL;
> +		}
> +		return 0;
> +	}
> +
> +	if (utmipll_set_defaults(locked)) {
> +		WARN_ON(1);
> +		return -EINVAL;
> +	}
> +
> +	if (!locked)
> +		tegra210_utmi_param_configure();
> +
> +	if (!pll_re_use_utmipll)
> +		tegra210_utmi_hw_sequencer_enable();
> +
> +	return 0;
> +}
> +
> +static int tegra210_enable_pllu(void)
> +{
> +	struct tegra_clk_pll_freq_table *fentry;
> +	struct tegra_clk_pll pllu;
> +	u32 reg;
> +	int ret;
> +
> +	for (fentry =3D pll_u_freq_table; fentry->input_rate; fentry++) {
> +		if (fentry->input_rate =3D=3D pll_ref_freq)
> +			break;
> +	}
> +
> +	if (!fentry->input_rate) {
> +		pr_err("Unknown PLL_U reference frequency %lu\n", pll_ref_freq);
> +		return -EINVAL;
> +	}
> +
> +	/* clear IDDQ bit */
> +	pllu.params =3D &pll_u_vco_params;
> +	reg =3D readl_relaxed(clk_base + pllu.params->ext_misc_reg[0]);
> +	reg &=3D ~BIT(pllu.params->iddq_bit_idx);
> +	writel_relaxed(reg, clk_base + pllu.params->ext_misc_reg[0]);
> +	fence_udelay(5, clk_base);
> +
> +	reg =3D readl_relaxed(clk_base + PLLU_BASE);
> +	reg &=3D ~GENMASK(20, 0);
> +	reg |=3D fentry->m;
> +	reg |=3D fentry->n << 8;
> +	reg |=3D fentry->p << 16;
> +	writel(reg, clk_base + PLLU_BASE);
> +	fence_udelay(1, clk_base);
> +	reg |=3D PLL_ENABLE;
> +	writel(reg, clk_base + PLLU_BASE);
> +	fence_udelay(1, clk_base);
> +
> +	/*
> +	 * During clocks resume, same PLLU init and enable sequence get
> +	 * executed. So, readx_poll_timeout_atomic can't be used here as it
> +	 * uses ktime_get() and timekeeping resume doesn't happen by that
> +	 * time. So, using tegra210_wait_for_mask for PLL LOCK.
> +	 */
> +	ret =3D tegra210_wait_for_mask(&pllu, PLLU_BASE, PLL_BASE_LOCK);
> +	if (ret) {
> +		pr_err("Timed out waiting for PLL_U to lock\n");
> +		return -ETIMEDOUT;
> +	}
> +
> +	return 0;
> +}
> +
> +static int tegra210_init_pllu(void)
> +{
> +	u32 reg;
> +	int err;
> +	struct tegra_clk_pll pllu;
> +	struct tegra_clk_pll *p =3D &pllu;
> +
> +	tegra210_pllu_set_defaults(&pll_u_vco_params);
> +	reg =3D readl_relaxed(clk_base + PLLU_BASE);
> +
> +	/* PLLU is modeled as fixed clock source - must have default MNP */
> +	pllu.params =3D &pll_u_vco_params;
> +	if ((reg & (divm_mask_shifted(p) | divn_mask_shifted(p) |
> +		   divp_mask_shifted(p))) !=3D PLLU_BASE_MNP_DEFAULT_VALUE) {
> +		WARN_ON(1);
> +		return -EINVAL;
> +	}
> +
> +	/* skip initialization when pllu is in hw controlled mode */
> +	if (reg & PLLU_BASE_OVERRIDE) {
> +		if (!(reg & PLL_ENABLE)) {
> +			err =3D tegra210_enable_pllu();
> +			if (err < 0) {
> +				WARN_ON(1);
> +				return err;
> +			}
> +		}
> +		/* enable hw controlled mode */
> +		reg =3D readl_relaxed(clk_base + PLLU_BASE);
> +		reg &=3D ~PLLU_BASE_OVERRIDE;
> +		writel(reg, clk_base + PLLU_BASE);
> +
> +		reg =3D readl_relaxed(clk_base + PLLU_HW_PWRDN_CFG0);
> +		reg |=3D PLLU_HW_PWRDN_CFG0_USE_SWITCH_DETECT |
> +		       PLLU_HW_PWRDN_CFG0_USE_LOCKDET;
> +		reg &=3D ~(PLLU_HW_PWRDN_CFG0_CLK_ENABLE_SWCTL |
> +			PLLU_HW_PWRDN_CFG0_IDDQ_PD_INCLUDE |
> +			PLLU_HW_PWRDN_CFG0_CLK_SWITCH_SWCTL);
> +		writel_relaxed(reg, clk_base + PLLU_HW_PWRDN_CFG0);
> +
> +		reg =3D readl_relaxed(clk_base + XUSB_PLL_CFG0);
> +		reg &=3D ~XUSB_PLL_CFG0_PLLU_LOCK_DLY_MASK;
> +		writel_relaxed(reg, clk_base + XUSB_PLL_CFG0);
> +		fence_udelay(1, clk_base);
> +
> +		reg =3D readl_relaxed(clk_base + PLLU_HW_PWRDN_CFG0);
> +		reg |=3D PLLU_HW_PWRDN_CFG0_SEQ_ENABLE;
> +		writel_relaxed(reg, clk_base + PLLU_HW_PWRDN_CFG0);
> +		fence_udelay(1, clk_base);
> +
> +		reg =3D readl_relaxed(clk_base + PLLU_BASE);
> +		reg &=3D ~PLLU_BASE_CLKENABLE_USB;
> +		writel_relaxed(reg, clk_base + PLLU_BASE);
> +	} else if (!(reg & PLL_ENABLE)) {
> +		WARN(1, "Disabled PLLU was put under h/w control\n");
> +	}
> +
> +	/* enable UTMIPLL hw control if not yet done by the bootloader */
> +	return tegra210_enable_utmipll();
> +}
> +
> +/*
> + * The SOR hardware blocks are driven by two clocks: a module clock that=
 is
> + * used to access registers and a pixel clock that is sourced from the s=
ame
> + * pixel clock that also drives the head attached to the SOR. The module
> + * clock is typically called sorX (with X being the SOR instance) and th=
e
> + * pixel clock is called sorX_out. The source for the SOR pixel clock is
> + * referred to as the "parent" clock.
> + *
> + * On Tegra186 and newer, clocks are provided by the BPMP. Unfortunately=
 the
> + * BPMP implementation for the SOR clocks doesn't exactly match the abov=
e in
> + * some aspects. For example, the SOR module is really clocked by the pa=
d or
> + * sor_safe clocks, but BPMP models the sorX clock as being sourced by t=
he
> + * pixel clocks. Conversely the sorX_out clock is sourced by the sor_saf=
e or
> + * pad clocks on BPMP.
> + *
> + * In order to allow the display driver to deal with all SoC generations=
 in
> + * a unified way, implement the BPMP semantics in this driver.
> + */
> +
> +static const char * const sor0_parents[] =3D {
> +	"pll_d_out0",
> +};
> +
> +static const char * const sor0_out_parents[] =3D {
> +	"sor_safe", "sor0_pad_clkout",
> +};
> +
> +static const char * const sor1_parents[] =3D {
> +	"pll_p", "pll_d_out0", "pll_d2_out0", "clk_m",
> +};
> +
> +static u32 sor1_parents_idx[] =3D { 0, 2, 5, 6 };
> +
> +static const struct clk_div_table mc_div_table_tegra210[] =3D {
> +	{ .val =3D 0, .div =3D 2 },
> +	{ .val =3D 1, .div =3D 4 },
> +	{ .val =3D 2, .div =3D 1 },
> +	{ .val =3D 3, .div =3D 2 },
> +	{ .val =3D 0, .div =3D 0 },
> +};
> +
> +static void tegra210_clk_register_mc(const char *name,
> +				     const char *parent_name)
> +{
> +	struct clk *clk;
> +
> +	clk =3D clk_register_divider_table(NULL, name, parent_name,
> +					 CLK_IS_CRITICAL,
> +					 clk_base + CLK_SOURCE_EMC,
> +					 15, 2, CLK_DIVIDER_READ_ONLY,
> +					 mc_div_table_tegra210, &emc_lock);
> +	clks[TEGRA210_CLK_MC] =3D clk;
> +}
> +
> +static const char * const sor1_out_parents[] =3D {
> +	/*
> +	 * Bit 0 of the mux selects sor1_pad_clkout, irrespective of bit 1, so
> +	 * the sor1_pad_clkout parent appears twice in the list below. This is
> +	 * merely to support clk_get_parent() if firmware happened to set
> +	 * these bits to 0b11. While not an invalid setting, code should
> +	 * always set the bits to 0b01 to select sor1_pad_clkout.
> +	 */
> +	"sor_safe", "sor1_pad_clkout", "sor1_out", "sor1_pad_clkout",
> +};
> +
> +static struct tegra_periph_init_data tegra210_periph[] =3D {
> +	/*
> +	 * On Tegra210, the sor0 clock doesn't have a mux it bitfield 31:29,
> +	 * but it is hardwired to the pll_d_out0 clock.
> +	 */
> +	TEGRA_INIT_DATA_TABLE("sor0", NULL, NULL, sor0_parents,
> +			      CLK_SOURCE_SOR0, 29, 0x0, 0, 0, 0, 0,
> +			      0, 182, 0, tegra_clk_sor0, NULL, 0,
> +			      &sor0_lock),
> +	TEGRA_INIT_DATA_TABLE("sor0_out", NULL, NULL, sor0_out_parents,
> +			      CLK_SOURCE_SOR0, 14, 0x1, 0, 0, 0, 0,
> +			      0, 0, TEGRA_PERIPH_NO_GATE, tegra_clk_sor0_out,
> +			      NULL, 0, &sor0_lock),
> +	TEGRA_INIT_DATA_TABLE("sor1", NULL, NULL, sor1_parents,
> +			      CLK_SOURCE_SOR1, 29, 0x7, 0, 0, 8, 1,
> +			      TEGRA_DIVIDER_ROUND_UP, 183, 0,
> +			      tegra_clk_sor1, sor1_parents_idx, 0,
> +			      &sor1_lock),
> +	TEGRA_INIT_DATA_TABLE("sor1_out", NULL, NULL, sor1_out_parents,
> +			      CLK_SOURCE_SOR1, 14, 0x3, 0, 0, 0, 0,
> +			      0, 0, TEGRA_PERIPH_NO_GATE,
> +			      tegra_clk_sor1_out, NULL, 0, &sor1_lock),
> +};
> +
> +static const char * const la_parents[] =3D {
> +	"pll_p", "pll_c2", "pll_c", "pll_c3", "pll_re_out1", "pll_a1", "clk_m",=
 "pll_c4_out0"
> +};
> +
> +static struct tegra_clk_periph tegra210_la =3D
> +	TEGRA_CLK_PERIPH(29, 7, 9, 0, 8, 1, TEGRA_DIVIDER_ROUND_UP, 76, 0, NULL=
, NULL);
> +
> +static __init void tegra210_periph_clk_init(struct device_node *np,
> +					    void __iomem *clk_base,
> +					    void __iomem *pmc_base)
> +{
> +	struct clk *clk;
> +	unsigned int i;
> +
> +	/* xusb_ss_div2 */
> +	clk =3D clk_register_fixed_factor(NULL, "xusb_ss_div2", "xusb_ss_src", =
0,
> +					1, 2);
> +	clks[TEGRA210_CLK_XUSB_SS_DIV2] =3D clk;
> +
> +	clk =3D tegra_clk_register_periph_fixed("sor_safe", "pll_p", 0, clk_bas=
e,
> +					      1, 17, 222);
> +	clks[TEGRA210_CLK_SOR_SAFE] =3D clk;
> +
> +	clk =3D tegra_clk_register_periph_fixed("dpaux", "sor_safe", 0, clk_bas=
e,
> +					      1, 17, 181);
> +	clks[TEGRA210_CLK_DPAUX] =3D clk;
> +
> +	clk =3D tegra_clk_register_periph_fixed("dpaux1", "sor_safe", 0, clk_ba=
se,
> +					      1, 17, 207);
> +	clks[TEGRA210_CLK_DPAUX1] =3D clk;
> +
> +	/* pll_d_dsi_out */
> +	clk =3D clk_register_gate(NULL, "pll_d_dsi_out", "pll_d_out0", 0,
> +				clk_base + PLLD_MISC0, 21, 0, &pll_d_lock);
> +	clks[TEGRA210_CLK_PLL_D_DSI_OUT] =3D clk;
> +
> +	/* dsia */
> +	clk =3D tegra_clk_register_periph_gate("dsia", "pll_d_dsi_out", 0,
> +					     clk_base, 0, 48,
> +					     periph_clk_enb_refcnt);
> +	clks[TEGRA210_CLK_DSIA] =3D clk;
> +
> +	/* dsib */
> +	clk =3D tegra_clk_register_periph_gate("dsib", "pll_d_dsi_out", 0,
> +					     clk_base, 0, 82,
> +					     periph_clk_enb_refcnt);
> +	clks[TEGRA210_CLK_DSIB] =3D clk;
> +
> +	/* csi_tpg */
> +	clk =3D clk_register_gate(NULL, "csi_tpg", "pll_d",
> +				CLK_SET_RATE_PARENT, clk_base + PLLD_BASE,
> +				23, 0, &pll_d_lock);
> +	clk_register_clkdev(clk, "csi_tpg", NULL);
> +	clks[TEGRA210_CLK_CSI_TPG] =3D clk;
> +
> +	/* la */
> +	clk =3D tegra_clk_register_periph("la", la_parents,
> +			ARRAY_SIZE(la_parents), &tegra210_la, clk_base,
> +			CLK_SOURCE_LA, 0);
> +	clks[TEGRA210_CLK_LA] =3D clk;
> +
> +	/* cml0 */
> +	clk =3D clk_register_gate(NULL, "cml0", "pll_e", 0, clk_base + PLLE_AUX=
,
> +				0, 0, &pll_e_lock);
> +	clk_register_clkdev(clk, "cml0", NULL);
> +	clks[TEGRA210_CLK_CML0] =3D clk;
> +
> +	/* cml1 */
> +	clk =3D clk_register_gate(NULL, "cml1", "pll_e", 0, clk_base + PLLE_AUX=
,
> +				1, 0, &pll_e_lock);
> +	clk_register_clkdev(clk, "cml1", NULL);
> +	clks[TEGRA210_CLK_CML1] =3D clk;
> +
> +	clk =3D tegra_clk_register_super_clk("aclk", aclk_parents,
> +				ARRAY_SIZE(aclk_parents), 0, clk_base + 0x6e0,
> +				0, NULL);
> +	clks[TEGRA210_CLK_ACLK] =3D clk;
> +
> +	clk =3D tegra_clk_register_sdmmc_mux_div("sdmmc2", clk_base,
> +					    CLK_SOURCE_SDMMC2, 9,
> +					    TEGRA_DIVIDER_ROUND_UP, 0, NULL);
> +	clks[TEGRA210_CLK_SDMMC2] =3D clk;
> +
> +	clk =3D tegra_clk_register_sdmmc_mux_div("sdmmc4", clk_base,
> +					    CLK_SOURCE_SDMMC4, 15,
> +					    TEGRA_DIVIDER_ROUND_UP, 0, NULL);
> +	clks[TEGRA210_CLK_SDMMC4] =3D clk;
> +
> +	for (i =3D 0; i < ARRAY_SIZE(tegra210_periph); i++) {
> +		struct tegra_periph_init_data *init =3D &tegra210_periph[i];
> +		struct clk **clkp;
> +
> +		clkp =3D tegra_lookup_dt_id(init->clk_id, tegra210_clks);
> +		if (!clkp) {
> +			pr_warn("clock %u not found\n", init->clk_id);
> +			continue;
> +		}
> +
> +		clk =3D tegra_clk_register_periph_data(clk_base, init);
> +		*clkp =3D clk;
> +	}
> +
> +	tegra_periph_clk_init(clk_base, pmc_base, tegra210_clks, &pll_p_params)=
;
> +
> +	/* mc */
> +	tegra210_clk_register_mc("mc", "emc");
> +}
> +
> +static void __init tegra210_pll_init(void __iomem *clk_base,
> +				     void __iomem *pmc)
> +{
> +	struct clk *clk;
> +
> +	/* PLL_RE reference clock must be selected by boot-loader */
> +	pll_re_use_utmipll =3D readl_relaxed(clk_base + PLLRE_BASE) &
> +		PLLRE_BASE_CLKIN_SEL;
> +
> +	/* PLLC */
> +	clk =3D tegra_clk_register_pllc_tegra210("pll_c", "pll_ref", clk_base,
> +			pmc, 0, &pll_c_params, NULL);
> +	if (!WARN_ON(IS_ERR(clk)))
> +		clk_register_clkdev(clk, "pll_c", NULL);
> +	clks[TEGRA210_CLK_PLL_C] =3D clk;
> +
> +	/* PLLC_OUT1 */
> +	clk =3D tegra_clk_register_divider("pll_c_out1_div", "pll_c",
> +			clk_base + PLLC_OUT, 0, TEGRA_DIVIDER_ROUND_UP,
> +			8, 8, 1, NULL);
> +	clk =3D tegra_clk_register_pll_out("pll_c_out1", "pll_c_out1_div",
> +				clk_base + PLLC_OUT, 1, 0,
> +				CLK_SET_RATE_PARENT, 0, NULL);
> +	clk_register_clkdev(clk, "pll_c_out1", NULL);
> +	clks[TEGRA210_CLK_PLL_C_OUT1] =3D clk;
> +
> +	/* PLLC_UD */
> +	clk =3D clk_register_fixed_factor(NULL, "pll_c_ud", "pll_c",
> +					CLK_SET_RATE_PARENT, 1, 1);
> +	clk_register_clkdev(clk, "pll_c_ud", NULL);
> +	clks[TEGRA210_CLK_PLL_C_UD] =3D clk;
> +
> +	/* PLLC2 */
> +	clk =3D tegra_clk_register_pllc_tegra210("pll_c2", "pll_ref", clk_base,
> +			     pmc, 0, &pll_c2_params, NULL);
> +	clk_register_clkdev(clk, "pll_c2", NULL);
> +	clks[TEGRA210_CLK_PLL_C2] =3D clk;
> +
> +	/* PLLC3 */
> +	clk =3D tegra_clk_register_pllc_tegra210("pll_c3", "pll_ref", clk_base,
> +			     pmc, 0, &pll_c3_params, NULL);
> +	clk_register_clkdev(clk, "pll_c3", NULL);
> +	clks[TEGRA210_CLK_PLL_C3] =3D clk;
> +
> +	/* PLLU_VCO */
> +	if (!tegra210_init_pllu()) {
> +		clk =3D clk_register_fixed_rate(NULL, "pll_u_vco", "pll_ref", 0,
> +					      480*1000*1000);
> +		clk_register_clkdev(clk, "pll_u_vco", NULL);
> +		clks[TEGRA210_CLK_PLL_U] =3D clk;
> +
> +		/* PLLU_OUT */
> +		clk =3D clk_register_fixed_factor(NULL, "pll_u_out", "pll_u_vco",
> +						CLK_SET_RATE_PARENT, 1, 2);
> +		clk_register_clkdev(clk, "pll_u_out", NULL);
> +		clks[TEGRA210_CLK_PLL_U_OUT] =3D clk;
> +
> +		/* UTMIPLL_60M */
> +		clk =3D clk_register_fixed_rate(NULL, "utmipll_60M", "pll_ref", 0,
> +					      60*1000*1000);
> +		clk_register_clkdev(clk, "utmipll_60M", NULL);
> +		clks[TEGRA210_CLK_UTMIPLL_60M] =3D clk;
> +	}
> +
> +	/* PLLU_OUT1 */
> +	clk =3D tegra_clk_register_divider("pll_u_out1_div", "pll_u_out",
> +				clk_base + PLLU_OUTA, 0,
> +				TEGRA_DIVIDER_ROUND_UP,
> +				8, 8, 1, &pll_u_lock);
> +	clk =3D tegra_clk_register_pll_out("pll_u_out1", "pll_u_out1_div",
> +				clk_base + PLLU_OUTA, 1, 0,
> +				CLK_SET_RATE_PARENT, 0, &pll_u_lock);
> +	clk_register_clkdev(clk, "pll_u_out1", NULL);
> +	clks[TEGRA210_CLK_PLL_U_OUT1] =3D clk;
> +
> +	/* PLLU_OUT2 */
> +	clk =3D tegra_clk_register_divider("pll_u_out2_div", "pll_u_out",
> +				clk_base + PLLU_OUTA, 0,
> +				TEGRA_DIVIDER_ROUND_UP,
> +				24, 8, 1, &pll_u_lock);
> +	clk =3D tegra_clk_register_pll_out("pll_u_out2", "pll_u_out2_div",
> +				clk_base + PLLU_OUTA, 17, 16,
> +				CLK_SET_RATE_PARENT, 0, &pll_u_lock);
> +	clk_register_clkdev(clk, "pll_u_out2", NULL);
> +	clks[TEGRA210_CLK_PLL_U_OUT2] =3D clk;
> +
> +	/* PLLU_480M */
> +	clk =3D clk_register_gate(NULL, "pll_u_480M", "pll_u_vco",
> +				CLK_SET_RATE_PARENT, clk_base + PLLU_BASE,
> +				22, 0, &pll_u_lock);
> +	clk_register_clkdev(clk, "pll_u_480M", NULL);
> +	clks[TEGRA210_CLK_PLL_U_480M] =3D clk;
> +
> +	/* PLLU_60M */
> +	clk =3D clk_register_gate(NULL, "pll_u_60M", "pll_u_out2",
> +				CLK_SET_RATE_PARENT, clk_base + PLLU_BASE,
> +				23, 0, &pll_u_lock);
> +	clk_register_clkdev(clk, "pll_u_60M", NULL);
> +	clks[TEGRA210_CLK_PLL_U_60M] =3D clk;
> +
> +	/* PLLU_48M */
> +	clk =3D clk_register_gate(NULL, "pll_u_48M", "pll_u_out1",
> +				CLK_SET_RATE_PARENT, clk_base + PLLU_BASE,
> +				25, 0, &pll_u_lock);
> +	clk_register_clkdev(clk, "pll_u_48M", NULL);
> +	clks[TEGRA210_CLK_PLL_U_48M] =3D clk;
> +
> +	/* PLLD */
> +	clk =3D tegra_clk_register_pll("pll_d", "pll_ref", clk_base, pmc, 0,
> +			    &pll_d_params, &pll_d_lock);
> +	clk_register_clkdev(clk, "pll_d", NULL);
> +	clks[TEGRA210_CLK_PLL_D] =3D clk;
> +
> +	/* PLLD_OUT0 */
> +	clk =3D clk_register_fixed_factor(NULL, "pll_d_out0", "pll_d",
> +					CLK_SET_RATE_PARENT, 1, 2);
> +	clk_register_clkdev(clk, "pll_d_out0", NULL);
> +	clks[TEGRA210_CLK_PLL_D_OUT0] =3D clk;
> +
> +	/* PLLRE */
> +	if (pll_re_use_utmipll) {
> +		clk =3D tegra_clk_register_pllre_tegra210(
> +			"pll_re_vco", "utmipll_60M", clk_base, pmc, 0,
> +			&pll_re_vco_params, &pll_re_lock, 60*1000*1000);
> +	} else {
> +		clk =3D tegra_clk_register_pllre_tegra210(
> +			"pll_re_vco", "pll_ref", clk_base, pmc, 0,
> +			&pll_re_vco_params, &pll_re_lock, pll_ref_freq);
> +	}
> +	clk_register_clkdev(clk, "pll_re_vco", NULL);
> +	clks[TEGRA210_CLK_PLL_RE_VCO] =3D clk;
> +
> +	clk =3D clk_register_divider_table(NULL, "pll_re_out", "pll_re_vco", 0,
> +					 clk_base + PLLRE_BASE, 16, 5, 0,
> +					 pll_vco_post_div_table, &pll_re_lock);
> +	clk_register_clkdev(clk, "pll_re_out", NULL);
> +	clks[TEGRA210_CLK_PLL_RE_OUT] =3D clk;
> +
> +	clk =3D tegra_clk_register_divider("pll_re_out1_div", "pll_re_vco",
> +					 clk_base + PLLRE_OUT1, 0,
> +					 TEGRA_DIVIDER_ROUND_UP,
> +					 8, 8, 1, NULL);
> +	clk =3D tegra_clk_register_pll_out("pll_re_out1", "pll_re_out1_div",
> +					 clk_base + PLLRE_OUT1, 1, 0,
> +					 CLK_SET_RATE_PARENT, 0, NULL);
> +	clks[TEGRA210_CLK_PLL_RE_OUT1] =3D clk;
> +
> +	/* PLLE */
> +	clk =3D tegra_clk_register_plle_tegra210("pll_e", "pll_ref",
> +				      clk_base, 0, &pll_e_params, &pll_e_lock);
> +	clk_register_clkdev(clk, "pll_e", NULL);
> +	clks[TEGRA210_CLK_PLL_E] =3D clk;
> +
> +	/* PLLC4 */
> +	clk =3D tegra_clk_register_pllre_tegra210("pll_c4_vco", "pll_ref",
> +		clk_base, pmc, 0, &pll_c4_vco_params, NULL, pll_ref_freq);
> +	clk_register_clkdev(clk, "pll_c4_vco", NULL);
> +	clks[TEGRA210_CLK_PLL_C4] =3D clk;
> +
> +	/* PLLC4_OUT1 */
> +	clk =3D clk_register_fixed_factor(NULL, "pll_c4_out1", "pll_c4_vco",
> +					CLK_SET_RATE_PARENT, 1, 3);
> +	clk_register_clkdev(clk, "pll_c4_out1", NULL);
> +	clks[TEGRA210_CLK_PLL_C4_OUT1] =3D clk;
> +
> +	/* PLLC4_OUT2 */
> +	clk =3D clk_register_fixed_factor(NULL, "pll_c4_out2", "pll_c4_vco",
> +					CLK_SET_RATE_PARENT, 1, 5);
> +	clk_register_clkdev(clk, "pll_c4_out2", NULL);
> +	clks[TEGRA210_CLK_PLL_C4_OUT2] =3D clk;
> +
> +	/* PLLC4_OUT3 */
> +	clk =3D tegra_clk_register_divider("pll_c4_out3_div", "pll_c4_out0",
> +			clk_base + PLLC4_OUT, 0, TEGRA_DIVIDER_ROUND_UP,
> +			8, 8, 1, NULL);
> +	clk =3D tegra_clk_register_pll_out("pll_c4_out3", "pll_c4_out3_div",
> +				clk_base + PLLC4_OUT, 1, 0,
> +				CLK_SET_RATE_PARENT, 0, NULL);
> +	clk_register_clkdev(clk, "pll_c4_out3", NULL);
> +	clks[TEGRA210_CLK_PLL_C4_OUT3] =3D clk;
> +
> +	/* PLLDP */
> +	clk =3D tegra_clk_register_pllss_tegra210("pll_dp", "pll_ref", clk_base=
,
> +					0, &pll_dp_params, NULL);
> +	clk_register_clkdev(clk, "pll_dp", NULL);
> +	clks[TEGRA210_CLK_PLL_DP] =3D clk;
> +
> +	/* PLLD2 */
> +	clk =3D tegra_clk_register_pllss_tegra210("pll_d2", "pll_ref", clk_base=
,
> +					0, &pll_d2_params, NULL);
> +	clk_register_clkdev(clk, "pll_d2", NULL);
> +	clks[TEGRA210_CLK_PLL_D2] =3D clk;
> +
> +	/* PLLD2_OUT0 */
> +	clk =3D clk_register_fixed_factor(NULL, "pll_d2_out0", "pll_d2",
> +					CLK_SET_RATE_PARENT, 1, 1);
> +	clk_register_clkdev(clk, "pll_d2_out0", NULL);
> +	clks[TEGRA210_CLK_PLL_D2_OUT0] =3D clk;
> +
> +	/* PLLP_OUT2 */
> +	clk =3D clk_register_fixed_factor(NULL, "pll_p_out2", "pll_p",
> +					CLK_SET_RATE_PARENT, 1, 2);
> +	clk_register_clkdev(clk, "pll_p_out2", NULL);
> +	clks[TEGRA210_CLK_PLL_P_OUT2] =3D clk;
> +
> +	/* PLLP_UD */
> +	clk =3D clk_register_fixed_factor(NULL, "pll_p_ud", "pll_p",
> +					CLK_SET_RATE_PARENT, 1, 1);
> +	clk_register_clkdev(clk, "pll_pud", NULL);
> +	clks[TEGRA210_CLK_PLL_P_UD] =3D clk;
> +
> +	/* PLLP_UPHY_OUT */
> +	clk =3D tegra_clk_register_divider("pll_p_uphy_div", "pll_p_out_xusb",
> +		clk_base + PEX_SATA_USB_RX_BYP, 0,
> +		TEGRA_DIVIDER_ROUND_UP, 0, 8, 1, &pll_p_uphy_lock);
> +	clk =3D clk_register_gate(NULL, "pll_p_uphy_out", "pll_p_uphy_div",
> +		CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED,
> +		clk_base + PEX_SATA_USB_RX_BYP, 8, 0, &pll_p_uphy_lock);
> +	clk_register_clkdev(clk, "pll_p_uphy_out", NULL);
> +	clks[TEGRA210_CLK_PLL_P_UPHY_OUT] =3D clk;
> +}
> +
> +/* Tegra210 CPU clock and reset control functions */
> +static void tegra210_wait_cpu_in_reset(u32 cpu)
> +{
> +	unsigned int reg;
> +
> +	do {
> +		reg =3D readl(clk_base + CLK_RST_CONTROLLER_CPU_CMPLX_STATUS);
> +		cpu_relax();
> +	} while (!(reg & (1 << cpu)));  /* check CPU been reset or not */
> +}
> +
> +static void tegra210_disable_cpu_clock(u32 cpu)
> +{
> +	/* flow controller would take care in the power sequence. */
> +}
> +
> +#ifdef CONFIG_PM_SLEEP
> +#define car_readl(_base, _off) readl_relaxed(clk_base + (_base) + ((_off=
) * 4))
> +#define car_writel(_val, _base, _off) \
> +		writel_relaxed(_val, clk_base + (_base) + ((_off) * 4))
> +
> +static u32 spare_reg_ctx, misc_clk_enb_ctx, clk_msk_arm_ctx;
> +static u32 cpu_softrst_ctx[3];
> +
> +static int tegra210_clk_suspend(void *data)
> +{
> +	unsigned int i;
> +
> +	clk_save_context();
> +
> +	/*
> +	 * Save the bootloader configured clock registers SPARE_REG0,
> +	 * MISC_CLK_ENB, CLK_MASK_ARM, CPU_SOFTRST_CTRL.
> +	 */
> +	spare_reg_ctx =3D readl_relaxed(clk_base + SPARE_REG0);
> +	misc_clk_enb_ctx =3D readl_relaxed(clk_base + MISC_CLK_ENB);
> +	clk_msk_arm_ctx =3D readl_relaxed(clk_base + CLK_MASK_ARM);
> +
> +	for (i =3D 0; i < ARRAY_SIZE(cpu_softrst_ctx); i++)
> +		cpu_softrst_ctx[i] =3D car_readl(CPU_SOFTRST_CTRL, i);
> +
> +	tegra_clk_periph_suspend();
> +	return 0;
> +}
> +
> +static void tegra210_clk_resume(void *data)
> +{
> +	unsigned int i;
> +
> +	tegra_clk_osc_resume(clk_base);
> +
> +	/*
> +	 * Restore the bootloader configured clock registers SPARE_REG0,
> +	 * MISC_CLK_ENB, CLK_MASK_ARM, CPU_SOFTRST_CTRL from saved context.
> +	 */
> +	writel_relaxed(spare_reg_ctx, clk_base + SPARE_REG0);
> +	writel_relaxed(misc_clk_enb_ctx, clk_base + MISC_CLK_ENB);
> +	writel_relaxed(clk_msk_arm_ctx, clk_base + CLK_MASK_ARM);
> +
> +	for (i =3D 0; i < ARRAY_SIZE(cpu_softrst_ctx); i++)
> +		car_writel(cpu_softrst_ctx[i], CPU_SOFTRST_CTRL, i);
> +
> +	/*
> +	 * Tegra clock programming sequence recommends peripheral clock to
> +	 * be enabled prior to changing its clock source and divider to
> +	 * prevent glitchless frequency switch.
> +	 * So, enable all peripheral clocks before restoring their source
> +	 * and dividers.
> +	 */
> +	writel_relaxed(TEGRA210_CLK_ENB_VLD_MSK_L, clk_base + CLK_OUT_ENB_L);
> +	writel_relaxed(TEGRA210_CLK_ENB_VLD_MSK_H, clk_base + CLK_OUT_ENB_H);
> +	writel_relaxed(TEGRA210_CLK_ENB_VLD_MSK_U, clk_base + CLK_OUT_ENB_U);
> +	writel_relaxed(TEGRA210_CLK_ENB_VLD_MSK_V, clk_base + CLK_OUT_ENB_V);
> +	writel_relaxed(TEGRA210_CLK_ENB_VLD_MSK_W, clk_base + CLK_OUT_ENB_W);
> +	writel_relaxed(TEGRA210_CLK_ENB_VLD_MSK_X, clk_base + CLK_OUT_ENB_X);
> +	writel_relaxed(TEGRA210_CLK_ENB_VLD_MSK_Y, clk_base + CLK_OUT_ENB_Y);
> +
> +	/* wait for all writes to happen to have all the clocks enabled */
> +	fence_udelay(2, clk_base);
> +
> +	/* restore PLLs and all peripheral clock rates */
> +	tegra210_init_pllu();
> +	clk_restore_context();
> +
> +	/* restore saved context of peripheral clocks and reset state */
> +	tegra_clk_periph_resume();
> +}
> +
> +static void tegra210_cpu_clock_suspend(void)
> +{
> +	/* switch coresite to clk_m, save off original source */
> +	tegra210_cpu_clk_sctx.clk_csite_src =3D
> +				readl(clk_base + CLK_SOURCE_CSITE);
> +	writel(3 << 30, clk_base + CLK_SOURCE_CSITE);
> +}
> +
> +static void tegra210_cpu_clock_resume(void)
> +{
> +	writel(tegra210_cpu_clk_sctx.clk_csite_src,
> +				clk_base + CLK_SOURCE_CSITE);
> +}
> +#endif
> +
> +static const struct syscore_ops tegra_clk_syscore_ops =3D {
> +#ifdef CONFIG_PM_SLEEP
> +	.suspend =3D tegra210_clk_suspend,
> +	.resume =3D tegra210_clk_resume,
> +#endif
> +};
> +
> +static struct syscore tegra_clk_syscore =3D {
> +	.ops =3D &tegra_clk_syscore_ops,
> +};
> +
> +static struct tegra_cpu_car_ops tegra210_cpu_car_ops =3D {
> +	.wait_for_reset	=3D tegra210_wait_cpu_in_reset,
> +	.disable_clock	=3D tegra210_disable_cpu_clock,
> +#ifdef CONFIG_PM_SLEEP
> +	.suspend	=3D tegra210_cpu_clock_suspend,
> +	.resume		=3D tegra210_cpu_clock_resume,
> +#endif
> +};
> +
> +static const struct of_device_id pmc_match[] __initconst =3D {
> +	{ .compatible =3D "nvidia,tegra210b01-pmc" },
> +	{ },
> +};
> +
> +static struct tegra_clk_init_table t210b01_init_table[] __initdata =3D {
> +	{ TEGRA210_CLK_PLL_A, TEGRA210_CLK_CLK_MAX, 564480000, 1,
> +		TEGRA_TABLE_RATE_CHANGE_OVERCLOCK },
> +	{ TEGRA210_CLK_PLL_RE_VCO, TEGRA210_CLK_CLK_MAX, 0, 1,
> +		TEGRA_TABLE_RATE_CHANGE_OVERCLOCK },
> +	{ TEGRA210_CLK_PLL_DP, TEGRA210_CLK_CLK_MAX, 270000000, 0,
> +		TEGRA_TABLE_RATE_CHANGE_OVERCLOCK },
> +	{ TEGRA210_CLK_PLL_P_UPHY_OUT, TEGRA210_CLK_CLK_MAX, 102000000, 1 },
> +	{ TEGRA210_CLK_SDMMC_LEGACY, TEGRA210_CLK_PLL_P, 12000000, 0 },
> +	{ TEGRA210_CLK_I2CSLOW, TEGRA210_CLK_CLK_32K, 32000, 0 },
> +	{ TEGRA210_CLK_SPDIF_IN, TEGRA210_CLK_CLK_MAX, 136000000, 0 },
> +	{ TEGRA210_CLK_USB2_HSIC_TRK, TEGRA210_CLK_CLK_MAX, 9600000, 0 },
> +	/* This MUST be the last entry. */
> +	{ TEGRA210_CLK_CLK_MAX, TEGRA210_CLK_CLK_MAX, 0, 0 },
> +};
> +
> +static struct tegra_clk_init_table init_table[] __initdata =3D {
> +	{ TEGRA210_CLK_UARTA, TEGRA210_CLK_PLL_P, 408000000, 0 },
> +	{ TEGRA210_CLK_UARTB, TEGRA210_CLK_PLL_P, 408000000, 0 },
> +	{ TEGRA210_CLK_UARTC, TEGRA210_CLK_PLL_P, 408000000, 0 },
> +	{ TEGRA210_CLK_UARTD, TEGRA210_CLK_PLL_P, 408000000, 0 },
> +	{ TEGRA210_CLK_PLL_A_OUT0, TEGRA210_CLK_CLK_MAX, 11289600, 0 },
> +	{ TEGRA210_CLK_I2S0, TEGRA210_CLK_PLL_A_OUT0, 11289600, 0 },
> +	{ TEGRA210_CLK_I2S1, TEGRA210_CLK_PLL_A_OUT0, 11289600, 0 },
> +	{ TEGRA210_CLK_I2S2, TEGRA210_CLK_PLL_A_OUT0, 11289600, 0 },
> +	{ TEGRA210_CLK_I2S3, TEGRA210_CLK_PLL_A_OUT0, 11289600, 0 },
> +	{ TEGRA210_CLK_I2S4, TEGRA210_CLK_PLL_A_OUT0, 11289600, 0 },
> +	{ TEGRA210_CLK_HOST1X, TEGRA210_CLK_PLL_P, 136000000, 1 },
> +	{ TEGRA210_CLK_SCLK_MUX, TEGRA210_CLK_PLL_P, 0, 1 },
> +	{ TEGRA210_CLK_SCLK, TEGRA210_CLK_CLK_MAX, 102000000, 0 },
> +	{ TEGRA210_CLK_DFLL_SOC, TEGRA210_CLK_PLL_P, 51000000, 1 },
> +	{ TEGRA210_CLK_DFLL_REF, TEGRA210_CLK_PLL_P, 51000000, 1 },
> +	{ TEGRA210_CLK_SBC4, TEGRA210_CLK_PLL_P, 12000000, 1 },
> +	{ TEGRA210_CLK_PLL_U_OUT1, TEGRA210_CLK_CLK_MAX, 48000000, 1 },
> +	{ TEGRA210_CLK_XUSB_GATE, TEGRA210_CLK_CLK_MAX, 0, 1 },
> +	{ TEGRA210_CLK_XUSB_SS_SRC, TEGRA210_CLK_PLL_U_480M, 120000000, 0 },
> +	{ TEGRA210_CLK_XUSB_FS_SRC, TEGRA210_CLK_PLL_U_48M, 48000000, 0 },
> +	{ TEGRA210_CLK_XUSB_HS_SRC, TEGRA210_CLK_XUSB_SS_SRC, 120000000, 0 },
> +	{ TEGRA210_CLK_XUSB_SSP_SRC, TEGRA210_CLK_XUSB_SS_SRC, 120000000, 0 },
> +	{ TEGRA210_CLK_XUSB_FALCON_SRC, TEGRA210_CLK_PLL_P_OUT_XUSB, 204000000,=
 0 },
> +	{ TEGRA210_CLK_XUSB_HOST_SRC, TEGRA210_CLK_PLL_P_OUT_XUSB, 102000000, 0=
 },
> +	{ TEGRA210_CLK_XUSB_DEV_SRC, TEGRA210_CLK_PLL_P_OUT_XUSB, 102000000, 0 =
},
> +	{ TEGRA210_CLK_SATA, TEGRA210_CLK_PLL_P, 104000000, 0 },
> +	{ TEGRA210_CLK_SATA_OOB, TEGRA210_CLK_PLL_P, 204000000, 0 },
> +	{ TEGRA210_CLK_MSELECT, TEGRA210_CLK_CLK_MAX, 0, 1 },
> +	{ TEGRA210_CLK_CSITE, TEGRA210_CLK_CLK_MAX, 0, 1 },
> +	/* TODO find a way to enable this on-demand */
> +	{ TEGRA210_CLK_DBGAPB, TEGRA210_CLK_CLK_MAX, 0, 1 },
> +	{ TEGRA210_CLK_TSENSOR, TEGRA210_CLK_CLK_M, 400000, 0 },
> +	{ TEGRA210_CLK_I2C1, TEGRA210_CLK_PLL_P, 0, 0 },
> +	{ TEGRA210_CLK_I2C2, TEGRA210_CLK_PLL_P, 0, 0 },
> +	{ TEGRA210_CLK_I2C3, TEGRA210_CLK_PLL_P, 0, 0 },
> +	{ TEGRA210_CLK_I2C4, TEGRA210_CLK_PLL_P, 0, 0 },
> +	{ TEGRA210_CLK_I2C5, TEGRA210_CLK_PLL_P, 0, 0 },
> +	{ TEGRA210_CLK_I2C6, TEGRA210_CLK_PLL_P, 0, 0 },
> +	{ TEGRA210_CLK_SOC_THERM, TEGRA210_CLK_PLL_P, 51000000, 0 },
> +	{ TEGRA210_CLK_CCLK_G, TEGRA210_CLK_CLK_MAX, 0, 1 },
> +	{ TEGRA210_CLK_PLL_U_OUT2, TEGRA210_CLK_CLK_MAX, 60000000, 1 },
> +	{ TEGRA210_CLK_SPDIF_IN_SYNC, TEGRA210_CLK_CLK_MAX, 24576000, 0 },
> +	{ TEGRA210_CLK_I2S0_SYNC, TEGRA210_CLK_CLK_MAX, 24576000, 0 },
> +	{ TEGRA210_CLK_I2S1_SYNC, TEGRA210_CLK_CLK_MAX, 24576000, 0 },
> +	{ TEGRA210_CLK_I2S2_SYNC, TEGRA210_CLK_CLK_MAX, 24576000, 0 },
> +	{ TEGRA210_CLK_I2S3_SYNC, TEGRA210_CLK_CLK_MAX, 24576000, 0 },
> +	{ TEGRA210_CLK_I2S4_SYNC, TEGRA210_CLK_CLK_MAX, 24576000, 0 },
> +	{ TEGRA210_CLK_VIMCLK_SYNC, TEGRA210_CLK_CLK_MAX, 24576000, 0 },
> +	{ TEGRA210_CLK_HDA, TEGRA210_CLK_PLL_P, 51000000, 0 },
> +	{ TEGRA210_CLK_HDA2CODEC_2X, TEGRA210_CLK_PLL_P, 48000000, 0 },
> +	{ TEGRA210_CLK_PWM, TEGRA210_CLK_PLL_P, 48000000, 0 },
> +	/* This MUST be the last entry. */
> +	{ TEGRA210_CLK_CLK_MAX, TEGRA210_CLK_CLK_MAX, 0, 0 },
> +};
> +
> +static void __init tegra210b01_clock_table_init(struct clk **clks)
> +{
> +	struct clk *clk;
> +	unsigned long rate;
> +
> +	 /* Set PLL_RE at 625 MHz from UTMIPLL, or 672MHz, otherwise */
> +	rate =3D (pll_re_use_utmipll ? 625 : 672) * 1000 * 1000;
> +	clk =3D clks[TEGRA210_CLK_PLL_RE_VCO];
> +	WARN_ON(IS_ERR_OR_NULL(clk));
> +	if (clk_set_rate(clk, rate))
> +		WARN(1, "%s: Failed to set rate %lu of %s\n",
> +		     __func__, rate,   __clk_get_name(clk));
> +
> +	tegra_init_from_table(t210b01_init_table, clks, TEGRA210_CLK_CLK_MAX);
> +}
> +
> +/**
> + * tegra210b01_clock_apply_init_table - initialize clocks on Tegra210 So=
Cs
> + *
> + * Program an initial clock rate and enable or disable clocks needed
> + * by the rest of the kernel, for Tegra210 SoCs.  It is intended to be
> + * called by assigning a pointer to it to tegra_clk_apply_init_table -
> + * this will be called as an arch_initcall.  No return value.
> + */
> +static void __init tegra210b01_clock_apply_init_table(void)
> +{
> +	tegra210b01_clock_table_init(clks);
> +	tegra_init_from_table(init_table, clks, TEGRA210_CLK_CLK_MAX);
> +}
> +
> +/**
> + * tegra210b01_car_barrier - wait for pending writes to the CAR to compl=
ete
> + *
> + * Wait for any outstanding writes to the CAR MMIO space from this CPU
> + * to complete before continuing execution.  No return value.
> + */
> +static void tegra210b01_car_barrier(void)
> +{
> +	readl_relaxed(clk_base + RST_DFLL_DVCO);
> +}
> +
> +/**
> + * tegra210b01_clock_assert_dfll_dvco_reset - assert the DFLL's DVCO res=
et
> + *
> + * Assert the reset line of the DFLL's DVCO.  No return value.
> + */
> +static void tegra210b01_clock_assert_dfll_dvco_reset(void)
> +{
> +	u32 v;
> +
> +	v =3D readl_relaxed(clk_base + RST_DFLL_DVCO);
> +	v |=3D (1 << DVFS_DFLL_RESET_SHIFT);
> +	writel_relaxed(v, clk_base + RST_DFLL_DVCO);
> +	tegra210b01_car_barrier();
> +}
> +
> +/**
> + * tegra210b01_clock_deassert_dfll_dvco_reset - deassert the DFLL's DVCO=
 reset
> + *
> + * Deassert the reset line of the DFLL's DVCO, allowing the DVCO to
> + * operate.  No return value.
> + */
> +static void tegra210b01_clock_deassert_dfll_dvco_reset(void)
> +{
> +	u32 v;
> +
> +	v =3D readl_relaxed(clk_base + RST_DFLL_DVCO);
> +	v &=3D ~(1 << DVFS_DFLL_RESET_SHIFT);
> +	writel_relaxed(v, clk_base + RST_DFLL_DVCO);
> +	tegra210b01_car_barrier();
> +}
> +
> +static int tegra210b01_reset_assert(unsigned long id)
> +{
> +	if (id =3D=3D TEGRA210_RST_DFLL_DVCO)
> +		tegra210b01_clock_assert_dfll_dvco_reset();
> +	else if (id =3D=3D TEGRA210_RST_ADSP)
> +		writel(GENMASK(26, 21) | BIT(7),
> +			clk_base + CLK_RST_CONTROLLER_RST_DEV_Y_SET);
> +	else
> +		return -EINVAL;
> +
> +	return 0;
> +}
> +
> +static int tegra210b01_reset_deassert(unsigned long id)
> +{
> +	if (id =3D=3D TEGRA210_RST_DFLL_DVCO)
> +		tegra210b01_clock_deassert_dfll_dvco_reset();
> +	else if (id =3D=3D TEGRA210_RST_ADSP) {
> +		writel(BIT(21), clk_base + CLK_RST_CONTROLLER_RST_DEV_Y_CLR);
> +		/*
> +		 * Considering adsp cpu clock (min: 12.5MHZ, max: 1GHz)
> +		 * a delay of 5us ensures that it's at least
> +		 * 6 * adsp_cpu_cycle_period long.
> +		 */
> +		udelay(5);
> +		writel(GENMASK(26, 22) | BIT(7),
> +			clk_base + CLK_RST_CONTROLLER_RST_DEV_Y_CLR);
> +	} else
> +		return -EINVAL;
> +
> +	return 0;
> +}
> +
> +static enum clk_id tegra210b01_integer_div_id[] =3D {
> +	tegra_clk_cilab,
> +	tegra_clk_cilcd,
> +
> +	tegra_clk_spdif_out,
> +
> +	tegra_clk_sbc1_9,
> +	tegra_clk_sbc2_9,
> +	tegra_clk_sbc3_9,
> +	tegra_clk_sbc4_9,
> +
> +	tegra_clk_sdmmc_legacy,
> +	tegra_clk_i2cslow,
> +	tegra_clk_qspi,
> +
> +	tegra_clk_soc_therm_8,
> +	tegra_clk_tsensor,
> +};
> +
> +static void tegra210b01_adjust_clks(struct tegra_clk *tegra_clks)
> +{
> +	int i;
> +
> +	/* Remove CPU_LP claster clocks */
> +	tegra_clks[tegra_clk_cclk_lp].present =3D false;
> +	tegra_clks[tegra_clk_pll_x_out0].present =3D false;
> +
> +	/* Prevent 1:1.5 fractional divider setting */
> +	div1_5_not_allowed =3D true;
> +
> +	/* Prevent any fractional setting */
> +	for (i =3D 0; i < ARRAY_SIZE(tegra210b01_integer_div_id); i++) {
> +		enum clk_id cid =3D tegra210b01_integer_div_id[i];
> +
> +		if (cid >=3D tegra_clk_max || !tegra_clks[cid].present) {
> +			pr_warn("%s: clk %d is not present\n", __func__, cid);
> +			continue;
> +		}
> +		tegra_clks[cid].use_integer_div =3D true;
> +	}
> +}
> +
> +/**
> + * tegra210b01_clock_init - Tegra210-specific clock initialization
> + * @np: struct device_node * of the DT node for the SoC CAR IP block
> + *
> + * Register most SoC clocks for the Tegra210B01 system-on-chip.  Intende=
d
> + * to be called by the OF init code when a DT node with the
> + * "nvidia,tegra210b01-car" string is encountered, and declared with
> + * CLK_OF_DECLARE.  No return value.
> + */
> +static void __init tegra210b01_clock_init(struct device_node *np)
> +{
> +	struct device_node *node;
> +	u32 value, clk_m_div;
> +
> +	clk_base =3D of_iomap(np, 0);
> +	if (!clk_base) {
> +		pr_err("ioremap tegra210 CAR failed\n");
> +		return;
> +	}
> +
> +	node =3D of_find_matching_node(NULL, pmc_match);
> +	if (!node) {
> +		pr_err("Failed to find pmc node\n");
> +		WARN_ON(1);
> +		return;
> +	}
> +
> +	pmc_base =3D of_iomap(node, 0);
> +	of_node_put(node);
> +	if (!pmc_base) {
> +		pr_err("Can't map pmc registers\n");
> +		WARN_ON(1);
> +		return;
> +	}
> +
> +	clks =3D tegra_clk_init(clk_base, TEGRA210_CLK_CLK_MAX,
> +			      TEGRA210_CAR_BANK_COUNT);
> +	if (!clks)
> +		return;
> +
> +	tegra210b01_adjust_clks(tegra210_clks);
> +
> +	value =3D readl(clk_base + SPARE_REG0) >> CLK_M_DIVISOR_SHIFT;
> +	clk_m_div =3D (value & CLK_M_DIVISOR_MASK) + 1;
> +
> +	if (tegra_osc_clk_init(clk_base, tegra210_clks, tegra210_input_freq,
> +			       ARRAY_SIZE(tegra210_input_freq), clk_m_div,
> +			       &osc_freq, &pll_ref_freq) < 0)
> +		return;
> +
> +	tegra_fixed_clk_init(tegra210_clks);
> +	tegra210_pll_init(clk_base, pmc_base);
> +	tegra210_periph_clk_init(np, clk_base, pmc_base);
> +	tegra_audio_clk_init(clk_base, pmc_base, tegra210_clks,
> +			     tegra210_audio_plls,
> +			     ARRAY_SIZE(tegra210_audio_plls), 24576000);
> +
> +	/* For Tegra210, PLLD is the only source for DSIA & DSIB */
> +	value =3D readl(clk_base + PLLD_BASE);
> +	value &=3D ~BIT(25);
> +	writel(value, clk_base + PLLD_BASE);
> +
> +	tegra_clk_apply_init_table =3D tegra210b01_clock_apply_init_table;
> +
> +	tegra_super_clk_gen5_init(clk_base, pmc_base, tegra210_clks,
> +				  &pll_x_params);
> +	tegra_init_special_resets(2, tegra210b01_reset_assert,
> +				  tegra210b01_reset_deassert);
> +
> +	tegra_add_of_provider(np, of_clk_src_onecell_get);
> +	tegra_register_devclks(devclks, ARRAY_SIZE(devclks));
> +
> +	tegra_cpu_car_ops =3D &tegra210_cpu_car_ops;
> +
> +	register_syscore(&tegra_clk_syscore);
> +}
> +CLK_OF_DECLARE(tegra210b01, "nvidia,tegra210b01-car", tegra210b01_clock_=
init);
> diff --git a/drivers/clk/tegra/clk-utils.c b/drivers/clk/tegra/clk-utils.=
c
> index 1a5daae4e5014..4283f314c513f 100644
> --- a/drivers/clk/tegra/clk-utils.c
> +++ b/drivers/clk/tegra/clk-utils.c
> @@ -31,7 +31,7 @@ int div_frac_get(unsigned long rate, unsigned parent_ra=
te, u8 width,
>  	if (flags & TEGRA_DIVIDER_INT)
>  		divider_ux1 *=3D mul;
> =20
> -	if (divider_ux1 < mul)
> +	if (!div1_5_not_allowed && divider_ux1 < mul)
>  		return 0;
> =20
>  	divider_ux1 -=3D mul;
> @@ -39,5 +39,8 @@ int div_frac_get(unsigned long rate, unsigned parent_ra=
te, u8 width,
>  	if (divider_ux1 > div_mask(width))
>  		return div_mask(width);
> =20
> +	if (div1_5_not_allowed && (divider_ux1 > 0) && (divider_ux1 < mul))
> +		divider_ux1 =3D (flags & TEGRA_DIVIDER_ROUND_UP) ? mul : 0;
> +
>  	return divider_ux1;
>  }
> diff --git a/drivers/clk/tegra/clk.c b/drivers/clk/tegra/clk.c
> index 78655422253d5..7930b2acd2368 100644
> --- a/drivers/clk/tegra/clk.c
> +++ b/drivers/clk/tegra/clk.c
> @@ -26,6 +26,7 @@ static struct tegra_cpu_car_ops dummy_car_ops;
>  struct tegra_cpu_car_ops *tegra_cpu_car_ops =3D &dummy_car_ops;
> =20
>  int *periph_clk_enb_refcnt;
> +bool div1_5_not_allowed;
>  static int periph_banks;
>  static u32 *periph_state_ctx;
>  static struct clk **clks;
> @@ -289,13 +290,27 @@ void tegra_init_from_table(struct tegra_clk_init_ta=
ble *tbl,
>  			}
>  		}
> =20
> -		if (tbl->rate)
> -			if (clk_set_rate(clk, tbl->rate)) {
> +		if (tbl->rate) {
> +			bool can_set_rate =3D true;
> +
> +			if ((tbl->flags & TEGRA_TABLE_RATE_CHANGE_OVERCLOCK) &&
> +			    __clk_is_enabled(clk)) {
> +				if (tbl->rate !=3D clk_get_rate(clk)) {
> +					pr_err("%s: Can't set rate %lu of %s\n",
> +					       __func__, tbl->rate,
> +					       __clk_get_name(clk));
> +					WARN_ON(1);
> +				}
> +				can_set_rate =3D false;
> +			}
> +
> +			if (can_set_rate && clk_set_rate(clk, tbl->rate)) {
>  				pr_err("%s: Failed to set rate %lu of %s\n",
>  				       __func__, tbl->rate,
>  				       __clk_get_name(clk));
>  				WARN_ON(1);
>  			}
> +		}
> =20
>  		if (tbl->state)
>  			if (clk_prepare_enable(clk)) {
> diff --git a/drivers/clk/tegra/clk.h b/drivers/clk/tegra/clk.h
> index afa93ba505abf..103a6ed90a53d 100644
> --- a/drivers/clk/tegra/clk.h
> +++ b/drivers/clk/tegra/clk.h
> @@ -87,6 +87,7 @@ struct tegra_clk_sync_source {
> =20
>  extern const struct clk_ops tegra_clk_sync_source_ops;
>  extern int *periph_clk_enb_refcnt;
> +extern bool div1_5_not_allowed;
> =20
>  struct clk *tegra_clk_register_sync_source(const char *name,
>  					   unsigned long max_rate);
> @@ -800,14 +801,18 @@ struct clk *tegra_clk_register_sdmmc_mux_div(const =
char *name,
>   * @parent_id:	parent clock id as mentioned in device tree bindings
>   * @rate:	rate to set
>   * @state:	enable/disable
> + * @flags:	clock initialization flags
>   */
>  struct tegra_clk_init_table {
>  	unsigned int	clk_id;
>  	unsigned int	parent_id;
>  	unsigned long	rate;
>  	int		state;
> +	u32		flags;
>  };
> =20
> +#define TEGRA_TABLE_RATE_CHANGE_OVERCLOCK	BIT(0)
> +
>  /**
>   * struct clk_duplicate - duplicate clocks
>   * @clk_id:	clock id as mentioned in device tree bindings
> @@ -830,6 +835,7 @@ struct tegra_clk_duplicate {
>  struct tegra_clk {
>  	int			dt_id;
>  	bool			present;
> +	bool			use_integer_div;
>  };
> =20
>  struct tegra_devclk {
> diff --git a/include/linux/clk/tegra.h b/include/linux/clk/tegra.h
> index f1034e14c1a44..eaa0c4035c561 100644
> --- a/include/linux/clk/tegra.h
> +++ b/include/linux/clk/tegra.h
> @@ -208,9 +208,13 @@ tegra124_clk_set_emc_callbacks(tegra124_emc_prepare_=
timing_change_cb *prep_cb,
> =20
>  #ifdef CONFIG_ARCH_TEGRA_210_SOC
>  int tegra210_plle_hw_sequence_start(void);
> +int tegra210b01_plle_hw_sequence_start(void);
>  bool tegra210_plle_hw_sequence_is_enabled(void);
> +bool tegra210b01_plle_hw_sequence_is_enabled(void);
>  void tegra210_xusb_pll_hw_control_enable(void);
> +void tegra210b01_xusb_pll_hw_control_enable(void);
>  void tegra210_xusb_pll_hw_sequence_start(void);
> +void tegra210b01_xusb_pll_hw_sequence_start(void);
>  void tegra210_sata_pll_hw_control_enable(void);
>  void tegra210_sata_pll_hw_sequence_start(void);
>  void tegra210_set_sata_pll_seq_sw(bool state);
>=20
> --=20
> 2.54.0
>=20
>=20
>=20




