Received: from NAM04-DM6-obe.outbound.protection.outlook.com (mail-dm6nam04on2045.outbound.protection.outlook.com [40.107.102.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72DB04F5FB;
	Tue, 26 Dec 2023 16:28:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="lq1Gzb/F"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l9a6TS5ITyLWzNaNwmo6pROK42ChmqnMJ9GdmcX+209/jdOcqZRmgf0ZkVm/cJrApaL/x6PHG/SsV77AgrZKDWOhFy3UYNOv6E/diEqKtxR8y+CR/+Vchju4W31QHQni/902fpdsgFpqSPA1S0vej+OC6dV5FixG0XVfnw74m7LVDX2MHt8dvzCv7YTAifH1/6Yy8Op+mNTTwQHP0Wfj40BXw0r4NqolwZzFqouggfhXPJh6n/1W3eHmmRU+qPYWmaN/tgms6U1rgUKSNw6XaNi4mKY828kJI5ush1881NPQvWdpwlH1caa+vvpKUAwjB5xQXAvx+vezPmdJCj9ORg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kSi0JVAMc9crsASijpv6C6B1ahEoMsAWDuausAebxqY=;
 b=hsUuk6DL5vH2XBcDkFbe+zKw2SK2UkjB+nYPeb7l6jcCho0BEs8HsO9XcnWGWf1J3QYnM3z4abXnIFJ7nmjSqAusvv3kijAzXQqdQ0TcgN16aczi1LseHTck+mGSYxaVGTkdNodCvdu/9YWg6HT2vC0IS1HBiN4D1AienEYVX2+C/Q7/TUZcA0uw2mhpt1u907WjuVNO2xMvbDZRM6WXDpQihKGSE2smiuuliXWjl4hDM1NuyHMc6t9t5CDBV9XTw9KmgZFtBFj/9BRvihZieuiZGMzXOlwQ5ILkRJIZZ7i2kWVaAysLq9tusjcpdJcRE6FsUHHLztHli2SFrvoN5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kSi0JVAMc9crsASijpv6C6B1ahEoMsAWDuausAebxqY=;
 b=lq1Gzb/FeZbao6qRYYObBYF0pKD3eRa7NoSriQxdg6ljmcSxOvzsQUAWPnBS5qwj38pqV76GmDJX8966lLp/PelByBtXmmJqoK7BvxBV0krjAMZYqMAjW97ewPI7Ny3lAkYPfAyNS8QENIW5edlkO6f6YH9iGgsvFFzDAI8nN0i23e8ZypJcYgUSzxRbQj7jwWHvOfFsyr93cmi49aITtrmu3umJn/YO4qSo9S717nJ2s0mAy+w6dlWbUnHTAdAq7B8suHKbPgTBCaSK74fwLgIIB4sy2cTxLjtYlB66g2X83k+tJZ5ongW/bZM6K3vQ8a3jV6jEF/UWc8+UfvAcZQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BYAPR12MB3205.namprd12.prod.outlook.com (2603:10b6:a03:134::32)
 by SJ2PR12MB8718.namprd12.prod.outlook.com (2603:10b6:a03:540::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7113.27; Tue, 26 Dec
 2023 16:28:12 +0000
Received: from BYAPR12MB3205.namprd12.prod.outlook.com
 ([fe80::48ee:1bc7:7fdf:cd13]) by BYAPR12MB3205.namprd12.prod.outlook.com
 ([fe80::48ee:1bc7:7fdf:cd13%7]) with mapi id 15.20.7113.026; Tue, 26 Dec 2023
 16:28:12 +0000
Message-ID: <dfe363ef-4638-4b5e-8308-73e286ac0b50@nvidia.com>
Date: Tue, 26 Dec 2023 21:58:02 +0530
User-Agent: Mozilla Thunderbird
Content-Language: en-US
From: Sameer Pujar <spujar@nvidia.com>
To: alsa-devel@alsa-project.org,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 devicetree@vger.kernel.org
Cc: Mark Brown <broonie@kernel.org>, robh+dt@kernel.org,
 Thierry Reding <thierry.reding@gmail.com>, Jon Hunter
 <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org, spujar@nvidia.com
Subject: Query on audio-graph-card DT binding
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0056.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ac::12) To BYAPR12MB3205.namprd12.prod.outlook.com
 (2603:10b6:a03:134::32)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR12MB3205:EE_|SJ2PR12MB8718:EE_
X-MS-Office365-Filtering-Correlation-Id: 4bf9f11d-dc97-4e3d-1e4c-08dc062fa714
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	pqJwZ8X9OB32kBFTjX2kw4D5OAPZOx6teh+IBPYCQ60yeqy56sqDVRP1xxcrwR4v2zDy5YMzCYATMo19J0C3uoe0G7iVVI9IUH5s/uRq2EIJNQQQMnCqKAaon2Lnc7NULFE6KfH93bc3iOq9I8TgR220LXCTBhaAFPZEAnP1+XZltIsj+Tif8LnBXt5RgC35SxFH1p4dq80s04571/cq/QVaa2Ntct9AYS9tCGER0LVMLD9waN6HaXeGBpzhNUvnWBLYrjizcGzTPwDY/3Ig0Qvi/Mb0lMHwBnTWNoWlJO6v8yHy74LDJLqgoMh7Qw2wUFfdRkEkYFGhnI/WBxCb9ThLzIn4x2NEGSHVTnZJycBbGvsQu8hM1P58g677A08GBnHSQHIpmhJ5O2tApCik22dBEiRxKzwP8CDkmNXIEgkDmRi42aNA+rHi69bQI23DqgoZtzvCeH7hl124dWRiDitkOZLffL2U9SIqTTlVAvHbELhoJSK88ZvFOLJA5vv5T0SDN7WkaZYCrQfWBiYbX/oUCxWg0Luu23L4Z+QPcfWIzZ8cB5cbGaz59EGdTaBaLi/v1A9qGt0ccjr0z8LW5BOUgeRUQ74/SU688S2DCFH8mTjQEwMWg6FouaWn8fvzvn//AMciZTgp/1yCQBBQXR8lqEYy30T6maF4RFZEpb9/mpNjg6kLOEizJLb5IaXp
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB3205.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(396003)(346002)(376002)(39860400002)(366004)(230922051799003)(451199024)(186009)(64100799003)(1800799012)(54906003)(66946007)(66556008)(66476007)(6666004)(6512007)(6506007)(6486002)(2013699003)(478600001)(36756003)(2616005)(107886003)(26005)(31696002)(86362001)(38100700002)(2906002)(5660300002)(31686004)(4744005)(41300700001)(8936002)(8676002)(316002)(4326008)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SHZKdGZFYzNOVHYyQ0huTU13b1AvTXZ4UFJwaWUrZmc0L3BZUU1RMG5Db2RE?=
 =?utf-8?B?TkJJMm5sQnUxMUgrVlZPbjZVN2FmVUROUmZ2MTB0QlRNWTBXNko3am9wdXlN?=
 =?utf-8?B?Vm5peGZIYUNvMzZublE4bU5zcnhkL2VnWWZtaTlDZmtwN05BNGlwVm84TXVU?=
 =?utf-8?B?RmZLdEpMd2RVZWV6SkVnalVVNi9vbC9KYXFHTVlaUHFkcHJ1YzZNeWVLZmZL?=
 =?utf-8?B?eHNiemQxcFIvdUF3NSt1WkVBUHVUTHZQRHN1bHAvVEMrUytjU0d2ZzdQZ0oy?=
 =?utf-8?B?ZXV2MFFQd1duWklpa0FHK0kyNkJWZGJpUTRDNWlHZGFneFNtQUgyaXhhaFR6?=
 =?utf-8?B?dHpic093SDE5NlNGL1VidDdUYnhieWpjVkZmOUpQVTZ3TzhmaVpEUWZ1SFRs?=
 =?utf-8?B?N2doWmRaMnk0U2I0eWhkQ2VoaTg3Q05zRk1XNElLYjhnYTJqTGNQbGtKR0xF?=
 =?utf-8?B?b01xdFFONXg0U3ZCNVljWE5sOWUzMUFXRStmdGRoN25BQndFUStxbGdmckw4?=
 =?utf-8?B?WVBJUHc0aVExV1dRR0R0bXBlQ1NEem5nbjYra3UxSVJCMzRZSU1odVFNNEJU?=
 =?utf-8?B?OHV5SVVneEhqWksva3JpclJpcjlFMWRCZ3dwc3NKMXgrRjNhcHU3LzNWU2Ry?=
 =?utf-8?B?M1M3Z29walJwQmVZNVBkcWhOelgrNHlrdmFYa3N0WTE2dkRIY2NBdHg0RGV1?=
 =?utf-8?B?SS9ZenM0bVhFZjVxMGpQL01sNjJpcy9tcHdGbjlpd2Nwcmxhb01ydGo1NVk4?=
 =?utf-8?B?YldHR3JVTFZuYkMrSk5XdHhSSHB6K1ptUGtqUVh5VjhRTXIrdG5iZXllV3N2?=
 =?utf-8?B?RHZMdnQ3cElKMnBpUFF1MXZaY2oraCt1N0lHd0tsVHJYaFcvL2lqcmpTUzRP?=
 =?utf-8?B?YUVJblhrc2kxOGhOTnZkdS9sTUE2cGgvOEk3N1huZ3paZ0QrcWFFck5kSk1r?=
 =?utf-8?B?ZXRRM25Wa1Z6QjNIbkdlbzB1Ym1LRHorR256enZYWEJIVG9UaXZ2RFlYVU1G?=
 =?utf-8?B?S2JhVjIxSEZ2eVZpY0RWMkpEUXEvK3l0S1VjYm5FaXY1T2FiekNQdnVMQ09D?=
 =?utf-8?B?S1U3czJ6b0xmdjZTdFQxakR0Q09MM0g4U1pHcytIWjNXMzh2SWd0cEZwb0w1?=
 =?utf-8?B?dVJnL2lzTGMvUHRrejcvcDlQc0N3WVBYMnNHT0dDazJPY3VYd3pyVzdVQjNi?=
 =?utf-8?B?b2dUQm5zQTRZQk1Fa3FOQUhwV3IzOHlNMVlUM1hrUkUwV2dKVHZ0S0lhbHJV?=
 =?utf-8?B?ek5yMGtyRTJFM21wRlVtdTFkclJaZHF4NXVVOHFGZnhRS0s0UXVtZG5LUDdR?=
 =?utf-8?B?bi9aN1RlZWlBUmhybksxZzNRMTVCbi9abTBveVVrOEV3OG9RQ0lsRitwcW1s?=
 =?utf-8?B?T092YWVKYjlPOGtYQWdIQk8ySHlEVnMycXRKTHRpMTVkTHhXWitERVExa1ZC?=
 =?utf-8?B?Y1RGS0kxMnErclVaMGdZTDJnMkhObEJrS2wycHpKbFZOZEZYM2plbTRuZ3R0?=
 =?utf-8?B?SjRudVhMNWJld2YyUGk5L1duSWNDOXFMdHp2bGM3Sy9ZZWp3Ny9DOGZ0QTRZ?=
 =?utf-8?B?eVJOTjhYZHFzMGRmSFBLNUdJS2hJUkhMNjB3c1F6VXhERWdVVTI3bEdDSXVi?=
 =?utf-8?B?alVDQ05GVXE3UHFQYTFJRHJ3ZE1NQjNuMlRiYlBGZVlEMFhKS0k1alhxVExk?=
 =?utf-8?B?OGZWdWtNZm5LeklCdDhOS0l6VUdTY2dFUUw2WExBckc2UVZaRElUOHdEWDdr?=
 =?utf-8?B?dTZzUGhwQVBOeE5EZlA5K1h6ZHV0eCs1SHZONjlERzAvbDU1bWQ1ckprWldQ?=
 =?utf-8?B?eEIxVDZFckhZU2FoekZKNXZ6Q1hsRW0xMmpuMEtWMHBhMzNRZ1NEUTg2V3dL?=
 =?utf-8?B?RCtuZ25nQkRTM1A4NCtiRHVNLzRmeHBYc0g0T3ZqeFQwOVY2cW8zUGlBOUF1?=
 =?utf-8?B?ODdGZVQ1MFVqajkvaForYW1hQTZ2U1NlSEhrR0NNbzBEamdRZG9LSzRqS0RB?=
 =?utf-8?B?MjhJeTNwYjZuL25KSkp6aStDdzJqUEEzdkVSMEtVZnd1LzJyT0dSTDVId2xN?=
 =?utf-8?B?eldDcDNrbnZtSUl2VmNSVzBUeHROcXdCU0x5Tjlsb3BWeHd3ck9keDk2TlZU?=
 =?utf-8?Q?QL+fSHoAa7/llWJMiboAE7g6U?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4bf9f11d-dc97-4e3d-1e4c-08dc062fa714
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB3205.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Dec 2023 16:28:12.0081
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: B2ZBu7KIb4EaMD7GcLhLv6/0c0tuGFe4x94dZj0xSknbdFvnRftWAQtAiDTcB92DrkDx4xQt9xiuS2O/lqkhTw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8718

Hi Morimoto-san,

This question is regarding audio-graph-card.c driver related DT binding.

I am looking to enable following DAI link connection in device tree for 
Tegra audio:

               /-----> codec1 endpoint
              /
CPU endpoint \
               \-----> codec2 endpoint


I see that, "remote-endpoint" property can only specify single phandle 
object for connection to a remote endpoint. In other words, the link can 
be one-to-one. For illustration, please see below example. However I see 
it leads to a build error if phandle-array is provided for 
"remote-endpoint" property.

  cpu_port {
      cpu_ep: endpoint {
          remote-endpoint = <&codec1_ep>, <&codec2_ep>;
      };
  };

  codec1 {
      codec1_ep: endpoint {
          remote-endpoint = <&cpu_ep>;
      };
  };

  codec2 {
      codec2_ep: endpoint {
          remote-endpoint = <&cpu_ep>;
      };
  };

Is there a possibility to re-use the same CPU endpoint for connecting to 
multiple codec endpoints like shown in above example?


Thanks,
Sameer.
