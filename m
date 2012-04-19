From: Daniel Lezcano <daniel.lezcano@linaro.org>
Subject: Re: [RFC PATCH] cpuidle: allow per cpu latencies
Date: Thu, 19 Apr 2012 11:14:27 +0200
Message-ID: <4F8FD773.5030500@linaro.org>
References: <1333619620-21201-1-git-send-email-pdeschrijver@nvidia.com>
 <4F7DA009.4010802@linux.intel.com>
 <CAMQu2gzwe0F3qcaTqASEPUASdG1SjpUxrBrSp-RrYLgy3W24OQ@mail.gmail.com>
 <4F7F0D52.8080305@linaro.org>
 <20120410102857.GA22721@tbergstrom-lnx.Nvidia.com>
 <20120416153456.GB514@tbergstrom-lnx.Nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20120416153456.GB514@tbergstrom-lnx.Nvidia.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Peter De Schrijver <pdeschrijver@nvidia.com>
Cc: Kevin Hilman <khilman@ti.com>, Len Brown <len.brown@intel.com>, Trinabh Gupta <g.trinabh@gmail.com>, Russell King <linux@arm.linux.org.uk>, Stephen Warren <swarren@wwwdotorg.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Deepthi Dharwar <deepthi@linux.vnet.ibm.com>, Olof Johansson <olof@lixom.net>, "Shilimkar, Santosh" <santosh.shilimkar@ti.com>, Colin Cross <ccross@android.com>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, Rob Lee <rob.lee@linaro.org>, Arjan van de Ven <arjan@linux.intel.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Ricardo Salveti <ricardo.salveti@linaro.org>
List-Id: linux-tegra@vger.kernel.org

T24gMDQvMTYvMjAxMiAwNTozNCBQTSwgUGV0ZXIgRGUgU2NocmlqdmVyIHdyb3RlOgo+Pgo+PiBN
YXliZSB3ZSBhbHNvIHdhbnQgdG8gbWFrZSB0aGUgJ2Rpc2FibGVkJyBmbGFnIHBlciBDUFUgdGhl
biBvciBwcm92aWRlIHNvbWUKPj4gb3RoZXIgd2F5IHRoZSBudW1iZXIgb2YgQyBzdGF0ZXMgY2Fu
IGJlIGRpZmZlcmVudCBwZXIgQ1BVPwo+Cj4gV2hhdCBkbyB5b3UgdGhpbmsgYWJvdXQgdGhpcz8g
RG8gd2UgYWxzbyB3YW50IHRvIG1ha2UgdGhlIGRpc2FibGVkIGZsYWcgcGVyCj4gQ1BVPyBPciBo
b3cgc2hvdWxkIHdlIGRlYWwgd2l0aCBhIGRpZmZlcmVudCBudW1iZXIgb2YgQyBzdGF0ZXMgcGVy
IENQVT8KCkhpIFBldGVyLAoKeWVzLCB0aGF0IGNvdWxkIG1ha2VzIHNlbnNlLiBCdXQgaW4gbW9z
dCBvZiB0aGUgYXJjaGl0ZWN0dXJlLCB0aGlzIGlzIApub3QgbmVlZGVkLCBzbyBkdXBsaWNhdGlu
ZyB0aGUgc3RhdGUncyBhcnJheSBhbmQgbGF0ZW5jaWVzIGlzIHVubmVlZGVkIAptZW1vcnkgY29u
c3VtcHRpb24uCgpNYXliZSB3ZSBjYW4gbG9vayBmb3IgYSBDT1cgYXBwcm9hY2gsIHNpbWlsYXIg
dG8gd2hhdCBpcyBkb25lIGZvciB0aGUgCm5zcHJveHkgc3RydWN0dXJlLCBubyA/CgoKCi0tIAog
IDxodHRwOi8vd3d3LmxpbmFyby5vcmcvPiBMaW5hcm8ub3JnIOKUgiBPcGVuIHNvdXJjZSBzb2Z0
d2FyZSBmb3IgQVJNIFNvQ3MKCkZvbGxvdyBMaW5hcm86ICA8aHR0cDovL3d3dy5mYWNlYm9vay5j
b20vcGFnZXMvTGluYXJvPiBGYWNlYm9vayB8CjxodHRwOi8vdHdpdHRlci5jb20vIyEvbGluYXJv
b3JnPiBUd2l0dGVyIHwKPGh0dHA6Ly93d3cubGluYXJvLm9yZy9saW5hcm8tYmxvZy8+IEJsb2cK
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1h
cm0ta2VybmVsIG1haWxpbmcgbGlzdApsaW51eC1hcm0ta2VybmVsQGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hcm0t
a2VybmVsCg==
