Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2061.outbound.protection.outlook.com [40.107.92.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70EFD1D53C;
	Mon, 24 Jun 2024 15:53:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.92.61
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719244386; cv=fail; b=ZOy7qQTeHMlr0OsQrpmxHBRPMLIBFsf0NhrfnRYGFwUTn+yTXo1MoQGqcAtGRxR3RwxGBPQvqAmnlP1pC19c7BbtayL89led1HBm4q4KLiUl57DHW9zxD5sA/8HtGwZLT+bZmRojCHLWMhtbsLsjgoW2kgk7+9v/uDYXxKR8Zpo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719244386; c=relaxed/simple;
	bh=wfZFDa31tHhXL++v+DNbZ7ZYWKcOa91Yp8Jisp/I5LY=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=bKMf8Ecn7H90lvxLe8a+U928uoEMj9cPdgDpckH+WZCXlFabfjbjB8PSd6YNgwnixDsUWaI0r0Z7PbiMD/TGSy73V9NKqoSSiBa5m/neR61GpmcoFqunv/9wf7Nd5YeeBs7sW772rz7tUGQY0aZchi9f+Lp8YiMh+yxZTj8arbU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=UGCya0us; arc=fail smtp.client-ip=40.107.92.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="UGCya0us"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TrnFhaMFiwpd46+dQ7gmuBrg5io3O9LvLmb2zzWORlW+zQaHlKSjR66Fi9C5To+Ej9EWtA9auY3aCJlXTRhTx5t0wAHfs1dXLTTBXYgzBbFGRTURJds9fA8zDMTdZow2Af3S5Mg3zAqZs+X+QGQqSM+v6LyyC1YOzvAu0xnkF02p3rLtrhEt6eegDKgzkTIECCmKqeCytACHl5zFzvU62I8VMdBBqFW7HbwFK2PmD+2397+IHj1akUIS5z0Jpf+5Ywkg6uo0LGuDfdZxHBWktDQNQ8tcWgov3z0YmiIfohU+L/RzbBdqm/E8njp9qc3botcnLcpEKS7DZ5ed5EE9KA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1C334Glgp1JXrDuZnI7iG3D7/JUHOqdHpVeLvZraC9I=;
 b=LQJi6cEvYG2kIIK3m6KFjPS/rVFQCFx0au3CZESh73Te54hH/eqJWQMctidQfN7mDfNmBJ6T2nP5WmAqLDgNiNVV6dSxpI97ZPbpGQ6oX8mevBW31nyVLfpRe/n+A2rNwP8hMScGGJhQOHisdx8gEOmMWLnTz66uwmeB0RpdcafZKrH3xcu5yZ5bOdX3QoH7B5ggknkVaWjQ9kyV4bOfHAuRaYdMG5ksrbXN00IXOfLePVvOcnGjAP7Fnui+GBfG5fx7n623gdOSqpGGhOrTAvtW3vCjOilMQopUlQGECByBoEKSEJdoxkv83k1Arrtva1TCcZp1Y+3+IYNk9gOuOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1C334Glgp1JXrDuZnI7iG3D7/JUHOqdHpVeLvZraC9I=;
 b=UGCya0usTkimKmbano4nntLt8NPVVO11YLGLSmtaYzHOEbRR6qwFtGGMHhkpwgGR8BTJwK0A9C+oWTZLxQsh+uW1TSQgenBnTeBOxCLaRnOGDMo9eMP3wq51xIp1d2hlhrqx6ye1zx2/g9we2Fv+07pXa9F+tOF9QDlWP1YX07DC3J0/Cs+LnNj/x8m8d2ozSMlOlwIdK3uHpM3Exj2A8Y/o0hsSZcgTd84QAegfXk38iuTO0tLU3PRNLZsj6MCZhsfH4XbP14A1YGkVDeaLDDs0nGC7GQs3jqKs4cq3ISpWFfL0QAp+p7QjYKpUJLT9+2x2yM5tGkCJ+RxG7PTxkw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CO6PR12MB5444.namprd12.prod.outlook.com (2603:10b6:5:35e::8) by
 DM4PR12MB7744.namprd12.prod.outlook.com (2603:10b6:8:100::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7698.29; Mon, 24 Jun 2024 15:53:01 +0000
Received: from CO6PR12MB5444.namprd12.prod.outlook.com
 ([fe80::ae68:3461:c09b:e6e3]) by CO6PR12MB5444.namprd12.prod.outlook.com
 ([fe80::ae68:3461:c09b:e6e3%6]) with mapi id 15.20.7698.025; Mon, 24 Jun 2024
 15:53:01 +0000
Message-ID: <bc9cd446-5e19-41c4-a316-9eb362f2d190@nvidia.com>
Date: Mon, 24 Jun 2024 16:52:53 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 4/4] usb: typec: ucsi: Always set number of alternate
 modes
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Jameson Thies <jthies@google.com>, heikki.krogerus@linux.intel.com,
 linux-usb@vger.kernel.org, pmalani@chromium.org, bleung@google.com,
 abhishekpandit@chromium.org, andersson@kernel.org,
 fabrice.gasnier@foss.st.com, gregkh@linuxfoundation.org,
 hdegoede@redhat.com, neil.armstrong@linaro.org, rajaram.regupathy@intel.com,
 saranya.gopal@intel.com, linux-kernel@vger.kernel.org,
 Benson Leung <bleung@chromium.org>,
 "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
References: <20240510201244.2968152-1-jthies@google.com>
 <20240510201244.2968152-5-jthies@google.com>
 <21d4a05a-3f64-447a-b8e3-772b60ef8423@nvidia.com>
 <7b46779f-3f44-45f4-8884-2f9f625485ae@nvidia.com>
 <CAA8EJprxHq65mAU6a9iGD6Yus-VB2x3WP5Z8JWN1oUwn+zQDfg@mail.gmail.com>
From: Jon Hunter <jonathanh@nvidia.com>
Content-Language: en-US
In-Reply-To: <CAA8EJprxHq65mAU6a9iGD6Yus-VB2x3WP5Z8JWN1oUwn+zQDfg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0065.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:153::16) To CO6PR12MB5444.namprd12.prod.outlook.com
 (2603:10b6:5:35e::8)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5444:EE_|DM4PR12MB7744:EE_
