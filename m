Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11022128.outbound.protection.outlook.com [40.107.209.128])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 122AA337B81;
	Thu, 29 Jan 2026 22:21:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.209.128
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769725286; cv=fail; b=NIIVXodrGP2Sg994T08FL13vJUU9yq4koDkjf/DV+/L8QcGUXus88LppLqCc5Kux9UZeH6XcqL/FlCol8EJxjDkJegv5jecHnRGY0p+agbNyr6lrGflXAn1Ct4SjgJ6mmEqo900iehk7BpC9g3WbZW34dwuKZYZVYdl58QAoy1Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769725286; c=relaxed/simple;
	bh=NLQG6DM8l6eCVn+/WhrYpnGW8AfZKBZFSKSkzMx+U/A=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 Content-Type:MIME-Version; b=tXMbZuwmMyaYfHYPMQtIzk5u/03pI/wKkBUreNZUpWe9YxSxbc4a/m8WbclBbUGkVIhYlbhLQoazXvAohhPOj1tPUHvWSKQd6k8eHkxntDvfV7CNQcqI0v2tphfvBnTOoGngEDsDlZBcS+7kcztx6T2yacTln4y6v7FuTWHTOGs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=os.amperecomputing.com; spf=pass smtp.mailfrom=os.amperecomputing.com; dkim=pass (1024-bit key) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.b=vnc6f6Jd; arc=fail smtp.client-ip=40.107.209.128
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=os.amperecomputing.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=os.amperecomputing.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.b="vnc6f6Jd"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yOEjtT5Vcwy9szFwS9X0O+iQn4HFWFUursNCVVYghbVFYTz4WQ0lUTehBxTqauqmvOs4O2I7Ol3QxyOn/AU4dC7zUAr4NfMzQo6bXGtRufpJTUTMF9rUVYULye7Fn6FaCY57m3qBPhFFYVRKAJ6ULa1fGwGjnrkalinVC+inishu4H9+4dtYBv1L7E43QIa1RFSpeGyuXf2cynNQfqjuEWgUaQbR1JUbPr3vZ+e6w5eOmFi+/0OzphIFInMm53sCgcLp/Qrm+5MrS2KcYYWDUvD8DIQTMebKSSToO9bt3GD9/DCzpR5o0fIRrjYT447+4V1dFDEdLRzMgeyIt8Dokw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dQqTBoEOuk1Rrqapo8uRzUTnT2O7+yhSfpIMkr9o7Xw=;
 b=i/XZMfX8D5hGTMR9ogzq9owCuykSD2hSCwKgYL+pp/BLx3VJ9HJoSqY2HgTw4UvNYV+4GtzecEt9bfaSfrVPVkRzuSovlfzfBidjH3R/kQQDGPRjWLao2ZugwPGGuETXaX1VE+IFhkn9lZpCpddfFATX9t1Fi2gZvv4L5mTzw9KAt/Q6mPuwIyKa4RsvtLtCifakjXrwaZZbEvs8K46Z7QPKR27aGz3IT7pNtep0ibbFWfV8CMvCBFUVCvlP04Uj1t6uM2ekiOCFEC/ZdKMf0VCNe6YyA5gKyYT0QaKgubERScfNe7/BD/UVlfn4kLPEGgV/6h0o5KQ2nagw+M89rw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dQqTBoEOuk1Rrqapo8uRzUTnT2O7+yhSfpIMkr9o7Xw=;
 b=vnc6f6JdqAl0To63HHihm/rmUmazXGb6W82JNVwt//2SReSYPiOSofq1UVHVTZ3KhxHXndqq/yXgEoaikxUYs1PC+YUNqVANvhGLSBlRJ1tRBMgl+F80MF/jSqvoyQ017Y6T9qjim8D6NMgGJ7DFhBb2A/zKLp/42UzTX3gh4Rs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from MW4PR01MB6228.prod.exchangelabs.com (2603:10b6:303:76::7) by
 DM4PR01MB7809.prod.exchangelabs.com (2603:10b6:8:68::20) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.10; Thu, 29 Jan 2026 22:20:08 +0000
