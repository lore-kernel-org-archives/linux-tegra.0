Received: from LO0P265CU003.outbound.protection.outlook.com (mail-uksouthazon11022107.outbound.protection.outlook.com [52.101.96.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8428F2641CA;
	Wed, 27 May 2026 11:19:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.96.107
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779880762; cv=fail; b=kdXH6yMTPyHnt+5mRiPIeAwS/X+fgR0iwF2Csrab/oT7gM1269Wdnnb4OA4RomChUQAY1Bv6znY2hjkEjkzLBK3e0ArtTbRFd+3OHce/rMNLWbg12Cr7b1CRjPC+8vnecUCpY5Sk/NrNGmb0Nb0r7yK4SHoFC8ouQaDYCDaIisw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779880762; c=relaxed/simple;
	bh=jtbtELzhE/IIApyPitgMcbhB+bA/a7NE6+IamZzWlms=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=IE/aqXcjB9AuT98vvm/E2HyTnW9YIG9VD2G8vH7+AkYkpHjCSD9j4etXHfsCu5MsVn90zXw+wM8Ghv+Jt/kbJSQY4NopV8PRBzbqZlXsrsw82vMbRxQPBXv8eD9aElLjsC5dmUjNXLfa3qFxWs3aterjyjixPQgUgH8sDUrAbkc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=WW47116H; arc=fail smtp.client-ip=52.101.96.107
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="WW47116H"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=P9yETGMeK/2HYdq5IUwnSN2U5v7h/PBYKNLp+mfuHYz7e96Iuwi/sm5oGhWjYNbmyWE4shAPBQQE0vAEzKxPCph356Ncy1sQnB3wxKKq1r43zBqK9oVjopX9GNfH3g7Q4kWkYL6xWo3q/KBeahcvAi2R8kWspQ9KAHJibN7Sm1+E6bbtHQL6v8ZLuRnn5kmHZMrZO4Dc/cPtbHLxH/5eBEonG0fCZATEW0g8jPQsVUX0CrCooLDBNU1JpLN9lhrzVE+tjkbpQw8LSFbhEiU9ivJ3mCSIVOvzMgf05oleqsTUzLT62n/yE80SizsAiXbrCTz3c4frcAnPT9J8x/LTXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HuAvmxttfNbUbxrEA+sFPoBBYGkXb1bvXgxonVYcHoU=;
 b=OSvkAo4DTZ9xBjqjA8UJaQVLVbHwrZHZoOFhuB7+W49+ulL5aXcqetd8zsMHkjq6ZjwooScBLncD2S1WSYsgmFSfHHx9CBcLyQ1mTd72zqRrpBCGgqZ5kB7dv/6QOpjNC/ACllk0b3KX5FX/Meeh5z5dVwatNN6ORN4iPeOBCZG1YnBoQz5OfW/bBgdpKWtJzZRAoUuqjoTrl2B2S8iwcQZMBsBgeH/CzDI1xu8TJfOyBvutLMv2ho5dGElVMNxtmLH/bSPzr6ZXFBqUPg/bIRbzMkazpa4cRpIMkrbVF95mFWGZP4hiuorcHdxsT8rh+QXFwnx/HgbH3ulv7KT97w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HuAvmxttfNbUbxrEA+sFPoBBYGkXb1bvXgxonVYcHoU=;
 b=WW47116HMo6vfrBHA6GRU88LBd9d8xxVfInpiGX8Ziw8fhZ20OhbMXXZ+SddjQfFow44muETSrxqZdpkDgANTFPYc+NLp9pzqXeBC+GCTOdxm9fzkhlg+Ie9K7uN/1IF9cv+8wyUo643lFNH7+On0YghnmTZDJsCzsFPpU/wjQY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by LOYP265MB1888.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:e5::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.11; Wed, 27 May
 2026 11:19:18 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%4]) with mapi id 15.21.0071.011; Wed, 27 May 2026
 11:19:18 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 27 May 2026 12:19:17 +0100
Message-Id: <DITF2JWDL2QL.14JCFDRTJRE83@garyguo.net>
Cc: "Rahul Bukte" <rahul.bukte@sony.com>, <linux-kernel@vger.kernel.org>,
 <coresight@lists.linaro.org>, <linux-arm-kernel@lists.infradead.org>,
 <driver-core@lists.linux.dev>, <rust-for-linux@vger.kernel.org>,
 <linux-doc@vger.kernel.org>, "Daniel Palmer" <daniel.palmer@sony.com>, "Tim
 Bird" <tim.bird@sony.com>, <linux-modules@vger.kernel.org>,
 <linux-tegra@vger.kernel.org>, "Sumit Gupta" <sumitg@nvidia.com>