X-MS-Office365-Filtering-Correlation-Id: cf652fa4-064d-456e-0985-08dc9465b9c4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230037|366013|7416011|376011|1800799021;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?b1VjQWJuUXYwTXNGQUdmUkEzRUJNb2RSN2szaUNLaStxLytRQmlJeUg3Q3ln?=
 =?utf-8?B?cUN5NTc3bUxZOTVMSkFvMlF6aGsxQmxGZGRhMUFENHc4dU94UExURWZGajVY?=
 =?utf-8?B?Vjd1UEZsQWJjM1lySDJpYWkyQVA4VHJxZm1hVWNldEVleVJJL0o0YzFpajds?=
 =?utf-8?B?YmJ4WWxIVldKcHRWWUdibGlXQ09kdjhoZVlMK1YxRkFCRGU1emZ5aXJrYU9F?=
 =?utf-8?B?NHBYMUcweWlUY0l0bk5jZXZobW5PQnRNSHZNREhmOVhlemJBYVJUTUtrNnlG?=
 =?utf-8?B?MWJxeTlMVHEyeXlqQUZLTms2a3pCbWtleXpJbjNoSVdkVTBON1dwR2NRaWhZ?=
 =?utf-8?B?N0E5Ri9UUEpjeDVYUUYzblVLY1dZZXR4bmRXc3pwWHBXY2xXTUFHZ2F1OVl6?=
 =?utf-8?B?S05mNDlkV1I5aXhwQ0RNalMrWXA3aUw5ZGpXNDFWb2ErYytzSGhRUWRtMzlH?=
 =?utf-8?B?aWtUenNveC9iSmN3RGt3cmZzTE9nSm95R2dGV0FrMjRadEJzbUEyTm5VTVVr?=
 =?utf-8?B?ZTVmb0V3L0Y3em1LNFJoanZEU2p6aFJ5eWRMVTlJa3A1NFI1aWR5ajcxV3Rr?=
 =?utf-8?B?MjJScDFFV2p6Wnp3VlZwM1kvTjJ0ZDlpMkRrZktic3UrdStiMTZoZGR4VjJZ?=
 =?utf-8?B?MEpWVS9aUDJacXdEc0g3S2drd1BQRG45eFE4VjE0WDBUWTMxWVQ5Rm03bjhr?=
 =?utf-8?B?d01tdDkrQ2EzVDYwKzcxTUlWMXJkcnhHQUVneVA4ZkluV2pzb05FK1hBUE03?=
 =?utf-8?B?KzhQaFZuaDIxNnFlLzdZaDVSdEkyeElvV2RlUElPOWhrQjZnZXZCZjE0bEIz?=
 =?utf-8?B?TGhJTGhraEhwcEVyRXc3UUNoQmd3OElTQWtmRFpLZG00VnZ3cVNrWFY3VGNr?=
 =?utf-8?B?Um5ISVdKcEhGRHl4OHJwVDAxNGpaeDRTbExqSGxYWmZJVGx0aUgwUTRMZ1Nz?=
 =?utf-8?B?UUtVRXVOK1NNQ1ZuY3FaRTNlemRQK0hsLzFKa3RIQVhlbVJseDlUTTdZNytL?=
 =?utf-8?B?KytVaWVkZWRCeHM5bXBnWmhDdEg3WUxuTHM4WlhNRTU0VzU1KzJkRk54VjFh?=
 =?utf-8?B?YjBlSzYyL0lvaDBReXY5WE9TRWZFWHlMVWJPc2FJcTJUL21leXRlVVFBRG9v?=
 =?utf-8?B?aWVZZHJ5VVdHcE8yYTQ1enlRTXdOdUdmM3RxUmNqU3dOTm0rd0Y0NXVJNFhz?=
 =?utf-8?B?S1ZGZzRwLzR1VFdRNno3eGF0MDRpU0dtOEdWdzhGV2xld3hMaWg1di8rTDVt?=
 =?utf-8?B?Y0JTU2tha29HRnl1M3cyVm9nME4yODZtajFHYWpjMVFwekVBUnJUL3AvYUYw?=
 =?utf-8?B?T1NSODc4Uk8vNXllZlJsOVJENE9HVXhlL1RlTGVQVUg2WHExZ3pwUFFjREdm?=
 =?utf-8?B?UVRmNEJKM0h6cGNsRmdaUGp5dUZWcjAyZjltSnY3VjUyZUhUZlRVZGtWQkhi?=
 =?utf-8?B?eGFOakE5OTFmVlZPSEp5NlM5cFlULzBzcjhPQzJTcm5GQVNoOExCQlhiclI3?=
 =?utf-8?B?V1RGWlBQeGw3dXBlM015ZXhRYjdNVXlpdXJhNm9xQ1AybzNNWlVqMzg1cUw2?=
 =?utf-8?B?VHhQcit5YXFpSlo0bXE2Slp4TEtGYzdhcTZ0aEQrcUtWZWhzRXNxNnBDZmNp?=
 =?utf-8?B?aWJyYTZydGxXUm40Qi9NbkVNd0xsYzZmZFNCbUsyZUlhVkhUOGdoamE0dkpi?=
 =?utf-8?B?Y0V2V0ZrZGpGNGhPTW9ZcEJZWEpKQTU0b01QUXNFRHRiSEwzUFNBVkdWU3Vv?=
 =?utf-8?Q?xhd7eIbhqJzDvKf+EsorwmPC/oscPL9jcZtq+dD?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR12MB5444.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230037)(366013)(7416011)(376011)(1800799021);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ME9oNTcwREo3THVPdzlWYjUxWVJkRkJpRTJXMU9rMldSWXp4clVSeUR2eGtR?=
 =?utf-8?B?V2JsdlNZVHdmQ0t3UFdjVHN4MG1FS2tuVlN3M2VuOWN3N3NNY0VKeG5VV044?=
 =?utf-8?B?ekFtRzd0NDN5MlU1V1psNUZIRWl1L1JVYzd3d0g3cm53a3VnMElrcG1CbGw4?=
 =?utf-8?B?NWhueXllK08vOG13dis5RzZDR1BpeXZCTUkxcFZIUDBzVjZINXl5WUxkZU9L?=
 =?utf-8?B?amo4bVQ3d0FMd2IvekxHZm82T2VpcGFvaTZUWjh4S1orbVBQbGRaV2JZczN1?=
 =?utf-8?B?VWIrQUdmcFNmNGxGQkdhQnJGS1crYTk4Y2ttNTJLTDFIWjBTSUR4eUF2OVhZ?=
 =?utf-8?B?V1BVUXRHTnhneW10MFVhaUhDMUpIRSswUXJzNVltTlJld2p1QzRCZWZJMTZp?=
 =?utf-8?B?MU00VGVWbXR2QU5WTTlEYUs4dVVMRDhSWnNETzR0ejhmMzllM0VvM1JxRGdG?=
 =?utf-8?B?czdFWGZMcVlCSHliOFpyM09mQ0Z1VmJWQWhHQVFHWEd4cU9tVFUvMmljSUpw?=
 =?utf-8?B?WmZ3RlY5Sy85ay9BSTlHUWtGa3ZBYlZ1ZFpGMVl5N25IdVNKcTN4ZTY3ZllP?=
 =?utf-8?B?UDVmK3EzR01mbkc3WVdvQzNOc3dNOU50ZG43Zi9MKzdRalBpN3FtL1JjOXRT?=
 =?utf-8?B?SlBkUTRlR3duZmhxWXp2VUZ0K1JhRDJ5d0pjcnNNWjMwcklzTEpPSlNmVVI3?=
 =?utf-8?B?NnJVMVJOWHFSWkkzbjh3Ti9BZVdIQW1UWElCK09UalB2c3dRWm15bnNmbU5T?=
 =?utf-8?B?aWR1UWROMTlhTnRSUXZuUzhMdWxuWVdPMDBTSmcrUGpqQ2Z6YUpmVndVa0kx?=
 =?utf-8?B?RXVNeXVEeVFZbUgrTndoVkJWSytXVVViSi9qWjQzVFRpanRMQWJjY2lCWWU3?=
 =?utf-8?B?TUM0Z1RpUWtmRzY4OVYvQ3MwQXBvdENEaUtvV2JOdjFubEE0T0VNb21oSnNC?=
 =?utf-8?B?TkVnT1lXd0tZNUpuNkt5L1F6aGJWL3BnaWR6RmlMb21oTGNraFI0Rm1ENnpv?=
 =?utf-8?B?OWduSWtuMmRaLzJ4cHl5c092WHVVTlRXMU5yUllwSWgwc3hVMUd1ckdDdFB1?=
 =?utf-8?B?M05kQXFiWTl0a21Wa09Ob3pNb3psQXc2dk5uRU1FWW56WTVjd05hN3c4MnNu?=
 =?utf-8?B?TUVMVUtDS0IrVFJHT1d0WkY4MTVjRlVBcVVOZktiWmhETlFJN0Y3NEVKRzNu?=
 =?utf-8?B?ZzlPejlUVVRKWjEzaWhzTm40aVN0ZmhvcFYyU2s3elhZOGRLODNlUDdROWhp?=
 =?utf-8?B?SFY5cFBSRzg5MnlwV25Jb1duQUZPczdwR1kzL1czcHZBemp4eGtqM1FCeWRO?=
 =?utf-8?B?QmV6NjY4aVcvajg2cGxOSWxweXU3aUlIOWw4ZmNXM014cmJSWDFnL3I4QVRs?=
 =?utf-8?B?RFhRdVNScEpaZWNWUTAxS3lWTmxYQUJJM1N4UGU1aTZSRlBFT29zVXgyY09l?=
 =?utf-8?B?V2xPd0RNaUhxTVhKNFRiWkpkYmlqT2dTS2ZDcTI4N1BNbmhhdkxHc3RsdkQ4?=
 =?utf-8?B?NGYwMWV0Ny9ubENUdHBwMi9rRTcyekwxQ1JYUkdFTFRieEd4VGsyZkp1bzFj?=
 =?utf-8?B?djJJaDhpck9nTmJyc0pueDNWVTJWQ1Zxbk16NllvV0M4d01ZQUVHSVdlSGg4?=
 =?utf-8?B?RmJRZ2N2bDhHaUI4T2FDL1Q4RHNrNzl3cmQ4MEo2NzV5VHB6REJndFBzNzZB?=
 =?utf-8?B?bnF3MVl3QzVjZjliTTJFOFVDbmxBalM3ZmRDaHFwNmEyRFEwbTNZcVBNR09B?=
 =?utf-8?B?eFB0TldPNVZKNTQ5NmtWa3g5S3orUHFoNzZIVXhjWnl0QVNMeklqZmlsdE5j?=
 =?utf-8?B?ZHc0eC81R3FRZStXVUtkaWpyMkVMc3JhZzkrcndEYW4xYnNCK3lxMXRJekNF?=
 =?utf-8?B?NUtDM2xOSndKSlhPQjloTWkwS0wrT2lLVzhFOUVpY0p0REp5S09XMmpOVWg4?=
 =?utf-8?B?RlVpaHF0TDNEL25zSGQ1WnpwWGM0dkhtL0VnOWFhWlpiMzhrUTNvQXVWZjZx?=
 =?utf-8?B?eWZ5R0xQR0NRYy9rMmNXWnliUEI3aGgrVU0yNE5YQ1htUXhoNTdCVjRMRHJZ?=
 =?utf-8?B?NEdLSk95TkIrd0JjNEV2WHZUWEFSU3ZzY1FPOXlRcDNsSnBKSi9VbzRObWhi?=
 =?utf-8?B?ZkZreEhKUm5BcEZvTjhhMU8zaDJLY2JvckppaFo0NjFORXlaOVI5ZkRQZGUx?=
 =?utf-8?B?aVNnWjFUVWpKTW9odWtxV0EwLzBJZk1QNlFmdDFEY09vZ0NHNlAyb1B6VGg2?=
 =?utf-8?B?TnZIb3BqZFMxcEpzY0FqeE5sSFdRPT0=?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cf652fa4-064d-456e-0985-08dc9465b9c4
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5444.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2024 15:53:01.1622
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NDpsiKVoAW4bAGUUv/9yrVkZVN2d3lk294ngDDwedK8m97ZHov+jZAoBNaNuGs3uajxNW3zC5JAjWm3ptaNazA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7744


