Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11012049.outbound.protection.outlook.com [52.101.53.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D91ED18C2C;
	Tue, 17 Feb 2026 03:54:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.53.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771300482; cv=fail; b=VOC2uWS9BXrwWWBmDbQxbTUBAW2ULGSscvnpAxr+vfQvK0upv3XeNVJkWGn2THgMn/LZ/J0RmoNTJsGv1NiY9Y4MQFhKpXzibnOwbMZPdmRybdIJnjFMin3S8x9gHmQ2AdJV2Gv3v61dj2T0LUVHP3uTXIsZOl4KcPqZ8xhZIRo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771300482; c=relaxed/simple;
	bh=ZEnCHdevsxZbBXouWb4hbglsTCsWt0Wj4xFMPHyRAU0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=paqIAdSTE+4MyohUpLDO+/RfIFKhcuETYiF2awVwLuVUmThhMsjcr+E0H/kNQHj74d8NyVgo91gIeWPMPOGzGUy/DLLgAkqPVYX///1DeNjjh1lTmzJLiRazs39FV5OyQqpzpe09UqEzeGZRwfg9xoGqo4IjaU/y2UkUT1BABwA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=RFacZff1; arc=fail smtp.client-ip=52.101.53.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="RFacZff1"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vuBhr5Mp8co8IpXGf3ehLQCVO3KpCLl2yQ1PNF1fQQ2l5nWzy0reDs3eAgbkifb8W8gASl5Tvjgm+O2n0Q9nCDW3OYAV2NgswUTm88QSoHtSCTEY0gDCvy3+h08WIAODKvTamT5O5x548NNoFr+WmbCJ4A1u0AtqUxHmqRlycx0EjnqpANXq1TwpHMGlftJHHFAFGhWOMeif5zMr6mCnlCozxGVWxtufKDhoV2A7H+o/Ju2nnQdD8zgbNsGxKyK59LLNWDQIvsVMmBrCEgU0T0WJJGSazrZ2P+gzEAexz2wAGsB1PB49xJN/TTj/taQ4gMmOjDcMrg4sNE7aO4w2ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VzZEkR/USiedygNaucT8zMKreOISkquE/dgheJoKzvQ=;
 b=IXdLgL1JnePrdB/AwT/+lT7NWCytbiIVcBHEH2ZBl6dy12H9rq+1aBIToTaCwa3ogbZ4hAH/IFJQD/OdZagNrQTkPd01nSzEDvk1MaVIiykINJ1dSHJYYDz7bguUnkzV0axCkjSPaSW2sHNRf2tik6T9/68JZVRZ4YvZ2/IPics7ANgnBY2P4ksoA9CNqtY9Q9zRVLK6LCFgrYdfTxiKtSUogcThTb9PeQ566bTGozY2BbWLSMIXcr7bIvF+GUZCrwpYrL6MnMeqI3TbT86I5Br3qRxYEMZUJeZDPitd8dErd/6ZYRFSkKE5azjayAsdQlpDHCXHGXsNge2J18R4pQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VzZEkR/USiedygNaucT8zMKreOISkquE/dgheJoKzvQ=;
 b=RFacZff1PL7TclMuAakqJkxxBvgcOkG6TxJqQrI/MDlbGb42vmipD9cEcR4/q4s6444eui9bcn4if1mvrI6PFvRubDez5yV+isoakCd8RIVhETb8OVzbPe4yFC0/0oRSVKZ0c7j/0U9RkI4hczz+BZO5zqeuDw7xMFeCbZWB7pFVaEXfV90sj+ZrLACi0Xo8cBXEMRmLItz4gAlJRP6z0GqYtVbOnaY6fEy1XJLLgv1cAFj8FCbbYmc4Pm1RzKS4Y8gd1KDL/C1SbHh9fnz7dWW2yFktbkllbuwOrwij2Tn8riKzgxVIMTbnTmDi+uP6oXIOST/lGXiK7PUXWXIDQw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SJ2PR12MB9161.namprd12.prod.outlook.com (2603:10b6:a03:566::20)
 by PH8PR12MB6723.namprd12.prod.outlook.com (2603:10b6:510:1ce::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.16; Tue, 17 Feb
 2026 03:54:36 +0000
Received: from SJ2PR12MB9161.namprd12.prod.outlook.com
 ([fe80::d9d1:8c49:a703:b017]) by SJ2PR12MB9161.namprd12.prod.outlook.com
 ([fe80::d9d1:8c49:a703:b017%4]) with mapi id 15.20.9611.013; Tue, 17 Feb 2026
 03:54:36 +0000
From: Mikko Perttunen <mperttunen@nvidia.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Aaron Kling <webgeek1234@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>,
 devicetree@vger.kernel.org, linux-tegra@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] Revert "arm64: tegra: Disable ISO SMMU for Tegra194"
Date: Tue, 17 Feb 2026 12:53:54 +0900
Message-ID: <6462154.GXAFRqVoOG@senjougahara>
In-Reply-To: <5289895.R56niFO833@senjougahara>
References:
 <20251101-tegra194-dc-mmu-v1-0-8401c45d8f13@gmail.com>
 <CALHNRZ-YQe7_7UGfFNsBe6pdvFjK+1sS0Sye7od6WF+yqAYttQ@mail.gmail.com>
 <5289895.R56niFO833@senjougahara>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-ClientProxiedBy: TY4P301CA0023.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:2b1::15) To SJ2PR12MB9161.namprd12.prod.outlook.com
 (2603:10b6:a03:566::20)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB9161:EE_|PH8PR12MB6723:EE_
