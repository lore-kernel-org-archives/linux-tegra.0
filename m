Received: from NAM04-BN8-obe.outbound.protection.outlook.com (mail-bn8nam04on2075.outbound.protection.outlook.com [40.107.100.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 046961D554;
	Tue, 21 Jan 2025 12:19:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.100.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737461990; cv=fail; b=qC94BY017achyBV5T2IRQFmtqShJq3wzISNGnh/WpVY7LQJDVYbY/bO7xlynmnN0w7Sm0MoPn+fdflVkatysfL+HfLFBCGdtPo11B3T+O23ZooLGEE4RksZSoa25z5exCSks64+z44HdB+erzSs8V/EYcOXACY/RQtzWbMOOt/Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737461990; c=relaxed/simple;
	bh=ZpojYE1JPH4M7ShLtvIIa1S6Bqd0iNClt9+qtNMS0es=;
	h=Message-ID:Date:Subject:From:To:Cc:References:In-Reply-To:
	 Content-Type:MIME-Version; b=XlThwoR5d8Ldccg3jIG5Sq8vKQ1HPRKq9of+9+Ob5Ixqxqcc9KuAcRBzVvzPhMvrKk5kA/eGx9SR8V/zPx5bOakqNiXCHW+Vlok/410WUdF8zCq8tVSLh9h1BiA1+a+/EQyZCYdrP5caXVyXKXhQ6euC8gEV7MSQWHMsCppvoqg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=J/BD+qfz; arc=fail smtp.client-ip=40.107.100.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="J/BD+qfz"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ggvh2nD7+jyncZg4tbpWT5sEd6nAbN9LHNizpi4FULm3YF+IXQinT3tzhQ5olUZs6BFjY4HtL4PH+G4j4o+rBXYkYMqGhjqETmdrVFj0bRcu9kCOX5ccyNgGQiTrGCy+05i1R3RQgc3L3RahQnnQ8sapcnFL/ut/rjfuVCRd1LgualJZOmCkegnU6aXQ5MIP9BaPTnvRnxvwDWVIrxv1a7MdByU9tbKmgFofhmRpZ70DtJo4SeGUZ+XOpbbOXEIChCBxnBvhjW2K823ITNM+XMCVeZgqMG+m5Y36AaPjD146O4Ezy8uXLEinYXQqrY0b4fi0z5zWtRTz8jnZ2RC0Ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ggYppapWX69ekISwgEp0Nd9N0+Gw8o2bnD95k1ldvkE=;
 b=OW3J8wiBvwu2FkqGMGFD4FDhkG1QV6hjcUqSpphXoKPzXBZD4MN2ZRdwwcBjdjiHdAKuZiRWN9yonQMTY+3LQO5wh77szkUyhizasFjjsIO3WmkXbenGWbaKufvB+bpNkKxmBQlexdOY/psl7vvfcBBp06VVb7ls6M0sXoLO9mBEPcurw5my/XJWxikFMVoZ8+yghHwvH5zDPcs6CuQgvxvF5M047hcKViTo0gLQHe3Tt6zbnIadLHccmo85cX+7e5PT71kIeW65RZBu/WqfYdgawqzO7SjckVA89SffbY50s50G8SmONZGIMk6ELLOR1AcavEjlaqDB790mJ+w3Bg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ggYppapWX69ekISwgEp0Nd9N0+Gw8o2bnD95k1ldvkE=;
 b=J/BD+qfzyZEo3JmZsjz4xV9lhYlYyTKIag8/HcGsq7CnarIfXsb4urI/VBb4e/Om1Y5Qvl7vnf6A0JBJL4s9rv5QA5pFl14cr8g4+gMhEmpnQ2sdjm0vlbmN4XlfsUt6woEUcXyAtnSzlt9din60zPIkhfIPPWLVW+tjMlnjrtAfW3xBV6nYtgE16RLlMR4RdkI341olFNN6y2qxDf2DwGrqWwgjs/OzG4e6B++3r4iX/8iD2bErMpxzeLDsUIuMi8EqSaFkSPNiLZJ6oVy4ynA6GTR28qdGM5zO69J64Z+m/w9PC4deJGwUOjNgBB0S0COtXtjAnh4IIzKdWFil6g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SJ2PR12MB8784.namprd12.prod.outlook.com (2603:10b6:a03:4d0::11)
 by PH7PR12MB5878.namprd12.prod.outlook.com (2603:10b6:510:1d6::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.21; Tue, 21 Jan
 2025 12:19:43 +0000
Received: from SJ2PR12MB8784.namprd12.prod.outlook.com
 ([fe80::1660:3173:eef6:6cd9]) by SJ2PR12MB8784.namprd12.prod.outlook.com
 ([fe80::1660:3173:eef6:6cd9%4]) with mapi id 15.20.8356.020; Tue, 21 Jan 2025
 12:19:43 +0000
Message-ID: <e3a457d6-092b-4b7a-9032-50daddab6f1f@nvidia.com>
Date: Tue, 21 Jan 2025 12:19:37 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] usb: gadget: u_serial: Disable ep before setting port
 to null to fix the crash caused by port being null
From: Jon Hunter <jonathanh@nvidia.com>
To: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
Cc: =?UTF-8?B?6IOh6L+e5Yuk?= <hulianqin@vivo.com>,
 Prashanth K <quic_prashk@quicinc.com>, "mwalle@kernel.org"
 <mwalle@kernel.org>, "quic_jjohnson@quicinc.com"
 <quic_jjohnson@quicinc.com>, David Brownell
 <dbrownell@users.sourceforge.net>,
 "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "opensource.kernel" <opensource.kernel@vivo.com>,
 "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
 Brad Griffis <bgriffis@nvidia.com>
References: <TYUPR06MB621733B5AC690DBDF80A0DCCD2042@TYUPR06MB6217.apcprd06.prod.outlook.com>
 <1037c1ad-9230-4181-b9c3-167dbaa47644@nvidia.com>
 <2025011633-cavity-earthworm-2b5e@gregkh>
 <3d9db530-a0b7-4f18-9ad4-233356dfe68c@nvidia.com>
Content-Language: en-US
In-Reply-To: <3d9db530-a0b7-4f18-9ad4-233356dfe68c@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P265CA0292.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:38f::18) To SJ2PR12MB8784.namprd12.prod.outlook.com
 (2603:10b6:a03:4d0::11)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB8784:EE_|PH7PR12MB5878:EE_
X-MS-Office365-Filtering-Correlation-Id: f36ab616-6bcb-4c29-ebc5-08dd3a15e2dd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|366016|1800799024|10070799003|13003099007|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dzBTTDZZdEVIdGgvSVNDdnF0SWR4VUpVQXFDYk9HenJia0RUMHlaZ3UrTkRp?=
 =?utf-8?B?emVBc05LTldTUURGbmN1dzFQN1NxUHM5TjEvcEFUQjBvMlpYQUZWRjgrTDZ5?=
 =?utf-8?B?M3UyZVlKU3VlRFlOQlpQM01xTm52TzVTc0YrYmxQbVUzb1V1dC9KOEo0eUJk?=
 =?utf-8?B?emtBWUNBRFJ1K1hxWjh5M3lzeVVSWStXei9uOGgrOXJ4MndoRE1oQTBaZE1U?=
 =?utf-8?B?bkpYOVFmcGRISUZJZ3hEbWlBRWtjZ1dPSTNoN1Y3S2NFTTJHWktQTm9iUzNC?=
 =?utf-8?B?Ynl0K1hmd0JkaG9qeXBVemt1bzA2QTF1NnRCdG9SOWhJanRNaFRGNnJnSGlR?=
 =?utf-8?B?ZDZOQnJoMGU0WE5nSmFEZ0JPaG9yTjEzd0xHU0lWNGJhcnJoOXBwU3VEYkNX?=
 =?utf-8?B?NnZPYjVqUjhxVFFkQWNPenllbFhkYTc2dlBFNURzMjFKUjRVYUtCMmFEVGdX?=
 =?utf-8?B?SHFzSTJyWDhjQmdWNTQycDFKRkNuM083OHBRcU9yYm5FcGorZ0JsbVNnNTE0?=
 =?utf-8?B?K3NLQmZmS3lUejRyZ29Ia0Z5Rm10aHlyYlBLOHFaRU51eHV3eFF4SnVHRDNL?=
 =?utf-8?B?Wlo3aGZPdVNKZTViVlpnWkFONUl4OU03VW8vdVIyRGJJMkJHVlJvdVdFeHBt?=
 =?utf-8?B?dmovYmNhcytjMjQzcVkyTjQ2dWd2RGkrZ3dvNVNGMC94dkpQVkQvdDlSdm9Z?=
 =?utf-8?B?TEdVL3V3WGsxdEIzZlNxRGs5bjJmTFFyRUlvOG81RHBPV0ppTElCbzNveERQ?=
 =?utf-8?B?ZHBPTE9XRGVKN0NhUU1lQ2xoSWxvQ09hSVlJUE10TDdDcnREUWplT29SekFm?=
 =?utf-8?B?L3hPMU52c1g5dWZ4TEs3bkF0NWxlSS9ybGhmUnNEQ20rL3pXdGF6dEtQdEtp?=
 =?utf-8?B?V3N1YVJYcEpoaHVEK3d4SEZVQzNWYXJVdmVxc0dscncyeDJSalFLMlJwWFlF?=
 =?utf-8?B?Z29mQ1lTSkZKbWRraUFnRGlhSVZBUW1JNUkwcjhQUTQzZDc0Rm9SWTBtQ3JW?=
 =?utf-8?B?SGRLYlkvMFdKUXFsQ3hUdVVuREc1M21ndkJYQjlvbHpGWmx6eVpXWi9ScnRU?=
 =?utf-8?B?RC9zQlJnNjhuU0RVTkZCTXdBQ093cTQ0T216R3huMGxsRGxXVzJsT0xBbDdJ?=
 =?utf-8?B?eng5dFJsdGgwUlk1MHZwVEtnUHRScnI2V01yV1dYRzZNQ1phbmN4Umo2VEFD?=
 =?utf-8?B?QmtSaGxScFV4YU5mb3VvTVZhZXNXUlBNZEFUY1V3UXNLdU5wNk11bDYvaEpH?=
 =?utf-8?B?alJwZ2FRN3JCVTgvNWhHVmE1MXZJS3M4REFOQ2NiL3RqR3RlTDVWbVloeXVy?=
 =?utf-8?B?RnFJYXVDN1pYaUZOZ1BUMWh4NU1HT01OeVl3dzFOR1RlZ1BHb2FHNGkxVmJL?=
 =?utf-8?B?UU9KTWNBazlQbkdkS2dDdFh3TUZQWWQyM1g1T3V0aDkvREVaejFJMC9QcXF6?=
 =?utf-8?B?STQ4eURLcjBjTWE2WVJGamlHV3ZTVFBUNWdKaUtxaFNhL29BaGJOZGFIbzg5?=
 =?utf-8?B?YkdkSmF6TzlYbmdySm9Hd01PdEJBQlNUQjJ4NDZ0SmlxU2N3aFRpWVJoUDky?=
 =?utf-8?B?Ky8zWndocDg2OEVzbWFLREZEdmdFbnpSdVkzd0ZoUE92NGJadGFGenZEcHNs?=
 =?utf-8?B?ZlE4SWc4emFDZ3o4SVR3azF4a3pZdnVvRUpYNzBzd3BBaWxPdTVIeWIxZ0Vh?=
 =?utf-8?B?OGcvNW9xVlJmZXpESzJnTlNFY0NFOE5ud2p5RGJyaklQekEyQlVGSXh3ekpX?=
 =?utf-8?B?T3lreElxVEpDWmE5V3BBYTdTQ1NiRVl2Y1UwU2tiU1Y0ZndjL1lFMnd3SUoy?=
 =?utf-8?B?R1ByWENLS2d5WHZLZGdBVHVCVTd1VkVPZHp4MlZidzRaK2YwVExnM01mMWc0?=
 =?utf-8?Q?NC4/TFBpiMuZx?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB8784.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(10070799003)(13003099007)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QzlFektsOU0rR3VpVy9Fa0lleXRFSzgwdmFydDF6ajd5SU1ETnFFdzBPRG5G?=
 =?utf-8?B?UlVRUkRKSDI4RE04WDRmeVFmeDVyLzh1OXM2cUFzTnQxckozRGhNUTZvQ1pa?=
 =?utf-8?B?ZUV5ZysySTZiTWJJeW1vbGNSbzRRcTR5RU1IVjdSNjZFN1NPait0dXM2dTQz?=
 =?utf-8?B?TTNKUUVVUlh5V2JvaDhHZGR2M0tjNFFQcHhDM2ZqeXFzdmRuMkZ3QTYrWHVi?=
 =?utf-8?B?T0tQZjVseDRkbHNMOXBRV1hDWlNLQ1BIZjBNc3lYSjBWV1Nnck4ySlBTNVY2?=
 =?utf-8?B?VWtTMVJrTzFXcGNBY0JyR1FWaThxcTVGZ3AzT0lKWDBVYTNzdVgxZUFqODQ5?=
 =?utf-8?B?RXcxTEFEeTFUdjdyNFd3T0g3YWUwK0htNlY2VWk3ME0wUEN5b25LSU9aN1hF?=
 =?utf-8?B?K2JqMjZ4Q0VRaWtkQ2dvaDgzS05VRjdtZURSRHRLZDVFVS8rNFV2OWFGUjN6?=
 =?utf-8?B?THhTSk1GRFZyVW1taVhlMTgrWDNwd01TVy9tS09VL2xIK3NGcnVxSENhY21F?=
 =?utf-8?B?ZlhicXZiRGVzcmlmbmlxQXlCdzRsT2NhWW9ZUm1mVmhObE4yazk4TUx5L0FS?=
 =?utf-8?B?WkFyczFqT1VxRndDZmI0cW9jcnFQY1RKdXJaTzBHbVJTY2I1SjRmTHNneVVN?=
 =?utf-8?B?Q0xEaWVoYWdKSlV6VC9qQm55Y05iZU9rS2MwMm9SejJHbHFjdG9MRGxJeWd1?=
 =?utf-8?B?cVpHbEU2eDBjcU1sdDBOMVZhcHJQQ1EwNHdBd2VRUXBEeGdPcTlmSGN2WEdB?=
 =?utf-8?B?MGtBcU5vajhuWk05eVQzZmpNa0t6NTI4TUxURWEwVEpGNVNmbU1NdjlwVXFF?=
 =?utf-8?B?NnhXaUlUWVo2d0ZqdGxkRlRjbzFVMUVjNjVieklEcEZXcWlTcFI3RTZZU2gv?=
 =?utf-8?B?bmlBRGs1R0FkZzVFTk01SEFBWjRmZzdqcSs3U2dqNnQzVmhIWkpIODI1RlFH?=
 =?utf-8?B?L1J1ZStlaTRGaDFKZlZJNXVkdHV6OTkyNzZJbGVla1RaMEJPTEFlNlkvWFNm?=
 =?utf-8?B?bmQwdHYrU29xb3c1ZEJralBkQWJXNkd1a0Joek11VTgyWTZTc1ptRFUrUHlm?=
 =?utf-8?B?dmxrV1l0T2xhaGl1QkZmaDYwbnBaWWI0UXVGY0h5OWtTdkozMlZVYmpRWWQ5?=
 =?utf-8?B?b0tSR29JSzYxb2xwOFQ3MW10UXRDcFdwL0gxV0lYSnp1VStKOHpwSFd1US8y?=
 =?utf-8?B?UUpEcjZxZFZmZ3VKVUFXd2d5am1xLzRwVEZSRmlqbEsxTkw1U1NiUHkyRXhN?=
 =?utf-8?B?dC9CWVVsb2l5TkZzNm41R1ZuWjhRZ0FQbEpQazdQY2Y4L2NTcUtQVGd0cURa?=
 =?utf-8?B?SDF4SmJDeEJ0U21EMExxTExNbE9KRUpGZDh3Vy9EWis5M3pmODY0WElnMGhY?=
 =?utf-8?B?UjNieEN2N0IzR3pBVnZtM0l0NnQ1bFZ0elZEWlFlMkNaVWNWbEI1dEw1T3Bh?=
 =?utf-8?B?dE1oV1pkQnYrTHJCYVR2SmozcUZydTZ6NTk1c2s2ajlWamFXUmRESjZRYWlZ?=
 =?utf-8?B?RkJUR2JyQmZlUTZBaHQ0a3E5dUljZHhFMDdUVUFOK25WdVZ4SDQrbmFlRmd0?=
 =?utf-8?B?bTNUd3dvR09TR010Q3AvQ2gybGtsOG1yclZjWTBieW13cnJXZU1QUmlseTA3?=
 =?utf-8?B?UzZRU2trdEEvSDNQQ1lLbU9YWDRBS2xHZmw0TXA1UTJxY1ZUeFAwZ2RGQWI4?=
 =?utf-8?B?T2ZjMERlc2RGWDhMOHBHWjVpQ2xWSldqZ1hVTTlsL3dST0pXK2taMlVzcVFQ?=
 =?utf-8?B?TTNsL1JvTjl5RmI3cVVNSXZSNERSdjRrUmMvNjlDRGhXNlB2MGhENWtkU0JQ?=
 =?utf-8?B?V1hWejhvYkMwZlg3bkJEbFRSdlJHZktXRVhjbFhOZzRJc3ZQZktOS01TN1JU?=
 =?utf-8?B?aDdJb1V5cU10a2ZMRjcvTEhaeEpDRlhubG1KbU1HLzUvWGNuUUZhbjA3QTZu?=
 =?utf-8?B?S0VTNVdoL0s4KzVYaFpjY2J0QXV6My92eExsOThzWHd5Y0pCeFZqWlJnYzBY?=
 =?utf-8?B?VWlnRVpwSnN5dHVoTmdPK2RDSElndkZXNGdqMFdTaFUrdFFrUWcrVVVTSUZs?=
 =?utf-8?B?d0Y4UnN3UXU3QmNkN2VBS3A1K1ZYaDN0RGxaRG9NcEFUYnhDdmpaUXpXNEl1?=
 =?utf-8?B?TjdUTERGVHVoTmFiODlVcXc4ODFHcHFqbDZmTTdlNEZkT2F0WjRtVks2R0dF?=
 =?utf-8?Q?SwKlo2zzy+Zw6r45O/7/+ZHPbiY3axiIgfoBfN8VggHq?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f36ab616-6bcb-4c29-ebc5-08dd3a15e2dd
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB8784.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2025 12:19:43.2795
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wE1E369bulXDKEvvLZD8iWJD326+WTv2dA+yYygtg6jVHehxYrP/yyUQcaKCtQV2bnibLU7BXpvXe003eWAWUg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5878


On 16/01/2025 15:01, Jon Hunter wrote:
> 
> On 16/01/2025 13:28, gregkh@linuxfoundation.org wrote:
>> On Thu, Jan 16, 2025 at 01:11:36PM +0000, Jon Hunter wrote:
>>> Hi Greg, Lianqin,
>>>
>>> On 17/12/2024 07:58, 胡连勤 wrote:
>>>> From: Lianqin Hu <hulianqin@vivo.com>
>>>>
>>>> Considering that in some extreme cases, when performing the
>>>> unbinding operation, gserial_disconnect has cleared gser->ioport,
>>>> which triggers gadget reconfiguration, and then calls gs_read_complete,
>>>> resulting in access to a null pointer. Therefore, ep is disabled before
>>>> gserial_disconnect sets port to null to prevent this from happening.
>>>>
>>>> Call trace:
>>>>    gs_read_complete+0x58/0x240
>>>>    usb_gadget_giveback_request+0x40/0x160
>>>>    dwc3_remove_requests+0x170/0x484
>>>>    dwc3_ep0_out_start+0xb0/0x1d4
>>>>    __dwc3_gadget_start+0x25c/0x720
>>>>    kretprobe_trampoline.cfi_jt+0x0/0x8
>>>>    kretprobe_trampoline.cfi_jt+0x0/0x8
>>>>    udc_bind_to_driver+0x1d8/0x300
>>>>    usb_gadget_probe_driver+0xa8/0x1dc
>>>>    gadget_dev_desc_UDC_store+0x13c/0x188
>>>>    configfs_write_iter+0x160/0x1f4
>>>>    vfs_write+0x2d0/0x40c
>>>>    ksys_write+0x7c/0xf0
>>>>    __arm64_sys_write+0x20/0x30
>>>>    invoke_syscall+0x60/0x150
>>>>    el0_svc_common+0x8c/0xf8
>>>>    do_el0_svc+0x28/0xa0
>>>>    el0_svc+0x24/0x84
>>>>
>>>> Fixes: c1dca562be8a ("usb gadget: split out serial core")
>>>> Cc: stable@vger.kernel.org
>>>> Suggested-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
>>>> Signed-off-by: Lianqin Hu <hulianqin@vivo.com>
>>>> ---
>>>>
>>>> Changes in v3:
>>>>    - Add --- line above the version tag information
>>>>    - Remove extra blank lines in commit messages
>>>>    - Version tag information from v2 to changes in v2
>>>>    - Link to v2: https://lore.kernel.org/all/ 
>>>> TYUPR06MB6217DAA095A9863D4B58D57CD23B2@TYUPR06MB6217.apcprd06.prod.outlook.com/
>>>>
>>>> Changes in v2:
>>>>    - Remove some address information from patch descriptions
>>>>    - Link to v1: https://lore.kernel.org/all/ 
>>>> TYUPR06MB621763AB815989161F4033AFD2762@TYUPR06MB6217.apcprd06.prod.outlook.com/
>>>>    - Link to suggestions: https://lore.kernel.org/all/ 
>>>> TYUPR06MB6217DE28012FFEC5E808DD64D2962@TYUPR06MB6217.apcprd06.prod.outlook.com/
>>>>
>>>>    drivers/usb/gadget/function/u_serial.c | 8 ++++----
>>>>    1 file changed, 4 insertions(+), 4 deletions(-)
>>>>
>>>> diff --git a/drivers/usb/gadget/function/u_serial.c b/drivers/usb/ 
>>>> gadget/function/u_serial.c
>>>> index 53d9fc41acc5..bc143a86c2dd 100644
>>>> --- a/drivers/usb/gadget/function/u_serial.c
>>>> +++ b/drivers/usb/gadget/function/u_serial.c
>>>> @@ -1420,6 +1420,10 @@ void gserial_disconnect(struct gserial *gser)
>>>>        /* REVISIT as above: how best to track this? */
>>>>        port->port_line_coding = gser->port_line_coding;
>>>> +    /* disable endpoints, aborting down any active I/O */
>>>> +    usb_ep_disable(gser->out);
>>>> +    usb_ep_disable(gser->in);
>>>> +
>>>>        port->port_usb = NULL;
>>>>        gser->ioport = NULL;
>>>>        if (port->port.count > 0) {
>>>> @@ -1431,10 +1435,6 @@ void gserial_disconnect(struct gserial *gser)
>>>>        spin_unlock(&port->port_lock);
>>>>        spin_unlock_irqrestore(&serial_port_lock, flags);
>>>> -    /* disable endpoints, aborting down any active I/O */
>>>> -    usb_ep_disable(gser->out);
>>>> -    usb_ep_disable(gser->in);
>>>> -
>>>>        /* finally, free any unused/unusable I/O buffers */
>>>>        spin_lock_irqsave(&port->port_lock, flags);
>>>>        if (port->port.count == 0)
>>>
>>>
>>> We have observed a reboot regression on Tegra234 (I have not tried other
>>> boards) and bisect is pointing to this commit. Reverting this on top of
>>> mainline is fixing the problem.
>>>
>>> With this change, when the board reboots we see ...
>>>
>>> [   59.918177] tegra-xudc 3550000.usb: ep 3 disabled
>>> [   59.923097] tegra-xudc 3550000.usb: ep 2 disabled
>>> [   59.927955] tegra-xudc 3550000.usb: ep 5 disabled
>>> [   80.911432] rcu: INFO: rcu_preempt self-detected stall on CPU
>>> [   80.917354] rcu:     6-....: (5248 ticks this GP) 
>>> idle=ec24/1/0x4000000000000000 softirq=1213/1213 fqs=2623
>>> [   80.927146] rcu:     (t=5253 jiffies g=3781 q=1490 ncpus=12)
>>> [   80.932704] Sending NMI from CPU 6 to CPUs 2:
>>> [   90.981555] CPU: 6 UID: 0 PID: 18 Comm: rcu_exp_gp_kthr Not 
>>> tainted 6.13.0-rc7-00043-g619f0b6fad52 #1
>>> [   90.981558] Hardware name: NVIDIA NVIDIA Jetson AGX Orin Developer 
>>> Kit/Jetson, BIOS 00.0.0-dev-main_92e5ae_88fd1_296de 12/16/2024
>>> [   90.981559] pstate: 80400009 (Nzcv daif +PAN -UAO -TCO -DIT -SSBS 
>>> BTYPE=--)
>>> [   90.981562] pc : smp_call_function_single+0xdc/0x1a0
>>> [   90.981574] lr : __sync_rcu_exp_select_node_cpus+0x228/0x3c0
>>> [   90.981578] sp : ffff800082eb3cd0
>>> [   90.981579] x29: ffff800082eb3cd0 x28: 0000000000000010 x27: 
>>> ffff0000802933c0
>>> [   90.981582] x26: ffff0007a8a1d700 x25: ffff800082895500 x24: 
>>> ffff800080132018
>>> [   90.981584] x23: 0000000000000014 x22: ffff800081fb7700 x21: 
>>> ffff80008280d970
>>> [   90.981586] x20: 0000000000000feb x19: ffff800082eb3d00 x18: 
>>> 0000000000000000
>>> [   90.981588] x17: 0000000000000000 x16: 0000000000000000 x15: 
>>> 0000000000000000
>>> [   90.981590] x14: ffff000080293440 x13: 0000000000000001 x12: 
>>> 0000000000000000
>>> [   90.981591] x11: ffff800081fb2388 x10: ffff0000802933c0 x9 : 
>>> 0000000000000001
>>> [   90.981593] x8 : 0000000000000040 x7 : 0000000000017068 x6 : 
>>> ffff800080132018
>>> [   90.981595] x5 : 0000000000000000 x4 : ffff0007a8a4f9c8 x3 : 
>>> 0000000000000001
>>> [   90.981597] x2 : 0000000000000000 x1 : ffff0007a8a4f9c0 x0 : 
>>> 0000000000000004
>>> [   90.981599] Call trace:
>>> [   90.981601]  smp_call_function_single+0xdc/0x1a0 (P)
>>> [   90.981605]  __sync_rcu_exp_select_node_cpus+0x228/0x3c0
>>> [   90.981607]  sync_rcu_exp_select_cpus+0x13c/0x2a0
>>> [   90.981609]  wait_rcu_exp_gp+0x18/0x30
>>> [   90.981611]  kthread_worker_fn+0xd0/0x188
>>> [   90.981614]  kthread+0x118/0x11c
>>> [   90.981619]  ret_from_fork+0x10/0x20
>>> [  101.416347] sched: DL replenish lagged too much
>>>
>>
>> Odd, you have a usb-serial gadget device in this system that is
>> disconnecting somehow?  That oops doesn't point to anything in the usb
>> gadget codebase, "all" we have done is move the call to shutdown the
>> endpoints to earlier in the disconnect function.
> 
> Yes the board starts usb-serial and usb-ethernet gadget and on reboot 
> when tearing it down I am seeing the above. As soon as it disables the 
> tegra-xudc endpoints (as seen above) the board appears to stall.
> 
>> I'm glad to revert this, but it feels really odd that this is causing
>> you an rcu stall issue.
> 
> Thanks. I can't say I understand it either, but I am certain it is 
> caused by this change.
> 
> Happy to run any tests to narrow this down a bit.


I did a bit more looking at this and I see that we setup a USB gadget 
device via the configfs as described in this doc [0]. The RCU stall 
occurs when we attempt to disable the gadget on shutdown by ...

  $ echo "" > /path/to/UDC

Jon

[0] https://docs.kernel.org/usb/gadget_configfs.html

-- 
nvpublic

