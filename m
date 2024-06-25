Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2063.outbound.protection.outlook.com [40.107.223.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 083BA53370;
	Tue, 25 Jun 2024 10:55:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.223.63
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719312942; cv=fail; b=QWjdmimm9vsw/pYV8JhH66ynE5S0mmDef9TtIt8+ZjsQyH++XniHeNxcMNGEn1onphBSONVQoywLcPwa3mcGQ7TIRUown8KHbZZUo81d+sJaaUpe4LWh5ZPoNdaSNRETkV9WdtlWtwVKcpca7xpeKvQCtWdBh/nWiD7OR88TRc0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719312942; c=relaxed/simple;
	bh=O/0AkdKIa/MrirQJ/Mmi6hTMbCkcEEaErzdeZ5nz8yQ=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=DJBXIC0vh8K2FCqHnYjM99qO76ZyscoX4HEu/zKLNAkr8xiXE6vB3ocmEDW5ihU88X+T2tND2iqsaR8lh6Ut3EsI3BAcLpN4FdtZafxZc/mHJ5+sLisLeckj5tq1EeiygDq1n1qdt6+iQg+osGIQeMZUguMspPbosKzbZlvPOVc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=jDTCStH7; arc=fail smtp.client-ip=40.107.223.63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="jDTCStH7"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ef/MySeUSXcFuvS6TSX8Qf1YtFVhu/Ba59pSgpW0z/LdCp8BWQt69wkdoEwE8LxAr3x4zhxvaTrqfRhbxo4400N41gEuWKEv9/aqjKYvc4srmkAhR39H/e/WDIgV+MrKhSwUbUVKJXMh/wDVx4Q5LAo9+aDk8/u3OCoCLHh4NlQwougoXyGaJnF29RLFuyzg+PA34MbLiL+qSor8k2/zOTCcusIQmtlST/9GsA+d3h+Fy2GIV+O7OBYecgbmJxmV7G4lWBNLyFkkrFcIAQSiczVP2EX5Sqlz+xOcDgIEzzqYzW+qVSWBo+ZsiIkggr6dSc551NfY2/KuxebKKEJH+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0G33whsvhjZMgGxeve7s55XgrbwDAD7UFLTmEHFWnMc=;
 b=iU/PHwdJcRcdRdY96JDCo+4+U7S0oNp9NUm690NMfGqhPbd9p2tEVGeckIUMGA2gVopUEQCT/s3N5dMaslpZQNpvifH4FIhhZ50NeAZzi0QXPeFiINEkpM/nJnhIEX+aSYuUZGpKDCTJ6wyJ17pO8qC8W3ooHLRA29TLDpyM74JijXwzuOgTD2FW3IMazD9mavbDQRHwfidG+/lyCdiU1ysgiZeNiIoMPUosiWwtpplTT3kAnyHb+zersK8aUTzxGmkXiG00d6ZbxNstaKVetaFK72vDH/jZxmPG0UFXuLrGgnXHP1SQ52za6Pn7Sj9jGtv/T8+8jfIO7wH0MFnIqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0G33whsvhjZMgGxeve7s55XgrbwDAD7UFLTmEHFWnMc=;
 b=jDTCStH7CZM8E+xsWr+pJSvdbpUaHsr1p7s4CthtJ2OFIzh++kCXC+wLjmzSFBhyhg2v+xyQBkmHQIvU2SmFgVmGQPfgelXDdQL7tFF5fV/DxwoAplYUlhy8xQshWcYLLVpUnE9A8VlUwRtxYhujqcDHiOMHHE60TtXIa5jXbS7QLNCmgRT6kkhKHdzBisEce3Af9QznnRDirl1xpptQNOVHTbStURJPemNXMkhdYtrFo3MzSqA156r3f9VHLH6qKNPSbEFPoNepzlNJuuD2W0AchLjpKvgARRCGLyFw9t+nB49xQkXj7vvc5+NPl4geZ0lUObIYsstVYJLUuXiKuw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CO6PR12MB5444.namprd12.prod.outlook.com (2603:10b6:5:35e::8) by
 DS0PR12MB8813.namprd12.prod.outlook.com (2603:10b6:8:14e::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7698.27; Tue, 25 Jun 2024 10:55:38 +0000
Received: from CO6PR12MB5444.namprd12.prod.outlook.com
 ([fe80::ae68:3461:c09b:e6e3]) by CO6PR12MB5444.namprd12.prod.outlook.com
 ([fe80::ae68:3461:c09b:e6e3%6]) with mapi id 15.20.7698.025; Tue, 25 Jun 2024
 10:55:38 +0000
Message-ID: <1f24e023-698d-4185-9d07-d86957df1acc@nvidia.com>
Date: Tue, 25 Jun 2024 11:55:30 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] usb: typec: ucsi: Only set number of plug altmodes
 after registration
To: Jameson Thies <jthies@google.com>, heikki.krogerus@linux.intel.com,
 linux-usb@vger.kernel.org
Cc: bleung@google.com, abhishekpandit@chromium.org, andersson@kernel.org,
 dmitry.baryshkov@linaro.org, fabrice.gasnier@foss.st.com,
 gregkh@linuxfoundation.org, hdegoede@redhat.com, neil.armstrong@linaro.org,
 rajaram.regupathy@intel.com, saranya.gopal@intel.com,
 linux-kernel@vger.kernel.org,
 "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
References: <20240625004607.3223757-1-jthies@google.com>
From: Jon Hunter <jonathanh@nvidia.com>
Content-Language: en-US
In-Reply-To: <20240625004607.3223757-1-jthies@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO2P265CA0133.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:9f::25) To CO6PR12MB5444.namprd12.prod.outlook.com
 (2603:10b6:5:35e::8)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5444:EE_|DS0PR12MB8813:EE_
