From: Sowjanya Komatineni <skomatineni@nvidia.com>
Subject: RE: [PATCH V9 3/5] i2c: tegra: Add DMA support
Date: Tue, 5 Feb 2019 01:37:04 +0000
Message-ID: <DM6PR12MB34033CFF789C5115721B5BAEC26E0@DM6PR12MB3403.namprd12.prod.outlook.com>
References: <1549040867-18149-1-git-send-email-skomatineni@nvidia.com>
 <1549040867-18149-3-git-send-email-skomatineni@nvidia.com>
 <467a3ac8-5667-66bf-50eb-7d21a103d901@gmail.com>
 <fa8a64fd-87e5-a70c-5ee7-c6c100b712c1@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <fa8a64fd-87e5-a70c-5ee7-c6c100b712c1@gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>, "thierry.reding@gmail.com" <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Mantravadi Karthik <mkarthik@nvidia.com>, Shardar Mohammed <smohammed@nvidia.com>, Timo Alho <talho@nvidia.com>
Cc: "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

PiBJIGtub3cgdGhhdCBBUEIgRE1BIGRyaXZlciBlbmFibGVzIGZsb3cgY29udHJvbCBiYXNlZCBv
biB0aGUgY2hhbm5lbHMgc3BlYywgYnV0IHN0aWxsIHdvbid0IGh1cnQgdG8gZXhwbGljaXRseSBz
aG93IHRoYXQgY2hhbm5lbHMgYXJlIGZsb3ctY29udHJvbGxlZC4gSWRlYWxseSBBUEIgRE1BIGRy
aXZlciBzaG91bGQgcmVzcGVjdCB0aGUgZGV2aWNlX2ZjIGZpZWxkLg0KPg0KPgkJZG1hX3Njb25m
aWcuZGV2aWNlX2ZjID0gdHJ1ZTsNCg0KDQpEbWl0cnksDQpUaGFua3MgZm9yIGFsbCBmZWVkYmFj
ay4gU2VudCB1cGRhdGVkIHBhdGNoIFYxMCB3aGljaCBoYXMgYWxsIGJlbG93IFY5IGZlZWRiYWNr
IGNoYW5nZXMuDQoNCi0gQWRkZWQgZXhwbGljaXQgZmxvdyBjb250cm9sIHNldHRpbmdzIHRvIGRt
YSBzbGF2ZSBjb25maWcgYW5kIGVycm9yIGNoZWNrIHNvIG5lZWQgdG8gbW92ZSByZWxlYXNpbmcg
b2YgZG1hIHJlc291cmNlcyB0byBzZXBhcmF0ZSBmdW5jdGlvbiBhcyBJIGFtIHVzaW5nIGl0IG11
bHRpcGxlIHBsYWNlcyAod2hlbiBkbWEgc2xhdmUgY29uZmlnIGZhaWxlZCwgb24gdGVncmEgZHJp
dmUgcmVtb3ZlLCB0ZWdyYV9pMmNfaW5pdF9kbWEpLg0KQXMgYSBwYXJ0IG9mIHRoaXMsIG1vdmVk
IGVycm9yIGhhbmRsaW5nIGFsc28gaW5zaWRlIGluaXRfZG1hIGFzIHlvdSBzdWdnZXN0ZWQgaW4g
ZWFybGllciBmZWVkYmFjay4NCi0gQWRkZWQgYXBiZG1hIGh3IHN1cHBvcnQgZmxhZyB0byBub3cg
YWxsb3cgVGVncmExODYgYW5kIGxhdGVyIHVzZSBBUEJETUEgZHJpdmVyLg0KLSBVcGRhdGVkIHRv
IHJlZ2lzdGVyIHRlZ3JhX2kyY19kcml2ZXIgZnJvbSBtb2R1bGUgbGV2ZWwgcmF0aGVyIHRoYW4g
c3Vic3lzIGxldmVsLg0KLSBGaXhlZCB0aW1lb3V0IGZvciBidXMgY2xlYXIgdG8gNTBtcyAoMTBt
cyBpcyBlbm91Z2ggYnV0IGNvbnNpZGVyaW5nIHNsYXZlcyByZXNwb25kaW5nIHNsb3cpLiBBbHNv
IGFkZGVkIGFkYXB0ZXIgdGltZW91dCB0byA2cyBjb25zaWRlcmluZyB3b3JzdCBjYXNlIHRyYW5z
ZmVyIHJhdGUuDQotIG90aGVyIG1pbm9yIGZpeGVzLg0KDQpQbGVhc2UgcmV2aWV3Lg0KLSBTb3dq
YW55YQ0KDQo=
