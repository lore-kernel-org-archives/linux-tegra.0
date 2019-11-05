From: Ben Dooks <ben.dooks@codethink.co.uk>
Subject: Re: [PATCH v4 3/7] ASoC: tegra: i2s: Add support for
 more than 2 channels
Date: Tue, 5 Nov 2019 11:58:06 +0000
Message-ID: <5d069991-f5c3-ae14-da9c-9b20555be4f6@codethink.co.uk>
References: <20191007153136.4920-1-ben.dooks@codethink.co.uk>
 <20191007153136.4920-4-ben.dooks@codethink.co.uk>
 <cfd308bd-290a-f72f-6876-d94151c09843@gmail.com>
 <16910e8d-4745-4e55-0436-9b3200876037@codethink.co.uk>
 <1e43701b-3627-ba6d-ee19-020e25af3ef1@gmail.com>
 <d03a8fa0-3c62-1e32-9ca6-06d1996da11b@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <alsa-devel-bounces@alsa-project.org>
In-Reply-To: <d03a8fa0-3c62-1e32-9ca6-06d1996da11b@nvidia.com>
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
To: Jon Hunter <jonathanh@nvidia.com>, Dmitry Osipenko <digetx@gmail.com>, linux-tegra@vger.kernel.org, alsa-devel@alsa-project.org, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Thierry Reding <thierry.reding@gmail.com>
Cc: linux-kernel@lists.codethink.co.uk, Edward Cragg <edward.cragg@codethink.co.uk>
List-Id: linux-tegra@vger.kernel.org

T24gMjQvMTAvMjAxOSAxNzoxMSwgSm9uIEh1bnRlciB3cm90ZToKPiAKPiBPbiAxNy8xMC8yMDE5
IDE4OjM4LCBEbWl0cnkgT3NpcGVua28gd3JvdGU6Cj4+IDE3LjEwLjIwMTkgMTk6MjMsIEJlbiBE
b29rcyDQv9C40YjQtdGCOgo+Pj4gT24gMDgvMTAvMjAxOSAxNjoyOSwgRG1pdHJ5IE9zaXBlbmtv
IHdyb3RlOgo+Pj4+IEhlbGxvIEJlbiwKPj4gVGFrZSBhIGxvb2sgaGVyZSBmb3IgZXhhbXBsZToK
Pj4KPj4gaHR0cHM6Ly9udi10ZWdyYS5udmlkaWEuY29tL2dpdHdlYi8/cD1saW51eC0zLjEwLmdp
dDthPWNvbW1pdDtoPTQ5ODM0ZWVmOWQ1MWE2ZWZmOTUwZTBmNTJkZGM1MzQzZDk2MDY1MmUKPiAK
PiBUaGF0IHZlcnNpb24gb2YgdGhlIGRyaXZlciBpcyBrbm93biB0byBiZSBidWdneS9pbmNvcnJl
Y3QuIEkgZG9uJ3QgdGhpbmsKPiB3ZSB3YW50IHRvIGRvIHRoYXQuIFdlIHdhbnQgdG8gc2V0IHRo
ZSBwb2xhcml0eSBiYXNlZCB1cG9uIHRoZSBmb3JtYXQKPiBwYXNzZWQgYW5kIG5vdCB0aGUgbW9k
ZSAuLi4KPiAKPiBodHRwczovL252LXRlZ3JhLm52aWRpYS5jb20vZ2l0d2ViLz9wPWxpbnV4LW52
aWRpYS5naXQ7YT1ibG9iO2Y9c291bmQvc29jL3RlZ3JhLWFsdC90ZWdyYTIxMF9pMnNfYWx0LmM7
aD0yNGNmM2I1NTMyNmY2ODdhZGVkMjJiOTExODJkZjQxYzVhZTE4OGFjO2hiPTcwM2FhOTQ4ZDJj
OTJiODdmZDg0ZjM2N2Y0M2EwNzc3OGVkMDk4YjUjbDMzMwoKT2ssIHRoYW5rcy4KClBTIHRoZSBz
ZWN1cml0eSBjZXJ0aWZpY2F0ZSBvbiB0aGF0IHNpdGUgaXMgc3RpbGwgaW52YWxpZCA6LwoKCi0t
IApCZW4gRG9va3MJCQkJaHR0cDovL3d3dy5jb2RldGhpbmsuY28udWsvClNlbmlvciBFbmdpbmVl
cgkJCQlDb2RldGhpbmsgLSBQcm92aWRpbmcgR2VuaXVzCgpodHRwczovL3d3dy5jb2RldGhpbmsu
Y28udWsvcHJpdmFjeS5odG1sCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCkFsc2EtZGV2ZWwgbWFpbGluZyBsaXN0CkFsc2EtZGV2ZWxAYWxzYS1wcm9qZWN0
Lm9yZwpodHRwczovL21haWxtYW4uYWxzYS1wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Fs
c2EtZGV2ZWwK