Subject: Re: [PATCH v5 1/4] soc/tegra: cbb: Move driver registration from
 pure_initcall to core_initcall
From: "Gary Guo" <gary@garyguo.net>
To: "Shashank Balaji" <shashank.mahadasyam@sony.com>, "Suzuki K Poulose"
 <suzuki.poulose@arm.com>, "James Clark" <james.clark@linaro.org>,
 "Alexander Shishkin" <alexander.shishkin@linux.intel.com>, "Greg
 Kroah-Hartman" <gregkh@linuxfoundation.org>, "Rafael J. Wysocki"
 <rafael@kernel.org>, "Danilo Krummrich" <dakr@kernel.org>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Boqun Feng" <boqun@kernel.org>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "Jonathan Corbet" <corbet@lwn.net>,
 "Shuah Khan" <skhan@linuxfoundation.org>, "Luis Chamberlain"
 <mcgrof@kernel.org>, "Petr Pavlu" <petr.pavlu@suse.com>, "Daniel Gomez"
 <da.gomez@kernel.org>, "Sami Tolvanen" <samitolvanen@google.com>, "Aaron
 Tomlin" <atomlin@atomlin.com>, "Mike Leach" <mike.leach@arm.com>, "Leo Yan"
 <leo.yan@arm.com>, "Thierry Reding" <thierry.reding@kernel.org>, "Jonathan
 Hunter" <jonathanh@nvidia.com>
X-Mailer: aerc 0.21.0
References: <20260518-acpi_mod_name-v5-0-705ccc430885@sony.com>
 <20260518-acpi_mod_name-v5-1-705ccc430885@sony.com>