Received: from MW4PR01MB6228.prod.exchangelabs.com
 ([fe80::86f5:4db2:7ad5:7fc4]) by MW4PR01MB6228.prod.exchangelabs.com
 ([fe80::86f5:4db2:7ad5:7fc4%6]) with mapi id 15.20.9542.010; Thu, 29 Jan 2026
 22:20:08 +0000
Date: Thu, 29 Jan 2026 14:20:03 -0800 (PST)
From: Ilkka Koskinen <ilkka@os.amperecomputing.com>
To: Besar Wicaksono <bwicaksono@nvidia.com>
cc: will@kernel.org, suzuki.poulose@arm.com, robin.murphy@arm.com, 
    ilkka@os.amperecomputing.com, linux-arm-kernel@lists.infradead.org, 
    linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, 
    mark.rutland@arm.com, treding@nvidia.com, jonathanh@nvidia.com, 
    vsethi@nvidia.com, rwiley@nvidia.com, sdonthineni@nvidia.com, 
    skelley@nvidia.com, ywan@nvidia.com, mochs@nvidia.com, nirmoyd@nvidia.com
Subject: Re: [PATCH 2/8] perf/arm_cspmu: nvidia: Add Tegra410 UCF PMU
In-Reply-To: <20260126181155.2776097-3-bwicaksono@nvidia.com>
Message-ID: <d72fc2bd-6200-1ee6-31d3-d81d7b669453@os.amperecomputing.com>
References: <20260126181155.2776097-1-bwicaksono@nvidia.com> <20260126181155.2776097-3-bwicaksono@nvidia.com>
Content-Type: text/plain; format=flowed; charset=US-ASCII
X-ClientProxiedBy: MW4PR03CA0104.namprd03.prod.outlook.com
 (2603:10b6:303:b7::19) To MW4PR01MB6228.prod.exchangelabs.com
 (2603:10b6:303:76::7)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR01MB6228:EE_|DM4PR01MB7809:EE_
