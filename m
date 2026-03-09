Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013045.outbound.protection.outlook.com [40.107.201.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1692938F225;
	Mon,  9 Mar 2026 10:20:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.201.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773051648; cv=fail; b=hMG3AfF1zl1oFb7H8LxxFrgOjl3JNazniUIrjkAj43KOYVLlN3Bg3EBmBXUCoYoe9KVbYKAQBNEvlrhsr0uj+24mFgtPkcj3YnNbWOAtjDjY52oZ8Go6k/zWk1bB2fFw2EmkW9DoBkuuRtL91yJnTumuqkdiB9EsgbklYL++V3U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773051648; c=relaxed/simple;
	bh=6SNCgZlFhHmT4Pw+wfn7aycdC0xceyDa4dtU8W5gZmw=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=WBN3fVUMCUrsFBVsyqGnhQXtYtjfj28tfbsHw/djpBBuD205s2MaGn/KX1AwVJFZz1aBpQhLCbi1JCptgHL3hmVaSXUG3mL0MOsXluHZB+ia+wD500ySN1WcZCMSsQYmCigGlmxtk7pPKX9H0Y6y55ux2Vg5I9i4YcOCPgFqZhg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=WAx1jNLL; arc=fail smtp.client-ip=40.107.201.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="WAx1jNLL"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vfSFdNLAetdB6rg+PBzGPgPtNNPKC2p3SpJREpG1iB8p3R315WytLLzaihk6QIVWWEHCjwG1LxhoymzsCaoep4F7n4J+XK9LpuKWNHHCk8DtTQBLs6U3CLayPATqpwx4MGqLoml8Q3EO2d3C+r69G6yzJNW6sO7BZSnPFLlUWBwZRs8avT5VKnqDg8Br3xXfWs4oIV/B4V2UXzZsu967AyaLuxT+eQRE/V8E6fAGlsDJUR4Wdu8WnW/r+vCv+9p8IZAyasmCzYH53JQjuEL6l6p2Ryv3UcZ4xKhJZaw04N6aF6r7eswBOa1LepJUquxG2gz8R+xx+A9kq7LPkKXZSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x5rvdbqMhtUuJU0I6F91DOm2BMyy/BxJXEM91GutoiM=;
 b=QfeHjA3VZWUmR3qWYPu2au+Bws7M8v8xPLfsgFQ33WlMx2JJMt4tdqJIYqpY7dvEkcPotEYl6VM5JS86gpnE6/gVfghUF/3EbpZD53uvIRxkHgrb/RGwDQG0Ckoz/R0rnncfNK6Xju98rZaQ1+9Lqz7pdRJ5h3B76eYGqefsIV+1SKvi+ZZyelxFlGJHFf4es8EfktQRChm5lbf8ejD7/NVbPl+EffUFUzoXt4CThe+t6cvQCNu2/UfTOHmu/ZP/CEk6fP3xeBK6nktAVvW13Rn71/7GXoYJgHsdXy7etQiaIjzjNIOCgveIi/1goEhqSWpmz8mIBBzL1BsmPaARNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x5rvdbqMhtUuJU0I6F91DOm2BMyy/BxJXEM91GutoiM=;
 b=WAx1jNLLNfg1UnGUV6JLpmIoPxXrLx9jPnve8p3JJVLSoTNqAKoLPC4pTH2vjQGunrt1Xx3bGoAj7Xrf8coLR14tNFei++EUB1Avm/sFuGRwqJb4IljVDEWht8w5b91dVKMMKZwwprPwhpCtVHeY8cz8ol5n2uRzmewaQEQe/1fW0z6RtzVsjyiuaQh8AREnEFnuIMCXIry5k6UzeeCz6OFmZbmIdXDiMuzYhHuOMi2Qx5ZDRXrZtwkENoOo4MrSskFkXhLgHVAzAl3TGUz9k/UsGc1M2abYMjxo2KsiFTVP0HgLGlrxthn5+e8h1C33Ubw34YE4H+xeKjbOZB1kQg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS2PR12MB9750.namprd12.prod.outlook.com (2603:10b6:8:2b0::12)
 by CH3PR12MB8188.namprd12.prod.outlook.com (2603:10b6:610:120::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.11; Mon, 9 Mar
 2026 10:20:43 +0000
Received: from DS2PR12MB9750.namprd12.prod.outlook.com
 ([fe80::56a8:d6bf:e24c:b391]) by DS2PR12MB9750.namprd12.prod.outlook.com
 ([fe80::56a8:d6bf:e24c:b391%5]) with mapi id 15.20.9700.010; Mon, 9 Mar 2026
 10:20:43 +0000
Message-ID: <89e20554-8a99-40e0-8b4d-2160b364cbc7@nvidia.com>
Date: Mon, 9 Mar 2026 10:20:38 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] usb: gadget: f_ncm: align net_device lifecycle with
 bind/unbind
To: Kuen-Han Tsai <khtsai@google.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Felipe Balbi
 <balbi@ti.com>, Prashanth K <prashanth.k@oss.qualcomm.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Andrzej Pietrasiewicz <andrzej.p@samsung.com>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 stable@kernel.org, "linux-tegra@vger.kernel.org"
 <linux-tegra@vger.kernel.org>
References: <20251230-ncm-refactor-v1-0-793e347bc7a7@google.com>
 <20251230-ncm-refactor-v1-3-793e347bc7a7@google.com>
From: Jon Hunter <jonathanh@nvidia.com>
Content-Language: en-US
In-Reply-To: <20251230-ncm-refactor-v1-3-793e347bc7a7@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0107.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:191::22) To LV5PR12MB9754.namprd12.prod.outlook.com
 (2603:10b6:408:305::12)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PR12MB9750:EE_|CH3PR12MB8188:EE_
