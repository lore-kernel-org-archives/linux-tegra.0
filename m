Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2063.outbound.protection.outlook.com [40.107.244.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F34A51BD9DC;
	Wed, 30 Oct 2024 22:12:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.244.63
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730326330; cv=fail; b=aJ07dBzwV374TBEn2sfUTe2hO+MM4bET9pt8ANSXcHTiWrAIM1NaTFuUurlPDHzqDggKGanAkoDshQO7hmAm97dbEuWwyx5SgfFE8ycE0EfVVbYM/1TJN+CXl6lNLprs+/oz+4R9Cp6qlVP+dkatJyYA6Hc+ZwXR58Rhdez5IB4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730326330; c=relaxed/simple;
	bh=BAqUlVnSOln6cmOFZtVavu665sqzLxpIOxNL8YIko1Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=jv8itUeqtT5Q38gmrbBQOcqXFmHBh74XZxslM8cg9ylzcjIpYf4PxzxNyZH1sC0F7F+NbN9qx+hlGfRIdD8pLgvMTvKgeDZY/ODWNhyZisYgktcoGySIek025UVFbJ+hGfKuh21jsawvmxYu01jmzTpj+jnpP0TGMqGLLvAlSeo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Rnbjzbzf; arc=fail smtp.client-ip=40.107.244.63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Rnbjzbzf"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QqgwlRcYyhMsG1PietpfjB2juE4CBVGI8VWRZ90W6JM6pTvh6m+VeV1kRyXqYScJFdOdRVppMoJVvMwPn2A5uEzwgXm1phjv58KuKpoCmPmZ/Dsi/u7E4Jox8znurz2e7GNyBJbPk5LAtr5MuifmF0FUx2G40+AoHSKuq3UCoeJm9hcNv7zCmnQ0EbxhKC9OwQEptIvW1wCLY4edYQu8rA8GMuazQlK4cpbEv9dwvPqcik4y+uTBbk1RdsDg88QYDHO2B36r+d7zaWMHgt/Qts3wXVRLvMd7mIE0ANebWnWCzyrWz24MlrF4ampDYtXESRt524t8F1CPzu3gWPPQWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HtPTYxvC7BuGJZY5vvCQzfbMSJ6fkdtN4y+g9738k1k=;
 b=aOk6cybQ66xS03EQIRY9OXvVjGjnBu4tLNTBIOuhCDiU+C4uDB0IZax02NXPLl+tvIq70UnsJgqw8V3Cl1vfG0WJ5RP70S5E86Ak5gspJYho2+Gq0J5qZXk1cz6m65eqRkPQ4hAyPiBc/v68+IIScDKnecNx5kEm5yFoLhp/liNBb4HccjkiVLAlBNUFTgWc7qFhvxwPCLsPPDu/jTyHI7iPkvF/Gop1V5RGdd75WJtmK0gitHMg0bAqsSzIdThtMRNiD4U6JRJVt5t2GtrVfPMHIt1jN15R3zZwEPgiH6SP4K+dBg0wwVJ6xEfkbRQuJhlC1oTtF0y1ArIjE/7+kg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=arm.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HtPTYxvC7BuGJZY5vvCQzfbMSJ6fkdtN4y+g9738k1k=;
 b=Rnbjzbzfe7ZFgtCwJGTvHwh+2XBNeOt46FuV+HtZ3VOQGhJTc3qC6/knF/4H5hCp2S1jb0lcq+XQKoYnZFRekcJtICImNlXLkPYtJeP321nwA8JVCT1svLBF0pkcHBTxgsAFq7DrN9YKkPoG1+ydI574NeC0W1jlNyzm9HKxXhjTJ+2G3ZW6l3JvTrGrjgqwHohD1m57iSPuK24rjFqMBGH1kWVUtBvgXwoecqtknZAYqeuIA2BrZ0g8Op2pdbBsdYw9wWxNhyc8Be8PTh+ZxlC41oiQdsQqu75SrqIHd9gzYmCO/lCpSgByhuBEc07aHOOOeaC1jnF17VQIk4SLEA==
Received: from CH0PR03CA0109.namprd03.prod.outlook.com (2603:10b6:610:cd::24)
 by DS7PR12MB6239.namprd12.prod.outlook.com (2603:10b6:8:95::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.32; Wed, 30 Oct
 2024 22:12:02 +0000
Received: from CH2PEPF0000014A.namprd02.prod.outlook.com
 (2603:10b6:610:cd:cafe::8f) by CH0PR03CA0109.outlook.office365.com
 (2603:10b6:610:cd::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.17 via Frontend
 Transport; Wed, 30 Oct 2024 22:12:02 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CH2PEPF0000014A.mail.protection.outlook.com (10.167.244.107) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8114.16 via Frontend Transport; Wed, 30 Oct 2024 22:12:02 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Wed, 30 Oct
 2024 15:11:48 -0700
Received: from [10.41.21.79] (10.126.230.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Wed, 30 Oct
 2024 15:11:42 -0700
Message-ID: <f8fb4eb7-22ec-43a4-b3a9-ad84ca822664@nvidia.com>
Date: Thu, 31 Oct 2024 03:41:38 +0530
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v1 00/57] Boot-time page size selection for arm64
To: Ryan Roberts <ryan.roberts@arm.com>, Thomas Tai <thomas.tai@oracle.com>,
	Petr Tesarik <ptesarik@suse.com>
CC: Andrew Morton <akpm@linux-foundation.org>, Anshuman Khandual
	<anshuman.khandual@arm.com>, Ard Biesheuvel <ardb@kernel.org>, "Catalin
 Marinas" <catalin.marinas@arm.com>, David Hildenbrand <david@redhat.com>,
	"Greg Marsden" <greg.marsden@oracle.com>, Ivan Ivanov <ivan.ivanov@suse.com>,
	"Kalesh Singh" <kaleshsingh@google.com>, Marc Zyngier <maz@kernel.org>, Mark
 Rutland <mark.rutland@arm.com>, Matthias Brugger <mbrugger@suse.com>,
	Miroslav Benes <mbenes@suse.cz>, Will Deacon <will@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-mm@kvack.org>, linux-tegra <linux-tegra@vger.kernel.org>
References: <20241014105514.3206191-1-ryan.roberts@arm.com>
 <20241017142752.17f2c816@mordecai.tesarici.cz>
 <aa9a7118-3067-448e-aa34-bbc148c921a2@arm.com>
 <fed3b427-a600-4ce5-afef-4ccbfff64931@oracle.com>
 <df753b4a-0cf1-4544-b073-0ebf2bb71ef2@arm.com>
Content-Language: en-US
From: Sumit Gupta <sumitg@nvidia.com>
In-Reply-To: <df753b4a-0cf1-4544-b073-0ebf2bb71ef2@arm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: rnnvmail202.nvidia.com (10.129.68.7) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF0000014A:EE_|DS7PR12MB6239:EE_
X-MS-Office365-Filtering-Correlation-Id: e5040dd4-6294-4842-0ddc-08dcf92fe1a4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|7416014|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?U2ZyS016b0dIZlRCRnlHZ013YjlrYjhtV2ppMmxIamRNTlhTYUcvdWgyZzJ0?=
 =?utf-8?B?VWd4WHljd1Vyc3NkaDJ4ZTJ4S0JFZUQ0NkR1eEtFRDFWNEtxeUhsL1FLU1Zi?=
 =?utf-8?B?N3M0TXVkaEtvR2k5SWEvUWJ2dW5uUEhINThlZWZFbUJRV1F2eDh4MFNtVTQw?=
 =?utf-8?B?SFRGRCtqYUhXNGg4T3lObGJkQmZBUzZXdjc5TEJUWEl1TEorOUZmaFJaWG43?=
 =?utf-8?B?ZHcvMHUrN0RqSlpoQ3NUQzhVN2RZNkNaRGNuTkZjL0FiNGZBeTRqVVd6bDZP?=
 =?utf-8?B?c1ZmbXlnOFdDS2NDcmxROWcwaEsxNmh4Z3dRK0NsVkdyL3V1UDJRaFJRcUo3?=
 =?utf-8?B?NFZrUjFmdzBEcVYzbHF2TkplZ3BhSEFrb09FQmduUGFxLzUycHJvSVorYmpo?=
 =?utf-8?B?Qmp3blNsRzhXTFZXMFlCTTRCVkw5YkhjSVJPM1NRTFNicUtFeWY5UXZwYTFN?=
 =?utf-8?B?L0NYV0FYYSt4UXhrV0kvQlpPVVNXc2JYTTFnMmpPVVJpRmQzbzBtaVZJM25V?=
 =?utf-8?B?NlptdFNDRFpNeGU1dWNERkVQOGhXTGZyK2xtSWV1Z0lXbGx2TTY4dEJEeFdr?=
 =?utf-8?B?NHFaQTVQcWNERmNsWnZrayt0T2VDOG5oWGpJbHlBc0tZQ2s4a0E4MktOZU4v?=
 =?utf-8?B?WjFHUUYzcmxjck8xMVMyeFBzV2pTSDBOdkFUd3JVd05MOTRCU2RUc2Jqd0M5?=
 =?utf-8?B?WnRiYzFiMkVML1kyblZkWnV6dUNTU3JXRTFJNWIxSHRFOTZNU0g5N2U3ZUhV?=
 =?utf-8?B?cTBlWUVsU3JkTW9OTzhScGNZeGFZZ1JPK2VTSnQ3dXZWSnZmSVBmcUJaNlpu?=
 =?utf-8?B?S2lJU0R4Q0JleTl4UFduUFgweDdsRFBMNWdEdXlvRk1SdGdQZm15N2ZOTU9I?=
 =?utf-8?B?dCtjNU9ZTmRFd25DcHVHQnZ3OVdJY1Y4Tm5xenErakxkcFRycEQvaUhHeDdT?=
 =?utf-8?B?QWpuYW5aMFpWRkNrbE53R3UwTXdYRVFKR3F0SzhlaUZid1FrS2hvS0JhWVZ0?=
 =?utf-8?B?ajB6OUNOS3c5RVFDWGhoQ3lTaW9BVVg5TGNkTWZTRGF0a3FFQ2ZVQkplVHdz?=
 =?utf-8?B?cStQbTNITVIzK2hRN2laM3FLbUFCL2RMWXFBR2F6QU0zeUt2b244VE1xYlJU?=
 =?utf-8?B?TW5JbXBldUpWSTRFZmc4LzlxU1JiNnQ2YzVueVhBNzhqYmJ5OGtyQ1l4blkw?=
 =?utf-8?B?MmdQcXVBSnh5VllIR3IwMHFXbWUxV0NEWWhIWnBRWFA3Q3pvUDRmWXBYZTVB?=
 =?utf-8?B?L0llSkhNZDYveDJvbFlMSXRoQ2toYWJNKzM3eGxjTW9jaC9ZRHZSb1N3bzVC?=
 =?utf-8?B?dHdvR2l4bVN1N3R4Wi85R2ZnSzV0dzVlRmU3NjFXT1g0cEY5UDMvYTFzWkhY?=
 =?utf-8?B?R0Y5WGRvakFXQVhocVMvenhPK3JMeGtnU1RmblQrNWo5Und4K0hZM2I0aFBa?=
 =?utf-8?B?QmFpTmdHSXVNTmJLam01aDI3ZjR2R1I1aXhBNTgvOUpZb2RTNkF5b2twSnow?=
 =?utf-8?B?b0M4b3ZpRTU2ZnhRdlFZbys3ZjY5alllaThuTlpQcUhhaWZlNVZoNm1GVDl3?=
 =?utf-8?B?V3A1Qk54T21qY01wMXdqWnZZbUpIZnRyUG45eGM1S3JLdUxjZm0rS0xHbGdh?=
 =?utf-8?B?cDBwcmxPNHZZc2I5SmFQM0hqOGtOYXZmQVFDNndleGthNTNma3d2dDZRay81?=
 =?utf-8?B?eUN4TWxjYmpHU0pnY0s3TkR2SG9HQ3hXOEwreG14VEIzamU1cklaQkEzbnNo?=
 =?utf-8?B?YWh5TDN0SXRlM2g3b21FeXRraDN4Y3NudWdGakhoWDliQmYxemVtbVdvSFZv?=
 =?utf-8?B?ek8rWDFEcXpXZnlJZi9YcXFUTWFIWWFWU0RCQllDcWFGWHFMdUlvNURkVDhy?=
 =?utf-8?B?MDMvaVVVb2VvQUZzbUdxV3ovL3JjZlVtSi96cGJwbk14SXc9PQ==?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(7416014)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2024 22:12:02.2453
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e5040dd4-6294-4842-0ddc-08dcf92fe1a4
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF0000014A.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6239



On 24/10/24 16:18, Ryan Roberts wrote:
> External email: Use caution opening links or attachments
> 
> 
> On 23/10/2024 22:00, Thomas Tai wrote:
>>
>> On 10/17/2024 8:32 AM, Ryan Roberts wrote:
>>> On 17/10/2024 13:27, Petr Tesarik wrote:
>>>> On Mon, 14 Oct 2024 11:55:11 +0100
>>>> Ryan Roberts <ryan.roberts@arm.com> wrote:
>>>>
>>>>> [...]
>>>>> The series is arranged as follows:
>>>>>
>>>>>     - patch 1:       Add macros required for converting non-arch code to support
>>>>>                boot-time page size selection
>>>>>     - patches 2-36:  Remove PAGE_SIZE compile-time constant assumption from all
>>>>>                non-arch code
>>>> I have just tried to recompile the openSUSE kernel with these patches
>>>> applied, and I'm running into this:
>>>>
>>>>     CC      arch/arm64/hyperv/hv_core.o
>>>> In file included from ../arch/arm64/hyperv/hv_core.c:14:0:
>>>> ../include/linux/hyperv.h:158:5: error: variably modified ‘reserved2’ at file
>>>> scope
>>>>     u8 reserved2[PAGE_SIZE - 68];
>>>>        ^~~~~~~~~
>>>>
>>>> It looks like one more place which needs a patch, right?
>>> As mentioned in the cover letter, so far I've only converted enough to get the
>>> defconfig *image* building (i.e. no modules). If you are compiling a different
>>> config or compiling the modules for defconfig, you will likely run into these
>>> types of issues.
>>
>> It would be nice if you could provide the defconfig you are using; I also ran
>> into build issues when using the arch/arm64/configs/defconfig.
> 
> git clean -xdfq
> make defconfig
> 
> # Set CONFIG_ARM64_BOOT_TIME_PAGE_SIZE
> ./scripts/config --disable CONFIG_ARM64_4K_PAGES
> ./scripts/config --disable CONFIG_ARM64_16K_PAGES
> ./scripts/config --disable CONFIG_ARM64_64K_PAGES
> ./scripts/config --disable CONFIG_ARM64_BOOT_TIME_PAGE_SIZE
> ./scripts/config --enable CONFIG_ARM64_BOOT_TIME_PAGE_SIZE
> 
> # Set ARM64_VA_BITS_48
> ./scripts/config --disable ARM64_VA_BITS_36
> ./scripts/config --disable ARM64_VA_BITS_39
> ./scripts/config --disable ARM64_VA_BITS_42
> ./scripts/config --disable ARM64_VA_BITS_47
> ./scripts/config --disable ARM64_VA_BITS_48
> ./scripts/config --disable ARM64_VA_BITS_52
> ./scripts/config --enable ARM64_VA_BITS_48
> 
> # Optional: filesystems known to compile with boot-time page size
> ./scripts/config --enable CONFIG_SQUASHFS_LZ4
> ./scripts/config --enable CONFIG_SQUASHFS_LZO
> ./scripts/config --enable CONFIG_SQUASHFS_XZ
> ./scripts/config --enable CONFIG_SQUASHFS_ZSTD
> ./scripts/config --enable CONFIG_XFS_FS
> 
> # Optional: trace stuff known to compile with boot-time page size
> ./scripts/config --enable CONFIG_FTRACE
> ./scripts/config --enable CONFIG_FUNCTION_TRACER
> ./scripts/config --enable CONFIG_KPROBES
> ./scripts/config --enable CONFIG_HIST_TRIGGERS
> ./scripts/config --enable CONFIG_FTRACE_SYSCALLS
> 
> # Optional: misc mm stuff known to compile with boot-time page size
> ./scripts/config --enable CONFIG_PTDUMP_DEBUGFS
> ./scripts/config --enable CONFIG_READ_ONLY_THP_FOR_FS
> ./scripts/config --enable CONFIG_USERFAULTFD
> 
> # Optional: mm debug stuff known compile with boot-time page size
> ./scripts/config --enable CONFIG_DEBUG_VM
> ./scripts/config --enable CONFIG_DEBUG_VM_MAPLE_TREE
> ./scripts/config --enable CONFIG_DEBUG_VM_RB
> ./scripts/config --enable CONFIG_DEBUG_VM_PGFLAGS
> ./scripts/config --enable CONFIG_DEBUG_VM_PGTABLE
> ./scripts/config --enable CONFIG_PAGE_TABLE_CHECK
> ./scripts/config --enable CONFIG_PAGE_TABLE_CHECK_ENFORCED
> 
> make olddefconfig
> make -s -j`nproc` Image
> 
> So I'm explicitly only building and booting the kernel image, not the modules.
> The kernel image contains all the drivers needed to get a VM up and running
> under QEMU/KVM.
> 
> Thanks,
> Ryan
> 

Thank you for this patch set.
I was able to boot with minimal configs on Tegra234 board. Will enable 
more configs and discuss.

Thank you,
Sumit Gupta

>>
>> Thank you,
>> Thomas
>>
>>>
>>> That said, I do have some patches to fix Hyper-V, which Michael Kelley was kind
>>> enough to send me.
>>>
>>> I understand that Suse might be able to help with wider performance testing - if
>>> that's the reason you are trying to compile, you could send me your config and
>>> I'll start working on fixing up other drivers?
>>>
>>> Thanks,
>>> Ryan
>>>
>>>> Petr T
>>>
> 
> 
