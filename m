Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2085.outbound.protection.outlook.com [40.107.223.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 233C0146018;
	Wed, 23 Oct 2024 14:09:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.223.85
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729692543; cv=fail; b=ghG/91QBvzJiyPUoqNyEFbq52Wx5gYholOCUY4Q5C2R4A4gEDQQgLWeMAyz2dVNUJXwsPvu4AecXjWgpI5FefvmT20rkl66nkqUV/qc6SRxLC/xQI+xebmNJ0qzXVw77hbcoprSAoFGEQAg4P5vIjRXhwkNImRkeuGCl2KyvNXE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729692543; c=relaxed/simple;
	bh=+0AXK4mDGoxGk9wvYMHgWNh3u1cCLzjY5VOB/kej+Es=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=nzNuFiWrTXuYVJGmx5Sop5cb4E5O6XxH5BappxAdX4iEXOnD9FnzdlNNxhUCPu9M5SRUeOp4BqnIkpdk89fnuyLMtfDAkkjvSKWEcCTTqPsYbU1bRavPeioaV1IQVhyqNrqn3WVnGtcQQhw4+CQ1OJ2FZZpjL2PpHJFeRuJCcMQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=rjY16N/A; arc=fail smtp.client-ip=40.107.223.85
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="rjY16N/A"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Aly9ULVv1jOcndx+4dZ08RP9DkRA6HCt/1N41OG3ZHX1+QSt7KXrCUDj5M0BBPe8fqcEkIyDGCdNHUC7z0FTaFHklEGzDiG0WD0GjcKLOOx25ybxhABSbz3mBQy/BCK6lHqD1fBpkp9w8kqqapFfcXr43Th/b5GH16xspnuKcYNOM2gIpG5FGAa8zaJKndbPFRSVXAbppvxAeJCZHhQFE2UNSTmavOPB4hLgg2iM4B0I9J1f4LXbXeS5X7jBaVrAvljVHcdoR7TGNs9Qyy6XTwT9OgblllX8I/O0H42VaIzZ4cp5+TSnRvUKCFm8SoYQEtm9d+llwwF0/rvwSvkCxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=op7zqPbYCMbUUz1WkjC/fGNhP+GHSNGQMw/IgTVzN/Y=;
 b=Ez65aM+PggPTlMHJCOyMIVJ/JJVFfuvnka/vR39kxv5VHBxBjZGcTNCn6z9Af9BpiuI7MCYMC/vMijZzgI7VB0pMTX/CQC/0VoYb86hDEiPuwhdbcpFtOxkDy697NyC5gL68kDAfezfh/u33bVNmAS9JCCSVrJ+ZJSbQVqgcsbNqPmkr6cCRoLPXnmaF4aMsGoYOcVxONEW+wbAKyNXAs41EeuskDnpugYgpsuw1pQu5GmL1XJF4d7T2Tk65pp9kEaulNRcpvrplmBKLEB/ulT+3LSmHj0Z879od9uXyUYQi6RzmICtAwpRjb8KtyNsi0dxoqqEz8QcirBOXrqcMaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=op7zqPbYCMbUUz1WkjC/fGNhP+GHSNGQMw/IgTVzN/Y=;
 b=rjY16N/A2as5POkj9TdsOwFXmc8Fgdr02eZsvsRb3NEocTLS9ebr2rBu1VerRu2zrgGwZ4T5wg4oPRhzEcrvXKFQwcOJO4KwOqRntikR+n2+Sup5/C/wxlNu3uAtXt+G8TsmJFIp9BVHxG574L1ofRjTpfGnNeKeCkVDW8h55IojK0sO61h2xgwQWgn/vnjj3sUEvRRAOo4t9OBI7t1IYnOEYyivH+L8vwhY/cDg3XDJGnTsngJQazKdQ/WsNc8fZlxogBSyo/+q+TERvbEs/WJZuy34t5nbTXQ8Ohrpm8t12DIDMux88NwCM+n73Pyo8kCcyL8Nnow78eVxJAV5jA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SJ2PR12MB8784.namprd12.prod.outlook.com (2603:10b6:a03:4d0::11)
 by SJ2PR12MB9191.namprd12.prod.outlook.com (2603:10b6:a03:55a::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.28; Wed, 23 Oct
 2024 14:08:57 +0000
Received: from SJ2PR12MB8784.namprd12.prod.outlook.com
 ([fe80::1660:3173:eef6:6cd9]) by SJ2PR12MB8784.namprd12.prod.outlook.com
 ([fe80::1660:3173:eef6:6cd9%5]) with mapi id 15.20.8093.014; Wed, 23 Oct 2024
 14:08:57 +0000
Message-ID: <5312c3c8-8e23-4f4b-88d5-3962f67da572@nvidia.com>
Date: Wed, 23 Oct 2024 15:08:51 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] driver core: Don't try to create links if they are not
 needed
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>
Cc: Saravana Kannan <saravanak@google.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J . Wysocki" <rafael@kernel.org>, linux-kernel@vger.kernel.org,
 linux-tegra@vger.kernel.org
References: <20240910130019.35081-1-jonathanh@nvidia.com>
 <2024091152-impound-salt-c748@gregkh>
 <d89c89f8-0036-44a4-8ffa-ea89ed576a9f@nvidia.com>
 <2024091627-online-favored-7a9f@gregkh>
 <b1b67db0-3b9c-4d96-a119-fe3fcf51b6e3@nvidia.com>
 <CAGETcx8E9FddpwMO4+oqeEc0RVMLbUOs2m+=B900xzrLvEkSXw@mail.gmail.com>
 <2c42677c-5e8e-4805-b6a5-0a5baa3e55b5@nvidia.com>
 <d9aadede-dfac-410a-b65b-e295c9a64951@notapiano>
 <CAGETcx-_z4hxyNSwT-D1MKNzAjOGSX+o7x5G8J0KkiUyy+RkDQ@mail.gmail.com>
 <8b4723ba-fffe-4616-8055-02a9cf6f2894@nvidia.com>
 <f979aff2-34f4-4f6d-bb9a-03a02afc4635@notapiano>
From: Jon Hunter <jonathanh@nvidia.com>
Content-Language: en-US
In-Reply-To: <f979aff2-34f4-4f6d-bb9a-03a02afc4635@notapiano>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO6P265CA0012.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:339::16) To SJ2PR12MB8784.namprd12.prod.outlook.com
 (2603:10b6:a03:4d0::11)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB8784:EE_|SJ2PR12MB9191:EE_
