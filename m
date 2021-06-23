Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.6 required=3.0 tests=BAYES_00,
	CHARSET_FARAWAY_HEADER,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5DDF6C4743C
	for <linux-tegra@archiver.kernel.org>; Wed, 23 Jun 2021 11:34:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 386D061076
	for <linux-tegra@archiver.kernel.org>; Wed, 23 Jun 2021 11:34:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230061AbhFWLhL (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 23 Jun 2021 07:37:11 -0400
Received: from szxga01-in.huawei.com ([45.249.212.187]:11088 "EHLO
        szxga01-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230031AbhFWLhL (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 23 Jun 2021 07:37:11 -0400
Received: from dggeme758-chm.china.huawei.com (unknown [172.30.72.54])
        by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4G91Lt2MrkzZhXG;
        Wed, 23 Jun 2021 19:31:50 +0800 (CST)
Received: from dggeme759-chm.china.huawei.com (10.3.19.105) by
 dggeme758-chm.china.huawei.com (10.3.19.104) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2176.2; Wed, 23 Jun 2021 19:34:50 +0800
Received: from dggeme759-chm.china.huawei.com ([10.8.81.151]) by
 dggeme759-chm.china.huawei.com ([10.8.81.151]) with mapi id 15.01.2176.012;
 Wed, 23 Jun 2021 19:34:50 +0800
From:   "tiantao (H)" <tiantao6@hisilicon.com>
Subject: =?gb2312?B?tPC4tDogW1BBVENIIHYyIDAyLzIyXSBkcm0vaGlibWM6IENhbGwgZHJtX2ly?=
 =?gb2312?Q?q=5Funinstall()_unconditionally?=
Thread-Topic: [PATCH v2 02/22] drm/hibmc: Call drm_irq_uninstall()
 unconditionally
Thread-Index: AQHXZ3BTceWJbDn8OEasIrWUx4ImYqsheBbQ
Date:   Wed, 23 Jun 2021 11:34:50 +0000
Message-ID: <f64f8ee5ca4a4dd3a67fe64a89feabe8@hisilicon.com>
References: <20210622141002.11590-1-tzimmermann@suse.de>
 <20210622141002.11590-3-tzimmermann@suse.de>
In-Reply-To: <20210622141002.11590-3-tzimmermann@suse.de>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.40.188.144]
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-CFilter-Loop: Reflected
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

DQoNCi0tLS0t08q8/tStvP4tLS0tLQ0Kt6K8/sjLOiBUaG9tYXMgWmltbWVybWFubiBbbWFpbHRv
OnR6aW1tZXJtYW5uQHN1c2UuZGVdIA0Kt6LLzcqxvOQ6IDIwMjHE6jbUwjIyyNUgMjI6MTANCsrV
vP7IyzogZGFuaWVsQGZmd2xsLmNoOyBhaXJsaWVkQGxpbnV4LmllOyBhbGV4YW5kZXIuZGV1Y2hl
ckBhbWQuY29tOyBjaHJpc3RpYW4ua29lbmlnQGFtZC5jb207IFhpbmh1aS5QYW5AYW1kLmNvbTsg
amFtZXMucWlhbi53YW5nQGFybS5jb207IGxpdml1LmR1ZGF1QGFybS5jb207IG1paGFpbC5hdGFu
YXNzb3ZAYXJtLmNvbTsgYnJpYW4uc3RhcmtleUBhcm0uY29tOyBtYWFydGVuLmxhbmtob3JzdEBs
aW51eC5pbnRlbC5jb207IG1yaXBhcmRAa2VybmVsLm9yZzsgaW5raS5kYWVAc2Ftc3VuZy5jb207
IGp5MDkyMi5zaGltQHNhbXN1bmcuY29tOyBzdzAzMTIua2ltQHNhbXN1bmcuY29tOyBreXVuZ21p
bi5wYXJrQHNhbXN1bmcuY29tOyBrcnp5c3p0b2Yua296bG93c2tpQGNhbm9uaWNhbC5jb207IHhp
bmxpYW5nLmxpdUBsaW5hcm8ub3JnOyB0aWFudGFvIChIKSA8dGlhbnRhbzZAaGlzaWxpY29uLmNv
bT47IGpvaG4uc3R1bHR6QGxpbmFyby5vcmc7IGtvbmd4aW53ZWkgKEEpIDxrb25nLmtvbmd4aW53
ZWlAaGlzaWxpY29uLmNvbT47IENoZW5mZW5nIChwdWNrKSA8cHVjay5jaGVuQGhpc2lsaWNvbi5j
b20+OyBsYXVyZW50aXUucGFsY3VAb3NzLm54cC5jb207IGwuc3RhY2hAcGVuZ3V0cm9uaXguZGU7
IHAuemFiZWxAcGVuZ3V0cm9uaXguZGU7IHNoYXduZ3VvQGtlcm5lbC5vcmc7IHMuaGF1ZXJAcGVu
Z3V0cm9uaXguZGU7IGtlcm5lbEBwZW5ndXRyb25peC5kZTsgZmVzdGV2YW1AZ21haWwuY29tOyBs
aW51eC1pbXhAbnhwLmNvbTsgY2h1bmt1YW5nLmh1QGtlcm5lbC5vcmc7IG1hdHRoaWFzLmJnZ0Bn
bWFpbC5jb207IGJza2VnZ3NAcmVkaGF0LmNvbTsgdG9tYmFAa2VybmVsLm9yZzsgaGpjQHJvY2st
Y2hpcHMuY29tOyBoZWlrb0BzbnRlY2guZGU7IGJlbmphbWluLmdhaWduYXJkQGxpbmFyby5vcmc7
IHlhbm5pY2suZmVydHJlQGZvc3Muc3QuY29tOyBwaGlsaXBwZS5jb3JudUBmb3NzLnN0LmNvbTsg
bWNvcXVlbGluLnN0bTMyQGdtYWlsLmNvbTsgYWxleGFuZHJlLnRvcmd1ZUBmb3NzLnN0LmNvbTsg
d2Vuc0Bjc2llLm9yZzsgamVybmVqLnNrcmFiZWNAZ21haWwuY29tOyB0aGllcnJ5LnJlZGluZ0Bn
bWFpbC5jb207IGpvbmF0aGFuaEBudmlkaWEuY29tOyBqeXJpLnNhcmhhQGlraS5maTsgZW1tYUBh
bmhvbHQubmV0OyBsaW51eC1ncmFwaGljcy1tYWludGFpbmVyQHZtd2FyZS5jb207IHphY2tyQHZt
d2FyZS5jb207IGh5dW4ua3dvbkB4aWxpbnguY29tOyBsYXVyZW50LnBpbmNoYXJ0QGlkZWFzb25i
b2FyZC5jb207IG1pY2hhbC5zaW1la0B4aWxpbnguY29tDQqzrcvNOiBhbWQtZ2Z4QGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZzsgZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsgbGludXgtYXJt
LWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3JnOyBsaW51eC1zYW1zdW5nLXNvY0B2Z2VyLmtlcm5l
bC5vcmc7IGxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmc7IG5vdXZlYXVAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnOyBsaW51eC1yb2NrY2hpcEBsaXN0cy5pbmZyYWRlYWQub3JnOyBsaW51
eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tOyBsaW51eC1zdW54aUBsaXN0cy5s
aW51eC5kZXY7IGxpbnV4LXRlZ3JhQHZnZXIua2VybmVsLm9yZzsgVGhvbWFzIFppbW1lcm1hbm4g
PHR6aW1tZXJtYW5uQHN1c2UuZGU+DQrW98ziOiBbUEFUQ0ggdjIgMDIvMjJdIGRybS9oaWJtYzog
Q2FsbCBkcm1faXJxX3VuaW5zdGFsbCgpIHVuY29uZGl0aW9uYWxseQ0KDQpSZW1vdmUgdGhlIGNo
ZWNrIGFyb3VuZCBkcm1faXJxX3VuaW5zdGFsbCgpLiBUaGUgc2FtZSB0ZXN0IGlzIGRvbmUgYnkg
dGhlIGZ1bmN0aW9uIGludGVybmFsbHkuIFRoZSB0ZXN0ZWQgc3RhdGUgaW4gaXJxX2VuYWJsZWQg
aXMgY29uc2lkZXJlZCBvYnNvbGV0ZSBhbmQgc2hvdWxkIG5vdCBiZSB1c2VkIGJ5IEtNUyBkcml2
ZXJzLg0KDQpTaWduZWQtb2ZmLWJ5OiBUaG9tYXMgWmltbWVybWFubiA8dHppbW1lcm1hbm5Ac3Vz
ZS5kZT4NCi0tLQ0KIGRyaXZlcnMvZ3B1L2RybS9oaXNpbGljb24vaGlibWMvaGlibWNfZHJtX2Ry
di5jIHwgMyArLS0NCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDIgZGVsZXRpb25z
KC0pDQoNCkFja2VkLWJ5OiBUaWFuIFRhbyA8dGlhbnRhbzZAaGlzaWxpY29uLmNvbT4NCg0KZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9oaXNpbGljb24vaGlibWMvaGlibWNfZHJtX2Rydi5j
IGIvZHJpdmVycy9ncHUvZHJtL2hpc2lsaWNvbi9oaWJtYy9oaWJtY19kcm1fZHJ2LmMNCmluZGV4
IGY0YmM1Mzg2NTc0YS4uZjhlZjcxMWJiZTVkIDEwMDY0NA0KLS0tIGEvZHJpdmVycy9ncHUvZHJt
L2hpc2lsaWNvbi9oaWJtYy9oaWJtY19kcm1fZHJ2LmMNCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9o
aXNpbGljb24vaGlibWMvaGlibWNfZHJtX2Rydi5jDQpAQCAtMjUzLDggKzI1Myw3IEBAIHN0YXRp
YyBpbnQgaGlibWNfdW5sb2FkKHN0cnVjdCBkcm1fZGV2aWNlICpkZXYpICB7DQogCWRybV9hdG9t
aWNfaGVscGVyX3NodXRkb3duKGRldik7DQogDQotCWlmIChkZXYtPmlycV9lbmFibGVkKQ0KLQkJ
ZHJtX2lycV91bmluc3RhbGwoZGV2KTsNCisJZHJtX2lycV91bmluc3RhbGwoZGV2KTsNCiANCiAJ
cGNpX2Rpc2FibGVfbXNpKHRvX3BjaV9kZXYoZGV2LT5kZXYpKTsNCiANCi0tDQoyLjMyLjANCg0K