X-MS-Office365-Filtering-Correlation-Id: d6d16352-26bd-40f6-4fa9-08de6dd84426
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|1800799024|10070799003|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Zk4yMUFhWFV1bFBTa3o4UlNKem1uR1B2UitScU5remVVNXovMlhablNmL0Iy?=
 =?utf-8?B?dlllSlgvaEoyZjNGeG1ic3VFVlJhZ294MkYvU2RGcjhaK2FqRGFVcFpEa0JV?=
 =?utf-8?B?Q2RYMWVYUkZRQzc4VE1JYkgxcG9WczR2RHRYUTU2SVcyY29YdU5yK2VLU1gz?=
 =?utf-8?B?UXNlNDZEQkNGUHVEN09OY1ZCdS96V3dVUUk5QjR5cWJHT3BmNDFvOTBOMWpn?=
 =?utf-8?B?K1FReWQweEZzVUlUbmpScmI3M2VWYkhxU252Mlp1UnNyK1F1bFd6aytoUDBQ?=
 =?utf-8?B?WUZkLzRLbCt4S25VSm5ScTRsVEZ2enZGdE1WZ1k3WFdzcDM3ME5YZ0pCTGZR?=
 =?utf-8?B?U0RDWlF5a1pBR3R4UUN4d0tTYlFwZi8vaTJBanZHcmliTEsxVTdnWDMva29W?=
 =?utf-8?B?MHRjd05lYzZjdEt3UW1tWDFWSXEvWng0OUprVWh2Y1o2ZXRqMlM1UTI5SWxK?=
 =?utf-8?B?c1VNKzJ2SnNxeHNNc1lBQ1I5bHRmbUFjZ0tYZWEwYWxsN3lUZDQ5bVR0d2My?=
 =?utf-8?B?am0za0ZrZU8yN0xzaWhoaEZoZWxXcXJ6K0NwTVNIaUhWNnNNQ09ZMHgydUE0?=
 =?utf-8?B?Q3QvT0dudk1kYXNLOWZWWmc3cEdSbE04L24wTFphdS9aQVh4ZGNRMGthNUEy?=
 =?utf-8?B?VTBXbWRuODNKbGxwb3lleVc3TThENS9jcXl0aG1rZVdyNEpTeFNKd0pydjBO?=
 =?utf-8?B?QTdlcFc3cFl0L2pqWGtyV0lnSDVTbDVRbEZoMHBDai9yczBDRTRoSzJvakdZ?=
 =?utf-8?B?akRyc1hYM0hIVkRHS0JlSmlDb3RnVURQWXhKdk15ekhLNi91Z2dHbTdOTFpt?=
 =?utf-8?B?Q3RtMTRIZUdQRFI2ZFpnOTlxTXNnc0lqTDd5ZDBDQ01sZ1B2ZlVZcUxta0Ev?=
 =?utf-8?B?MmVXL3lESTUvcDdQSjBldk94aFY3ekNjVjJ3WDdrdlBJOGhQTzBxdVhZNFpQ?=
 =?utf-8?B?Y0pxKzFaTjZJenhqLzc5bjVFdUxtczJDTXRoY0VXeHM2N2l6L0RGaFNIcHBu?=
 =?utf-8?B?aXhhV1lGeUNuc0FxblNaYkNESG9oay9ZVG1HR25HMlIwaUF6T0JtMVk3M2dl?=
 =?utf-8?B?WWQyTi9LQzJodSt3bTVhV2VSYjRnekpIYlJveTNMOFNsWFpRV28ydno0V3Jh?=
 =?utf-8?B?b1lrU1hidE5CQTJBME9vQ3V6WDNPdUNPQ3RERjd4L21NdFFzeEdTdU02YUNP?=
 =?utf-8?B?dkUreEtFbEhmS2dEeENEUWdMNTFsMnp6U01udDlGZzFzbTIrVEJSZEF1aUxz?=
 =?utf-8?B?UXpNL0ZtMUl5NU1Tai9tKzN6UkQ3MmhQcklzaVFpTXdmWGVrVE5Bc3pYcHhv?=
 =?utf-8?B?SG9rUmZzZVVUTkt4a1Yrbk1uRllmSTViTklzZGR4bDRQNXpTQ2dvZDJRYUxr?=
 =?utf-8?B?UTBDVlBUblp5VXVlcnNrOFR6UVBWWC9NWWVyZkI3dWdOcDBGa2Zmbndjbnc2?=
 =?utf-8?B?ZmRhVmJWdVVoVEdYZzZkYTI2cVp3dFM4VlJkYUovekRaMlNIVzkybU9kaStC?=
 =?utf-8?B?L0ZsdktsV09HTzVuZmlRVFB4dks0L1hReS9ZTWVmNUpTVm9LTW9qblpYWmt5?=
 =?utf-8?B?VlFJcFcwYlZlclhGcUhWd2tsK1RMaEtzdXFpa3BDMDB1eXBGK3RVSXlEcTBx?=
 =?utf-8?B?YzR5YWovV09IaFBtaWlWdVBqL3g5Rm9vbUgvK0lQamxKOGRDdHNucFJZcldv?=
 =?utf-8?B?M2NpVTB5MFVXL3hQRmJLSy85V3V1RVNjMjBOZ081ektYY016eGE1ZGFLV0to?=
 =?utf-8?B?OFVXWmtHUVNwcmdMOFRwVWkxbjRNQWR1ZkhidnJiTm45TmRCa1U3citZekRP?=
 =?utf-8?B?WHFWMnJXSGRzQnJxVExldlBtM1lpNmQvSFFhS091ckloZ0tZdlFGMjQ3ZXYx?=
 =?utf-8?B?ajhVREprMnU0Tk44OElsZENFKzA4dmY0OXNLeWRtb3BzcGk3UlNwOWpmMHZl?=
 =?utf-8?B?bHVKQ2xoQ2xuQ1d3bWpuZ2hCSUZxS2VSbkREaHlGRkZvQnZFQ09sVmdQUXZZ?=
 =?utf-8?B?YnBqZWdHOEFCM21UazNTRXAvbDJyN3AycHdyb0FhdlNhOFZnaTNjeDBPQ1Vk?=
 =?utf-8?B?ako0Y3B3TDA0R0kvK2JUUU81bGFuUkY0Q0x1YmNLZW5UWlhnWlk0UzBlQVdX?=
 =?utf-8?Q?ziXw=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB9161.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(10070799003)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?N0cwaitaMDRMeHFaMzlpYmU2aWhySVBjaDdTc3JkQ0xuOXhIQnc3TEt0cEVO?=
 =?utf-8?B?ZXVsRHVBWVlMeWVHQ3ZDU2NkYTdQbEMyTmpYbTBOT1FZNEI5SW1IN1ZxV3RK?=
 =?utf-8?B?ZTgyOS90V280NlRFMTZpRHI4VWZUTFc5bEFQQXQyWVJGNThrci9LdkozYW9x?=
 =?utf-8?B?Z29lU2lya29RQTFqWDg5STEyZlMwUVR4TWRLZWpPRVB4UDVPY3pqbSt1SmZt?=
 =?utf-8?B?NmlkT0d6dnVKOW8rWktvM1FUcmVwR25xWXZJMkFTTjMwRmoxczZDVHYzVThH?=
 =?utf-8?B?TjR0bjZZekFUZ29SQjFnbldPeisrcEtvYnAyREZxYzBydUIvbEZxWlIxRTNM?=
 =?utf-8?B?NWVmUWRTQ21yZytkeXUvSnQ1clZpV1B4MndHbSt1SFNnVU0xbHgrT2EzeENR?=
 =?utf-8?B?RmlYMlB5bjV2aVAyZmNEZlZyQW5HWXE4bytKSnJwamZTZzBOdExHNTF0TGhP?=
 =?utf-8?B?MUZQUnIzb0xyRXZLU21rcVJ6RTgwYVVPMms0TVhIZG51blJwZU5Pb2pWU0hB?=
 =?utf-8?B?TTBUcTRpQjdVQmtUaE9HR3pWN1k4U2dYaGZVZmxTbnY1eDJBQ0tLYlJBcUZU?=
 =?utf-8?B?ejZZZkwwN1czYUp1aVcxRzJ4cFU2Y3UrUEkzSGFHYkhqSEhIL0VOVXZtNW85?=
 =?utf-8?B?YUt2RTRsMHQ4TWM3T0lESEMyek52YklaOUJDREcxZHBSL0I2WkFlZ0V2Vk41?=
 =?utf-8?B?b2hrU1JqOUI0TFlaSXVYVFVka055ZTFkWmlvOCtWUU5FTTZNZ0JaTDJiZ0ph?=
 =?utf-8?B?ZUF6QnUvUlFpbzdsRitKRFRwMys4VU9FK0hBUGdrSVh0Nk1IbnF6U0lCLzlD?=
 =?utf-8?B?WnJQb1ZPZmd3SDAzMGxQR2EyR2RXaGR4NEdBWUpuM2x3ZnhyQ3FSYk5Pb25D?=
 =?utf-8?B?VEFDNTRYMFVlazcyb2h5cXN0NVdzTmg4bHhIamZ5Vk9IeGFRaWx4SFhNKzV2?=
 =?utf-8?B?ckFsck82aWk0V1IyT1hTMkhlSkNkd2toNTdHVUQwM1U0N0lUYmNpSzQ3QU5W?=
 =?utf-8?B?dWJnNE4xTHRPK3N6RGZvejB2bE1MNy9remR5SmVQYXdGNVcvRU5QbjBQQWlS?=
 =?utf-8?B?MGsweEhHUWpDT3FBVVg2L0ZYTVM2TC9tMlRQUnRRaHV3ZFFCclVtaTAveUxu?=
 =?utf-8?B?dHdyOTMwQXNYVEtNeVFSOFZBNmoyb21mM1Y0L2d4cE03dml2c2Nha3ZIcUlv?=
 =?utf-8?B?RisvNDM5Q2MxYVZSQkJFbXlac3BzWFNRWERRTHVNYU1nVTV4Nk9QbVd4TS9J?=
 =?utf-8?B?WVM2c0dvQW83YWs3bm5EUlVKanpKNEt1T3BRSDU3eDNnMEo3MXZGRVJEa1lw?=
 =?utf-8?B?WTdmMnRyRW9hK2pqK0FIS0dFdVVxQ21QYkZraGdESGNoY1hnVmtUWHJrR3hI?=
 =?utf-8?B?UnY2V3ltQWU1aERDRUphR0hOT3pyZHpYbXV2SWNjTnFVWUV3TVlpclBoNHZQ?=
 =?utf-8?B?M0JaUVhCdFRrM3FMaCsvWm5tK1Fnd1BRMHBzWXVKQWJJTmNMOXlsZStZZTFs?=
 =?utf-8?B?S3dId1ZlVERyTC9uMDltTlhXN1R2UnhhQUNsQ3dSUVRIUlB6cFRIZkZyRFFr?=
 =?utf-8?B?NWtUMTg3YnlyS0lwTGJJTEx4S2VDRUFiTTRIMHB0TFNNMWk0SHFJR1RaQkR4?=
 =?utf-8?B?VnFUcEJ1cHh5dDlSZ2ZLejlld1ppd2c5WkNYUkwvckR5QXBiakp0Qk5lbjNJ?=
 =?utf-8?B?S1BrUDFZQ0ZqWmE3WC96OFNrSit4ZGZ2TGNUM1Q1SkwyUzZwSThtUEUrYndo?=
 =?utf-8?B?dTFQZWl5MUxGSVZpZzRQbjZoOUtmUTBuK3F1NHkrQndXVzVPb2RjRTA3ZkhQ?=
 =?utf-8?B?YlJ5cktXaVJEbngxY1ZHTXowV0pwRDFBSUtlYkFzUWhLSXNHT2hXeGRyTVpn?=
 =?utf-8?B?SWZPb0NYQW9YRDg4QTZHeTc5YnhadE5ZdFVQclc0djZrcTVvek1UN3dWaTFu?=
 =?utf-8?B?Y29TWXJ4Wk9Nem9zcGVUQkdJMzh2K3dDeVQxQWMyOEVEamFnc0MxSEtnSHJt?=
 =?utf-8?B?U3dhS2Q3allzdWJhSW12dHF0a3hLQU1pS3p4bGQyeEJOMVl1emQ3SDZrNWV5?=
 =?utf-8?B?NG1XRmhza1AvOEZvTng1NVRrK0QwdGxzeG5WMzRWRngydHQ2VUJYdjIvVTlo?=
 =?utf-8?B?RXFZWXRNOGlTVW9mZ1AvZnAva3IrdkdLVmk1MGxEL1ozSVk2QVF0bE1tWU14?=
 =?utf-8?B?eTNGMTY3dmEzelpscFdNQVJ2MlpTaWVQU0pucnJQazU5SURtL1VFWVJnOXor?=
 =?utf-8?B?TERZTHo2aTBMbUc4bXlzdUNOYzZKYnppcVBGZVpsSEQ0d0lObnErLzl1b0pP?=
 =?utf-8?B?aEloR0o1K1ZKaVQwOU9jUFh3cW9ZUkRFSEs3NmwwRDhEZmNXVENGRXl6dk9w?=
 =?utf-8?Q?CkZFnrWzWRiWAkvgMl3fL+r+19XafbVEBF+WDlxcda9jo?=
