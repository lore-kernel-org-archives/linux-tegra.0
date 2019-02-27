From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v3] ARM: tegra: enforce PM requirement
Date: Wed, 27 Feb 2019 16:31:51 +0300
Message-ID: <6e5bf310-12b5-26a3-f466-95cc56c6932a@gmail.com>
References: <1551255628-4794-1-git-send-email-spujar@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1551255628-4794-1-git-send-email-spujar@nvidia.com>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Sameer Pujar <spujar@nvidia.com>, linux@armlinux.org.uk, jhogan@kernel.org, jonathanh@nvidia.com, treding@nvidia.com
Cc: linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: linux-tegra@vger.kernel.org

MjcuMDIuMjAxOSAxMToyMCwgU2FtZWVyIFB1amFyINC/0LjRiNC10YI6Cj4gQ3VycmVudGx5IHJ1
bnRpbWUgUE0gaXMgZW5hYmxlZCBmb3IgVGVncmEgSERBIGRyaXZlci4gT25lIG9mIHRoZSBjb25j
ZXJuCj4gcmFpc2VkIHdhcyBhYm91dCBoYW5kbGluZyAhUE0gY2FzZSBpbiBIREEgZHJpdmVyLiBJ
biB0aGlzIGNhc2UsIHRoZXJlIGlzCj4gYSBuZWVkIHRvIG1hbmFnZSBjbG9ja3MgYW5kIHBvd2Vy
IGV4cGxpY2l0bHkgaW4gdGhlIGRyaXZlciBhbmQgcmV2aWV3ZXJzCj4gd2VyZSBub3QgcmVhbGx5
IGNvbnZpbmNlZCBhYm91dCB0aGlzLiBUaGUgY29uc2Vuc3VzIGF0IHRoZSBlbmQgd2FzIHRvCj4g
ZW5mb3JjZSBQTSByZXF1aXJlbWVudCB0byBrZWVwIHRoaW5ncyBzaW1wbGUsIHJhdGhlciBkcml2
ZXIgbWVudGlvbmluZyBhCj4gZGVwZW5kZW5jeSBvbiBQTS4gVGhpcyBpcyBob3cgaXQgaXMgZG9u
ZSBmb3IgQVJNIDY0LWJpdCBUZWdyYSBwbGF0Zm9ybXMKPiBhbmQgdGhlIHNhbWUgY2FuIGJlIGRv
bmUgZm9yIDMyLWJpdCBUZWdyYSBwbGF0Zm9ybXMgdG9vLgo+IAo+IEZpbmFsbHkgdGhlIG9iamVj
dGl2ZSBpcyB0byByZW1vdmUgZGVwZW5kZW5jeSBvbiBQTSBhdmFpbGFiaWxpdHkgZm9yIGFsbAo+
IFRlZ3JhIGRyaXZlcnMuIFRoZSBkZXRhaWxlZCBkaXNjdXNzaW9uIGNhbiBiZSBmb3VuZCBpbiBm
b2xsb3dpbmcgcGF0Y2gsCj4gaHR0cHM6Ly9wYXRjaHdvcmsub3psYWJzLm9yZy9wYXRjaC8xMDMx
MDA3Lwo+IAo+IFNpZ25lZC1vZmYtYnk6IFNhbWVlciBQdWphciA8c3B1amFyQG52aWRpYS5jb20+
Cj4gUmV2aWV3ZWQtYnk6IFRoaWVycnkgUmVkaW5nIDx0cmVkaW5nQG52aWRpYS5jb20+Cj4gUmV2
aWV3ZWQtYnk6IEpvbmF0aGFuIEh1bnRlciA8am9uYXRoYW5oQG52aWRpYS5jb20+Cj4gLS0tCgpU
aGUgY29tbWl0IG1lc3NhZ2UgaXMgb2theSB0byBtZSB0aGlzIHRpbWUsIHRoYW5rcyEgSSdtIHN0
aWxsIG5vdCBzdXBlci1oYXBweSB0byBsb3NlIHRoZSAhUE0gb3B0aW9uIGJlY2F1c2Ugb2YgaXRz
IHZhbHVlIGluIHJlZ2FyZHMgdG8gdGhlIFBNIGRlYnVnZ2luZywgYnV0IGFnYWluIHdlIGNhbiBq
dXN0IGRvIHNvbWV0aGluZyBiZXR0ZXIgaW4gdGhhdCByZWdhcmRzIGxhdGVyIG9uIGlmIHdpbGwg
YmUgcmVhbGx5IG5lZWRlZC4gICAKClJldmlld2VkLWJ5OiBEbWl0cnkgT3NpcGVua28gPGRpZ2V0
eEBnbWFpbC5jb20+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpsaW51eC1hcm0ta2VybmVsIG1haWxpbmcgbGlzdApsaW51eC1hcm0ta2VybmVsQGxpc3Rz
LmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1hcm0ta2VybmVsCg==
