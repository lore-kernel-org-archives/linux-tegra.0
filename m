From: Kejia Hu <kejia.hu@codethink.co.uk>
Subject: Re: [PATCH 5/5] clk: tegra: add tegra20 automotive init
Date: Fri, 08 Feb 2019 10:10:09 +0000
Message-ID: <1549620609.19850.1.camel@codethink.co.uk>
References: <20190207125408.8776-1-kejia.hu@codethink.co.uk>
 <20190207125408.8776-6-kejia.hu@codethink.co.uk>
 <7f300cd5-2b97-17fb-da06-b212a8fae647@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <7f300cd5-2b97-17fb-da06-b212a8fae647@gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Dmitry Osipenko <digetx@gmail.com>, linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Thomas Preston <thomas.preston@codethink.co.uk>
List-Id: linux-tegra@vger.kernel.org

T24gVGh1LCAyMDE5LTAyLTA3IGF0IDE2OjIzICswMzAwLCBEbWl0cnkgT3NpcGVua28gd3JvdGU6
Cj4gdGhpcyBhbGwgbG9va3MgdmVyeSBnZW5lcmljIGFuZCBtdWNoIG1vcmUgYm9hcmQtc3BlY2lm
aWMgdGhhbiBhdXRvbW90aXZlCgpIaSwKClRoYW5rcyBmb3IgeW91ciByZXBseS4KCldlIGdvdCB0
aGUgY2xvY2sgZGF0YSBmcm9tIG52aWRpYSBwZGsgZm9yIHRoZSBhdXRvbW90aXZlIHdoaWNoIGRp
ZG4ndApzZXQgdGhlIGNsb2NrcyB1cCBpbiB0aGUgc2FtZSB3YXkgYXMgY29tbWVyY2lhbCBwYXJ0
cywgYW5kIHdlIHdlcmUgdG9sZAp0aGF0IHRoZXJlIGFyZSBjZXJ0YWluIGNsb2NrIHJlc3RyaWN0
aW9ucyBmb3IgdGhlIGF1dG9tb3RpdmUgcGFydHMgdGhhdAp0aGUgY29tbWVyY2lhbCBvbmVzIGRv
IG5vdCBoYXZlLgoKQXBwbHlpbmcgZGlmZmVyZW50IGNsb2NrIGNvbmZpZ3MgZm9yIGVhY2ggbm9k
ZXMgZG9lc24ndCBzZWVtcyB0byBiZSBhCmdvb2Qgd2F5LCBhcyB0aGV5IHdpbGwgYmUgdG9vIHNj
YXR0ZXJlZCBpbiB0aGUgZGV2aWNlIHRyZWUuIFdlIHByb3Bvc2VkCnRvIGFkZCBhIG5ldyByb290
IG5vZGUgZm9yIHRoZSBjbG9jayBvcmlnaW5hbGx5WzFdLCBhbmQgZnVydGhlcgpkaXNjdXNzaW9u
IHN1Z2dlc3RlZCB1cyB0byBkaXN0aW5ndWlzaCB0aGUgdmFyaWF0aW9uIGJ5IHJlYWRpbmcgdGhl
IFNLVQppbmZvLCB0aHVzIGNhbWUgdGhpcyBwYXRjaC4gV2UgY2FuIGRpc2N1c3MgZnVydGhlciB0
aG91Z2guCgpSZWdhcmRzCgpbMV0gaHR0cHM6Ly93d3cuc3Bpbmljcy5uZXQvbGlzdHMvYXJtLWtl
cm5lbC9tc2c2NjUzNDQuaHRtbAotLSAKS2VqaWEgSHUKU29mdHdhcmUgRGV2ZWxvcGVyCgpDb2Rl
dGhpbmsgTHRkCjNyZCBGbG9vciBEYWxlIEhvdXNlCjM1IERhbGUgU3RyZWV0Ck1hbmNoZXN0ZXIK
TTEgMkhGClVuaXRlZCBLaW5nZG9tCgpDb2RldGhpbmsgZGVsaXZlcnMgY3V0dGluZyBlZGdlIG9w
ZW4gc291cmNlIGRlc2lnbiwgZGV2ZWxvcG1lbnQgYW5kCmludGVncmF0aW9uIHNlcnZpY2VzLgoK
aHR0cDovL2NvZGV0aGluay5jby51awpPZmZpY2U6ICs0NCAxNjEgMjM2IDU1NzUKaHR0cHM6Ly93
d3cuY29kZXRoaW5rLmNvLnVrL3ByaXZhY3kuaHRtbMKgCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hcm0ta2VybmVsIG1haWxpbmcgbGlzdAps
aW51eC1hcm0ta2VybmVsQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hcm0ta2VybmVsCg==
