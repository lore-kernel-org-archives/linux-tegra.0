Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8EFB6C433F5
	for <linux-tegra@archiver.kernel.org>; Thu, 21 Oct 2021 01:27:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7552760F6E
	for <linux-tegra@archiver.kernel.org>; Thu, 21 Oct 2021 01:27:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231520AbhJUB34 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 20 Oct 2021 21:29:56 -0400
Received: from mail-eopbgr1310121.outbound.protection.outlook.com ([40.107.131.121]:38784
        "EHLO APC01-SG2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S231532AbhJUB3w (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 20 Oct 2021 21:29:52 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Uj24N13TVRMMjyDpqYk0h5Wjh3IwLKc+6jNUy4dNINXX+kBBmj3IOwCUHvUi9dXoNAuZZeRPe/4w2rt5lZEq4Oc4P4+X3qKYKCHGdEt0bCrRaZS1TGo4+kK1wVqBxUYzJYMwpuHJRP/6hYiZ8zy11+v7wybAyOSrEZMNVRmjyf8qkBenmJ+9awAhV6m2JGlswA2AWsT/RLY0oxzj+pybz8ZgJG6MutXMxMfM1RYKzDGdOAYtuvoKYuD2tZwIrfZr1CN6/rldWTE6qEZUjrWj1Rj+RiE+Sf1HMZzzi2Na5jPg4FWZgCgs8o7P2s4lMM/U/SbU1gp7ejHke2cw5Uu5Iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dRpfzWG98LniQsdmEae25weIzT2C4JBfS3AfKsi3rv8=;
 b=N6uJziS2Wtxf+J4YbwjLcpjAtH4etoERimUZ+aIENgVH/yqMOGbSTo5F/u5Ty5RRtYB2E1/2CWdKNcjTpSZwarEkNOXuRKXI78aknNiT3SYMzMGGR71XzzXvXdVoE9Nx3yp+TH4ditlMUOXORH0dJjlEd6tpKf3Ie9YO+lx+Il+D79KyQ87SC5QFDKoOOE0yXTogBPBVXjomsm+0wk4Np2MlV/jM/kCdHdMuY9owuew4sUoNPmGFZAniXPl0VuNppgdfacUY0ndX9WzjkvPkYP6L9CwZmAs0THKQoSXTTI/sVmnhmWra09r/qPMcEhQI8sxW7eXUeIpvEA25PK3JXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo0.onmicrosoft.com;
 s=selector2-vivo0-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dRpfzWG98LniQsdmEae25weIzT2C4JBfS3AfKsi3rv8=;
 b=T1IUq6y/8dN2hQAAHWOdNoqEIaliqWI75sW9QgT1F79eyHwx+k7FGJxU/D3KDY5izz5VoDfmdmakC46VaYb+9uvcU5zlPo93h/cJV3qOA5TRvVamryhCoGkt2WdeZJPVS1tCzlIyQDB5ET+IoRBb6EKO/h7XfUauS2tqeIvT9YQ=
Received: from SL2PR06MB3082.apcprd06.prod.outlook.com (2603:1096:100:37::17)
 by SL2PR06MB3226.apcprd06.prod.outlook.com (2603:1096:100:35::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.18; Thu, 21 Oct
 2021 01:27:34 +0000
Received: from SL2PR06MB3082.apcprd06.prod.outlook.com
 ([fe80::4c9b:b71f:fb67:6414]) by SL2PR06MB3082.apcprd06.prod.outlook.com
 ([fe80::4c9b:b71f:fb67:6414%6]) with mapi id 15.20.4608.019; Thu, 21 Oct 2021
 01:27:33 +0000
From:   =?utf-8?B?546L5pOO?= <wangqing@vivo.com>
To:     =?utf-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>
CC:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: =?utf-8?B?5Zue5aSNOiBbUEFUQ0hdIGZpcm13YXJlOiB0ZWdyYTogc3dpdGNoIG92ZXIg?=
 =?utf-8?Q?to_memdup=5Fuser()?=
Thread-Topic: [PATCH] firmware: tegra: switch over to memdup_user()
Thread-Index: AQHXw/YjY9KWWyQ2rEaVftvt2FTm/avcqmKAgAACUsw=
Date:   Thu, 21 Oct 2021 01:27:33 +0000
Message-ID: <SL2PR06MB3082C7F7EC6998AE99A66244BDBF9@SL2PR06MB3082.apcprd06.prod.outlook.com>
References: <1634543982-36727-1-git-send-email-wangqing@vivo.com>
 <AJsAPABcEiDeZ4ZDMvu*CapV.9.1634778945247.Hmail.wangqing@vivo.com>
In-Reply-To: <AJsAPABcEiDeZ4ZDMvu*CapV.9.1634778945247.Hmail.wangqing@vivo.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
suggested_attachment_session_id: 32c81d1a-03b5-0689-3edb-a85f89e8b8e4
authentication-results: rere.qmqm.pl; dkim=none (message not signed)
 header.d=none;rere.qmqm.pl; dmarc=none action=none header.from=vivo.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b143e54b-5ffa-4781-3eae-08d99431f54f
x-ms-traffictypediagnostic: SL2PR06MB3226:
x-microsoft-antispam-prvs: <SL2PR06MB3226D43B36BEF9C146481793BDBF9@SL2PR06MB3226.apcprd06.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2958;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: VYlg+G+LBSVts8E90a7K8ryiJyDctCKH4Uy8OMwSny6AexD5OKrE6h2ziGiZviZA+oWBoTvA8Qp1pa78rvXw4bffu77G51tYf2Ko7KL2MYMi0VmlHm/TmaQPHsa4Z+UhmJNsvOZx7EpCdn0pPUgh4UF5SLwcOO68ykNdFVoKE5NYHjHOBBtLyhJBiIIbJXRDMh1xYLB4u2KqV6Qt2UQe3wWKx429irb+rOaTNwAhiGugssZn8cd2MVf15I3VslCwkP08RA7kea53nQiSdW04OPp9v/Hx9PikpHL+xw3Dn1WPUxNvgcffo2vCfgTHWRvkXyKD9Cl5YdK6l40HwcZKclwC7pU+/DT0cglZOPMZebP8GZ3zniyjCcn9Ot+iidFHRhzPQ8LVApU75vENEldX2RYk6pOrNH7l7HEUVZuYyAdbfgYN0jP04GuBQHebSbZdqmJMh0VEiQJTbNKn/5H02qvfBOxaMItBb71h+JbNu/fCyRZx/1EOgXPbRrCifUECqeEsYqMn3KGRzMoOYAdItM8z6EwjgMQO3NIj01ZIML71acFVv8ItCoUkCX86WVsQ4Isy2o50haBKYTclyv9itKy/SyvjWMXU/gGsBYK5fYLlhCfgxjxZ29eVHIsvAeJqD/3dKMt1idp23yqYOoQ2YFvt+acyhKjWk/WiE89PAXzyv9BGPp7QFb/6dMpaHwhKyH+fr8BWhbMbmyInwsDQfQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SL2PR06MB3082.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(7696005)(55016002)(316002)(52536014)(54906003)(4744005)(33656002)(86362001)(26005)(186003)(508600001)(38070700005)(6506007)(71200400001)(76116006)(4326008)(66556008)(66946007)(66476007)(9686003)(64756008)(5660300002)(66446008)(2906002)(85182001)(224303003)(91956017)(38100700002)(8936002)(122000001)(6916009);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WjNqWmhDYzJnOFMrQjlvbzRlTGRjYUp1QjhaNitCb3c4cVQ2T0I5eXYvVVlC?=
 =?utf-8?B?amNHdlRMU2dWWldJNkpFYWViNVZ3RDVKUU4vT3N1MEhqa2VPZHF3Qmc4UnBn?=
 =?utf-8?B?RU4ycEtJUk1SMlY4ME9SVHQvVjlHaVJIQ1hOT04wTVFmOW5hd296RXo5ZjBl?=
 =?utf-8?B?aG5KSjRTZ0cvYkdSRGZSU1VnaklIQTJPR0JGV1dKN05SbEQ2Sk9CMVdkRk1E?=
 =?utf-8?B?WHorcWR1MVhzdU1idXJYa3BZait4eVVRMXJSbXhJdXNkbnArVUlLN2NqVGJT?=
 =?utf-8?B?dVYyRFR6am8wZk1yUkVLcXZrNE04SitUbGRkWTlPOTh5cDJWdDE4QVY0QnFu?=
 =?utf-8?B?b3VXcklFVWZvb1Urd1MrYkw4eTFqdDdwOXZhejJBUmxTV0MxbE9UaEJURU1o?=
 =?utf-8?B?eTZZT3RNakFnWU1lN1J1SUFrQ0JwOWwrcEFpN0ZRVThHNi9JTExiRzdZYTJx?=
 =?utf-8?B?TDNGczdlN3dHQnBrZ2hPVTRocmU0MnNwcVZEY28zaTF4T3A4UXN5WUhIZlBv?=
 =?utf-8?B?SE8rZjEyZXdFNmIzbG1xa3BqRW9JQ3RJakk2eVM0Z1hpU1NuWVB0OGNXbHlN?=
 =?utf-8?B?SlZFUE4wZDRaQXBKUnREQnZNRlN4bWswbkFTMjNmaW9DcjZ0bnN3QVBicVZO?=
 =?utf-8?B?N3kxTUxjcnhPL3p4TkpqU2Njelg4TGEwRDJkZlNhNVJpVHdCZTUzM3RFcllo?=
 =?utf-8?B?MHY2S0NDQzNyYWdjM1pLcVhMUjFnaWJrMnpCNzl1MWJLWkNIVGo4Rks0Q0JN?=
 =?utf-8?B?RGM3Tjh4V0hwZHBueUY0aUdWWnlzTU00ZkYyVlVKOVRYNFRheG1Yd0FKT2lQ?=
 =?utf-8?B?VXV4R1ZlNE5ERnlwVFljZkVTYXVHUTlBdU4zMjEyVG04WHlwUXdKa0lDRzcx?=
 =?utf-8?B?VHRPRHdZNk1aVXlqWG02cFF1Y1AxTnljUXROTHJCTUN0WTd4c25nOGs1OU4z?=
 =?utf-8?B?WmwwZXVPa3N4UzNwV0o1enhpeHpnRHBVRjZlRnlzUUpnNzFLblFmZmtjQlJY?=
 =?utf-8?B?V3RzR3IrRS8xWmpZckdmcWtVVkhRNS94OXRIdHZ6T0htWWVZQ1pxL1RVTi8w?=
 =?utf-8?B?QW9tYjJhdXp2Y1FvMTRZdzlwcU9seHA2ZXBIbHVCNyswQmRIRG5YRCtkTDRX?=
 =?utf-8?B?SmFwakZBKzF5VXpPUXRFQzF4NTZHa256amVoM3ZoM1hBMHhOeHdBNWE4TGtI?=
 =?utf-8?B?aGR1UlZPSFdJTVA2dDNmOUVvRjZTQWhZZEh4cDM1Qy9sUjV2UTRZQTJQSnBv?=
 =?utf-8?B?cHdpeG5lVDFIbEQ1d0o2SWI5Q3hLdjRObzFHMVo0MjVMaVNtMW9qdG9YT2J3?=
 =?utf-8?B?dGQ3RUd2TkkzWFB1Q3lwa2pHL2lUWXdOSHN6aENROXlaSmZncDdVRU9ZSXZ5?=
 =?utf-8?B?djM1Ri9nbm40TWVrcTNFQjJRN3VIWUU3NGRLb3pNcDNpY0RTTC9yTUZRa3Vr?=
 =?utf-8?B?Z1dUdVdJTzJvUjNwQ2JNamcxV3ltYnFzcWRLRWdtT2FBVmpLSzJkbDQ5Nm03?=
 =?utf-8?B?ZTdWS1hSWG01V1VIeGx4Z2NKL2VNRE8xcHR6bWlvb2dHSitPeHR2K3ZGL0N5?=
 =?utf-8?B?bnVpVmNyNDFTOEdvOElaWThmQnFWOXR0V3ErejlvVmQ4NkhlUTBXY254cEE0?=
 =?utf-8?B?SHhpZktqWUJocU52Z0cxS1hlRUNmK01iU243MW5SWTVPY0p4SkhwSTZNSWJ5?=
 =?utf-8?B?Vmdnb09mbFJ5M2Q4QnJlbHBhcjBQTVdWN2ZvTUpJdGgzN0kzd1JWLzJJL1Zw?=
 =?utf-8?B?Ukt2SGdrUHl3aXVpMDN6T0ZDdlc5dW5aajl5UktieFhibzBFeG9pcDVOazBW?=
 =?utf-8?B?UHBQQ09SUGxUaTVhTzd0SGRmN1I3OGxkZEdySVZFdTFTeEtmb04yc1A3VmxF?=
 =?utf-8?B?VVplMTl1NmoxYnZ4S0VVa0oxTWdPTE1Ta2JlMitkQVhsMXVKWHZPRlUzTHZW?=
 =?utf-8?B?QnB1eVZqOWFMRDl4Vk5CNTZsRVlqQ2lvSWx1KzBidUYyRWQxMzR4YThpaGk2?=
 =?utf-8?B?bk45VHNveTI3MmlUN00yakJrZXNBMVJicmVRWEhDOHp5U2JlS2Ezdkhzajlt?=
 =?utf-8?B?cDgrRTIzcDV2MW9MTmh5NGpNSFRhMFQ3dnd1YjB2ZllaRUtiYi9TRElBQmhF?=
 =?utf-8?B?cS9NYmQzZXFVQlBpcjdpRkNwSkNlYWJEbHdXakhOUWhNd1ZiNlUzaWRnZ28x?=
 =?utf-8?B?eGc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SL2PR06MB3082.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b143e54b-5ffa-4781-3eae-08d99431f54f
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Oct 2021 01:27:33.7546
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GKE+6rs+ncAO0pNLVDJKMMXqbCL5V9VfgANg6z97YBujbKUeGW3xDfdK/I9G+K4w3DhSjnAZ7ZTqEaia8tvXGw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SL2PR06MB3226
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Cj4+IC0tLSBhL2RyaXZlcnMvZmlybXdhcmUvdGVncmEvYnBtcC1kZWJ1Z2ZzLmMKPj4gKysrIGIv
ZHJpdmVycy9maXJtd2FyZS90ZWdyYS9icG1wLWRlYnVnZnMuYwo+PiBAQCAtMzc2LDE4ICszNzYs
MTEgQEAgc3RhdGljIHNzaXplX3QgYnBtcF9kZWJ1Z19zdG9yZShzdHJ1Y3QgZmlsZSAqZmlsZSwg
Y29uc3QgY2hhciBfX3VzZXIgKmJ1ZiwKPj7CoMKgwqDCoMKgwqDCoCBpZiAoIWZpbGVuYW1lKQo+
PsKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCByZXR1cm4gLUVOT0VOVDsKPj7CoCAKPj4g
LcKgwqDCoMKgIGRhdGFidWYgPSBrbWFsbG9jKGNvdW50LCBHRlBfS0VSTkVMKTsKPj4gLcKgwqDC
oMKgIGlmICghZGF0YWJ1ZikKPj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCByZXR1cm4gLUVO
T01FTTsKPj4gLQo+PiAtwqDCoMKgwqAgaWYgKGNvcHlfZnJvbV91c2VyKGRhdGFidWYsIGJ1Ziwg
Y291bnQpKSB7Cj4+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZXJyID0gLUVGQVVMVDsKPj4g
LcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBnb3RvIGZyZWVfcmV0Owo+PiAtwqDCoMKgwqAgfQo+
PiArwqDCoMKgwqAgZGF0YWJ1ZiA9IG1lbWR1cF91c2VyKGJ1ZiwgY291bnQpOwo+PiArwqDCoMKg
wqAgaWYgKElTX0VSUihkYXRhYnVmKSkKPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCByZXR1
cm4gRVJSX1BUUihQVFJfRVJSKGRhdGFidWYpKTsKPgo+RVJSX1BUUigpIGlzIHRvbyBtdWNoIGhl
cmUuCj4KPkJlc3QgUmVnYXJkcwo+TWljaGHFgsKgTWlyb3PFgmF3CgpTb3JyeSBhYm91dCB0aGF0
LCBJIGhhdmUgcmVzZW50IHRoZSBwYXRjaCwgUGxlYXNlIGlnbm9yZSB0aGlzIHZlcnNpb24uCgpU
aGFua3MsClFpbmc=