X-MS-Office365-Filtering-Correlation-Id: 9a033a77-daf3-4ffd-1003-08dc950558fe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230037|7416011|1800799021|376011|366013;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SFdXS3hBbWhqeU5BU1hkLzVpZ2tDYUppZmliOC9vdGgzRkRUVHdTbnRwQzh5?=
 =?utf-8?B?TzdFeVAzSituTDdIUmoxRS9XY0Izb2xEUUlmV2JubTh3SmdyL1NXd0pwTnhq?=
 =?utf-8?B?dy9CWVRCNWkzbVBSVnZFTnpDVllmazBCKyt5cmgwa1dVTHdndjhQeHd5WmtP?=
 =?utf-8?B?T2tINmFWQlBadVFCS25rRkVMYjVvK1J2L1V2Z2ZueVViUFRaOWVldDZLWUdN?=
 =?utf-8?B?Y0dyOHZnUE1Vd092VUtzTXV5RytmMVdmNjNsUWVkZFNmTE5CdzRNaHRESFYw?=
 =?utf-8?B?WExWNFdYd3gvYngxR0ZrRjRyc1VKc0FBenR0K0J3cnpRdGlmaTA1Z2ljbnd3?=
 =?utf-8?B?NHdEeGdoMm5CQ3B6bDJKb0ZDdkRaczM0TE5vUGxaVE1vSjVlaFh0VmkyQVZq?=
 =?utf-8?B?YUcvS01HaTJkRnhEUXlDcGd3V1B1a0ROTkhMdGZ3SkVHOVY4MG5TM3Y3Ynh4?=
 =?utf-8?B?RHdURmdiNzFhQUt1MXJrZ0Jrc01Mc2dydmZXeXJoUFJYU3pzU3ZIQzlGODR6?=
 =?utf-8?B?UjY2d0RRczE0NWx2TzEzMWJCTkRjcEtXYkczNjJXemQzRzNNTkd5N2ZTcGh0?=
 =?utf-8?B?cENFQi9HNnZQcks4Q2JhRm9xVmdEcWZVMmNkc1pFSnA4NjJaekREUzVDS2xR?=
 =?utf-8?B?ZUVnSVA5Wm9aK3I3YmloQXFWa2tLSVA0UjR6MmRydlZMVlRUS3hOSzlOWVc5?=
 =?utf-8?B?R08zYjh0TUsrRERnK1dUZm1DV2tSOWtkYWtpaTQ2aEJCdDJ1MTFIWHM3WWdS?=
 =?utf-8?B?ZWRVZXNXbTM3MGdQUUFHNjFyTTM2Rzk3MzhJTVVOYVNYMVBqdkZnS3V5ajFy?=
 =?utf-8?B?RTZqaVNxODdoQUxBYWxpVFk5Q0JFTmhobWwwQitzTGE2VFZTUXE1dklTZVZk?=
 =?utf-8?B?WEhYRXpScCtmT21DYXpOZ3UxSVM0ekh5NThNcitJN2pBMTY2N1RFMUsvUTVP?=
 =?utf-8?B?Y3QrMUE2ODVwSnBwZGVVWFpaSEZNdHQwNmpCMkFYUGhNd3BNYis4TFkyOGZR?=
 =?utf-8?B?SjUwN2x4T1ZGRThZbEczS1hsQWw1UTJOdE9wMHlWcHhpQU1sRG5UVjVWbk42?=
 =?utf-8?B?aVBXeEp0UHVsNUZjdWM0RU5KUS9LeU9IVWNkR2FnY2tHQjFPa215RlJIaHg3?=
 =?utf-8?B?TElTV21PMXdKQkdwRHNLTXgzNXVRbTJCNFdOWkdaa0l1SVp6T29XblVUQ0Ur?=
 =?utf-8?B?dG1QUVkvSlJvMmIvQVg1Q2QyY2NyZ1E0Yk80VWJyVDJ0U0dsVjFCd24rYXA5?=
 =?utf-8?B?Y3JPYWt4c2J1Q1QxSy9oMzQ1VkYzZktSTWNMMFlFTnZKTzBETXYvM1ZpVkJU?=
 =?utf-8?B?L2pPMG83NGRNRTJYdTVtNUtMN0trUEtpbUpMbTlhMFAzOG1Eb1dhcmtXVGxk?=
 =?utf-8?B?WGVkcFlQMElacW1FdUl2SkRMTUNlMTg3ZGhDcldMYjNuOVd1RWVyd0ZsYWpx?=
 =?utf-8?B?TjhhL2hvdU05VUQ0OE1kVnAzdVBMOXFRc1pNcldnVFRIcHNUa0JNTkpZWnNI?=
 =?utf-8?B?VFF4TzNJVU5XRDhTOHU4SUUxMzJ5bFk4MHFGck1HMFRkNnY3R0tGOXFBUk9M?=
 =?utf-8?B?Slluc09WRU1sSkl3NXhwN2xZRkhKTDhKOWlYL3ljeURmRS8wU2ZmSjBvWXFt?=
 =?utf-8?B?bEhaYy9ZeDBDcXF0RmZHY1MwYnM5UEhUeEhzanNGd1g2QnNpYjJNU0RaRG9i?=
 =?utf-8?B?S0wrTDhneGF1NHpOcVRxM09rVk0wNWNpV1A4eEwxSHVhb3crWjZqV3M1VDRs?=
 =?utf-8?Q?wD+Axfxm4dNQg6BWuQmTsvl+4Bn9lWqKIEKb93m?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR12MB5444.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230037)(7416011)(1800799021)(376011)(366013);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dTZwQ1NqZmVzZHFBeEpQL09oWE1BOU5BcE9yZkNaYUQ2aHg0bFp1NzQ3dm9O?=
 =?utf-8?B?ekVGWUhCczVXd1JDUWxwZTNpVU1pWWZmeDJ5ODE5OERkbmh6NXJZMjYrbEJU?=
 =?utf-8?B?eEI5MFJpS1RtVm1qNHFGZHhjQjNwT0FJejltNmtqOFh5R3ZaNkRXS2F2dEEx?=
 =?utf-8?B?RTNObTh6dDFwVCtYSGR4ZHZMM0xNdVRlKzUya0EzYjJmTUhQeDU1RmVoT0Fm?=
 =?utf-8?B?eEhHTDlRSzhYNDlkaFFsc3pmS0Q3WTArbkg4K2hDNnMxUGlLZE9wZzdzR3lJ?=
 =?utf-8?B?TExlM0F5aXdvd0xhWHQ1WUo3RC9XRkNIdWsrNmZReWJodTNOaHo0UDFEcUVj?=
 =?utf-8?B?UWVMT01NM0F6dTVCN1Erdk1md1F1ZGF2WXF0ZVB2K1RHOUlMSGdYNGphNG1L?=
 =?utf-8?B?MzErVFNNKzVrYW8wSVhKM0VRd0JLZXdON3lQZ1FpQjRaTmhMU0RQZzloNDUx?=
 =?utf-8?B?b1FHOHYxK3dDQVc4cExpdVlMWmhuMnkrWiswY1REemFleHgwcjZscmh4OHR4?=
 =?utf-8?B?WG5OaGIrZ2QvRlZpcW9UUFI5VmJWTkM3ZVluUE1jbjBpb242NEozcngxR2tT?=
 =?utf-8?B?emhRbit4bFJTZEU2WnVrZXMwTjU1R3M2OFZCRFNZVlJoNWgxRzdLMmVyYUVt?=
 =?utf-8?B?UzhuZENvT2F1UmtZREpOcXJvdEhRZUYyTHozVE01aGZUV2V5d1dvUllVZFBw?=
 =?utf-8?B?dHFrUGhwM1NxNWFLYmlXUDg4YU9WZXJDVi9uSitNcm5CK2l4bTBlNVplbEdO?=
 =?utf-8?B?b0Fack5nL2xOSUhONTc5ZzhYU1p3VVRFeW1zQllpUmZLN0tOKzRoeFpRMk9E?=
 =?utf-8?B?VUtSamxEWlVUaGM4Q0F3ekkxR2tlOVpGMVVRSTNMeVdIc1RudlhRWExiYW5n?=
 =?utf-8?B?STZjajBkb0hQMmIvRFFwUnVoZ1krb2FoR0hnZGpBbklBejd5b296WjNNRWVm?=
 =?utf-8?B?WFB3bGlCZGk1Wmo2b29BS1NQOUJ6MVptTk1SQU54OVVJeTNmcXR5cTdVekhv?=
 =?utf-8?B?NEtiMnNIWGR2czNONFhadXY2aThZZnA0T0V1Z1JscWJ2cE5lSTJieWozSjN2?=
 =?utf-8?B?RGNpZlhhTFplbVFFU09sVnFabVdldjRrY2tpU2Q3K3Z4RTRlbGgxWC9TTS9q?=
 =?utf-8?B?cXNLY1BybE5mU0NWWEQvR3pCYnpXQ1RQeGNIRkpyZVVHZzRxa2g4clRJZ0xk?=
 =?utf-8?B?YjhOOStPYktXakE5amI5L2E2dzBUeGZ1U1hvc3lnT2wzNWp2VmwvRVBJUVNU?=
 =?utf-8?B?a1oxY2JVSisxWGNFak1PeUQvRG55U3RaSGVoUXVteWVDaVJyWFFZaHNZTFJn?=
 =?utf-8?B?UGxTbXZjS2xLakk3RStqNXkxVFgvdXBrWVV2T2FBaU1obHBOUGFwcnh0SDh6?=
 =?utf-8?B?UWQ2eU9SbytLSVpJWGlKbG9JZTgwb05tYVNiWklYWmxRb3hSVkY1bDlIOS9x?=
 =?utf-8?B?UEphK0h4QXlqV000T2VrbHQ3SVhmSGQ2UFk5RG14aGVncE1kOXRYSjNsS2tH?=
 =?utf-8?B?SVJpRytuem54dlFUL3JWYjZ3RitzTWRVRTc1aUZzajgwK2czbmpWSVN5Wm1Z?=
 =?utf-8?B?RWNsWjBzTTZsNm1IbmpwMnVZajFsaFk5VzYwTERMNHk2cTYrVFhWUlpQUzJB?=
 =?utf-8?B?SzU3YlVNZHkrZm9qcUoydTJrZzUzZjFORnNGckk1TmFQUnpTLzAySGkxSHFt?=
 =?utf-8?B?cm1xR2t2dSszWHFhMnl3Zm1mWjlYT1g2aHM4UkNXMWFGZkdHL3o5N1NHUjFD?=
 =?utf-8?B?STVVTGZ3aUtQQkt6bHNGM1o5V1lEeStYOEEyVU83T3V3SjY3MDVsc2NOWUkr?=
 =?utf-8?B?Qmd4Z041N0JKSjk2UkVDR3VrbGlsQXFSa0tHVEFUbk40Wkh5QUo1VnpJNU1S?=
 =?utf-8?B?c0N6TEo1KzdLWGsyUjZlQW5BU0p1OVpJa25FSDFtcUMzaWRKVkpSaWdZRjhF?=
 =?utf-8?B?RHF4dGk5TW0xZkljNHNwdUo5K2hiLzVoUVMvZlJ4VnozNmVlUWgzQ2NxaWZ2?=
 =?utf-8?B?UmJwb21GQVN2K0VoekF1a0M3OVB4KzZ4TkEzMkJ4cG5FY0ptRmNTbkk0UEFR?=
 =?utf-8?B?S1BTWjhoWjlLcFRxcDdmbDZTZG5Lc0tMaGZ2VGRHdWFJWGRxUDd2RE1vaFZY?=
 =?utf-8?B?MkxSdDFsNG1KMW5hMlJuSTJsdGJ0am9MSnpveG5aNHdwdWFVdHdoams4c29B?=
 =?utf-8?Q?co5kqmhRV8zq/Dgz+gifstQSqESD+SW96mSH+KYqQOjx?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a033a77-daf3-4ffd-1003-08dc950558fe
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5444.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2024 10:55:38.2603
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7E3aL+sTwLb5JMIMNkiHoWMMx/saroQahUhHP9Z5qv5LsRgDwBDnX3zzv3FPBxvO8pIBSAFnOnuMpo7CQ6sinQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8813