X-MS-Office365-Filtering-Correlation-Id: 1e4f6d2e-f635-4b4b-52c5-08de5f848f62
X-LD-Processed: 3bc2b170-fd94-476d-b0ce-4229bdc904a7,ExtAddr
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|376014|7416014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?YOu3ykwaLLoIg7QlRU3yH23xvs+GgTd3ABIJSiExx/kxHXuNOqrZZIyE9Om6?=
 =?us-ascii?Q?OV9LpcSRFvd8scqlK2yYetx6SWYrwn4BsCb6yy7aRdeVxjjmsfePMLYJ/dca?=
 =?us-ascii?Q?xe1lhYLGENdVJ/I8xgkEYfUhVQhgbpBgwNJJDsyodqzS8vcNBMRnSeoin8Me?=
 =?us-ascii?Q?zqrCG6jD3bnXKMvJp38FgQ3ib8IQthKy8fLoz9h08oOpiUujXnpCCs5tN4of?=
 =?us-ascii?Q?AkvZYlWr8gxm4Xtj9BixD5T6Cu7zIyfmmxJ+Z4fJD5olS4SMPqH92xuvSzUt?=
 =?us-ascii?Q?PZ8dV0kUAzZ0al86NAbXB5XB/q0DTrC7BYXDkjbS/fZJCA/MR+9TARR3RBD0?=
 =?us-ascii?Q?53s0SfTNkINafQ++5I+fQW/KBFaVsOl5Yt2PxW4tMaKoisUVDEtmMk8Jhx2a?=
 =?us-ascii?Q?Ue5T2aPS9R6LK7r5AvNQDGOv4TwvFMcwD9tunIkVHPC9u1H4UHXKwcbreHNw?=
 =?us-ascii?Q?jy6JZs7dB/etEBGw8QMF3kvoiIH4O23CimsFDgHloRf440uKNcWx0e3Pfj1W?=
 =?us-ascii?Q?0TqQI20B8N1w/9jptJ8vV6lfO5MldesLdbLQJmg7AUEQg60dk1bU9MT0uQYY?=
 =?us-ascii?Q?TYCuUZPZXqq9t3wlO3YrkB1mgwaB9Qz8oQeCkkhUE+50nvXHDrrEKMoufY6G?=
 =?us-ascii?Q?nz4ArmAC0tNlu6vhECsJXzngUwyTH6MXF4PasZXOVAVXQJAcCAYhFAydSG6o?=
 =?us-ascii?Q?VU79FJ6sk1o9o+vCJaon26oQz6EHZ0bXLICpK5nKUeTYpRW9yZtOVHYGRX2V?=
 =?us-ascii?Q?pjG0yXqxgk601GnktVgKmlvEWATufuVbu66B4z5NZ/rEaPZadsXnDo35NUTh?=
 =?us-ascii?Q?6iVeF72zwQ4UkqVlrbK83+KOC8VBAjh6EzRb+e4bo24T8VgfVEh69IothDmo?=
 =?us-ascii?Q?tKv+53f/fckW1/b7hcwsayNvT3RPanc81QDGD2PedaGt91fqk21K9fGGeHyw?=
 =?us-ascii?Q?PRnzJwIEd0wJrzplGIyjfQzyGk0Q4mYsGyJwBC5qZzK+xadnpP5R1A0C2dLb?=
 =?us-ascii?Q?qJCYVNrPT54fn+71S2Zl+Oqi0M6EpXMH7vnNX7/2QhawCkz7hhUWHMrJDX+E?=
 =?us-ascii?Q?L4pIX6mzO9P6t5JlLAr5+KAMhMrdiLKsTBQvr+tO5Gw86RGZpwJYr1p6KbnG?=
 =?us-ascii?Q?kcwKdDk52Uon2oiYGcb2HlmZNjWEvra82XZfplOZ4G2mYJf5DFdavTVtzJWo?=
 =?us-ascii?Q?A+tw+jmQ0afD/5HF3bvY+tb9zFu1dgQoColtQNuDmbilcHGY3Rda+kzrSqaX?=
 =?us-ascii?Q?b4Yjpcsx/n7hn4UOnhze/anMLheme8wDmh4R8WoywIHbJVf5qzqpeIKmdx/h?=
 =?us-ascii?Q?q18SCEpcKr6jG9tCXdLEd8sY7Y/9zFtTdCACLjVuQLpNYBAmAnDrpfxT2Vfl?=
 =?us-ascii?Q?0HzxrrE8f+KI3te9Bj21g/8/zn43oydVwXgc+L37DkijphB9gf5eQc1EMzHM?=
 =?us-ascii?Q?0ou4DCeOZf+pKuUVmeab+VsCwgkLkmMSeU00g67oB112BjIzxRoyInP88Gzn?=
 =?us-ascii?Q?XF2Ywj7Ft7L93DZNDX5CU+TRUQYtD1fENvcftrVfdUjbSa+XP0QTnArxtLzz?=
 =?us-ascii?Q?ff1z8RqJA/9VHyw46Nw=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR01MB6228.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?fgGFybnCqoZxu4yNYvi+BFIoGTz8IL82yqWA1lCEak3GoNbMVGcu9LGNHUGs?=
 =?us-ascii?Q?ryKFhPW5MhjxaPES+zsAmINgwu1vt1eIw3yuxNZyNJhBEFrYvWmb9dVoYnrF?=
 =?us-ascii?Q?SPtC2iKIx/HD2aSMgsi7k6hLFw33Ewny2C+s8NvoD5AhEV6Z7sUxf6A+KCw2?=
 =?us-ascii?Q?P/XQ9r2YaqwFFGiw7sufwjJuFwU4HkEirhZplTYV9ZlhPbPbCT1ufhNTAT/1?=
 =?us-ascii?Q?FXuWDDJU7ixOWggvfZ5v5HXvKhKTkl4Ar6eUvdkfxK5eIw2YEcUKVresnYf/?=
 =?us-ascii?Q?9wptDER3+wsFf3Bym9+5YUc/+Gt7tE/tpKLW7jI5JHzaP895Nbn2RW+OFEQp?=
 =?us-ascii?Q?6dwf5MqD3gngkwnOSpIVZgyVcfupIRvIfekxZKvrFbB3Di/t7JHV1OA02dxx?=
 =?us-ascii?Q?zIJEzdKKeS0kJUbp6jLH0nMOsTxuT0IadFmzwKu2YM13j/q3ls8m38HzFZ0r?=
 =?us-ascii?Q?sTW2MmYdNIfu2qz65Ff4H6oR0iBXrukVXap3w5+WMo604Bdh80OReYEhVd+n?=
 =?us-ascii?Q?JrlqWHCyL5lArdjozVZ6vCnOs7sZsoFzbysCkW8aEVo7HoAFhW9wdVIeRF9+?=
 =?us-ascii?Q?w52BTN0rihhIJ+9ciEy41Gy3fpNrGZ+bil1rAvV+Oyecm8NvZl2r7/Q89N1K?=
 =?us-ascii?Q?S7gZed+O0tFY8xI5p6Tzn88SOAZeBoVfrXjW+sVlPaqVb8ilBk6FBNjEJIDz?=
 =?us-ascii?Q?DV94kSKwgrH7UtEuTskdGI7nrQg8hk1iR1e6U+UAmzyk9gN4AhbxRNJlSPbp?=
 =?us-ascii?Q?7AfQ49TuNlvDf4Ux4pXF+Bsp4O/Rg/KRwZrs6bf3AucEaxm+EmiHn6Pjsvs+?=
 =?us-ascii?Q?lzngTkDWVI1w/8oqBRs9UerZ8M1S49gRYcFfO5KiTOW60wIKbK9kq+MCGWjQ?=
 =?us-ascii?Q?BfqUg4RZ4h2HQcRy/l0pFKxASs8voa5TA0jI91aDp/1iJGnOsfyYJS3G6sVF?=
 =?us-ascii?Q?V/VTflD/3l4Nk7seSNMtrV49fVg/kMn0SDKpd3w2G+E8FsiAZfX7hN777tKn?=
 =?us-ascii?Q?+Qzp0NDlw3jjW6OamLIU2UAgWHgGGBpGZVOFpUed6ioJ5QSSPEwJZqHO3kGM?=
 =?us-ascii?Q?tdLcSl1/Y3N4r53AaQEdureDXIDaKJc23TI3NoJK488hcXTS7HlMyJHAWCVJ?=
 =?us-ascii?Q?kzmDwrksMXrwdp00dd8Me6XfUAP4iy1/rv8PyITK94T9nCqheUPitNlKuVoT?=
 =?us-ascii?Q?SvekBVZuCFaJuKXF7G5lMhKeEp5s4DBH9cruVKGTdAt+fjVVU4ZIHi2zzqwu?=
 =?us-ascii?Q?yPKVLzRHMXkkZeL59zKOzaPg78mPkz11C9fp57tYSgnBRM3x3XgmJSWgyz4/?=
 =?us-ascii?Q?iUJEy8BVZ3kPuIOksGzbR0tao1x+IpyxgtkeJhiQHOOJlUaaSfsWTbgn4XEG?=
 =?us-ascii?Q?VuAJWxWDjWVRhV6TO+JCtSuMW2CkXpz+D1X28QLVyOt5BgdDsfXtt4TgPENJ?=
 =?us-ascii?Q?02piDn/ef6ZR/YcvCvmT3SAPHml/uKVEUhtHh93c+Fp6JGMaH2b7BuCjIxiW?=
 =?us-ascii?Q?l7Ng9WAUuiGXp9B77D4QsevVe2RNRk9kyMct8AFZOBUSJZ/0DPbl1JI/M1vo?=
 =?us-ascii?Q?BjoXSXYLGgE5IKcFIi98SdFjWQz4k4gMPzrXUAvYTk0q5ZuHrZViCgPutEUU?=
 =?us-ascii?Q?yV80QHv6cLtEojHTTcqMid2rsxyRjcTqQsKLO+Umh2iR7TziwNedk+N0mClB?=
 =?us-ascii?Q?MPcuzSB+114W3TR7izn97k8GpTPYGLPuNNMxeI0PsLVI1WDK6ulAeIAepV8W?=
 =?us-ascii?Q?ktorSFdmnHp4UucZFMoQk/evzxxnRvukuMQis63QPoBGBlqNQ9/D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e4f6d2e-f635-4b4b-52c5-08de5f848f62