X-MS-Exchange-AntiSpam-MessageData-1: /2jHN79pS8raSw==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d6d16352-26bd-40f6-4fa9-08de6dd84426
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB9161.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2026 03:54:36.0005
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cYdXMCp84qfxgaMSXi3rtaT+gSSMQHIQLAfgjLFM8L4QJgYiEASpkWe4ysDJGjtIkrq750pjxakyoiEXO7q6+Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6723

On Thursday, January 22, 2026 7:22=E2=80=AFPM Mikko Perttunen wrote:
> On Tuesday, December 9, 2025 1:21=E2=80=AFPM Aaron Kling wrote:
> > On Mon, Nov 3, 2025 at 12:05=E2=80=AFPM Aaron Kling <webgeek1234@gmail.=
com> wrote:
> > >
> > > On Mon, Nov 3, 2025 at 5:07=E2=80=AFAM Thierry Reding <thierry.reding=
@gmail.com> wrote:
> > > >
> > > > On Sat, Nov 01, 2025 at 06:13:26PM -0500, Aaron Kling wrote:
> > > > > On Sat, Nov 1, 2025 at 6:01=E2=80=AFPM Aaron Kling via B4 Relay
> > > > > <devnull+webgeek1234.gmail.com@kernel.org> wrote:
> > > > > >
> > > > > > From: Aaron Kling <webgeek1234@gmail.com>
> > > > > >
> > > > > > This reverts commit ebea268ea583ba4970df425dfef8c8e21d0a4e12.
> > > > > >
> > > > > > Mmu is now being enabled for the display controllers.
> > > > > >
> > > > > > Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
> > > > > > ---
> > > > > >  arch/arm64/boot/dts/nvidia/tegra194.dtsi | 2 +-
> > > > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > > > >
> > > > > > diff --git a/arch/arm64/boot/dts/nvidia/tegra194.dtsi b/arch/ar=
m64/boot/dts/nvidia/tegra194.dtsi
> > > > > > index 1399342f23e1c4f73b278adc66dfb948fc30d326..854ed6d46aa1d8e=
edcdfbae1fdde1374adf40337 100644
> > > > > > --- a/arch/arm64/boot/dts/nvidia/tegra194.dtsi
> > > > > > +++ b/arch/arm64/boot/dts/nvidia/tegra194.dtsi
> > > > > > @@ -1807,7 +1807,7 @@ iommu@10000000 {
> > > > > >                         #iommu-cells =3D <1>;
> > > > > >
> > > > > >                         nvidia,memory-controller =3D <&mc>;
> > > > > > -                       status =3D "disabled";
> > > > > > +                       status =3D "okay";
> > > > > >                 };
> > > > > >
> > > > > >                 smmu: iommu@12000000 {
> > > > > >
> > > > > > --
> > > > > > 2.51.0
> > > > > >
> > > > > >
> > > > >
> > > > > Question for Jon as the author of the commit being reverted. The
> > > > > commit message states "we do not have a way to pass frame-buffer
> > > > > memory from the bootloader to the kernel". If I understand this
> > > > > correctly, this is talking about seamless handoff. What does this=
 have
> > > > > to do with enabling mmu on the display controllers? Seamless does=
 not
> > > > > work on any tegra arch as far as I'm aware, but Tegra194 is the o=
nly
> > > > > one that doesn't have mmu enabled for the dc's. But enabling mmu
> > > > > allows for better and faster memory allocation. My initial attemp=
ts to
> > > > > enable this didn't work because I tried to attach them to the mai=
n mmu
> > > > > unit, see the related freedesktop issue [0]. After noticing in th=
e
> > > > > downstream dt that the dc's are on a separate unit, I made it wor=
k.
> > > > > And so far, it seems to work just as well as Tegra186. Then when =
I was
> > > > > packaging up the change to submit, I found that this had been
> > > > > explicitly disabled. But I'm not seeing why. Am I missing some
> > > > > additional factors?
> > > >
> > > > This isn't seamless handoff to the Tegra DRM driver for display, bu=
t
> > > > rather to simple-framebuffer. While this does technically work, it =
also
> > > > causes a spew of SMMU faults during early boot because the firmware=
 does
> > > > not properly pass the SMMU mapping information to the kernel.
> > > >
> > > > In a nutshell what happens is that the firmware sets up the display
> > > > controller to scan out from a reserved memory region, but it does s=
o
> > > > without involving the SMMU, so it uses physical addresses directly.=
 When
> > > > the kernel boots and the SMMU is enabled the continued accesses fro=
m
> > > > display hardware cause SMMU faults (because there is no mapping for=
 the
> > > > framebuffer addresses).
> > > >
> > > > That said, we did solve these issues and this may not be happening
> > > > anymore with the most recent L4T releases, so it may be okay to rev=
ert
> > > > this now. We should find out exactly which release includes all the
> > > > needed changes so that it can be referenced in the commit message. =
I
> > > > want to avoid people running new kernels with an old L4T release an=
d
> > > > then seeing these errors without any reference as to why that might
> > > > suddenly happen.
> > >
> > > For reference, I have rolled back my Android usecase to use the L4T
> > > r32.7.6 bootloaders on T194 for a variety of reasons. So I am using
> > > cboot as the final bootloader and not edk2 as in L4T r34/r35. I have =
a
> > > pending cboot patch to support simple-framebuffer handoff, but haven'=
t
> > > fully verified it as tegra-drm is currently unable to takeover from
> > > simplefb like openrm does for t234. But all that to say that since I
> > > no longer use r35 for t194 I don't have the setup to easily verify
> > > which point release works here and what doesn't.
> >=20
> > Any further thoughts on this patch?
> >=20
> > Aaron
>=20
> FWIW,
>=20
> looks like the edk2 patch to update iommu-addresses --
>=20
> commit 6071946461389221d2314cbbae0377610b5b1f6a
> Author: Jan Bobek <jbobek@nvidia.com>
> Date:   Tue Mar 21 00:15:27 2023 +0000
>=20
>     feat(NvDisplayControllerDxe): update FDT with framebuffer info
>    =20
>     On ready-to-boot and whenever FDT is installed, update FDT with
>     framebuffer mode information, base address and size.
>    =20
>     Signed-off-by: Jan Bobek <jbobek@nvidia.com>
>     Reviewed-by: Ashish Singhal <ashishsingha@nvidia.com>
>=20
> is in since r36.2
>=20
> $ git tag --contains 6071946461389221d2314cbbae0377610b5b1f6a | grep "^r"=
                                                                =20
> r36.2
> r36.3.0
> r36.4.0
> r36.4.3
> r36.4.4
> r36.4.5
> r38.2
> r38.4
>=20
> Not so good for T194 since r36 only supports Orin.
>=20
> I'll look into getting this cherry-picked to r35.
>=20
> Mikko
>=20
>=20

I looked into this and it appears a version of this is in r35, but it only =
supports T234. However, I also found that at one point, L4T bootloader conf=
iguration has been modified to place the display controllers into SMMU bypa=
ss until otherwise configured by the kernel -- which the kernel does in teg=
ra_mc_probe_device.

I think that means there is still potential for an issue where the display =
continues to be on between tegra_mc_probe_device and tegradrm reconfiguring=
 it. However, I cannot reproduce that happening -- most likely the display =
is being turned off before that because of a clock or power domain being tu=
rned off.

In any case, this means that we no longer need to pass the framebuffer's in=
formation to the kernel. I think it would be good to have some clarity to e=
nsure the issue described above cannot happen, but otherwise we should be a=
ble to enable IOMMU.

Mikko