In-Reply-To: <20260518-acpi_mod_name-v5-1-705ccc430885@sony.com>
X-ClientProxiedBy: LO4P265CA0305.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:391::9) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|LOYP265MB1888:EE_
X-MS-Office365-Filtering-Correlation-Id: ac80ea20-cbb4-4f08-829c-08debbe1caf5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|376014|10070799003|1800799024|4143699003|22082099003|18002099003|921020|56012099006;
X-Microsoft-Antispam-Message-Info:
	8S/N00Hc9Ms+w2CN9OTHJEtJyqcpw3f6oOQ7zul0i7/Fu3hI08jyARavJv03UlLIEmJKl+07AQI1kEYTYxcm9UyNW9ZAMEe/Au6jRKdxJ4n6YGe3q0W005QLdCxtPcOR3GRtYPVOREbQv9vZjf0dzpy0IsEApo6xEMvtE4J7Crwnfc6LhmYhlqSL6r6ZCNHoIUSrR16JuSo/KnpH8UJ/Rt6LQDBaWdtev9do1/hyyvFwnxlcL/EhckvbS1bNpTmxshbXkL9SOtnW//gD0iXIrMGbIcrFumrdugmzD4UaPE/hy3rWW9HEvqqc7GOIOeextUilrdNARNVvPxBcvJaZ3Gh7V26wrhMbT6Jk2u90Xc9rxQJkwcNbtFagrROxESMUvV8s9JQQNRKh+UhNj7WET6SKCkIc/5y0pJeI9R/yixiu6jEJSlaUnqHijfORWiVDy9CW9YvnU0Zk8gbx1ZNziX3icBUZbUwuKVhEl4roEqBT3tlSNP173H7vcmFratJ+4AgXAtsB4mcjBpNaGJc7ZIk3T8QUGGRp6IPmc41Z2qXvR/IcaaMhaAbArAUSYCXNTa7xkwOmojeFeHm/WKGKkuxWxbDBbZsYyX6BcyIsAfS4z54W2n48tjj01XHJi0JMAre47snX1U6Y97SHArWsNNNXW33Uh7BAgj1XfLmYj9RfPwMP3ZIkdrF5jqFzzIzNw0VCnSNQhwIbeUG44QF67JHNyZiEcD+/m/6aAjMR/Ag=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(10070799003)(1800799024)(4143699003)(22082099003)(18002099003)(921020)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?T0cyUm5ydy82OXMyTk41Qk1jSU5xcktra1plTndKQUpBZmZMOUdmNFdiRk1y?=
 =?utf-8?B?NWVCMEYvK1lUbUgxWllYVCs0cEU2T3lnL1VIOVBwM3I5TXV6NXl6azBqa0J0?=
 =?utf-8?B?Q29RZkJ6VmtQWUxCMGx5L1hwR0J3YVZtc0ErWjh5QTZaRitOV3JDZDJIRzIv?=
 =?utf-8?B?bFBCQm1zT0xUblY1OWxXeWxGRmhjRDFpNzBtYldFcHhpVFZCdjhmNHZwNi91?=
 =?utf-8?B?dVYvWTJZNVFJVGN1d0NIN09uaHZPR1l2di9VVGNLVlN3ZGxlOTlBd1d0S0pn?=
 =?utf-8?B?ZlI0Q1BZRzQ2UVZNc1NHa0NDaG5kUTdQckt6QklBcHJqMmpZYTR6bExUTmg5?=
 =?utf-8?B?NWMvcXl1SEJJY09BSHdFcWpaVmFJK1JlZ29mRGFFVlpLMlBaN25Ib1JlMzFl?=
 =?utf-8?B?VFhwRnBVWDFvUmZ1MDBUQnMrMVZUZzl3M0ZUUFp4dktjVUd3YWVxUHVOaVh4?=
 =?utf-8?B?eWpQME9QYTF2Q2pHYS9qWHBNWDFRSUdiZ04yWjc0ajBrUG1CNThTMytZaUlv?=
 =?utf-8?B?NnN0OEJwNjBvK0ptbU9DcTJtTmNBRitVdkQ2bUlLU2N4VVRFMHdybkZaTjUz?=
 =?utf-8?B?Y2syVEpVNGY5d1hSaFg4UThOMGphczdYWnZFVUhvc3ViVXJlbERYdk9GVXFB?=
 =?utf-8?B?R2NyWVBuOUZyVFRWY2VUU0dQaUhPczYvQ0VlUWVIVzRIc3REejZUOXI0ME0r?=
 =?utf-8?B?eUhPMnRkay9wZ1NwSVlFOUZZcW1jalRZRTIya1R4VG9USjhnNFMrOEZOMEgv?=
 =?utf-8?B?dGZmTzQrYVFVblBzUmo4RkQvRy9OVWNtS1FFRytVN1ZIQklib1JDUGFFYzdm?=
 =?utf-8?B?Q3RUWGxFa2dRTTFJY1QvWHNrV1VQRGlGaGlERGxOV0hybU1BNEExam5Ia0JK?=
 =?utf-8?B?dzkvYmpybnNFWTkwYnBKc2VWY25QdGxlcGtRc0w2OXA4dkhFbUluYmY4UTl2?=
 =?utf-8?B?RVZmV25SS201cUR2YlRubUpiVEJoQk5pVjJJWTZSMTQ4OVhsQTVrMUpEaGRs?=
 =?utf-8?B?T0w1ZjY1czlMVkJqQlRWTDhUaklvZFJxaTNheG1XVnVPdmluY3JpajdUMjFv?=
 =?utf-8?B?K1RjSi94elk1dklsUHBuWTF3SlBvODJFbXppVTdWQ2lGeVJJaXRvWjRtZTV3?=
 =?utf-8?B?NXFaYXdTaWtrQlcrVTlxQlV2RTVuNEZzUmpKVmF0eDZjeHY1cDRVc2hUV0U2?=
 =?utf-8?B?VG5nNW5TTS91Znp5aWx1NnJtcWF6eFViNHJqOUVublBvUUdqYlMyd2xRYkNk?=
 =?utf-8?B?NWEvdkUyNnh0aDR3d01kUTJLR0FpakJmUW5HaEcyUDdmamNwTlQ2Slg2TVE2?=
 =?utf-8?B?a0ptWUxHQ05VVEVkcm44Qm44enNUaFlXa3dsZysxRURyMjBHM3hKSXFmYmh6?=
 =?utf-8?B?aWJGeWp4M2xIRFVvdXI3SVJMQW5CQWtBdHQ3TkxxME84cEdCWjNrVVRRczRT?=
 =?utf-8?B?cjN4dW1mWkxXTmdmRng3THJlbS9yZVNCcmJZRVRUS2s2OWdKQlRBeFRSTFdL?=
 =?utf-8?B?VW11YWxmSXluWjFialhLNk1DV0k1bzZSYVdUTEN1T2VGL2Z4TUkvWUJHODI1?=
 =?utf-8?B?M0NYMkdyWkFoWkZacXp0cmMyT2ZBWDVkTnJCc3J6QVJia0lTa1lKVFNHQVRo?=
 =?utf-8?B?dis2eGNQL0pZVVNVL05udlJMUXY4ZldhYUJTL25zNlpMMkVtMWtJdGEwYVdy?=
 =?utf-8?B?Ti9qcEp2L0JrU0F5dVRycXlnSzg1TzlGL2tqZ0lyRE01Y3lMZnBPTUFmbGFm?=
 =?utf-8?B?RjZ6UGNUTlRqTVIrbTNVOTNGSHVDWWxtd3hNWFZqVUNqbkh4YTIwRHFGdEZS?=
 =?utf-8?B?b0txbEhKSlc3NUExdStoTzhBVEVCc3hVWlY4VzdvTDVzcTdoSXVNZXJKdWxY?=
 =?utf-8?B?L2x1Z0F3aFc4eFJwc3hvRkxrL0dIZjMyVXhwc1dyOFYrQi9CRVRrSnJnYzk2?=
 =?utf-8?B?VVVGdWF0aCtrZmN0SFAxWjRIdlh1S3ViWldnVzNURnJGWEFKeWtRYnAzYUNk?=
 =?utf-8?B?TjhPQmY3TU5RQVpOVW9hL1ZkUUVDZ3BEcWlQSWlJV0FVTTRmZHk2OEtlV3ZJ?=
 =?utf-8?B?NU5PdklaODZRTDRUcllQUGU2Qkp3TzdZWTg3b1dsRFpybzRnbm90UVVZNFVY?=
 =?utf-8?B?RGJEdmFSQzVVQy9acHBiTEp2bmc1bkpEMWlZVzVTNG54d2d1bFpvNnFaY3ZF?=
 =?utf-8?B?b28rdUNFRXR2MWFvVlo1OVlSN0M1c0tRU1VSN0lLZHo0QXRSTzVsVVFmREhY?=
 =?utf-8?B?Rm1ZT2RIUmtIMzBBcUNjL0lqUHY3UjlUOXpwM0Y1KzA1YzJub25rS0tXYksz?=
 =?utf-8?B?Y2cwWWhVZGxxN3J3Y01YUHNoRjM4VEF4ZkZrM04rcVN0ZVJJZnpaUT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: ac80ea20-cbb4-4f08-829c-08debbe1caf5
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2026 11:19:18.1537
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MIVVDuHTYzocblhcWGETki4XT2P8pTk5yT4T5f5HwecGQl9FcoV4WPB2b6MJ0yER36OI3yCXT5hpGCiEu4rfKA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LOYP265MB1888

