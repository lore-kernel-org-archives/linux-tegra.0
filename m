Received: from CH5PR02CU005.outbound.protection.outlook.com (mail-northcentralusazon11012006.outbound.protection.outlook.com [40.107.200.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40B0F38F936
	for <linux-tegra@vger.kernel.org>; Thu, 22 Jan 2026 06:04:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.200.6
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769061901; cv=fail; b=JZSordrhfxMXz8Cq0DRsIn6K7QwWMIFXe/t8hBfaUqW3Gd9fZajParXF5J3fqe0ES7qCffWK+V5GLPxi3BBFvn/YBEiL2nGuBYl5oz/xi3pUD2rygziVOzjeSQ+a9wC+1QnVFqzSS4PpZxSs1I5GC0mLG0X/Mmm29Nvvi7WBhEE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769061901; c=relaxed/simple;
	bh=b/4uFaVU4oOw62+e92LPUtpeeP4HcwfsLHaT1zOrmb4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=c+kYGdwPn2EmFSndIj+qPsQkfhLfFRUSZbRJSIfoT5QPcPySwcZkIU9Eoj1m+gVjICszlaeBHbGJEKuGpSgGXtSsYqimsLUnu+9KFlSdF33GfDOVPtoH5w2sLiCQlH8ZBGgSZPGHYS9jy+GvWvOp3FcEHYg+buNkN1c6ZbioYSs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=DyTwh19k; arc=fail smtp.client-ip=40.107.200.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="DyTwh19k"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=x/T+Ppfnayje3J09vC2V81YekOsigViF8184HP/EWrfJEr0VSm7uj9zTyvxBgZIO8GJ/BvmrsEYZ4GiZAu1aJypY8uRtVtwKZC57Id2/ZeFyjFRjqD39ahKeEd1bUDDow9G7JD6BV4A5VEw+Dll3QyJx1jlsqVInfA3B9xSX1vWRG6RVt0/C6so9KPGjLH8RJAkkvRMaOa7J8BJEMEN6Yesel0rqGi4Av2aoWd/UeM4iuG6nGhGhWDA9XAhsE/T7aEPrGpyww6SlDget34qHFNU9QYj8rL2x4iujv5kiD43IT26nrTx94aTZpPpY94Fk9edlmiLOYNIYcx6V9/r+hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1eaIM9gBDaizOIiX5opOeOnkPl0grJ3v3EDCzDfBqjk=;
 b=NO6LxER6EwcufWzj8FCqc1VHK2X6BhYUH1OWPvuz2NmjQC519X2fe6jEqZ+GzsnPmYnQBhgPqRewJnO9HrZwjM8FgshvJnpRm+zJHolVkhNZl7D4AURblJVRwhTCivM+p2Mt/qGjt8bj4UBMychLLxHpX/XEJCiXQkKnspz/MZEalsG3/Er0dBA02wsigLw2ocmSQ2q+yGmLGdMiPolRiLLqupQCg26wwQQPhHuKOAEPx1WfaY9i/dE8bFXBSDaEDxdzHJcxjmimM8UGBkrUSjtgfNPJ5oJRPFGh3YatHiOITLlpPix3pyBfs8fE7+LlMJ9aomLf3Qxr/nMCzNVXzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1eaIM9gBDaizOIiX5opOeOnkPl0grJ3v3EDCzDfBqjk=;
 b=DyTwh19k0u9ENDfJMX8sGbYv+QW4rscnym16+ui9frc1yhH7hY9WUNhpTK75OD9PPQ/WNa4gFqyvWnDKVyzi85bE7PawAUx2IvxIOdGLNyVwmGVNbIEVkUyMBuiOARshbEb2aRpgygiZMoxjRu0UXhNloHyn3HBkC/K9GjteL6dTkLUArfROcYJCO6CjZ9h9ACTuzOpwQ0+RPnhrEeuzOSnVac+8ypziwQH581n9+OQ977RS6GNJIae0C4oV3RamG9iwa79Z4uW1F6JGv+xlHL4Nna5Oqb/BPVTtJt7kMo0NnQxLFVPKOLo7IwZYxjBFjo7QdD2z2tPlYIYWoF50qw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SJ2PR12MB9161.namprd12.prod.outlook.com (2603:10b6:a03:566::20)
 by PH7PR12MB6420.namprd12.prod.outlook.com (2603:10b6:510:1fc::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.10; Thu, 22 Jan
 2026 06:04:56 +0000
Received: from SJ2PR12MB9161.namprd12.prod.outlook.com
 ([fe80::1f16:244a:2a9d:2c93]) by SJ2PR12MB9161.namprd12.prod.outlook.com
 ([fe80::1f16:244a:2a9d:2c93%3]) with mapi id 15.20.9499.002; Thu, 22 Jan 2026
 06:04:56 +0000
From: Mikko Perttunen <mperttunen@nvidia.com>
To: thierry.reding@gmail.com, Chen Yufeng <chenyufeng@iie.ac.cn>
Cc: jonathanh@nvidia.com, linux-tegra@vger.kernel.org,
 Chen Yufeng <chenyufeng@iie.ac.cn>
Subject:
 Re: [PATCH] soc/tegra: regulators: Fix locking up when voltage-spread is out
 of range in tegra20
Date: Thu, 22 Jan 2026 15:04:53 +0900
Message-ID: <3602823.usQuhbGJ8B@senjougahara>
In-Reply-To: <20250906105021.721-1-chenyufeng@iie.ac.cn>
References: <20250906105021.721-1-chenyufeng@iie.ac.cn>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-ClientProxiedBy: TYCP286CA0073.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:31a::18) To SJ2PR12MB9161.namprd12.prod.outlook.com
 (2603:10b6:a03:566::20)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB9161:EE_|PH7PR12MB6420:EE_
X-MS-Office365-Filtering-Correlation-Id: be8f200b-bdd7-4f36-fac3-08de597c2ab4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|10070799003;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WUJraDZXbFp3Q0FkOSsxcnVjU1ZHS3dVcitFYzZ1ZitMMEVySG9Wc3RYUFgz?=
 =?utf-8?B?NFEyQnV6NXkxUEFGMk5BVDRBdXJFbjFKQi9LMnFBTGlDRGJWTzh0ZEdEUyt6?=
 =?utf-8?B?cXREUzZYMUp0UDBSZS9iWEpnS01lVTdOM2czUGd6SGF4Q3hkYzVFbWhkNk95?=
 =?utf-8?B?R2cvRU9udW5RelJDMHo1ZGp5bnlIQnFnVEo4Z2FaVE0zS3hGc2xKZ0VpaUxN?=
 =?utf-8?B?WXY2aEpqVnVRQzVVUlJKU21UaW1YVDR0UGhDV1g4QW04L1FvRTNneFI5K3dy?=
 =?utf-8?B?T0ZRa0dtQTgrWHFadkhwU05aVXMxTjlaMXpMVXRFdjM0QmEyMWVPdmFqV3Bw?=
 =?utf-8?B?dXRONlJyV2V0T1o1SGZPWk5qZDNQa0dESTlka0hZWDVRSmNtOGtMTnpQWkNH?=
 =?utf-8?B?alBnNmk2QjU2VXNQK2pMOGJ6ZWh0WmZ0akZ3MUtRWm4zTXhRRzNsSUFicUxN?=
 =?utf-8?B?djZmZUJFaTJqNXF3c1k3RmVBTGYvN1p0VnpCdXdFeGhoOUswUytQTWwrTHh4?=
 =?utf-8?B?Z1FzOU5ubW12T0xIOHlsSUJ2c09nZnlocmNXL3VBYVltMUM3Q1krL0FOUUtD?=
 =?utf-8?B?QjRlVS9SeGpGS1pVR2tDNCtXYXk5Q3lteTJyTU8ycjEwSnJkZEZNTmJoazBG?=
 =?utf-8?B?Mk0zRXcyL1lLUGNVczdVRTJpV1FZVzZSL3NDMzNCRWF1MG5WVTFTdDk4MklC?=
 =?utf-8?B?N3lLN2lwSi9WOXF5VzhIbVJsYTlEWHBSYi90Lzh5QkxxWUdSWHZiaVV3ZDJh?=
 =?utf-8?B?U3IyNnVKMEJYRDY0MEpQZjFxZ1pta1c3RFZsekF5ekNaT0swM0U5b0d1azM1?=
 =?utf-8?B?TGs1bjhYMTNlU1ZsZ3Z0aEF6UEE5UmJXaFB5NmFyNTU0TXFNUDlFOTc3VjRU?=
 =?utf-8?B?VkRQMW1NTkJBQklUbDhsZzdpT1lKS0ZnQkpoRTRUZWdab3FlcXo1OWRjQnJl?=
 =?utf-8?B?dHVkOHY2czYycFZlTDRJc0JrRGVFTW1MTS9ZTUVXLzJQWE5id1JZMHlCUnU3?=
 =?utf-8?B?OXN3WEV0d1laN3ZWejBZOXhGTVBxaTgxRlRvR3JEem5RRCt1OVhSTG1ORmZ2?=
 =?utf-8?B?eGVKRXEvb3pDa0poM2MxYXZVR3Y4cFUyaVVwTy9idThQbVJiUmUzRFdKL3B4?=
 =?utf-8?B?WVBQNVc1czdINlNHMGpIM3dkWjE5eGhWdXZ0RlRRSWQyOEpIcHRGQnY3djYz?=
 =?utf-8?B?VnIzMlVvczVKcDdhalBSUXQza2x2ZkllcFU1NFdHVTQ3SEx2YjUzMHdMc0Zz?=
 =?utf-8?B?NzBmeVRLQmxsRTNlR2dncEdhbkxmaXllYTVvSDNVcWdXUXI5bW5FRVVoWS9y?=
 =?utf-8?B?TWpkQ21lb2dDemxxbDZYMGhZcm5IQ0t1UWVXVDlhWlVHTXJvMUlpK1NTcTd4?=
 =?utf-8?B?MndJZ2RZRGszUGp6ZXh4NWRGVkNlSlc3aDFaNGlUNitZeXl6TzZkaDdMMlgv?=
 =?utf-8?B?dmxoc3Q4KzZhZUZzd0FZd0FxdlBqRFB5WmU3aGd4NHBYbFBrMFkwVlB6bzcr?=
 =?utf-8?B?ei9oSk51ZGhNaFFsRW5BbTdlS213WW8vQVltWGNvVXFmZUlLdVk2RldHRnlB?=
 =?utf-8?B?b2pCTStYR3R5bmtORTVLc0VUT1NDcmtRZXIzUFJOYzdZWjQ4MG9VNUZVM0ZN?=
 =?utf-8?B?ZldQK1hjS3dWL2hrNDZqYS9NLzdIYTREaE1GZnBicUJwUERid25za1dWRGhO?=
 =?utf-8?B?OGVzSVhZWEcvZ21NaElOVU54bWxmdm4wNjN0MFErZDNpSXRXSEZRQXVQa0oz?=
 =?utf-8?B?YnNnSGpqakh5UjRHS1R4bWRDTnB2ZzlUNWRUek4rcy9LMlVTdlh4Q1VxUFRm?=
 =?utf-8?B?QVRKamU1QlV2K0d1ZzNnOGNTK1lhUEthMFBhY0Y5azhjWFhNYmtib0I2N1Bm?=
 =?utf-8?B?cnBaNmtXNXBQRXAxcTEycThWRzU1TVJCZXlYcW5zL08xUlpWR2VJTytGK2tD?=
 =?utf-8?B?MElUVXY3RjYrNGxQZmNSTDhPZHp4OFBDSGlZYzNaUEI4QkVtR1Jtc1cxdTNu?=
 =?utf-8?B?SXUyUXdqSFUzeExaWlkvemJsVjU0bDgyN1JMaTBxb2NCTjhNOUhmZ0tOREk3?=
 =?utf-8?B?SVhYcHJCYWV2TkpvK3cwZ3FQemNuc1YxUEQ4a3FPQUpkL0hEM2dtTnpPc09D?=
 =?utf-8?Q?FtUE=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB9161.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(10070799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?a0UzSHl6b00zVVlsa2tXajQ5WnBRd2pQbUlRcDVYU3pwNEhsSTl6cm5iMVR3?=
 =?utf-8?B?dUEreG9BRURDZ0pLampyeTQ4TnQ3R1NZbmZpdVUwYnBtaGZoMVlzaW14YTJY?=
 =?utf-8?B?WlluUGc2MklRVEM5OHVLREJ4TERqZkE3WExoMUFsSlJTNHpJQkxtcWlIMWJx?=
 =?utf-8?B?TjQ3ci9YR2xLeWtYQ1phM0NKUXE1Y0RFNnRHWHE0RlBOdWVJMnpDaUlmQnBx?=
 =?utf-8?B?RnNYcktIMHpGWCtRMGV0KzJIbkdWaDQ0WTVpYlFJUlQ1Wm1Ya1FsS3pKZzFB?=
 =?utf-8?B?Rk9JbUx4LzdIajl0aUp1K2FDWXJpK0I5K2Y0NlNxcmgyQlFWaWxXUzc1aUNi?=
 =?utf-8?B?UVBSbXRQaEtRa1hZU1FKZTRmYVBPdnpJUGpKU3pRUVc2MkJIeDN4OG56Y2Nl?=
 =?utf-8?B?RXNJT1FEdzhnaXFBRFkvZnpkRmJWcnVPbHZ2N2RhUk83SG1kbXJLVWhDKy8x?=
 =?utf-8?B?S1VobzRMNTlDbWNVdit4aGlSWXp2cU12STh0ZUF4RkhPbXZqbnFGOHljNVhW?=
 =?utf-8?B?UVJxT0RIeG9CeUFON2pxRDhLN2pDbTdSTXh2SEIydGhPeDVYZkltOUNwUEF5?=
 =?utf-8?B?djJBU1BCcWlwRGdGQUpiOFgrSzdJbjJmR0RwSTFPZk1CVElFM0hkOGhwUzVQ?=
 =?utf-8?B?ZlEvOTRma0NqWFZlYzltSnhpNUM2akwvcXdjQU1YczBpbGpnSUpYS0tKTEdx?=
 =?utf-8?B?STMvcFhrS3FjZFNuNHQxZlpkVGtmZEpPb3FqNmwyZENjV2ZMb0dGMSs4N3dE?=
 =?utf-8?B?VjViZzZ2d1FhemNHdUp2bVlEV0ppQnR1aGtnWklHU0gyZGdLL1NWd09NZDRZ?=
 =?utf-8?B?TFkvZVBtRzQxRWRUVHA3NVBPMWxmQlVZNEtla0VtWkJ2VDhXNkM3VE9rUG9n?=
 =?utf-8?B?QkZHbTFjdWdrMWlwVWhjZ1JGQ3Y3bGMxVXJkYkpGcjcva1hZR2Y2VnlXWU5s?=
 =?utf-8?B?dVBudEdrQ0JVMmRoQnEycUtJVXFJaVNQUllBZkFpdWdiN09pTUpPNmJuazlE?=
 =?utf-8?B?OWlQejJXUU50OHEwM1ZLNklpek50OERpWjVyVkg2Z0pMcEgvNERCT1BOY0Fv?=
 =?utf-8?B?clhKdExkbG5sUmxVcGFlNVpzcnNoLyswM3NhR1g4VVoyWU4rYnovc1Zlek10?=
 =?utf-8?B?dmt1dmI3UklNdGRMckE4NEh6N04wS1FqZVVKenFFbi8wa0pQYSs3N0dBOXlJ?=
 =?utf-8?B?bll3bHlUbUc5WE5UQldYbHFrY2hIV3IxRWJxT0plOUZMbmRYN05xTWFwVVJB?=
 =?utf-8?B?UmZMTnRNdGdJOUhzS0dwSGg2R2hoamxFbGNoVjdZajdMY3Jmc1VPY2NJQ21h?=
 =?utf-8?B?cm00OHhxcHRaelpKeFZpVkE4UUtwM2lZMDd1c1puQ1d0NmFPNzMybE9hWG5s?=
 =?utf-8?B?OWw5K2hIVUpNRHUzVnRDWlB5YzRkMkVKQXFLUHpud0s3MjA5WTdNaUNYWnR5?=
 =?utf-8?B?RitlLy9qL0FaUENEb1p3WEpmZVp6MzZYcEd1ZE5XcHZlSUVHbjVrNGZ5aXg5?=
 =?utf-8?B?Y2xNNno2bmRyVGR1YUVlZ1dHQ3h6eGpDWUUrVStHcnZXOGVGTTQ2cVhhTzJa?=
 =?utf-8?B?NEhOZitNMFIyTHNZTkE1WE9aTEZvUWRrTWs0R21kOVdEVnJ3YmlLMUxDY09J?=
 =?utf-8?B?YVp5RU1VNHVFN0svUDZZVzVicEgxT213dEZBMTcyU1NaUmp1eWp2M0VvUzli?=
 =?utf-8?B?RVNsSmtGVU1xK09XdVFyR2VXMkZ1ZzViU1FaQ0FROTU1R1U5U1BXUEV2ZkUx?=
 =?utf-8?B?RjJqay9YSUNEUW13RlVkYkVTcVdqS0VWV0wzanFHdmlNUzNhWWZwYVZHKzBk?=
 =?utf-8?B?WkpCZ09aay9oVFd5SnJoTk42R1FUOVd2OVhzemdiWlFHTkZlZWNIbTBnY0k4?=
 =?utf-8?B?RVZPNmg1MGhxT1BpMkhESElZUzMwcGhzaC9pYVFKZW9mRktKbzFuZUYxbEZ3?=
 =?utf-8?B?T2hYVy9LNjNHMHh2dTBiWUhHbnZOKytSSjhFMnVVQ0VSMHZZQXV0V1Y3MmJi?=
 =?utf-8?B?NUJGaDJEblBHNkFrQmpzRWVvV0Y0WUpuaVdiSTBZRCtWZ3ZqQUVnMTNBUVpr?=
 =?utf-8?B?UjB6cEdqQUNVbHJKSHYrcEZ4bENCOExTVWFnUG5RTjBYMGRXLzE2M01oMmRN?=
 =?utf-8?B?Y0l5Q3RibVNkSmk3M2Z6RzVkMjJtWDVUcGsyZDFPaTZSbkQvWjZRMW94bTRm?=
 =?utf-8?B?eGZKcUFwL3hSb2pJMkpPYmNLQjkrMTVRdmlKQXZ4UlEvNWhxUE5TYnRmdmI3?=
 =?utf-8?B?dnVhd2lMRDliS2lreTFkR3owMFEvVG1tN254Yk9FaTV6ZnFmeWxXY1BzdjlX?=
 =?utf-8?B?aEtZclJVTmhsUjVMbHRkZGpMRXh0VUt0RXVSTXdRb3pWaTROUWVockROK2JZ?=
 =?utf-8?Q?hblhzuaJ2qEVFAwsiTgnKSWn47hSuGQRmp0UsqjdnmwHq?=
X-MS-Exchange-AntiSpam-MessageData-1: R9SZwxPTz1SCDg==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: be8f200b-bdd7-4f36-fac3-08de597c2ab4
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB9161.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2026 06:04:56.1418
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WqAT0kY668UClC453OTaszxgpbVhK5/G0h1K8S2YZ56NiL056msQfmbgd0Vn7pJ/LYWchR7uYbC667Mst0SSBg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6420

On Saturday, September 6, 2025 7:50=E2=80=AFPM Chen Yufeng wrote:
> This patch is similar to ef85bb582c41("soc/tegra: regulators: Fix
>  locking up when voltage-spread is out of range").
>=20
> A potential deadlock issue exists in the voltage coupler code for=20
> Tegra20 when the voltage spread (voltage-spread) goes out of range.
> The code does not properly account for the maximum voltage spread=20
> (max-spread) requirement when the CPU regulator has no consumers.
>=20
> In the tegra20_cpu_voltage_update function, the voltage range is=20
> not properly handled when there are no consumers:
> ```c
> if (!cpu_min_uV_consumers)
>     cpu_min_uV =3D cpu_uV;
> ```
> When there are no CPU consumers, cpu_min_uV is directly set to cpu_uV,=20
> without considering the maximum voltage spread constraint.
>=20
> The issue is resolved by introducing the max function to ensure that=20
> cpu_min_uV is set to the greater value between cpu_uV and cpu_min_uV,=20
> thereby preventing the voltage spread from exceeding the limit:
> ```c
> if (!cpu_min_uV_consumers)
>     cpu_min_uV =3D max(cpu_uV, cpu_min_uV);
> ```

I don't think this applies to this driver. If cpu_min_uV =3D=3D cpu_uV, no =
voltage change will occur, hence the voltage spread will not change.

Thanks,
Mikko

>=20
> Signed-off-by: Chen Yufeng <chenyufeng@iie.ac.cn>
> ---
>  drivers/soc/tegra/regulators-tegra20.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/soc/tegra/regulators-tegra20.c b/drivers/soc/tegra/r=
egulators-tegra20.c
> index 6a2f90ab9d3e..48c29b89fa59 100644
> --- a/drivers/soc/tegra/regulators-tegra20.c
> +++ b/drivers/soc/tegra/regulators-tegra20.c
> @@ -305,7 +305,7 @@ static int tegra20_cpu_voltage_update(struct tegra_re=
gulator_coupler *tegra,
>  	 * survive the voltage drop if it's running on a higher frequency.
>  	 */
>  	if (!cpu_min_uV_consumers)
> -		cpu_min_uV =3D cpu_uV;
> +		cpu_min_uV =3D max(cpu_uV, cpu_min_uV);
> =20
>  	/* restore boot voltage level */
>  	if (tegra->sys_reboot_mode)
>=20