On 24/06/2024 15:33, Dmitry Baryshkov wrote:
> On Mon, 24 Jun 2024 at 16:42, Jon Hunter <jonathanh@nvidia.com> wrote:
>>
>>
>> On 24/06/2024 13:51, Jon Hunter wrote:
>>> Hi Jameson,
>>>
>>> On 10/05/2024 21:12, Jameson Thies wrote:
>>>> Providing the number of known alternate modes allows user space to
>>>> determine when device registration has completed. Always register a
>>>> number of known alternate modes for the partner and cable plug, even
>>>> when the number of supported alternate modes is 0.
>>>>
>>>> Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
>>>> Reviewed-by: Benson Leung <bleung@chromium.org>
>>>> Signed-off-by: Jameson Thies <jthies@google.com>
>>>> ---
>>>> Changes in V5:
>>>> - None.
>>>>
>>>> Changes in V4:
>>>> - None.
>>>>
>>>> Changes in V3:
>>>> - None.
>>>>
>>>> Changes in V2:
>>>> - None.
>>>>
>>>>    drivers/usb/typec/ucsi/ucsi.c | 14 +++++++++++---
>>>>    1 file changed, 11 insertions(+), 3 deletions(-)
>>>>
>>>> diff --git a/drivers/usb/typec/ucsi/ucsi.c
>>>> b/drivers/usb/typec/ucsi/ucsi.c
>>>> index bb6e57064513d..52a14bfe4107e 100644
>>>> --- a/drivers/usb/typec/ucsi/ucsi.c
>>>> +++ b/drivers/usb/typec/ucsi/ucsi.c
>>>> @@ -812,10 +812,11 @@ static int ucsi_check_altmodes(struct
>>>> ucsi_connector *con)
>>>>        /* Ignoring the errors in this case. */
>>>>        if (con->partner_altmode[0]) {
>>>>            num_partner_am = ucsi_get_num_altmode(con->partner_altmode);
>>>> -        if (num_partner_am > 0)
>>>> -            typec_partner_set_num_altmodes(con->partner,
>>>> num_partner_am);
>>>> +        typec_partner_set_num_altmodes(con->partner, num_partner_am);
>>>>            ucsi_altmode_update_active(con);
>>>>            return 0;
>>>> +    } else {
>>>> +        typec_partner_set_num_altmodes(con->partner, 0);
>>>>        }
>>>>        return ret;
>>>> @@ -1138,7 +1139,7 @@ static int ucsi_check_connection(struct
>>>> ucsi_connector *con)
>>>>    static int ucsi_check_cable(struct ucsi_connector *con)
>>>>    {
>>>>        u64 command;
>>>> -    int ret;
>>>> +    int ret, num_plug_am;
>>>>        if (con->cable)
>>>>            return 0;
>>>> @@ -1172,6 +1173,13 @@ static int ucsi_check_cable(struct
>>>> ucsi_connector *con)
>>>>                return ret;
>>>>        }
>>>> +    if (con->plug_altmode[0]) {
>>>> +        num_plug_am = ucsi_get_num_altmode(con->plug_altmode);
>>>> +        typec_plug_set_num_altmodes(con->plug, num_plug_am);
>>>> +    } else {
>>>> +        typec_plug_set_num_altmodes(con->plug, 0);
>>>> +    }
>>>> +
>>>>        return 0;
>>>>    }