On Mon May 18, 2026 at 11:19 AM BST, Shashank Balaji wrote:
> Commit "driver core: platform: set mod_name in driver registration" will =
set
> struct device_driver's mod_name member for platform driver registration. =
For a
> driver to be registered with its mod_name set, module_kset needs to be
> initialized, which currently happens in a subsys_initcall in param_sysfs_=
init().
> The tegra cbb drivers register themselves before module_kset init, in a
> pure_initcall. This works currently because lookup_or_create_module_kobje=
ct(),
> which dereferences module_kset via kset_find_obj(), is not called if mod_=
name
> is not set, which is the case now.
>=20
> So in preparation for the commit "driver core: platform: set mod_name in =
driver registration",
> move tegra cbb driver registration to core_initcall level, and commit
> "kernel: param: initialize module_kset in a pure_initcall" will move modu=
le_kset
> init to pure_initcall level, ensuring module_kset init happens before teg=
ra cbb
> driver registration.
>=20
> Suggested-by: Gary Guo <gary@garyguo.net>
> Acked-by: Sumit Gupta <sumitg@nvidia.com>
> Co-developed-by: Rahul Bukte <rahul.bukte@sony.com>
> Signed-off-by: Rahul Bukte <rahul.bukte@sony.com>
> Signed-off-by: Shashank Balaji <shashank.mahadasyam@sony.com>

Reviewed-by: Gary Guo <gary@garyguo.net>

> ---
> Patch 4 depends on this patch
> ---
>  drivers/soc/tegra/cbb/tegra194-cbb.c | 2 +-
>  drivers/soc/tegra/cbb/tegra234-cbb.c | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