X-MS-Exchange-CrossTenant-AuthSource: MW4PR01MB6228.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2026 22:20:08.1612
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VWUfkw5Nxfxndk4vXvkRGxD0vO4OflBpj8kURVK3LdmcmwsWqoonHkOowgz9plLaA6H2BikiMQcbPHMnctlPj49nYwrUmiCsmHijlBWHCmV3hiyreQQzDk1QjNFuTIgO
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR01MB7809


Hi Besar,

On Mon, 26 Jan 2026, Besar Wicaksono wrote:
> Adds Unified Coherent Fabric PMU support in Tegra410 SOC.
>
> Signed-off-by: Besar Wicaksono <bwicaksono@nvidia.com>

Looks good to me

Reviewed-by: Ilkka Koskinen <ilkka@os.amperecomputing.com>

--Ilkka


> ---
> Documentation/admin-guide/perf/index.rst      |   1 +
> .../admin-guide/perf/nvidia-tegra410-pmu.rst  | 106 ++++++++++++++++++
> drivers/perf/arm_cspmu/nvidia_cspmu.c         |  90 ++++++++++++++-
> 3 files changed, 196 insertions(+), 1 deletion(-)
> create mode 100644 Documentation/admin-guide/perf/nvidia-tegra410-pmu.rst
>
> diff --git a/Documentation/admin-guide/perf/index.rst b/Documentation/admin-guide/perf/index.rst
> index c407bb44b08e..aa12708ddb96 100644
> --- a/Documentation/admin-guide/perf/index.rst
> +++ b/Documentation/admin-guide/perf/index.rst
> @@ -25,6 +25,7 @@ Performance monitor support
>    alibaba_pmu
>    dwc_pcie_pmu
>    nvidia-tegra241-pmu
> +   nvidia-tegra410-pmu
>    meson-ddr-pmu
>    cxl
>    ampere_cspmu
> diff --git a/Documentation/admin-guide/perf/nvidia-tegra410-pmu.rst b/Documentation/admin-guide/perf/nvidia-tegra410-pmu.rst
> new file mode 100644
> index 000000000000..7b7ba5700ca1
> --- /dev/null
> +++ b/Documentation/admin-guide/perf/nvidia-tegra410-pmu.rst
> @@ -0,0 +1,106 @@
> +=====================================================================
> +NVIDIA Tegra410 SoC Uncore Performance Monitoring Unit (PMU)
> +=====================================================================
> +
> +The NVIDIA Tegra410 SoC includes various system PMUs to measure key performance
> +metrics like memory bandwidth, latency, and utilization:
> +
> +* Unified Coherence Fabric (UCF)
> +
> +PMU Driver
> +----------
> +
> +The PMU driver describes the available events and configuration of each PMU in
> +sysfs. Please see the sections below to get the sysfs path of each PMU. Like
> +other uncore PMU drivers, the driver provides "cpumask" sysfs attribute to show
> +the CPU id used to handle the PMU event. There is also "associated_cpus"
> +sysfs attribute, which contains a list of CPUs associated with the PMU instance.
> +
> +UCF PMU
> +-------
> +
> +The Unified Coherence Fabric (UCF) in the NVIDIA Tegra410 SoC serves as a
> +distributed cache, last level for CPU Memory and CXL Memory, and cache coherent
> +interconnect that supports hardware coherence across multiple coherently caching
> +agents, including:
> +
> +  * CPU clusters
> +  * GPU
> +  * PCIe Ordering Controller Unit (OCU)
> +  * Other IO-coherent requesters
> +
> +The events and configuration options of this PMU device are described in sysfs,
> +see /sys/bus/event_source/devices/nvidia_ucf_pmu_<socket-id>.
> +
> +Some of the events available in this PMU can be used to measure bandwidth and
> +utilization:
> +
> +  * slc_access_rd: count the number of read requests to SLC.
> +  * slc_access_wr: count the number of write requests to SLC.
> +  * slc_bytes_rd: count the number of bytes transferred by slc_access_rd.
> +  * slc_bytes_wr: count the number of bytes transferred by slc_access_wr.
> +  * mem_access_rd: count the number of read requests to local or remote memory.
> +  * mem_access_wr: count the number of write requests to local or remote memory.
> +  * mem_bytes_rd: count the number of bytes transferred by mem_access_rd.
> +  * mem_bytes_wr: count the number of bytes transferred by mem_access_wr.
> +  * cycles: counts the UCF cycles.
> +
> +The average bandwidth is calculated as::
> +
> +   AVG_SLC_READ_BANDWIDTH_IN_GBPS = SLC_BYTES_RD / ELAPSED_TIME_IN_NS
> +   AVG_SLC_WRITE_BANDWIDTH_IN_GBPS = SLC_BYTES_WR / ELAPSED_TIME_IN_NS
> +   AVG_MEM_READ_BANDWIDTH_IN_GBPS = MEM_BYTES_RD / ELAPSED_TIME_IN_NS
> +   AVG_MEM_WRITE_BANDWIDTH_IN_GBPS = MEM_BYTES_WR / ELAPSED_TIME_IN_NS
> +
> +The average request rate is calculated as::
> +
> +   AVG_SLC_READ_REQUEST_RATE = SLC_ACCESS_RD / CYCLES
> +   AVG_SLC_WRITE_REQUEST_RATE = SLC_ACCESS_WR / CYCLES
> +   AVG_MEM_READ_REQUEST_RATE = MEM_ACCESS_RD / CYCLES
> +   AVG_MEM_WRITE_REQUEST_RATE = MEM_ACCESS_WR / CYCLES
> +
> +More details about what other events are available can be found in Tegra410 SoC
> +technical reference manual.
> +
> +The events can be filtered based on source or destination. The source filter
> +indicates the traffic initiator to the SLC, e.g local CPU, non-CPU device, or
> +remote socket. The destination filter specifies the destination memory type,
> +e.g. local system memory (CMEM), local GPU memory (GMEM), or remote memory. The
> +local/remote classification of the destination filter is based on the home
> +socket of the address, not where the data actually resides. The available
> +filters are described in
> +/sys/bus/event_source/devices/nvidia_ucf_pmu_<socket-id>/format/.
> +
> +The list of UCF PMU event filters:
> +
> +* Source filter:
> +
> +  * src_loc_cpu: if set, count events from local CPU
> +  * src_loc_noncpu: if set, count events from local non-CPU device
> +  * src_rem: if set, count events from CPU, GPU, PCIE devices of remote socket
> +
> +* Destination filter:
> +
> +  * dst_loc_cmem: if set, count events to local system memory (CMEM) address
> +  * dst_loc_gmem: if set, count events to local GPU memory (GMEM) address
> +  * dst_loc_other: if set, count events to local CXL memory address
> +  * dst_rem: if set, count events to CPU, GPU, and CXL memory address of remote socket
> +
> +If the source is not specified, the PMU will count events from all sources. If
> +the destination is not specified, the PMU will count events to all destinations.
> +
> +Example usage:
> +
> +* Count event id 0x0 in socket 0 from all sources and to all destinations::
> +
> +    perf stat -a -e nvidia_ucf_pmu_0/event=0x0/
> +
> +* Count event id 0x0 in socket 0 with source filter = local CPU and destination
> +  filter = local system memory (CMEM)::
> +
> +    perf stat -a -e nvidia_ucf_pmu_0/event=0x0,src_loc_cpu=0x1,dst_loc_cmem=0x1/
> +
> +* Count event id 0x0 in socket 1 with source filter = local non-CPU device and
> +  destination filter = remote memory::
> +
> +    perf stat -a -e nvidia_ucf_pmu_1/event=0x0,src_loc_noncpu=0x1,dst_rem=0x1/
> diff --git a/drivers/perf/arm_cspmu/nvidia_cspmu.c b/drivers/perf/arm_cspmu/nvidia_cspmu.c
> index e06a06d3407b..c67667097a3c 100644
> --- a/drivers/perf/arm_cspmu/nvidia_cspmu.c
> +++ b/drivers/perf/arm_cspmu/nvidia_cspmu.c
> @@ -1,6 +1,6 @@
> // SPDX-License-Identifier: GPL-2.0
> /*
> - * Copyright (c) 2022-2023, NVIDIA CORPORATION & AFFILIATES. All rights reserved.
> + * Copyright (c) 2022-2026, NVIDIA CORPORATION & AFFILIATES. All rights reserved.
>  *
>  */
>
> @@ -21,6 +21,13 @@
> #define NV_CNVL_PORT_COUNT           4ULL
> #define NV_CNVL_FILTER_ID_MASK       GENMASK_ULL(NV_CNVL_PORT_COUNT - 1, 0)
>
> +#define NV_UCF_SRC_COUNT             3ULL
> +#define NV_UCF_DST_COUNT             4ULL
> +#define NV_UCF_FILTER_ID_MASK        GENMASK_ULL(11, 0)
> +#define NV_UCF_FILTER_SRC            GENMASK_ULL(2, 0)
> +#define NV_UCF_FILTER_DST            GENMASK_ULL(11, 8)
> +#define NV_UCF_FILTER_DEFAULT        (NV_UCF_FILTER_SRC | NV_UCF_FILTER_DST)
> +
> #define NV_GENERIC_FILTER_ID_MASK    GENMASK_ULL(31, 0)
>
> #define NV_PRODID_MASK	(PMIIDR_PRODUCTID | PMIIDR_VARIANT | PMIIDR_REVISION)
> @@ -124,6 +131,37 @@ static struct attribute *mcf_pmu_event_attrs[] = {
> 	NULL,
> };
>
> +static struct attribute *ucf_pmu_event_attrs[] = {
> +	ARM_CSPMU_EVENT_ATTR(bus_cycles,            0x1D),
> +
> +	ARM_CSPMU_EVENT_ATTR(slc_allocate,          0xF0),
> +	ARM_CSPMU_EVENT_ATTR(slc_wb,                0xF3),
> +	ARM_CSPMU_EVENT_ATTR(slc_refill_rd,         0x109),
> +	ARM_CSPMU_EVENT_ATTR(slc_refill_wr,         0x10A),
> +	ARM_CSPMU_EVENT_ATTR(slc_hit_rd,            0x119),
> +
> +	ARM_CSPMU_EVENT_ATTR(slc_access_dataless,   0x183),
> +	ARM_CSPMU_EVENT_ATTR(slc_access_atomic,     0x184),
> +
> +	ARM_CSPMU_EVENT_ATTR(slc_access,            0xF2),
> +	ARM_CSPMU_EVENT_ATTR(slc_access_rd,         0x111),
> +	ARM_CSPMU_EVENT_ATTR(slc_access_wr,         0x112),
> +	ARM_CSPMU_EVENT_ATTR(slc_bytes_rd,          0x113),
> +	ARM_CSPMU_EVENT_ATTR(slc_bytes_wr,          0x114),
> +
> +	ARM_CSPMU_EVENT_ATTR(mem_access_rd,         0x121),
> +	ARM_CSPMU_EVENT_ATTR(mem_access_wr,         0x122),
> +	ARM_CSPMU_EVENT_ATTR(mem_bytes_rd,          0x123),
> +	ARM_CSPMU_EVENT_ATTR(mem_bytes_wr,          0x124),
> +
> +	ARM_CSPMU_EVENT_ATTR(local_snoop,           0x180),
> +	ARM_CSPMU_EVENT_ATTR(ext_snp_access,        0x181),
> +	ARM_CSPMU_EVENT_ATTR(ext_snp_evict,         0x182),
> +
> +	ARM_CSPMU_EVENT_ATTR(cycles, ARM_CSPMU_EVT_CYCLES_DEFAULT),
> +	NULL,
> +};
> +
> static struct attribute *generic_pmu_event_attrs[] = {
> 	ARM_CSPMU_EVENT_ATTR(cycles, ARM_CSPMU_EVT_CYCLES_DEFAULT),
> 	NULL,
> @@ -152,6 +190,18 @@ static struct attribute *cnvlink_pmu_format_attrs[] = {
> 	NULL,
> };
>
> +static struct attribute *ucf_pmu_format_attrs[] = {
> +	ARM_CSPMU_FORMAT_EVENT_ATTR,
> +	ARM_CSPMU_FORMAT_ATTR(src_loc_noncpu, "config1:0"),
> +	ARM_CSPMU_FORMAT_ATTR(src_loc_cpu, "config1:1"),
> +	ARM_CSPMU_FORMAT_ATTR(src_rem, "config1:2"),
> +	ARM_CSPMU_FORMAT_ATTR(dst_loc_cmem, "config1:8"),
> +	ARM_CSPMU_FORMAT_ATTR(dst_loc_gmem, "config1:9"),
> +	ARM_CSPMU_FORMAT_ATTR(dst_loc_other, "config1:10"),
> +	ARM_CSPMU_FORMAT_ATTR(dst_rem, "config1:11"),
> +	NULL,
> +};
> +
> static struct attribute *generic_pmu_format_attrs[] = {
> 	ARM_CSPMU_FORMAT_EVENT_ATTR,
> 	ARM_CSPMU_FORMAT_FILTER_ATTR,
> @@ -236,6 +286,27 @@ static void nv_cspmu_set_cc_filter(struct arm_cspmu *cspmu,
> 	writel(filter, cspmu->base0 + PMCCFILTR);
> }
>
> +static u32 ucf_pmu_event_filter(const struct perf_event *event)
> +{
> +	u32 ret, filter, src, dst;
> +
> +	filter = nv_cspmu_event_filter(event);
> +
> +	/* Monitor all sources if none is selected. */
> +	src = FIELD_GET(NV_UCF_FILTER_SRC, filter);
> +	if (src == 0)
> +		src = GENMASK_ULL(NV_UCF_SRC_COUNT - 1, 0);
> +
> +	/* Monitor all destinations if none is selected. */
> +	dst = FIELD_GET(NV_UCF_FILTER_DST, filter);
> +	if (dst == 0)
> +		dst = GENMASK_ULL(NV_UCF_DST_COUNT - 1, 0);
> +
> +	ret = FIELD_PREP(NV_UCF_FILTER_SRC, src);
> +	ret |= FIELD_PREP(NV_UCF_FILTER_DST, dst);
> +
> +	return ret;
> +}
>
> enum nv_cspmu_name_fmt {
> 	NAME_FMT_GENERIC,
> @@ -342,6 +413,23 @@ static const struct nv_cspmu_match nv_cspmu_match[] = {
> 		.init_data = NULL
> 	  },
> 	},
> +	{
> +	  .prodid = 0x2CF20000,
> +	  .prodid_mask = NV_PRODID_MASK,
> +	  .name_pattern = "nvidia_ucf_pmu_%u",
> +	  .name_fmt = NAME_FMT_SOCKET,
> +	  .template_ctx = {
> +		.event_attr = ucf_pmu_event_attrs,
> +		.format_attr = ucf_pmu_format_attrs,
> +		.filter_mask = NV_UCF_FILTER_ID_MASK,
> +		.filter_default_val = NV_UCF_FILTER_DEFAULT,
> +		.filter2_mask = 0x0,
> +		.filter2_default_val = 0x0,
> +		.get_filter = ucf_pmu_event_filter,
> +		.get_filter2 = NULL,
> +		.init_data = NULL
> +	  },
> +	},
> 	{
> 	  .prodid = 0,
> 	  .prodid_mask = 0,
> -- 
> 2.43.0
>
>