X-MS-Office365-Filtering-Correlation-Id: c1d37e45-5fb2-4c89-d36f-08de7dc58491
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	eL9AfLtYXq1vJ8gjHK7HAg1RNmsDajbIwtZx3Ux/GVDTc+sDhvauEST2RkQFP4/xWAUQY72YAzBERTrxd0D3OQpPcMWwloiRDLKLtMtHqG6akWsJzweQ7LUq1KgmDGtQj6VPcBrCwE/14wDfP79LEkAM1zhUIXnxvIWp34EpBEFOloB5vxXWAVTN0k/P5v91OX68GF4FK8FHAvCJoRVTx+ELk4PlBg+P5QrnoECecI2mLfB/L3MBTCNa1/2IUhHHB5Z4bJ/b7gIK1H8akyy9TUOqq5NwJsFqtsBnwVf3QBxQDbMfmklRaSkDIMw8dlCUBqwKvsg8kpWIxhmpWCZLGzL1Er3pI17GG8YOvwcSoh4fmGCXPNyRwMeP7dat0jpMfjihy17E93yVx9nX4C7NuKY0xNbdyorNflq634FBfp3wPUCXI33+rKzFld1cmj6EIyFfkLhHxFeersR3EYCtzxms1ZW9tj5wMiaynt0WLWL8CEPdkq2dWZ7NSVpYFuQiTjI3449BHAZVezx/1QV7s7ccnRvc2yyQSY1VfsmvTR7hoftl6/KHjG0IAase2ictc+16S1rLDUqtiD4Ad8pgRkWQ1iEUn7/qW5m3IHejb8a3TeKj2NVsRSt2KnbqHZShKZ6/Fj1170oIy1zZx/EMjSVtawzZSW1oPsodTr9mjf5wrP+4h2oCFmhunu38J/BWsma1ToRnkFpemnpbxAgwbIJyhYkSRgUHEyh1+NbVr10=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS2PR12MB9750.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(376014)(7416014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YzgxQ2h0Wnhvc3A5L1VwRENvMklJeHVQZkl4MkxEbkpuQ2ZTOGlNVE5SM0Zm?=
 =?utf-8?B?QnpKSzlwZUxxUTU2YjZHcEJzOHRpTFVXMUQvWHk2VGVmVVUxc2VyRUdoV1Z2?=
 =?utf-8?B?d2UvbndNMVp1dC9FUjB6YmxVemZ5MVdLMFM2QUc0Zkl6Y3dGeE5od2Zzbjht?=
 =?utf-8?B?QWdlWWNqVnZOZkJMTFl1NFlCWnBkUDRidm5PRDVJR1BTaG9OLzNUSytRU1dj?=
 =?utf-8?B?aDlJbmxKZlUxVWhIMkR2T25JeEx5dEJBSnN2YjZyYUFYSncxcmpieEdnUktT?=
 =?utf-8?B?NS81cDJ4d3dJVHI5WEN4QmwrRE5wUXNOQlVWQXU3WTJud0JYb0pmQjhRNEdW?=
 =?utf-8?B?cGpNRG9VazUwSXdzVW9EOUZreCtNTnhHQURxdzlHMDVGY3FmU2Q5aktGMi8y?=
 =?utf-8?B?d2JhRWY2STlmVlhveVBJV0RPQmtEUm5WZkQ0UUU5WXFQV0FETnNjM0k0RVlC?=
 =?utf-8?B?ZXVDaWI0eDZUWnVFOXhZV2hiTlJKOEMzWnlpNytnMllnSWZadDZYbWxROFZu?=
 =?utf-8?B?UEZZMkpwK2w0NS96czZJcTNyUlF3OG0yY0pyUzM0eXRIbzJ0V2F5b1YvdUww?=
 =?utf-8?B?MmczSkcycHhtUWVMZUpDcjhqV2tzd21pQU5DbGFNcEdRYjlscmRlR2FlUEI2?=
 =?utf-8?B?S3pmZG9kRk9ZSWY3L2txVEYxT2VQRzlVc1Zwa203YjV5ejl1QVdzcGtqRzFU?=
 =?utf-8?B?Y0tTRFlGMTVzYU4zZERsNldQRFAvWEFkTkRpc1oxaitEYmJPR1Y4b3gyVVJh?=
 =?utf-8?B?RzlpakxhekhjaEt1L1htalMwQUV1OFh3YVNnaE1vQ00rNU4xUDdGRkNtSFU3?=
 =?utf-8?B?b200d3FmalJPNFVzMndJdklRb2EwMm82R1l2Yk9SZ3ppdEVIMFBUbXduOHM4?=
 =?utf-8?B?TDl3OXpTcG9pekxzY2NTejd6aElJSHAxNkpYZ3BqcUtaRE5IY0J5c1hoQlRw?=
 =?utf-8?B?czlGVVloNm5HS3dSZmFzL3Y5TkI0WHdTMVhXRk5IQlFqUlpyMjNuTXhGL2pa?=
 =?utf-8?B?eisvVGN4U3lSSUNtakZuOXJKTlBHNUExUm1jZnhjMzFUNlRHYzczUitZTlNV?=
 =?utf-8?B?YjRLRG85U2htUjR0NGpIT25kMHZYUFRJek9GTUVhZG11a0txTWx1aUgyeFBY?=
 =?utf-8?B?dGxVbWFoMzZXbG9QRlJVY3pCUjc2a0JHRHU3ckZodXpoRnprRUpoS1dYQTV1?=
 =?utf-8?B?aEdaS0FFN0dOUHlRUkg5ajJmakI2eUI3T3QwZ1NSZ2kydi92WnZVeDVyNzlB?=
 =?utf-8?B?YU4weldYK0k0cS9BWDZZWXpOK1QzQXo4by96Uy9Ndjd1bFNRNWp0M052S3dJ?=
 =?utf-8?B?d3cyTVo4OWIrTXVta2pkeGtSdjlWTXV6YkY1bGd3RUpCME5RRVJob0czdExu?=
 =?utf-8?B?MnBZa3kvYUxhSkVvZVNjM09pQ2lha3R5REVwb3JYYWdPcWFpSlpJVkFFMElm?=
 =?utf-8?B?UTV3UEZxWEFTTEVVcUlMRzZYZitnciswa2wzMGxRZWJWSVVlMEQvWXhic0ZW?=
 =?utf-8?B?MktLL0pTTnBYOW9hKzhXZDI4aDNwM1c0eHhHQlV1cHJXVGFMTzlWeHFXUkY5?=
 =?utf-8?B?bmhUM1hkRkp5WXF3YVRGYlFJOU4reFVrTXJyTDY1OVV4NGlVK1g5UXd0OWw4?=
 =?utf-8?B?bHZiMmgxbG9rNklpc200OEhtK3ZYaFl0a2wxQWg5SGRIVzdQTkxEYWkwZ2dB?=
 =?utf-8?B?VngrK3FmaHYzSHZ1b3J6SlRWallWd09JSlQ4U0g3OE9iUXhEY0cremE4ZW1Y?=
 =?utf-8?B?dll3SlgybkFraGY1L0hWKzlEL3BPd01LeW1CK1ZhbUZqSWtTcTFncXJxMkNU?=
 =?utf-8?B?T0kwR0VpMmtqeFVhQm9mc2dSNTV2dVRCSjZ0cEVEYURCL1c3ZUVucWE1cnN6?=
 =?utf-8?B?cWZrV01QMmdicGYzVFN0MWFQRENsUkxNYzdVVHdsYWVjMWRYWTZXR2ZjNFFv?=
 =?utf-8?B?VUdQZWozcjc4clMzSHVDaU0rUk5pdEdNN29BUTJ2TElWNHlTc3JMZmZFRDZh?=
 =?utf-8?B?Sy9tOXB1SFpOVVVJVU54alBLd0dUV3B2ekNkUFJTbmVJOGZ3TjVFM3J2YXBs?=
 =?utf-8?B?VlVCQk1USzJWb0hWdFNuUTd3YXVZZ1JVUXR6S2REclF6OWtzby9aMm1KNm02?=
 =?utf-8?B?T2JkTUM3b1JRUWtYT0I0UjNYUFE4cWwvMzFpK2ZBdUlmS0FRNVJmWWVtamcr?=
 =?utf-8?B?WGRWcVNpeCtaRTNNWWNPTy9MRXFxMnFFYjhObnRQMjhYdlVpcXBXYTdMcVZs?=
 =?utf-8?B?UTZUYktLd245TlBqeFBVd0R6REVRWGF5YndhakFxWUZUdFVYdm1PejdaVW1C?=
 =?utf-8?B?clZWbmlrZGJGUHNpWFZXNkR6YVNmN3N1ZmdTZUx4U1ZWM2ZpVEJnR0t5amVx?=
 =?utf-8?Q?83AnOHhBvBlDXav3sYOqHKAIm0A7HZjsNnRcSNUOWr/Ky?=
X-MS-Exchange-AntiSpam-MessageData-1: JhULL8oQ6wGsPw==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c1d37e45-5fb2-4c89-d36f-08de7dc58491
X-MS-Exchange-CrossTenant-AuthSource: LV5PR12MB9754.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2026 10:20:42.9122
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mFzUdSN5I8duQpdyEpm8CLy3pAh3cPgyuWtE7Xma/9cz2J4325dHKAkM/JrIUEcy8qswmNKhzDIfhVsTO8m9hg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8188



On 30/12/2025 10:13, Kuen-Han Tsai wrote:
> Currently, the net_device is allocated in ncm_alloc_inst() and freed in
> ncm_free_inst(). This ties the network interface's lifetime to the
> configuration instance rather than the USB connection (bind/unbind).
> 
> This decoupling causes issues when the USB gadget is disconnected where
> the underlying gadget device is removed. The net_device can outlive its
> parent, leading to dangling sysfs links and NULL pointer dereferences
> when accessing the freed gadget device.
> 
> Problem 1: NULL pointer dereference on disconnect
>   Unable to handle kernel NULL pointer dereference at virtual address
>   0000000000000000
>   Call trace:
>     __pi_strlen+0x14/0x150
>     rtnl_fill_ifinfo+0x6b4/0x708
>     rtmsg_ifinfo_build_skb+0xd8/0x13c
>     rtmsg_ifinfo+0x50/0xa0
>     __dev_notify_flags+0x4c/0x1f0
>     dev_change_flags+0x54/0x70
>     do_setlink+0x390/0xebc
>     rtnl_newlink+0x7d0/0xac8
>     rtnetlink_rcv_msg+0x27c/0x410
>     netlink_rcv_skb+0x134/0x150
>     rtnetlink_rcv+0x18/0x28
>     netlink_unicast+0x254/0x3f0
>     netlink_sendmsg+0x2e0/0x3d4
> 
> Problem 2: Dangling sysfs symlinks
>   console:/ # ls -l /sys/class/net/ncm0
>   lrwxrwxrwx ... /sys/class/net/ncm0 ->
>   /sys/devices/platform/.../gadget.0/net/ncm0
>   console:/ # ls -l /sys/devices/platform/.../gadget.0/net/ncm0
>   ls: .../gadget.0/net/ncm0: No such file or directory
> 
> Move the net_device allocation to ncm_bind() and deallocation to
> ncm_unbind(). This ensures the network interface exists only when the
> gadget function is actually bound to a configuration.
> 
> To support pre-bind configuration (e.g., setting interface name or MAC
> address via configfs), cache user-provided options in f_ncm_opts
> using the gether_opts structure. Apply these cached settings to the
> net_device upon creation in ncm_bind().
> 
> Preserve the use-after-free fix from commit 6334b8e4553c ("usb: gadget:
> f_ncm: Fix UAF ncm object at re-bind after usb ep transport error").
> Check opts->net in ncm_set_alt() and ncm_disable() to ensure
> gether_disconnect() runs only if a connection was established.
> 
> Fixes: 40d133d7f542 ("usb: gadget: f_ncm: convert to new function interface with backward compatibility")
> Cc: stable@kernel.org
> Signed-off-by: Kuen-Han Tsai <khtsai@google.com>


I see you have sent a revert for this series now, but I wanted to let
you know that this change was also triggering the following warning ...

  BUG: sleeping function called from invalid context at kernel/locking/mutex.c:287
  tegra-xudc 3550000.usb: EP 11 (type: bulk, dir: in) enabled
  in_atomic(): 1, irqs_disabled(): 1, non_block: 0, pid: 0, name: swapper/0
  preempt_count: 10003, expected: 0
  tegra-xudc 3550000.usb: EP 6 (type: bulk, dir: out) enabled
  RCU nest depth: 0, expected: 0
  CPU: 0 UID: 0 PID: 0 Comm: swapper/0 Tainted: G           OE       7.0.0-rc2-debug-tegra #1 PREEMPT
  Tainted: [O]=OOT_MODULE, [E]=UNSIGNED_MODULE
  Hardware name: NVIDIA NVIDIA Jetson AGX Orin Developer Kit/Jetson, BIOS buildbrain-gcid-44366467 03/05/2026
  Call trace:
   show_stack+0x20/0x40 (C)
   dump_stack_lvl+0x7c/0xa0
   dump_stack+0x18/0x30
   __might_resched+0x128/0x198
   __might_sleep+0x64/0xd0
   mutex_lock+0x2c/0xe8
   0xffff80007eaedf84
   composite_setup+0xb30/0x2010 [libcomposite]
   usb_function_register+0x20e0/0x2c28 [libcomposite]
   0xffff80007cf7ba20
   0xffff80007cf7cb84
   __handle_irq_event_percpu+0x64/0x3d8
   handle_irq_event+0x54/0x110
   handle_fasteoi_irq+0x114/0x1c0
   handle_irq_desc+0x50/0x90
   generic_handle_domain_irq+0x20/0x40
   gic_handle_irq+0x54/0x180
   call_on_irq_stack+0x30/0x48
   do_interrupt_handler+0x90/0xb0
   el1_interrupt+0x3c/0x68
   el1h_64_irq_handler+0x18/0x30
   el1h_64_irq+0x70/0x78
   cpuidle_enter_state+0xcc/0x950 (P)
   cpuidle_enter+0x40/0x68
   do_idle+0x1fc/0x298
   cpu_startup_entry+0x3c/0x50
   rest_init+0x100/0x120
   start_kernel+0x760/0x908
   __primary_switched+0x88/0x98

Jon

-- 
nvpublic

