From: Ben Dooks <ben.dooks@codethink.co.uk>
Subject: Re: [PATCH v5 2/7] ASoC: tegra: Allow 24bit and 32bit
	samples
Date: Tue, 7 Jan 2020 10:35:11 +0000
Message-ID: <79ce7519-a544-9c22-15c7-865c56a1a57c@codethink.co.uk>
References: <20191018154833.7560-1-ben.dooks@codethink.co.uk>
 <d2110a1f-c1de-e2c5-a1ff-5eb4c5d3e1da@gmail.com>
 <b4e2ec44-bc89-b5ca-cfa7-a6d5c45a9c94@codethink.co.uk>
 <a11ba33e-5ffb-c5c6-04f5-0e031877c55f@gmail.com>
 <621fa27d-9259-2949-9cf5-d2eda5cb0677@gmail.com>
 <a0f027d9-e9e0-d76c-1e40-002fdc37eb5f@nvidia.com>
 <d43d518d-9336-a011-2a69-3f9331f6d0b4@codethink.co.uk>
 <aba4edd6-0ea5-5e95-c5a0-9e749587c763@nvidia.com>
 <449bdc3c-bf82-7cc4-6704-440dd100ca3a@gmail.com>
 <5d3ae629-5d30-0930-5dd1-15161e64926e@codethink.co.uk>
 <9daeeb94-2b90-18b8-2e1e-daae5acf079d@gmail.com>
 <fd73f68c-80f5-ac80-f6e4-42256d3df76d@codethink.co.uk>
 <37beb96a-a525-c72f-a7e1-e9ef5d61f3b2@gmail.com>
 <29db3df4-6f51-7c0f-1eef-90171f1d233a@codethink.co.uk>
 <9a5447e2-155c-7e6e-b8f1-95523c6f42c6@gmail.com>
 <b4a416fb-f2b1-660d-27e3-aebf602178f9@codethink.co.uk>
 <680e2dfd-6f4f-5c96-63b7-97520961dc82@gmail.com>
 <0e0cd260e39ad293edb881da1c565510@codethink.co.uk>
 <eb90ee78-e462-401a-de60-4a9bfc2a00c4@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <alsa-devel-bounces@alsa-project.org>
In-Reply-To: <eb90ee78-e462-401a-de60-4a9bfc2a00c4@nvidia.com>
Content-Language: en-GB
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>
To: Jon Hunter <jonathanh@nvidia.com>, Dmitry Osipenko <digetx@gmail.com>
Cc: linux-kernel@lists.codethink.co.uk, alsa-devel@alsa-project.org, Liam Girdwood <lgirdwood@gmail.com>, Takashi Iwai <tiwai@suse.com>, Mark Brown <broonie@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, Edward Cragg <edward.cragg@codethink.co.uk>, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

T24gMDcvMDEvMjAyMCAxMDoyOSwgSm9uIEh1bnRlciB3cm90ZToKPiAKPiBPbiAwNS8wMS8yMDIw
IDEwOjUzLCBCZW4gRG9va3Mgd3JvdGU6Cj4+Cj4+Cj4+IE9uIDIwMjAtMDEtMDUgMDE6NDgsIERt
aXRyeSBPc2lwZW5rbyB3cm90ZToKPj4+IDA1LjAxLjIwMjAgMDM6MDQsIEJlbiBEb29rcyDQv9C4
0YjQtdGCOgo+Pj4+IFtzbmlwXQo+Pj4+Cj4+Pj4gSSd2ZSBqdXN0IGdvbmUgdGhyb3VnaCB0ZXN0
aW5nLgo+Pj4+Cj4+Pj4gU29tZSBzaW1wbGUgZGF0YSB0ZXN0cyBzaG93IDE2IGFuZCAzMi1iaXRz
IHdvcmsuCj4+Pj4KPj4+PiBUaGUgMjQgYml0IGNhc2Ugc2VlbXMgdG8gYmUgd2VpcmQsIGl0IGxv
b2tzIGxpa2UgdGhlIDI0LWJpdCBleHBlY3RzCj4+Pj4gMjQgYml0IHNhbXBsZXMgaW4gMzIgYml0
IHdvcmRzLiBJIGNhbid0IHNlZSBhbnkgcGFja2luZyBvcHRpb25zIHRvCj4+Pj4gZG8gMjQgYml0
IGluIDI0IGJpdCwgc28gd2UgbWF5IGhhdmUgdG8gcmVtb3ZlIDI0IGJpdCBzYW1wbGUgc3VwcG9y
dAo+Pj4+ICh3aGljaCBpcyBhIHNoYW1lKQo+Pj4+Cj4+Pj4gTXkgcHJlZmVyZW5jZSBpcyB0byBy
ZW1vdmUgdGhlIDI0LWJpdCBzdXBwb3J0IGFuZCBrZWVwIHRoZSAzMiBiaXQgaW4uCj4+Pj4KPj4+
Cj4+PiBJbnRlcmVzdGluZy4uIEpvbiwgY291bGQgeW91IHBsZWFzZSBjb25maXJtIHRoYXQgMjRi
aXQgZm9ybWF0IGlzbid0Cj4+PiB1c2FibGUgb24gVDMwPwo+Pgo+PiBJZiB0aGVyZSBpcyBhbiBv
cHRpb24gb2YgMjQgcGFja2VkIGludG8gMzIsIHRoZW4gSSB0aGluayB0aGF0IHdvdWxkIHdvcmsu
Cj4+Cj4+IEkgY2FuIHRyeSB0ZXN0aW5nIHRoYXQgd2l0aCByYXcgZGF0YSBvbiBNb25kYXkuCj4g
Cj4gSSB3aWxsIGNoZWNrIG9uIHRoaXMuIEkgd291bGQgaGF2ZSB0aG91Z2h0IHRoYXQgUzI0X0xF
ICgyNC1iaXRzIHBhY2tlZAo+IGludG8gMzItYml0IGVsZW1lbnRzKSB3b3VsZCBiZSBmaW5lLiBU
eXBpY2FsbHkgd2UgZG9uJ3Qgc3VwcG9ydCBTMjRfM0xFCj4gKDI0LWJpdHMgaW4gMjQtYml0IGVs
ZW1lbnRzKS4KCkkgd2lsbCBoYXZlIGEgbG9vayBhZ2FpbiwgSSB0aG91Z2h0IFMyNCB3YXMgMjQt
aW4tMjQsIHNvIHdyb3RlIG15IHRlc3QKZ2VuZXJhdG9yIGNvZGUgdG8gZG8gdGhhdC4gSSdsbCBn
byBhbmQgc2VlIGlmIEkgY2FuIHJlLXRlc3QgdGhpcyBhcyBzb29uCmFzIHBvc3NpYmxlIChtYXkg
YmUgV2VkL1RodSBieSB0aGUgdGltZSBJIGNhbiBnZXQgdG8gY2hlY2sgaXQpCgotLSAKQmVuIERv
b2tzCQkJCWh0dHA6Ly93d3cuY29kZXRoaW5rLmNvLnVrLwpTZW5pb3IgRW5naW5lZXIJCQkJQ29k
ZXRoaW5rIC0gUHJvdmlkaW5nIEdlbml1cwoKaHR0cHM6Ly93d3cuY29kZXRoaW5rLmNvLnVrL3By
aXZhY3kuaHRtbApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpBbHNhLWRldmVsIG1haWxpbmcgbGlzdApBbHNhLWRldmVsQGFsc2EtcHJvamVjdC5vcmcKaHR0
cHM6Ly9tYWlsbWFuLmFsc2EtcHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbHNhLWRldmVs
Cg==