X-MS-Office365-Filtering-Correlation-Id: 75a55c9a-f852-4ac2-18b6-08dcf36c3bed
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|10070799003|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RkFzVFNKV2wvMGZQUkozbU1oU2lpcmFiaXQxQ01MWjhCZmN3aHoySEhXZEFV?=
 =?utf-8?B?bXRtVWtUZFlma1FpWisreks1UVNXV2FZVVB4K3poZFFZRjVKYXpDemp6NURk?=
 =?utf-8?B?bWNUd2RXYUt4ZXlxak9mSGl5YzB2SFVzb2ErcHBJLzI4ck9acGFFQ01kcmhq?=
 =?utf-8?B?cEtlV3hBaWhlVHVnaEdzQ0Zyc1JQYlRDT29jT3ZpOEw1SEhjelIvN3FqWjYr?=
 =?utf-8?B?eUF4VFZGQllQWWpnQUF1M1lBZmVBR3hPTWtLaHc3NDBzVHQ2Y25vOUd6K1hS?=
 =?utf-8?B?UG16UDZFdXZlanlHdml3M0lsVjU0dGtVRE9IUk5hTVJ1ZFZFOEhTUDZtdUlw?=
 =?utf-8?B?aUtUU0ZhRHU5cWlTeWNVWUprV2g2L2ZQU2FqVGFJSFdUVGVsa2svZ0tZbkp1?=
 =?utf-8?B?VXQ0ekN3WkdVSDczUG55azczUzBaVnptUmY4SDlVSjdhTTU5MDZuVG45NFR5?=
 =?utf-8?B?cTlmdWdnaDc5d0tPYjFVV0p1cGNUc1JKWXdsUDU4N1R3SXZzTmZPdzBoaTV1?=
 =?utf-8?B?VC9ydjgrcjZlZWROOHQvdk9XaFRWUG1CSXlydEJqZHl6aWJvU3Rqbk1yRXJR?=
 =?utf-8?B?ZkFVRXJ2eW9GdUJoYm8vZzVGM2I3eGVXeW8vUFc4VEV3d3VjMWJnbGdybjhR?=
 =?utf-8?B?Rjhjam5qMFg4aHNXWlRhZkd6U05BbVN0MXo0dTQwNFhEdG1qVllydXpoMlFY?=
 =?utf-8?B?M1E5YkJlaCtLeXdTZzd4bEptaC94L0FZYnNBL0tubmJ4alNmMGJKL0xJWUhj?=
 =?utf-8?B?WVExekI0NVQ2aVpWRjN2UGh0Sy8xUmFzWEh0cis5ejg3bE1ES2gxL0ZxTG83?=
 =?utf-8?B?UkJhb3JUYm5kVXVwQ0cxTGFEcWxmMGswQzZGN08ycXA1Q2Y5akx5OWJKU3pG?=
 =?utf-8?B?WHZ4V04yUGVTRWk1RUFIRGc4WnpuY2NnYXZWVXBQMVU5bGl2MExSc2J3UG5Q?=
 =?utf-8?B?WjQ3TG0zOHNZTHdxZTJkQ1lmdmhaeDRDMmxFYmFFS3JwOEFHa05SMHY4bHkz?=
 =?utf-8?B?MGUyMUZjSEp0YlFGTFpMRWg4dDM1eXRkd1BTWjQ2c2hyQXlSMFBvUlBwU1VR?=
 =?utf-8?B?ZG9Ib2hUNzM2VHRCd1A3d1FpRVl4S2JUbndBMDVPTlpJVHVXS3FEQlhwZzQ4?=
 =?utf-8?B?dXdQa2hBV1RuSjF6bTJKQW9adVlEQktnRElrTmxDb3JKQzBMZU5tUmtzRDdU?=
 =?utf-8?B?d0lFc3RVeVZCVE5sbk5sWG8vL0gxOC9CMERtc2J1WldCWkJ0OGF1T2tHVDhK?=
 =?utf-8?B?ME1EanFia0xhQnhFeTBkUjkvZ3hWSktkTmk4ZWc5eW5Yb0tkaWJybm9xUk1j?=
 =?utf-8?B?MW9BODJ1YnF4M3puUzZ4dlN1TDNPTFRQcUpiMW82ME9ESHQrNFhBclhCK0pQ?=
 =?utf-8?B?SGpJZXhkZ01vSDNDKzBNb1gyMWlIbHhGb3hnTEdsb0V4M2E0d093V1p6bExw?=
 =?utf-8?B?UHhQSHl1Y25BMENUWnFhVHkrZGRUdjVtbVJrS0lyQ01rdjZOeXpDbE5XU3dU?=
 =?utf-8?B?MTZRTFIzOEE5MEN4R2xXWWp5MGRoVUlzNXUvYjliSUkwMXZxWFN1T1BUNGZP?=
 =?utf-8?B?WlU4d2Q1ZjNWWTMzNURQZUEzNE13eStBVE9NeWIrRlJjQmZPalFQVzN2Q1d3?=
 =?utf-8?B?Z1ROSGJUTlc0N1Z1eG5TQlVUYkxaMFdEK1EwV3BBNnhNek1KZ2lkcWM0SWVv?=
 =?utf-8?B?V2FJdThpcE5YYmMxcjAvM2ZYTVBmNEM1NXN0QWlmQm1UM3I5dUo1RjVLU1V0?=
 =?utf-8?Q?rGfcaxgLyldKn38y+I2zsYZI+x6GFryT/8z1KUV?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB8784.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(10070799003)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MnQ3N0NkbFNJbFFXOWpTK084ak9lZkdpMldWQXN6bWtmODJVcU1mZFFrd2hW?=
 =?utf-8?B?SHBTYkZXVnAvTEdKREE0OU9kVVZ1dVM1UEhVdTYxZnFvSFJnZUVDRURsVDBT?=
 =?utf-8?B?eDNvYTdEeitEdXVNZGp4YVh2ZzlVUXc3TlpNVDBaMnRUNXQrOVA3SjdFVFlR?=
 =?utf-8?B?UmllcVo0U2hLeVFMZ0I0U0hCdFJIYlg4UVdMSEQ2dkRFeWk5RkhteHpDaTUv?=
 =?utf-8?B?SHhyRmM4M2pxZnBmbEFmVWhUZG92OTJrTVJZTG5udzh2TFU5cWhlWkxUR054?=
 =?utf-8?B?M0ZBSGtEdHZ6ZDJGOW1XY0hSSlJSaEZMK1F0MitJTGJqS0xhQzZySDg0bzdE?=
 =?utf-8?B?aUd3N1BRMW5hM0ZHaDBlWkl2dlBwRElyN3h2cDN2NDVOYjU4ZTl0OXdWR2Jw?=
 =?utf-8?B?Z3JsS2UwTTBiK2FZV2ZocHhtK2hKUWNHc051RVBoSm5FS3phS09aNHlYSnVP?=
 =?utf-8?B?L1pTRDhFRXNMc29vZ04vTG9CYUhDL0NQeVlZckdlSlhKblA0aXoyc2tZQ1BD?=
 =?utf-8?B?VU92QlQrR0NPM085YURxaWFWR0RteCtEQjk3b0NHZlZEMFR2NnRESEdtUFpB?=
 =?utf-8?B?ejdLMllyK1h3eWdzQ1ZxdHhwNGFBSlNWdS9iWkdvY0w4K1BmbVZ0OGVGajk3?=
 =?utf-8?B?WHZiNWJKNDNxeWJmSERDajd5U0MrS0Y3M1ZRVk5TQmU1ZkY2WkdsVGRUU0xl?=
 =?utf-8?B?TGdvK2tZZDg3VGdEaitVV2t6a3hIZlBHSHVOdnVnbFZUcFBTU2w0ZDFVNGlp?=
 =?utf-8?B?bmVWS2FuUHU1SnZSSUx4V04zVERVWW5PZ2xBZzNNeGtxMjQ1bTNUU2RuZCs1?=
 =?utf-8?B?d0R6L1Irb1VXR1JSVEExS0xab1Evc0ZDVDl6OExxcFkzWHN5TUJ1eDhaREY5?=
 =?utf-8?B?aW4wUWlFL3Vma1pZckdiL2IrRnI5VGtiNG5yUk9uOXNSUW94RDE5RTd0TjZQ?=
 =?utf-8?B?Yk1yQVh5SHV0UnZQZTdnTGptTlFnNU5BM25vZE56V1pvYUZza083Tk54aFQy?=
 =?utf-8?B?T1EyWUlsQ3JuWU5velYzbTdMeE84QjEvMzYxTHJ3amVTR3lVTDIrdFlhbUlt?=
 =?utf-8?B?ZTE2VHpPZkNRcEE1dHZmQUNSWjdVNzJ3QWo4aitBeGVpNnJVNFdTZHNEdFpW?=
 =?utf-8?B?REEzQW1Ra1RhQ1RBa0VZejRHS3NNVTlGVVV1eEJsYzVOZzkrT01SbXNtQnZB?=
 =?utf-8?B?dTg5UmM4b21rQU93dzQ1dy8yNmNwOGNGVUJyL3MzRFl6bE9xQW5ocEh2NDdi?=
 =?utf-8?B?QTNTWkUwZ3hYL1BEN2lYWXlCQ0pwY2d2eU10bjYrVzFsUXlGVXZTZkhkL1Q4?=
 =?utf-8?B?eTMyVU81eHdGWE1aaXBqeTFQTWFzUnNSNnh3MHFncW8xSjJSVTY0UTdiYkFP?=
 =?utf-8?B?SmZTeGVzcTdmUUgramZvNUZFSlVmTFIzOE1QVStjcXJsbzRmR0JOVTkyR3A0?=
 =?utf-8?B?WEExZ1lWVjY0N3dmYm9uTk1DdG1lUENmNkNRS2dIaXF6VFB5T3RPMnR2QWEz?=
 =?utf-8?B?dlg4REhER2xXZEVVWW9tQTM2ZFNXMnhnN0VYd2MyYmttTGoyVTFtcEZTeGpm?=
 =?utf-8?B?S1lFcWwvTm9uMHlsQ3NTVncxWklOeVZCK2d2SXc3QTRGamIvVzVVR2RsVm1y?=
 =?utf-8?B?R2ZOVGE3bnVtWnFScGdYVEI1QWdub1pCbXEvRWFHdmw2bVBUUjFubWhycTZJ?=
 =?utf-8?B?cEFXTlpweGRCMVp5SGROM0VmWDhTV09sN3I3K1NIc2FnZ1dIVStiSmFHelZr?=
 =?utf-8?B?UC8zRkpFLzNTQStuK2J5TlFVOFdvb2hDUHBoVks0dDFKZVVXcDV1b2xRRjky?=
 =?utf-8?B?UCthNVJ2S3ptdFZLVmgwTmFuUlEwS0JwU1Z1K0ZMSDFPRU1qL0Y1aE5rUTht?=
 =?utf-8?B?UFQweGFjNUZ6ZkFlUU96aFU3QkRCR2N5bkllaU42SUxpQkZ5M1BqUFIwdnpX?=
 =?utf-8?B?NEhHeDZiT0ZuUkRZaEpnNmxYSkdlUG1Pand6OENSTW1WYUM0Qy90aFh3STU1?=
 =?utf-8?B?Q3FpQWdIM0ZpNGxBeDV0MGNyank3T3ZsTWpYaFNZZDd3dmhOdjk0aU9mMmEw?=
 =?utf-8?B?UGdibFB3d0o2QjFac3UwR3hIVVJMOWJTU1E5WjRvcG1pTnByNWZIMUlSZEc1?=
 =?utf-8?B?VkRuZkhHMUlsYlJLOVNyMVR3UmRtY0Rya01SSEJYTmgxUE5ZRjJnTld0Sjlh?=
 =?utf-8?B?Q255a0pZdHUrZkk1aWsxRFFkOWV4Z3k5RDVtWEpxcTJTc3dmRTZOYkFONXJh?=
 =?utf-8?B?QjJZbC9UMzZmc002RS9KOHBicXlRPT0=?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 75a55c9a-f852-4ac2-18b6-08dcf36c3bed
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB8784.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2024 14:08:56.9932
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 52/1p2qSw5Pyedwm00uYCE182LWlVsBPooSwIPev/biOW0e0EhcLlvs9aXRX6v2nmRmmQZeHxWnzJ1XJydHHeA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB9191


On 23/10/2024 14:58, Nícolas F. R. A. Prado wrote:

...

> I'm guessing a similar change to what Saravana suggested for the
> of_dp_aux_populate_bus() helper is needed here:
> 
> diff --git a/drivers/phy/tegra/xusb.c b/drivers/phy/tegra/xusb.c
> index cfdb54b6070a..0a2096085971 100644
> --- a/drivers/phy/tegra/xusb.c
> +++ b/drivers/phy/tegra/xusb.c
> @@ -543,7 +543,7 @@ static int tegra_xusb_port_init(struct tegra_xusb_port *port,
> 
>          device_initialize(&port->dev);
>          port->dev.type = &tegra_xusb_port_type;
> -       port->dev.of_node = of_node_get(np);
> +       device_set_node(&port->dev, of_fwnode_handle(of_node_get(np)));
>          port->dev.parent = padctl->dev;
> 
>          err = dev_set_name(&port->dev, "%s-%u", name, index);
> 
> 
> As a side note, I wonder if it would be possible to detect these mistakes... But
> I'm guessing there are legitimate situations where there's no fwnode.


Yes! That does indeed fix the issue.

Saravana, let me know if you can send a patch? I would but I can't say I 
understand that actual issue.

Jon

-- 
nvpublic