Looking at this some more, the plug is only registered in
ucsi_check_cable() if UCSI_CAP_ALT_MODE_DETAILS is specified
for the Type C controller. The Cypress CCG explicitly clears
this flag.

The following will only call typec_plug_set_num_altmodes()
if the call to ucsi_register_plug() is successful ...

diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
index 134ef4e17d85..e268af88a7d2 100644
--- a/drivers/usb/typec/ucsi/ucsi.c
+++ b/drivers/usb/typec/ucsi/ucsi.c
@@ -1176,13 +1176,13 @@ static int ucsi_check_cable(struct ucsi_connector *con)
                 ret = ucsi_register_altmodes(con, UCSI_RECIPIENT_SOP_P);
                 if (ret < 0)
                         return ret;
-       }
  
-       if (con->plug_altmode[0]) {
-               num_plug_am = ucsi_get_num_altmode(con->plug_altmode);
-               typec_plug_set_num_altmodes(con->plug, num_plug_am);
-       } else {
-               typec_plug_set_num_altmodes(con->plug, 0);
+               if (con->plug_altmode[0]) {
+                       num_plug_am = ucsi_get_num_altmode(con->plug_altmode);
+                       typec_plug_set_num_altmodes(con->plug, num_plug_am);
+               } else {
+                       typec_plug_set_num_altmodes(con->plug, 0);
+               }
         }
  
         return 0;

>> It is crashing because 'con->plug' is not initialised when
>> typec_plug_set_num_altmodes() is called. Do we need to add a check to
>> see if 'con->plug' is valid in ucsi_check_cable()?
> 
> Yes. Either of  con->calbe and con->plug can be NULL.

Thanks for confirming.

Jon

-- 
nvpublic