On 25/06/2024 01:46, Jameson Thies wrote:
> Move the setting of the plug's number of alternate modes into the
> same condition as the plug's registration to prevent dereferencing the
> connector's plug pointer while it is null.
> 
> Fixes: c313a44ac9cd ("usb: typec: ucsi: Always set number of alternate modes")
> Suggested-by: Jon Hunter <jonathanh@nvidia.com>
> Signed-off-by: Jameson Thies <jthies@google.com>
> ---
>   drivers/usb/typec/ucsi/ucsi.c | 12 ++++++------
>   1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
> index 76c48d873b2a..77e46bf4a098 100644
> --- a/drivers/usb/typec/ucsi/ucsi.c
> +++ b/drivers/usb/typec/ucsi/ucsi.c
> @@ -1180,13 +1180,13 @@ static int ucsi_check_cable(struct ucsi_connector *con)
>   		ret = ucsi_register_altmodes(con, UCSI_RECIPIENT_SOP_P);
>   		if (ret < 0)
>   			return ret;
> -	}
>   
> -	if (con->plug_altmode[0]) {
> -		num_plug_am = ucsi_get_num_altmode(con->plug_altmode);
> -		typec_plug_set_num_altmodes(con->plug, num_plug_am);
> -	} else {
> -		typec_plug_set_num_altmodes(con->plug, 0);
> +		if (con->plug_altmode[0]) {
> +			num_plug_am = ucsi_get_num_altmode(con->plug_altmode);
> +			typec_plug_set_num_altmodes(con->plug, num_plug_am);
> +		} else {
> +			typec_plug_set_num_altmodes(con->plug, 0);
> +		}
>   	}
>   
>   	return 0;
> 
> base-commit: 819984a0dd3606b7c46fe156cd56a0dc0d604788

Fixes it for me!

Tested-by: Jon Hunter <jonathanh@nvidia.com>
Reviewed-by: Jon Hunter <jonathanh@nvidia.com>

Thanks!
Jon

-- 
nvpublic
