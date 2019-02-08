From: Peter Rosin <peda@axentia.se>
Subject: Re: [PATCH V15 3/6] i2c: tegra: fix maximum transfer size
Date: Fri, 8 Feb 2019 14:12:31 +0000
Message-ID: <9e8f26bb-2159-6ca4-783e-91a73dac0823@axentia.se>
References: <1549576040-15907-1-git-send-email-skomatineni@nvidia.com>
 <1549576040-15907-3-git-send-email-skomatineni@nvidia.com>
 <1202cc91-cacf-673e-c32b-b4d1c78b71f2@gmail.com>
 <515cb722-c345-8dd6-dbe5-557dec0d1384@gmail.com>
 <a57f0374-8468-f24a-1743-b446b8260a46@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <a57f0374-8468-f24a-1743-b446b8260a46@gmail.com>
Content-Language: en-US
Content-ID: <5F24C5B0BABB034F8164F69C66B65F2C@eurprd02.prod.outlook.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>, Sowjanya Komatineni <skomatineni@nvidia.com>, "thierry.reding@gmail.com" <thierry.reding@gmail.com>, "jonathanh@nvidia.com" <jonathanh@nvidia.com>, "mkarthik@nvidia.com" <mkarthik@nvidia.com>, "smohammed@nvidia.com" <smohammed@nvidia.com>, "talho@nvidia.com" <talho@nvidia.com>
Cc: "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

T24gMjAxOS0wMi0wOCAxMzo0NiwgRG1pdHJ5IE9zaXBlbmtvIHdyb3RlOg0KPiAwOC4wMi4yMDE5
IDE6MjUsIERtaXRyeSBPc2lwZW5rbyDQv9C40YjQtdGCOg0KPj4+IDA4LjAyLjIwMTkgMToxNiwg
U293amFueWEgS29tYXRpbmVuaSDQv9C40YjQtdGCOj4gDQo+Pj4+PiBUaGlzIGlzIHdyb25nLCA2
NTUzNSA9IDY0ICogMTAyNCAtIDEuDQo+Pj4+Pg0KPj4+Pj4gTGV0J3MganVzdCB1c2Ugc2l6ZS1j
b25zdGFudHMgcHJvdmlkZWQgYnkga2VybmVsOg0KPj4+Pj4NCj4+Pj4+IHN0YXRpYyBjb25zdCBz
dHJ1Y3QgaTJjX2FkYXB0ZXJfcXVpcmtzIHRlZ3JhX2kyY19xdWlya3MgPSB7DQo+Pj4+PiAJLmZs
YWdzID0gSTJDX0FRX05PX1pFUk9fTEVOLA0KPj4+Pj4gCS5tYXhfcmVhZF9sZW4gPSBTWl80SywN
Cj4+Pj4+IAkubWF4X3dyaXRlX2xlbiA9IFNaXzRLIC0gSTJDX1BBQ0tFVF9IRUFERVJfU0laRSwg
fTsNCj4+Pj4+DQo+Pj4+PiBzdGF0aWMgY29uc3Qgc3RydWN0IGkyY19hZGFwdGVyX3F1aXJrcyB0
ZWdyYTE5NF9pMmNfcXVpcmtzID0gew0KPj4+Pj4gCS5mbGFncyA9IEkyQ19BUV9OT19aRVJPX0xF
TiwNCj4+Pj4+IAkubWF4X3JlYWRfbGVuID0gU1pfNjRLLA0KPj4+Pj4gCS5tYXhfd3JpdGVfbGVu
ID0gU1pfNjRLIC0gSTJDX1BBQ0tFVF9IRUFERVJfU0laRSwgfTsNCj4+Pj4+DQo+Pj4+Pg0KPj4+
Pj4gSSdsbCB0YWtlIGEgbG9vayBhdCBvdGhlciBwYXRjaGVzIGxhdGVyIHRvZGF5LCBubyBuZWVk
IHRvIHNlbmQgb3V0IG5ldyB2ZXJzaW9uIHJpZ2h0IG5vdy4NCj4+Pj4+DQo+Pj4+Pg0KPj4+Pg0K
Pj4+PiBTSVpFXzY0SyBpcyAweDAwMDEwMDAwICg2NTUzNikNCj4+Pj4NCj4+Pj4gbXNnIGxlbiBp
cyB1MTYgYW5kIG1heCB0aGF0IGNhbiBiZSBzZXQgdG8gbXNnLmxlbiBpcyA2NTUzNQ0KPj4NCj4+
IEFoLCBva2F5LiBUaGVuIGl0IGxvb2tzIGFib3V0IHJpZ2h0LCBtYXliZSBpdCdzIHRpbWUgdG8g
Y2hhbmdlIHUxNiB0byB1MzIgaW4gdGhlIEkyQyBjb3JlLg0KPj4NCj4gDQo+IEhlcmUgaXMgbXkg
c3VnZ2VzdGlvbjoNCj4gDQo+IDEpIFVzZSBTWl80SyAvIFNaXzY0SyB0aGF0IEkgc3VnZ2VzdGVk
IGFib3ZlLg0KPiANCj4gMikgU3F1YXNoIHRoaXMgcGF0Y2ggaW50byB0aGUgRE1BLXBhdGNoLg0K
PiANCj4gMykgQWRkIGFub3RoZXIgcGF0Y2ggKGJlZm9yZSB0aGUgRE1BLXBhdGNoKSB0aGF0IGNo
YW5nZXMgbWF4X3JlYWRfbGVuL21heF93cml0ZV9sZW4gdHlwZXMgdG8gdTMyIGluIHRoZSBpbmNs
dWRlL2xpbnV4L2kyYy5oDQoNClRoYXQgaXMgYSBiaXQgbmFpdmUgYW5kIHdpbGwgbm90IGZseSBz
aW5jZSB0aGUgSTJDIGNvcmUgaGFzIGEgbWF4IG1lc3NhZ2UNCnNpemUgb2YgNjU1MzUuIFdoaWNo
IGlzIGV4cG9zZWQgdG8gdXNlciBzcGFjZS4uLg0KDQpHaXZlbiB0aGUgYWJvdmUsIHNheWluZyAu
bWF4X3JlYWRfbGVuID0gNjU1MzUgYSBOT1AgKGFuZCBpcyBpbiBmYWN0IG9taXR0ZWQNCmluIHBs
YWNlcyB3aGVyZSBpdCB3b3VsZCBiZSBuZWVkZWQgaWYgdGhlIHR5cGUgaXMgY2hhbmdlZCkuIEkg
c3VnZ2VzdCB0aGF0DQppdCBpcyBvbWl0dGVkIGhlcmUgYXMgd2VsbC4gQnV0IFNaXzY0SyAtIEky
Q19QQUNLRVRfSEVBREVSX1NJWkUgaXMgc3RpbGwNCm5lZWRlZCBvZiBjb3Vyc2UuIEF0IGxlYXN0
IGlmIEkyQ19QQUNLRVRfSEVBREVSX1NJWkUgaXMgZ3VhcmFudGVlZCB0byBiZQ0Kbm9uLXplcm8/
DQoNCkNoZWVycywNClBldGVyDQo=
